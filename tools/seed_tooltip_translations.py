#!/usr/bin/env python3
"""

Disclaimer: Created by claude.ai Opus 4.8

seed_tooltip_translations.py
============================

Purpose
-------
Pre-fill the "technical information" blocks at the top of every module page of
the darktable manual (dtdocs) in Weblate, by reusing the tooltip translations
that already exist in the darktable *program* PO files (darktable/po/*.po).

Usage
-----
Minimal invocation (processes every language found in the darktable po/ dir):

    python3 seed_tooltip_translations.py \
        --pot        ~/dtdocs/po/content.pot \
        --dt-po-dir  ~/darktable/po \
        --out        ./out

Optional, better invocation (recommended from the 2nd run on):

    python3 seed_tooltip_translations.py \
        --pot            ~/dtdocs/po/content.pot \
        --dt-po-dir      ~/darktable/po \
        --dtdocs-po-dir  ~/dtdocs-weblate/po \
        --labels-file    ./labels.txt \
        --out            ./out

  * --dtdocs-po-dir points at the *current* manual POs as Weblate holds them
    (they are not in the main repo -- export/clone them from Weblate once). Two
    effects: the script learns your label translations from already-translated
    entries (instead of using darktable's defaults), and it skips strings that
    are already translated in the manual.
  * --labels-file overrides individual labels, one per line, e.g.  "de purpose=Zweck".

Timing note: run against a *freshly regenerated* content.pot. The seed msgid is
copied verbatim from content.pot, so if content.pot is stale (e.g. a source-side
punctuation fix has not landed yet) the msgids will not match Weblate's source.

Where the strings come from
---------------------------
Every module page starts with a Markdown definition list, e.g. exposure.md:

    description
    : redo the exposure of the shot ... increasing ISO setting.
    purpose
    : corrective and creative.
    input
    : linear, RGB, scene-referred.
    processing
    : linear, RGB.
    output
    : linear, RGB, scene-referred        <- bug: missing period (fixed upstream)

po4a turns each term/definition pair into ONE msgid of the form:

    "<label>\n: <value>[.]\n"

  * <label>  is the definition-list term (description/purpose/input/processing/
             output). It is VISIBLE in the manual, so it must be translated too.
  * <value>  is the text taken verbatim from the dt_iop_set_description() tooltip
             in the darktable source.

The key point: these values already exist as standalone msgids in
dtdocs/po/content.pot, AND they are already translated (as tooltip msgids) in
darktable/po/*.po. So we only need to link the two sides via the English text --
the .c files are not needed for this.

What the script produces per target language
--------------------------------------------
  <out>/seed-po/<lang>.po   Bilingual gettext file. msgid == exact dtdocs source
                            string, msgstr == fully composed translation. Either
                            upload it directly into the matching language of the
                            manual, or add it as a Weblate COMPONENT and run
                            "Automatic translation" (source = this component).
  <out>/tmx/<lang>.tmx      The same pairs as TMX -> alternatively import into the
                            Weblate Translation Memory and run "Automatic
                            translation" with source = "Translation memory".
  <out>/report.csv          Match rate per language + every skipped source string.

The script does NOT write to the real manual POs -- Weblate stays the owner.
Weblate matches on the exact source string during automatic translation / upload,
which is why the msgid is taken unchanged from content.pot.
"""
import argparse
import csv
import os
import re
import sys
from collections import defaultdict, Counter

try:
    import polib
except ImportError:
    sys.exit("polib is required:  pip install polib")


# The five visible definition-list terms that make up a technical-info block.
# We only touch msgids whose first line is one of these.
LABELS = ("description", "purpose", "input", "processing", "output")

# Maps a dtdocs label -> the msgid under which darktable holds THIS label's
# translation. Four labels are spelled identically in the program; "processing"
# has no tooltip label in darktable, there it is called "process" (imageop.c).
# All five are translated in the program, e.g. de: Beschreibung / Kategorie /
# Input / Bearbeitung / Output. "Kategorie" for purpose is deliberately
# darktable's UI term (consistency with the program) -- overridable via
# --labels-file or --dtdocs-po-dir.
LABEL_DT_MSGID = {
    "description": "description",
    "purpose":     "purpose",
    "input":       "input",
    "processing":  "process",
    "output":      "output",
}


# --------------------------------------------------------------------------- #
# Normalisation
# --------------------------------------------------------------------------- #
def norm(s: str) -> str:
    """Match key for lookups.

    The dtdocs value and the darktable msgid describe the same text but are not
    byte-identical: dtdocs collapses the description's \\n into a space and
    (usually) appends a period; darktable keeps the \\n and has no period. So we
    unify both sides:
      * every run of whitespace (including \\n) -> a single space
      * ignore exactly one trailing period
    Case is preserved (the strings are spelled identically anyway, and lower-
    casing would risk false matches).
    """
    s = re.sub(r"\s+", " ", s.strip())
    return s[:-1] if s.endswith(".") else s


def collapse(s: str) -> str:
    """Whitespace to a single space -- used when composing the translation, so a
    (possibly multi-line) darktable translation becomes single-line."""
    return re.sub(r"\s+", " ", s.strip())


# --------------------------------------------------------------------------- #
# Detect / split a technical-info msgid
# --------------------------------------------------------------------------- #
def parse_ti(msgid: str):
    """Return (label, value_raw) for a technical-info msgid, else None.

    The msgid structure is always  "<label>\n: <value>...".  We split on the
    FIRST newline:
        head = label,  rest = ": <value>...\n"
    'value_raw' deliberately keeps its trailing '\n' (or whitespace) so that
    compose() can reproduce the source string's layout exactly.
    """
    head, _sep, rest = msgid.partition("\n")
    if head not in LABELS or not rest.startswith(": "):
        return None
    return head, rest[2:]          # strip ": ", keep the trailing \n


# --------------------------------------------------------------------------- #
# darktable program PO -> lookup index
# --------------------------------------------------------------------------- #
def load_program_index(po):
    """normalised-msgid -> msgstr for usable entries.

    Empty, fuzzy and obsolete entries are skipped (we don't want to roll those
    out as translations). Also returns 'conflicts' = the set of keys under which
    darktable holds DIFFERENT translations (e.g. because two gettext entries share
    the same text but have different msgctxt). For those we keep the first value
    seen and remember the ambiguity for reporting.
    """
    idx = {}
    conflicts = set()
    for e in po:
        if not e.msgstr.strip() or "fuzzy" in e.flags or e.obsolete:
            continue
        k = norm(e.msgid)
        if k in idx:
            if idx[k] != e.msgstr:
                conflicts.add(k)   # same source, different translation -> note it
            continue               # keep the first hit
        idx[k] = e.msgstr
    return idx, conflicts


# --------------------------------------------------------------------------- #
# Determine label translations (two sources, clear priority)
# --------------------------------------------------------------------------- #
def labels_from_program(idx):
    """Label translations from the darktable index (fallback source)."""
    out = {}
    for lab, dtid in LABEL_DT_MSGID.items():
        v = idx.get(norm(dtid))
        if v:
            out[lab] = collapse(v)
    return out


def labels_from_dtdocs(dtdocs_po):
    """Learn label translations from already-translated TI entries in the manual
    (preferred source, keeps existing terminology consistent).

    For each label we collect the first line of every already-translated msgstr
    and pick the most frequent variant by majority vote.
    """
    votes = defaultdict(Counter)
    for e in dtdocs_po:
        if not e.msgstr.strip():
            continue
        p = parse_ti(e.msgid)
        if not p:
            continue
        label = p[0]
        translated_label = e.msgstr.split("\n", 1)[0].strip()
        if translated_label:
            votes[label][translated_label] += 1
    return {label: c.most_common(1)[0][0] for label, c in votes.items()}


# --------------------------------------------------------------------------- #
# Compose the msgstr
# --------------------------------------------------------------------------- #
def compose(value_raw: str, label_tr: str, value_tr: str) -> str:
    """Build the final msgstr: "<label_tr>\n: <value_tr>.<trailing_ws>".

    * value_tr is made single-line (collapse) -- the description is two lines in
      the darktable msgid but one line in the manual.
    * A trailing period is ALWAYS added. By convention every technical-info value
      ends with '.'; the period missing from some source lines (output) is an
      upstream bug. So we normalise unconditionally and do NOT mirror the (partly
      faulty) source punctuation.
    * trailing_ws (usually the '\n' at the end of the source line) is taken over
      1:1 so the msgstr has the same layout as the msgid.
    """
    trailing_ws = value_raw[len(value_raw.rstrip()):]   # usually "\n"
    v = collapse(value_tr)
    if not v.endswith("."):
        v += "."
    return f"{label_tr}\n: {v}{trailing_ws}"


# --------------------------------------------------------------------------- #
# TMX output
# --------------------------------------------------------------------------- #
def write_tmx(path: str, lang: str, seed) -> None:
    """Write the (en -> lang) pairs as TMX 1.4. One <tu> per seed entry, the whole
    block as a single segment (segtype=paragraph), matching the msgid-based
    matching in Weblate."""
    from xml.sax.saxutils import escape
    xml_lang = lang.replace("_", "-")                    # TMX wants BCP-47 (pt-BR)
    tus = []
    for e in seed:
        tus.append(
            "  <tu>\n"
            f'   <tuv xml:lang="en"><seg>{escape(e.msgid)}</seg></tuv>\n'
            f'   <tuv xml:lang="{escape(xml_lang)}"><seg>{escape(e.msgstr)}</seg></tuv>\n'
            "  </tu>")
    with open(path, "w", encoding="utf-8") as f:
        f.write('<?xml version="1.0" encoding="UTF-8"?>\n'
                '<tmx version="1.4">\n'
                ' <header srclang="en" datatype="plaintext" segtype="paragraph" '
                'adminlang="en" o-tmf="dtdocs" creationtool="seed_tooltip_translations"/>\n'
                ' <body>\n' + "\n".join(tus) + '\n </body>\n</tmx>\n')


# --------------------------------------------------------------------------- #
# Main flow
# --------------------------------------------------------------------------- #
def main():
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--pot", required=True,
                    help="dtdocs po/content.pot (provides the source strings)")
    ap.add_argument("--dt-po-dir", required=True,
                    help="directory of darktable program POs (de.po, fr.po, ...)")
    ap.add_argument("--dtdocs-po-dir", default=None,
                    help="optional: directory of the current dtdocs POs (exported "
                         "from Weblate). Used to learn label translations and to "
                         "skip strings already translated in the manual.")
    ap.add_argument("--out", default="out")
    ap.add_argument("--labels-file", default=None,
                    help="optional: lines 'lang label=translation', e.g.  de purpose=Zweck")
    args = ap.parse_args()

    # 1) Source strings: pull all technical-info msgids out of content.pot.
    #    We keep (msgid, (label, value_raw)) -- the msgid is later used UNCHANGED
    #    as the seed msgid (required for exact matching in Weblate).
    pot = polib.pofile(args.pot)
    ti_entries = [(e.msgid, parse_ti(e.msgid)) for e in pot]
    ti_entries = [(mid, p) for mid, p in ti_entries if p]
    print(f"technical-info source strings: {len(ti_entries)}")

    # 2) Read optional manual label overrides: "lang label=value".
    overrides = defaultdict(dict)
    if args.labels_file:
        with open(args.labels_file, encoding="utf-8") as fh:
            for line in fh:
                line = line.strip()
                if not line or line.startswith("#"):
                    continue
                lang, kv = line.split(None, 1)      # first whitespace splits off lang
                key, val = kv.split("=", 1)          # first '=' splits label/value
                overrides[lang][key.strip()] = val.strip()

    os.makedirs(os.path.join(args.out, "seed-po"), exist_ok=True)
    os.makedirs(os.path.join(args.out, "tmx"), exist_ok=True)
    summary_rows, detail_rows = [], []

    # 3) Build one seed per darktable language file.
    for fn in sorted(os.listdir(args.dt_po_dir)):
        if not fn.endswith(".po"):
            continue
        lang = fn[:-3]                               # "de.po" -> "de"
        prog = polib.pofile(os.path.join(args.dt_po_dir, fn))
        idx, conflicts = load_program_index(prog)

        # 3a) Load the matching dtdocs PO (if any) ONCE and use it for both:
        #     learning labels and building the skip list.
        dtdocs_po = None
        if args.dtdocs_po_dir:
            dd = os.path.join(args.dtdocs_po_dir, fn)
            if os.path.exists(dd):
                dtdocs_po = polib.pofile(dd)

        # 3b) Determine label translations with a clear priority:
        #     darktable program  <  existing dtdocs translation  <  --labels-file
        label_tr = labels_from_program(idx)
        if dtdocs_po is not None:
            label_tr.update(labels_from_dtdocs(dtdocs_po))
        label_tr.update(overrides.get(lang, {}))

        # 3c) Skip TI msgids that are already translated in the manual.
        already = ({e.msgid for e in dtdocs_po if e.msgstr.strip()}
                   if dtdocs_po is not None else set())

        seed = polib.POFile()
        seed.metadata = {
            "Project-Id-Version": "dtdocs-tooltip-seed",
            "MIME-Version": "1.0",
            "Content-Type": "text/plain; charset=UTF-8",
            "Content-Transfer-Encoding": "8bit",
            "Language": lang,
        }

        matched = skipped_val = skipped_lbl = skipped_done = ambiguous = 0
        for msgid, (label, value_raw) in ti_entries:
            # already translated?
            if msgid in already:
                skipped_done += 1
                continue
            # value found in the darktable program? (normalised matching)
            val = idx.get(norm(value_raw))
            if not val:
                # no hit -> these are usually 'null' placeholders or description
                # blocks that aren't tooltips at all. Deliberately do NOT guess;
                # skip and log.
                skipped_val += 1
                detail_rows.append([lang, "no-value", label, collapse(value_raw)[:80]])
                continue
            # label translation available? (practically always for the 5 labels)
            if label not in label_tr:
                skipped_lbl += 1
                detail_rows.append([lang, "no-label", label, ""])
                continue

            # Seed entry: msgid unchanged (exact matching!), msgstr composed.
            # No fuzzy flag on ambiguity: a fuzzy entry might be ignored by
            # Weblate's automatic translation when used as a source. We roll out
            # the (first) hit normally and only flag it in the report; a final
            # review happens anyway, since the import into the manual is done as
            # needing-edit / suggestions (or gated by the project review workflow).
            seed.append(polib.POEntry(msgid=msgid,
                                      msgstr=compose(value_raw, label_tr[label], val)))
            matched += 1
            if norm(value_raw) in conflicts:
                ambiguous += 1
                detail_rows.append([lang, "ambiguous-value", label, collapse(value_raw)[:80]])

        # 3d) Don't even write languages with zero matches.
        if matched == 0:
            print(f"[{lang}] no matches -- skipped")
            continue

        seed.save(os.path.join(args.out, "seed-po", f"{lang}.po"))
        write_tmx(os.path.join(args.out, "tmx", f"{lang}.tmx"), lang, seed)
        print(f"[{lang}] {matched} taken "
              f"(skipped: value {skipped_val}, label {skipped_lbl}, "
              f"already {skipped_done}; ambiguous {ambiguous})  labels={label_tr}")
        summary_rows.append([lang, "SUMMARY", f"matched={matched}",
                             f"no_value={skipped_val} no_label={skipped_lbl} "
                             f"already={skipped_done} ambiguous={ambiguous}"])

    # 4) Report: summaries first, then details.
    with open(os.path.join(args.out, "report.csv"), "w", newline="", encoding="utf-8") as f:
        csv.writer(f).writerows([["lang", "kind", "a", "b"], *summary_rows, *detail_rows])
    print(f"\nWrote: {args.out}/seed-po/*.po , {args.out}/tmx/*.tmx , {args.out}/report.csv")


if __name__ == "__main__":
    main()

---
title: groups & operators
id: groups-and-operators
weight: 20
include_toc: true
aliases:
- drawn-and-parametric
---

A mask is a tree of groups. Each group combines its members -- elements and other groups -- with a single operator. This page explains the operators, and how to arrange groups to get the mask you want.

# the one rule

A group is a stack of members whose interaction is governed by the group's operator. A group starts from its _bottom_ member and applies its operator to each member above it in turn, in the same way as modules are applied in the pixelpipe. A member can be an element or another group: once a group has been computed, its result is used by the group above as if it were a single element, in the same way as brackets work in arithmetic.

The [cheat sheet](#cheat-sheet) at the end of this page summarizes the operators.

Everything else is a matter of choosing the operator of each group and putting the members in the right order.

# operators

The following images show what a group with two circles produces. The blue outline is the bottom member, the pink outline is the member above it, and the resulting mask is shown in yellow.

![maximum (union)](./groups-and-operators/op-maximum.png#w25#inline) ![minimum (intersection)](./groups-and-operators/op-minimum.png#w25#inline) ![difference](./groups-and-operators/op-difference.png#w25#inline) ![exclusion](./groups-and-operators/op-exclusion.png#w25#inline)

_From left to right: maximum (union), minimum (intersection), difference, exclusion._

maximum (union)
: Everything that any member covers. Where members overlap, the stronger one wins. The order of the members does not matter.

minimum (intersection)
: Only the area that every member covers. Where members overlap, the weaker one wins. The order of the members does not matter.

difference
: The bottom member, minus every member above it. Use it to cut something out of a selection. **The order matters**: see [order matters in a difference](#order-matters-in-a-difference).

exclusion
: The areas covered by an odd number of members. With two members, this is "either, but not both": where the two overlap they cancel out. A third member brings the area where all three overlap back.

## soft edges: union and intersection variants

Masks are not just "in" or "out": feathered edges, parametric transitions and reduced opacities make them partial. Unions and intersections therefore come in several variants, which behave the same on fully opaque areas and differ only in how partial areas combine.

![maximum (union)](./groups-and-operators/soft-maximum.png#w33#inline) ![screen (smooth union)](./groups-and-operators/soft-screen.png#w33#inline) ![sum (additive union)](./groups-and-operators/soft-sum.png#w33#inline)

_From left to right: maximum (union), screen (smooth union), sum (additive union), with feathered circles._

![minimum (intersection)](./groups-and-operators/soft-minimum.png#w33#inline) ![product (smooth intersection)](./groups-and-operators/soft-product.png#w33#inline)

_From left to right: minimum (intersection), product (smooth intersection), with feathered circles._

screen (smooth union)
: Like _maximum (union)_, but overlapping feathered edges merge smoothly, without a visible seam. Mathematically: a + b - a×b.

sum (additive union)
: Like _maximum (union)_, but opacities add up where members overlap, up to 100%. Two members at 50% opacity give full opacity where they overlap. This is useful for building up an effect with several low-opacity brush strokes (e.g. for dodging and burning).

product (smooth intersection)
: Like _minimum (intersection)_, but feathered edges fade together smoothly: the mask is strong only where every member is strong. Mathematically: a×b. This is how parametric channels have always been combined in darktable.

When in doubt, use _maximum (union)_ to add and _minimum (intersection)_ to restrict.

## order matters in a difference

A _difference_ keeps the bottom member and cuts away everything above it. Swap the members and you cut the other way:

![difference](./groups-and-operators/order-difference.png#w33#inline) ![difference, members swapped](./groups-and-operators/order-difference-swapped.png#w33#inline)

So, to subtract _A_ from _B_, make a _difference_ group with _B_ at the bottom and _A_ above it. Read it upwards, as a sentence: "_B_, minus _A_". If the result is the opposite of what you wanted, drag the members to swap them.

# reading a mask

Read each group as:

> the **[operator]** of _[bottom member]_, ..., _[top member]_

or, for a _difference_:

> _[bottom member]_ minus _[every member above it]_

Read the whole mask from the outside in (start from the whole mask, then read each group it holds) and, within each group, from the bottom up.

# an example

Suppose you want to darken the sky of this photo with the [_exposure_](../../../module-reference/processing-modules/exposure.md) module, but a tree sticks up into the sky, and the tree should keep its exposure.

![the photo](./groups-and-operators/sky-tree.png#w50)

You want to mask the _sky_, and then remove the _tree_ from it. Assume that you already have one element (or group) that covers the sky and one that covers the tree -- these could be drawn shapes, parametric elements, raster masks or AI objects; it does not matter. If you put both into the whole mask, with its default _union_ operator, you get:

```
whole mask: maximum (union)
├ tree
└ sky
```

This reads "the union of _sky_ and _tree_", which includes the tree instead of excluding it:

![sky and tree](./groups-and-operators/sky-tree-union.png#w50)

What you want is to subtract the _tree_ from the _sky_, so change the operator of the whole mask to _difference_:

```
whole mask: difference
├ tree
└ sky
```

This reads "_sky_ minus _tree_", which is exactly what you wanted:

![sky minus tree](./groups-and-operators/sky-tree-difference.png#w50)

If you swap the two members, you get "_tree_ minus _sky_" -- just the bit of trunk below the horizon:

![tree minus sky](./groups-and-operators/sky-tree-swapped.png#w50)

## adding the lake

Now suppose that the photo also has a lake, which should be darkened too:

![the photo with a lake](./groups-and-operators/lake-sky-tree.png#w50)

Adding the _lake_ to the whole mask does not work:

```
whole mask: difference
├ tree
├ lake
└ sky
```

A _difference_ removes everything above its bottom member, so this reads "_sky_ minus _lake_ and _tree_" -- the lake is subtracted rather than added:

![sky minus lake and tree](./groups-and-operators/lake-sky-tree-difference.png#w50)

What you want is to subtract the _tree_ from the union of the _sky_ and the _lake_. The union has to be computed first, so it needs a group of its own:

```
whole mask: difference
├ tree
└ to dim: maximum (union)
  ├ lake
  └ sky
```

This reads "what you want _to dim_, minus the _tree_", where what you want _to dim_ is "the union of _sky_ and _lake_":

![the correct mask](./groups-and-operators/lake-sky-tree-correct.png#w50)

There is often more than one way to build the same mask. Here, the tree does not overlap the lake, so you could also subtract the tree from the sky first, and then add the lake:

```
whole mask: maximum (union)
├ lake
└ sky without tree: difference
  ├ tree
  └ sky
```

![the same mask, built the other way](./groups-and-operators/lake-sky-tree-alternative.png#w50)

Pick whichever matches how you think about the photo -- but note that the two layouts only give the same result because the tree and the lake do not overlap. If a branch hung over the water, only the first layout would keep it out of the mask.

![the example in the mask panel](./groups-and-operators/sky-lake-tree-panel.png#w50)

This is the same mask in the [mask panel](./mask-panel.md#mask-layout), with real elements: the sky is a parametric element (a range of hues), the tree an AI object and the lake a path. The sky is selected, which is why its row is framed.

## building it in the panel

Work from the outside in, starting from a sentence that describes what you want:

1. Find the last step. In "_sky_ and _lake_, but not _tree_", the last step is "but not": a cut. So the whole mask is a _difference_.
2. Find what is cut. In a _difference_, this is the bottom member: "_sky_ and _lake_". As this is more than one thing, it needs a group of its own -- a _maximum (union)_.
3. Find what cuts: everything above the bottom member. Here, the _tree_.
4. Repeat inside each new group, until every member is a single element.

Then, in the [mask panel](./mask-panel.md):

1. Click the operator of the whole mask and choose _difference_.
2. Click ![add group](./mask-panel/icon-add-group.png#icon) _add group_ and choose _maximum (union)_. Alt+click its name to rename it "to dim".
3. With "to dim" selected, draw the _sky_ and the _lake_: new elements go into the selected group.
4. Click the name of "to dim" again to select the whole mask, then draw the _tree_: new elements now go into the whole mask.
5. If a member ends up in the wrong place, drag it. "to dim" must be the bottom member of the whole mask.

## the power of composition

Once you have understood this, more complex masks require nothing new. Each element of the example could itself be made of several pieces. For example, the _tree_ could be the union of two parametric elements on the _hz_ channel (one selecting the green leaves, the other the brown trunk), minus a few brush strokes to clean up the selection. The _tree_ then becomes a _difference_ group, with the union of the parametric elements at the bottom (as that is what you subtract from) and the brush strokes above:

```
whole mask: difference
├ tree: difference
│ ├ clean up: maximum (union)
│ │ ├ brush stroke 2
│ │ └ brush stroke 1
│ └ leaves and trunk: maximum (union)
│   ├ hz "leaves"
│   └ hz "trunk"
└ to dim: maximum (union)
  ├ lake
  └ sky
```

The mask gets bigger, but the principle is always the same.

# inverting

invert an element
: The element selects what it used to leave out: "everything except this circle".

invert a group
: The group's result is inverted after its operator has combined the members.

These are not the same thing when a group has several members. In a _union_ group of two circles, inverting each circle selects everything except the area where the circles overlap, while inverting the group selects everything except both circles. Shift+click the invert button of a group to flip the inversion of each of its members instead of inverting the group itself.

# opacity

The opacity of a member scales it before it is combined with the others. In a _difference_ group, a member at 50% opacity only cuts halfway through. The opacity of a group scales its result, on top of its members' own opacities.

# restructuring

The restructure (![wand](./mask-panel/icon-wand.png#icon)) menu in the [selection caption](./mask-panel.md#selection-caption) changes the structure of the mask around the selected member:

wrap in group
: Put the selected member in a new group of the chosen operator, where it is, so that you can combine it with what you add to the new group later.

compose
: Use the selected member as a building block for a larger mask. It is placed at the bottom of a new group of the chosen operator, with an empty group above it to draw into. For example, to cut something out of a finished selection, _compose_ it with _difference_ and draw the area to remove in the empty group.

simplify
: Remove the groups inside the selected group that change nothing (for example, a group holding a single member). Groups that you have named are kept.

Operators that would change nothing are not offered. You can also select several members and use _group together..._ (see [multiple selection](./mask-panel.md#multiple-selection)).

# cheat sheet

| I want... | build |
|---|---|
| _A_ and _B_ together | _maximum (union)_, any order |
| only where _A_ and _B_ overlap | _minimum (intersection)_, any order |
| _B_ without _A_ | _difference_, with _B_ at the bottom and _A_ above |
| _A_ or _B_, but not where they overlap | _exclusion_ |
| everything except _A_ | _A_, inverted |
| _A_ and _B_, without _C_ | _difference_: a _union_ group of _A_ and _B_ at the bottom, _C_ above |
| soft brush strokes that merge without seams | _screen (smooth union)_ |
| brush strokes that build up the effect where they overlap | _sum (additive union)_ |
| a range of colors, only inside a drawn area | _product_ or _minimum_: the parametric elements and the drawn shapes in one group |

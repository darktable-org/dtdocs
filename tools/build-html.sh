#!/usr/bin/env bash

base_url="$1"

#go to project root
PROJECT_ROOT="$(cd `dirname $0`/..; pwd)"
cd "$PROJECT_ROOT"

OUTPUT=html
HUGO_DIR="$PROJECT_ROOT/public"
HUGO_CONFIG="$PROJECT_ROOT/config.yaml"

rm -r "$HUGO_DIR"
mkdir -p "$HUGO_DIR"

#get list of disabled languages
disabled_languages=$(cat "$PROJECT_ROOT/disable-languages")

if [ -z "$base_url" ]
then
   env HUGO_DISABLELANGUAGES="$disabled_languages " hugo --config "$HUGO_CONFIG" -d "$HUGO_DIR"
else
   env HUGO_DISABLELANGUAGES="$disabled_languages " hugo --config "$HUGO_CONFIG" -d "$HUGO_DIR" -b "$base_url"
fi

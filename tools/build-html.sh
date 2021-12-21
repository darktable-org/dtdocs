#!/usr/bin/env bash

#go to project root
PROJECT_ROOT="$(cd `dirname $0`/..; pwd)"
cd "$PROJECT_ROOT"

OUTPUT=html
HUGO_DIR="$PROJECT_ROOT/public"
HUGO_CONFIG="$PROJECT_ROOT/config.yaml"

rm -r "$HUGO_DIR"
mkdir -p "$HUGO_DIR"

hugo --config "$HUGO_CONFIG" -d "$HUGO_DIR"

#!/bin/bash

set -e

source_path=.build/release/$LIB_FILE_NAME$LIB_EXTENSION
out_path=.build/libGodotNodeTreeCore-$VERSION-$TARGET_PLATFORM$LIB_EXTENSION
cp $source_path $out_path
chmod +x $out_path
echo "out_path=$out_path" >> $GITHUB_OUTPUT

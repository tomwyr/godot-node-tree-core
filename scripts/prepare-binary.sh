#!/bin/bash

set -e

source_path=.build/release/${{ matrix.file_name }}${{ matrix.file_ext }}
out_path=.build/godotNodeTreeCore-${{ github.ref_name }}-${{ matrix.platform }}${{ matrix.file_ext }}
cp $source_path $out_path
chmod +x $out_path
echo "out_path=$out_path" >> $GITHUB_OUTPUT

#!/bin/bash
set -euo pipefail

ZIP_NAME=ghidra_10.0.1_PUBLIC_20210708.zip
ZIP_PATH=/var/tmp/$ZIP_NAME
ZIP_URL=https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.0.1_build/${ZIP_NAME}
ZIP_SHA256=9b68398fcc4c2254a3f8ff231c4e8b2ac75cc8105f819548c7eed3997f8c5a5d
INSTALL_DIR=/opt
UNPACKED_PATH=${INSTALL_DIR}/ghidra_10.0.1_PUBLIC

if [ -d $UNPACKED_PATH ]; then
    echo "already installed"
    exit 0
fi

echo "downloading Ghidra 10.0.1"
curl -x 127.0.0.1:8082 -sfL -o $ZIP_PATH $ZIP_URL

echo "verifying download integrity"
echo "$ZIP_SHA256  $ZIP_PATH" | sha256sum -c

echo "unpacking archive"
unzip $ZIP_PATH -d $INSTALL_DIR

echo "removing archive"
rm -f $ZIP_PATH

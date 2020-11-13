#!/usr/bin/env bash

REPO="jerson/rsa-mobile"
NAME="protobuf_librsa_bridge_dart"
OUTPUT_DIR="lib/model"

echo "Get latest release"
RELEASE_PAYLOAD=$(curl --silent "https://api.github.com/repos/$REPO/releases/latest")

get_version() {
  echo "$RELEASE_PAYLOAD" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
}

VERSION=$(get_version $REPO)

echo "Using: $VERSION"
echo "--------------------------------------------"

FILE_URL="https://github.com/${REPO}/releases/download/${VERSION}/${NAME}_${VERSION}.tar.gz"
echo "Downloading: $FILE_URL to $OUTPUT_DIR"

mkdir -p "$OUTPUT_DIR"
wget -c "$FILE_URL" -O - | tar --strip-components=1 -xz -C "$OUTPUT_DIR"


echo "All updated"


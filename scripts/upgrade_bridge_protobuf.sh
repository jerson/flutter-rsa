#!/usr/bin/env bash
#######################################################
# Usage:                                              #
# ./upgrade_bridge_protobuf.sh                        #
#                                                     #
# or custom version:                                  #
# VERSION=v0.1.1 ./upgrade_bridge_protobuf.sh         #
#######################################################

REPO="jerson/rsa-mobile"
NAME="protobuf_librsa_bridge_dart"
OUTPUT_DIR="lib/model"

#######################################################
# you shouldn't edit below this line                  #
#######################################################

echo "Get latest release"
RELEASE_PAYLOAD=$(curl --silent "https://api.github.com/repos/$REPO/releases/latest")

get_version() {
  echo "$RELEASE_PAYLOAD" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
}

LATEST_VERSION=$(get_version $REPO)
VERSION=${VERSION:-$LATEST_VERSION}

echo "Using: $VERSION"
echo "--------------------------------------------"

FILE_URL="https://github.com/${REPO}/releases/download/${VERSION}/${NAME}_${VERSION}.tar.gz"
echo "Downloading: $FILE_URL to $OUTPUT_DIR"

mkdir -p "$OUTPUT_DIR"
wget -c "$FILE_URL" -O - | tar --strip-components=1 -xz -C "$OUTPUT_DIR"


echo "All updated"


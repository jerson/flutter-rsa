#!/usr/bin/env bash
#######################################################
# Usage:                                              #
# ./upgrade_bridge_flatbuffers.sh                     #
#                                                     #
# or custom version:                                  #
# VERSION=v0.1.1 ./upgrade_bridge_flatbuffers.sh      #
#######################################################

REPO="jerson/rsa-mobile"
NAME="flatbuffers_librsa_bridge_dart"
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
TMP_DIR=$(dirname $(mktemp -u))

echo "Using: $VERSION"
echo "--------------------------------------------"

FILE_NAME="${NAME}_${VERSION}.tar.gz"
TMP_FILE="$TMP_DIR/$FILE_NAME" 
FILE_URL="https://github.com/${REPO}/releases/download/${VERSION}/${FILE_NAME}"

echo "Downloading: $FILE_URL to $TMP_FILE"
curl -L -o $TMP_FILE "$FILE_URL" 

echo "Extracting: $TMP_FILE to $OUTPUT_DIR"
mkdir -p $OUTPUT_DIR
tar -xz --strip-components=1 --directory=$OUTPUT_DIR --file=$TMP_FILE 

echo "All updated"

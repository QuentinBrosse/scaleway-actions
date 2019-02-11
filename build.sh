#!/bin/sh
set -e

export BUILD_PATH=$GITHUB_WORKSPACE/$GITHUB_SHA.build

echo GITHUB_SHA $GITHUB_SHA
echo GITHUB_WORKSPACE $GITHUB_WORKSPACE
echo BUILD_DIR $BUILD_DIR
echo BUILD_PATH $BUILD_PATH

echo "I am the build: $GITHUB_SHA" > $BUILD_PATH

cat $BUILD_PATH

ls -al
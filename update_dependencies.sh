#!/bin/bash
echo -ne "\033[0;32m"
echo 'Updating bazel dependencies. This will take about five minutes.'
echo -ne "\033[0m"
set -u -e -E -o pipefail

if [ "$(uname -s)" == "Linux" ]; then
  BAZEL_DEPS_URL=https://github.com/johnynek/bazel-deps/releases/download/v0.1-9/bazel-deps-linux
  BAZEL_DEPS_SHA256=034ce4d8674a200d73d97aa60774786a3771c0f3871197858bf55fd930677b15
elif [ "$(uname -s)" == "Darwin" ]; then
  BAZEL_DEPS_URL=https://github.com/johnynek/bazel-deps/releases/download/v0.1-9/bazel-deps-macos
  BAZEL_DEPS_SHA256=97e1b932cccc60e30475fc0ef56a538c6b8a732adbdf0eaec1988f0b4f1dc5dc
else
  echo "Your platform '$(uname -s)' is unsupported, sorry"
  exit 1
fi


# This is some bash snippet designed to find the location of the script.
# we operate under the presumption this script is checked into the repo being operated on
# so we goto the script location, then use git to find the repo root.
SCRIPT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_LOCATION

#REPO_ROOT=$BUILD_WORKSPACE_DIRECTORY
REPO_ROOT=$PWD

BAZEL_DEPS_DIR="$HOME/.bazel-deps-cache"
BAZEL_DEPS_PATH="${BAZEL_DEPS_DIR}/v0.1-9"

if [ ! -f ${BAZEL_DEPS_PATH} ]; then
  ( # Opens a subshell
    set -e
    echo "Fetching bazel deps."
    curl -L -o /tmp/bazel-deps-bin $BAZEL_DEPS_URL

    GENERATED_SHA_256=$(shasum -a 256 /tmp/bazel-deps-bin | awk '{print $1}')

    if [ "$GENERATED_SHA_256" != "$BAZEL_DEPS_SHA256" ]; then
      echo "Sha 256 does not match, expected: $BAZEL_DEPS_SHA256"
      echo "But found $GENERATED_SHA_256"
      echo "You may need to update the sha in this script, or the download was corrupted."
      exit 1
    fi

    chmod +x /tmp/bazel-deps-bin
    mkdir -p ${BAZEL_DEPS_DIR}
    mv /tmp/bazel-deps-bin ${BAZEL_DEPS_PATH}
  )
fi

cd $REPO_ROOT
set +e
$BAZEL_DEPS_PATH generate -r $REPO_ROOT -s third_party/workspace.bzl -d dependencies.yaml  --target-file third_party/target_file.bzl
RET_CODE=$?
set -e

if [ $RET_CODE == 0 ]; then
  echo "Success, going to format files"
else
  echo "Failure, checking out third_party/jvm"
  cd $REPO_ROOT
  git checkout third_party/jvm third_party/workspace.bzl
  exit $RET_CODE
fi

$BAZEL_DEPS_PATH format-deps -d $REPO_ROOT/dependencies.yaml -o

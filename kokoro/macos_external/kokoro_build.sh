#!/bin/bash

# Fail on any error.
set -e
# Display commands being run.
set -x

export LC_CTYPE=en_US.UTF-8
export TRAVIS_PULL_REQUEST=""

# Code under repo is checked out to ${KOKORO_ARTIFACTS_DIR}/github.
# The final directory name in this path is determined by the scm name specified
# in the job configuration.
cd ${KOKORO_ARTIFACTS_DIR}/github/firebase-ios-sdk
bundle install
gem install xcpretty
pushd Example
bundle exec pod install
popd
./test.sh
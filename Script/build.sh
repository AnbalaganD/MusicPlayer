#!/bin/bash

echo "$(pwd)"
echo "$CI_PROJECT_DIR"

xcodebuild -project MusicPlayer.xcodeproj -target MusicPlayer -configuration Release


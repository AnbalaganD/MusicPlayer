if [[ "$(uname -m)" == arm64 ]] && [ "$CONFIGURATION" == "Debug" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

if which swiftlint > /dev/null && [ "$CONFIGURATION" == "Debug" ]; then
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi

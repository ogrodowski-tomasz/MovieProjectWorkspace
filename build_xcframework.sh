#!/bin/bash
set -e

FRAMEWORK_NAME="MovieNetworkProvider"

BUILD_DIR="../build"
OUTPUT_DIR="../artifacts/xcframeworks"
OUTPUT_PATH="$OUTPUT_DIR/$FRAMEWORK_NAME.xcframework"

rm -rf "$BUILD_DIR"
rm -rf "$OUTPUT_PATH"
mkdir -p "$OUTPUT_DIR"

xcodebuild archive \
  -scheme "$FRAMEWORK_NAME" \
  -destination "generic/platform=iOS" \
  -archivePath "$BUILD_DIR/iOS" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
  -scheme "$FRAMEWORK_NAME" \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "$BUILD_DIR/iOS-Simulator" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
  -framework "$BUILD_DIR/iOS.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
  -framework "$BUILD_DIR/iOS-Simulator.xcarchive/Products/Library/Frameworks/$FRAMEWORK_NAME.framework" \
  -output "$OUTPUT_PATH"

echo "✅ XCFramework built at: $OUTPUT_PATH"

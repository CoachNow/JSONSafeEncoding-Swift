#!/bin/zsh

# check if `swift-create-xcframework` tool is installed.
# command will return non-zero if not.
if ! command -v swift-create-xcframework &> /dev/null
then
	echo "Swift's create-xcframework tool is required, but could not be found."
	echo "Install it via:"
    echo "    $ brew install mint"
    echo "    $ mint install unsignedapps/swift-create-xcframework"
    echo ""
	exit 1
fi

echo "Removing old files ..."

rm JSONSafeEncoding.zip
rm JSONSafeEncoding.sha256

echo "Building XCFrameworks ..."

swift create-xcframework --clean --platform ios --platform macos --platform maccatalyst --platform tvos --platform watchos --stack-evolution --zip

echo "Done."

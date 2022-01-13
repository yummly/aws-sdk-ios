#!/bin/sh

# Copy OCMock.xcframework to BUILT_PRODUCTS_DIR

XCF_NAME="OCMock.xcframework"
XCF_SOURCE="${SRCROOT}/AWSCoreTests/${XCF_NAME}"
XCF_DESTINATION="${BUILT_PRODUCTS_DIR}/${XCF_NAME}"

echo "warning: BUILT_PRODUCTS_DIR = ${BUILT_PRODUCTS_DIR}"
echo "warning: FRAMEWORK_SEARCH_PATHS = ${FRAMEWORK_SEARCH_PATHS}"

if [ ! -d "${XCF_SOURCE}" ]; then
    echo "error: OCMock not found: ${XCF_SOURCE}" && exit 1
fi

if [ -d "${XCF_DESTINATION}" ]; then
    rm -rf "${XCF_DESTINATION}"
fi

echo "Copying ${XCF_NAME}"

rsync --archive --copy-links --delete "${XCF_SOURCE}/" "${XCF_DESTINATION}/"

if [ ! -d "${XCF_DESTINATION}" ]; then
    echo "error: Filed to copy OCMock to ${BUILT_PRODUCTS_DIR}" && exit 1
fi

#!/bin/sh

set -e

ARGS=("$@")

mkdir -p "${BUILT_PRODUCTS_DIR}/DerivedSources/WebKit"
cd "${BUILT_PRODUCTS_DIR}/DerivedSources/WebKit"

export WebKit2="${SRCROOT}"
export WebCoreScripts="${WEBCORE_PRIVATE_HEADERS_DIR}"

if [ -z $1 ] || [ $1 != "sandbox-profiles-ios" ]; then
    /bin/ln -sfh "${JAVASCRIPTCORE_PRIVATE_HEADERS_DIR}" JavaScriptCorePrivateHeaders
    export JavaScriptCore_SCRIPTS_DIR="JavaScriptCorePrivateHeaders"
fi

if [ ! "$CC" ]; then
    export CC="`xcrun -find clang`"
fi

if [ ! -z "${WEBKITADDITIONS_HEADER_SEARCH_PATHS}" ]; then
    MAKEFILE_INCLUDE_FLAGS=$(echo "${WEBKITADDITIONS_HEADER_SEARCH_PATHS}" | perl -e 'print "-I" . join(" -I", split(" ", <>));')
fi

if [ "${ACTION}" = "analyze" -o "${ACTION}" = "build" -o "${ACTION}" = "install" -o "${ACTION}" = "installhdrs" -o "${ACTION}" = "installapi" ]; then
    make --no-builtin-rules ${MAKEFILE_INCLUDE_FLAGS} -f "${WebKit2}/DerivedSources.make" -j `/usr/sbin/sysctl -n hw.activecpu` SDKROOT=${SDKROOT} "${ARGS[@]}"
fi

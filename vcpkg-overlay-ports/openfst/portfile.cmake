vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kaito-tokyo/openfst-vosk
    REF f892b0d08d377e45d99c7a9a87681b544c46d0b0
    SHA512 b7607952552c1232a9917e4ad3f02aaeaea7f86bfb36652d67e12eea75315a515c1349251e7abe7fd4cc23b1ae4faa314095fb34b87737602102a3ef197d4c70
    HEAD_REF develop
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" BUILD_SHARED)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DBUILD_SHARED_LIBS=${BUILD_SHARED}
        -DHAVE_BIN=OFF
        -DHAVE_SCRIPT=OFF
        -DHAVE_COMPACT=OFF
        -DHAVE_COMPRESS=OFF
        -DHAVE_CONST=OFF
        -DHAVE_FAR=OFF
        -DHAVE_GRM=OFF
        -DHAVE_PDT=OFF
        -DHAVE_MPDT=OFF
        -DHAVE_LINEAR=OFF
        -DHAVE_LOOKAHEAD=OFF
        -DHAVE_NGRAM=OFF
        -DHAVE_PYTHON=OFF
        -DHAVE_SPECIAL=OFF
)

vcpkg_cmake_install()

file(MAKE_DIRECTORY
    ${CURRENT_PACKAGES_DIR}/share/unofficial-openfst
    ${CURRENT_PACKAGES_DIR}/debug/share/unofficial-openfst
)
file(COPY "${CURRENT_PORT_DIR}/unofficial-openfst-config.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/unofficial-openfst/")
vcpkg_cmake_config_fixup(PACKAGE_NAME unofficial-openfst)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/COPYING)

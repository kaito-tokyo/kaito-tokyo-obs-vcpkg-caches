vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kaito-tokyo/openfst-vosk
    REF c3ec8df648c3a71261f37db8c2e715e385cfbf70
    SHA512 0a0d4d80c23589191aa287e1438c5ffb5fe3c7c17953c0e4208efb5f0839df3792d2d9f1261a1b2e575b0a91e7ecdc81e9eef17b224621d9fa3a9152e46fc2ca
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

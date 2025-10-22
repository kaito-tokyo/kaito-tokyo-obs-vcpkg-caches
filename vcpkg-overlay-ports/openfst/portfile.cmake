vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kaito-tokyo/openfst-vosk
    REF 4094bbec34c0ebda51218f25f198adcc1040918f
    SHA512 78fa3ac081034db7dcf54ea767cd293f2b81679761592e72b7a993e38dd0d0cbb69857b000f9587dd4740554bdb00128992285588f8e4f7702fbb224af2caa0a
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

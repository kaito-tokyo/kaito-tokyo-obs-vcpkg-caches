vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kaito-tokyo/openfst-vosk
    REF 239566ff730eacc359c014aeff846bd05a2cdda0
    SHA512 3969421fb8f1fadcd2708fa86dfa997f9f7276aa9f967ab1d1103a190ffe60fe9b02dff5e256d9cd63d2545915f277ca1fd1e1c1da41cf30a42047a0d0fb7bba
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

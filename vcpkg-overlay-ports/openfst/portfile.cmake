vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kaito-tokyo/openfst-vosk
    REF 989f65eb695d2aa076008b5060e5d27c73f06dbe
    SHA512 3f84ceec236d56c91caa8faa710a5e945b5b0bfa5f7fe98cf160a5290962203dc03accdc3f458dfe3175f4a06c3445e05e9175065e5e48a1ff00d8edecfd92ea
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

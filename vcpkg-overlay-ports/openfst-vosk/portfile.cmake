vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kaito-tokyo/openfst-vosk
    REF develop
    SHA512 2498a59cabbc0350682c4de244d5aab06ec3ce0c267fbee0fa01b88b60f47ddf045a55daac76debd8bef53fcd5ad385be2648aca250c9b39d2fc7d9861d82273
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
        -DHAVE_FAR=ON
        -DHAVE_GRM=OFF
        -DHAVE_PDT=OFF
        -DHAVE_MPDT=OFF
        -DHAVE_LINEAR=OFF
        -DHAVE_LOOKAHEAD=ON
        -DHAVE_NGRAM=ON
        -DHAVE_PYTHON=OFF
        -DHAVE_SPECIAL=OFF
)

vcpkg_cmake_install()

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/COPYING)

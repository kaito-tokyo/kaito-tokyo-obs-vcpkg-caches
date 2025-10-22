vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kkm000/openfst
    REF 805841777a283c523ce17ad4efdb3ada776c4862
    SHA512 f3aa1a5fe16e241522c6a595442393e9086c1e5ff0cba6ecf6c3427d52bdb0261c839cb7ff8697653a70b6b6e97042dae7a26311ee86ed3b7400bd2d5ffbc138
    HEAD_REF winport
    PATCHES
        0000-disable-tests.patch
        0001-fix-bitable.patch
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

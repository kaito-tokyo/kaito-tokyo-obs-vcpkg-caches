vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kkm000/openfst
    REF 805841777a283c523ce17ad4efdb3ada776c4862
    SHA512 399162cbb9f37f4df7c4b0fb6d23e6a5e8737d8a1e92647eb6734c0ec11b7ae749a24a789ce43003a013c9d0a34addbbdb63da2f302a03d34cd3d8d5ab4540f3
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

vcpkg_cmake_config_fixup(PACKAGE_NAME openfst CONFIG_PATH lib/cmake/openfst)
vcpkg_fixup_pkgconfig(PACKAGE_NAME openfst)

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/COPYING)

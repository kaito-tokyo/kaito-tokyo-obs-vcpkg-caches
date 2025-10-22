vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kkm000/openfst
    REF win/1.7.2.1
    SHA512 884d98eca7721dbe297dd376fcbda507e3d242a819ed39f95eebfc3285cb97b10b3aa9969ddcf42af38396311fef9b65bc60ebe50222026e262d28e4ccedde39
    HEAD_REF master
    PATCHES
        0000-disable-tests.patch
        0001-fix-bitable.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DHAVE_BIN=ON
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

vcpkg_install_copyright(FILE_PATH ${SOURCE_PATH}/COPYING)

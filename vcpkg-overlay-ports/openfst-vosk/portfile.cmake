vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kaito-tokyo/openfst-vosk
    REF develop
    SHA512 be7b93eb5574ffc7c5e5e014d6531995c51bdab468467979a76e52bbcf2568618418f95372d0d4ba839ea20f20aca31e74338e81a7f4ac3f84637ddc29cf9c11
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

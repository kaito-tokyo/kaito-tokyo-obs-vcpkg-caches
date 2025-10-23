vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO alphacep/vosk-api
    REF v0.3.50
    SHA512 cc627fefd87336a7507444ffa201d1ef0b325fdc79659e6dc0f616671d82226977d567decda414b4a1b17986a9755e400c135d9637069dc96a067240a69484fa
    HEAD_REF master
    PATCHES
        0000-fix-libname.patch
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" BUILD_SHARED)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DBUILD_SHARED_LIBS=${BUILD_SHARED}
)

vcpkg_cmake_install()

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/COPYING)

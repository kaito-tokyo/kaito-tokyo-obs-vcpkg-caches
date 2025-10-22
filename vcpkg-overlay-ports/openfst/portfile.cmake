vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO kkm000/openfst
    REF win/1.7.2.1
    SHA512 0
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_PATH ${SOURCE_PATH}/COPYING)

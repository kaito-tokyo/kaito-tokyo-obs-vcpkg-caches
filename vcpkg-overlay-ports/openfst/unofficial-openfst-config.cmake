if(NOT TARGET unofficial::OpenFst::fst)
    add_library(unofficial::OpenFst::fst UNKNOWN IMPORTED)

    set_property(TARGET unofficial::OpenFst::fst APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
    set_property(TARGET unofficial::OpenFst::fst PROPERTY IMPORTED_LOCATION_RELEASE "${CMAKE_CURRENT_LIST_DIR}/../../lib/libfst.a")
    
    set_property(TARGET unofficial::OpenFst::fst APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
    set_property(TARGET unofficial::OpenFst::fst PROPERTY IMPORTED_LOCATION_DEBUG "${CMAKE_CURRENT_LIST_DIR}/../../debug/lib/libfst.a")

    set_property(TARGET unofficial::OpenFst::fst PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/../../include")
    set_property(TARGET unofficial::OpenFst::fst PROPERTY INTERFACE_COMPILE_FEATURES "cxx_std_11")
endif()

if(NOT TARGET unofficial::OpenFst::fstscript)
    add_library(unofficial::OpenFst::fstscript UNKNOWN IMPORTED)

    set_property(TARGET unofficial::OpenFst::fstscript APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
    set_property(TARGET unofficial::OpenFst::fstscript PROPERTY IMPORTED_LOCATION_RELEASE "${CMAKE_CURRENT_LIST_DIR}/../../lib/libfstscript.a")
    
    set_property(TARGET unofficial::OpenFst::fstscript APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
    set_property(TARGET unofficial::OpenFst::fstscript PROPERTY IMPORTED_LOCATION_DEBUG "${CMAKE_CURRENT_LIST_DIR}/../../debug/lib/libfstscript.a")

    set_property(TARGET unofficial::OpenFst::fstscript PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/../../include")
endif()

if(NOT TARGET unofficial::OpenFst::OpenFst)
    add_library(unofficial::OpenFst::OpenFst INTERFACE IMPORTED)
    
    set_property(TARGET unofficial::OpenFst::OpenFst PROPERTY INTERFACE_LINK_LIBRARIES "unofficial::OpenFst::fstscript")
endif()

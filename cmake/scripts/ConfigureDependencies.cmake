#environment variables for configure_boost have to be set
#BOOST_INCLUDEDIR
#BOOST_LIBRARYDIR
#BOOST_ROOT

macro(configure_boost)

message("configuring boost")

set (Boost_USE_STATIC_LIBS ON)
set (Boost_USE_MULTITHREADED ON)

set (BOOST_COMPONENTS system 
                      filesystem
                      program_options)

FIND_PACKAGE(Boost COMPONENTS ${BOOST_COMPONENTS} REQUIRED)

if(Boost_FOUND)
message("Using Boost_VERSION: ${Boost_VERSION}")
message("Using Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
message("Using Boost_LIBRARY_DIRS: ${Boost_LIBRARY_DIRS}")
else()
message("Boost library is not found")
endif()

endmacro(configure_boost)

macro(configure_zlib)

message("configuring zlib")

if (MSVC)
 set (CMAKE_EXE_LINKER_FLAGS "/SAFESEH:NO")
endif()

if (MSVC)
set(ZLIB_INCLUDE_DIR "$ENV{ZLIB_INCLUDE_DIR}")
set(ZLIB_LIBRARY "$ENV{ZLIB_LIBRARY}")
endif()

find_package(ZLIB REQUIRED)

if(ZLIB_FOUND)
message("Using ZLIB_VERSION_STRING: ${ZLIB_VERSION_STRING}")
message("Using ZLIB_INCLUDE_DIRS: ${ZLIB_INCLUDE_DIRS}")
message("Using ZLIB_LIBRARIES: ${ZLIB_LIBRARIES}")
else()
message("Zlib library is not found")
endif()

endmacro(configure_zlib)

macro(configure_libtomcrypt)

if (MSVC)
set(LIBTOMCRYPT_INCLUDE_DIR "$ENV{LIBTOMCRYPT_INCLUDE_DIR}")
set(LIBTOMCRYPT_LIBRARY "$ENV{LIBTOMCRYPT_LIBRARY}")
endif()

find_package(LIBTOMCRYPT REQUIRED)

if(LIBTOMCRYPT_FOUND)
message("Found libtomcrypt library")
message("Using LIBTOMCRYPT_INCLUDE_DIRS: ${LIBTOMCRYPT_INCLUDE_DIRS}")
message("Using LIBTOMCRYPT_LIBRARIES: ${LIBTOMCRYPT_LIBRARIES}")

add_definitions(-DLTC_NO_PROTOTYPES)
else()
message("libtomcrypt library is not found")
endif()

endmacro(configure_libtomcrypt)
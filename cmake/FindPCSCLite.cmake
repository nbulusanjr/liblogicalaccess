# - Find PCSC-Lite
# Find the native PCSC-Lite includes and library
#
#  PCSCLITE_INCLUDE_DIRS - where to find winscard.h, wintypes.h, etc.
#  PCSCLITE_LIBRARIES   - List of libraries when using PCSC-Lite.
#  PCSCLITE_FOUND       - True if PCSC-Lite found.


IF (PCSCLITE_INCLUDE_DIR AND PCSCLITE_LIBRARIES)
  # Already in cache, be silent
  SET(PCSCLITE_FIND_QUIETLY TRUE)
ENDIF (PCSCLITE_INCLUDE_DIR AND PCSCLITE_LIBRARIES)

IF (NOT WIN32)
  FIND_PACKAGE(PkgConfig)
  IF (PKG_CONFIG_FOUND)
    PKG_CHECK_MODULES(PC_PCSCLITE libpcsclite)
  ENDIF(PKG_CONFIG_FOUND)
ENDIF (NOT WIN32)

FIND_PATH(PCSCLITE_INCLUDE_DIR winscard.h
  HINTS
  ${PC_PCSCLITE_INCLUDEDIR}
  ${PC_PCSCLITE_INCLUDE_DIRS}
  ${PC_PCSCLITE_INCLUDE_DIRS}/PCSC
  )

set (PCSCLITE_INCLUDE_DIRS ${PCSCLITE_INCLUDE_DIR})
FIND_LIBRARY(PCSCLITE_LIBRARY NAMES pcsclite PCSC libwinscard
  HINTS
  ${PC_PCSCLITE_LIBDIR}
  ${PC_PCSCLITE_LIBRARY_DIRS}
  )

SET( PCSCLITE_LIBRARIES ${PCSCLITE_LIBRARY} )
# handle the QUIETLY and REQUIRED arguments and set PCSCLITE_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(PCSC-Lite DEFAULT_MSG PCSCLITE_LIBRARY PCSCLITE_INCLUDE_DIR)

MARK_AS_ADVANCED( PCSCLITE_LIBRARY PCSCLITE_INCLUDE_DIR )


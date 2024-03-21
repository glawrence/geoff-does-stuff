@ECHO OFF
REM ***********************************************************************
REM * There are times when you want to move a directory tree to another   *
REM * location, but then make sure everything still works, thinking the   *
REM * files are still in their original location. This is where Directory *
REM * Junctions come in. You can just delete the Directory Junction in    *
REM * Windows Explorer without deleting the files where the junctions     *
REM * points to.                                                          *
REM ***********************************************************************

REM Examples
REM ********
REM RELOCATE "C:\Users\username\AppData\Local\Mozilla" "D:\Users\username\AppData\Local\Mozilla"
REM RELOCATE "C:\Program Files\Mozilla Firefox" "D:\Program Files\Mozilla Firefox"


REM NOTE: the ~ in %~1 removes the quotes passed in

IF "%~1" == "" GOTO error
IF "%~2" == "" GOTO error
IF NOT "%~3" == "" GOTO error

SET FROM_DIR=%1
SET TO_DIR=%2

ECHO Moving %FROM_DIR%
ECHO     to %TO_DIR%
ECHO Then replacing with a Directory Junction
ECHO.
ECHO Are you sure this is correct? (Press Ctrl+C if not)
PAUSE

ROBOCOPY %FROM_DIR% %TO_DIR% /E /MOVE /ZB /COPYALL
MKLINK /J %FROM_DIR% %TO_DIR%

GOTO theend

:error
ECHO Moves files to new location and then creates a junction to the new location
ECHO.
ECHO RELOCATE from_dir to_dir
ECHO.
ECHO If FROM_DIR or TO_DIR contains space characters, then surround them with double quotes (")
ECHO.

:theend

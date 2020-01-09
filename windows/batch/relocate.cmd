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
REM SET FROM_DIR="C:\Users\username\AppData\Local\Mozilla"
REM SET TO_DIR="D:\Users\username\AppData\Local\Mozilla"

REM SET FROM_DIR="C:\Program Files\Mozilla Firefox"
REM SET TO_DIR="D:\Program Files\Mozilla Firefox"


SET FROM_DIR="C:\The Temp\Testing"
SET TO_DIR="D:\The Temp\Testing"

ECHO Moving %FROM_DIR%
ECHO     to %TO_DIR%
ECHO Then replacing with a Directory Junction
ECHO.
ECHO Are you sure this is correct? (Press Ctrl+C if not)
PAUSE

ROBOCOPY %FROM_DIR% %TO_DIR% /E /MOVE /ZB /COPYALL
MKLINK /J %FROM_DIR% %TO_DIR%

@ECHO off

GOTO PERMISSIONS_CHECK
:PERMISSIONS_CHECK
COLOR 1F
MODE CON COLS=62 LINES=20
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                Windows Integrity Verifier               ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Admin Check: Detecting permissions...

NET SESSION >NUL 2>&1
IF %ERRORLEVEL% == 0 (
ECHO Admin Check: Administrative permissions confirmed.
ECHO.
GOTO :INITIAL_SCAN

) ELSE (
ECHO Admin Check: Administrative permissions missing.
ECHO Admin Check: Please start script as admin.
GOTO :EXIT
)
PAUSE >NUL

:INITIAL_SCAN
COLOR 1F
MODE CON COLS=62 LINES=20
ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                Windows Integrity Verifier               ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
GOTO INITIAL_SCAN_CHECK

:INITIAL_SCAN_CHECK
COLOR 1F
MODE CON COLS=62 LINES=20
ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                Windows Integrity Verifier               ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
SET /P QUERY=Would you like to run the initial scan? "Y" or "N":
IF /I "%QUERY%" EQU "Y" goto :INITIAL_SCAN
IF /I "%QUERY%" EQU "N" goto :EXIT

:INITIAL_SCAN
COLOR 1F
MODE CON COLS=62 LINES=20
ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                Windows Integrity Verifier               ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
sfc /scannow
GOTO :WINDOWS_IMAGE_REPAIR_CHECK

:WINDOWS_IMAGE_REPAIR_CHECK
SET /P QUERY=Was an error found? "Y" or "N": 
IF /I "%QUERY%" EQU "Y" goto :WINDOWS_IMAGE_REPAIR
IF /I "%QUERY%" EQU "N" goto :EXIT
goto :WINDOWS_IMAGE_REPAIR_CHECK

:WINDOWS_IMAGE_REPAIR
COLOR 1F
MODE CON COLS=62 LINES=20
ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                Windows Integrity Verifier               ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
DISM /Online /Cleanup-Image /RestoreHealth
ECHO It is higly recommended to restart your system and run the initial scan again to ensure all repairs are complete.
SET /P QUERY=Would you like to restart? "Y" or "N": 
IF /I "%QUERY%" EQU "Y" goto :RESTART_SYSTEM
IF /I "%QUERY%" EQU "N" goto :EXIT
goto :WINDOWS_IMAGE_REPAIR_CHECK
CLS
GOTO :EXIT

:RESTART_SYSTEM
COLOR 1F
MODE CON COLS=62 LINES=20
ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                Windows Integrity Verifier               ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Restarting the system ...
SHUTDOWN /R /T 00
EXIT

:EXIT
COLOR 1F
MODE CON COLS=62 LINES=20
ECHO.
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                Windows Integrity Verifier               ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO All checks and/or repairs have completed. You may now close this window.
ECHO This window will automatically close in 5 seconds.
TIMEOUT /T 5 >NUL
EXIT

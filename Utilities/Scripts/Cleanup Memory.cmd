@ECHO OFF

CLS
MODE CON COLS=85 LINES=25
COLOR 9F
TITLE RAMMap Memory Cleanup
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                           RAMMap Memory Cleanup Script                          ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO This script will help you free up memory by clearing the Working Sets, Standby 
ECHO List, and Modified Page List.
ECHO.
ECHO Please ensure that RAMMap is installed and accessible in your system PATH.
ECHO.
ECHO RAMMap can be downloaded as part of the Sysinternals Suite from the Microsoft Store
ECHO or from the official website.
ECHO.
ECHO For more information on RAMMap, visit:
ECHO - https://docs.microsoft.com/en-us/sysinternals/downloads/rammap
ECHO.
ECHO Press any key to continue...
PAUSE >NUL
GOTO MAIN_MENU

:MAIN_MENU
CLS
MODE CON COLS=85 LINES=30
COLOR 9F
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                           RAMMap Memory Cleanup Script                         ::
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Select an option:
ECHO 1. Download and install Sysinternals Suite
ECHO 2. Proceed to Memory Cleanup Menu
ECHO 3. Exit
ECHO.
SET /P MAIN_CHOICE=Enter your choice (1-3):

IF "%MAIN_CHOICE%"=="1" (
    ECHO Checking for WinGet...
    WHERE winget >NUL 2>&1
    IF ERRORLEVEL 1 (
        CLS
        MODE CON COLS=85 LINES=15
        COLOR 4F
        ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        ECHO ::                           RAMMap Memory Cleanup Script                         ::
        ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        ECHO.
        ECHO WinGet is not installed on this system. Please install WinGet to proceed with 
        ECHO automatic installation of Sysinternals Suite.
        ECHO.
        ECHO For more information on WinGet, visit:
        ECHO - https://docs.microsoft.com/en-us/windows/package-manager/winget/
        ECHO.
        ECHO Press any key to return to the menu...
        PAUSE >NUL
        GOTO MAIN_MENU
    ) ELSE (
        CLS
        MODE CON COLS=85 LINES=20
        COLOR 9F
        ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        ECHO ::                           RAMMap Memory Cleanup Script                         ::
        ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
        ECHO.
        ECHO Downloading and installing Sysinternals Suite via WinGet... 
        ECHO Please wait. This may take a few moments.
        winget install Microsoft.Sysinternals.Suite >NUL
        IF ERRORLEVEL 1 (
            CLS
            MODE CON COLS=85 LINES=15
            COLOR 4F
            ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            ECHO ::                           RAMMap Memory Cleanup Script                         ::
            ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            ECHO.
            ECHO An error occurred while installing Sysinternals Suite via Microsoft Store. Please 
            ECHO install it manually from the official website.
            ECHO.
            ECHO - https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite
            ECHO.
            ECHO A guide on how to add a program to your system PATH can be found here:
            ECHO - https://docs.microsoft.com/en-us/windows/win32/shell/user-environment-variables
            ECHO.
            ECHO Press any key to return to the menu...
            PAUSE >NUL
            GOTO MAIN_MENU
        ) ELSE (
            CLS
            MODE CON COLS=85 LINES=10
            COLOR 2F
            ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            ECHO ::                           RAMMap Memory Cleanup Script                         ::
            ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            ECHO.
            ECHO Sysinternals Suite installed successfully via WinGet.
            ECHO RAMMap is now accessible in your system PATH.
            ECHO.
            ECHO Press any key to return to the menu...
            PAUSE >NUL
            GOTO MAIN_MENU
        )
    )
) ELSE IF "%MAIN_CHOICE%"=="2" (
    GOTO COMMAND_MENU
) ELSE IF "%MAIN_CHOICE%"=="3" (
    GOTO QUIT
) ELSE (
    CLS
    MODE CON COLS=85 LINES=7
    COLOR 4F
    ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ECHO ::                           RAMMap Memory Cleanup Script                         ::
    ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ECHO.
    ECHO Invalid choice. Please try again.
    ECHO Press any key to return to the menu...
    PAUSE >NUL
    GOTO MAIN_MENU
)

:COMMAND_MENU
CLS
MODE CON COLS=85 LINES=15
COLOR 9F
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                           RAMMap Memory Cleanup Script                         ::
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Select an option:
ECHO 1. Empty Working Sets
ECHO 2. Empty Standby List
ECHO 3. Empty Modified Page List
ECHO 4. Exit
ECHO.

SET /P CHOICE=Enter your choice (1-4):
IF "%CHOICE%"=="1" (
    GOTO EMPTY_WORKING_SETS
) ELSE IF "%CHOICE%"=="2" (
    GOTO EMPTY_STANDBY_LIST
) ELSE IF "%CHOICE%"=="3" (
    GOTO EMPTY_MODIFIED_PAGE_LIST
) ELSE IF "%CHOICE%"=="4" (
    GOTO QUIT
) ELSE (
    CLS
    MODE CON COLS=85 LINES=7
    COLOR 4F
    ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ECHO ::                           RAMMap Memory Cleanup Script                         ::
    ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ECHO.
    ECHO Invalid choice. Please try again.
    ECHO Press any key to return to the menu...
    PAUSE >NUL
    GOTO COMMAND_MENU
)

:EMPTY_WORKING_SETS
ECHO Emptying Working Sets
RAMMap64.exe -Ew >NUL
IF ERRORLEVEL 0 (
    CLS
    MODE CON COLS=85 LINES=10
    COLOR 2F
    ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ECHO ::                           RAMMap Memory Cleanup Script                         ::
    ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ECHO.
    ECHO Success! Working Sets have been emptied.
    ECHO Press any key to return to the menu...
    PAUSE >NUL
    GOTO COMMAND_MENU   
) ELSE (
    GOTO ERROR
)

:EMPTY_STANDBY_LIST
ECHO Emptying Standby List
RAMMap64.exe -Et >NUL
IF ERRORLEVEL 0 (
    CLS
    MODE CON COLS=85 LINES=10
    COLOR 2F
    ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ECHO ::                           RAMMap Memory Cleanup Script                         ::
    ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ECHO.
    ECHO Success! Standby List has been emptied.
    ECHO Press any key to return to the menu...
    PAUSE >NUL
    GOTO COMMAND_MENU 
) ELSE (
    GOTO ERROR
)

:EMPTY_MODIFIED_PAGE_LIST
ECHO Emptying Modified Page List
RAMMap64.exe -Em >NUL
IF ERRORLEVEL 0 (
    CLS
    MODE CON COLS=85 LINES=10
    COLOR 2F
    ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ECHO ::                           RAMMap Memory Cleanup Script                         ::
    ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ECHO.
    ECHO Success! Modified Page List has been emptied.
    ECHO Press any key to return to the menu...
    PAUSE >NUL
    GOTO COMMAND_MENU
) ELSE (
    GOTO ERROR
)

:ERROR
CLS
MODE CON COLS=85 LINES=10
COLOR 4F
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                           RAMMap Memory Cleanup Script                         ::
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO An error occurred while executing the command.
ECHO Please ensure RAMMap is installed and accessible in your system PATH.
ECHO.
ECHO For more information on RAMMap, visit:
ECHO - https://docs.microsoft.com/en-us/sysinternals/downloads/rammap
ECHO.
ECHO Press any key to return to the menu...
PAUSE >NUL
GOTO COMMAND_MENU

:QUIT
CLS
MODE CON COLS=85 LINES=7
COLOR 9F
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                           RAMMap Memory Cleanup Script                         ::
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Thank you for using the RAMMap Memory Cleanup Script!
ECHO You may now close this window. This window will close automatically in 5 seconds...
TIMEOUT /T 5 /NOBREAK >NUL
EXIT /B 0
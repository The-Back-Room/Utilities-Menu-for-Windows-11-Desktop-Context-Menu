@ECHO OFF

SET ICONCACHE="%LOCALAPPDATA%\IconCache.db"
SET ICONCACHE_X="%LOCALAPPDATA%\Microsoft\Windows\Explorer\iconcache*"
SET THUMBCACHE="%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache*"

CLS
MODE CON COLS=52 LINES=15
COLOR 97
TITLE Refresh Icon Cache
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO ::              Refresh Icon Cache                ::
ECHO ::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO This script will refresh the Windows Icon Cache to resolve display issues with icons.
ECHO.
ECHO Press any key to start the refresh process...
PAUSE >NUL
GOTO REFRESH_ICON_CACHE

:REFRESH_ICON_CACHE
CLS
MODE CON COLS=52 LINES=15
COLOR 1F
TITLE Applying
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO ::              Refresh Icon Cache                ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Refreshing Icon Cache... Please wait.
ECHO.

IF EXIST %ICONCACHE% ( 
	DEL /A /F /Q %ICONCACHE% >NUL
	TIMEOUT /T 1 >NUL
	 ) ELSE ( 
		ECHO Icon cache file not found, skipping...
		TIMEOUT /T 1 >NUL
	 ) 
IF EXIST %ICONCACHE_X% ( 
	DEL /A /F /Q %ICONCACHE_X% >NUL
	TIMEOUT /T 1 >NUL
	) ELSE ( 
		ECHO Icon cache files not found, skipping...
		TIMEOUT /T 1 >NUL
		)

IF EXIST %THUMBCACHE% ( 
	DEL /A /F /Q %THUMBCACHE% >NUL 
	TIMEOUT /T 1 >NUL
	) ELSE ( 
		ECHO Thumbnail cache files not found, skipping...
		TIMEOUT /T 1 >NUL
		)

IF %ERRORLEVEL%==0 GOTO SUCCESS ELSE GOTO ERROR

:SUCCESS
CLS
MODE CON COLS=52 LINES=15
COLOR 2F
TITLE Success
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO ::                Success                  ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Icon cache has been successfully refreshed.
ECHO.
ECHO Explorer will now restart to apply changes.
TASKKILL /F /IM explorer.exe >NUL
TIMEOUT /T 1 >NUL
START explorer.exe >NUL
GOTO EXIT

:ERROR
CLS
MODE CON COLS=52 LINES=15
COLOR 4F
TITLE Error: Command Failed
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO ::            Command Failed               ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO An error occurred while refreshing the icon cache.
ECHO Please try running this script again.
GOTO EXIT

:EXIT
ECHO.
ECHO You can now close this window. It will close automatically in 5 seconds.
TIMEOUT /T 5 >NUL
EXIT

@ECHO OFF

SET ICONCACHE="%LOCALAPPDATA%\IconCache.db"
SET ICONCACHE_X="%LOCALAPPDATA%\Microsoft\Windows\Explorer\iconcache*"
SET THUMBCACHE="%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache*

CLS
MODE CON COLS=45 LINES=15
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
MODE CON COLS=45 LINES=25
COLOR 1F
TITLE Applying
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO ::          Refreshing Icon Cache          ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Please wait...
ECHO.

TASKKILL /F /IM explorer.exe >NUL 2>&1
IF EXISTS %ICONCACHE% ( 
	DEL /A /F /Q %ICONCACHE% >NUL 2>&1
	) ELSE ( 
		ECHO Icon cache db file not found, continuing...
		ECHO.
		)
IF EXISTS %ICONCACHE_X% ( 
	DEL /A /F /Q %ICONCACHE_X% >NUL 2>&1
	) ELSE ( 
		ECHO Icon cache files not found, continuing...
		ECHO.
		)
IF EXISTS %THUMBCACHE% ( 
	DEL /A /F /Q %THUMBCACHE% >NUL 2>&1
	) ELSE ( 
		ECHO Thumbnail cache files not found, continuing...
		ECHO.
		)
TIMEOUT /T 3 
START explorer.exe >NUL 2>&1
IF %ERRORLEVEL%=="0" GOTO SUCCESS ELSE GOTO FAILED

:SUCCESS
	CLS
	MODE CON COLS=45 LINES=15
	COLOR 2F
	TITLE Success
	ECHO :::::::::::::::::::::::::::::::::::::::::::::
	ECHO ::                Success                  ::
	ECHO :::::::::::::::::::::::::::::::::::::::::::::
	ECHO.
	ECHO Icon cache has been successfully refreshed.
	GOTO EXIT

:FAILED
	CLS
	MODE CON COLS=45 LINES=15
	COLOR 4F
	TITLE Error: Command Failed
	ECHO :::::::::::::::::::::::::::::::::::::::::::::
	ECHO ::            Command Failed               ::
	ECHO :::::::::::::::::::::::::::::::::::::::::::::
	ECHO.
	ECHO An error occurred while refreshing the icon cache.
	GOTO EXIT

:EXIT
	ECHO.
	ECHO You can now close this window. It will close automatically in 5 seconds.
	TIMEOUT /T 5
	EXIT


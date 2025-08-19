@ECHO OFF

MODE CON COLS=45 LINES=7
COLOR 1F
TITLE Applying
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO ::          Refreshing Icon Cache          ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO.

IF ERRORLEVEL 0 (
	ECHO Attempting to delete IconCache and ThumbCache DB files...
	TASKKILL /F /IM explorer.exe >NUL
	SUDO TASKKILL /F /IM dllhost.exe >NUL
	ie4uinit.exe -show
	TIMEOUT /T 2 >NUL
	IF EXIST "%ICONCACHE%" DEL /A /F /Q "%LOCALAPPDATA%\IconCache.db" >NUL
	IF EXIST "%ICONCACHE_X%" DEL /A /F /Q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\iconcache*" >NUL
	IF EXIST "%THUMBCACHE%" DEL /A /F /Q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache*" >NUL
	START explorer.exe >NUL
	GOTO SUCCESS
) ELSE (
	GOTO FAILED
)

:SUCCESS
	mode CON COLS=45 LINES=7
	color 2F
	title Success
	echo :::::::::::::::::::::::::::::::::::::::::::::
	echo ::                Success                  ::
	echo :::::::::::::::::::::::::::::::::::::::::::::
	GOTO EXIT

:FAILED
	mode CON COLS=45 LINES=7
	color 4F
	title Error: Command Failed
	echo :::::::::::::::::::::::::::::::::::::::::::::
	echo ::            Command Failed               ::
	echo :::::::::::::::::::::::::::::::::::::::::::::
	GOTO EXIT

:EXIT
	echo.
	echo You can now close this window. It will close automatically in 5 seconds.
	TIMEOUT /T 5 >NUL
	EXIT


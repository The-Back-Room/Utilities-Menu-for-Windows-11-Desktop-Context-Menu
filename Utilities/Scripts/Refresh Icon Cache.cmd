@ECHO OFF

SET ICONCACHE="%LOCALAPPDATA%\IconCache.db"
SET ICONCACHE_X="%LOCALAPPDATA%\Microsoft\Windows\Explorer\iconcache*"
SET THUMBCACHE="%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache*"

CLS
MODE CON COLS=45 LINES=7
COLOR 1F
TITLE Applying
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO ::          Refreshing Icon Cache          ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Please wait...

IF ERRORLEVEL 0 (
	ECHO Attempting to delete IconCache and ThumbCache DB files...
	TASKKILL /F /IM explorer.exe >NUL
	SUDO TASKKILL /F /IM DLLHOST.EXE >NUL
	ie4uinit.exe -SHOW >NUL
	TIMEOUT /T 2 >NUL
	IF EXIST "%ICONCACHE%" DEL /A /F /Q "%ICONCACHE%" >NUL
	IF EXIST "%ICONCACHE_X%" DEL /A /F /Q "%ICONCACHE_X%" >NUL
	IF EXIST "%THUMBCACHE%" DEL /A /F /Q "%THUMBCACHE%" >NUL
	TIMEOUT /T 3 >NUL
	TASKLIST /FI "ImageName eq explorer.exe" /FO CSV 2>NUL | find /I "explorer.exe">NUL
	IF ERRORLEVEL NEQ 0 (
		START explorer.exe >NUL
		GOTO SUCCESS
	) ELSE (
		GOTO SUCCESS
	)
) ELSE (
	GOTO FAILED
)

:SUCCESS
	MODE CON COLS=45 LINES=7
	COLOR 2F
	TITLE Success
	ECHO :::::::::::::::::::::::::::::::::::::::::::::
	ECHO ::                Success                  ::
	ECHO :::::::::::::::::::::::::::::::::::::::::::::
	GOTO EXIT

:FAILED
	MODE CON COLS=45 LINES=7
	COLOR 4F
	TITLE Error: Command Failed
	ECHO :::::::::::::::::::::::::::::::::::::::::::::
	ECHO ::            Command Failed               ::
	ECHO :::::::::::::::::::::::::::::::::::::::::::::
	GOTO EXIT

:EXIT
	ECHO.
	ECHO You can now close this window. It will close automatically in 5 seconds.
	TIMEOUT /T 5 >NUL
	EXIT


@ECHO OFF
MODE CON COLS=45 LINES=7
COLOR 1F
TITLE Applying
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO ::           Restarting explorer           ::
ECHO :::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO Please wait...

IF ERRORLEVEL 0 (
	TASKKILL /F /IM explorer.exe >NUL
	TIMEOUT /T 3 >NUL
	TASKLIST /FI "ImageName eq explorer.exe" /FO CSV 2>NUL | find /I "explorer.exe">NUL
	IF ERRORLEVEL 0 (
		GOTO SUCCESS
	) ELSE (
		START explorer.exe >NUL
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

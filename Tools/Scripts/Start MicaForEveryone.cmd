@echo off
mode CON COLS=45 LINES=7
color 1F
title: Applying
echo :::::::::::::::::::::::::::::::::::::::::::::
echo ::        Starting MicaForEveryone         ::
echo :::::::::::::::::::::::::::::::::::::::::::::

IF ERRORLEVEL 0 (
	START MicaForEveryone
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

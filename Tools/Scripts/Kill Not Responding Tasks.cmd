@echo off
mode CON COLS=45 LINES=7
color 1F
title Applying
echo :::::::::::::::::::::::::::::::::::::::::::::
echo ::    Killing all not responding tasks     ::
echo :::::::::::::::::::::::::::::::::::::::::::::

IF ERRORLEVE 0 (
	TASKKILL /F /FI "status eq NOT RESPONDING"
	TIMEOUT /T 3 >NUL
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

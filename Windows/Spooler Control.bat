::-----------------------::
:: PRINT SPOOLER CONTROL ::
::-----------------------::
:: Jordan Pakrosnis      ::
:: JpakMedia.com         ::
::-----------------------::

@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: SET YOUR OPTIONS HERE!! ::


:: Server Hostname or IP on network
SET server-hostname-ip=FLCONTROL1



:: USER DOMAIN ::

:: The domain/machine the target account is on
:: Default: Your current domain

SET domain=%USERDOMAIN%



:: USER ACCOUNT ::

:: The User You'd like to Run As
:: Default: Current User (%username%)... kinda defeats the point though!

SET run-as-user=%username%


::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:: Set color & title
color 0F
title %server-hostname-ip% Spooler Control


:: TITLE
call:clearScreen


:: DISPLAY USER NAME
echo Running as user:	%run-as-user%.


:: DISPLAY SERVER NAME
echo Server:			%server-hostname-ip%


call:space-md


:: QUERY CURRENT STATE
echo Current Spooler State
echo.
call:spooler-query


call:space-lg


:: SHOW MENU
call:show-menu


:: GOTO Beginning menu again
call:clearScreen
GOTO:show-menu


::===========::
:: FUNCTIONS ::
::===========::

::
:: MEDIUM SPACE
::
:space-md

echo.
echo.

GOTO:EOF



::
:: LARGE SPACE
::
:space-lg

echo.
echo.
echo.

GOTO:EOF



::
:: CLEAR SCREEN & SHOW HEADER
::
:clearScreen

cls

echo //-----------------------//
echo // PRINT SPOOLER CONTROL //
echo //-----------------------//
echo //   Jordan Pakrosnis    //
echo //-----------------------//

call:space-md

GOTO:EOF



::
:: MENU
::
:show-menu

color 0F

:: Display Header & Options
echo // MENU //
echo.
echo  "R"	Restart Spooler
echo  "S"	Get Spooler State (Status)
echo  "X"	Exit
echo.

:: Get User Option
set /p choice=Please enter your option (no quotes, capital): 


call:clearScreen


:: PROCESS OPTIONS

:: Restart
IF %choice%==R (
	call:spooler-restart
	call:back-to-menu
) ELSE (
	set invalid=yes
)

:: Query
IF %choice%==S (
	call:spooler-query
	call:back-to-menu
) ELSE (
	set invalid=yes
)

:: Exit
IF %choice%==X (
	exit
) ELSE (
	set invalid=yes
)

IF %invalid%==yes (
	call:clearScreen
	echo You did not enter a valid choice!
	echo.
	GOTO:show-menu
)

GOTO:EOF



::
:: BACK TO MENU 
::
:back-to-menu

call:space-md

echo Press any key to return to the menu.
pause > nul

call:clearScreen

GOTO:show-menu



::
:: QUERY SPOOLER
::
:spooler-query

sc \\%server-hostname-ip% QUERY SPOOLER | FIND "STATE"

GOTO:EOF



::
:: RESTART SPOOLER
::
:spooler-restart

color 0E

call:clearScreen

echo // RESTARTING %server-hostname-ip% SPOOLER //
echo.


:: Get Status
call:spooler-query


:: Stop Spooler
sc \\%server-hostname-ip% STOP SPOOLER > nul


:: Get Status
call:spooler-query


:: Start Spooler
sc \\%server-hostname-ip% START SPOOLER > nul


:: Get Status
call:spooler-query


:: Timeout
TIMEOUT /T 3 > NUL


:: Get Status
call:spooler-query


GOTO:EOF
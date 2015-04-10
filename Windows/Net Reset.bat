::------------------::
:: RESET NETWORK    ::
::------------------::
:: Jordan Pakrosnis ::
:: JpakMedia.com    ::
::------------------::

@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: SET YOUR OPTIONS HERE!! ::

:: Change "Ethernet" to the name of your network adapter
SET network-interface-name="Ethernet"


:: Change "5" to the number of pings you'd like to do
SET num-pings=5


:: Change "google.com" to your ping target
SET ping-target="google.com"


::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:: Set color & title
color 0F
title Reset Network Stuff


:: TITLE
call:clearScreen


:: NOTES
echo PLEASE NOTE:
echo.
echo - Your internet connection will be disabled temporarily! Make sure you don't
echo   have any downloads in progress!
echo.
echo - This must be ran as Administrator to reset network adapters.
echo   To run it ads admin by default, make a SHORTCUT to the .bat file,
echo   right-click it, select "Advanced", and check the "Run as Administrator" box.
echo.
echo - To reset network adapters, the correct name must be set in the options
echo.
echo - To set options, right-click the .bat file and select "Edit"

call:space-lg


:: Wait for continue
echo Aight. Press any key to start.
pause > NUL


call:space-md


:: Clear Screen
call:clearScreen


:: Start script notification
echo Starting Script...


:: Timeout & color
TIMEOUT /T 1 > NUL
color 0E



:: Clear Screen and Show Progress
call:clearScreen
call:showProgress 0, 0, 0, 0, 0



:: RELEASE
echo Releasing IP...
ipconfig /Release > NUL



call:clearScreen
call:showProgress 1, 0, 0, 0, 0



:: RESET NETWORK ADAPTER
echo Resetting Network Adapter...
netsh interface set interface %network-interface-name% DISABLED
netsh interface set interface %network-interface-name% ENABLED


call:clearScreen
call:showProgress 1, 1, 0, 0, 0



:: RENEW IP
echo Renewing IP...
ipconfig /Renew > NULd

echo.

ipconfig | findstr IPv4

TIMEOUT /T 2 > NUL


call:clearScreen
call:showProgress 1, 1, 1, 0, 0



echo Flushing DNS...
ipconfig /flushdns


call:clearScreen
call:showProgress 1, 1, 1, 1, 0



:: PING TEST
echo Ping Test...

echo.

echo Press CTRL + C to quit.

ping -n %num-pings% %ping-target%


call:space-md


:: Color again
color 0A

:: System Pause
echo DONE! Press any key to exit.
pause > NUL



::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: FUNCTIONS ::


:: MEDIUM SPACE
:space-md

echo.
echo.

GOTO:EOF



:: LARGE SPACE
:space-lg

echo.
echo.
echo.

GOTO:EOF



:: CLEAR SCREEN & SHOW HEADER
:clearScreen

cls

echo //---------------------//
echo // RESET NETWORK STUFF //
echo //---------------------//
echo // By Jordan Pakrosnis //
echo //---------------------//

call:space-md

GOTO:EOF



:: SHOW PROGRESS
:showProgress

:: Release IP
if "%~1"=="1" (
	echo   [$] Release IP
) else (
	echo   [ ] Release IP
)

echo.

:: Reset Network Adapter
if "%~2"=="1" (
	echo   [$] Reset Network Adapter
) else (
	echo   [ ] Reset Network Adapter
)

echo.

:: Renew IP
if "%~3"=="1" (
	echo   [$] Renew IP
) else (
	echo   [ ] Renew IP
)

echo.

:: Flush DNS
if "%~4"=="1" (
	echo   [$] Flush DNS
) else (
	echo   [ ] Flush DNS
)

echo.

:: Ping Test
if "%~5"=="1" (
	echo   [$] Ping Test
) else (
	echo   [ ] Ping Test
)

call:space-lg
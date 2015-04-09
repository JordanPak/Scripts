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
SET network-interface-name="Ethernet" > NUL


:: Change "5" to the number of pings you'd like to do
SET num-pings=5 > NUL


:: Change "google.com" to your ping target
SET ping-target="google.com" > NUL


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

echo.
echo.
echo.

:: Wait for continue
echo Aight. Press any key to start. Please don't panic when the colors change.
pause > NUL


echo.
echo.

:: Clear Screen
call:clearScreen


:: Start script notification
echo Starting Script...

:: Timeout & color
TIMEOUT /T 1 > NUL
color 0E

echo.
echo.
echo.


:: RELEASE
echo // RELEASE IP //
ipconfig /Release > NUL

echo.
echo IPv4 Released

echo.
echo.
echo.


:: RESET NETWORK ADAPTER
echo // RESET NETWORK ADAPTER //

netsh interface set interface %network-interface-name% DISABLED

echo Ethernet Disabled

netsh interface set interface %network-interface-name% ENABLED

echo Ethernet Enabled

echo.
echo.
echo.


:: RENEW
echo // RENEW IP //
ipconfig /Renew > NULd

echo.

ipconfig | findstr IPv4

echo.
echo.
echo.

echo // FLUSH DNS //
ipconfig /flushdns

echo.
echo.
echo.


:: Ping Test
echo // PING TEST //

echo.

echo Press CTRL + C to quit.

ping -n %num-pings% %ping-target%


echo.
echo.

:: Color again
color 0A

:: System Pause
echo DONE! Press any key to exit.
pause > NUL



:: FUNCTIONS
:clearScreen

cls

echo //---------------------//
echo // RESET NETWORK STUFF //
echo //---------------------//
echo // By Jordan Pakrosnis //
echo //---------------------//

echo.
echo.
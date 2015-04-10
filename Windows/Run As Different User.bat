::------------------------::
:: RUN AS DIFFERENT USER  ::
::------------------------::
:: Jordan Pakrosnis       ::
:: JpakMedia.com          ::
::------------------------::

@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: SET YOUR OPTIONS HERE!! ::


:: USER DOMAIN ::

:: The domain/machine the target account is on
:: Default: Your current domain

SET domain=%USERDOMAIN%



:: USER ACCOUNT ::

:: The User You'd like to Run As
:: Default: Current User (%username%)... kinda defeats the point though!

SET runAsUser=%username%



:: APPLICATION ::
:: Most paths to .exe files work, but some services (.msc) need
:: "mmc" (no quotes) in front of it. For Example:
::
:: If you want to run notepad, you'd set application to:
:: %windir%\system32\notepad.exe
::
:: If you want to run remote AD Users & Computers, you'd set application to:
:: mmc %SystemRoot%\system32\dsa.msc

SET application=notepad.exe


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:: Set color & title
color 0A
title Run As Different User


:: Display Header / Clear Screen
call:clearScreen



:: Tell User What They're Running 
echo Application: %application%     (Change this by editing batch file)


call:space-md


:: Warn that it's the same user if necessary
if %username% == %runAsUser% (
    
    color 0E
    
    echo You're about to run this application as your current user.
    echo You may want to set the user you'd like to run as in the
    echo options by editing this batch file.
    
    call:space-md
    
    pause
    
    call:clearScreen
)


call:space-md

:: Warn about blank password entry
echo No characters will show when entering password (like Unix)!


call:space-md


:: Runas Command
runas /user:%domain%\%runAsUser% "cmd /c %application%"


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

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



:: CLEAR SCREEN & ADD HEADER
:clearScreen

cls

echo //-----------------------//
echo // RUN AS DIFFERENT USER //
echo //-----------------------//
echo //  By Jordan Pakrosnis  //
echo //-----------------------//

call:space-md


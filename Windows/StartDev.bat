::------------------------::
::  JordanPak Dev Launch  ::
::------------------------::
::  Jordan Pakrosnis      ::
::  JordanPak.com	  ::
::------------------------::

:: Don't Display Messages
@echo off


:: Git Bash (in current dir)
start "GitBash" "C:\Program Files\Git\git-bash.exe"

:: LiveReload Server
start "LiveReload" "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\LiveReload\LiveReload.appref-ms"

:: Atom
start "Atom" "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\GitHub, Inc\Atom.lnk"

:: GitHub for Windows
start "GitHub" "%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\GitHub, Inc\GitHub.appref-ms"

:: SB.dev
start "sb.dev" http://sb.dev

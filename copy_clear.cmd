@echo off
setlocal enabledelayedexpansion

if "%1" == "" (
  echo No "copy-to-dir" param found
  goto :eof
)

set nocopy=%~sdp0nocopy.lst

echo nocopy=%nocopy%

if not exist %~sdp0nocopy.lst (
	echo \obj\ 			>%nocopy%
	echo \bin\ 			>>%nocopy%
	echo TemporaryGenerated 	>>%nocopy%
	echo FileListAbsolute.txt 	>>%nocopy%
	echo .vshost. 			>>%nocopy%
	echo .git 			>>%nocopy%
	echo packages 			>>%nocopy%
	echo .cmd 			>>%nocopy%
	echo .txt 			>>%nocopy%
	echo .lst 			>>%nocopy%
	echo .coverage 			>>%nocopy%
)

set folder=%1
set extensions=*.sln *.cs *.csproj *.config *.cpp *.vcxproj* *.txt

call :m  %extensions%

exit

:m

:next
if ""=="%1" exit /b

echo %~sdp0

xcopy %1   %folder%\ /S /Y /Q /F /EXCLUDE:%~sdp0nocopy.lst

shift
goto next


exit /b
)
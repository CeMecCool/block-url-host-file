@echo off
TITLE Block URL Host File
CHCP 65001
CLS

:check_Permissions 
    net session >nul 2>&1
    IF %errorLevel% == 0 (
	ECHO Block URL Host File
    ) ELSE (
        ECHO Faut lancer le script en tant que administrateur
	PAUSE
	EXIT /B
    )

:seturl
ECHO.
SET /P URL="URL: "
ECHO 0.0.0.0       %URL% >> "C:\Windows\System32\drivers\etc\hosts"
ECHO %URL% ajoutée au fichier host
ECHO.

choice /C:YN /M:"Continuer? "
IF ERRORLEVEL ==1 GOTO seturl
IF ERRORLEVEL ==2 EXIT /B

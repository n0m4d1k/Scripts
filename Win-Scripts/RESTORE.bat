:: ************   ************   ************   ************   ************
::
::
::			 			 User Data Restore Script
::
::	 	This Script will restore all of a specified users profile data
::
::
:: 		   			 Created by Dane "N0m4d1k" Mealey
:: 						 N0m4d1k@protonmail.com
::
::
:: ************   ************   ************   ************   ************

::Prevents ECHO from printing and changed color to black and red.
@echo off
color 0C


ECHO.
ECHO ************   ************   ************   ************   ************   
ECHO.
ECHO.
ECHO             THIS WILL COPY SPECIFIED USER FROM SPECIFIED DRIVE
ECHO.
ECHO.
ECHO ************   ************   ************   ************   ************
ECHO.

:: ************   ************   ************   ************   ************
::				    				SETUP
:: ************   ************   ************   ************   ************

::Asks user to input Drive where backup is stored.
set /p DEST=Enter Drive Letter Where Backup Is Stored [ex D:]: 
ECHO.
ECHO THE DRIVE YOU SELECTED IS %DEST%\
ECHO.
PAUSE

:: Asks user to input name of profile.
ECHO.
set /p USER=Enter Name [ex john.doe]: 
ECHO.
ECHO THE USER PROFILE SELECTED FOR BACKUP IS %USER%
ECHO.


:: Creates Backup.log
MKDIR C:\Users\Public\%USER%\


::Variable for the log file location.
set LOG=C:\Users\Public\%USER%\Backup.log


:: ************   ************   ************   ************   ************
::				    				BACKUP
:: ************   ************   ************   ************   ************
PAUSE
Robocopy "%DEST%\%USER%" "C:\Users\Public\%USER%\" /MIR /XA:SH /XJD /R:5 /W:15 /MT:32 /V /LOG:"%LOG%" /TEE
COPY C:\Users\Public\%USER%\Backup.log %USERPROFILE%\Desktop\Backup.log
ECHO.
PAUSE
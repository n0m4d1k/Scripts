:: ************   ************   ************   ************   ************
::
::
::			 		          Post Imaging Script
::
::	 		        This Script will setup a Windows machine
:: 					   after the machine has been imaged
::
::
:: 		   				Created by Dane "N0m4d1k" Mealey
:: 							N0m4d1k@protonmail.com
::
::
:: ************   ************   ************   ************   ************

::In order for this script to join the machine to WiFi you will need to export
:: the WiFi profile before running the script. This can be done by running the command below.
:: netsh wlan export profile folder="Path to export profile to" name="BSSID(Name of WiFi)" interface="*"



:: Asks user to input location of WiFi Profile.
ECHO.
set /p PROFILE=Enter Location [ex C:\Users\john\Desktop\]: 
ECHO.
ECHO THE LOCATION IS %PROFILE%
ECHO.
PAUSE

::Connects to WiFi
Netsh wlan add profile filename=%PROFILE%\MY-WIFI.xml interface="*" :: REPLACE WITH WIFI PROFILE .xml
netsh wlan connect name="MY WIFI" ::REPLACE WITH BSSID

:: Asks user to input new computer name.
ECHO.
set /p NEWPCNAME=Enter Name [ex EVILCORPPC999]: 
ECHO.
ECHO THE COMPUTER NAME WILL BE SET TO %NEWPCNAME%
ECHO.
PAUSE

:: Renames computer.
WMIC computersystem where caption='%COMPUTERNAME%' rename %NEWPCNAME%

:: Asks user to input admin username.
ECHO.
set /p ADUSER=Enter Admin Account Name [ex not-admin]: 
ECHO.
ECHO THE ADMIN ACCOUNT INPUT IS %ADUSER%
ECHO.

:: Joins computer to the domain.
powershell.exe add-computer -domainname evil.corp.com -Credential AD\%ADUSER% :: REPLACE evil.corp.com WITH YOUR DOMAIN

:: Adds EVIL-ADMINS to administrators group.
net localgroup administrators "EVIL-ADMINS" /add :: REPLACE EVIL-ADMINS WITH YOUR ADMIN AD GROUP

:: Reboots machine to apply changes.
shutdown /r /t 00

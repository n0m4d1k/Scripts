:: ************   ************   ************   ************   ************
::
::
::			 				User Data Backup Script
::
::	 		This Script will copy all of a specified users profile data
:: 					except the AppData and Temp Directories.
::
::
:: 		   				Created by Dane "N0m4d1k" Mealey
:: 							N0m4d1k@protonmail.com
::
::
:: ************   ************   ************   ************   ************

::Prevents ECHO from printing and changed color to black and red.
mode con: cols=200 lines=50
@echo off
color 0a

ECHO.
ECHO.
ECHO.
ECHO.
echo "                                                         '|| '||'  '|'                           ||                                                                                         ";
echo "                               <>   <>  <>   <>  <>   <>  '|. '|.  .'   ....   ... ..  .. ...   ...  .. ...     ... .  <>   <>  <>   <>  <>   <>                                            ";
echo "                                 \ /      \ /      \ /     ||  ||  |   '' .||   ||' ''  ||  ||   ||   ||  ||   || ||     \ /      \ /      \ /                                              ";
echo "                              <>--*--<><>--*--<><>--*--<>   ||| |||    .|' ||   ||      ||  ||   ||   ||  ||    |''   <>--*--<><>--*--<><>--*--<>                                           ";
echo "                                 / \      / \      / \       |   |     '|..'|' .||.    .||. ||. .||. .||. ||.  '||||.    / \      / \      / \                                              ";
echo "                               <>   <>  <>   <>  <>   <>                                                      .|....'  <>   <>  <>   <>  <>   <>                                            ";
echo "                                                                                                                                                                                            ";
echo "     ..|'''.|                              .                   .        .'|.  ||  '||                      .                   '||                 '||        .                             ";
echo "   .|'     '    ...   ... ...  .... ...      ... ...   ....  .||.     .||.   ...   ||    ....   ....     .||.    ...         .. ||    ....   ....   ||  ..  .||.    ...   ... ...           ";
echo "   ||         .|  '|.  ||'  ||  '|.  |        ||'  || ||. '   ||       ||     ||   ||  .|...|| ||. '      ||   .|  '|.     .'  '||  .|...|| ||. '   || .'    ||   .|  '|.  ||'  ||          ";
echo "   '|.      . ||   ||  ||    |   '|.|         ||    | . '|..  ||       ||     ||   ||  ||      . '|..     ||   ||   ||     |.   ||  ||      . '|..  ||'|.    ||   ||   ||  ||    |          ";
echo "    ''|....'   '|..|'  ||...'     '|          ||...'  |'..|'  '|.'    .||.   .||. .||.  '|...' |'..|'     '|.'  '|..|'     '|..'||.  '|...' |'..|' .||. ||.  '|.'  '|..|'  ||...'           ";
echo "                       ||      .. |           ||                                                                                                                           ||               ";
echo "                      ''''      ''           ''''                                                                                                                         ''''              ";
echo "      '||                .'|.                                                       .    ||                     ||                      '||                      '||                        ";
echo "       || ...    ....  .||.     ...   ... ..    ....       ....    ...   .. ...   .||.  ...  .. ...   ... ...  ...  .. ...     ... .     || ...   ....     ....   ||  ..  ... ...  ... ...  ";
echo "       ||'  || .|...||  ||    .|  '|.  ||' '' .|...||    .|   '' .|  '|.  ||  ||   ||    ||   ||  ||   ||  ||   ||   ||  ||   || ||      ||'  || '' .||  .|   ''  || .'    ||  ||   ||'  || ";
echo "       ||    | ||       ||    ||   ||  ||     ||         ||      ||   ||  ||  ||   ||    ||   ||  ||   ||  ||   ||   ||  ||    |''       ||    | .|' ||  ||       ||'|.    ||  ||   ||    | ";
echo "       '|...'   '|...' .||.    '|..|' .||.     '|...'     '|...'  '|..|' .||. ||.  '|.' .||. .||. ||.  '|..'|. .||. .||. ||.  '||||.     '|...'  '|..'|'  '|...' .||. ||.  '|..'|.  ||...'  ";
echo "                                                                                                                             .|....'                                                ||      ";
echo "
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
PAUSE


ECHO.
ECHO ************   ************   ************   ************   ************   
ECHO.
ECHO.
ECHO             THIS WILL COPY SPECIFIED USER TO SPECIFIED DRIVE
ECHO.
ECHO          THE FOLLOWING FOLDERS WILL BE EXCLUDED AppData AND Temp
ECHO.
ECHO.
ECHO ************   ************   ************   ************   ************
ECHO.


:: ************   ************   ************   ************   ************
::				    				SETUP
:: ************   ************   ************   ************   ************

::Asks user to input path where they want the backup to be stored.
set /p DEST=Enter Destination [ex D:]: 
ECHO.
ECHO THE DRIVE YOU SELECTED IS %DEST%\
ECHO.
PAUSE

:: Asks user to input name of profile to be backed up.
ECHO.
set /p USER=Enter Name [ex john.doe]: 
ECHO.
ECHO THE USER PROFILE SELECTED FOR BACKUP IS %USER%
ECHO.


:: Creates Backup.log
MKDIR %DEST%\%USER%\


::Variable for the log file location.
set LOG=%DEST%\%USER%\Backup.log

:: ************   ************   ************   ************   ************
::				    				BACKUP
:: ************   ************   ************   ************   ************

PAUSE
::Backs-up user profile minus AppData and Temp
Robocopy "C:\Users\%USER%"  "%DEST%\%USER%" /MIR /XA:SH /XD Temp, AppData /XJD /R:5 /W:15 /MT:32 /V /LOG:"%LOG%" /TEE
COPY %DEST%\%USER%\Backup.log %USERPROFILE%\Desktop\Backup.log
ECHO.
PAUSE
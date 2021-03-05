:: ************   ************   ************   ************   ************
::
::
::			 				Post BitLocker Enable Script
::
::	 		                   This Script will update
:: 				  Mcafee, Run gpupdate, and backup BitLocker to AD
::
::
:: 		   				Created by Dane "N0m4d1k" Mealey
:: 							N0m4d1k@protonmail.com
::
::
:: ************   ************   ************   ************   ************

::Prevents ECHO from printing and changed color to black and red.
mode con: cols=89 lines=55
@echo off
color 0e

echo.
echo.
echo.
echo                                     `----......----`                 
echo                                  .--.              `---              
echo                               .--`                     ---           
echo                             .:-            ::            `:-         
echo                            o.            `yMMy.            `/        
echo                           +M/`          +NMMMMN+            `+       
echo                           mN:`        :mMNdmNmmmm:           h`      
echo                          `Mh-       `hMMNddhN/mMMMh`        `y-      
echo                          .Md-      `mMMMmohdNsMMMMMd        os-      
echo                          -MMm:     -MMMMMMMNhmMMMMMN       `hy:      
echo                          -MMMM.     oNMMMMNdNMMMMMd-       hs+.      
echo                          `NMMM:       -::-.mN.---`        om.d       
echo                           hMMMm          .mMMN-          :M+dh       
echo                           :MMMm          ``````          NmhM-       
echo                            yMM/   `::-`          `:.     /yMo        
echo                            :MmshmMMMMMMNdy/`-oyhmMMMNNdy/:yh`        
echo                           :yMd/mMMMMMMMMN+.  `.dMMMMMMMMm:-`/`       
echo                          .+`do `sdmNNmmmM:  ` .ooyhNMMds/ --`:       
echo                           sN/:`    `     `mmMy `     .   ` `o-       
echo                            +mhs++/:/--`-.sMMMM-    `` -:. `s:        
echo                             /mh+smyhmMmNmmMyMMN++dmMmo   -+-         
echo                              `/+/--:/NNdo/s:hNm+`--:oyss::`          
echo                                      /h`   :   : /y-                 
echo                                       s    `     o`                  
echo                                        --:o+/:-/-                    
echo.
echo.
echo.
ECHO.
ECHO ************   ************   ************   ************   ************   ************   
ECHO.
ECHO.
ECHO               THIS WILL PERFORM AN UPDATE FOR MCAFEE AND THE GROUP POLICY
ECHO.
ECHO                    IT WILL THEN BACK UP THE BITLOCKER PASSWORD TO AD
ECHO.
ECHO.
ECHO ************   ************   ************   ************   ************   ************
ECHO.
PAUSE

::Updates Mcafee
ECHO.
ECHO.
ECHO.
ECHO ON
"C:\Program Files (x86)\McAfee\VirusScan Enterprise\mcupdate.exe"
@ECHO OFF
ECHO.
ECHO.
ECHO.

::Updates Group Policy
gpupdate /force
ECHO.
ECHO.
ECHO.

::Gets BitLocker Passwords
ECHO.
ECHO.
ECHO.
Manage-bde -protectors -get C:
ECHO.
ECHO.
ECHO.

::Asks User to Copy Password
ECHO.
ECHO.
ECHO.
ECHO ************   ************   ************   ************   ************   ************   
ECHO.
ECHO.
ECHO                  PLEASE COPY THE NUMERICAL PASSWORD ID INCLUDING THE {}
ECHO                      COPY BY HIGHLIGHTING AND THE RIGHT CLICKING
ECHO                              THEN RIGHT CLICK TO PASTE                    
ECHO.
ECHO.
ECHO ************   ************   ************   ************   ************   ************
ECHO.
ECHO.
ECHO.
PAUSE

::Define variable for PASS
set /p PASS="Paste Numerical Password [ex. {BB89R7TYE-BD9U-3789-I623-8T3R96H428}]: 

echo.
echo.
echo You have entered: %PASS%
echo.
echo.
PAUSE

::Ask user for Numerical Password and Backs-up to AD
ECHO.
ECHO.
ECHO.
manage-bde -protectors -adbackup C: -id %PASS%
ECHO.
ECHO.
ECHO.

ECHO.
ECHO.
ECHO.
ECHO			****COMPLETE****
ECHO.
ECHO.
ECHO.
echo.
echo.
PAUSE
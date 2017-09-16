@echo off

rem #-------------------------------------------------------------------------------#
rem # Name       = Windows Quick n' Dirty Privilege Escalation Check Script         #
rem # Reference  = http://www.fuzzysecurity.com/tutorials/16.html                   #
rem # Author     = @ihack4falafel                                                   #
rem # Date       = 9/15/2017                                                        #
rem # Tested On  = Windows XP SP3 - Professional                                    #
rem #              Windows 7 SP1  - Entrprise                                       #
rem #              Windows 10     - Professional                                    #
rem # Usage      = WinPrivCheck.bat > WinPrivCheck.txt                              #
rem #-------------------------------------------------------------------------------#

@echo off
rem Used rem instead of echo for cleaner output in command prompt
@echo on

rem #----------#
rem # Hostname #
rem #----------#

hostname

rem #----------#
rem # Username #
rem #----------#

echo %username%
whoami
echo %userprofile%

rem #-----------#
rem # OS Verion #
rem #-----------#

systeminfo | findstr /B /C:"OS Name" /C:"OS Version"

rem #-----------------#
rem # Available Users #
rem #-----------------#

net users

rem #----------------#
rem # Network Config #
rem #----------------#

ipconfig /all

rem #--------------#
rem # Route Config #
rem #--------------#

route print

rem #-----------#
rem # ARP Cache #
rem #-----------#

arp -a

rem #---------------------#
rem # Network Connections #
rem #---------------------#

netstat -ano

rem #-------------------#
rem # Firewall Settings #
rem #-------------------#

netsh firewall show state
netsh firewall show config

rem #------------------#
rem # Running Services #
rem #------------------#

net start

rem #-------------#
rem # Patch Level #
rem #-------------#

wmic qfe get Caption,Description,HotFixID,InstalledOn

rem #-------------------------#
rem # File Transfer Utilities #
rem #-------------------------#

cscript /?
powershell.exe /?
ftp /?
tftp /?

rem #-----------------------------#
rem # Clear-text/base64 Passwords #
rem #-----------------------------#

type c:\sysprep.inf
type c:\sysprep\sysprep.xml
type %WINDIR%\Panther\Unattend\Unattended.xml
type %WINDIR%\Panther\Unattended.xml

rem #-------------------------#
rem # *.MSI Install privilege #
rem #-------------------------#

@echo off
rem This will only work if both registry keys contain "AlwaysInstallElevated" with DWORD values of 1.
@echo on

reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated 
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated

rem #-------------------------------------------#
rem # RW Service Access For Authenticated Users #
rem #-------------------------------------------#

@echo off
rem Make sure you have accesschk.exe(old version) in same directory when you run the script!
@echo on

accesschk.exe /accepteula -uwcqv "Authenticated Users" *

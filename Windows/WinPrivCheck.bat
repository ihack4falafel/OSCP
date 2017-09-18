@echo off

rem #---------------------------------------------------------------------------------#
rem # Name         = Windows Privilege Escalation Check v1.0                          #
rem # Reference    = http://www.fuzzysecurity.com/tutorials/16.html                   #
rem # Author       = @ihack4falafel                                                   #
rem # Date         = 9/18/2017                                                        #
rem # Tested On    = Windows XP SP3 - Professional                                    #
rem #                Windows 7 SP1  - Entrprise                                       #
rem #                Windows 10     - Professional                                    #
rem # Usage        = WinPrivCheck.bat > WinPrivCheck.txt                              #
rem # Requirements = accesschk.exe(old version) - sysinternals                        #
rem #---------------------------------------------------------------------------------#


@echo off
rem Used rem instead of echo for cleaner output in command prompt
@echo on

rem #----------#
rem # Hostname #
rem #----------#

@echo off

hostname

@echo on

rem #----------#
rem # Username #
rem #----------#

@echo off

echo %username% 2>NUL
whoami 2>NUL
echo %userprofile% 2>NUL

@echo on 

rem #-----------#
rem # OS Verion #
rem #-----------#

@echo off

systeminfo | findstr /B /C:"OS Name" /C:"OS Version"

@echo on 

rem #-----------------#
rem # Available Users #
rem #-----------------#

@echo off

net users

@echo on

rem #----------------#
rem # Network Config #
rem #----------------#

@echo off

ipconfig /all

@echo on 

rem #--------------#
rem # Route Config #
rem #--------------#

@echo off

route print

@echo on 

rem #-----------#
rem # ARP Cache #
rem #-----------#

@echo off

arp -a

@echo on 

rem #---------------------#
rem # Network Connections #
rem #---------------------#

@echo off

netstat -ano

@echo on 

rem #-------------------#
rem # Firewall Settings #
rem #-------------------#

@echo off

netsh firewall show state 
netsh firewall show config 

@echo on 

rem #------------------#
rem # Running Services #
rem #------------------#

@echo off

net start

@echo on 

rem #-----------------#
rem # Common Exploits #
rem #-----------------#

@echo off

rem #----------------------#
rem #    Exploits Index    #
rem #----------------------#
rem # KB2592799 | MS11-080 #
rem # KB979682  | KiTrap0D #
rem # KB2393802 | MS11-011 #
rem # KB982799  | MS10-059 #
rem # KB979683  | MS10-021 #
rem #----------------------#

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB2592799" | find /i "KB2592799" 1>NUL
IF not errorlevel 1 (
    
  echo MS11-080 patch is installed :(

) ELSE (

  echo MS11-080 patch is NOT installed! 

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB979682" | find /i "KB979682" 1>NUL
IF not errorlevel 1 (
    
  echo KiTrap0D patch is installed :(

) ELSE (

  echo KiTrap0D patch is NOT installed! 

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB2393802" | find /i "KB2393802" 1>NUL
IF not errorlevel 1 (
    
  echo MS11-011 patch is installed :(

) ELSE (

  echo MS11-011 patch is NOT installed! 

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB982799" | find /i "KB982799" 1>NUL
IF not errorlevel 1 (
    
  echo MS10-059 patch is installed :(

) ELSE (

  echo MS10-059 patch is NOT installed! 

)

wmic qfe get Caption,Description,HotFixID,InstalledOn | findstr /C:"KB979683" | find /i "KB979683" 1>NUL
IF not errorlevel 1 (
    
  echo MS10-021 patch is installed :(

) ELSE (

  echo MS10-021 patch is NOT installed! 

)


@echo on 

rem #-------------------------#
rem # File Transfer Utilities #
rem #-------------------------#

@echo off

cscript /?
powershell.exe /?
tftp /?

@echo on 

rem #-----------------------------#
rem # Clear-text/base64 Passwords #
rem #-----------------------------#

@echo off

type c:\sysprep.inf
type c:\sysprep\sysprep.xml
type %WINDIR%\Panther\Unattend\Unattended.xml
type %WINDIR%\Panther\Unattended.xml
dir /s *pass*
dir /s *cred*
dir /s *vnc*
dir /s *.config

@echo on 

rem #----------------------------------#
rem # *.MSI Install - SYSTEM privilege #
rem #----------------------------------#

@echo off

rem This will only work if both registry keys contain "AlwaysInstallElevated" with DWORD values of 1.
rem This setting will allow low privilege user to install any .MSI as system!

reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated

@echo on 

rem #------------------------#
rem # Unquoted Service Paths #
rem #------------------------#

@echo off

wmic service get name,displayname,pathname,startmode |findstr /i "auto" |findstr /i /v "c:\windows\\" |findstr /i /v """

rem  All commands from this point onward will require accesschk.exe
rem  Make sure you have accesschk.exe(old version) in same directory when you run the script!

@echo on

rem #---------------------#
rem # Vulnerable Services #
rem #---------------------#

@echo off

rem  By default WinXP SP1 grant "Authenticated Users" SERVICE_ALL_ACCESS to "SSDPSRV" and "upnphost"!

accesschk.exe /accepteula -uwcqv "Authenticated Users" * 
accesschk.exe /accepteula -uwcqv "Power Users" *
accesschk.exe /accepteula -uwcqv "Users"

@echo on 

rem #-------------------------------#
rem # Vulnerable Folder Permissions #
rem #-------------------------------#

@echo off

accesschk.exe /accepteula -uwdqs Users c:\
accesschk.exe /accepteula -uwdqs "Authenticated Users" c:\

@echo on 

rem #-----------------------------#
rem # Vulnerable File Permissions #
rem #-----------------------------#

@echo off

accesschk.exe /accepteula -uwqs Users c:\*.*
accesschk.exe /accepteula -uwqs "Authenticated Users" c:\*.*

@echo on 

rem #----------------#
rem # Happy Hunting! #
rem #----------------#

@echo off

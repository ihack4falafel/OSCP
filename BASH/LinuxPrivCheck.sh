#!/bin/bash
#---------------------------------------------------------------------------------#
# Name       = Linux Quick n' Dirty Privilege Escalation Check Script             #
# Reference  = https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/ #
# Author     = @ihack4falafel                                                     #
# Date       = 9/12/2017                                                          #
# Usage      = chmod +x LinuxPrivCheck.sh && ./LinuxPrivCheck.sh                  #
#---------------------------------------------------------------------------------#

echo    "                                          "
echo -e "\e[35m#----------------------------------#"
echo -e "\e[35m#          \e[36m OS Information  \e[35m       #"
echo -e "\e[35m#----------------------------------#"
echo    "                                          "
echo -e "\e[39m"
uname -a                                                                                                # Kernel Version
cat /etc/issue                                                                                          # Distribution
cat /etc/*release                                                                                       # OS Release
echo    "                                          "
echo -e "\e[35m#----------------------------------#"
echo -e "\e[35m#        \e[36m Network Information  \e[35m    #"
echo -e "\e[35m#----------------------------------#"
echo    "                                          "
echo -e "\e[39m"
cat /etc/resolv.conf                                                                                    # Nameservers
cat /etc/hosts                                                                                          # Hosts
route -n                                                                                                # Route Info.
iptables -L                                                                                             # Firewall Rules
cat /etc/network/interfaces                                                                             # Network Interfaces 
echo    "                                          "
echo -e "\e[35m#----------------------------------#"
echo -e "\e[35m#       \e[36m Password Information     \e[35m #"
echo -e "\e[35m#----------------------------------#"
echo    "                                          "
echo -e "\e[39m"
echo -e "\e[34m"
echo "---------|Password Files|-----------"
echo "                                    "
echo -e "\e[39m"
cat /etc/passwd  
echo "                                    "                                                              # Password File
cat /etc/shadow                                                                                          # Shadow File
echo -e "\e[34m"
echo "                                    "
echo "------------|SSH Keys|--------------"
echo "                                    "
echo -e "\e[39m"
cat /root/.ssh/authorized_keys                                                                           # Authorized SSH Keys
cat /root/.ssh/known_hosts                                                                               # SSH Known Hosts
cat ~/.ssh/id_rsa                                                                                        # RSA Keys
cat ~/.ssh/id_dsa                                                                                        # DSA Keys
cat /etc/ssh/ssh_host_dsa_key                                                                            # Alernative DSA keys
cat /etc/ssh/ssh_host_rsa_key                                                                            # Alternative RSA Keys
echo    "                                          "
echo -e "\e[35m#----------------------------------#"
echo -e "\e[35m#         \e[36m Misc. Information  \e[35m     #"
echo -e "\e[35m#----------------------------------#"
echo    "                                          "
echo -e "\e[39m"
echo -e "\e[34m"
echo "------|Important Executables|-------"
echo -e "\e[39m"
echo "                                    "
which wget                                                                                               # Check Wget
which nc                                                                                                 # Check Nc
which netcat                                                                                             # Check Netcat
which python                                                                                             # Check Python
which gcc                                                                                                # Check GCC
which perl                                                                                               # Check Perl
echo -e "\e[34m"
echo "                                    "
echo "-----------|Sudoers File|-----------"
echo "                                    "
echo -e "\e[39m"
cat /etc/sudoers                                                                                         # Check Sudoers
sudo -l                                                                                                  # Check Sudo
echo -e "\e[34m"
echo "                                    "
echo "---------|Users & Groups|-----------"
echo "                                    "
echo -e "\e[39m"
cat /etc/passwd | cut -d: -f1                                                                            # List Users
echo "                                    "
cat /etc/group                                                                                           # Check Groups
echo -e "\e[34m"
echo "                                    "
echo "-----------|SUID Files|-------------"
echo "                                    "
echo -e "\e[39m"
find / -type f -perm -u=s -exec ls -la {} + 2>/dev/null                                                  # Check SUID Files 
echo -e "\e[34m"
echo "                                    "
echo "-----------|WP MySQL Creds|---------"
echo "                                    "
echo -e "\e[39m"
cat $(locate wp-config.php) | grep "DB_USER" 2>/dev/null                                                 # Check Mysql Creds
cat $(locate wp-config.php) | grep "DB_PASSWORD" 2>/dev/null                                             # In wp-config.php 
cat $(locate wp-config.php) | grep "DB_HOST" 2>/dev/null                                                 # Works on WordPress
cat $(locate wp-config.php) | grep "DB_NAME" 2>/dev/null                                                 # Servers only
echo -e "\e[34m"
echo "                                    "
echo "--------------|FSTab|---------------"
echo "                                    "
echo -e "\e[39m"
cat /etc/fstab                                                                                           # Check Fstab
echo -e "\e[34m"
echo "                                    "
echo "---------|Daily Cron Jobs|----------"
echo "                                    "
echo -e "\e[39m"
ls -la /etc/cron.d/                                                                                       # Check Cron Jobs
ls -la /etc/cron.daily/                                                                                   # Alternative Check Cron Jobs
echo -e "\e[34m"
echo "                                    "
echo "------|World Writable Folders|------"
echo "                                    "
echo -e "\e[39m"
find / -perm -222 -type d 2>/dev/null                                                                     # World Wireable Folders
echo -e "\e[34m"
echo "                                    "
echo "-----------|Home Directory|---------"
echo "                                    "
echo -e "\e[39m"
ls -ahl /home/ 2>/dev/null                                                                                # Check Home Directory
echo "                                    "
touch ~/.bash_history                                                                                     # Clear Command History
echo    "                                          "
echo -e "\e[35m#----------------------------------#"
echo -e "\e[35m#   \e[36m Script has been completed!  \e[35m  #"
echo -e "\e[35m#----------------------------------#"
echo    "                                          "
echo -e "\e[39m"


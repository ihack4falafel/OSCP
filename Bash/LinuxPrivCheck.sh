#---------------------------------------------------------------------------------#
# Name       = Linux Quick n' Dirty Privilege Escalation Check Script             #
# Reference  = https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/ #
# Author     = @ihack4falafel                                                     #
# Date       = 9/12/2017                                                          #
# Usage      = LinuxPrivCheck.sh                                                  #
#---------------------------------------------------------------------------------#

echo "                                    "
echo "#----------------------------------#"
echo "#            OS Information        #"
echo "#----------------------------------#"
echo "                                    "
uname -a                                                                                                # Kernel Version
cat /etc/issue                                                                                          # Distribution
cat /etc/*release                                                                                       # OS Release
echo "                                    "
echo "#----------------------------------#"
echo "#        Network Information       #"
echo "#----------------------------------#"
echo "                                    "
cat /etc/resolv.conf                                                                                    # Nameservers
cat /etc/hosts                                                                                          # Hosts
route -n                                                                                                # Route Info.
iptables -L                                                                                             # Firewall Rules
cat /etc/network/interfaces                                                                             # Network Interfaces 
echo "                                    "
echo "#----------------------------------#"
echo "#        Password Information      #"
echo "#----------------------------------#"
echo "                                    "
echo "@@@@@@@@@@Password Files@@@@@@@@@@@@"
echo "                                    "
cat /etc/passwd  
echo "                                    "                                                              # Password File
cat /etc/shadow                                                                                          # Shadow File
echo "                                    "
echo "@@@@@@@@@@@@@SSH Keys@@@@@@@@@@@@@@@"
echo "                                    "
cat /root/.ssh/authorized_keys                                                                           # Authorized SSH Keys
cat /root/.ssh/known_hosts                                                                               # SSH Known Hosts
cat ~/.ssh/id_rsa                                                                                        # RSA Keys
cat ~/.ssh/id_dsa                                                                                        # DSA Keys
cat /etc/ssh/ssh_host_dsa_key                                                                            # Alernative DSA keys
cat /etc/ssh/ssh_host_rsa_key                                                                            # Alternative RSA Keys
echo "                                    "
echo "#----------------------------------#"
echo "#          Misc. Information       #"
echo "#----------------------------------#"
echo "                                    "
echo "@@@@@@@Important Executables@@@@@@@@"
echo "                                    "
which wget                                                                                               # Check Wget
which nc                                                                                                 # Check Nc
which netcat                                                                                             # Check Netcat
which python                                                                                             # Check Python
which gcc                                                                                                # Check GCC
which perl                                                                                               # Check Perl
echo "                                    "
echo "@@@@@@@@@@@@Sudoers File@@@@@@@@@@@@"
echo "                                    "
cat /etc/sudoers                                                                                         # Check Sudoers
sudo -l                                                                                                  # Check Sudo
echo "                                    "
echo "@@@@@@@@@@Users n' Groups@@@@@@@@@@@"
echo "                                    "
cat /etc/group                                                                                           # Check groups
grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}'                                              # Check Users
awk -F: '($3 == "0") {print}' /etc/passwd                                                                # Alternative Check User 
echo "                                    "
echo "@@@@@@@@@@@@SUID Files@@@@@@@@@@@@@@"
echo "                                    "
find / -type f -perm -u=s -exec ls -la {} + 2>/dev/null                                                  # Check SUID/GUID 
echo "                                    "
echo "@@@@@@@WordPress Mysql Creds@@@@@@@@"
echo "                                    "
cat $(locate wp-config.php) | grep "DB_USER" 2>/dev/null                                                 # Check Mysql Creds
cat $(locate wp-config.php) | grep "DB_PASSWORD" 2>/dev/null                                             # In wp-config.php 
cat $(locate wp-config.php) | grep "DB_HOST" 2>/dev/null                                                 # Works on WordPress
cat $(locate wp-config.php) | grep "DB_NAME" 2>/dev/null                                                 # Servers
echo "                                    "
echo "@@@@@@@@@@@@@@FSTab@@@@@@@@@@@@@@@@@"
echo "                                    "
cat /etc/fstab                                                                                           # Check Fstab
echo "                                    "
echo "@@@@@@@@@@Daily Cron Jobs@@@@@@@@@@@"
echo "                                    "
ls -la /etc/cron.d/                                                                                       # Check Cron Jobs
ls -la /etc/cron.daily/                                                                                   # Alternative Check Cron Jobs
echo "                                    "
touch ~/.bash_history
echo "+----------------------------------+"
echo "+    Script has been completed!    +"
echo "+----------------------------------+"

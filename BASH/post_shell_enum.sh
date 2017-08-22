echo "+----------------------------------+"
echo "+          Privesc Script          +" 
echo "+ Inspired by g0tm1lk privesc blog +"
echo "+----------------------------------+"
echo "                                   "
echo "#----------------------------------#"
echo "#            OS Information        #"
echo "#----------------------------------#"
echo "                                    "
uname -a
echo "                                    "
cat /etc/issue
echo "                                    "
cat /proc/version
echo "                                    " 
echo "#----------------------------------#"
echo "#        Network Information       #"
echo "#----------------------------------#"
echo "                                    "
cat /etc/resolv.conf
echo "                                    "
cat /etc/hosts
echo "                                    "
route -n
echo "                                    "
iptables -L
echo "                                    "
cat /etc/network/interfaces
echo "                                    "
echo "#----------------------------------#"
echo "#        Password Information      #"
echo "#----------------------------------#"
echo "                                    "
cat /etc/passwd  
echo "                                    "
cat /etc/shadow
echo "                                    "
cat /root/.ssh/authorized_keys
echo "                                    "
cat /root/.ssh/known_hosts
echo "                                    "
cat ~/.ssh/id_rsa
echo "                                    "
cat ~/.ssh/id_dsa
echo "                                    "
cat /etc/ssh/ssh_host_dsa_key
echo "                                    "
cat /etc/ssh/ssh_host_rsa_key
echo "                                    "
echo "#----------------------------------#"
echo "#          Misc. Information       #"
echo "#----------------------------------#"
echo "                                    "
wget -v
echo "                                    "
nc --version
echo "                                    "
netcat --version
echo "                                    "
python --version
echo "                                    "
gcc --help
echo "                                    "
perl --version
echo "                                    "
cat /etc/sudoers
echo "                                    "
sudo -l 
echo "                                    "
cat /etc/group
echo "                                    "
grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}'
echo "                                    "
awk -F: '($3 == "0") {print}' /etc/passwd
echo "                                    "
for i in `locate -r "bin$"`; do find $i \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null; done 
echo "                                    "
echo "+----------------------------------+"
echo "+        BASH Histroy Cleanup      +"
echo "+----------------------------------+"
echo "                                  "
echo "[+] Cleaning up..."
touch ~/.bash_history
echo "Script has been completed!"

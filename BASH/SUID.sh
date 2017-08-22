echo "#------------------------------------------------#"
echo "#         SUID Files Enumeration Script          #"
echo "#------------------------------------------------#"
echo "                                                 "

#Find SUID files and store them in SUID_FILES.txt
echo "[+] Dumping SUID files to SUID_FILES.txt.."
find / \( -perm -4000 \) -exec ls -ld {} \; 2>/dev/null | awk '{print $9}' > SUID_FILES.txt
sleep 1

#loop through common linux binaries and then remove them from SUID_FILES.txt
echo "[+] Trimming SUID_FILES.txt..."
for bname in '/umount/d' '/su/d' '/mount/d' '/sudo/d' '/passwd/d' '/exim4/d' '/chfn/d' '/chsh/d' '/procmail/d' '/newgrp/d' '/ping/d' '/ntfs-3g/d' '/pppd/d' '/pkexec/d' '/ssh-keysign/d'
do
  sed -i $bname ./SUID_FILES.txt
done
sleep 1

echo "[+] Preform strings on the following binaries.."
echo "                                                  "  
echo "#------------------------------------------------#"
for line in $(cat SUID_FILES.txt); do                              
echo " * "$line
done 
echo "#------------------------------------------------#"
echo "                                                  " 
sleep 5

# Perform string command on uncommon SUID binaries
for line in $(cat SUID_FILES.txt); do 
  echo "             "
  echo "#------------------------------------------------#"
  echo $line
  echo "#------------------------------------------------#"
  strings $line
  echo "                                                  "
  sleep 5
done
echo "                                                  " 
echo "#------------------------------------------------#"
echo "#           Done. Happy hunting!                 #"
echo "#------------------------------------------------#"



echo "##################################"
echo "#  SUID Files enumeration Script #"
echo "#       By @ihack4falafel        #"
echo "##################################"
echo "                                  "
echo "                                  "
echo "[+] Dumping suid files to SUID_FILES.txt..."
sleep 10
#Find SUID files and store them in SUID_FILES.txt
find / \( -perm -4000 \) -exec ls -ld {} \; 2>/dev/null | awk '{print $9}' > SUID_FILES.txt

echo "[+] Trimming SUID_FILES.txt..."
sleep 10
#loop through common linux binaries and then remove them from SUID_FILES.txt
for bname in '/umount/d' '/su/d' '/mount/d' '/sudo/d' '/passwd/d' '/exim4/d' '/chfn/d' '/chsh/d' '/procmail/d' '/newgrp/d'
do
  sed -i $bname ./SUID_FILES.txt
done

echo "[+] Preform strings on the following binaries.."
echo "                                  "  
echo "##################################" 
for line in $(cat SUID_FILES.txt); do                              
echo "   "$line
done 
echo "##################################" 
echo "                                  " 
sleep 10

# string uncommon SUID binaries
for line in $(cat SUID_FILES.txt); do 
  echo "             "
  echo "##################################"
  echo $line
  echo "##################################"
  strings $line
  echo "                                  "
  sleep 5
done
echo "                                  "
echo "##################################"
echo "@@@@@@@Done. happy hunting!@@@@@@@"
echo "##################################"



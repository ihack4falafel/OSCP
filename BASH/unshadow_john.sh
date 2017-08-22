#make sure you run this script from same directory where passwd.txt shadow.txt reside
unshadow passwd.txt shadow.txt > hashes.txt
john --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt

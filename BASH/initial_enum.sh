# check for IP argument
if [ -z "$1" ]; then
  echo "[*] Usage: $0 <IP Address>"
  exit 1
fi

# check if packages are installed
if [ ! type nmap &> /dev/null && ! type nikto &> /dev/null && ! type dirb &> /dev/null && ! locate enum4linux &> /dev/null]; then
  echo "You're missing one or more of the following:"
  echo "--------------------------------------------"
  echo "- nmap"
  echo "- nikto"
  echo "- dirb"
  echo "- enum4linux"
  echo "Please install them and rerun the script..."
  exit 0
fi

# go ahead and start scanning
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@         TCP Scan         @"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                            "
nmap -p- -A $1
echo "                            "
echo "                            "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@        Nikto Scan        @"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                            "
nikto -h http://$1/
echo "                            "
echo "                            "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@        Dirb Scan         @"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                            "
dirb http://$1/ /usr/share/wordlists/dirb/big.txt
echo "                            "
echo "                            "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@       Enum4linux         @"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                            "
enum4linux $1
echo "                            "
echo "                            "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@       Enum4linux         @"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                            "




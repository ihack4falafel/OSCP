# check for IP argument
if [ -z "$1" ]; then
  echo "[*] Usage: $0 <IP Address>"
  exit 1
fi

# check if packages are installed
if [ ! type nmap &> /dev/null ]; then
  echo "                                            "
  echo "Please install nmap and rerun the script."
  echo "                                            "
  exit 0
fi

if [ ! type nikto &> /dev/null ]; then
  echo "                                            "
  echo "Please install nikto and rerun the script."
  echo "                                            "
  exit 0
fi

if [ ! type dirb &> /dev/null ]; then
  echo "                                            "
  echo "Please install dirb and rerun the script."
  echo "                                            "
  exit 0
fi

if [ ! locate enum4linux &> /dev/null ]; then
  echo "                                            "
  echo "Please install enum4linux and rerun the script."
  echo "                                            "
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
echo "@   Done. happy hunting!   @"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                            "


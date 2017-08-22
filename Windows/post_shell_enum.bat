systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
hostname
echo %username%
net users
ipconfig /all
route print
arp -a
netstat -ano
netsh firewall show state
netsh firewall show config
schtasks /query /fo LIST /v
tasklist /svc
net start
DRIVERQUERY

ipconfig /release
netsh interface ip set address name="LAN" source=static 192.168.1.2 255.255.255.0 192.168.1.1
netsh interface ip set dns name="LAN" static 192.168.1.1
exit
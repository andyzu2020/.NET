
ipconfig /release
netsh interface ip set address name="LAN" source=dhcp
netsh interface ip set dns name="LAN" source=dhcp
exit 
@echo off
setlocal

:: Variables for IP address, subnet mask, gateway, and DNS servers.
set IPAddr=192.168.0.111
set SubnetMask=255.255.255.0
set Gateway=0.0.0.0
set PrimaryDNS=0.0.0.0
set SecondaryDNS=0.0.0.0

:: Adapter name can be found by running 'netsh interface ipv4 show config'
set AdapterName="Local Area Connection"

:: Apply the settings
if "%IPAddr%"=="0.0.0.0" (
    netsh interface ipv4 set address name=%AdapterName% source=dhcp
) else (
    netsh interface ipv4 set address name=%AdapterName% static %IPAddr% %SubnetMask% %Gateway%
)

:: Check if DNS should be automatic or static
if "%PrimaryDNS%"=="0.0.0.0" (
    netsh interface ipv4 set dns name=%AdapterName% source=dhcp
) else (
    netsh interface ipv4 set dns name=%AdapterName% static %PrimaryDNS% primary
    netsh interface ipv4 add dns name=%AdapterName% %SecondaryDNS% index=2
)

echo IP settings applied successfully!

pause

endlocal

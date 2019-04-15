# Xefi
Xefi is a batch script for information gathering on current PC.

# Usage
Launch:
> src/xefi.bat

It will save everything into special folder with the name:
> %computername%_%random%

# Features
These commands will be parsed:

 1. systeminfo
 2. wmic cpu
 3. wmic bios
 4. wmic voltage
 5. wmic os
 6. wmic timezone
 7. *IP function*
 8. ver
 9. vol
 10. ipconfig /all
 11. ipconfig /displaydns
 12. net user
 13. assoc
 14. set
 15. compact
 16. ftype
 17. netstat -an
 18. powercfg /a
 19. tasklist
 20. tree

# Screenshot
![screenshot](https://i.imgur.com/xdKOF7c.png)
![logs](https://i.imgur.com/f2sFesu.png)

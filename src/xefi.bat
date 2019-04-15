:: Programmed by hXR16F
:: hXR16F.ar@gmail.com

@echo off
title Xefi
setlocal EnableDelayedExpansion
color 0B

:: Disable some features to speed up capture process (disables also IP function)
set fast=0

:: Enable or disable function to obtain external IP address
set ip_func=1

rem set "compname=%computername%_%date%_%time:~0,2%-%time:~3,2%-%time:~6,2%"
set "compname=%computername%_%random%"
set "curr_path=%cd%"

if exist "%compname%" (
	rd /s /q "%compname%"
)
if not exist "%compname%" (
	md "%compname%"
)

:main
	cd %homedrive%\Users\%username%
	
	if not %fast% equ 1 (
		title Xefi & echo systeminfo
		if exist "systeminfo.txt" del /F /Q "systeminfo.txt"
		systeminfo >> systeminfo.txt
		move "systeminfo.txt" "%curr_path%\%compname%" > nul
	)
	
	title Xefi & echo cpu
	if exist "wmic-cpu.txt" del /F /Q "wmic-cpu.txt"
	wmic cpu >> wmic-cpu.txt
	move "wmic-cpu.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo bios
	if exist "wmic-bios.txt" del /F /Q "wmic-bios.txt"
	wmic bios >> wmic-bios.txt
	move "wmic-bios.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo voltage
	if exist "wmic-voltage.txt" del /F /Q "wmic-voltage.txt"
	wmic voltage >> wmic-voltage.txt
	move "wmic-voltage.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo os
	if exist "wmic-os.txt" del /F /Q "wmic-os.txt"
	wmic os >> wmic-os.txt
	move "wmic-os.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo timezone
	if exist "wmic-timezone.txt" del /F /Q "wmic-timezone.txt"
	wmic timezone >> wmic-timezone.txt
	move "wmic-timezone.txt" "%curr_path%\%compname%" > nul
	
	if not %fast% equ 1 (
		if %ip_func% equ 1 (
			title Xefi & echo ip
			if exist "ip.txt" del /F /Q "ip.txt"
			cd %curr_path%
			call _wget.dll -q -O "%temp%\_ip" "http://api.ipify.org/"
			if exist "%temp%\_ip" (
				for /f "tokens=1*" %%a in (%temp%\_ip) do (
					echo %%a > ip.txt
				)
			)
			move "ip.txt" "%compname%" > nul
			if exist "%temp%\_ip" del /F /Q "%temp%\_ip"
			cd %homedrive%\Users\%username%
		)
	)
	
	title Xefi & echo ver
	if exist "ver.txt" del /F /Q "ver.txt"
	ver >> ver.txt
	move "ver.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo vol
	if exist "vol.txt" del /F /Q "vol.txt"
	vol >> vol.txt
	move "vol.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo ipconfig
	if exist "ipconfig.txt" del /F /Q "ipconfig.txt"
	ipconfig /all >> ipconfig.txt
	ipconfig /displaydns >> ipconfig.txt
	move "ipconfig.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo net-user
	if exist "net-user.txt" del /F /Q "net-user.txt"
	net user >> net-user.txt
	move "net-user.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo assoc
	if exist "assoc.txt" del /F /Q "assoc.txt"
	assoc >> assoc.txt
	move "assoc.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo set
	if exist "set.txt" del /F /Q "set.txt"
	set >> set.txt
	move "set.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo compact
	if exist "compact.txt" del /F /Q "compact.txt"
	compact >> compact.txt
	move "compact.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo ftype
	if exist "ftype.txt" del /F /Q "ftype.txt"
	ftype >> ftype.txt
	move "ftype.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo netstat
	if exist "netstat-an.txt" del /F /Q "netstat-an.txt"
	netstat -an >> netstat-an.txt
	move "netstat-an.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo powercfg
	if exist "powercfg.txt" del /F /Q "powercfg.txt"
	powercfg /a >> powercfg.txt
	move "powercfg.txt" "%curr_path%\%compname%" > nul
	
	title Xefi & echo tasklist
	if exist "tasklist.txt" del /F /Q "tasklist.txt"
	tasklist >> tasklist.txt
	move "tasklist.txt" "%curr_path%\%compname%" > nul
	
	if not %fast% equ 1 (
		title Xefi & echo tree
		if exist "tree.txt" del /F /Q "tree.txt"
		tree /A /F >> tree.txt
		move "tree.txt" "%curr_path%\%compname%" > nul
	)
	
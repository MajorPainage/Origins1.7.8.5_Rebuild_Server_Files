@echo off

"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" -u root -ppassword dayz_origins -e "call pMain" 
start "arma2" /min "Expansion\beta\arma2oaserver.exe" -port=2315 "-config=dayz_1.origins.tavi\config.cfg" "-cfg=dayz_1.origins.tavi\basic.cfg" "-profiles=dayz_1.origins.tavi" -name=dayz_1.origins.tavi "-mod=@DayzOriginsP;@dayz_1.origins.tavi" -cpuCount=4 -maxMem=1578 -exThreads=1

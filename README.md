How to install server files:
===================================

All credit goes to MDark for all the hard work to make this mod available.
<br><br>
1) Download DayZ_Origins Version 1.7.8.5 and install it in your OA folder.<br>
2) Download these github files.<br>
3) Extract the files into your OA folder.<br>
4) Double-click the install.cmd file to make the @DayZOriginsP folder.<br>
5) Set up your MySQL Server, create the Database "dayz_origins" (utf8 -- UTF-8 Unicode + utf8_general_ci) and execute my SQLfile\DayZ_Origins.sql on it.<br>
6) Also execute the db sql updates in the same folder.<br>
7) Edit the config.cfg and hive.ini in the folder "dayz_1.origins.tavi".<br>
8) Edit originsserver.cmd and change the path to your MySQL Server (it must be in the hidden path "Program Files")<br>
9) Double-click the originsserver.cmd to start the server.
<br><br>
(Will update the instructions and try to make them clearer)
<br><br>
How to Update:<br><br>

	To update from the last version, simply copy the next folders and files from the pack to your gamedirectory and overwrite the old ones.<br>
<br>
	@dayz_1.origins.tavi<br>
	installP<br>
	MPMissions	(reinsert youre PlayerID for admintools)<br>
	originsclient.cmd<br>
	originsserver.cmd<br>
	update.cmd<br>
	 <br>
	run update.cmd <br>
	run update.sql on your origins Database<br>
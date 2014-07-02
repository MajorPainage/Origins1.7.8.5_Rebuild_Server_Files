OriginsP Version 4


Clientinstall:

1.	Download DayZ_Origins Version 1.785
2.	install it in your arma2oa folder
3.	copy the folder installP and the files install.cmd and originsclient.cmd in your Arma2OA folder 
4.	run install.cmd to make the @DayZOriginsP folder
5.	start the game with originsclient.cmd
	

How to Update:

	for update from the last Version, simply copy the next folders and files from the pack to your gamedirectory and overwrite the old ones.

	@dayz_1.origins.tavi
	installP
	MPMissions	(reinsert youre PlayerID for admintools)
	originsclient.cmd
	originsserver.cmd
	update.cmd
	 
	run update.cmd 
	run update.sql on your origins Database


How to install:

1.	Download DayZ_Origins Version 1.785
2.	install it in your Arma2OA folder
3.	copy all of my files in your Arma2OA folder and overwrite the old ones
4.	use install.cmd to make the @DayZOriginsP folder
5.	set up your MySQL Server, create the Database "dayz_origins" (utf8 -- UTF-8 Unicode + utf8_general_ci) and execute my SQLfile\DayZ_Origins.sql on it
6.	edit the config.cfg and hive.ini in the folder "dayz_1.origins.tavi"
7.	edit originsserver.cmd and change the path to your MySQL Server (it must be in the hidden path "Program Files")
8.	start the Server with the "Originsserver.cmd"
9.	start your Arma2OA Beta with -mod=@dayz_originsP and connect with the Server 
    or use the "originsclient.cmd"


Have Fun.

MDark

Thanks for MajorPainage and his work.
https://github.com/MajorPainage
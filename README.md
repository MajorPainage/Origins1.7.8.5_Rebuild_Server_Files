Requirements:
===================================

- Download Arma2 and Operation Arrowhead on Steam.<br>
- Copy ALL Arma2 files and folder and paste them in the Operation Arrowhead folder.<br>


How To Install Origin Server Files:
===================================
<b>How to Install</b>
- Download DayZ_Origins Version 1.7.8.5 and install it in your OA folder.<br>
- Download these github files.<br>
- Extract the files into your OA folder.<br>
- Double-click the install.cmd file to make the @DayZOriginsP folder.<br>
- Set up your MySQL Server, create the Database "dayz_origins" (utf8 -- UTF-8 Unicode + utf8_general_ci) and execute my SQLfile\DayZ_Origins.sql on it.<br>
- Also execute the db sql updates in the same folder.<br>
- Edit the config.cfg and hive.ini in the folder "dayz_1.origins.tavi".<br>
- Edit originsserver.cmd and change the path to your MySQL Server (it must be in the hidden path "Program Files")<br>
- Double-click the originsserver.cmd to start the server.<br>
<br>

<b>How to Update:</b>
- To update from the last version, simply copy the next folders and files from the pack to your gamedirectory and overwrite the old ones.<br>
<br>
	- @dayz_1.origins.tavi<br>
	- installP<br>
	- MPMissions	(reinsert youre PlayerID for admintools)<br>
	- originsserver.cmd<br>
	- update.cmd<br>
	<br>
	- run update.cmd <br>
	- run update.sql on your origins Database<br>


Optional Adjustments
============================
<b>Teleport and Vehicle Eject Fix</b><br>
An anti cheat detection is built in to prevent hacker from teleporting, but it also ejects you from vehicles like planes if your using the the admin menu and enabling the vehicle boost.
<br><br>
Edit: Origins\MPMissions\dayz_1.origins.tavi\Debug\player_spawn_2.sqf<br>
Look at the bottom of the file for:<br>
<pre>_myPos = player getVariable["lastPos",[]];
if (count _myPos > 0) then {
player setVariable["lastPos",_mylastPos, true];
player setVariable["lastPos",[]];
};
_lastPos = getPosATL player;
if (player == vehicle player) then {
if (_mylastPos distance _lastPos > 200) then {
if (alive player) then {
player setPosATL _mylastPos;
};
};
} else {
if (_mylastPos distance _lastPos > 800) then {
if (alive player) then {
player setPosATL _mylastPos;
};</pre>
Change 200 to 20000 and 800 to 80000.<br>
Because it's a big map, something like 32000 across, I just added 2 zeros to the end of the number.<br>
Later you can remove the 2 zeros to enable the anti cheat teleport.<br>


Credits
============================
All credit goes to MDark for all the hard work to make this mod available.

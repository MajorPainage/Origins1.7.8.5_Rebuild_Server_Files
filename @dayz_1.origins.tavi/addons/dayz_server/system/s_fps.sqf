while {isServer} do {
while {isServer} do {
while {isServer} do {
_arrayAllObj = [];
_numDeadL 			= {local _x} count allDead;
_arrayAllObj 		= +allMissionObjects "";
_countAllObjM 		= (count allMissionObjects "");
_countAnimal		= count (allMissionObjects "Animal");
_toprint2 			= format["_countAllObjM: %1",_countAllObjM];

_alive 			= {isPlayer _x} count entities "CAManBase";
_zombies 			= count entities "zZombie_Base";
_zombiesA 			= {alive _x} count entities "zZombie_Base";
_loot 				= count allMissionObjects "WeaponHolder";
_lootL 			= {local _x} count allMissionObjects "WeaponHolder";
_dayz_zombiesLocal = {local _x} count entities "zZombie_Base";
_dead 				= count allDead;

diag_log ("DEBUG FPS  : " + str(diag_fps) + " AND " + str(_toprint2) + "Players: " + str(_alive) + "_zombies:" + str(_zombies) + "_zombiesA:" + str(_zombiesA) + "_loot:" + str(_loot) + "_lootL:" + str(_lootL) + "_dayz_zombiesLocal:" + str(_dayz_zombiesLocal) + "_dead:" + str(_dead) + "_numDeadL:" + str(_numDeadL) + "Animal=" + str(_countAnimal));

sleep 181;
};
sleep 181;
};
sleep 181;
};
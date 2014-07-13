[] execVM "\z\addons\dayz_server\system\s_fps.sqf"; 

dayz_versionNo = 		getText(configFile >> "CfgMods" >> "DayZ" >> "version");
dayz_hiveVersionNo = 	getNumber(configFile >> "CfgMods" >> "DayZ" >> "hiveVersion");

if ((count playableUnits == 0) and !isDedicated) then {
isSinglePlayer = true;
};

waitUntil{initialized};
waituntil {!isnil "bis_fnc_init"};
bb_base_level1b = [];
bb_base_level2b = [];
bb_base_level3b = [];
bb_base_level1g = [];
bb_base_level2g = [];
bb_base_level1f = [];
bb_base_level2f = [];
bb_base_level3f = [];
ori_servObjMonitor = [];
_newinvhouse = [];
_dobav = true;
_dobavL = true;
_dobavR = true;
_fnc_dump = { 
diag_log format ["Exec Time server_monitor = %1",_this];
};
_t1 = diag_tickTime; 

diag_log "HIVE: Starting";





_key = format["CHILD:302:%1:",dayZ_instance];
_data = "HiveEXT" callExtension _key;
diag_log format ["_data = %1",_data];


diag_log "HIVE: Request sent";


_result = call compile format ["%1",_data];
_status = _result select 0;
diag_log format ["_result = %1",_result];

_key2 = format["CHILD:500:%1:",(_result select 2)];
_data2 = "HiveEXT" callExtension _key2;
diag_log format ["_data2 = %1",_data2];

_key3 = format["CHILD:500:%1:[""object.object_data""]:",_result select 2];
_data3 = "HiveEXT" callExtension _key3;
diag_log format ["_data3 = %1",_data3];

_key2 = format["CHILD:500:%1:",(_result select 2)];
_data2 = "HiveEXT" callExtension _key2;
diag_log format ["_data2 = %1",_data2];

_myArray = [];

if (_status == "ObjectStreamStart") then {
_val = _result select 1;

diag_log ("HIVE: Commence Object Streaming...");
for "_i" from 1 to _val do {
_data = "HiveEXT" callExtension _key;

_result = call compile format ["%1",_data];

_status = _result select 0;
_myArray set [count _myArray,_result];

};

};

_countr = 0;		
{


_countr = _countr + 1;

_idKey = 	_x select 1;
_type =		_x select 2;
_ownerID = 	_x select 3;



if (_type == "wooden_shed_lvl_1") 	then { bb_base_level1b set [count bb_base_level1b, _ownerID]; };
if (_type == "log_house_lvl_2") 	then { bb_base_level2b set [count bb_base_level2b, _ownerID]; };
if (_type == "wooden_house_lvl_3") 	then { bb_base_level3b set [count bb_base_level3b, _ownerID]; };

if (_type == "large_shed_lvl_1") 	then { bb_base_level1b set [count bb_base_level1b, _ownerID]; };
if (_type == "small_house_lvl_2") 	then { bb_base_level2b set [count bb_base_level2b, _ownerID]; };
if (_type == "big_house_lvl_3") 	then { bb_base_level3b set [count bb_base_level3b, _ownerID]; };

if (_type == "small_garage") 		then { bb_base_level1g set [count bb_base_level1g, _ownerID]; };
if (_type == "big_garage") 			then { bb_base_level2g set [count bb_base_level2g, _ownerID]; };

if (_type == "object_x") 	then { bb_base_level1b set [count bb_base_level1b, _ownerID]; };

_worldspace = _x select 4;
_dir = 0;
_pos = [0,0,0];
_wsDone = false;
if (count _worldspace >= 2) then
{
_dir = _worldspace select 0;
if (count (_worldspace select 1) == 3) then {
_pos = _worldspace select 1;
_wsDone = true;
}
};			
if (!_wsDone) then {
if (count _worldspace >= 1) then { _dir = _worldspace select 0; };
_pos = [getMarkerPos "center",0,4000,10,0,2000,0] call BIS_fnc_findSafePos;
if (count _pos < 3) then { _pos = [_pos select 0,_pos select 1,0]; };
diag_log ("MOVED OBJ: " + str(_idKey) + " of class " + _type + " to pos: " + str(_pos));
};

_intentory=	_x select 5;
_hitPoints=	_x select 6;
_fuel =		_x select 7;
_damage = 	_x select 8;

if (_damage < 1) then {

_dobav = true;
_dobavL = true;
_dobavR = true;

_object = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
_object setVariable ["lastUpdate",time];
_object setVariable ["ObjectID", _idKey, true];
_object setVariable ["CharacterID", _ownerID, true];


clearWeaponCargoGlobal  _object;
clearMagazineCargoGlobal  _object;

if ((_object isKindOf "TentStorage") or (_object isKindOf "TentStorageR")) then {
_pos set [2,0];
_object setpos _pos;
};
_object setdir _dir;
_object setDamage _damage;
if (count _worldspace > 2) then
{
_object setVectorUp (_worldspace select 2);

};

if (!(_type in ["wooden_shed_lvl_1","log_house_lvl_2","wooden_house_lvl_3","large_shed_lvl_1","small_house_lvl_2","big_house_lvl_3","small_garage","big_garage","object_x"])) then {

if (count _intentory > 0) then {

_objWpnTypes = (_intentory select 0) select 0;
_objWpnQty = (_intentory select 0) select 1;
_countr = 0;					
{
_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
if (_isOK) then {
_block = 	getNumber(configFile >> "CfgWeapons" >> _x >> "stopThis") == 1;
if (!_block) then {
_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
};
};
_countr = _countr + 1;
} forEach _objWpnTypes; 


_objWpnTypes = (_intentory select 1) select 0;
_objWpnQty = (_intentory select 1) select 1;
_countr = 0;
{
_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
if (_isOK) then {
_block = 	getNumber(configFile >> "CfgMagazines" >> _x >> "stopThis") == 1;
if (!_block) then {
_howmany = _objWpnQty select _countr;
if (_type == "log_house_lvl_2")	then {
if (_x == "ItemLimestone") then {
_howmany = _howmany + 1;
_dobav = false;
_dobavL = false;

};
if (_x == "ItemRWood") then {
_howmany = _howmany + 2;
_dobav = false;
_dobavR = false;

};
};
if (_type == "small_house_lvl_2") 	then {
if (_x == "ItemLimestone") then {
_howmany = _howmany + 2;
_dobav = false;
_dobavL = false;

};
if (_x == "ItemRWood") then {
_howmany = _howmany + 1;
_dobav = false;
_dobavR = false;

};
};
_object addMagazineCargoGlobal [_x,_howmany];
};
};
_countr = _countr + 1;
} forEach _objWpnTypes;

if (_dobav) then {
if (_type == "log_house_lvl_2")	then {
_object addMagazineCargoGlobal ["ItemLimestone",1];
_object addMagazineCargoGlobal ["ItemRWood",2];

_dobav = false; _dobavL = false; _dobavR = false;
};
if (_type == "small_house_lvl_2") 	then {
_object addMagazineCargoGlobal ["ItemLimestone",2];
_object addMagazineCargoGlobal ["ItemRWood",1];

_dobav = false; _dobavL = false; _dobavR = false;
};
};
if (!_dobav) then {
if (_dobavL) then {
if (_type == "log_house_lvl_2")	then {
_object addMagazineCargoGlobal ["ItemLimestone",1];
};
if (_type == "small_house_lvl_2") then {
_object addMagazineCargoGlobal ["ItemLimestone",2];
};
};
if (_dobavR) then {
if (_type == "log_house_lvl_2")	then {
_object addMagazineCargoGlobal ["ItemRWood",2];
};
if (_type == "small_house_lvl_2") then {
_object addMagazineCargoGlobal ["ItemRWood",1];
};
};
};

_objWpnTypes = (_intentory select 2) select 0;
_objWpnQty = (_intentory select 2) select 1;
_countr = 0;
{
_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
if (_isOK) then {
_block = 	getNumber(configFile >> "CfgVehicles" >> _x >> "stopThis") == 1;
if (!_block) then {
_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
};
};
_countr = _countr + 1;
} forEach _objWpnTypes;
} else {	
if (_dobav) then {
if (_type == "log_house_lvl_2")	then {
_object addMagazineCargoGlobal ["ItemLimestone",1];
_object addMagazineCargoGlobal ["ItemRWood",2];

_dobav = false;
};
if (_type == "small_house_lvl_2") 	then {
_object addMagazineCargoGlobal ["ItemLimestone",2];
_object addMagazineCargoGlobal ["ItemRWood",1];

_dobav = false;
};
};
};

} else {
_object setVariable["CanBeUpdated",false];
_object setVariable["DaBeUpd",false,true];
};
if (_object isKindOf "AllVehicles") then 
{
{
_selection = _x select 0;
_dam = _x select 1;

if (_selection in["front_plow","wheel_guards","window_guards","windshield_guard"]) then {
_object animate [_selection,_dam];
_object setVariable [_selection,_dam,true];
} else {	
if (_selection in dayZ_explosiveParts and _dam > 0.8) then {_dam = 0.8};
[_object,_selection,_dam] call object_setFixServer;
};

} forEach _hitpoints;
_object setvelocity [0,0,1];
_object setFuel _fuel;
if (getDammage _object == 1) then {
_position = ([(getPosATL _object),0,100,10,0,500,0] call BIS_fnc_findSafePos);
_object setPosATL _position;
};
_object call fnc_vehicleEventHandler;	







};
if (_type in ["wooden_shed_lvl_1","log_house_lvl_2","wooden_house_lvl_3","large_shed_lvl_1","small_house_lvl_2","big_house_lvl_3","small_garage","big_garage","object_x"]) then 
{
_levelhouse = 0;

{
_selection = _x select 0;
_dam = _x select 1;
if(_selection !="passwordtut") then {
if (_dam >= 9999999) then {
_object setVariable ["Name",_selection,false];
_object setVariable ["PName",_selection,true];

} else {
_object animate [_selection,_dam];

if (_type == "object_x") then {
if(_selection == "stage_1") then {
if (_dam == 0) then { _levelhouse = 1; 
bb_base_level1f set [count bb_base_level1f, _ownerID];
};
};
};
if (_type == "wooden_shed_lvl_1") then {
if(_selection == "stage_1") then {
if (_dam == 0) then { _levelhouse = 1; };
};
if(_selection == "stage_2") then {
if (_dam == 0) then { _levelhouse = 2; 
bb_base_level1f set [count bb_base_level1f, _ownerID];
};
};
};
if (_type == "log_house_lvl_2") then {
if(_selection == "stage_1") then {
if (_dam == 0) then { _levelhouse = 1; };
};
if(_selection == "stage_2") then {
if (_dam == 0) then { _levelhouse = 2; };
};
if(_selection == "stage_3") then {
if (_dam == 0) then { _levelhouse = 3; };
};
if(_selection == "stage_4") then {
if (_dam == 0) then { _levelhouse = 4; 
bb_base_level2f set [count bb_base_level2f, _ownerID];
};
};
};
if (_type == "wooden_house_lvl_3") then {
if(_selection == "stage_1") then {
if (_dam == 0) then { _levelhouse = 1; };
};
if(_selection == "stage_2") then {
if (_dam == 0) then { _levelhouse = 2; };
};
if(_selection == "stage_3") then {
if (_dam == 0) then { _levelhouse = 3; };
};
if(_selection == "stage_4") then {
if (_dam == 0) then { _levelhouse = 4; 
bb_base_level3f set [count bb_base_level3f, _ownerID];
};
};
if(_selection == "upgrd_1_stage_1") then {
if (_dam == 0) then { _levelhouse = 5; };
};
if(_selection == "upgrd_1_stage_2") then {
if (_dam == 0) then { _levelhouse = 6; };
};
if(_selection == "upgrd_1_stage_3") then {
if (_dam == 0) then { _levelhouse = 7; };
};
if(_selection == "upgrd_1_stage_4") then {
if (_dam == 0) then { _levelhouse = 8; };
};
};

if (_type == "large_shed_lvl_1") then {
if(_selection == "stage_1") then {
if (_dam == 0) then { _levelhouse = 1; };
};
if(_selection == "stage_2") then {
if (_dam == 0) then { _levelhouse = 2; 
bb_base_level1f set [count bb_base_level1f, _ownerID];
};
};
};
if (_type == "small_house_lvl_2") then {
if(_selection == "stage_1") then {
if (_dam == 0) then { _levelhouse = 1; };
};
if(_selection == "stage_2") then {
if (_dam == 0) then { _levelhouse = 2; };
};
if(_selection == "stage_3") then {
if (_dam == 0) then { _levelhouse = 3; };
};
if(_selection == "stage_4") then {
if (_dam == 0) then { _levelhouse = 4; 
bb_base_level2f set [count bb_base_level2f, _ownerID];
};
};
};
if (_type == "big_house_lvl_3") then {
if(_selection == "stage_1") then {
if (_dam == 0) then { _levelhouse = 1; };
};
if(_selection == "stage_2") then {
if (_dam == 0) then { _levelhouse = 2; };
};
if(_selection == "stage_3") then {
if (_dam == 0) then { _levelhouse = 3; };
};
if(_selection == "stage_4") then {
if (_dam == 0) then { _levelhouse = 4; 
bb_base_level3f set [count bb_base_level3f, _ownerID];
};
};
if(_selection == "upgrd_1_stage_1") then {
if (_dam == 0) then { _levelhouse = 5; };
};
if(_selection == "upgrd_1_stage_2") then {
if (_dam == 0) then { _levelhouse = 6; };
};
if(_selection == "upgrd_1_stage_3") then {
if (_dam == 0) then { _levelhouse = 7; };
};
if(_selection == "upgrd_1_stage_4") then {
if (_dam == 0) then { _levelhouse = 8; };
};
};

if (_type == "small_garage") then {
if(_selection == "stage_1") then {
if (_dam == 0) then { _levelhouse = 1; };
};
if(_selection == "stage_2") then {
if (_dam == 0) then { _levelhouse = 2; };
};
if(_selection == "stage_3") then {
if (_dam == 0) then { _levelhouse = 3; };
};
if(_selection == "stage_4") then {
if (_dam == 0) then { _levelhouse = 4; };
};
};
if (_type == "big_garage") then {
if(_selection == "stage_1") then {
if (_dam == 0) then { _levelhouse = 1; };
};
if(_selection == "stage_2") then {
if (_dam == 0) then { _levelhouse = 2; };
};
if(_selection == "stage_3") then {
if (_dam == 0) then { _levelhouse = 3; };
};
if(_selection == "stage_4") then {
if (_dam == 0) then { _levelhouse = 4; };
};
};
};
} else {
_object setVariable ["passwordtut",_dam,false];
};

} forEach _hitpoints;
_object setVariable ["Slevelhouse",_levelhouse,false];
_object setVariable ["SOwner", _ownerID, false];
_object setVariable ["HObjectID", _idKey, false];
_object setVariable ["levelhouse",_levelhouse,true];

};



ori_servObjMonitor set [count ori_servObjMonitor,_object];





};
} forEach _myArray;




private["_position","_veh","_num","_config","_itemType","_itemChance","_weights","_index","_iArray","_nearBy"];
diag_log "DEBUG: heli chrashed spawn started";
_config = 	configFile >> "CfgBuildingLoot" >> "HeliCrash";
_itemType =	[] + getArray (_config >> "itemType");
_itemChance =	[] + getArray (_config >> "itemChance");

BIS_fnc_selectRandom = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_selectRandom.sqf";

waitUntil{!isNil "fnc_buildWeightedArray"};
waitUntil{!isNil "spawn_loot"};

_weights = [];

_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;


for "_x" from 1 to 8 do {
_position = [getMarkerPos "center",0,10000,10,0,20,1] call BIS_fnc_findSafePos;
_veh = createVehicle ["UH1Wreck_Ori",_position, [], 0, "CAN_COLLIDE"];
diag_log format["DEBUG: heli crashed: %1 %2",_veh,_position];
_veh setVariable ["ObjectID",1,true];
_num = round(random 4) + 3;

ori_servObjMonitor set [count ori_servObjMonitor,_veh];
dayzFire = [_veh,2,time,false,false];
publicVariable "dayzFire";

for "_x" from 1 to _num do {

_index = _weights call BIS_fnc_selectRandom;
if (count _itemType > _index) then {
_iArray = _itemType select _index;
_iArray set [2,_position];
_iArray set [3,5];
_iArray call spawn_loot;
_nearBy = _position nearObjects ["WeaponHolder",20];
{
_x setVariable ["permaLoot",true];
} forEach _nearBy;
};
};
};
diag_log "DEBUG: heli chrashed spawn finished invc=" + str(count _newinvhouse);









start_guardsg01g = {
private["_spawnTaviGroupLeaderg01g","_AISgroupg01g","_x10","_rndCountg01g","_rnd10","_positiong01g","_modelarrayg01g","_startposg01g","_unit10","_units10","_id101"];


east setFriend [west,0];
east setFriend [sideLogic,1];

_AISgroupg01g = createGroup east;   
_modelarrayg01g = ["SectorB_def","SectorB_def","SectorB_def"];

_startposg01g = [22071.4,19157.9];

_positiong01g = [22151.6,19225.3];
_rndCountg01g = 75; 
_rnd = random 1; 
for "_x" from 1 to _rndCountg01g do {
private["_spawnAISg01g","_bodynameig01g","_soldermodelg01g","_spawnTaviGroupLeaderg01g"];
_bodynameig01g = format ["TavianaGuardg01g%1",_x];

if(_x == 1) then {
_soldermodelg01g = _modelarrayg01g select (round(random ((count _modelarrayg01g) - 1)));
_soldermodelg01g createunit [[(_startposg01g select 0),(_startposg01g select 1),0], _AISgroupg01g, "_spawnTaviGroupLeaderg01g = this; TavianaSquadg01g = group this;"];
_spawnTaviGroupLeaderg01g enableAI "TARGET";
_spawnTaviGroupLeaderg01g enableAI "AUTOTARGET";
_spawnTaviGroupLeaderg01g enableAI "MOVE";
_spawnTaviGroupLeaderg01g enableAI "ANIM";
_spawnTaviGroupLeaderg01g enableAI "FSM";
_spawnTaviGroupLeaderg01g allowDammage true;
_spawnTaviGroupLeaderg01g setCombatMode "YELLOW";
_spawnTaviGroupLeaderg01g setBehaviour "STEALTH";
_spawnTaviGroupLeaderg01g setSkill ["aimingAccuracy",1];
_spawnTaviGroupLeaderg01g setSkill ["aimingShake",1];
_spawnTaviGroupLeaderg01g setSkill ["aimingSpeed",1];
_spawnTaviGroupLeaderg01g setSkill ["commanding",1];
_spawnTaviGroupLeaderg01g setSkill ["aimingAccuracy",1];
_spawnTaviGroupLeaderg01g setSkill ["endurance",1];
_spawnTaviGroupLeaderg01g setSkill ["spotDistance",1];
_spawnTaviGroupLeaderg01g setSkill ["spotTime",1];
_spawnTaviGroupLeaderg01g setSkill ["courage",1];
_spawnTaviGroupLeaderg01g setSkill ["reloadSpeed",1];
_spawnTaviGroupLeaderg01g setSkill ["general",1];

_spawnTaviGroupLeaderg01g addweapon "glock17_EP1";
_spawnTaviGroupLeaderg01g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg01g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg01g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg01g addMagazine "ItemBandage";
_spawnTaviGroupLeaderg01g addMagazine "ItemBandage";           
_spawnTaviGroupLeaderg01g addweapon "ItemMap";
_spawnTaviGroupLeaderg01g addweapon "ItemHatchet";
_spawnTaviGroupLeaderg01g addweapon "ItemKnife";

_spawnTaviGroupLeaderg01g addweapon "Sa58V_EP1";
_spawnTaviGroupLeaderg01g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg01g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg01g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg01g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg01g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg01g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg01g selectWeapon "Sa58V_EP1";
_spawnTaviGroupLeaderg01g setVariable ["bodyname",_bodynameig01g,false];
_spawnTaviGroupLeaderg01g setVariable ["delmeplease",_bodynameig01g,false];
_spawnTaviGroupLeaderg01g disableConversation true;
_spawnTaviGroupLeaderg01g setDir (random(360));
_spawnTaviGroupLeaderg01g setdamage 0.01;


} else {
_soldermodelg01g = _modelarrayg01g select (round(random ((count _modelarrayg01g) - 1)));
_soldermodelg01g createunit [[((_startposg01g select 0) + (random(10))),((_startposg01g select 1) + (random(10))),0], _AISgroupg01g, "_spawnAISg01g = this;"];
_spawnAISg01g enableAI "TARGET";
_spawnAISg01g enableAI "AUTOTARGET";
_spawnAISg01g enableAI "MOVE";
_spawnAISg01g enableAI "ANIM";
_spawnAISg01g enableAI "FSM";
_spawnAISg01g allowDammage true;
_spawnAISg01g setCombatMode "YELLOW";
_spawnAISg01g setBehaviour "STEALTH";
_spawnAISg01g setSkill ["aimingAccuracy",1];
_spawnAISg01g setSkill ["aimingShake",1];
_spawnAISg01g setSkill ["aimingSpeed",1];
_spawnAISg01g setSkill ["commanding",1];
_spawnAISg01g setSkill ["aimingAccuracy",1];
_spawnAISg01g setSkill ["endurance",1];
_spawnAISg01g setSkill ["spotDistance",1];
_spawnAISg01g setSkill ["spotTime",1];
_spawnAISg01g setSkill ["courage",1];
_spawnAISg01g setSkill ["reloadSpeed",1];
_spawnAISg01g setSkill ["general",1];
if((_x >= 2) and (_x <= 6)) then {
_spawnAISg01g addweapon "AK_47_M";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g selectWeapon "AK_47_M";
};
if((_x >= 7) and (_x <= 11)) then {
_spawnAISg01g addweapon "AK_47_M";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g selectWeapon "AK_47_M";
};
if((_x >= 12) and (_x <= 16)) then {
_spawnAISg01g addweapon "AK_47_M";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g addMagazine "30Rnd_762x39_AK47";
_spawnAISg01g selectWeapon "AK_47_M";
};
if((_x >= 17) and (_x <= 21)) then {
_spawnAISg01g addweapon "G36C_camo";
_spawnAISg01g addMagazine "30Rnd_556x45_G36";
_spawnAISg01g addMagazine "30Rnd_556x45_G36";
_spawnAISg01g addMagazine "30Rnd_556x45_G36";
_spawnAISg01g addMagazine "30Rnd_556x45_G36";
_spawnAISg01g addMagazine "30Rnd_556x45_G36";
_spawnAISg01g addMagazine "30Rnd_556x45_G36";
_spawnAISg01g addMagazine "30Rnd_556x45_G36";
_spawnAISg01g addMagazine "30Rnd_556x45_G36";
_spawnAISg01g selectWeapon "G36C_camo";
};
if((_x >= 22) and (_x <= 26)) then {
_spawnAISg01g addweapon "SVD";
_spawnAISg01g addMagazine "10Rnd_762x54_SVD";
_spawnAISg01g addMagazine "10Rnd_762x54_SVD";
_spawnAISg01g addMagazine "10Rnd_762x54_SVD";
_spawnAISg01g addMagazine "10Rnd_762x54_SVD";
_spawnAISg01g addMagazine "10Rnd_762x54_SVD";
_spawnAISg01g addMagazine "10Rnd_762x54_SVD";
_spawnAISg01g addMagazine "10Rnd_762x54_SVD";
_spawnAISg01g addMagazine "10Rnd_762x54_SVD";
_spawnAISg01g selectWeapon "SVD";
};
if((_x >= 27) and (_x <= 31)) then {
_spawnAISg01g addweapon "FN_FAL";
_spawnAISg01g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg01g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg01g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg01g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg01g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg01g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg01g selectWeapon "FN_FAL";
};
if((_x >= 32) and (_x <= 36)) then {
_spawnAISg01g addweapon "LeeEnfield";
_spawnAISg01g addMagazine "10x_303";
_spawnAISg01g addMagazine "10x_303";
_spawnAISg01g addMagazine "10x_303";
_spawnAISg01g addMagazine "10x_303";
_spawnAISg01g addMagazine "10x_303";
_spawnAISg01g addMagazine "10x_303";
_spawnAISg01g selectWeapon "LeeEnfield";
};
if((_x >= 37) and (_x <= 41)) then {
_spawnAISg01g addweapon "Sa58V_EP1";
_spawnAISg01g addMagazine "30Rnd_762x39_SA58";
_spawnAISg01g addMagazine "30Rnd_762x39_SA58";
_spawnAISg01g addMagazine "30Rnd_762x39_SA58";
_spawnAISg01g addMagazine "30Rnd_762x39_SA58";
_spawnAISg01g addMagazine "30Rnd_762x39_SA58";
_spawnAISg01g addMagazine "30Rnd_762x39_SA58";
_spawnAISg01g addMagazine "30Rnd_762x39_SA58";
_spawnAISg01g addMagazine "30Rnd_762x39_SA58";
_spawnAISg01g selectWeapon "Sa58V_EP1";
};

if(_x >= 42) then {
_spawnAISg01g addweapon "RPK_74";
_spawnAISg01g addMagazine "75Rnd_545x39_RPK";
_spawnAISg01g addMagazine "75Rnd_545x39_RPK";
_spawnAISg01g addMagazine "75Rnd_545x39_RPK";
_spawnAISg01g addMagazine "75Rnd_545x39_RPK";
_spawnAISg01g addMagazine "75Rnd_545x39_RPK";
_spawnAISg01g selectWeapon "RPK_74";
};
_spawnAISg01g setVariable ["bodyname",_bodynameig01g,false];		
_spawnAISg01g setVariable ["delmeplease",_bodynameig01g,false];
_spawnAISg01g addEventHandler ["Fired", {_this call player_fired;}];
_spawnAISg01g addEventHandler ["Killed",{_this call delete_guardia;}];
_spawnAISg01g disableConversation true;
_spawnAISg01g setdamage 0.01;
_spawnAISg01g setDir (random(360));
};     
};

diag_log("DEBUG: Spawning " + str(_rndCountg01g) + " Taviana Guards from Group g01g at position " + str(_positiong01g));
diag_log("Taviana Guards spawn Group g01g end");
};


start_civilian1c = {
private["_spawnTaviGroupLeader1c","_AISgroup1c","_spawnAIS1c","_rndCount1c","_rnd10","_position1c","_modelarray1c","_startpos1c","_unit10","_units10","_id101","_wp1c1","_wp1c2","_wp1c3"];


civilian setFriend [east,1];

_AISgroup1c = createGroup civilian;   
_modelarray1c = ["Villager1","Citizen1","Citizen2","Citizen3","Citizen4","Profiteer1","Profiteer2","Profiteer3","Profiteer4","Secretary1","Secretary2","Secretary3","Secretary4"];

_startpos1c = [22352,19452];
_position1c = [22352,19452];
_rndCount1c = 11; 

for "_x" from 1 to _rndCount1c do {
private["_spawnAIS1c","_bodynamei1c","_soldermodel1c","_spawnTaviGroupLeader1c"];
_bodynamei1c = format ["TavianaCivil1c%1",_x];

if(_x == 1) then {  
_soldermodel1c = _modelarray1c select 0; 
_soldermodel1c createunit [[22327.8,19798.2,6.28615], _AISgroup1c, "_spawnTaviGroupLeader1c = this; TavianaSquad1c = group this;"];
_spawnTaviGroupLeader1c setPosASL [22325.1,19764.3,6.96147];
_spawnTaviGroupLeader1c setDir 0;
_spawnTaviGroupLeader1c enableAI "MOVE";
_spawnTaviGroupLeader1c enableAI "ANIM";
_spawnTaviGroupLeader1c enableAI "FSM";
_spawnTaviGroupLeader1c enableAI "TARGET";
_spawnTaviGroupLeader1c enableAI "AUTOTARGET";
_spawnTaviGroupLeader1c allowDammage true;
_spawnTaviGroupLeader1c setBehaviour "CARELESS";



_spawnTaviGroupLeader1c setVariable ["bodyname",_bodynamei1c,false];
_spawnTaviGroupLeader1c setVariable ["delmeplease",_bodynamei1c,false];
_spawnTaviGroupLeader1c disableConversation true;







} else { 
if(_x == 2) then {
_soldermodel1c = _modelarray1c select 1;
_soldermodel1c createunit [[22325.1,19764.3,6.96147], _AISgroup1c, "_spawnAIS1c = this;"];
_spawnAIS1c setPosASL [22325.1,19764.3,6.96147];
_spawnAIS1c setDir 0; 

};
if(_x == 3) then {
_soldermodel1c = _modelarray1c select 2;
_soldermodel1c createunit [[22296,19758.6,7.7821], _AISgroup1c, "_spawnAIS1c = this;"];
_spawnAIS1c setPosASL [22296,19758.6,7.7821];
_spawnAIS1c setDir 266;
};
if(_x == 4) then {  
_soldermodel1c = _modelarray1c select 3;
_soldermodel1c createunit [[22313.8,19778.2,6.96156], _AISgroup1c, "_spawnAIS1c = this;"];
_spawnAIS1c setPosASL [22313.8,19778.2,6.96156];
_spawnAIS1c setDir 259;
};
if(_x == 5) then { 
_soldermodel1c = _modelarray1c select 4;
_soldermodel1c createunit [[22339.2,19768.1,6.96149], _AISgroup1c, "_spawnAIS1c = this;"];
_spawnAIS1c setPosASL [22339.2,19768.1,6.96149];
_spawnAIS1c setDir 143;
};

if(_x == 6) then { 
_soldermodel1c = _modelarray1c select 5;
_soldermodel1c createunit [[22293.1,19758.8,7.7821], _AISgroup1c, "_spawnAIS1c = this;"];
_spawnAIS1c setPosASL [22293.1,19758.8,7.7821];
_spawnAIS1c setDir 71;
};
if(_x == 7) then { 
_soldermodel1c = _modelarray1c select 9;
_soldermodel1c createunit [[22318,19764.6,6.96147], _AISgroup1c, "_spawnAIS1c = this;"];
_spawnAIS1c setPosASL [22318,19764.6,6.96147];
_spawnAIS1c setDir 9;
};
if(_x == 8) then { 
_soldermodel1c = _modelarray1c select 10;
_soldermodel1c createunit [[22313.5,19781.6,6.96159], _AISgroup1c, "_spawnAIS1c = this;"];
_spawnAIS1c setPosASL [22313.5,19781.6,6.96159];
_spawnAIS1c setDir 180;
};
if(_x == 9) then { 
_soldermodel1c = _modelarray1c select 11;
_soldermodel1c createunit [[22320.8,19784.7,6.96161], _AISgroup1c, "_spawnAIS1c = this;"];
_spawnAIS1c setPosASL [22320.8,19784.7,6.96161];
_spawnAIS1c setDir 114;
};
if(_x == 10) then { 
_soldermodel1c = _modelarray1c select 12;
_soldermodel1c createunit [[22340.2,19771.7,6.96152], _AISgroup1c, "_spawnAIS1c = this;"];
_spawnAIS1c setPosASL [22340.2,19771.7,6.96152];
_spawnAIS1c setDir 180;
};
if(_x >= 11) then { 
_soldermodel1c = _modelarray1c select 9;
_soldermodel1c createunit [[22321.8,19782,6.96159], _AISgroup1c, "_spawnAIS1c = this;"];
_spawnAIS1c setPosASL [22321.8,19782,6.96159];
_spawnAIS1c setDir 346;
};


_spawnAIS1c enableAI "MOVE";
_spawnAIS1c enableAI "ANIM";
_spawnAIS1c enableAI "FSM";
_spawnAIS1c enableAI "TARGET";
_spawnAIS1c enableAI "AUTOTARGET";
_spawnAIS1c allowDammage true;
_spawnAIS1c setBehaviour "CARELESS";

_spawnAIS1c setVariable ["bodyname",_bodynamei1c,false];		
_spawnAIS1c setVariable ["delmeplease",_bodynamei1c,false];
_spawnAIS1c addEventHandler ["Killed",{_this call delete_guardia;}];
_spawnAIS1c disableConversation true;

};     
};

diag_log("DEBUG: Spawning " + str(_rndCount1c) + " Taviana Civilian from Group 1c at position " + str(_position1c));
diag_log("Taviana Civilian spawn Group 1c end");
};

start_guardsg13g = {
private["_spawnTaviGroupLeaderg13g","_AISgroupg13g","_x10","_rndCountg13g","_rnd10","_positiong13g","_modelarrayg13g","_startposg13g","_unit10","_units10","_id101"];
waitUntil{!isNil "BIS_fnc_selectRandom"};

east setFriend [west,0];
east setFriend [sideLogic,1];

_AISgroupg13g = createGroup east;   
_modelarrayg13g = ["SectorZ_def","SectorZ_def","SectorZ_def"];

_startposg13g = [14849.3,9924.72,2.8672];

_positiong13g = [14849.3,9924.72,2.8672];
_rndCountg13g = 11; 
_rnd = random 1; 
for "_x" from 1 to _rndCountg13g do {
private["_spawnAISg13g","_bodynameig13g","_soldermodelg13g","_spawnTaviGroupLeaderg13g"];
_bodynameig13g = format ["TavianaGuardg13g%1",_x];

if(_x == 1) then {
_soldermodelg13g = _modelarrayg13g select (round(random ((count _modelarrayg13g) - 1)));
_soldermodelg13g createunit [[14849.3,9924.72,2.8672], _AISgroupg13g, "_spawnTaviGroupLeaderg13g = this; TavianaSquadg13g = group this;"];

_spawnTaviGroupLeaderg13g enableAI "TARGET";
_spawnTaviGroupLeaderg13g enableAI "AUTOTARGET";
_spawnTaviGroupLeaderg13g enableAI "MOVE";
_spawnTaviGroupLeaderg13g enableAI "ANIM";
_spawnTaviGroupLeaderg13g enableAI "FSM";
_spawnTaviGroupLeaderg13g allowDammage true;
_spawnTaviGroupLeaderg13g setCombatMode "YELLOW";
_spawnTaviGroupLeaderg13g setBehaviour "COMBAT";
_spawnTaviGroupLeaderg13g setSkill ["aimingAccuracy",1];
_spawnTaviGroupLeaderg13g setSkill ["aimingShake",1];
_spawnTaviGroupLeaderg13g setSkill ["aimingSpeed",1];
_spawnTaviGroupLeaderg13g setSkill ["commanding",1];
_spawnTaviGroupLeaderg13g setSkill ["aimingAccuracy",1];
_spawnTaviGroupLeaderg13g setSkill ["endurance",1];
_spawnTaviGroupLeaderg13g setSkill ["spotDistance",1];
_spawnTaviGroupLeaderg13g setSkill ["spotTime",1];
_spawnTaviGroupLeaderg13g setSkill ["courage",1];
_spawnTaviGroupLeaderg13g setSkill ["reloadSpeed",1];
_spawnTaviGroupLeaderg13g setSkill ["general",1];
_spawnTaviGroupLeaderg13g setPosASL [14849.3,9924.72,2.8672];
_spawnTaviGroupLeaderg13g addMagazine "ItemBandage";
_spawnTaviGroupLeaderg13g addMagazine "ItemBandage";           
_spawnTaviGroupLeaderg13g addweapon "Binocular";
_spawnTaviGroupLeaderg13g addweapon "ItemCompass";
_spawnTaviGroupLeaderg13g addweapon "ItemMap";
_spawnTaviGroupLeaderg13g addweapon "ItemHatchet";
_spawnTaviGroupLeaderg13g addweapon "ItemKnife";
_spawnTaviGroupLeaderg13g addweapon "ItemMatchbox";

_spawnTaviGroupLeaderg13g addweapon "Sa58V_EP1";
_spawnTaviGroupLeaderg13g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg13g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg13g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg13g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg13g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg13g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg13g selectWeapon "Sa58V_EP1";
_spawnTaviGroupLeaderg13g addEventHandler ["Fired", {_this call player_fired;}];
_spawnTaviGroupLeaderg13g addmpeventhandler ["Killed",{_this call delete_guardia;}];
_spawnTaviGroupLeaderg13g setVariable ["bodyname",_bodynameig13g,false];
_spawnTaviGroupLeaderg13g setVariable ["delmeplease",_bodynameig13g,false];
_spawnTaviGroupLeaderg13g disableConversation true;
_spawnTaviGroupLeaderg13g setDir 274;
_spawnTaviGroupLeaderg13g setdamage 0.01;






} else {
_soldermodelg13g = _modelarrayg13g select (round(random ((count _modelarrayg13g) - 1)));
if(_x == 2) then { 
_soldermodelg13g createunit [[14848.8,9934.79,2.8672], _AISgroupg13g, "_spawnAISg13g = this;"];
_spawnAISg13g setPosASL [14848.8,9934.79,2.8672];
_spawnAISg13g setDir 255;
};
if(_x == 3) then { 
_soldermodelg13g createunit [[14860.2,9930.76,2.8672], _AISgroupg13g, "_spawnAISg13g = this;"];
_spawnAISg13g setPosASL [14860.2,9930.76,2.8672];
_spawnAISg13g setDir 265;
};
if(_x == 4) then { 
_soldermodelg13g createunit [[14861.2,9925.44,2.8672], _AISgroupg13g, "_spawnAISg13g = this;"];
_spawnAISg13g setPosASL [14838.4,9916.73,2.96353];
_spawnAISg13g setDir 273;
};
if(_x == 5) then { 
_soldermodelg13g createunit [[14820,9914.96,2.8672], _AISgroupg13g, "_spawnAISg13g = this;"];
_spawnAISg13g setPosASL [14820,9914.96,2.8672];
_spawnAISg13g setDir 22;
};
if(_x == 6) then {
_soldermodelg13g createunit [[14848.7,9913.41,2.8672], _AISgroupg13g, "_spawnAISg13g = this;"];
_spawnAISg13g setPosASL [14848.7,9913.41,2.8672];
_spawnAISg13g setDir 338;
};
if(_x == 7) then {   
_soldermodelg13g createunit [[14846,9922.02,6.42387], _AISgroupg13g, "_spawnAISg13g = this;"];
_spawnAISg13g setPosASL [14846,9922.02,6.92387];
_spawnAISg13g setDir 283;
};
if(_x == 8) then { 
_soldermodelg13g createunit [[14854.9,9912.91,6.42387], _AISgroupg13g, "_spawnAISg13g = this;"];
_spawnAISg13g setPosASL [14854.9,9912.91,6.92387];
_spawnAISg13g setDir 315;
};
if(_x == 9) then { 
_soldermodelg13g createunit [[14847.7,9915.74,6.42387], _AISgroupg13g, "_spawnAISg13g = this;"];
_spawnAISg13g setPosASL [14847.7,9915.74,6.92387];
_spawnAISg13g setDir 271;
};
if(_x == 10) then { 
_soldermodelg13g createunit [[14861.3,9939.85,6.42387], _AISgroupg13g, "_spawnAISg13g = this;"];
_spawnAISg13g setPosASL [14861.3,9939.85,6.92387];
_spawnAISg13g setDir 230;
};
if(_x == 11) then { 
"SectorB_gov" createunit [[22128.8,19853.7,14.6355], _AISgroupg13g, "_spawnAISg13g = this;"];
_spawnAISg13g setPosASL [22128.8,19853.7,14.6355];
_spawnAISg13g setDir 129;

_spawnAISg13g addMagazine "ItemBpt_b3";
_spawnAISg13g addMagazine "ItemBpt_h3";
_spawnAISg13g addweapon "Colt1911";
_spawnAISg13g addMagazine "7Rnd_45ACP_1911";
_spawnAISg13g addMagazine "7Rnd_45ACP_1911";
_spawnAISg13g addMagazine "7Rnd_45ACP_1911";

};
if(_x == 11) then { 
_spawnAISg13g enableAI "TARGET";
_spawnAISg13g enableAI "AUTOTARGET";
_spawnAISg13g disableAI "MOVE";
_spawnAISg13g enableAI "ANIM";
_spawnAISg13g disableAI "FSM";
_spawnAISg13g setunitpos "middle";
} else {
_spawnAISg13g enableAI "TARGET";
_spawnAISg13g enableAI "AUTOTARGET";
_spawnAISg13g enableAI "MOVE";
_spawnAISg13g enableAI "ANIM";
_spawnAISg13g enableAI "FSM";
_spawnAISg13g allowDammage true;
_spawnAISg13g setCombatMode "YELLOW";
_spawnAISg13g setBehaviour "COMBAT";
};
_spawnAISg13g setSkill ["aimingAccuracy",1];
_spawnAISg13g setSkill ["aimingShake",1];
_spawnAISg13g setSkill ["aimingSpeed",1];
_spawnAISg13g setSkill ["commanding",1];
_spawnAISg13g setSkill ["aimingAccuracy",1];
_spawnAISg13g setSkill ["endurance",1];
_spawnAISg13g setSkill ["spotDistance",1];
_spawnAISg13g setSkill ["spotTime",1];
_spawnAISg13g setSkill ["courage",1];
_spawnAISg13g setSkill ["reloadSpeed",1];
_spawnAISg13g setSkill ["general",1];
if(_x == 2) then {
_spawnAISg13g addweapon "AKS_74_kobra";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g selectWeapon "AKS_74_kobra";
};
if(_x == 3) then {
_spawnAISg13g addweapon "AK_47_M";
_spawnAISg13g addMagazine "30Rnd_762x39_AK47";
_spawnAISg13g addMagazine "30Rnd_762x39_AK47";
_spawnAISg13g addMagazine "30Rnd_762x39_AK47";
_spawnAISg13g addMagazine "30Rnd_762x39_AK47";
_spawnAISg13g addMagazine "30Rnd_762x39_AK47";
_spawnAISg13g selectWeapon "AK_47_M";
};
if(_x == 4) then {
_spawnAISg13g addweapon "AK_47_M";
_spawnAISg13g addMagazine "30Rnd_762x39_AK47";
_spawnAISg13g addMagazine "30Rnd_762x39_AK47";
_spawnAISg13g addMagazine "30Rnd_762x39_AK47";
_spawnAISg13g selectWeapon "AK_47_M";
};
if(_x == 5) then {
_spawnAISg13g addweapon "AKS_74_kobra";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g selectWeapon "AKS_74_kobra";
};
if((_x >= 6) and (_x < 11)) then {
_spawnAISg13g addweapon "AKS_74_kobra";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g addMagazine "30Rnd_545x39_AK";
_spawnAISg13g selectWeapon "AKS_74_kobra";
};
_spawnAISg13g setVariable ["bodyname",_bodynameig13g,false];		
_spawnAISg13g setVariable ["delmeplease",_bodynameig13g,false];
_spawnAISg13g addEventHandler ["Fired", {_this call player_fired;}];
_spawnAISg13g addEventHandler ["Killed",{_this call delete_guardia;}];
_spawnAISg13g disableConversation true;
_spawnAISg13g setdamage 0.01;

};     
};

diag_log("DEBUG: Spawning " + str(_rndCountg13g) + " Taviana Guards from Group g13g at position " + str(_positiong13g));
diag_log("Taviana Guards spawn Group g13g end");
};

raid_helis = {

private["_AISgroupg14g","_modelarrayg14g","_startposg14g","_position","_positiong14g","_rndCountg14g","_rnd","_bodynameig14g","_soldermodelg14g","_spawnTaviGroupLeaderg14g","_TavianaSquadg14g","_object1AI1","_wp14p1","_wp14p2","_wp14p3","_spawnAISg14g","_object1AI1"];



east setFriend [west,0];
east setFriend [sideLogic,1];

_object1AI1 = createVehicle ["UH1H_Ori", [22924.3,19469.2,0], [], 0, "CAN_COLLIDE"];
_object1AI1 setvelocity [0,0,1];
_object1AI1 setFuel 1;


_object2AI2 = createVehicle ["UH1H_Ori", [22907.7,19524.1,0], [], 0, "CAN_COLLIDE"];
_object2AI2 setvelocity [0,0,1];
_object2AI2 setFuel 1;

_object3AI3 = createVehicle ["UH1H_Ori", [22946.9,19574.9,0], [], 0, "CAN_COLLIDE"];
_object3AI3 setvelocity [0,0,1];
_object3AI3 setFuel 1;


_AISgroupg14g = createGroup east;   
_modelarrayg14g = ["SectorB_def","SectorB_def","SectorB_def","SectorB_def"];

_startposg14g = [22929.3,19469.2,0];


_rndCountg14g = 9; 

for "_x" from 1 to _rndCountg14g do {
_bodynameig14g = format ["TavianaGuardg14g%1",_x];

if(_x == 1) then {
_soldermodelg14g = _modelarrayg14g select 0; 
_soldermodelg14g createunit [[(_startposg14g select 0),(_startposg14g select 1),0], _AISgroupg14g, "_spawnTaviGroupLeaderg14g = this; _TavianaSquadg14g = group this;"];
_spawnTaviGroupLeaderg14g enableAI "TARGET";
_spawnTaviGroupLeaderg14g enableAI "AUTOTARGET";
_spawnTaviGroupLeaderg14g enableAI "MOVE";
_spawnTaviGroupLeaderg14g enableAI "ANIM";
_spawnTaviGroupLeaderg14g enableAI "FSM";
_spawnTaviGroupLeaderg14g allowDammage true;
_spawnTaviGroupLeaderg14g setCombatMode "YELLOW";
_spawnTaviGroupLeaderg14g setBehaviour "STEALTH";
_spawnTaviGroupLeaderg14g setFormation "ECH LEFT";
_spawnTaviGroupLeaderg14g setSkill ["aimingAccuracy",1];
_spawnTaviGroupLeaderg14g setSkill ["aimingShake",1];
_spawnTaviGroupLeaderg14g setSkill ["aimingSpeed",1];
_spawnTaviGroupLeaderg14g setSkill ["commanding",1];
_spawnTaviGroupLeaderg14g setSkill ["endurance",1];
_spawnTaviGroupLeaderg14g setSkill ["spotDistance",1];
_spawnTaviGroupLeaderg14g setSkill ["spotTime",1];
_spawnTaviGroupLeaderg14g setSkill ["courage",1];
_spawnTaviGroupLeaderg14g setSkill ["reloadSpeed",1];
_spawnTaviGroupLeaderg14g setSkill ["general",1];

_spawnTaviGroupLeaderg14g addweapon "glock17_EP1";
_spawnTaviGroupLeaderg14g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg14g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg14g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg14g addMagazine "ItemBandage";
_spawnTaviGroupLeaderg14g addMagazine "ItemBandage";           
_spawnTaviGroupLeaderg14g addweapon "Binocular";
_spawnTaviGroupLeaderg14g addweapon "ItemCompass";
_spawnTaviGroupLeaderg14g addweapon "ItemMap";
_spawnTaviGroupLeaderg14g addweapon "ItemHatchet";
_spawnTaviGroupLeaderg14g addweapon "ItemKnife";
_spawnTaviGroupLeaderg14g addweapon "ItemMatchbox";

_spawnTaviGroupLeaderg14g addweapon "Sa58V_EP1";
_spawnTaviGroupLeaderg14g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg14g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg14g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg14g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg14g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg14g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg14g selectWeapon "Sa58V_EP1";
_spawnTaviGroupLeaderg14g addEventHandler ["Fired", {_this call player_fired;}];
_spawnTaviGroupLeaderg14g addmpeventhandler ["Killed",{_this call delete_guardia;}];
_spawnTaviGroupLeaderg14g setVariable ["bodyname",_bodynameig14g,false];
_spawnTaviGroupLeaderg14g setVariable ["delmeplease",_bodynameig14g,false];
_spawnTaviGroupLeaderg14g disableConversation true;

_spawnTaviGroupLeaderg14g setdamage 0.01;

_spawnTaviGroupLeaderg14g moveInTurret [_object1AI1, [0]];







_wp14p1 = _TavianaSquadg14g addWaypoint [[19651.3,20653.6], 0];
_wp14p1 setWaypointType "MOVE";
_wp14p1 setWaypointBehaviour "COMBAT";
_wp14p1 setWaypointCombatMode "RED";
_wp14p1 setWaypointSpeed "NORMAL";

_wp14p2 = _TavianaSquadg14g addWaypoint [[13736.1,19364.2], 0];
_wp14p2 setWaypointType "MOVE";
_wp14p2 setWaypointBehaviour "COMBAT";
_wp14p2 setWaypointCombatMode "RED";
_wp14p2 setWaypointSpeed "NORMAL";

_wp14p3 = _TavianaSquadg14g addWaypoint [[12222.8,19196.6], 0];
_wp14p3 setWaypointType "MOVE";
_wp14p3 setWaypointBehaviour "COMBAT";
_wp14p3 setWaypointCombatMode "RED";
_wp14p3 setWaypointSpeed "NORMAL";

_wp14p4 = _TavianaSquadg14g addWaypoint [[10126,19341.7], 0];
_wp14p4 setWaypointType "MOVE";
_wp14p4 setWaypointBehaviour "COMBAT";
_wp14p4 setWaypointCombatMode "RED";
_wp14p4 setWaypointSpeed "LIMITED";

_wp14p5 = _TavianaSquadg14g addWaypoint [[10840,17091.1], 0];
_wp14p5 setWaypointType "MOVE";
_wp14p5 setWaypointBehaviour "COMBAT";
_wp14p5 setWaypointCombatMode "RED";
_wp14p5 setWaypointSpeed "LIMITED";

_wp14p6 = _TavianaSquadg14g addWaypoint [[11477.1,14692.7], 0];
_wp14p6 setWaypointType "MOVE";
_wp14p6 setWaypointBehaviour "COMBAT";
_wp14p6 setWaypointCombatMode "RED";
_wp14p6 setWaypointSpeed "LIMITED";

_wp14p7 = _TavianaSquadg14g addWaypoint [[13341.6,13697.9], 0];
_wp14p7 setWaypointType "MOVE";
_wp14p7 setWaypointBehaviour "COMBAT";
_wp14p7 setWaypointCombatMode "RED";
_wp14p7 setWaypointSpeed "LIMITED";

_wp14p8 = _TavianaSquadg14g addWaypoint [[12666.5,12008], 0];
_wp14p8 setWaypointType "MOVE";
_wp14p8 setWaypointBehaviour "COMBAT";
_wp14p8 setWaypointCombatMode "RED";
_wp14p8 setWaypointSpeed "LIMITED";

_wp14p9 = _TavianaSquadg14g addWaypoint [[14189.6,12158.1], 0];
_wp14p9 setWaypointType "MOVE";
_wp14p9 setWaypointBehaviour "COMBAT";
_wp14p9 setWaypointCombatMode "RED";
_wp14p9 setWaypointSpeed "LIMITED";

_wp14p10 = _TavianaSquadg14g addWaypoint [[15149.2,9693.46], 0];
_wp14p10 setWaypointType "MOVE";
_wp14p10 setWaypointBehaviour "COMBAT";
_wp14p10 setWaypointCombatMode "RED";
_wp14p10 setWaypointSpeed "LIMITED";

_wp14p11 = _TavianaSquadg14g addWaypoint [[17537.9,7293.61], 0];
_wp14p11 setWaypointType "MOVE";
_wp14p11 setWaypointBehaviour "COMBAT";
_wp14p11 setWaypointCombatMode "RED";
_wp14p11 setWaypointSpeed "LIMITED";

_wp14p12 = _TavianaSquadg14g addWaypoint [[17597.6,5215.15], 0];
_wp14p12 setWaypointType "MOVE";
_wp14p12 setWaypointBehaviour "COMBAT";
_wp14p12 setWaypointCombatMode "RED";
_wp14p12 setWaypointSpeed "LIMITED";

_wp14p13 = _TavianaSquadg14g addWaypoint [[11365.5,776.035], 0];
_wp14p13 setWaypointType "MOVE";
_wp14p13 setWaypointBehaviour "COMBAT";
_wp14p13 setWaypointCombatMode "RED";
_wp14p13 setWaypointSpeed "LIMITED";

_wp14p14 = _TavianaSquadg14g addWaypoint [[9680.42,1869.75], 0];
_wp14p14 setWaypointType "MOVE";
_wp14p14 setWaypointBehaviour "COMBAT";
_wp14p14 setWaypointCombatMode "RED";
_wp14p14 setWaypointSpeed "LIMITED";

_wp14p15 = _TavianaSquadg14g addWaypoint [[7734.05,3935.38], 0];
_wp14p15 setWaypointType "MOVE";
_wp14p15 setWaypointBehaviour "COMBAT";
_wp14p15 setWaypointCombatMode "RED";
_wp14p15 setWaypointSpeed "LIMITED";

_wp14p16 = _TavianaSquadg14g addWaypoint [[5706.88,5890.49], 0];
_wp14p16 setWaypointType "MOVE";
_wp14p16 setWaypointBehaviour "COMBAT";
_wp14p16 setWaypointCombatMode "RED";
_wp14p16 setWaypointSpeed "LIMITED";

_wp14p17 = _TavianaSquadg14g addWaypoint [[3660.43,6927.98], 0];
_wp14p17 setWaypointType "MOVE";
_wp14p17 setWaypointBehaviour "COMBAT";
_wp14p17 setWaypointCombatMode "RED";
_wp14p17 setWaypointSpeed "LIMITED";

_wp14p18 = _TavianaSquadg14g addWaypoint [[3119.11,7398.69], 0];
_wp14p18 setWaypointType "MOVE";
_wp14p18 setWaypointBehaviour "COMBAT";
_wp14p18 setWaypointCombatMode "RED";
_wp14p18 setWaypointSpeed "LIMITED";

_wp14p19 = _TavianaSquadg14g addWaypoint [[5090.39,8339.55], 0];
_wp14p19 setWaypointType "MOVE";
_wp14p19 setWaypointBehaviour "COMBAT";
_wp14p19 setWaypointCombatMode "RED";
_wp14p19 setWaypointSpeed "LIMITED";

_wp14p20 = _TavianaSquadg14g addWaypoint [[5892.9,8741.93], 0];
_wp14p20 setWaypointType "MOVE";
_wp14p20 setWaypointBehaviour "COMBAT";
_wp14p20 setWaypointCombatMode "RED";
_wp14p20 setWaypointSpeed "LIMITED";

_wp14p21 = _TavianaSquadg14g addWaypoint [[7650.03,7710.3], 0];
_wp14p21 setWaypointType "MOVE";
_wp14p21 setWaypointBehaviour "COMBAT";
_wp14p21 setWaypointCombatMode "RED";
_wp14p21 setWaypointSpeed "LIMITED";

_wp14p22 = _TavianaSquadg14g addWaypoint [[8121.16,6535.33], 0];
_wp14p22 setWaypointType "MOVE";
_wp14p22 setWaypointBehaviour "COMBAT";
_wp14p22 setWaypointCombatMode "RED";
_wp14p22 setWaypointSpeed "LIMITED";

_wp14p23 = _TavianaSquadg14g addWaypoint [[9023.54,5284.11], 0];
_wp14p23 setWaypointType "MOVE";
_wp14p23 setWaypointBehaviour "COMBAT";
_wp14p23 setWaypointCombatMode "RED";
_wp14p23 setWaypointSpeed "LIMITED";

_wp14p24 = _TavianaSquadg14g addWaypoint [[9426.89,3897.17], 0];
_wp14p24 setWaypointType "MOVE";
_wp14p24 setWaypointBehaviour "COMBAT";
_wp14p24 setWaypointCombatMode "RED";
_wp14p24 setWaypointSpeed "LIMITED";

_wp14p25 = _TavianaSquadg14g addWaypoint [[9730.38,5962.24], 0];
_wp14p25 setWaypointType "MOVE";
_wp14p25 setWaypointBehaviour "COMBAT";
_wp14p25 setWaypointCombatMode "RED";
_wp14p25 setWaypointSpeed "LIMITED";

_wp14p26 = _TavianaSquadg14g addWaypoint [[10407.1,6611.61], 0];
_wp14p26 setWaypointType "MOVE";
_wp14p26 setWaypointBehaviour "COMBAT";
_wp14p26 setWaypointCombatMode "RED";
_wp14p26 setWaypointSpeed "LIMITED";

_wp14p27 = _TavianaSquadg14g addWaypoint [[8778.38,8390.4], 0];
_wp14p27 setWaypointType "MOVE";
_wp14p27 setWaypointBehaviour "COMBAT";
_wp14p27 setWaypointCombatMode "RED";
_wp14p27 setWaypointSpeed "LIMITED";

_wp14p28 = _TavianaSquadg14g addWaypoint [[13532.1,9467.56], 0];
_wp14p28 setWaypointType "MOVE";
_wp14p28 setWaypointBehaviour "COMBAT";
_wp14p28 setWaypointCombatMode "RED";
_wp14p28 setWaypointSpeed "LIMITED";

_wp14p29 = _TavianaSquadg14g addWaypoint [[16372.7,10295], 0];
_wp14p29 setWaypointType "MOVE";
_wp14p29 setWaypointBehaviour "COMBAT";
_wp14p29 setWaypointCombatMode "RED";
_wp14p29 setWaypointSpeed "LIMITED";

_wp14p30 = _TavianaSquadg14g addWaypoint [[16320.6,11706.1], 0];
_wp14p30 setWaypointType "MOVE";
_wp14p30 setWaypointBehaviour "COMBAT";
_wp14p30 setWaypointCombatMode "RED";
_wp14p30 setWaypointSpeed "LIMITED";

_wp14p31 = _TavianaSquadg14g addWaypoint [[16628.4,12656.2], 0];
_wp14p31 setWaypointType "MOVE";
_wp14p31 setWaypointBehaviour "COMBAT";
_wp14p31 setWaypointCombatMode "RED";
_wp14p31 setWaypointSpeed "LIMITED";

_wp14p32 = _TavianaSquadg14g addWaypoint [[16048.6,13805.8], 0];
_wp14p32 setWaypointType "MOVE";
_wp14p32 setWaypointBehaviour "COMBAT";
_wp14p32 setWaypointCombatMode "RED";
_wp14p32 setWaypointSpeed "LIMITED";

_wp14p33 = _TavianaSquadg14g addWaypoint [[16395.3,14310.1], 0];
_wp14p33 setWaypointType "MOVE";
_wp14p33 setWaypointBehaviour "COMBAT";
_wp14p33 setWaypointCombatMode "RED";
_wp14p33 setWaypointSpeed "LIMITED";

_wp14p34 = _TavianaSquadg14g addWaypoint [[14975.7,14919.6], 0];
_wp14p34 setWaypointType "MOVE";
_wp14p34 setWaypointBehaviour "COMBAT";
_wp14p34 setWaypointCombatMode "RED";
_wp14p34 setWaypointSpeed "LIMITED";

_wp14p35 = _TavianaSquadg14g addWaypoint [[15235.7,16631.7], 0];
_wp14p35 setWaypointType "MOVE";
_wp14p35 setWaypointBehaviour "COMBAT";
_wp14p35 setWaypointCombatMode "RED";
_wp14p35 setWaypointSpeed "LIMITED";

_wp14p36 = _TavianaSquadg14g addWaypoint [[14825.6,18307.1], 0];
_wp14p36 setWaypointType "CYCLE";
_wp14p36 setWaypointBehaviour "COMBAT";
_wp14p36 setWaypointCombatMode "RED";
_wp14p36 setWaypointSpeed "LIMITED";			

} else {


_soldermodelg14g = "SectorB_def";
_soldermodelg14g createunit [[((_startposg14g select 0) + (random(5))),((_startposg14g select 1) + (random(5))),0], _AISgroupg14g, "_spawnAISg14g = this;"];
_spawnAISg14g enableAI "TARGET";
_spawnAISg14g enableAI "AUTOTARGET";
_spawnAISg14g enableAI "MOVE";
_spawnAISg14g enableAI "ANIM";
_spawnAISg14g enableAI "FSM";
_spawnAISg14g allowDammage true;
_spawnAISg14g setCombatMode "YELLOW";
_spawnAISg14g setBehaviour "STEALTH";
_spawnAISg14g setSkill ["aimingAccuracy",1];
_spawnAISg14g setSkill ["aimingShake",1];
_spawnAISg14g setSkill ["aimingSpeed",1];
_spawnAISg14g setSkill ["commanding",1];
_spawnAISg14g setSkill ["endurance",1];
_spawnAISg14g setSkill ["spotDistance",1];
_spawnAISg14g setSkill ["spotTime",1];
_spawnAISg14g setSkill ["courage",1];
_spawnAISg14g setSkill ["reloadSpeed",1];
_spawnAISg14g setSkill ["general",1];
if(_x == 2) then {
_spawnAISg14g addweapon "AK_47_M";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g selectWeapon "AK_47_M";
_spawnAISg14g moveindriver _object1AI1;
};

if(_x == 3) then {
_spawnAISg14g addweapon "DMR";
_spawnAISg14g addMagazine "20Rnd_762x51_DMR";
_spawnAISg14g addMagazine "20Rnd_762x51_DMR";
_spawnAISg14g addMagazine "20Rnd_762x51_DMR";
_spawnAISg14g selectWeapon "DMR";
_spawnAISg14g moveInTurret [_object1AI1, [1]];
};


if(_x == 4) then {
_spawnAISg14g addweapon "AK_47_M";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g selectWeapon "AK_47_M";
_spawnAISg14g moveindriver _object2AI2;
};

if(_x == 5) then {
_spawnAISg14g addweapon "AK_47_M";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g selectWeapon "AK_47_M";
_spawnAISg14g moveInTurret [_object2AI2, [0]];
};
if(_x == 6) then {
_spawnAISg14g addweapon "AK_47_M";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g selectWeapon "AK_47_M";
_spawnAISg14g moveInTurret [_object2AI2, [1]];
};
if(_x == 7) then {
_spawnAISg14g addweapon "AK_47_M";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g selectWeapon "AK_47_M";
_spawnAISg14g moveindriver _object3AI3;
};

if(_x == 8) then {
_spawnAISg14g addweapon "AK_47_M";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g selectWeapon "AK_47_M";
_spawnAISg14g moveInTurret [_object3AI3, [0]];
};
if(_x == 9) then {
_spawnAISg14g addweapon "AK_47_M";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g addMagazine "30Rnd_762x39_AK47";
_spawnAISg14g selectWeapon "AK_47_M";
_spawnAISg14g moveInTurret [_object3AI3, [1]];
};
_spawnAISg14g setVariable ["bodyname",_bodynameig14g,false];		
_spawnAISg14g setVariable ["delmeplease",_bodynameig14g,false];
_spawnAISg14g addEventHandler ["Fired", {_this call player_fired;}];
_spawnAISg14g addEventHandler ["Killed",{_this call delete_guardia;}];
_spawnAISg14g disableConversation true;
_spawnAISg14g setdamage 0.01;

};     
};

diag_log("DEBUG: Spawning " + str(_rndCountg14g) + " Taviana Guards from Group g14g at position " + str(_startposg14g));
diag_log("Taviana Guards spawn Group g14g end");
};

start_guardsg15g = {
private["_spawnTaviGroupLeaderg15g","_AISgroupg15g","_x10","_rndCountg15g","_rnd10","_positiong15g","_modelarrayg15g","_startposg15g","_unit10","_units10","_id101"];


east setFriend [west,0];
east setFriend [sideLogic,1];

_AISgroupg15g = createGroup east;   
_modelarrayg15g = ["SectorB_def","SectorB_def","SectorB_def"];

_startposg15g = [6386.42,13266.6,0.003];

_positiong15g = [6296.44,13364.2,0];
_rndCountg15g = 15; 
_rnd = random 1; 
for "_x" from 1 to _rndCountg15g do {
private["_spawnAISg15g","_bodynameig15g","_soldermodelg15g","_spawnTaviGroupLeaderg15g"];
_bodynameig15g = format ["TavianaGuardg15g%1",_x];

if(_x == 1) then {
_soldermodelg15g = _modelarrayg15g select (round(random ((count _modelarrayg15g) - 1)));
_soldermodelg15g createunit [[(_startposg15g select 0),(_startposg15g select 1),0], _AISgroupg15g, "_spawnTaviGroupLeaderg15g = this; TavianaSquadg15g = group this;"];
_spawnTaviGroupLeaderg15g enableAI "TARGET";
_spawnTaviGroupLeaderg15g enableAI "AUTOTARGET";
_spawnTaviGroupLeaderg15g enableAI "MOVE";
_spawnTaviGroupLeaderg15g enableAI "ANIM";
_spawnTaviGroupLeaderg15g enableAI "FSM";
_spawnTaviGroupLeaderg15g allowDammage true;
_spawnTaviGroupLeaderg15g setCombatMode "YELLOW";
_spawnTaviGroupLeaderg15g setBehaviour "STEALTH";
_spawnTaviGroupLeaderg15g setSkill ["aimingAccuracy",1];
_spawnTaviGroupLeaderg15g setSkill ["aimingShake",1];
_spawnTaviGroupLeaderg15g setSkill ["aimingSpeed",1];
_spawnTaviGroupLeaderg15g setSkill ["commanding",1];
_spawnTaviGroupLeaderg15g setSkill ["aimingAccuracy",1];
_spawnTaviGroupLeaderg15g setSkill ["endurance",1];
_spawnTaviGroupLeaderg15g setSkill ["spotDistance",1];
_spawnTaviGroupLeaderg15g setSkill ["spotTime",1];
_spawnTaviGroupLeaderg15g setSkill ["courage",1];
_spawnTaviGroupLeaderg15g setSkill ["reloadSpeed",1];
_spawnTaviGroupLeaderg15g setSkill ["general",1];

_spawnTaviGroupLeaderg15g addweapon "glock17_EP1";
_spawnTaviGroupLeaderg15g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg15g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg15g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg15g addMagazine "ItemBandage";
_spawnTaviGroupLeaderg15g addMagazine "ItemBandage";           
_spawnTaviGroupLeaderg15g addweapon "ItemMap";
_spawnTaviGroupLeaderg15g addweapon "ItemHatchet";
_spawnTaviGroupLeaderg15g addweapon "ItemKnife";

_spawnTaviGroupLeaderg15g addweapon "Sa58V_EP1";
_spawnTaviGroupLeaderg15g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg15g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg15g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg15g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg15g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg15g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg15g selectWeapon "Sa58V_EP1";
_spawnTaviGroupLeaderg15g setVariable ["bodyname",_bodynameig15g,false];
_spawnTaviGroupLeaderg15g setVariable ["delmeplease",_bodynameig15g,false];
_spawnTaviGroupLeaderg15g disableConversation true;
_spawnTaviGroupLeaderg15g setDir (random(360));
_spawnTaviGroupLeaderg15g setdamage 0.01;


} else {
_soldermodelg15g = _modelarrayg15g select (round(random ((count _modelarrayg15g) - 1)));
_soldermodelg15g createunit [[((_startposg15g select 0) + (random(10))),((_startposg15g select 1) + (random(10))),0], _AISgroupg15g, "_spawnAISg15g = this;"];
_spawnAISg15g enableAI "TARGET";
_spawnAISg15g enableAI "AUTOTARGET";
_spawnAISg15g enableAI "MOVE";
_spawnAISg15g enableAI "ANIM";
_spawnAISg15g enableAI "FSM";
_spawnAISg15g allowDammage true;
_spawnAISg15g setCombatMode "YELLOW";
_spawnAISg15g setBehaviour "STEALTH";
_spawnAISg15g setSkill ["aimingAccuracy",1];
_spawnAISg15g setSkill ["aimingShake",1];
_spawnAISg15g setSkill ["aimingSpeed",1];
_spawnAISg15g setSkill ["commanding",1];
_spawnAISg15g setSkill ["aimingAccuracy",1];
_spawnAISg15g setSkill ["endurance",1];
_spawnAISg15g setSkill ["spotDistance",1];
_spawnAISg15g setSkill ["spotTime",1];
_spawnAISg15g setSkill ["courage",1];
_spawnAISg15g setSkill ["reloadSpeed",1];
_spawnAISg15g setSkill ["general",1];
if((_x >= 2) and (_x <= 3)) then {
_spawnAISg15g addweapon "AK_47_M";
_spawnAISg15g addMagazine "30Rnd_762x39_AK47";
_spawnAISg15g addMagazine "30Rnd_762x39_AK47";
_spawnAISg15g addMagazine "30Rnd_762x39_AK47";
_spawnAISg15g addMagazine "30Rnd_762x39_AK47";
_spawnAISg15g selectWeapon "AK_47_M";
};
if((_x >= 4) and (_x <= 6)) then {
_spawnAISg15g addweapon "G36C_camo";
_spawnAISg15g addMagazine "30Rnd_556x45_G36";
_spawnAISg15g addMagazine "30Rnd_556x45_G36";
_spawnAISg15g addMagazine "30Rnd_556x45_G36";
_spawnAISg15g addMagazine "30Rnd_556x45_G36";
_spawnAISg15g addMagazine "30Rnd_556x45_G36";
_spawnAISg15g addMagazine "30Rnd_556x45_G36";
_spawnAISg15g addMagazine "30Rnd_556x45_G36";
_spawnAISg15g addMagazine "30Rnd_556x45_G36";
_spawnAISg15g selectWeapon "G36C_camo";
};
if((_x >= 7) and (_x <= 8)) then {
_spawnAISg15g addweapon "SVD";
_spawnAISg15g addMagazine "10Rnd_762x54_SVD";
_spawnAISg15g addMagazine "10Rnd_762x54_SVD";
_spawnAISg15g addMagazine "10Rnd_762x54_SVD";
_spawnAISg15g addMagazine "10Rnd_762x54_SVD";
_spawnAISg15g addMagazine "10Rnd_762x54_SVD";
_spawnAISg15g addMagazine "10Rnd_762x54_SVD";
_spawnAISg15g addMagazine "10Rnd_762x54_SVD";
_spawnAISg15g addMagazine "10Rnd_762x54_SVD";
_spawnAISg15g selectWeapon "SVD";
};
if((_x >= 9) and (_x <= 11)) then {
_spawnAISg15g addweapon "FN_FAL";
_spawnAISg15g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg15g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg15g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg15g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg15g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg15g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg15g selectWeapon "FN_FAL";
};
if(_x >= 12) then {
_spawnAISg15g addweapon "RPK_74";
_spawnAISg15g addMagazine "75Rnd_545x39_RPK";
_spawnAISg15g addMagazine "75Rnd_545x39_RPK";
_spawnAISg15g addMagazine "75Rnd_545x39_RPK";
_spawnAISg15g addMagazine "75Rnd_545x39_RPK";
_spawnAISg15g addMagazine "75Rnd_545x39_RPK";
_spawnAISg15g selectWeapon "RPK_74";
};
_spawnAISg15g setVariable ["bodyname",_bodynameig15g,false];		
_spawnAISg15g setVariable ["delmeplease",_bodynameig15g,false];
_spawnAISg15g addEventHandler ["Fired", {_this call player_fired;}];
_spawnAISg15g addEventHandler ["Killed",{_this call delete_guardia;}];
_spawnAISg15g disableConversation true;
_spawnAISg15g setdamage 0.01;
_spawnAISg15g setDir (random(360));
};     
};

diag_log("DEBUG: Spawning " + str(_rndCountg15g) + " Taviana Guards from Group g15g at position " + str(_positiong15g));
diag_log("Taviana Guards spawn Group g15g end");
};

start_guardsg16g = {
private["_spawnTaviGroupLeaderg16g","_AISgroupg16g","_x10","_rndCountg16g","_rnd10","_positiong16g","_modelarrayg16g","_startposg16g","_unit10","_units10","_id101"];


east setFriend [west,0];
east setFriend [sideLogic,1];

_AISgroupg16g = createGroup east;   
_modelarrayg16g = ["SectorB_def","SectorB_def","SectorB_def"];

_startposg16g = [6756.49,12996.3,0];

_positiong16g = [6824.11,12794.3,0];
_rndCountg16g = 15; 
_rnd = random 1; 
for "_x" from 1 to _rndCountg16g do {
private["_spawnAISg16g","_bodynameig16g","_soldermodelg16g","_spawnTaviGroupLeaderg16g"];
_bodynameig16g = format ["TavianaGuardg16g%1",_x];

if(_x == 1) then {
_soldermodelg16g = _modelarrayg16g select (round(random ((count _modelarrayg16g) - 1)));
_soldermodelg16g createunit [[(_startposg16g select 0),(_startposg16g select 1),0], _AISgroupg16g, "_spawnTaviGroupLeaderg16g = this; TavianaSquadg16g = group this;"];
_spawnTaviGroupLeaderg16g enableAI "TARGET";
_spawnTaviGroupLeaderg16g enableAI "AUTOTARGET";
_spawnTaviGroupLeaderg16g enableAI "MOVE";
_spawnTaviGroupLeaderg16g enableAI "ANIM";
_spawnTaviGroupLeaderg16g enableAI "FSM";
_spawnTaviGroupLeaderg16g allowDammage true;
_spawnTaviGroupLeaderg16g setCombatMode "YELLOW";
_spawnTaviGroupLeaderg16g setBehaviour "STEALTH";
_spawnTaviGroupLeaderg16g setSkill ["aimingAccuracy",1];
_spawnTaviGroupLeaderg16g setSkill ["aimingShake",1];
_spawnTaviGroupLeaderg16g setSkill ["aimingSpeed",1];
_spawnTaviGroupLeaderg16g setSkill ["commanding",1];
_spawnTaviGroupLeaderg16g setSkill ["aimingAccuracy",1];
_spawnTaviGroupLeaderg16g setSkill ["endurance",1];
_spawnTaviGroupLeaderg16g setSkill ["spotDistance",1];
_spawnTaviGroupLeaderg16g setSkill ["spotTime",1];
_spawnTaviGroupLeaderg16g setSkill ["courage",1];
_spawnTaviGroupLeaderg16g setSkill ["reloadSpeed",1];
_spawnTaviGroupLeaderg16g setSkill ["general",1];

_spawnTaviGroupLeaderg16g addweapon "glock17_EP1";
_spawnTaviGroupLeaderg16g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg16g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg16g addMagazine "17Rnd_9x19_glock17";
_spawnTaviGroupLeaderg16g addMagazine "ItemBandage";
_spawnTaviGroupLeaderg16g addMagazine "ItemBandage";           
_spawnTaviGroupLeaderg16g addweapon "ItemMap";
_spawnTaviGroupLeaderg16g addweapon "ItemHatchet";
_spawnTaviGroupLeaderg16g addweapon "ItemKnife";

_spawnTaviGroupLeaderg16g addweapon "Sa58V_EP1";
_spawnTaviGroupLeaderg16g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg16g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg16g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg16g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg16g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg16g addMagazine "30Rnd_762x39_SA58";
_spawnTaviGroupLeaderg16g selectWeapon "Sa58V_EP1";
_spawnTaviGroupLeaderg16g setVariable ["bodyname",_bodynameig16g,false];
_spawnTaviGroupLeaderg16g setVariable ["delmeplease",_bodynameig16g,false];
_spawnTaviGroupLeaderg16g disableConversation true;
_spawnTaviGroupLeaderg16g setDir (random(360));
_spawnTaviGroupLeaderg16g setdamage 0.01;


} else {
_soldermodelg16g = _modelarrayg16g select (round(random ((count _modelarrayg16g) - 1)));
_soldermodelg16g createunit [[((_startposg16g select 0) + (random(10))),((_startposg16g select 1) + (random(10))),0], _AISgroupg16g, "_spawnAISg16g = this;"];
_spawnAISg16g enableAI "TARGET";
_spawnAISg16g enableAI "AUTOTARGET";
_spawnAISg16g enableAI "MOVE";
_spawnAISg16g enableAI "ANIM";
_spawnAISg16g enableAI "FSM";
_spawnAISg16g allowDammage true;
_spawnAISg16g setCombatMode "YELLOW";
_spawnAISg16g setBehaviour "STEALTH";
_spawnAISg16g setSkill ["aimingAccuracy",1];
_spawnAISg16g setSkill ["aimingShake",1];
_spawnAISg16g setSkill ["aimingSpeed",1];
_spawnAISg16g setSkill ["commanding",1];
_spawnAISg16g setSkill ["aimingAccuracy",1];
_spawnAISg16g setSkill ["endurance",1];
_spawnAISg16g setSkill ["spotDistance",1];
_spawnAISg16g setSkill ["spotTime",1];
_spawnAISg16g setSkill ["courage",1];
_spawnAISg16g setSkill ["reloadSpeed",1];
_spawnAISg16g setSkill ["general",1];
if((_x >= 2) and (_x <= 3)) then {
_spawnAISg16g addweapon "AK_47_M";
_spawnAISg16g addMagazine "30Rnd_762x39_AK47";
_spawnAISg16g addMagazine "30Rnd_762x39_AK47";
_spawnAISg16g addMagazine "30Rnd_762x39_AK47";
_spawnAISg16g addMagazine "30Rnd_762x39_AK47";
_spawnAISg16g selectWeapon "AK_47_M";
};
if((_x >= 4) and (_x <= 6)) then {
_spawnAISg16g addweapon "G36C_camo";
_spawnAISg16g addMagazine "30Rnd_556x45_G36";
_spawnAISg16g addMagazine "30Rnd_556x45_G36";
_spawnAISg16g addMagazine "30Rnd_556x45_G36";
_spawnAISg16g addMagazine "30Rnd_556x45_G36";
_spawnAISg16g addMagazine "30Rnd_556x45_G36";
_spawnAISg16g addMagazine "30Rnd_556x45_G36";
_spawnAISg16g addMagazine "30Rnd_556x45_G36";
_spawnAISg16g addMagazine "30Rnd_556x45_G36";
_spawnAISg16g selectWeapon "G36C_camo";
};
if((_x >= 7) and (_x <= 8)) then {
_spawnAISg16g addweapon "SVD";
_spawnAISg16g addMagazine "10Rnd_762x54_SVD";
_spawnAISg16g addMagazine "10Rnd_762x54_SVD";
_spawnAISg16g addMagazine "10Rnd_762x54_SVD";
_spawnAISg16g addMagazine "10Rnd_762x54_SVD";
_spawnAISg16g addMagazine "10Rnd_762x54_SVD";
_spawnAISg16g addMagazine "10Rnd_762x54_SVD";
_spawnAISg16g addMagazine "10Rnd_762x54_SVD";
_spawnAISg16g addMagazine "10Rnd_762x54_SVD";
_spawnAISg16g selectWeapon "SVD";
};
if((_x >= 9) and (_x <= 11)) then {
_spawnAISg16g addweapon "FN_FAL";
_spawnAISg16g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg16g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg16g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg16g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg16g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg16g addMagazine "20Rnd_762x51_FNFAL";
_spawnAISg16g selectWeapon "FN_FAL";
};
if(_x >= 12) then {
_spawnAISg16g addweapon "RPK_74";
_spawnAISg16g addMagazine "75Rnd_545x39_RPK";
_spawnAISg16g addMagazine "75Rnd_545x39_RPK";
_spawnAISg16g addMagazine "75Rnd_545x39_RPK";
_spawnAISg16g addMagazine "75Rnd_545x39_RPK";
_spawnAISg16g addMagazine "75Rnd_545x39_RPK";
_spawnAISg16g selectWeapon "RPK_74";
};
_spawnAISg16g setVariable ["bodyname",_bodynameig16g,false];		
_spawnAISg16g setVariable ["delmeplease",_bodynameig16g,false];
_spawnAISg16g addEventHandler ["Fired", {_this call player_fired;}];
_spawnAISg16g addEventHandler ["Killed",{_this call delete_guardia;}];
_spawnAISg16g disableConversation true;
_spawnAISg16g setdamage 0.01;
_spawnAISg16g setDir (random(360));
};     
};

diag_log("DEBUG: Spawning " + str(_rndCountg16g) + " Taviana Guards from Group g16g at position " + str(_positiong16g));
diag_log("Taviana Guards spawn Group g16g end");
};

diag_log "Armory start";

_io1 = [] call start_guardsg01g;
_iog13g = [] call start_guardsg13g;
_iog14g = [] call raid_helis;
_iog15g = [] call start_guardsg15g;
_iog16g = [] call start_guardsg16g;
_io1c = [] call start_civilian1c; 


diag_log("Armory End");
[[TavianaSquadg01g]] call ARGT_DEFENCE_POSITION;



_key = "CHILD:307:";
_result = [_key] call server_hiveReadWrite;
_outcome = _result select 0;
if(_outcome == "PASS") then {
_date = _result select 1; 
_year = _date select 0;
_month = _date select 1;
_day = _date select 2;
_hour = _date select 3;
_minute = _date select 4;

gamedatas = [_year,_month,_day,_hour,_minute];

_diff = ( dateToNumber (_date) - dateToNumber (gamedatas) )*365*24*60;
_dateNumP = (dateToNumber (gamedatas)) + ((6*_diff)/(365*24*60));
_date = NumberToDate[_year,_dateNumP];

if(isDedicated) then {
setDate _date;
dayzSetDate = _date;
publicVariable "dayzSetDate";
};

diag_log ("HIVE: sm Local Time set to " + str(_date));
};

createCenter civilian;
if (isDedicated) then {
endLoadingScreen;
};	
hiveInUse = false;

if (isDedicated) then {
(diag_tickTime - _t1) call _fnc_dump;
_id = [] execFSM "\z\addons\dayz_server\system\server_cleanup.fsm";
};

[] ExecVM "\z\addons\dayz_server\WAI\init.sqf";
[] ExecVM "\z\addons\dayz_server\DZMS\DZMSInit.sqf";
allowConnection = true;

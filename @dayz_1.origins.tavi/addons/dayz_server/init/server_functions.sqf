waituntil {!isnil "bis_fnc_init"};

call compile preprocessFileLineNumbers "\z\addons\dayz_server\init\publicEH_srv.sqf";

BIS_MPF_remoteExecutionServer = {
if ((_this select 1) select 2 == "JIPrequest") then {
[nil,(_this select 1) select 0,"loc",rJIPEXEC,[any,any,"per","execVM","ca\Modules\Functions\init.sqf"]] call RE;
};
};

BIS_Effects_Burn =			{};

DO_cperg =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playLogni.sqf";
serverDO_plSp =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\serverDO_plSp2.sqf";
server_onPlayerDisconnect = 	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_onPlayerDisconnect.sqf";
server_updatObiect =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_updatObiect.sqf";
server_playerDied =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerDied.sqf";
server_pubOriObj = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_pubOriObj.sqf";

server_udalitObj = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_udalitObj.sqf";		

server_playerSync =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerSync.sqf";
zombie_findOwner =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\zombie_findOwner.sqf";
server_updateNearbyObjects =	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_updateNearbyObjects.sqf";
server_wantbbplz =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_wantbbplz_a.sqf";
serv_verbb_pas =						compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\verbb_pas_a.sqf";
disco_playerMorph =     compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\disco_playerMorph.sqf";
disco_damageHandler =    compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\disco_damageHandler.sqf";
disco_playerDeath  =    compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\disco_playerDeath.sqf"; 
botPlayers = [];

vehicle_handleInteract = {
private["_object"];
_object = _this select 0;
[_object, "all"] call server_updatObiect;
};

check_publishobject = {
private["_allowed","_allowedObjects","_object"];

_object = _this select 0;
_allowedObjects = ["TentStorage", "Hedgehog_DZ", "Sandbag1_DZ","TrapBear","Wire_cat1","TentStorageR"];
_noncombatitems = ["ThrownObjects", "RoadFlare", "ChemLight"];
_allowed = false;

diag_log format ["DEBUG: Checking if Object: %1 is allowed", _object];

if ((typeOf _object) in _allowedObjects) then {
diag_log format ["DEBUG: Object: %1 Safe",_object];
_allowed = true;
};
if ((typeOf _object) in _noncombatitems) then {
diag_log format ["DEBUG: NONCombat: %1 Safe",_object];
_allowed = true;
};

_allowed;
};


eh_localCleanup =			{
private ["_object"];
_object = _this select 0;
_object addEventHandler ["local", {
if(_this select 1) then {
private["_type","_unit"];
_unit = _this select 0;
_type = typeOf _unit;
_myGroupUnit = group _unit;
_unit removeAllMPEventHandlers "mpkilled";
_unit removeAllMPEventHandlers "mphit";
_unit removeAllMPEventHandlers "mprespawn";
_unit removeAllEventHandlers "FiredNear";
_unit removeAllEventHandlers "HandleDamage";
_unit removeAllEventHandlers "Killed";
_unit removeAllEventHandlers "Fired";
_unit removeAllEventHandlers "GetOut";
_unit removeAllEventHandlers "GetIn";
_unit removeAllEventHandlers "Local";
clearVehicleInit _unit;
deleteVehicle _unit;
deleteGroup _myGroupUnit;
_unit = nil;
diag_log ("CLEANUP: DELETED A " + str(_type) );
};
}];
};

server_characterSync = {
private ["_characterID","_playerPos","_playerGear","_playerBackp","_medical","_currentState","_currentModel","_key"];
_characterID = 	_this select 0;	
_playerPos =	_this select 1;
_playerGear =	_this select 2;
_playerBackp =	_this select 3;
_medical = 		_this select 4;
_currentState =	_this select 5;
_currentModel = _this select 6;

_key = format["CHILD:201:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:",_characterID,_playerPos,_playerGear,_playerBackp,_medical,false,false,0,0,0,0,_currentState,0,0,_currentModel,0];

_key call server_hiveWrite;
};


fnc_buildWeightedArray = 	compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_buildWeightedArray.sqf";		


onPlayerDisconnected 		"[_uid,_name] call server_onPlayerDisconnect;";

server_hiveWrite = {
private["_data"];

_data = "HiveEXT" callExtension _this;


};

server_hiveReadWrite = {
private["_key","_resultArray","_data"];
_key = _this select 0;

_data = "HiveEXT" callExtension _key;

_resultArray = call compile format ["%1;",_data];

_resultArray;
};


server_getDiff =	{
private["_variable","_object","_vNew","_vOld","_result"];
_variable = _this select 0;
_object = 	_this select 1;
_vNew = 	_object getVariable[_variable,0];
_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
_result = 	0;
if (_vNew < _vOld) then {

_vNew = _vNew + _vOld;
_object getVariable[(_variable + "_CHK"),_vNew];
} else {
_result = _vNew - _vOld;
_object setVariable[(_variable + "_CHK"),_vNew];
};
_result
};

server_getDiff2 =	{
private["_variable","_object","_vNew","_vOld","_result"];
_variable = _this select 0;
_object = 	_this select 1;
_vNew = 	_object getVariable[_variable,0];
_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
_result = _vNew - _vOld;
_object setVariable[(_variable + "_CHK"),_vNew];
_result
};

dayz_objectUID = {
private["_position","_dir","_key","_object"];
_object = _this;
_position = getPosATL _object;
_dir = direction _object;
_key = [_dir,_position] call dayz_objectUID2;
_key
};

dayz_objectUID2 = {
private["_position","_dir","_key"];
_dir = _this select 0;
_key = "";
_position = _this select 1;
{
_x = _x * 10;
if ( _x < 0 ) then { _x = _x * -10 };
_key = _key + str(round(_x));
} forEach _position;
_key = _key + str(round(_dir));
_key
};

dayz_recordLogin = {
private["_key"];
_key = format["CHILD:103:%1:%2:%3:",_this select 0,_this select 1,_this select 2];

_key call server_hiveWrite;
};

ARGT_DEFENCE_POSITION = {

private ["_military", "_civilian", "_centre", "_radius", "_positions", "_patrol", "_units", "_group", "_unit", "_idx", "_pos", "_dir"];
_military = if ( typename (_this select 0) == "ARRAY" ) then {_this select 0} else {[_this select 0]};

_centre = [22314.143,19713.969,0];
_radius = 300;
_units = [];
{
_group = if ( typename _x == "GROUP" ) then {_x} else {group _x};
_group setcombatmode "YELLOW";
_group setbehaviour "AWARE";
_units = _units + units _group;
} foreach _military;
_positions = [_centre, _radius] call ARGT_DEFENCE_SCAN;
_patrol = (count _units) / 10;
_patrol = _patrol + random _patrol;
[_centre, _radius, side (_units select 0), (count _units) / 4] spawn ARGT_DEFENCE_ESCAPE;
while { count _units > 0 } do {
_idx = floor random count _units;
_unit = _units select _idx;
_units set [_idx, "*"];
_units = _units - ["*"];
if ( _patrol >= 1 || count _positions == 0 ) then {
if ( _patrol >= 0 ) then {
[_unit, _centre, _radius] spawn ARGT_DEFENCE_PATROL;
if ( _patrol >= 1 ) then {_patrol = _patrol - 1};
};
} else {
_idx = floor random count _positions;
_pos = _positions select _idx;
_dir = (_pos select 1) - 15 + random 30;
_unit setposatl (_pos select 0);
_unit setdir _dir;
if ( _unit != player ) then {
_unit setvariable ["ARGT_DEFENCE_CENTRE", _centre, true];
_unit setvariable ["ARGT_DEFENCE_RADIUS", _radius, true];
[_unit] spawn ARGT_DEFENCE_CHICKEN;
};
_positions set [_idx, "*"];
_positions = _positions - ["*"];
};
};

};

ARGT_DEFENCE_DOORS = {

private ["_centre", "_radius", "_phase", "_anims", "_animCfgList", "_configname"];
_centre = _this select 0;
_radius = _this select 1;
_phase  = if ( count _this > 2 ) then {_this select 2} else {1};
_anims = ["Lights_1", "Lights_2", "Lights_3", "Lights_4", "Lights_5"];
{
_animCfgList = configfile >> "CfgVehicles" >> typeof _x >> "AnimationSources";
for "_i" from 0 to count _animCfgList - 1 do {
_configname = configname (_animCfgList select _i);
if ( ! (_configname in _anims) ) then {_x animate [_configname, _phase]};
};
} foreach (_centre nearobjects ["House", _radius]);
};



ARGT_DEFENCE_OCCUPIED = [];

ARGT_DEFENCE_PATROL = {

private ["_unit", "_centre", "_radius", "_limited", "_patrol", "_dir", "_length", "_position", "_targets"];
_unit = _this select 0;
_centre = _this select 1;
_radius = if ( count _this > 2 ) then {_this select 2} else {100};
_limited = if ( count _this > 3 ) then {_this select 3} else {true};
_patrol = _unit getvariable "ARGT_DEFENCE_PATROL";
if ( isnil "_patrol" ) then {_patrol = false};
if ( ! _patrol ) then {
_unit setspeedmode "FULL";
if ( ! (_unit iskindof "Woman") && ! (_unit iskindof "Woman_EP1") ) then {[_unit] spawn ARGT_DEFENCE_COLLECTION};
_unit setvariable ["ARGT_DEFENCE_PATROL", true, true];
while { alive _unit } do {
if ( _unit getvariable "ARGT_DEFENCE_PATROL" ) then {
_dir = random 360;
_length = 10 + random _radius;
_position = [(_centre select 0) + _length * sin _dir, (_centre select 1) + _length * cos _dir];
_unit domove _position;
waituntil { movetocompleted _unit || movetofailed _unit || unitready _unit || ! alive _unit };
if ( _limited ) then
{
_targets = _unit neartargets 69;
if ( {_x select 3 > 10} count _targets > 0 ) then
{
_unit setbehaviour "AWARE";
_unit setspeedmode "FULL";
} else {_unit setspeedmode "LIMITED"};
};
} else {sleep 5};
};
};
};

ARGT_DEFENCE_CHICKEN = {

private ["_unit", "_handle_damage", "_handle_firednear", "_position"];
_unit = _this select 0;
_handle_damage = _unit addeventhandler ["HandleDamage", {call ARGT_DEFENCE_DAMAGE}];
_handle_firednear = _unit addeventhandler ["FiredNear", {call ARGT_DEFENCE_FIREDNEAR}];
_unit setvariable ["ARGT_DEFENCE_CHICKEN", true, true];
dostop _unit;
if ( random 1 > 0.4 ) then {[_unit] spawn ARGT_DEFENCE_STOP};
_unit setvariable ["ARGT_DEFENCE_CAREFUL", random 1 < 0.3, true];
sleep 10;
_position = getposatl _unit;
while { alive _unit && _unit getvariable "ARGT_DEFENCE_CHICKEN" } do {
_unit setunitpos "up";
sleep (3 + random 10);
if ( _unit distance _position > 0.5 ) then {_unit setvariable ["ARGT_DEFENCE_CHICKEN", false, true]};
if ( alive _unit && _unit getvariable "ARGT_DEFENCE_CHICKEN" ) then {
_unit setposatl _position;
_unit setunitpos "middle";
sleep (5 + random 20);
};
};
_unit removeeventhandler ["HandleDamage", _handle_damage];
_unit removeeventhandler ["FiredNear", _handle_firednear];
_unit setunitpos "auto";
};

ARGT_DEFENCE_SCAN = {

private ["_centre", "_radius", "_houses", "_house", "_result", "_bpos", "_position", "_dir"];
_centre = _this select 0;
_radius = if ( count _this > 1 ) then {_this select 1} else {100};
_houses = _centre nearobjects ["House", _radius];
_result = [];
{
_house = _x;
_position = _house buildingpos 0;
if ( _position select 0 != 0 ) then {
_bpos = 1;
while { _position select 0 != 0 } do {
_dir = [getposatl _house, _position] call ARGT_DEFENCE_DIR;
_position set [2, (_position select 2) + 0.1];
_result set [count _result, [_position, floor _dir]];
_bpos = _bpos + 1;
_position = _house buildingpos _bpos;
};
};

} foreach _houses;

_result
};

ARGT_DEFENCE_COLLECTION = {

private ["_unit", "_men", "_dead", "_occupied"];
_unit = _this select 0;
while { alive _unit } do {
waituntil { sleep (7 + random 3); (primaryweapon _unit == "" && secondaryweapon _unit == "" || count magazines _unit == 0) };
_men = nearestobjects [_unit, ["Man"], 69];
{
if ( ! alive _x && getposatl _x select 2 < 2 ) then {
_dead = _x;
_occupied = str _dead;
if ( ! (_occupied in ARGT_DEFENCE_OCCUPIED) && (primaryweapon _dead != "" || secondaryweapon _dead != "") && count magazines _dead > 0 ) exitwith {
ARGT_DEFENCE_OCCUPIED set [count ARGT_DEFENCE_OCCUPIED, _occupied];
_unit setvariable ["ARGT_DEFENCE_PATROL", false, true];
_unit domove getpos _dead;
_unit setspeedmode "FULL";
waituntil { movetocompleted _unit || movetofailed _unit || unitready _unit || ! alive _unit };
if ( alive _unit && _unit distance _dead < 3 && (primaryweapon _dead != "" || secondaryweapon _dead != "") && count magazines _dead > 0 ) then {
_unit dowatch _dead;
_unit setunitpos "middle";
_unit forcespeed 0;
sleep 2;
_unit disableai "move";
if ( ! alive _unit ) exitwith {};
_unit setcombatmode "RED";
_unit setbehaviour "AWARE";
{_dead addweapon _x} foreach weapons _unit;
removeallweapons _unit;
sleep 1;
if ( ! alive _unit ) exitwith {};
{
_unit addmagazine _x;
_dead removemagazine _x
} foreach magazines _dead;
sleep 1;
if ( ! alive _unit ) exitwith {};
{
_unit addweapon _x;
if ( primaryweapon _unit != "" ) then {
_unit selectweapon primaryweapon _unit;
_unit setcaptive false;
};
if ( secondaryweapon _unit != "" ) then {_unit setcaptive false};
} foreach weapons _dead;
removeallweapons _dead;
if ( primaryweapon _unit == "" && secondaryweapon _unit != "" ) then {_unit selectweapon secondaryweapon _unit};
sleep 1;
if ( primaryweapon _unit != "" ) then {_unit selectweapon primaryweapon _unit};
_unit dowatch objnull;
_unit enableai "move";
_unit forcespeed -1;
_unit setunitpos "auto";
};
ARGT_DEFENCE_OCCUPIED = ARGT_DEFENCE_OCCUPIED - [_occupied];
_unit setvariable ["ARGT_DEFENCE_PATROL", true, true];
};
};
} foreach _men;
};  
};

ARGT_DEFENCE_BEHAVIOUR = {

private ["_unit"];
_unit = _this select 0;
while { alive _unit } do {
_unit setbehaviour "SAFE";
waituntil { sleep (10 + random 20); behaviour _unit == "COMBAT" };
_unit setspeedmode "FULL";
_unit setbehaviour "CARELESS";
sleep (10 + random 20);
};
};

ARGT_DEFENCE_ESCAPE = {

private ["_centre", "_radius", "_side", "_count", "_escape"];
_centre = _this select 0;
_radius = _this select 1;
_side = _this select 2;
_count = _this select 3;
_escape = false;
while { ! _escape } do {
sleep 10;
if ( {side _x == _side && _x distance _centre < _radius} count allunits <= _count ) then {
{
if ( side _x == _side && _x distance _centre < _radius ) then {
_x setvariable ["ARGT_DEFENCE_CHICKEN", false, true];
_x setunitpos "middle";
[_x, _centre, _radius, false] spawn ARGT_DEFENCE_PATROL;
_escape = true;
};
} foreach allunits;
};
};
};

ARGT_DEFENCE_DIR = {

private ["_pos1", "_pos2", "_distance", "_dir"];
_pos1 = _this select 0;
_pos2 = _this select 1;
_distance = [_pos1 select 0, _pos1 select 1, 0] distance [_pos2 select 0, _pos2 select 1, 0];
_dir = asin (((_pos2 select 0) - (_pos1 select 0)) / _distance);
if ( _pos2 select 1 < _pos1 select 1 ) then {_dir = 180 - _dir};
_dir
};

ARGT_DEFENCE_STOP = {

private ["_unit"];
_unit = _this select 0;
waituntil {
_unit forcespeed 0;
! alive _unit || ! (_unit getvariable "ARGT_DEFENCE_CHICKEN")
};
_unit forcespeed -1;
};

ARGT_DEFENCE_DAMAGE = {

private ["_unit", "_damage"];
_unit = _this select 0;
_damage = _this select 2;
_unit forcespeed -1;
_unit setunitpos "middle";
_damage
};

ARGT_DEFENCE_FIREDNEAR = {

private ["_unit", "_firer"];
_unit = _this select 0;
_firer = _this select 1;
if ( side _unit != side _firer ) then {
_unit setunitpos "middle";
if ( _unit getvariable "ARGT_DEFENCE_CAREFUL" ) then {
[_unit, _firer] spawn {
private ["_unit", "_firer", "_centre", "_radius"];
_unit = _this select 0;
_firer = _this select 1;
_unit setvariable ["ARGT_DEFENCE_CHICKEN", false, true];
sleep 1;
_unit forcespeed -1;
_unit domove position _firer;
_unit dofire _firer;
_centre = _unit getvariable "ARGT_DEFENCE_CENTRE";
_radius = _unit getvariable "ARGT_DEFENCE_RADIUS";
if ( ! isnil "_centre" ) then {
sleep 30;
[_unit, _centre, _radius, false] spawn ARGT_DEFENCE_PATROL;
};
};
};
};
};

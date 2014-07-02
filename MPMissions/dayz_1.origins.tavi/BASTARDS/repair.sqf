private["_id","_array","_vehicle","_part","_hitpoint","_type","_hasToolbox","_section","_nameType","_namePart","_cfg","_object","_tc","_mt","_mti","_nameClass1","_st","_selection","_magazines","_damage","_hitpoints","_allFixed"];
_id = _this select 2;
_array = 	_this select 3;
_vehicle = 	_array select 0;
_part =		_array select 1;
_hitpoint = _array select 2;
_type = typeOf _vehicle;

diag_log format ["_this=%1",_this];
//
_hasToolbox = 	"ItemToolbox" in items player;
_section = _part in magazines player;

//moving this here because we need to know which part needed if we don't have it
_nameType = 		getText(configFile >> "cfgVehicles" >> _type >> "displayName");
_namePart = 		getText(configFile >> "cfgMagazines" >> _part >> "displayName");


if (_section and _hasToolbox) then {

	if (_part == "PartScrap") then {
		player removeMagazine _part;
		
		_cfg = configFile >> "CfgVehicles" >> typeof _vehicle >> "AnimationSources";
		_tc = count _cfg;
		for "_mti" from 0 to _tc-1 do {
			_mt = (_cfg select _mti);
			_nameClass1 = configName(_mt);
			_st = getText(_mt >> "source");
			if (_st==_hitpoint) then {  _selection = _st; };
		};
		diag_log format ["_hitpoint=%1,_selection=%2",_hitpoint,_selection];
		dayzSetFix = [_vehicle,_selection,0];
		publicVariable "dayzSetFix";
		if (local _vehicle) then {
			dayzSetFix call object_setFixServer;
		};
		
		player playActionNow "Medic";
		sleep 1;
		
		if (_part == "PartScrap") then {
			[player,"fixingshort",0,false] call dayz_zombieSpeak;
		} else {
			[player,"repair",0,false] call dayz_zombieSpeak;
		};
		null = [player,50,true,(getPosATL player)] spawn player_alertZombies;
		sleep 5;
		_vehicle setvelocity [0,0,1];
		
		//Success!
		cutText [format[localize "str_player_04",_namePart,_nameType], "PLAIN DOWN"];
		_magazines	= call player_countmagazines;
		dayz_lastSave = time;
		dayz_Magazines = [];
		
	} else {

		_damage = [_vehicle,_hitpoint] call object_getHit;
		_vehicle removeAction _id;
		
		//dont waste loot on undamaged parts
		if (_damage > 0) then {
			
			player removeMagazine _part;
	
			//Fix the part
			_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _hitpoint >> "name");
			dayzSetFix = [_vehicle,_selection,0];
			publicVariable "dayzSetFix";
			if (local _vehicle) then {
				dayzSetFix call object_setFixServer;
			};
			
			player playActionNow "Medic";
			sleep 1;
			
			[player,"repair",0,false] call dayz_zombieSpeak;
			null = [player,50,true,(getPosATL player)] spawn player_alertZombies;
			sleep 5;
			_vehicle setvelocity [0,0,1];
	
			//Success!
			cutText [format[localize "str_player_04",_namePart,_nameType], "PLAIN DOWN"];
			_magazines	= call player_countmagazines;
			dayz_lastSave = time;
			dayz_Magazines = [];
		};
	};
		
} else {
	if (_part == "PartScrap") then {
		cutText [format[localize "str_player_03_reinf",_namePart], "PLAIN DOWN"];
	} else {
		cutText [format[localize "str_player_03",_namePart], "PLAIN DOWN"];
	};
};

{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
dayz_myCursorTarget = objNull;

//check if repaired fully
_hitpoints = _vehicle call vehicle_getHitpoints;
_allFixed = true;
{
	_damage = [_vehicle,_x] call object_getHit;
	if (_damage > 0) exitWith {
		_allFixed = false;
	};
} forEach _hitpoints;

//update if repaired
if (_allFixed) then {
	_vehicle setDamage 0;
	dayUpdateVehlcle = [_vehicle,"repair"];
	if (isServer) then {
		if (allowConnection) then {
			dayUpdateVehlcle call server_updatObiect;
			diag_log ("Server repair.sqf");
		};
	} else {
		publicVariableServer "dayUpdateVehlcle";
	};
};
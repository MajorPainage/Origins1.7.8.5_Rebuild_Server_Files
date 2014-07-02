private ["_array","_vehicle","_part","_hitpoint","_type","_hasToolbox","_nameType","_namePart","_nearby2","_nearby","_damage","_findspace","_selection","_magazines"];
_id = _this select 2;
_array = 	_this select 3;
_vehicle = 	_array select 0;
_part =		_array select 1;
_hitpoint = _array select 2;
_type = typeOf _vehicle;

//diag_log format ["_this=%1",_this];
//
_hasToolbox = 	"ItemToolbox" in items player;

//moving this here because we need to know which part needed if we don't have it
_nameType = 		getText(configFile >> "cfgVehicles" >> _type >> "displayName");
_namePart = 		getText(configFile >> "cfgMagazines" >> _part >> "displayName");

_nearby2 = (getposATL _vehicle) nearEntities [["ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6","ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6","SurvivorW2_DZ","Bandit1_DZ","Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor3_DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ","Bandit_S_DZ","Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ","Bandit3_1","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ","Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ","Hero2_10DZ","Sniper1_DZ"],8];
_nearby = count _nearby2;
if(_nearby > 1) exitWith { cutText [format["Cannot remove %1 from %2, another payer is too close.",_namePart,_nameType], "PLAIN DOWN"]; };
	
if (_hasToolbox && (_part != "PartGlass")) then {
	
	_damage = [_vehicle,_hitpoint] call object_getHit;
	_vehicle removeAction _id;
	
	if (_damage < 0.16) then {
		_findspace = [player,_part] call BIS_fnc_invAdd;
		if (_findspace) then {
					
			_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _hitpoint >> "name");
			if( _hitpoint == "HitEngine" or _hitpoint == "HitFuel" ) then {
				dayzSetFix = [_vehicle,_selection,0.90];
			} else {
				dayzSetFix = [_vehicle,_selection,1];
			};
			publicVariable "dayzSetFix";
			if (local _vehicle) then {
				dayzSetFix call object_setFixServer;
			};
			
			player playActionNow "Medic";
			sleep 1;
			
			[player,"takepcar",0,false] call dayz_zombieSpeak;
			null = [player,50,true,(getPosATL player)] spawn player_alertZombies;
			sleep 5;
			_vehicle setvelocity [0,0,1];

			//Success!
			cutText [format[localize "str_player_39",_namePart,_nameType], "PLAIN DOWN"];
			_magazines	= call player_countmagazines;
			dayz_lastSave = time;
			dayz_Magazines = [];
		} else {
			cutText [localize "str_player_24", "PLAIN DOWN"];
		};
	} else {
		cutText [format[localize "str_player_40",_namePart,_nameType], "PLAIN DOWN"];
	};

} else {
	cutText [format["You need ToolBox to remove %1",_namePart], "PLAIN DOWN"];
};
private ["_array","_type","_classname","_holder","_playerID","_text","_config","_nearby","_nearby2","_claimedBy","_isOk","_muzzles","_wtype"];
_array = _this select 3;
_type = _array select 0;
_classname = _array select 1;
_holder = _array select 2;

_holder hideObject true;

_playerID = getPlayerUID player;
_text = getText (configFile >> _type >> _classname >> "displayName");
_config = (configFile >> _type >> _classname);
_nearby = 0;
_holder setVariable["claimed",_playerID,true];

//player playActionNow "PutDown";

if (_classname == "MeleeHatchet") then {
	player addMagazine 'hatchet_swing';
};

sleep 0.15;
_nearby2 = (getposATL _holder) nearEntities [["ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6","ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6","SurvivorW2_DZ","Bandit1_DZ","Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor3_DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ","Bandit_S_DZ","Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ","Bandit3_1","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ","Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ","Hero2_10DZ","Sniper1_DZ"],3];
_nearby = count _nearby2;

_claimedBy = _holder getVariable["claimed",0];

diag_log format ["1Picked up a bag: %1, %2, %3, %4, %5, %6",_type,_classname,_holder,_text,_claimedBy,_nearby];
if ((_claimedBy != _playerID) or (_nearby != 1)) exitWith {cutText [format[(localize "str_player_beinglooted"),_text] , "PLAIN DOWN"]; _holder setVariable["claimed",0,true]; _holder hideObject false;};

_isOk = [player,_config] call BIS_fnc_invAdd;
if (_isOk) then {
deleteVehicle _holder;

/*
	if (_classname in ["MeleeHatchet","MeleeCrowbar"]) then {

		if (_type == "cfgWeapons") then {
			_muzzles = getArray(configFile >> "cfgWeapons" >> _classname >> "muzzles");
			//_wtype = ((weapons player) select 0);
			if (count _muzzles > 1) then {
				player selectWeapon (_muzzles select 0);
			} else {
				player selectWeapon _classname;
			};
		};
	};
*/
} else {
	_holder setVariable["claimed",0,true];
	cutText [localize "STR_DAYZ_CODE_2", "PLAIN DOWN"];
	if (_classname == "MeleeHatchet") then {
		player removeMagazine 'hatchet_swing';
	};
	_holder hideObject false;
};

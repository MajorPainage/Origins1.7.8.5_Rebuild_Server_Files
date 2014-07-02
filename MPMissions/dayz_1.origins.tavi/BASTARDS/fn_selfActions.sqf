scriptName "Functions\misc\fn_selfActions.sqf";
/***********************************************************
	ADD ACTIONS FOR SELF
	- Function
	- [] call fnc_usec_selfActions;
************************************************************/
private ["_vehicle","_inVehicle","_bag","_classbag","_isWater","_hasAntiB","_hasFuelE","_hasFuelBE","_hasRawMeat","_hasKnife","_hasToolbox","_hasTent","_onLadder","_nearLight","_mbBackpacks","_nearBackpacks","_nearPlayerB","_playerID","_canPickLight","_canRest","_nextVehicle","_shwmsg","_newCuTyp","_isOwnerName","_newTypeB","_keep2","_typedeP","_nameKillerP","_canDo","_text","_ownerID","_maxbbLevel","_levelhouse","_naObnovku","_nextlvl","_isHarvested","_isVehicle","_isMan","_isAnimal","_isZombie","_isDestructable","_isTent","_isFuel","_isAlive","_isCruse","_object","_nummsg","_takemes","_maxbbLevelt","_isUpsideDown","_notManned","_mates","_totpa","_allFixed","_hitpoints","_damage","_part","_cmpt","_damagePercent","_color","_string","_handle","_cfg","_tc","_mt","_mti","_nameClass1","_st","_statuss","_stname"];

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_bag = unitBackpack player;
_classbag = typeOf _bag;
_isWater = 		(surfaceIsWater (position player)) or dayz_isSwimming;
_hasAntiB = 	"ItemAntibiotic" in magazines player;
_hasFuelE = 	"ItemJerrycanEmpty" in magazines player;
_hasFuelBE = 	"ItemJerrycanBEmpty" in magazines player;
_hasRawMeat = 	"FoodSteakRaw" in magazines player;
_hasKnife = 	"ItemKnife" in items player;
_hasToolbox = 	"ItemToolbox" in items player;
//_hasTent = 	"ItemTent" in items player;
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_nearLight = 	nearestObject [player,"LitObject"];
_mbBackpacks = nearestObjects [player, ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_CivilBackpack_EP1","DZ_ALICE_Pack_EP1","DZ_Backpack_EP1","O_TravelerPack_1","O_MegaPack_1"], 7];
_nearBackpacks = count (nearestObjects [player, ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_CivilBackpack_EP1","DZ_ALICE_Pack_EP1","DZ_Backpack_EP1","O_TravelerPack_1","O_MegaPack_1"], 7]) > 0;
_nearPlayerB = count ((getposATL player) nearEntities [["ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6","ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6","SurvivorW2_DZ","Bandit1_DZ","Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor3_DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ","Bandit_S_DZ","Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ","Bandit3_1","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ","Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ","Hero2_10DZ","Sniper1_DZ"],7]) > 1;
_playerID =		getPlayerUID player;
_canPickLight = false;
_canRest = false;
_nextVehicle = false;
_shwmsg = true;
_newCuTyp = typeOf cursorTarget;
_isOwnerName = "Unknown";
_newTypeB = ["wooden_shed_lvl_1","log_house_lvl_2","wooden_house_lvl_3","large_shed_lvl_1","small_house_lvl_2","big_house_lvl_3","small_garage","big_garage","object_x"];

_keep2 = "unknown";
_typedeP = 0;
_nameKillerP = "unknown";

if (!isNull _nearLight) then {
	if (_nearLight distance player < 4) then {
		_canPickLight = isNull (_nearLight getVariable ["owner",objNull]);
	};
};
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);

if (_nearBackpacks) then {
	if (_nearPlayerB) then {
		{ _x hideObject true; } forEach _mbBackpacks;
	} else {
		{ _x hideObject false; } forEach _mbBackpacks;
	};
};

//Grab Flare
if (_canPickLight and !dayz_hasLight) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [format[localize "str_actions_medical_15",_text], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true, "", ""];
		s_player_removeflare = player addAction [format[localize "str_actions_medical_17",_text], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true, "", ""];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};

if (player distance cursorTarget < 8) then {
	player removeAction s_player_1bupd;
	s_player_1bupd = -1;
};

if (!isNull cursorTarget and !_inVehicle and (player distance cursorTarget < 30)) then {
	_ownerID = cursorTarget getVariable ["characterID","0"];
		
	if(_ownerID == _playerID) then {
		if(_newCuTyp in _newTypeB) then {
			if ((_newCuTyp == "wooden_shed_lvl_1") 	OR (_newCuTyp == "large_shed_lvl_1")) 	then { _maxbbLevel = 2; };
			if ((_newCuTyp == "log_house_lvl_2") 	OR (_newCuTyp == "small_house_lvl_2")) 	then { _maxbbLevel = 4; };
			if ((_newCuTyp == "wooden_house_lvl_3") OR (_newCuTyp == "big_house_lvl_3")) 	then { _maxbbLevel = 8; };
			if ((_newCuTyp == "small_garage") OR (_newCuTyp == "big_garage")) 	then { _maxbbLevel = 4; };
			if (_newCuTyp == "object_x") 	then { _maxbbLevel = 1; };
			_levelhouse = cursorTarget getVariable["levelhouse",10];
			_naObnovku = cursorTarget getVariable["DaBeUpd",false];
			_nextlvl = _levelhouse + 1;
			if (_levelhouse < _maxbbLevel) then {
				if ((s_player_1bupd < 0) and (player distance cursorTarget > 8) and (player distance cursorTarget < 30)) then {
					s_player_1bupd = player addAction [format[localize "STR_BUILDING_STAGE_2",_nextlvl], "\z\addons\dayz_code\actions\bse_pp.sqf",[cursorTarget,_levelhouse], 0, false, true, "",""];
				};
			};
			if ((_levelhouse == 1)&&(_newCuTyp != "object_x") ) then {
				if ((s_player_packFdp < 0) and (player distance cursorTarget > 8) and (player distance cursorTarget < 30)) then {
					s_player_packFdp = player addAction [localize "STR_BUILDING_STAGE_U", "\z\addons\dayz_code\actions\player_dFp.sqf",cursorTarget, 0, false, true, "",""];
				};
			};
			if ((_newCuTyp == "wooden_shed_lvl_1") OR (_newCuTyp == "large_shed_lvl_1") OR (_newCuTyp == "big_house_lvl_3")) then {
				if (_levelhouse > 1) then {
					if ((s_player_otkdv < 0) and (player distance cursorTarget < 30)) then {
					diag_log format ["ADD ACTION DOM _naObnovku=%1",_naObnovku];
						if(!_naObnovku) then {
							s_player_otkdv = player addAction ["Un-lock house, open doors", "\z\addons\dayz_code\actions\player_ppver.sqf",[cursorTarget,1], 0, false, true, "",""];
						};
						if(_naObnovku) then {
							s_player_otkdv = player addAction ["Lock house, close doors", "\z\addons\dayz_code\actions\player_ppver.sqf",[cursorTarget,2], 0, false, true, "",""];
						};
					};
				};
			};
			
			if (_newCuTyp == "object_x") then {
				if (_levelhouse == 1) then {
					if ((s_player_otkdv < 0) and (player distance cursorTarget < 30)) then {
						if(!_naObnovku) then {
							s_player_otkdv = player addAction ["Un-lock house, open doors", "\z\addons\dayz_code\actions\player_ppver.sqf",[cursorTarget,1], 0, false, true, "",""];
						};
						if(_naObnovku) then {
							s_player_otkdv = player addAction ["Lock house, close doors", "\z\addons\dayz_code\actions\player_ppver.sqf",[cursorTarget,2], 0, false, true, "",""];
						};
					};
				};
			};
			if ((_newCuTyp == "log_house_lvl_2") OR (_newCuTyp == "small_house_lvl_2") OR (_newCuTyp == "wooden_house_lvl_3") OR (_newCuTyp == "small_garage") OR (_newCuTyp == "big_garage")) then {
				if (_levelhouse > 2) then {
					if ((s_player_otkdv < 0) and (player distance cursorTarget < 30)) then {
						if(!_naObnovku) then {
							s_player_otkdv = player addAction ["Un-lock house, open doors", "\z\addons\dayz_code\actions\player_ppver.sqf",[cursorTarget,1], 0, false, true, "",""];
						};
						if(_naObnovku) then {
							s_player_otkdv = player addAction ["Lock house, close doors", "\z\addons\dayz_code\actions\player_ppver.sqf",[cursorTarget,2], 0, false, true, "",""];
						};
					};
				};
			};
		} else {
			player removeAction s_player_1bupd;
			s_player_1bupd = -1;
			player removeAction s_player_otkdv;
			s_player_otkdv = -1;
			player removeAction s_player_packFdp;
			s_player_packFdp = -1;
		};
	} else {
		_newCuTyp = typeOf cursorTarget;
		if(_newCuTyp in _newTypeB) then {
			if (player distance cursorTarget < 30) then {
				if (_shwmsg) then {
					_shwmsg = false;
					_isOwnerName = cursorTarget getVariable ["PName","Unknown"];
					titletext [format["This great house was built by: %1",_isOwnerName], "PLAIN DOWN"];
				};
			};
		};
	};
} else {
	player removeAction s_player_1bupd;
	s_player_1bupd = -1;
	player removeAction s_player_otkdv;
	s_player_otkdv = -1;
	player removeAction s_player_packFdp;
	s_player_packFdp = -1;
};

if (!isNull cursorTarget and !_inVehicle and (player distance cursorTarget < 7)) then {	//Has some kind of target
	_isHarvested = cursorTarget getVariable["meatHarvested",false];
	_isVehicle = cursorTarget isKindOf "AllVehicles";
	_isMan = cursorTarget isKindOf "Man";
	_ownerID = cursorTarget getVariable ["characterID","0"];
	_isAnimal = cursorTarget isKindOf "Animal";
	_isZombie = cursorTarget isKindOf "zZombie_base";
	_isDestructable = cursorTarget isKindOf "BuiltItems";
	
	_isTent = cursorTarget isKindOf "TentStorage";
	_isFuel = false;
	_isAlive = alive cursorTarget;
	_text = getText (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "displayName");
	if (_hasFuelE or _hasFuelBE) then {
		_isFuel = (cursorTarget isKindOf "Land_Ind_TankSmall") or (cursorTarget isKindOf "Land_fuel_tank_big") or (cursorTarget isKindOf "Land_fuel_tank_stairs") or (cursorTarget isKindOf "Land_wagon_tanker");
	};
	_isCruse = cursorTarget isKindOf "GraveCrossHelmet_DZ";
	//diag_log ("OWNERID = " + _ownerID + " CHARID = " + dayz_characterID + " " + str(_ownerID == dayz_characterID));
	
	//Allow player to delete objects
	if(_isDestructable and _hasToolbox and _canDo) then {
		if (s_player_deleteBuild < 0) then {
			s_player_deleteBuild = player addAction [format[localize "str_actions_delete",_text], "\z\addons\dayz_code\actions\remove.sqf",cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_deleteBuild;
		s_player_deleteBuild = -1;
	};
	
	/*
	//Allow player to force save
	if((_isVehicle or _isTent) and _canDo and !_isMan) then {
		if (s_player_forceSave < 0) then {
			s_player_forceSave = player addAction [format[localize "str_actions_save",_text], "\z\addons\dayz_code\actions\forcesave.sqf",cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_forceSave;
		s_player_forceSave = -1;
	};
	*/
	
	
	//GraveCrossHelmet_DZ
	if(_isCruse) then { //\z\addons\dayz_code\actions\cruse.sqf
		_object = cursorTarget;
			if (typeName _object == "OBJECT") then {	
				if (s_player_isCruse < 0) then {
					s_player_isCruse = player addAction ["Destroy GraveCross", "\z\addons\dayz_code\actions\removeC.sqf",cursorTarget, 1, true, true, "", ""];
					_keep2 = _object getVariable ["RepBody","unknown"]; //victim name
					_typedeP = _object getVariable ["typedeP",0]; //typeof victim
					_nameKillerP = _object getVariable ["nameKillerP","unknown"]; //killer name
					if (_keep2 != "unknown") then {
						if (_typedeP > 0) then {
							if(_nameKillerP != "unknown") then {
								if (_typedeP == 1) then { _nummsg = floor(random 11); _takemes = "str_memory_b_" + str(_nummsg); //diag_log("_nummsg=" + str(_nummsg)); 
								};
								if (_typedeP == 2) then { _nummsg = floor(random 5); _takemes = "str_memory_c_" + str(_nummsg); //diag_log("_nummsg=" + str(_nummsg)); 
								};
								if (_typedeP == 3) then { _nummsg = floor(random 6); _takemes = "str_memory_d_" + str(_nummsg); //diag_log("_nummsg=" + str(_nummsg)); 
								};
								//cutText [str(_takemes),"PLAIN DOWN",1];
								//cutText [localize str(_takemes), "PLAIN DOWN",1];
								cutText [format[(localize _takemes),_keep2,_nameKillerP] , "PLAIN DOWN",1];
							} else {
								_nummsg = floor(random 9); _takemes = "str_memory_a_" + str(_nummsg); //diag_log("_nummsg=" + str(_nummsg));
								cutText [format[(localize _takemes),_keep2] , "PLAIN DOWN",1];
							};
						};
					} else {
						cutText ["Unknown survival","PLAIN DOWN",1];
					};
				};
			};
	} else {
		player removeAction s_player_isCruse;
		s_player_isCruse = -1;
	};
	
	//Allow player to fill jerrycan
	
	if(_isFuel and _canDo) then {
		if (s_player_fillfuel < 0) then {
			s_player_fillfuel = player addAction [localize "str_actions_self_10", "\z\addons\dayz_code\actions\jerry_fill.sqf",[], 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_fillfuel;
		s_player_fillfuel = -1;
	};
	
	if (!alive cursorTarget and _isAnimal and _hasKnife and !_isHarvested and _canDo) then {
		if (s_player_butcher < 0) then {
			s_player_butcher = player addAction [localize "str_actions_self_04", "\z\addons\dayz_code\actions\gather_meat.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_butcher;
		s_player_butcher = -1;
	};
	
	//Fireplace Actions check
	if(inflamed cursorTarget and _hasRawMeat and _canDo) then {
		if (s_player_cook < 0) then {
			s_player_cook = player addAction [localize "str_actions_self_05", "\z\addons\dayz_code\actions\cook.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_cook;
		s_player_cook = -1;
	};
	if(cursorTarget == dayz_hasFire and _canDo) then {
		if ((s_player_fireout < 0) and !(inflamed cursorTarget) and (player distance cursorTarget < 3)) then {
			s_player_fireout = player addAction [localize "str_actions_self_06", "\z\addons\dayz_code\actions\fire_pack.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_fireout;
		s_player_fireout = -1;
	};
	
	//Packing my tent
	if(((cursorTarget isKindOf "TentStorage") or (cursorTarget isKindOf "TentStorageR")) and _canDo and _ownerID == dayz_characterID) then {
		if ((s_player_packtent < 0) and (player distance cursorTarget < 3)) then {
			s_player_packtent = player addAction [localize "str_actions_self_07", "\z\addons\dayz_code\actions\tent_pack.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_packtent;
		s_player_packtent = -1;
	};
	
	if ((cursorTarget isKindOf "CementMixer") and _canDo and (player distance cursorTarget < 7) ) then {
		if (s_player_cnbb < 0) then {
				s_player_cnbb = player addAction [localize "str_actions_self_11", "\z\addons\dayz_code\actions\player_pCeMix.sqf",cursorTarget, 0, true, true, "", ""];
		};
	} else {
		player removeAction s_player_cnbb;
		s_player_cnbb = -1;
	};
	
	
	if ((cursorTarget isKindOf "TentStorageR") OR (_newCuTyp in _newTypeB)) then {
			_levelhouse = cursorTarget getVariable["levelhouse",10];
			_maxbbLevelt = true;
			if ((_newCuTyp == "wooden_shed_lvl_1") 	OR (_newCuTyp == "large_shed_lvl_1")) 	then { _maxbbLevelt = _levelhouse == 2; };
			if ((_newCuTyp == "log_house_lvl_2") 	OR (_newCuTyp == "small_house_lvl_2")) 	then { _maxbbLevelt = _levelhouse == 4; };
			if ((_newCuTyp == "wooden_house_lvl_3") OR (_newCuTyp == "big_house_lvl_3")) 	then { _maxbbLevelt = _levelhouse >= 4; };
			if ((_newCuTyp == "small_garage") OR (_newCuTyp == "big_garage")) 	then { _maxbbLevelt = false; };
			
		if ((player distance cursorTarget < 2) and !_canRest and _maxbbLevelt) then {
			if (s_player_rest < 0) then {
					s_player_rest = player addAction [localize "str_actions_self_12", "\z\addons\dayz_code\actions\zeeping.sqf",cursorTarget, 3, true, true, "", ""];
			};
		} else {
			player removeAction s_player_rest;
			s_player_rest = -1;
		};
	};

			
	//Flip Vehicles - Check if vehicle is upside down and empty - MRS
	_isUpsideDown = (((vectorUp cursorTarget) select 2) <0.2); 
	_notManned = (count (crew cursorTarget) == 0);
	//Unflip Light Vehicles - MRS

	if(_notManned and _isUpsideDown and ((cursorTarget isKindOf "Motorcycle") or (cursorTarget isKindOf "ATV_Base_EP1")) and _canDo) then {
		if ((s_player_flipvehiclelight < 0) and (player distance cursorTarget < 3)) then {
			s_player_flipvehiclelight = player addAction [format[localize "str_actions_self_unfliplight",_newCuTyp], "\z\addons\dayz_code\actions\vehicle_flip.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_flipvehiclelight;
		s_player_flipvehiclelight = -1;
	};

	//Flip Heavy Vehicles - Only for cars, no Bus or Truck or wahtever bigger vehicle. Requires 5 ppl! - MRS
/*
	if(_notManned and _isUpsideDown and !((cursorTarget isKindOf "Car") or (cursorTarget isKindOf "Truck") or (cursorTarget isKindOf "Wheeled_APC") or (cursorTarget isKindOf "Bus") or (cursorTarget isKindOf "Ikarus") or (cursorTarget isKindOf "Motorcycle") or (cursorTarget isKindOf "ATV_Base_EP1")) and _canDo) then {
		
		_mates = count ((position player) nearEntities [["ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6","ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6","SurvivorW2_DZ","Bandit1_DZ","Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor3_DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ","Bandit_S_DZ","Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ","Bandit3_1","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ","Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ","Hero2_10DZ","Sniper1_DZ"],9]);
		
		if (_mates > 3) then {
			if ((s_player_flipvehicleheavy < 0) and (player distance cursorTarget < 4)) then {
				s_player_flipvehicleheavy = player addAction [format[localize "str_actions_self_unfliplight",_newCuTyp], "\z\addons\dayz_code\actions\vehicle_flip.sqf",cursorTarget, 0, false, true, "",""];
			};
		} else {
			if (_shwmsg) then {
				_shwmsg = false;
				cutText [format[localize "str_player_needHelp",_newCuTyp], "PLAIN DOWN"];
			};
		};
	} else {
		player removeAction s_player_flipvehicleheavy;
		s_player_flipvehicleheavy = -1;
	};
	*/
	//Repairing Vehicles
	if ((dayz_myCursorTarget != cursorTarget) and !_isMan and _hasToolbox and (damage cursorTarget < 1)) then {
		_vehicle = cursorTarget;
		_totpa = ["HitFuel","HitEngine","HitLFWheel","HitRFWheel","HitLBWheel","HitRBWheel","HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6","HitHRotor"];
		if ((_vehicle isKindOf "Truck") or (_newCuTyp == "rth_amphicar") or (_newCuTyp == "rth_ScrapApc")) then { _totpa set [count _totpa,"HitLMWheel"]; _totpa set [count _totpa,"HitRMWheel"]; };
		{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
		dayz_myCursorTarget = _vehicle;
		//diag_log format ["SizeOfCAR = %1", sizeOf (typeOf cursorTarget)];
		_nextVehicle = (_vehicle isKindOf "Motorcycle") or (_vehicle isKindOf "Tractor");
		_allFixed = true;
		_hitpoints = _vehicle call vehicle_getHitpoints;
		
		{
			_damage = [_vehicle,_x] call object_getHit;
			_part = "PartGeneric";
			
			//change "HitPart" to " - Part" rather than complicated string replace
			_cmpt = toArray (_x);
			_cmpt set [0,20];
			_cmpt set [1,toArray ("-") select 0];
			_cmpt set [2,20];
			_cmpt = toString _cmpt;
				
			if(["Engine",_x,false] call fnc_inString) then {
				_part = "PartEngine";
			};
					
			if(["HRotor",_x,false] call fnc_inString) then {
				_part = "PartVRotor";
			};

			if(["Fuel",_x,false] call fnc_inString) then {
				_part = "PartFueltank";
			};
			
			if(["Wheel",_x,false] call fnc_inString) then {
				_part = "PartWheel";

			};
					
			if(["Glass",_x,false] call fnc_inString) then {
				_part = "PartGlass";
			};

			// get every damaged part no matter how tiny damage is!
			_damagePercent = round((1 - _damage) * 100);
			if (_damage > 0) then {
				
				_allFixed = false;
				_color = "color='#ffff00'"; //yellow
				if (_damage >= 0.5) then {_color = "color='#ff8800'";}; //orange
				if (_damage >= 0.9) then {_color = "color='#ff0000'";}; //red
				_cmpt = _cmpt + " Status: " + str(_damagePercent) + "%";
				_string = format["<t %2>Repair%1</t>",_cmpt,_color]; //Repair - Part
				_handle = dayz_myCursorTarget addAction [_string, "\z\addons\dayz_code\actions\BASTARDS\repair.sqf",[_vehicle,_part,_x], 0, false, true, "",""];
				s_player_repairActions set [count s_player_repairActions,_handle];

			};

			if ( (_damage < 0.15) and (_x in _totpa) and !_nextVehicle and (_part != "PartGlass")) then {
				_allFixed = false;
				_color = "color='#00baff'"; //blue
				_string = format["<t %2>Remove %1 part</t>",_cmpt,_color]; //Remove - Part
				_handle = dayz_myCursorTarget addAction [_string, "\z\addons\dayz_code\actions\BASTARDS\retake.sqf",[_vehicle,_part,_x], 0, false, true, "",""];
				s_player_repairActions set [count s_player_repairActions,_handle];
			};
					
		} forEach _hitpoints;
		if (_allFixed) then {
			_vehicle setDamage 0;
		};
		
		_cfg = configFile >> "CfgVehicles" >> typeof _vehicle >> "AnimationSources";
		_tc = count _cfg;
		_part = "PartScrap";
		for "_mti" from 0 to _tc-1 do {
			_mt = (_cfg select _mti);
			_nameClass1 = configName(_mt);
			_st = getText(_mt >> "source");
			if (_st in ["front_plow","wheel_guards","window_guards","windshield_guard"]) then {	
				_statuss = _vehicle getVariable [_st,1];
				if (_statuss == 1) then {
					_color = "color='#ff0000'";
					_stname = format["str_%1",_st];
					_string = format["<t %2>%1</t>", localize _stname,_color]; //Repair - Part
					_handle = dayz_myCursorTarget addAction [_string, "\z\addons\dayz_code\actions\BASTARDS\repair.sqf",[_vehicle,_part,_st], 0, false, true, "",""];
					s_player_repairActions set [count s_player_repairActions,_handle];
				};
			};
		};
		
		
	};
	
	if (_isMan and !_isAlive and !_isZombie) then {
		if (s_player_studybody < 0) then {
			s_player_studybody = player addAction [localize "str_action_studybody", "\z\addons\dayz_code\actions\study_body.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_studybody;
		s_player_studybody = -1;
	};	
} else {
	//Engineering
	{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
	dayz_myCursorTarget = objNull;
	//Others
	player removeAction s_player_forceSave;
	s_player_forceSave = -1;
	player removeAction s_player_flipvehiclelight;
	s_player_flipvehiclelight = -1;
	player removeAction s_player_flipvehicleheavy;
	s_player_flipvehicleheavy = -1;
	player removeAction s_player_deleteBuild;
	s_player_deleteBuild = -1;
	player removeAction s_player_butcher;
	s_player_butcher = -1;
	player removeAction s_player_cook;
	s_player_cook = -1;
	player removeAction s_player_fireout;
	s_player_fireout = -1;
	player removeAction s_player_packtent;
	s_player_packtent = -1;
	player removeAction s_player_fillfuel;
	s_player_fillfuel = -1;
	player removeAction s_player_studybody;
	s_player_studybody = -1;
	player removeAction s_player_isCruse;
	s_player_isCruse = -1;
	player removeAction s_player_rest;
	s_player_rest = -1;
	player removeAction s_player_cnbb;
	s_player_cnbb = -1;
};
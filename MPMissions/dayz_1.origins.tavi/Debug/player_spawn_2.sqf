private["_timeOut","_messTimer","_lastSave","_lastTemp","_debug","_isBandit","_isHero","_refObj","_size","_vel","_speed","_saveTime","_randomSpot","_tempPos","_distance","_mylastPos","_isSync","_veh","_humanity","_isBandit3","_model","_isBandit2","_lastUpdate","_hunger","_thirst","_listTalk","_rnd","_foodVal","_thirstVal","_result","_id","_lowBlood","_display","_control","_headShots","_kills","_killsH","_killsB","_zombies","_zombiesA","_groups","_dead","_loot","_wrecks","_lootL","_freeTarget","_startcombattimer","_combattimeout","_timeleft","_color","_pmon1","_combatdisplay","_combatcontrol","_myPos","_lastPos","_debugAlex"];
disableSerialization;
_timeOut = 	0;
_messTimer = 0;
_lastSave = 0;
_lastTemp = dayz_temperatur;
_debug = getMarkerpos "respawn_west";
_isBandit = false;
_isHero = false;
player setVariable ["temperature",dayz_temperatur,true];
_dayz_zombiesLocal = 0;
_counzKill = 0;

dayz_myLoad = (((count dayz_myBackpackMags) * 0.2) + (count dayz_myBackpackWpns)) +  (((count dayz_myMagazines) * 0.1) + (count dayz_myWeapons * 0.5));

while {true} do {
	//Initialize
	_refObj = 	vehicle player;
	_size = 	(sizeOf typeOf _refObj) * 0.6;
	_vel = 		velocity player;
	_speed = 	round((_vel distance [0,0,0]) * 3.5);
	_saveTime = (playersNumber west * 2) + 10;
	
	//reset position
	_randomSpot = true;
	_tempPos = getPosATL player;
	_distance = _debug distance _tempPos;
	if (_distance < 150) then {
		_randomSpot = false;
	};	
	
	_distance = [0,0,0] distance _tempPos;
	if (_distance < 100) then {
		_randomSpot = false;
	};
	_distance = _mylastPos distance _tempPos;
	if (_distance > 400) then {
		_randomSpot = false;
	};
	
	if (_randomSpot) then {
		_mylastPos = _tempPos;
	};
	
	dayz_mylastPos = _mylastPos;
	dayz_areaAffect = _size;
	
	//CheckVehicle
	/*
	if (_refObj != player) then {
		_isSync =_refObj getVariable ["ObjectID",0] > 0;
		if (!_isSync) then {
			_veh allowDamage true;
			_veh setDamage 1;
			player setDamage 1;			
		};
	};
	*/
	
	if (_speed > 0.1) then {
		_timeOut = _timeOut + 1;
	};
	
	_humanity = player getVariable ["humanity",0];
	//diag_log format ["player_spawn_2 humanity =%1",_humanity];
	//if (_timeOut > 150) then {
	//	_timeOut = 0;
	//	if (_humanity < 2500) then {
	//		_humanity = _humanity + 150;
	//		_humanity = _humanity min 2500;
	//	};
	//}; //STOP+ 

	//LEVELING AlexSpain alex.spain.2009
	if (_humanity < -15000 and _timeOut > 5) then {
		//_isBandit3 = true;
		_model = typeOf player;
		if (_model in ["Survivor3_DZ","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ","Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero2_10DZ","Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ","Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ","Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit1_DZ","Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ"]) then {
			
			_toModel = "Bandit3_1";
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
		if (_model in ["ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","SurvivorW2_DZ","ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6"]) then {
			_toModel = ["ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6"] select floor random 6;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
	};
	
	if (_humanity >= -15000 and _humanity <= -6500  and _timeOut > 5) then {
		_isBandit2 = true;
		_model = typeOf player;
		if (_model in  ["Bandit3_1","Survivor3_DZ","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ","Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero2_10DZ","Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ","Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ","Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit1_DZ"]) then {
			
			_toModel = ["Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ"] select floor random 5;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
		if (_model in ["ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","SurvivorW2_DZ","ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6"]) then {
			_toModel = ["ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6"] select floor random 6;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
	};
	
	if (_humanity > -6500 and _humanity <= 2000 and _timeOut > 5) then {
		_isBandit = true;
		_model = typeOf player;
		if (_model in ["Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ","Bandit3_1","Survivor3_DZ","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ","Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero2_10DZ","Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ","Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ"]) then {
			
			_toModel = ["Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit1_DZ"] select floor random 6;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
		if (_model in ["ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","SurvivorW2_DZ","ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6"]) then {
			_toModel = ["ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6"] select floor random 6;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
	};
	
	if (_humanity > 2000 and _humanity < 2900 and _timeOut > 5) then {
		//_isBandit = false;
		_model = typeOf player;
		if (_model in ["Bandit1_DZ","Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ","Bandit3_1","Bandit_S_DZ","Survivor3_DZ","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ","Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero2_10DZ","Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ"]) then {
			if (_model=="Bandit_S_DZ") then {
					_toModel = "Sniper1_DZ";
			} else {
				_toModel = ["Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ"] select floor random 12;
			};
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
		if (_model in ["ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6","ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6"]) then {
			_toModel = ["ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","SurvivorW2_DZ"] select floor random 7;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
	};
	
	if (_humanity >= 2900 and _humanity < 6500 and _timeOut > 5) then {
		//_isBandit = false;
		_model = typeOf player;
		if (_model in ["Bandit1_DZ","Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ","Bandit3_1","Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero2_10DZ","Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ","Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ"]) then {
			_toModel = ["Survivor3_DZ","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ"] select floor random 8;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
		if (_model in ["ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6","ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","SurvivorW2_DZ"]) then {
			_toModel = ["ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6"] select floor random 6;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
	};
	
	if (_humanity >= 6500 and _humanity <= 15000 and _timeOut > 5) then {
		//_isBandit = false;
		_model = typeOf player;
		if (_model in ["Bandit1_DZ","Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ","Bandit3_1","Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ","Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ","Survivor3_DZ","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ"]) then {
			_toModel = ["Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero2_10DZ"] select floor random 6;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
		if (_model in ["ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6","ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","SurvivorW2_DZ"]) then {
			_toModel = ["ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6"] select floor random 6;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
	};
	if (_humanity > 15000 and _timeOut > 5) then {
		//_isBandit = false;
		_model = typeOf player;
		if (_model in ["Bandit1_DZ","Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ","Bandit3_1","Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero2_10DZ","Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ","Survivor3_DZ","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ"]) then {
			_toModel = ["Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ"] select floor random 6;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
		if (_model in ["ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6","ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","SurvivorW2_DZ"]) then {
			_toModel = ["ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6"] select floor random 6;
			_timeOut = 0;
			[dayz_playerUID,dayz_characterID,_toModel] spawn player_humanityMorph;
		};
	};
	
	
	//Has infection?
	if (r_player_infected) then {
		[player,"cough",8,false] call dayz_zombieSpeak;
	};

	//Record Check
	_lastUpdate = 	time - dayZ_lastPlayerUpdate;
	if (_lastUpdate > 8) then {
		//POSITION?
		_distance = dayz_myPosition distance player;
		if (_distance > 10) then {
			//Player has moved
			dayz_myPosition = getPosATL player;
			player setVariable["posForceUpdate",true,true];
			dayz_unsaved = true;
			dayZ_lastPlayerUpdate = time;
		};
	};

	//Hunger
	_hunger = +((((r_player_bloodTotal - r_player_blood) / r_player_bloodTotal) * 5) + _speed + dayz_myLoad) * 3;
	if (time - dayz_panicCooldown < 120) then {
		_hunger = _hunger * 2;
	};
	dayz_hunger = dayz_hunger + (_hunger / 60);

	//Thirst
	_thirst = 2;
	if (_refObj == player) then {
		_thirst = (_speed + 4) * 3;
	};
	dayz_thirst = dayz_thirst + (_thirst / 60) * (dayz_temperatur / dayz_temperaturnormal);	//TeeChange Temperatur effects added Max Effects: -25% and + 16.6% waterloss

	//Temperatur
	2 call player_temp_calculation; //2 = sleep time of this loop		//TeeChange
	if ((_lastTemp - dayz_temperatur) > 0.75 or (_lastTemp - dayz_temperatur) < -0.75 ) then {
		player setVariable ["temperature",dayz_temperatur,true];
		_lastTemp = dayz_temperatur;
	};
	
	//can get nearby infection
	if (!r_player_infected) then {
		//					Infectionriskstart
		if (dayz_temperatur < ((80 / 100) * (dayz_temperaturnormal - dayz_temperaturmin) + dayz_temperaturmin)) then {	//TeeChange
			_listTalk = _mylastPos nearEntities ["CAManBase",8];
			{
				if (_x getVariable["USEC_infected",false]) then {
					_rnd = (random 1) * (((dayz_temperaturnormal - dayz_temperatur) * (100 /(dayz_temperaturnormal - dayz_temperaturmin)))/ 50);	//TeeChange
					if (_rnd < 0.1) then {
						_rnd = random 1;
						if (_rnd > 0.7) then {
							r_player_infected = true;
							player setVariable["USEC_infected",true];
						};
					};
				};
			} forEach _listTalk;
			if (dayz_temperatur < ((50 / 100) * (dayz_temperaturnormal - dayz_temperaturmin) + dayz_temperaturmin)) then {	//TeeChange
				_rnd = (random 1) * (((dayz_temperaturnormal - dayz_temperatur) * (100 /(dayz_temperaturnormal - dayz_temperaturmin)))/ 25);	//TeeChange
				if (_rnd < 0.05) then {
					_rnd = random 1;
					if (_rnd > 0.95) then {
						r_player_infected = true;
						player setVariable["USEC_infected",true];
					};
				};
			};
		};
	};
	
	//If has infection reduce blood
	if (r_player_infected) then {
		if (r_player_blood > 6000) then {
			r_player_blood = r_player_blood - 3;
		};
	};
	
	//Hunger Effect
	_foodVal = 		dayz_statusArray select 0;
	_thirstVal = 	dayz_statusArray select 1;
	if (_thirstVal <= 0) then {
		_result = r_player_blood - 10;
		if (_result < 0) then {
			_id = [player,"dehyd"] spawn player_death;
		} else {
			r_player_blood = _result;
		};
	};
	if (_foodVal <= 0) then {
		_result = r_player_blood - 10;
		if (_result < 0) then {
			_id = [player,"starve"] spawn player_death;
		} else {
			r_player_blood = _result;
		};
	};
	
	//Record low bloow
	_lowBlood = player getVariable ["USEC_lowBlood", false];
	if ((r_player_blood < r_player_bloodTotal) and !_lowBlood) then {
		player setVariable["USEC_lowBlood",true,true];
	};
	
	//Broadcast Hunger/Thirst
	_messTimer = _messTimer + 1;
	if (_messTimer > 15) then {
		_messTimer = 0;
		player setVariable ["messing",[dayz_hunger,dayz_thirst],true];
		bb_base	= player getVariable ["bb_base",[]];	
	};
	
	//check if can disconnect
	if (!dayz_canDisconnect) then {
		if ((time - dayz_damageCounter) > 180) then {
			if (!r_player_unconscious) then {
				dayz_canDisconnect = true;
				dayzDiscoRem = getPlayerUID player;
				publicVariableServer "dayzDiscoRem";
				
				//Ensure Control is hidden
				_display = uiNamespace getVariable 'DAYZ_GUI_display';
				_control = 	_display displayCtrl 1204;
				_control ctrlShow false;
			};
		};
	};
	_counzKill = _hitter getVariable ["zCountKill",0];
	//Save Checker
	if (dayz_unsaved) then {
		if ((time - dayz_lastSave) > _saveTime) then {
			DOgNo_Se = [player,dayz_Magazines,false];
			publicVariableServer "DOgNo_Se";
			//diag_log format ["SAVE_Pspawn2=%1",DOgNo_Se];
			dayz_lastSave = time;
			dayz_Magazines = [];
			dayz_unsaved = false;
		};
		_lastSave = _lastSave + 2;
	} else {
		dayz_lastSave = time;
		_lastSave = 0;
	};

	if (!dayz_unsaved) then {
		dayz_lastSave = time;
	};

	//Attach Trigger Current Object
	//dayz_playerTrigger attachTo [_refObj,[0,0,0]];
	//dayz_playerTrigger setTriggerArea [_size,_size,0,false];
	
	// If in combat, display counter and restrict logout
	_startcombattimer      = player getVariable["startcombattimer",0];
	if (_startcombattimer == 1) then {
		player setVariable["combattimeout", time + 30, true];
		player setVariable["startcombattimer", 0, true];
		dayz_combat = 1;
	};
	
//Debug Info
            _headShots =    player getVariable["headShots",0];
            _kills =                player getVariable["PlayerKills",0];
            _killsH =               player getVariable["heroKills",0];
            _killsB =               player getVariable["banditKills",0];
            _humanity =             player getVariable["humanity",0];
            _zombies =              count entities "zZombie_Base";
            _zombiesA =     {alive _x} count entities "zZombie_Base";		
			_combattimeout = player getVariable["combattimeout",0];
        
		if (_combattimeout > 0) then {
        _timeleft = _combattimeout - time;
        
		if (_timeleft > 0) then {
            		  hintSilent parseText format ["
	<t size='1.15' font='Bitstream' color='#5882FA'>Visit: www.epm-gaming.co.uk</t><br/><br/>				
	<t size='1.25'font='Bitstream'align='center'color='#2ECCFA'>In Combat %5</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Players Online: </t><t size='0.95 'font='Bitstream' align='right'>%10</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Murders: </t><t size='1.15' font='Bitstream' align='right'>%1</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Hero's Murdered: </t><t size='1.15' font='Bitstream' align='right'>%2</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Bandits Killed: </t><t size='1.15' font='Bitstream' align='right'>%3</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Zombies (alive/total): </t><t size='1.15' font='Bitstream' align='right'>%7/%6</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Humanity: </t><t size='1.15' font='Bitstream' align='right'>%4</t><br/>
    <t size='0.95' font='Bitstream' align='left'>Blood: </t><t size='0.95' font='Bitstream' align='right'>%9</t><br/>
	<t size='1.25'font='Bitstream'align='center'color='#2ECCFA'>Fps: %8</t><br/>",
	(player getVariable['playerKills', 0]),
	(player getVariable['heroKills', 0]),
	(player getVariable['banditKills', 0]),
	(player getVariable['humanity', 0]),
	round(_timeleft),
	(count entities "zZombie_Base"),
	({alive _x} count entities "zZombie_Base"),
    (round diag_fps),
	r_player_blood,
	(count playableUnits),
	(_killsH)
	];
        } else {
            hintSilent parseText format ["
	<t size='1.15' font='Bitstream' color='#5882FA'>Visit: www.epm-gaming.co.uk</t><br/><br/>				
	<t size='1.25'font='Bitstream'align='center'color='#2ECCFA'>Not in Combat</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Players Online: </t><t size='0.95 'font='Bitstream' align='right'>%10</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Murders: </t><t size='1.15' font='Bitstream' align='right'>%1</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Hero's Murdered: </t><t size='1.15' font='Bitstream' align='right'>%2</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Bandits Killed: </t><t size='1.15' font='Bitstream' align='right'>%3</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Zombies (alive/total): </t><t size='1.15' font='Bitstream' align='right'>%7/%6</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Humanity: </t><t size='1.15' font='Bitstream' align='right'>%4</t><br/>
    <t size='0.95' font='Bitstream' align='left'>Blood: </t><t size='0.95' font='Bitstream' align='right'>%9</t><br/>
	<t size='1.25'font='Bitstream'align='center'color='#2ECCFA'>Fps: %8</t><br/>",
	(player getVariable['playerKills', 0]),
	(player getVariable['heroKills', 0]),
	(player getVariable['banditKills', 0]),
	(player getVariable['humanity', 0]),
	round(_timeleft),
	(count entities "zZombie_Base"),
	({alive _x} count entities "zZombie_Base"),
    (round diag_fps),
	r_player_blood,
	(count playableUnits),
	(_killsH)
	];
 
            player setVariable["combattimeout", 0, true];
            dayz_combat = 0;
            _combatdisplay = uiNamespace getVariable 'DAYZ_GUI_display';
            _combatcontrol =    _combatdisplay displayCtrl 1307;
            _combatcontrol ctrlShow true;
        };
        } else {
          hintSilent parseText format ["
	<t size='1.15' font='Bitstream' color='#5882FA'>Visit: www.epm-gaming.co.uk</t><br/><br/>				
	<t size='1.25'font='Bitstream'align='center'color='#2ECCFA'>Not in Combat</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Players Online: </t><t size='0.95 'font='Bitstream' align='right'>%10</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Murders: </t><t size='1.15' font='Bitstream' align='right'>%1</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Hero's Murdered: </t><t size='1.15' font='Bitstream' align='right'>%2</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Bandits Killed: </t><t size='1.15' font='Bitstream' align='right'>%3</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Zombies (alive/total): </t><t size='1.15' font='Bitstream' align='right'>%7/%6</t><br/>
	<t size='0.95' font='Bitstream' align='left'>Humanity: </t><t size='1.15' font='Bitstream' align='right'>%4</t><br/>
    <t size='0.95' font='Bitstream' align='left'>Blood: </t><t size='0.95' font='Bitstream' align='right'>%9</t><br/>
	<t size='1.25'font='Bitstream'align='center'color='#2ECCFA'>Fps: %8</t><br/>",
	(player getVariable['playerKills', 0]),
	(player getVariable['heroKills', 0]),
	(player getVariable['banditKills', 0]),
	(player getVariable['humanity', 0]),
	round(_timeleft),
	(count entities "zZombie_Base"),
	({alive _x} count entities "zZombie_Base"),
    (round diag_fps),
	r_player_blood,
	(count playableUnits),
	(_killsH)
	];
       
        dayz_combat = 0;
        _combatdisplay = uiNamespace getVariable 'DAYZ_GUI_display';
        _combatcontrol =    _combatdisplay displayCtrl 1307;
        _combatcontrol ctrlShow true;
        };
  
	
	/*
	setGroupIconsVisible [false,false];
	clearGroupIcons group player;
	*/
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, (r_player_blood/r_player_bloodTotal)],  [1, 1, 1, 0.0]];
	"colorCorrections" ppEffectCommit 0;
	sleep 2;
	
	_myPos = player getVariable["lastPos",[]];
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
			};
		};
	};
};
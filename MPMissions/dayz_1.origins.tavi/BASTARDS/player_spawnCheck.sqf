private ["_isAir","_inVehicle","_dateNow","_maxZombies","_dist","_age","_radius","_locationstypes","_nearestCity","_position","_nearbytype","_nearby","_tooManyZs","_count","_type","_config","_canZombie","_canLoot","_dis","_keepAwayDist","_nearby2","_isNoone","_looted","_cleared","_nearByObj","_zombied","_bPos","_zombiesNum"];
_isAir = vehicle player iskindof "Air";
_inVehicle = (vehicle player != player);
_dateNow = (DateToNumber date);
_maxZombies = 20;
_dist = [22600,19600,0] distance player;
if ( _dist < 1000 ) exitWith {};
_age = -1;
// If they just got out of a vehicle, boost their per-player zombie limit by 5 in hopes of allowing insta-spawn zombies

/*
if (dayz_inVehicle and !_inVehicle) then {
    dayz_spawnWait = -50;
    //_maxZombies = _maxZombies + 2;
};
*/
dayz_inVehicle = _inVehicle;

//if (((time - dayz_spawnWait) < dayz_spawnDelay) or ((time - dayz_lootWait) < dayz_lootDelay)) exitWith {diag_log("Skipping Check since neither loot or zombies are ready");};
//if (((time - dayz_spawnWait) < dayz_spawnDelay) and ((time - dayz_lootWait) < dayz_lootDelay)) exitWith {};
//diag_log("SPAWN CHECKING: Starting");
_radius = 190; 
_locationstypes = ["NameCityCapital","NameCity","NameVillage","NameLocal"];
_nearestCity = nearestLocations [getPos player, _locationstypes, _radius];
//_nearestCity = [_locationstypes,[position player,600],false] call bis_fnc_locations;
//diag_log ("0: " +str(_nearestCity));

_position = getPosATL player;
if ((count _nearestCity) > 0) then {
	_position = position (_nearestCity select 0);  	
};

_nearbytype = type (_nearestCity select 0);
_nearby = nearestObjects [_position, ["building"], _radius];
//diag_log format ["p_sCH _nearestCity=%1,_nearby=%2,_nearbytype=%3",_nearestCity,_nearby,_nearbytype];

switch (_nearbytype) do {
	default {
		_maxZombies = 10;
	};
	case "NameLocal": {
		_maxZombies = 10;
	};
	case "NameVillage": {
		_maxZombies = 15;
	};
	case "NameCity": {
		_maxZombies = 20;
	};
	case "NameCityCapital": {
		_maxZombies = 20;
	};
};

//diag_log ("nearbytype: " +str(_nearbytype));
if (_inVehicle) then {
	_maxZombies = 4;
};
	_tooManyZs = count (_position nearEntities ["zZombie_Base",400]) > 12;
	//diag_log("Too Many Zeds: " +str(_tooManyZs));
    //diag_log(format["SPAWN CHECK: Building count is %1", count _nearby]);
	_count = ({alive _x} count allMissionObjects "zZombie_Base");
	//hint "Total Zeds: " +str(_count));
	//hint format["Total Zeds %1",_count];
	//diag_log ("Total Zeds: " +str(_count));
	{
		_type = typeOf _x;
		if ((_type != "LAND_x") and (_type !="WeaponHolder")) then {
			//diag_log("SPAWN CHECK: Start of Loop");
			
			_config = 		configFile >> "CfgBuildingLoot" >> _type;
			_canZombie = isClass (_config);
			_canLoot = ((count (getArray (_config >> "lootPos"))) > 0);
			//_dis = _x distance player;
			//diag_log format ["Type: %1, _canLoot = %2", _type, _canLoot];
		
			if ((!_inVehicle) and (_canLoot)) then {    
				//diag_log("SPAWN LOOT: " + _type + " Building is lootable");
				//dayz_serverSpawnLoot = [_dis, _x];
				//publicVariableServer "dayz_serverSpawnLoot";
				if((_type == "LAND_bus_depo") or (_type == "LAND_bus_depo_geo1") or (_type == "LAND_bus_depo_geo2")) then {
					_keepAwayDist = ((sizeOf _type)-20);
				} else {
					_keepAwayDist = ((sizeOf _type)+20);
				};
				_nearby2 = (getposATL _x) nearEntities [["ori_vil_woman_survivor_1","ori_vil_woman_survivor_2","ori_vil_woman_survivor_3","ori_vil_woman_survivor_4","ori_vil_woman_survivor_5","ori_vil_woman_survivor_6","ori_vil_woman_bandit_1","ori_vil_woman_bandit_2","ori_vil_woman_bandit_3","ori_vil_woman_bandit_4","ori_vil_woman_bandit_5","ori_vil_woman_bandit_6","ori_vil_woman_hero_1","ori_vil_woman_hero_2","ori_vil_woman_hero_3","ori_vil_woman_hero_4","ori_vil_woman_hero_5","ori_vil_woman_hero_6","SurvivorW2_DZ","Bandit1_DZ","Survivor2_DZ","Survivor2_1DZ","Survivor2_2DZ","Survivor2_3DZ","Survivor3_DZ","Survivor4_DZ","Survivor4_1DZ","Survivor4_2DZ","Survivor4_3DZ","Survivor8_DZ","Survivor8_1DZ","Survivor8_2DZ","Survivor8_3DZ","Bandit_S_DZ","Bandit1_1DZ","Bandit1_2DZ","Bandit1_3DZ","Bandit1_3_1DZ","Bandit1_3_2DZ","Bandit2_1DZ","Bandit2_2DZ","Bandit2_3DZ","Bandit2_4DZ","Bandit2_5DZ","Bandit3_1","Hero1_1DZ","Hero1_2DZ","Hero1_3DZ","Hero1_4DZ","Hero1_5DZ","Hero1_6DZ","Hero1_7DZ","Hero2_1DZ","Hero2_2DZ","Hero2_3DZ","Hero2_4DZ","Hero2_5DZ","Hero3_1DZ","Hero3_2DZ","Hero3_3DZ","Hero3_4DZ","Hero3_5DZ","Hero3_6DZ","Hero2_10DZ","Sniper1_DZ"],_keepAwayDist];
				_isNoone = count (_nearby2) == 0;
				//diag_log(format["SPAWN LOOT: isNoone: %1 | keepAwayDist %2 | %3", str(_isNoone), _keepAwayDist, _type]);
				if (_isNoone) then {
					_looted = (_x getVariable ["looted",-0.1]);
					_cleared = (_x getVariable ["cleared",true]);
					_dateNow = (DateToNumber date);
					_age = (_dateNow - _looted) * 525948;
					//diag_log ("SPAWN LOOT: " + _type + " Building is " + str(_age) + " old" );
					if (_age > 1) then {
						//diag_log("SPAWN LOOT: Spawning loot");
						//Register
						_x setVariable ["looted",_dateNow,true];
						//cleanup
						//_nearByObj = (getPosATL _x) nearObjects ["ReammoBox",((sizeOf _type)+5)];
						//{deleteVehicle _x} forEach _nearByObj;
						dayz_lootWait = time;
						[_x] call building_spawnLoot;
					};
				};
			};
			
			if (_canZombie) then {
				if (dayz_spawnZombies < _maxZombies) then {
					if (!_tooManyZs) then {
						private["_zombied"];
						_zombied = (_x getVariable ["zombieSpawn",-0.1]);
						_dateNow = (DateToNumber date);
						_age = (_dateNow - _zombied) * 525948;
						//diag_log format ["Date: %1 | ZombieSpawn: %2 | age: %3 | building: %4 (%5)", _dateNow, _zombied, _age, typeOf _x, _dis];
						if (_age > 1) then {
							_bPos = getPosATL _x;
							_zombiesNum = count (_bPos nearEntities ["zZombie_Base",(((sizeOf _type) * 2) + 15)]);	
							//diag_log format ["ZombiesNum: %1,sizeOf = %2,_type=%3",_zombiesNum,sizeOf _type,_type];
							if (_zombiesNum == 0) then {
								//Randomize Zombies
								_x setVariable ["zombieSpawn",_dateNow,true];
								[_x] call building_spawnZombies;
							};
						};
					};
				};
			};
		};
	} forEach _nearby;
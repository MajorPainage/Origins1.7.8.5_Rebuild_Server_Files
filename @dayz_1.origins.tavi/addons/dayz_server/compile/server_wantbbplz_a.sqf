private["_player","_item","_playerIDc","_typN1","_typN2","_canBuildH","_anim","_objectF","_stageArF","_selection","_dam","_GivName","_text","_tA","_tA2","_count","_tT","_basebbm","_playerIDs","_bbases","_playerID","_pNameR","_stageAr","_hasBPitem","_housetype","_levelhouse","_bb_baseserver","_posit","_dir","_object","_vector","_worldspace","_uid","_key","_gObjId","_objectIDCl","_zapiskavDB"];
diag_log format ["server_wantbbplz this=%1",_this];
_player 	= _this select 0;
_item 		= _this select 1;
_playerIDc 	= _this select 2;
_typN1 = typeName _player;
_typN2 = typeName _item;
_canBuildH = false;
_gObjId = "";
_sObjId = "";
_zapiskavDB = false;
OriginBB = [];
if (isNull _player) exitWith { diag_log ("SETUP INIT FAILED: Exiting, player object null: " + str(_player)); };

_anim = {
_objectF = _this select 0;
_stageArF = _this select 1;
{
_selection = _x select 0;
_dam = _x select 1;
if(_selection != "passwordtut") then {
if (_dam == 9999999) then {
_objectF setVariable ["Name",_selection,false];
_objectF setVariable ["PName",_selection,true];
} else {
_objectF animate [_selection,_dam];
};
} else {
_objectF setVariable ["passwordtut",_dam,false];
};
diag_log format ["_selection=%1,_dam=%2",_selection,_dam];
} forEach _stageArF;
};

_GivName = {
_text = _this select 0;
_tA = toArray _text;
_tA2 = [];
_count = 0;
{
if (_x == 34) then { _x = 39; };
_tA2 set [_count,_x];
_count = _count + 1;
} forEach _tA;
_tT = toString _tA2;
_tT;
};

_basebbm = {
_playerIDs = _this select 0;
_bbases = [];

if (_playerID in bb_base_level1b) then { _bbases set [0,1]; } else { _bbases set [0,0]; };
if (_playerID in bb_base_level2b) then { _bbases set [1,1]; } else { _bbases set [1,0]; };
if (_playerID in bb_base_level3b) then { _bbases set [2,1]; } else { _bbases set [2,0]; };





if (_playerID in bb_base_level1g) then { _bbases set [3,1]; } else { _bbases set [3,0]; };
if (_playerID in bb_base_level2g) then { _bbases set [4,1]; } else { _bbases set [4,0]; };

if (_playerID in bb_base_level1f) then { _bbases set [5,1]; } else { _bbases set [5,0]; };
if (_playerID in bb_base_level2f) then { _bbases set [6,1]; } else { _bbases set [6,0]; };
if (_playerID in bb_base_level3f) then { _bbases set [7,1]; } else { _bbases set [7,0]; };

_bbases;
};

diag_log format ["LOG_BB _player=%1(%2),_item=%3(%4),",_player,typeName _player,_item,typeName _item];
if (!(_typN1 == "OBJECT")) exitWith { diag_log format ["ERROR_BB Player is not OBJECT(%1, %2)",_player,_item]; };
_playerID =	getPlayerUID _player;
_pNameR = [name _player] call _GivName;
if (_playerID != _playerIDc) exitWith { diag_log format ["ERROR_BB Wrong _playerIDc(%4) recived from %1, %2, %3",_playerID,_player,_item,_playerIDc]; };

_stageAr =  [];
if (_typN2 == "STRING") then {
_stopGo = false;
if (!(_item in ["ItemBpt_b1","ItemBpt_b2","ItemBpt_b3","ItemBpt_h1","ItemBpt_h2","ItemBpt_h3","ItemBpt_g_s","ItemBpt_g_b"])) exitWith { diag_log format ["ERROR_BB Wrong _item(%1) recived from %2",_item,_playerID]; _stopGo = true; };
if (!_stopGo) then {




if (_item == "ItemBpt_b1") then { 
if (_playerID in bb_base_level1b) exitWith { diag_log format ["ERROR_BB _playerID(%1) already have level 1b(%2)",_playerID,_item]; };

_housetype = "wooden_shed_lvl_1"; _levelhouse = 1;
bb_base_level1b set [count bb_base_level1b, _playerID]; _canBuildH = true;
_stageAr = [["stage_1",0],["stage_2",1],[_pNameR,9999999]];

};
if (_item == "ItemBpt_b2") then { 
if (!(_playerID in bb_base_level1b)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b for 2b(%2)",_playerID,_item]; };
if (!(_playerID in bb_base_level1f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b finished for 2b(%2)",_playerID,_item]; };
if (_playerID in bb_base_level2b) exitWith { diag_log format ["ERROR_BB _playerID(%1) already have level 2b(%2)",_playerID,_item]; };
_housetype = "log_house_lvl_2"; _levelhouse = 1;
bb_base_level2b set [count bb_base_level2b, _playerID]; _canBuildH = true;
_stageAr = [["stage_1",0],["stage_2",1],["stage_3",1],["stage_4",1],[_pNameR,9999999]];
};
if (_item == "ItemBpt_b3") then {
if (!(_playerID in bb_base_level1b)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b for 3b(%2)",_playerID,_item]; };
if (!(_playerID in bb_base_level2b)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 2b for 3b(%2)",_playerID,_item]; }; 
if (!(_playerID in bb_base_level1f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b finished for 3h(%2)",_playerID,_item]; };
if (!(_playerID in bb_base_level2f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 2b finished for 3b(%2)",_playerID,_item]; };
if (_playerID in bb_base_level3b) exitWith { diag_log format ["ERROR_BB _playerID(%1) already have level 3b(%2)",_playerID,_item]; };
_housetype = "wooden_house_lvl_3"; _levelhouse = 1;
bb_base_level3b set [count bb_base_level3b, _playerID]; _canBuildH = true;
_stageAr = [["stage_1",0],["stage_2",1],["stage_3",1],["stage_4",1],["upgrd_1_stage_1",1],["upgrd_1_stage_2",1],["upgrd_1_stage_3",1],["upgrd_1_stage_4",1],["upgrd_1_show_1",1],["upgrd_1_hide_1",1],[_pNameR,9999999]];

};

if (_item == "ItemBpt_h1") then { 
if (_playerID in bb_base_level1b) exitWith { diag_log format ["ERROR_BB _playerID(%1) already have level 1h(%2)",_playerID,_item]; };
_housetype = "large_shed_lvl_1"; _levelhouse = 1;
bb_base_level1b set [count bb_base_level1b, _playerID]; _canBuildH = true;
_stageAr = [["stage_1",0],["stage_2",1],[_pNameR,9999999]];
};
if (_item == "ItemBpt_h2") then {
if (!(_playerID in bb_base_level1b)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b for 2h(%2)",_playerID,_item]; };
if (!(_playerID in bb_base_level1f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b finished for 2h(%2)",_playerID,_item]; };
if (_playerID in bb_base_level2b) exitWith { diag_log format ["ERROR_BB _playerID(%1) already have level 2h(%2)",_playerID,_item]; };
_housetype = "small_house_lvl_2"; _levelhouse = 1;
bb_base_level2b set [count bb_base_level2b, _playerID]; _canBuildH = true;
_stageAr = [["stage_1",0],["stage_2",1],["stage_3",1],["stage_4",1],["stage_2_hide",1],[_pNameR,9999999]];
};
if (_item == "ItemBpt_h3") then {
if (!(_playerID in bb_base_level1b)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b for 3h(%2)",_playerID,_item]; };
if (!(_playerID in bb_base_level1b)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 2b for 3h(%2)",_playerID,_item]; };
if (!(_playerID in bb_base_level1f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b finished for 3h(%2)",_playerID,_item]; };
if (!(_playerID in bb_base_level2f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 2b finished for 3h(%2)",_playerID,_item]; };
if (_playerID in bb_base_level3b) exitWith { diag_log format ["ERROR_BB _playerID(%1) already have level 3h(%2)",_playerID,_item]; };
_housetype = "big_house_lvl_3"; _levelhouse = 1;
bb_base_level3b set [count bb_base_level3b, _playerID]; _canBuildH = true;
_stageAr = [["stage_1",0],["stage_2",1],["stage_3",1],["stage_4",1],["upgrd_1_stage_1",1],["upgrd_1_stage_2",1],["upgrd_1_stage_3",1],["upgrd_1_stage_4",1],["upgrd_1_show_1",1],["upgrd_1_hide_1",1],[_pNameR,9999999]];
};

if (_item == "ItemBpt_g_s") then {
if (!(_playerID in bb_base_level1b) && !(_playerID in bb_base_level2b)&& !(_playerID in bb_base_level3b)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b,1h for 1g(%2)",_playerID,_item]; };
if (!(_playerID in bb_base_level1f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b finished for 1g(%2)",_playerID,_item]; };
if (_playerID in bb_base_level1g) exitWith { diag_log format ["ERROR_BB _playerID(%1) already have small g(%2)",_playerID,_item]; };
_housetype = "small_garage"; _levelhouse = 1;
bb_base_level1g set [count bb_base_level1g, _playerID]; _canBuildH = true;
_stageAr = [["stage_1",0],["stage_2",1],["stage_3",1],["stage_4",1],[_pNameR,9999999]];
};
if (_item == "ItemBpt_g_b") then { 
if (!(_playerID in bb_base_level3b)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 3b,3h for 2g(%2)",_playerID,_item]; };
if (!(_playerID in bb_base_level1f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b finished for 2g(%2)",_playerID,_item]; };
if (!(_playerID in bb_base_level2f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 2b finished for 2g(%2)",_playerID,_item]; };
if (!(_playerID in bb_base_level3f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 3b finished for 2g(%2)",_playerID,_item]; };
if (_playerID in bb_base_level2g) exitWith { diag_log format ["ERROR_BB _playerID(%1) already have big g(%2)",_playerID,_item]; };
_housetype = "big_garage"; _levelhouse = 1;
bb_base_level2g set [count bb_base_level2g, _playerID]; _canBuildH = true;
_stageAr = [["stage_1",0],["stage_2",1],["stage_3",1],["stage_4",1],[_pNameR,9999999]];
};

if (_canBuildH) then {
_findMix = position _player nearObjects ["CementMixer",15];
_listMix = 	count _findMix == 1;
diag_log format ["_findMix=%1",_findMix];
if (_listMix) then {
deleteVehicle (_findMix select 0);

_bb_baseserver = [_playerID] call _basebbm;
_player setVariable["bb_base",_bb_baseserver,true];

_posit = _player modeltoworld [0,8,0];
diag_log format ["_posit=%1",_posit];
_posit set [2,0];
_dir = round(direction _player);
diag_log format ["LOG_BB2 _playerID(%1),item(%2),%3,%4",_playerID,_item,_player,_bb_baseserver];


_object = createVehicle [_housetype, _posit, [], 0, "CAN_COLLIDE"];
_object setdir _dir;
_object setpos _posit;
_vector = vectorUp _object;
[_object, _stageAr] call _anim;


_player reveal _object;
_worldspace = [_dir,_posit,_vector];

_uid = _worldspace call dayz_objectUID2;


_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _housetype, 0, _playerID, _worldspace, [], _stageAr, 0,_uid];

_key call server_hiveWrite;

ori_servObjMonitor set [count ori_servObjMonitor,_object];

_object setVariable ["Name",_pNameR,false];
_object setVariable ["Slevelhouse",_levelhouse,false];
_object setVariable ["HObjectID", 0, false];
_object setVariable ["SOwner", _playerID, false];

_object setVariable ["PName",_pNameR,true];
_object setVariable ["levelhouse",_levelhouse,true];

_object setVariable ["ObjectUID", _uid, true];
_object setVariable ["CharacterID", _playerID, true];
diag_log format ["_housetype=%1,_playerID=%2,_stageAr=%3,_worldspace=%4",_housetype,_playerID,_stageAr,_worldspace];
} else { diag_log format ["Mixer not found %1(%2)",_findMix,_listMix]; };
} else { diag_log format ["ERROR _housetype=%1,_playerID=%2,_stageAr=%3,_worldspace=%4",_housetype,_playerID,_stageAr,_worldspace]; };
};
};

if (_typN2 == "SCALAR") then {
_conti = count (_this) == 5;
diag_log format ["START_UPG _this = %1",_this];
if (!_conti) then { diag_log format ["ERROR_UPG Recive bad data (%1)",_this];  } else {
_object = _this select 3;
_password = _this select 4;
_slevel = _object getVariable ["Slevelhouse",0];
_sOwners = _object getVariable ["SOwner","Net"];
_sObjId = _object getVariable ["HObjectID","0"];
_gObjId = _object getVariable ["ObjectID","0"];
_zapiskavDB = false;
if (typeName _sObjId != "string") then { 
_slevel = 0;
diag_log format ["ERROR_UPG _sObjId(%1)",_sObjId];
};
_nextlevel = _slevel + 1;
if (_item != _nextlevel) then { diag_log format ["ERROR_UPG House level error (%3)(%1)!=(%2)(%4)",_item,_slevel,typeName _item,typeName _slevel]; _slevel = 0; };
if (_playerID != _sOwners) then { diag_log format ["ERROR_UPG House Owner  (%1)!=(%2)",_playerID,_sOwners]; _slevel = 0; };
if (_sObjId != _gObjId) then { diag_log format ["ERROR_UPG House ObjectID  (%1)!=(%2)",_sObjId,_gObjId]; _slevel = 0; };
if (typeName _password != "SCALAR") then { diag_log format ["ERROR_UPG _pass(%1)!=SCALAR,%2,%3,%4",_password,_playerID,_sObjId,_gObjId]; _slevel = 0; };
if (_slevel != 0) then {
_objType = typeOf _object;
if (!(_objType in ["wooden_shed_lvl_1","log_house_lvl_2","wooden_house_lvl_3","large_shed_lvl_1","small_house_lvl_2","big_house_lvl_3","small_garage","big_garage"])) then { diag_log format ["ERROR_BB Wrong _item(%1) recived from %2",_item,_playerID]; } else {

if ((_objType == "wooden_shed_lvl_1") OR (_objType == "large_shed_lvl_1")) then { 
if (!(_playerID in bb_base_level1b)) then { diag_log format ["ERROR_UPG _playerID not in level 1b (%1)!=(%2)",_playerID,bb_base_level1b]; 
} else {
if (_nextlevel == 2) then { 
if (_password != 0) then {
_Ok = (999999-_password)>=0;
if (_Ok) then {
_stageAr = [["stage_1",0],["stage_2",0],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
} else { diag_log format ["ERROR_UPG _password , level(%3) 1b (%1),(%2)",_playerID,_password,_nextlevel]; };
} else { diag_log format ["ERROR_UPG _password=0 , level(%3) 1b (%1),(%2)",_playerID,_password,_nextlevel]; };
};

};
};

if ((_objType == "log_house_lvl_2") OR (_objType == "small_house_lvl_2")) then {
if (!(_playerID in bb_base_level1f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b finished for UPG 2borh(%2)",_playerID,bb_base_level1b]; };
if (!(_playerID in bb_base_level2b)) then { diag_log format ["ERROR_UPG _playerID not in level 2b (%1)!=(%2)",_playerID,bb_base_level2b]; 
} else {
if (_nextlevel == 2) then {
if (_objType == "log_house_lvl_2") then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",1],["stage_4",1],[_pNameR,9999999]];
diag_log format ["OK_UPG = %1(p=-),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId];
_zapiskavDB = true;
} else {
_stageAr = [["stage_1",0],["stage_2",0],["stage_2_hide",0],["stage_3",1],["stage_4",1],[_pNameR,9999999]];
diag_log format ["OK_UPG = %1(p=-),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId];
_zapiskavDB = true;
};

};
if (_nextlevel == 3) then {
if (_password != 0) then {
_Ok = (999999-_password)>=0;
if (_Ok) then { 
if (_objType == "log_house_lvl_2") then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",0],["stage_4",1],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
} else {
_stageAr = [["stage_1",0],["stage_2",0],["stage_2_hide",1],["stage_3",0],["stage_4",1],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
};
_object setVariable ["passwordtut",_password,false]; 
} else { diag_log format ["ERROR_UPG _password , level(%3) 2b (%1),(%2)",_playerID,_password,_nextlevel]; };
} else { diag_log format ["ERROR_UPG _password=0 , level(%3) 2b (%1),(%2)",_playerID,_password,_nextlevel]; };
};
if (_nextlevel == 4) then { 
_password = _object getVariable ["passwordtut",0];
if (_password != 0) then {
_Ok = (999999-_password)>=0;
if (_Ok) then {
if (_objType == "log_house_lvl_2") then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",0],["stage_4",0],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
} else {
_stageAr = [["stage_1",0],["stage_2",0],["stage_2_hide",1],["stage_3",0],["stage_4",0],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
};
} else { diag_log format ["ERROR_UPG _password>=0 , level(%3) 2b (%1),(%2)",_playerID,_password,_nextlevel]; };
} else { diag_log format ["ERROR_UPG _password=0 , level(%3) 2b (%1),(%2)",_playerID,_password,_nextlevel]; };
};
};
};

if ((_objType == "wooden_house_lvl_3") OR (_objType == "big_house_lvl_3")) then {
if (!(_playerID in bb_base_level1f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b finished for UPG 3borh(%2)",_playerID,bb_base_level1b]; };
if (!(_playerID in bb_base_level2f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 2b finished for UPG 3borh(%2)",_playerID,bb_base_level2b]; };
if (!(_playerID in bb_base_level3b)) then { diag_log format ["ERROR_UPG _playerID not in level 3b (%1)!=(%2)",_playerID,bb_base_level3b]; 
} else {
if (_nextlevel == 2) then {
if (_objType == "wooden_house_lvl_3") then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",1],["stage_4",1],["upgrd_1_stage_1",1],["upgrd_1_stage_2",1],["upgrd_1_stage_3",1],["upgrd_1_stage_4",1],["upgrd_1_show_1",1],["upgrd_1_hide_1",1],[_pNameR,9999999]];
diag_log format ["OK_UPG = %1(p=-),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId];
_zapiskavDB = true;
} else {
if (_password != 0) then {
_Ok = (999999-_password)>=0;
if (_Ok) then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",1],["stage_4",1],["upgrd_1_stage_1",1],["upgrd_1_stage_2",1],["upgrd_1_stage_3",1],["upgrd_1_stage_4",1],["upgrd_1_show_1",1],["upgrd_1_hide_1",0],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
_object setVariable ["passwordtut",_password,false];
} else { diag_log format ["ERROR_UPG _password>=0 , level(%3) 3b (%1),(%2)",_playerID,_password,_nextlevel]; };
} else { diag_log format ["ERROR_UPG _password=0 , level(%3) 3b (%1),(%2)",_playerID,_password,_nextlevel]; };
};
};
if (_nextlevel == 3) then {
if (_objType == "wooden_house_lvl_3") then {
if (_password != 0) then {
_Ok = (999999-_password)>=0;
if (_Ok) then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",0],["stage_4",1],["upgrd_1_stage_1",1],["upgrd_1_stage_2",1],["upgrd_1_stage_3",1],["upgrd_1_stage_4",1],["upgrd_1_show_1",1],["upgrd_1_hide_1",0],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
_object setVariable ["passwordtut",_password,false];
} else { diag_log format ["ERROR_UPG _password>=0 , level(%3) 3b (%1),(%2)",_playerID,_password,_nextlevel]; };
} else { diag_log format ["ERROR_UPG _password=0 , level(%3) 3b (%1),(%2)",_playerID,_password,_nextlevel]; };
} else {
_password = _object getVariable ["passwordtut",0];
if (_password != 0) then {
_Ok = (999999-_password)>=0;
if (_Ok) then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",0],["stage_4",1],["upgrd_1_stage_1",1],["upgrd_1_stage_2",1],["upgrd_1_stage_3",1],["upgrd_1_stage_4",1],["upgrd_1_show_1",1],["upgrd_1_hide_1",0],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
} else { diag_log format ["ERROR_UPG _password>=0 , level(%3) 3b (%1),(%2)",_playerID,_password,_nextlevel]; };
} else { diag_log format ["ERROR_UPG _password=0 , level(%3) 3b (%1),(%2)",_playerID,_password,_nextlevel]; };
};
};
if (_nextlevel == 4) then {
_password = _object getVariable ["passwordtut",0];
if (_password != 0) then {
_Ok = (999999-_password)>=0;
if (_Ok) then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",0],["stage_4",0],["upgrd_1_stage_1",1],["upgrd_1_stage_2",1],["upgrd_1_stage_3",1],["upgrd_1_stage_4",1],["upgrd_1_show_1",1],["upgrd_1_hide_1",0],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
} else { diag_log format ["ERROR_UPG _password>=0 , level(%3) 3b (%1),(%2)",_playerID,_password,_nextlevel]; };
} else { diag_log format ["ERROR_UPG _password=0 , level(%3) 3b (%1),(%2)",_playerID,_password,_nextlevel]; };
};
if ((_nextlevel >4)&&(_nextlevel<=8)) then {
_password = _object getVariable ["passwordtut",0];
if (_password != 0) then {
_Ok = (999999-_password)>=0;
if (_Ok) then {
if (_nextlevel == 5) then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",0],["stage_4",0],["upgrd_1_stage_1",0],["upgrd_1_stage_2",1],["upgrd_1_stage_3",1],["upgrd_1_stage_4",1],["upgrd_1_show_1",1],["upgrd_1_hide_1",0],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
};
if (_nextlevel == 6) then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",0],["stage_4",0],["upgrd_1_stage_1",0],["upgrd_1_stage_2",0],["upgrd_1_stage_3",1],["upgrd_1_stage_4",1],["upgrd_1_show_1",1],["upgrd_1_hide_1",0],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
};
if (_nextlevel == 7) then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",0],["stage_4",0],["upgrd_1_stage_1",0],["upgrd_1_stage_2",0],["upgrd_1_stage_3",0],["upgrd_1_stage_4",1],["upgrd_1_show_1",1],["upgrd_1_hide_1",0],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
};
if (_nextlevel == 8) then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",0],["stage_4",0],["upgrd_1_stage_1",0],["upgrd_1_stage_2",0],["upgrd_1_stage_3",0],["upgrd_1_stage_4",0],["upgrd_1_show_1",0],["upgrd_1_hide_1",1],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
};
} else { diag_log format ["ERROR_UPG _password>=0 , level(%3) 3b (%1),(%2)",_playerID,_password,_nextlevel]; };
} else { diag_log format ["ERROR_UPG _password=0 , level(%3) 3b (%1),(%2)",_playerID,_password,_nextlevel]; };
};
};
};

if ((_objType == "small_garage") OR (_objType == "big_garage")) then { _Ok = true;
if (!(_playerID in bb_base_level1f)) exitWith { diag_log format ["ERROR_BB _playerID(%1) not have 1b finished for UPG 1g(%2)",_playerID,bb_base_level1b]; };
if (_objType == "small_garage") then {
if (!(_playerID in bb_base_level4b)) then { diag_log format ["ERROR_UPG _playerID not in level 4b (%1)!=(%2)",_playerID,bb_base_level4b]; _Ok = false;  };
};
if (_objType == "big_garage") then {
if (!(_playerID in bb_base_level1f)) then { diag_log format ["ERROR_BB _playerID(%1) not have 1b finished for UPG 2g(%2)",_playerID,bb_base_level1b]; _Ok = false; };
if (!(_playerID in bb_base_level2f)) then { diag_log format ["ERROR_BB _playerID(%1) not have 2b finished for UPG 2g(%2)",_playerID,bb_base_level2b]; _Ok = false; };
if (!(_playerID in bb_base_level3f)) then { diag_log format ["ERROR_BB _playerID(%1) not have 3b finished for UPG 2g(%2)",_playerID,bb_base_level3b]; _Ok = false; };
if (!(_playerID in bb_base_level5b)) then { diag_log format ["ERROR_UPG _playerID not in level 5b (%1)!=(%2)",_playerID,bb_base_level5b]; _Ok = false; };
};
if (_Ok) then {
if (_nextlevel == 2) then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",1],["stage_4",1],[_pNameR,9999999]];
diag_log format ["OK_UPG G = %1(p=-),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId];
_zapiskavDB = true;
};
if (_nextlevel == 3) then {
if (_password != 0) then {
_Ok = (999999-_password)>=0;
if (_Ok) then {
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",0],["stage_4",1],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG G = %1(p=-),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId];
_zapiskavDB = true;
} else { diag_log format ["ERROR_UPG _password , level(%3) g (%1),(%2)",_playerID,_password,_nextlevel]; };
} else { diag_log format ["ERROR_UPG _password=0 , level(%3) g (%1),(%2)",_playerID,_password,_nextlevel]; };
};
if (_nextlevel == 4) then {

if (_password != 0) then {
_Ok = (999999-_password)>=0;
if (_Ok) then { 
_stageAr = [["stage_1",0],["stage_2",0],["stage_3",0],["stage_4",0],[_pNameR,9999999],["passwordtut",_password]];
diag_log format ["OK_UPG G = %1(p=%5),_nlvl=%2,_sObjId=%3,_gObjId=%4",_stageAr,_nextlevel,_sObjId,_gObjId,_password];
_zapiskavDB = true;
_object setVariable ["passwordtut",_password,false]; 
} else { diag_log format ["ERROR_UPG _password , level(%3) g (%1),(%2)",_playerID,_password,_nextlevel]; };
} else { diag_log format ["ERROR_UPG _password=0 , level(%3) g (%1),(%2)",_playerID,_password,_nextlevel]; };
};
};
};

if (_zapiskavDB) then {
_bb_baseserver = [_playerID] call _basebbm;
clearMagazineCargoGlobal _object;
[_object, _stageAr] call _anim;
if ((_objType == "small_garage") OR (_objType == "big_garage")) then {	
_object animate ["garage_gate_1",1];
_object animate ["garage_gate_2",1];
_object animate ["garage_door_la",1];
_object animate ["garage_door_ra",1];
};
_player setVariable["bb_base",_bb_baseserver,true];
_object setVariable ["Slevelhouse",_nextlevel,false];
_object setVariable ["levelhouse",_nextlevel,true];
_object setVariable ["SOwner", _sOwners, false];
_object setVariable ["HObjectID", _sObjId, false];
_object setVariable ["ObjectID", _sObjId, true];



diag_log format ["LOG2_UPG level(%3)p(%1)pid(%2),objID(%4)upAr(%5)",_playerID,_password,_nextlevel,_sObjId,_stageAr];

_key = format["CHILD:306:%1:%2:%3:",_sObjId,_stageAr,0];

_key call server_hiveWrite;

dayUpdateVehlcle = [_object,"gear"];
dayUpdateVehlcle call server_updatObiect;


} else { diag_log format ["ERROR_UPG level(%3)p(%1)pid(%2),objID(%4)upAr(%5)",_playerID,_password,_nextlevel,_sObjId,_stageAr]; };
};
};

};
};
private["_id","_uid","_key","_objectID","_objName","_objPos","_ktoDel","_nearByW","_listB","_nearBy","_allowedTo"];
diag_log format["DELETE: Deleted %1",_this];
_id 	= _this select 0;
_uid 	= _this select 1;
_type	= _this select 2;
_goStop = false;
_allowedTo  = ["wooden_shed_lvl_1","log_house_lvl_2","wooden_house_lvl_3","large_shed_lvl_1","small_house_lvl_2","big_house_lvl_3","small_garage","big_garage"];
_basebbm = {
_playerIDs = _this select 0;
_bbases = [0,0,0,0,0];

if (_playerID in bb_base_level1b) then { _bbases set [0,1]; };
if (_playerID in bb_base_level2b) then { _bbases set [1,1]; };
if (_playerID in bb_base_level3b) then { _bbases set [2,1]; };





if (_playerID in bb_base_level1g) then { _bbases set [3,1]; };
if (_playerID in bb_base_level2g) then { _bbases set [4,1]; };
_bbases;
};

if (_type in _allowedTo) then {
_obj	= _this select 3;
_player	= _this select 4;
_playerID 	=	getPlayerUID _player;
_sOwners 	= _obj getVariable ["SOwner","Net"];
_sObjId 	= _obj getVariable ["HObjectID","0"];
_gObjId 	= _obj getVariable ["ObjectID","0"];
_slevel = _object getVariable ["Slevelhouse",0];
if (_playerID !=_sOwners) then { diag_log format ["ERROR_DEL_OBJ _playerID:%1, _sOwners:%2, _obj:%3, _sObjId:%4, _type:%5",_playerID,_sOwners,_obj,_sObjId,_type]; _goStop = true; };
if (_slevel >1) then { diag_log format ["ERROR_DEL_OBJ Level>0 _playerID:%1, _sOwners:%2, _obj:%3, _sObjId:%4, _type:%5,_slevel:%6",_playerID,_sOwners,_obj,_sObjId,_type,_slevel]; _goStop = true; };
if (!_goStop) then {
if ((_type == "wooden_shed_lvl_1") 	OR (_type == "large_shed_lvl_1")) 	then { bb_base_level1b = bb_base_level1b - [_playerID]; };
if ((_type == "log_house_lvl_2") 	OR (_type == "small_house_lvl_2")) 	then { bb_base_level2b = bb_base_level2b - [_playerID]; };
if ((_type == "wooden_house_lvl_3") OR (_type == "big_house_lvl_3")) 	then { bb_base_level3b = bb_base_level3b - [_playerID]; };

if (_type == "small_garage") 	then { bb_base_level1g = bb_base_level1g - [_playerID]; };
if (_type == "big_garage") 		then { bb_base_level2g = bb_base_level2g - [_playerID]; };
_bb_baseserver = [_playerID] call _basebbm;
_player setVariable["bb_base",_bb_baseserver,true];
diag_log format ["_playerID = %1,_bb_baseserver=%2",_playerID,_bb_baseserver];









};
};
if (_goStop) exitWith { diag_log format ["ERROR_DEL_OBJ Something Wrong."]; };

if (_id != "CroseHere")	then {
if (parseNumber _id > 0) then {

_key = format["CHILD:304:%1:",_id];
_key call server_hiveWrite;
diag_log format["DELETE: Deleted by ID: %1",_id];
} else  {

_key = format["CHILD:310:%1:",_uid];
_key call server_hiveWrite;
diag_log format["DELETE: Deleted by UID: %1",_uid];
};
} else {

_objName = _this select 1;
_objPos  = _this select 2;
_ktoDel  = _this select 3;
_nearBy  = _this select 4;
_listB	 = _this select 5;

diag_log format ["Crose Deleted by:%1, Pos:%2, Loot:%3, BackPack:%4, Name:%5",_ktoDel,_objPos,_nearBy,_listB,_objName];

};

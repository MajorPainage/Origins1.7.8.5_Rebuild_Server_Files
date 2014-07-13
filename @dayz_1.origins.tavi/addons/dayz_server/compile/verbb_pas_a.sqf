private ["_object","_objectLevel","_playerID","_passUch","_dobav","_dobavL","_dobavR","_fill_house","_objIdKey","_type","_intentory","_result","_result2","_key","_data","_key2","_data2","_strArr","_strCount","_key3","_result3","_objWpnTypes","_objWpnQty","_countr","_isOK","_block","_howmany","_stopGo","_objectC","_playerC","_objectLevelC","_playerIDC","_passwordC","_flagTo","_RealPass","_playerIDS","_objectLevelS","_objectID","_object_position","_isNotOk","_naObnovku","_inventoryEnd"];

diag_log format ["START verbb _this=%1",_this];
_dobav = true;
_dobavL = true;
_dobavR = true;
_fill_house = {
_objIdKey = _this select 0;
_object = _this select 1;
_type = typeOf _object;
_intentory = [];
_result = [];
_result2 = [];

_key = format["CHILD:501:object.object_data:[""Inventory""]:[[""ObjectID"",""="",""%1""]]:[0,8]:", _objIdKey];
_result = [_key] call server_hiveReadWrite;


diag_log format ["_result = %1, %2",_result, typeName _result];

_key2 = format["CHILD:504:%1:",_result select 1];
diag_log format ["_key2 = %1",_key2];

_data2 = "HiveEXT" callExtension _key2;
diag_log format ["_data2 = %1, %2",_data2, typeName _data2];
_strArr = toArray _data2;
_strCount = count _strArr;
if ( _strCount > 10 ) then {
if(_strArr select 9 == 34) then {
_strArr set [9,32];
_strArr set [_strCount-3,32];
};
};
_data2 = toString _strArr;
_result2 = call compile format["%1",_data2];


if(_result2 select 0 == "PASS") then {
_intentory = ((_result2 select 1) select 0);
};
_key3 = format["CHILD:505:%1:",_result select 1];
_result3 = [_key3] call server_hiveReadWrite;
diag_log format ["CHILD 505 _result3 = %1",_result3];

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
if ((_type == "log_house_lvl_2") and (_howmany < 6)) then {
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
if ((_type == "small_house_lvl_2") and (_howmany < 6)) 	then {
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
diag_log format ["inv=0,log_house_lvl_2, %1",_dobav];
_dobav = false; _dobavL = false; _dobavR = false;
};
if (_type == "small_house_lvl_2") 	then {
_object addMagazineCargoGlobal ["ItemLimestone",2];
_object addMagazineCargoGlobal ["ItemRWood",1];
diag_log format ["inv=0,small_house_lvl_2, %1",_dobav];
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
diag_log format ["log_house_lvl_2, %1",_dobav];
_dobav = false;
};
if (_type == "small_house_lvl_2") 	then {
_object addMagazineCargoGlobal ["ItemLimestone",2];
_object addMagazineCargoGlobal ["ItemRWood",1];
diag_log format ["small_house_lvl_2, %1",_dobav];
_dobav = false;
};
};
};
_object setVariable["CanBeUpdated",true];
_object setVariable["DaBeUpd",true,true];
};
_stopGo = true;
_stopGo = count (_this) == 6;
if (!_stopGo) exitWith { diag_log format ["ERROR_PAS _this(%1)",_this]; };
if (typeName _this != "ARRAY")  exitWith { diag_log format ["ERROR_PAS _this(%1) not ARRAY",_this]; };
_objectC = _this select 0;
_playerC = _this select 1;
_objectLevelC = _this select 2;
_playerIDC = _this select 3;
_passwordC = _this select 4;
_flagTo = _this select 5;

_RealPass = 929909929;
_objIdKey = "netego";

_playerIDS = getPlayerUID _playerC;
diag_log format ["1_objectC=%1,_playerC=%2,_objectLevelC=%3,_playerIDC=%4,_passwordC=%5,_flagTo=%6",_objectC,_playerC,_objectLevelC,_playerIDC,_passwordC,_flagTo];
if (typeName _objectC != "OBJECT") exitWith { diag_log format ["ERROR_PAS _objectC(%1) ERROR",_objectC]; };
_type = typeOf _objectC;
if (!(_type in ["wooden_shed_lvl_1","log_house_lvl_2","wooden_house_lvl_3","large_shed_lvl_1","small_house_lvl_2","big_house_lvl_3","small_garage","big_garage","object_x"])) exitWith { diag_log format ["ERROR_PAS _type(%1) ERROR",_type]; };

_RealPass = _objectC getVariable ["passwordtut", 929909929];
_objectLevelS = _objectC getVariable ["Slevelhouse", 0];
_objectID = _objectC getVariable ["ObjectID","0"];
if (typeName _objectID != "string") then
{ 
diag_log(format["Non-string Obj:ID %1,type=%2,_playerIDC=%3", _objectID, _type,_playerIDC]);
_objectID = "0";
};
if (_objectID == "0") then
{
_object_position = getPosATL _objectC;
diag_log(format["Deleting object %1 with invalid ID at pos [%2,%3,%4]",
typeOf _objectC,
_object_position select 0,
_object_position select 1, 
_object_position select 2]);
_isNotOk = true;
};
if (_isNotOk) exitWith { deleteVehicle _objectC; };

diag_log format ["2_objectC=%1,_playerC=%2,_objectLevelC=%3,_playerIDC=%4,_passwordC=%5,_RealPass=%6,_flagTo=%7",_objectC,_playerC,_objectLevelC,_playerIDC,_passwordC,_RealPass,_flagTo];
if ((_objectLevelS != _objectLevelC) OR (_objectLevelS == 0))  exitWith { diag_log format ["ERROR_PAS _objectLevelS(%1) != _objectLevelC(%2)",_objectLevelS,_objectLevelC]; };
if (_playerIDS != _playerIDC) exitWith { diag_log format ["ERROR_PAS _playerIDS(%1) != _playerIDC(%2)",_playerIDS,_playerIDC]; };
if (_RealPass == 929909929) exitWith { diag_log format ["ERROR_PAS _RealPass(%1) ERROR",_RealPass]; };
if (typeName _passwordC != "SCALAR")  exitWith { diag_log format ["ERROR_PAS _passwordC(%1) SCALAR",_passwordC]; };

diag_log format ["3_objectC=%1,_playerC=%2,_objectLevelC=%3,_playerIDC=%4,_passwordC=%5,_RealPass=%6_flagTo=%7",_objectC,_playerC,_objectLevelC,_playerIDC,_passwordC,_RealPass,_flagTo];
if(_RealPass == _passwordC) then {
_naObnovku = _objectC getVariable["CanBeUpdated",true];
if(_flagTo == 1) then {
if(!_naObnovku) then {
[_objectID,_objectC] call _fill_house;
diag_log format ["OPEN_H items puted and _naObnovku true. _objectID=%1,_objectC=%2",_objectID,_objectC];
};
};
if(_flagTo == 2) then {
if(_naObnovku) then {
_inventoryEnd = [
getWeaponCargo _objectC,
getMagazineCargo _objectC,
getBackpackCargo _objectC
];
_key = format["CHILD:303:%1:%2:",_objectID,_inventoryEnd];
diag_log ("Zakrivaem Dom: "+ str(_key));
_key call server_hiveWrite;
clearWeaponCargoGlobal  _objectC;
clearMagazineCargoGlobal  _objectC;
clearBackpackCargoGlobal _objectC;
_objectC setVariable["CanBeUpdated",false];
_objectC setVariable["DaBeUpd",false,true];
diag_log format ["CLOSE_H items delete and _naObnovku false. _objectID=%1,_objectC=%2",_objectID,_objectC];
};
};
if ((_type == "wooden_shed_lvl_1") OR (_type == "large_shed_lvl_1")) then {
if(_flagTo == 1) then {
_objectC animate ["door1a",1];
_objectC animate ["fence_gate",1];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
if(_flagTo == 2) then {
_objectC animate ["door1a",0];
_objectC animate ["fence_gate",0];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
};
if ((_type == "log_house_lvl_2") OR (_type == "small_house_lvl_2")) then {
if(_flagTo == 1) then {
_objectC animate ["door1",1];	
_objectC animate ["fence_gate2",1];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
if(_flagTo == 2) then {
_objectC animate ["door1",0];	
_objectC animate ["fence_gate2",0];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
};
if (_type == "object_x") then {
if(_flagTo == 1) then {
_objectC animate ["door1c",1];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
if(_flagTo == 2) then {
_objectC animate ["door1c",0];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
};
if ((_type == "big_house_lvl_3")) then {
if (_objectLevelS >= 2) then {
if(_flagTo == 1) then {
_objectC animate ["door1a",1];

_objectC animate ["fence_gate",1];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
if(_flagTo == 2) then {
_objectC animate ["door1a",0];

_objectC animate ["fence_gate",0];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
};
if (_objectLevelS >= 7) then {
if(_flagTo == 1) then {
_objectC animate ["garage_gate",1];
_objectC animate ["garage_door_l",1];
_objectC animate ["garage_door_r",1];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
if(_flagTo == 2) then {
_objectC animate ["garage_gate",0];
_objectC animate ["garage_door_l",0];
_objectC animate ["garage_door_r",0];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
};
};
if (_type == "wooden_house_lvl_3") then {
if (_objectLevelS >= 3) then {
if(_flagTo == 1) then {
_objectC animate ["door1",1];

_objectC animate ["fence_gate2",1];
};
if(_flagTo == 2) then {
_objectC animate ["door1",0];

_objectC animate ["fence_gate2",0];
};
};
if (_objectLevelS >= 7) then {
if(_flagTo == 1) then {
_objectC animate ["garage_gate2",1];
_objectC animate ["garage_door_l",1];
_objectC animate ["garage_door_r",1];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
if(_flagTo == 2) then {
_objectC animate ["garage_gate2",0];
_objectC animate ["garage_door_l",0];
_objectC animate ["garage_door_r",0];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
};
};
if ((_type == "small_garage") OR (_type == "big_garage")) then {
if (_objectLevelS >= 3) then {
if(_flagTo == 1) then {
_objectC animate ["garage_gate_1",1];
_objectC animate ["garage_gate_2",1];
_objectC animate ["garage_door_la",1];
_objectC animate ["garage_door_ra",1];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
if(_flagTo == 2) then {
_objectC animate ["garage_gate_1",0];
_objectC animate ["garage_gate_2",0];
_objectC animate ["garage_door_la",0];
_objectC animate ["garage_door_ra",0];
diag_log format ["_type=%1,_objectC=%2,_flagTo=%3",_type,_objectC,_flagTo];
};
};
};
};
private ["_object","_type","_objectID","_uid","_lastUpdate","_needUpdate","_object_position","_object_inventory","_object_damage","_isNotOk","_allowed","_naObnovku"];

_object = 	_this select 0;
_type = 	toLower(_this select 1);
_parachuteWest = typeOf _object == "ParachuteWest";
_isNotOk = false;
_allowed =["wooden_shed_lvl_1","log_house_lvl_2","wooden_house_lvl_3","large_shed_lvl_1","small_house_lvl_2","big_house_lvl_3","small_garage","big_garage","object_x"];
_objectID =	_object getVariable ["ObjectID","0"];
_uid = 		_object getVariable ["ObjectUID","0"];

diag_log format ["_object=%1, _type=%2, _objectID=%3, _uid=%4",_object,_type,_objectID,_uid];

if ((typeName _objectID != "string") || (typeName _uid != "string")) then
{ 
diag_log(format["Non-string Object: ID %1 UID %2", _objectID, _uid]);

_objectID = "0";
_uid = "0";
};
if (!_parachuteWest) then {
if (_objectID == "0" && _uid == "0") then
{
_object_position = getPosATL _object;
diag_log(format["Temporary object %1 with invalid ID at pos [%2,%3,%4]",
typeOf _object,
_object_position select 0,
_object_position select 1, 
_object_position select 2]);
_isNotOk = false;
};
};

if (_isNotOk) exitWith { deleteVehicle _object; };

_lastUpdate = _object getVariable ["lastUpdate",time];
_needUpdate = _object in needUpdate_objects;
_naObnovku = true;
_typeofObj = typeOf _object;
if (_typeofObj in ["wooden_shed_lvl_1","log_house_lvl_2","wooden_house_lvl_3","large_shed_lvl_1","small_house_lvl_2","big_house_lvl_3","small_garage","big_garage","object_x"]) then {
_naObnovku = _object getVariable["CanBeUpdated",false];
if (typeName _naObnovku != "BOOL") then { _naObnovku = false; };
} else {
_naObnovku = true;
}; 


_object_position = {
private["_position","_worldspace","_fuel","_key"];
_position = getPosATL _object;
_worldspace = [
round(direction _object),
_position
];
_fuel = 0;
if (_object isKindOf "AllVehicles") then {

_fuel = fuel _object;

_key = format["CHILD:305:%1:%2:%3:",_objectID,_worldspace,_fuel];

_key call server_hiveWrite;
};
};

_object_inventory = {
if (_naObnovku) then {
private["_inventory","_previous","_key"];
_inventory = [
getWeaponCargo _object,
getMagazineCargo _object,
getBackpackCargo _object
];
_previous = str(_object getVariable["lastInventory",[]]);

if (str(_inventory) != _previous) then {
_object setVariable["lastInventory",_inventory];

if (_objectID == "0") then {
_key = format["CHILD:309:%1:%2:",_uid,_inventory];
} else {
_key = format["CHILD:303:%1:%2:",_objectID,_inventory];
};

_key call server_hiveWrite;
};
} else {
diag_log format ["_naObnovku = %1, _typeofObj=%2",_naObnovku,_typeofObj];
};
};

_object_damage = {
private["_hitpoints","_array","_hit","_selection","_key","_damage","_cfg","_tc","_mti","_mt","_nameClass1","_st"];

if (!(typeOf _object in _allowed)) then {
_hitpoints = _object call vehicle_getHitpoints;
_damage = damage _object;

_array = [];
{
_hit = [_object,_x] call object_getHit;
_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
_object setHit ["_selection", _hit]
} forEach _hitpoints;


_cfg = configFile >> "CfgVehicles" >> (typeof _object) >> "AnimationSources";
_tc = count _cfg;
for "_mti" from 0 to _tc-1 do {
_mt = (_cfg select _mti);
_nameClass1 = configName(_mt);
_st = getText(_mt >> "source");
if (_st in ["front_plow","wheel_guards","window_guards","windshield_guard"]) then {
_hit = _object getVariable [_st,1];
_object animate [_st,_hit];
_array set [count _array,[_st,_hit]];

};
};


_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];

_key call server_hiveWrite;
_object setVariable ["needUpdate",false,true];
};
};



_object setVariable ["lastUpdate",time,true];
switch (_type) do {
case "all": {
call _object_position;
call _object_inventory;
call _object_damage;
};
case "position": {
call _object_position;
};
case "gear": {
call _object_inventory;
};
case "damage": {
if ( (time - _lastUpdate) > 5 && !_needUpdate ) then {
call _object_damage;
} else {
if ( !_needUpdate ) then {
needUpdate_objects set [count needUpdate_objects, _object];
};
};
};
case "repair": {
call _object_damage;
};
};
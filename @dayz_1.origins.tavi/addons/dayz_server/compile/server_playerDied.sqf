private ["_characterID","_minutes","_newObject","_playerID","_playerName","_source","_method","_humm_s","_distance","_sourceName","_humanity","_weapon","_playerIDk","_deathMessage","_key","_eh","_body"];


_characterID = _this select 0;
_minutes = _this select 1;
_newObject = _this select 2;
_playerID = _this select 3;
_playerName	= _this select 4;
_source = _this select 5;
_method = _this select 6;
_humm_s = _this select 7;

private["_distance","_sourceName","_weapon","_deathMessage","_playerIDk"];
_distance = _newObject distance _source;
_sourceName = _source getVariable["bodyName","unknown"];
_humanity = _source getVariable["humanity",2500];
_weapon = currentWeapon _source;
_playerIDk = getPlayerUID _source;



if ( isNull _source || _source == _newObject ) then {

diag_log format ["DeadMSG: %1(%6) died. -> %2(%7). Distance:%3 Weapon:%4 Method:%5",_playerName,_sourceName,_distance,_weapon,_method,_playerID,_playerIDk];
} else {

_deathMessage = format["%1 killed by %2 using (Weapon:%4) from (Distance:%3)",_playerName,_sourceName,round(_distance),_weapon];

_source setVehicleInit format["titleText [""%1"", ""PLAIN DOWN"", 1];", _deathMessage];
processInitCommands;
clearVehicleInit _source;
diag_log format ["DeadMSG: %1(%6) killed by %2(%7). Distance:%3 Weapon:%4 Method:%5",_playerName,_sourceName,_distance,_weapon,_method,_playerID,_playerIDk];
_humanity = _humanity + _humm_s;
_source setVariable["humanity",_humanity,true];



};


dayz_disco = dayz_disco - [_playerID];
_newObject setVariable["processedDeath",time];








if (typeName _minutes == "STRING") then 
{
_minutes = parseNumber _minutes;
};

if (_characterID != "0") then 
{
_key = format["CHILD:202:%1:%2:",_characterID,_minutes];

_key call server_hiveWrite;
} 
else 
{
deleteVehicle _newObject;
};

diag_log ("PDEATH: Player Died " + _playerID);












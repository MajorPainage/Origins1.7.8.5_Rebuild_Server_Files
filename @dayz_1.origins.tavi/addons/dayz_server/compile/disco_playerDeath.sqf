private["_object","_source","_method","_key","_playerID","_characterID","_playerName","_isDead"];
_object = 	_this select 0;
_source = 	_this select 1;
_method = 	_this select 2;
_playerID = 	_object getVariable["playerID",0]; 
_characterID = 	_object getVariable["characterID",0]; 
_playerName = 	_object getVariable["bodyName","unknown"];
_isDead =	_object getVariable["USEC_isDead",false];
_humanity =	0;
_wait = 	0;
_humanity_s = 	0;
_humanityVP = 	0;
_humanityVS =	0;
_MuKills_s =	0;
_HeroKills_s =	0;
_BandKills_s =	0;
_typedeP = 0;

_isHero1_s=false;_isHero2_s=false;_isHero3_s=false;
_isBandit1_s=false;_isBandit2_s=false;_isBandit3_s=false;
_isHero1_p=false;_isHero2_p=false;_isHero3_p=false;
_isBandit1_p=false;_isBandit2_p=false;_isBandit3_p=false;
_plevel=0;_slevel=0;_typedeP = 0;
_isSurvi_p = false; _isSurvi_s=false;
_nameKillerP = "unknown";

_humanityVP 	= (_object getVariable ["humanity",2500]);

if (_humanityVP > 2000 and _humanityVP < 2900) then { _isSurvi_p = true; _typedeP = 2;};

if (_humanityVP >= 2900 and _humanityVP < 6500) then  { _isHero1_p = true; _plevel = 1; _typedeP = 3;};
if (_humanityVP >= 6500 and _humanityVP <= 15000) then { _isHero2_p = true; _plevel = 2; _typedeP = 3;};
if (_humanityVP > 15000) then { _isHero3_p = true; _plevel = 3; _typedeP = 3;};

if (_humanityVP > -6500 and _humanityVP <= 2000) then { _isBandit1_p = true; _plevel = 1; _typedeP = 1;};
if (_humanityVP >= -15000 and _humanityVP <= -6500) then { _isBandit2_p = true; _plevel = 2; _typedeP = 1;};
if (_humanityVP < -15000) then { _isBandit3_p = true; _plevel = 3; _typedeP = 1;};

_object removeAllEventHandlers "HandleDamage";

if (!_isDead) then {
if (!isNull _source) then {
if (_source != _object) then {

_canHitFree = 	_object getVariable ["freeTarget",false];

_humanityVS		= (_source getVariable ["humanity",2500]);


if (_humanityVS > 2000 and _humanityVS < 2900) then { _isSurvi_s = true; };

if (_humanityVS >= 2900 and _humanityVS < 6500) then  { _isHero1_s = true; _slevel = 1;};
if (_humanityVS >= 6500 and _humanityVS <= 15000) then { _isHero2_s = true; _slevel = 2;};
if (_humanityVS > 15000) then { _isHero3_s = true; _slevel = 3;};

if (_humanityVS > -6500 and _humanityVS <= 2000) then { _isBandit1_s = true; _slevel = 1; };
if (_humanityVS >= -15000 and _humanityVS <= -6500) then { _isBandit2_s = true; _slevel = 2;};
if (_humanityVS < -15000) then { _isBandit3_s = true; _slevel = 3;};

_MuKills_s 	= (_source getVariable ["humanKills",0]);
_HeroKills_s 	= (_source getVariable["headShots",0]);	
_BandKills_s 	= (_source getVariable ["banditKills",0]);


if ((!_canHitFree) && _isSurvi_s && _isSurvi_p) then 
{ _humanity_s = -500; _source setVariable ["humanKills",(_MuKills_s + 1),true];};
if ((!_canHitFree) && _isSurvi_s && (_isBandit1_p or _isBandit2_p or _isBandit3_p)) then 	
{ _humanity_s = (400*_plevel); _source setVariable ["banditKills",(_BandKills_s + 1),true];};
if ((!_canHitFree) && _isSurvi_s && (_isHero1_p or _isHero2_p or _isHero3_p)) then 	
{ _humanity_s = -(500*_plevel); _source setVariable["headShots",(_HeroKills_s + 1),true];};


if (((!_canHitFree)) && (_isBandit1_s or _isBandit2_s or _isBandit3_s) && _isSurvi_p) then 		
{ _humanity_s = -(200-(100*_slevel)); _source setVariable ["humanKills",(_MuKills_s + 1),true];};
if ((!_canHitFree) && (_isBandit1_s or _isBandit2_s or _isBandit3_s) && (_isBandit1_p or _isBandit2_p or _isBandit3_p)) then 
{ _humanity_s = -(200*(3-_slevel)*_plevel); _source setVariable ["banditKills",(_BandKills_s + 1),true];};
if ((!_canHitFree) && (_isBandit1_s or _isBandit2_s or _isBandit3_s) && (_isHero1_p or _isHero2_p or _isHero3_p)) then 		
{ _humanity_s = -(500*_plevel); _source setVariable["headShots",(_HeroKills_s + 1),true];};


if ((!_canHitFree) && (_isHero1_s or _isHero2_s or _isHero3_s) && _isSurvi_p) then 		
{ _humanity_s = -(100+(100*_slevel)*_slevel); _source setVariable ["humanKills",(_MuKills_s + 1),true];};
if ((!_canHitFree) && (_isHero1_s or _isHero2_s or _isHero3_s) && (_isBandit1_p or _isBandit2_p or _isBandit3_p)) then 	
{ _humanity_s = (300*_plevel); _source setVariable ["banditKills",(_BandKills_s + 1),true];};
if ((!_canHitFree) && (_isHero1_s or _isHero2_s or _isHero3_s) && (_isHero1_p or _isHero2_p or _isHero3_p)) then 
{ _humanity_s = -(500*_plevel); _source setVariable["headShots",(_HeroKills_s + 1),true];};




};
_nameKillerP = (name _source);
};
_id = [_characterID,0,_object,_playerID,_playerName,_source,_method,_humanity_s] spawn server_playerDied;
_object setDamage 1;
_object setVariable["USEC_isDead",true,true];
_id = [_object,50,true,getPosATL _object] spawn player_alertZombies;

_object setVariable ["deathType",_method,true];
_object setVariable ["nameKillerP",_nameKillerP,true];
_object setVariable ["typedeP",_typedeP,true];
};	
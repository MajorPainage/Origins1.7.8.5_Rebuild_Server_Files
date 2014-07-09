disableSerialization;
private ["_idcToExec","_ctrlToExec"];
_display = _this select 0;
_key= _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;
_key = _key * 10;

if (_shift) then {
	_key = _key  + 1;
};

if (_ctrl) then {
	_key = _key  + 2;
};

if (_alt) then {
	_key = _key  + 4;
};

switch _key do {
	//quit Alt+Q
	case 164:{
		_idcToExec = 106;
	};	
	//player profile Alt+P
	case 254:{
		_idcToExec = 109;
	};	
	//multiplayer Alt+M
	case 504:{
		_idcToExec = 105;
	};
	//options Alt+O
	case 244:{
		_idcToExec = 102;
	};		
	//quit Alt+Q
	case 162:{
		_idcToExec = 106;
	};	
	//player profile Alt+P
	case 252:{
		_idcToExec = 109;
	};	
	//multiplayer Alt+M
	case 502:{
		_idcToExec = 105;
	};
	//options Alt+O
	case 242:{
		_idcToExec = 102;
	};		
	default {
		_idcToExec = 0;
	};
};

if (_idcToExec != 0) then {
	_ctrlToExec = _display displayctrl _idcToExec;
	debuglog (str(_idcToExec) + " exec");
	ctrlActivate _ctrlToExec;
};


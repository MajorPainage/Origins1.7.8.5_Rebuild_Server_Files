waitUntil {!isNil "BIS_fnc_init"};






_list = ["0"];
_list = []; 

fn_genRand =
{
_arr = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","0","1","2","3","4","5","6","7","8","9"];
_gen = "v_";
for "_i" from 1 to 5 do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
_gen
};

_tlmrand1 = call fn_genRand; 
_tlmrand2 = call fn_genRand; 
_tlmrand3 = call fn_genRand;
_tlmrand4 = call fn_genRand; 
_tlmrand5 = call fn_genRand;
_tlmrand6 = call fn_genRand; 
_tlmrand7 = call fn_genRand;
_tlmrand8 = call fn_genRand; 
_tlmrand9 = call fn_genRand; 
_tlmrand10 = call fn_genRand; 
_tlmrand11 = call fn_genRand;
_tlmrand12 = call fn_genRand;
_tlmrand13 = call fn_genRand;
_tlmrand14 = call fn_genRand;
_tlmrand15 = call fn_genRand; 
_tlmrand16 = call fn_genRand; 
_tlmrand17 = call fn_genRand; 
_tlmrand18 = call fn_genRand; 
_tlmrand19 = call fn_genRand; 

call compile ("
"+_tlmrand1+" =
{
	[] execVM ""ca\Modules\Functions\init.sqf"";
	BIS_MPF_remoteExecutionServer2 = compile preprocessFile (BIS_MP_Path + BIS_PATH_SQF + 'remExServer.sqf');
	BIS_MPF_remoteExecutionServer =
	{
		_input = (_this select 1) select 2;
		if (_input in ['switchmove','playmove','say','jipexec','execvm','spawn','titleCut','titleText']) then {_this call BIS_MPF_remoteExecutionServer2;};
	};
	"+_tlmrand2+" =
	{
		if (isNil '"+_tlmrand3+"') then
		{
			"+_tlmrand3+" = true;
			//preProcessFileLineNumbers 'errors';
			_fileArray = ['scr\exec.sqf','Scripts\ajmenu.sqf','wuat\screen.sqf','TM\menu.sqf','TM\screen.sqf','Scripts\menu.sqf','crinkly\keymenu.sqf','ASM\startup.sqf',
			'RSTMU\scr\startMenu.sqf','scr\startMenu.sqf','scr\STrial.sqf','wuat\vet@start.sqf','TM\keybind.sqf','startup.sqf','start.sqf','startupMenu.sqf','yolo\startup.sqf',
			'xTwisteDx\menu.sqf','wuat\start.sqf','TM\startmenu.sqf','infiSTAR_Menu\setup\startup.sqf','startMenu.sqf','custom.sqf','WiglegHacks\mainmenu.sqf',
			'TM\98. Enable hotkeys --------------------------------------------------.sqf','TM\98. Enable hotkeys --------------------------------------------------.sqf',
			'97. Secret hakez -----------------------------------------------------.sqf','0------------------------------------------------------------------------------.sqf',
			'bowenisthebest.sqf','Scripts\Menu_Scripts\empty.sqf','Missions\Scripts\ajmenu.sqf','@mymod\Scripts\ajmenu.sqf','i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf',
			'yolo\w4ssup YoloMenu v2.sqf','Menus\infiSTAR_SEVEN\startup.sqf','Menus\battleHIGH_Menu\startup.sqf','battleHIGH_Menu\startup.sqf','infiSTAR_SEVEN\startup.sqf',
			'infiSTAR_EIGHT\startup.sqf','infiSTAR_SSH\startup.sqf','TM\start.sqf','TM\DemonicMenu.sqf','Scripts\screen.sqf','Scripts\start.sqf','Scripts\startmenu.sqf',
			'Rustler v4\startup.sqf','Rustler v5\startup.sqf','Rustler v4\exec.sqf','Rustler v5\exec.sqf','Missions\battleHIGH_Menu\startup.sqf','Missions\Scripts\ajmenu.sqf',
			'Scripts\exec.sqf','Scripts\list.sqf','Scripts\mah.sqf','Menu\start.sqf','Menu\startup.sqf','i_n_f_i_S_T_A_R.sqf','i_n_f_i_S_T_A_R___Menu\list.sqf'];
			for '_i' from 0 to (count _fileArray)-1 do
			{
				if ((preProcessFileLineNumbers (_fileArray select _i)) != '') then
				{
					"+_tlmrand10+" = [name player, getPlayerUID player, toArray 'Script', toArray (_fileArray select _i)];
					publicVariable '"+_tlmrand10+"';
					for '_j' from 0 to 99 do {(findDisplay _j) closeDisplay 0;};
				};
				sleep 0.1;
			};
			sleep 60;
			"+_tlmrand3+" = nil;
		};
	};
	"+_tlmrand4+" =
	{
		if (isNil '"+_tlmrand5+"') then
		{
			"+_tlmrand5+" = true;
			"+_tlmrand10+" = [name player, getPlayerUID player, _this select 0];
			publicVariable '"+_tlmrand10+"';
			sleep 1;
			"+_tlmrand5+" = nil;
		};
	};
	"+_tlmrand6+" =
	{
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		if ((_key == 0xD3) && !_alt && !_ctrl) then {['Delete'] spawn "+_tlmrand4+";};
		if (_key == 0xD2) then {['Insert'] spawn "+_tlmrand4+";};
		if (_key == 0x58) then {['F12'] spawn "+_tlmrand4+";};
		if (_key == 0x3B) then {['F1'] spawn "+_tlmrand4+";};
		if (_key == 0x3C) then {['F2'] spawn "+_tlmrand4+";};
		if (_key == 0x3D) then {['F3'] spawn "+_tlmrand4+";};
		if ((_key == 0x3E) && _alt) then {['Alt-F4'] spawn "+_tlmrand4+";};
		if ((_key == 0x29) && _shift) then {['DAMI'] spawn "+_tlmrand4+";};
	};
	[] spawn "+_tlmrand2+";
	[] spawn
	{
		"+_tlmrand15+" = true;
		while {"+_tlmrand15+"} do
		{
			{
				if !(isNil _x) exitWith
				{
					"+_tlmrand10+" = [name player, getPlayerUID player, toArray 'Global Var', toArray _x];
					publicVariable '"+_tlmrand10+"';
					for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;};
				};
			} forEach ['pic','veh','wuat_fpsMonitor','unitList','list_wrecked',
			'p','fffffffffff','markPos','pos','marker','TentS','VL','MV',
			'mk2','j','fuckmegrandma','mehatingjews','scode','TTT5OptionNR',
			'igodokxtt','omgwtfbbq','namePlayer','thingtoattachto','HaxSmokeOn','v',
			'antiloop','ARGT_JUMP','selecteditem','moptions','delaymenu','gluemenu',
			'spawnweapons1','abcd','skinmenu','playericons','changebackpack','keymenu',
			'custom_clothing','img','surrmenu','footSpeedIndex','ctrl_onKeyDown','plrshldblcklst',
			'teepee','spwnwpn','xtags','musekeys','dontAddToTheArray','morphtoanimals',
			'playerDistanceScreen','monkytp','ihatelife','debugConsoleIndex','MY_KEYDOWN_FNC',
			'TAG_onKeyDown','changestats','derp123','heel','rangelol','unitsmenu','xZombieBait',
			'shnmenu','xtags','pm','lmzsjgnas','vm','bowen','bowonkys','glueallnigga',
			'atext','boost','nd','vspeed','Ug8YtyGyvguGF','inv','rspwn','pList','loldami',
			'helpmenu','godlol','rustlinginit', 'qofjqpofq','invall','initarr','reinit','byebyezombies',
			'Monky_funcs_inited','FUK_da_target','damihakeplz','damikeyz_veryhawt','mapopt'];
			if ((groupIconsVisible select 0) or (groupIconsVisible select 1)) exitWith
			{
				"+_tlmrand10+" = [name player, getPlayerUID player, toArray 'Group Icons', toArray (str groupIconsVisible)];
				publicVariable '"+_tlmrand10+"';
				for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;};
			};
			[] spawn "+_tlmrand2+";
			sleep 10;
		};
	};
	[] spawn
	{
		_sName = name player;
		_sUID = getPlayerUID player;
		"+_tlmrand16+" = true;
		while {"+_tlmrand16+"} do
		{
			(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
			(findDisplay 46) displayRemoveAllEventHandlers 'KeyUp';
			(findDisplay 46) displayAddEventHandler ['KeyDown','if ((_this select 4) and ((_this select 1) == 0x3E)) then { [] spawn dayz_forceSave; }; _this call dayz_spaceInterrupt'];
			(findDisplay 46) displayAddEventHandler ['KeyUp','_this call "+_tlmrand6+"'];
			sleep 0.1; "+_tlmrand7+" = true;
			(findDisplay 106) displayRemoveAllEventHandlers 'KeyDown';
			(findDisplay 106) displayRemoveAllEventHandlers 'KeyUp';
			((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonDown';
			((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonUp';
			((findDisplay 3030) displayCtrl 2) ctrlRemoveAllEventHandlers 'LBDblClick';
			if (isNull (findDisplay 106) and isNull (findDisplay 20900) and isNull (findDisplay 6902) and isNull (findDisplay 6903) ) then {closeDialog 0;};
			if ((typeName player != ""OBJECT"") or (typeName true != ""BOOL"")) then
			{
				"+_tlmrand10+" = [_sName, _sUID, toArray 'Anti-Anti Hack', toArray ('player = '+(typeName player)+' - true = '+(typeName true))];
				publicVariable '"+_tlmrand10+"';
				for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;};
			};
		};
		"+_tlmrand10+" = [_sName, _sUID, toArray 'Anti-Anti Hack', toArray 'Loop Exited'];
		publicVariable '"+_tlmrand10+"';
		for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;};
	};
	[] spawn
	{
		"+_tlmrand17+" = true;
		while {"+_tlmrand17+"} do
		{
			_items = [currentWeapon player] + (weapons player) + (magazines player);
			{
				if (_x in _items) then
				{
					[_x,_items] spawn
					{
						_item = _this select 0;
						_items = _this select 1;
						if (_item in ['Mine','MineE','pipebomb','TimeBomb']) then
						{
							for '_i' from 0 to ({_x == _item} count _items) do {player removeMagazine _item;};
						} else {for '_i' from 0 to ({_x == _item} count _items) do {player removeWeapon _item;};};
					};
					"+_tlmrand10+" = [name player, getPlayerUID player, toArray 'Bad Item', toArray _x];
					publicVariable '"+_tlmrand10+"';
				};
			} forEach (['BAF_AS50_TWS','UZI_SD_EP1',
			'revolver_gold_EP1','G36_C_SD_eotech','G36_C_SD_camo',
			'BAF_LRR_scoped','M107_DZ',
			'Mk_48_DES_EP1','AK_107_GL_pso',
			'MG36','ksvk','SVD_des_EP1','M24_des_EP1',
			'BAF_LRR_scoped_W','BAF_ied_v1',
			'M249_m145_EP1','BAF_L86A2_ACOG',
			'Saiga12K','M60A4_EP1','BAF_M240_veh',
			'BAF_L85A2_UGL_Holo','m240_scoped_EP1','m107_TWS_EP1_DZ',
			'BAF_L85A2_UGL_ACOG','BAF_L85A2_RIS_ACOG','Mine','MineE','pipebomb','TimeBomb'] + 
			['GAU8','2A14','2A38M','2A42','2A46M','2A46MRocket','2A70','2A70Rocket','2A72','2B14','57mmLauncher','57mmLauncher_128','57mmLauncher_64','80mmLauncher','9M311Laucher','AALauncher_twice','AGS17','AGS30','AGS30_heli','AirBombLauncher','AT10LauncherSingle','AT11LauncherSingle','AT13LauncherSingle','AT2Launcher','AT5Launcher','AT5LauncherSingle','AT6Launcher','AT9Launcher','AZP85','BAF_GMG','BAF_L2A1','BAF_L7A2','BAF_L94A1','BAF_M240_veh','BAF_static_GMG','BikeHorn','BombLauncher','BombLauncherA10','BombLauncherF35','CamelGrenades','CarHorn','Ch29Launcher','Ch29Launcher_Su34','CMFlareLauncher','CRV7_FAT','CRV7_HEPD','CRV7_PG','CTWS','D10','D30','D81','DSHKM','DT_veh','FFARLauncher','FFARLauncher_14','FlareLauncher','GAU12','GRAD','GSh23L','GSh23L_L39','GSh301','GSh302','HeliBombLauncher','HellfireLauncher','HellfireLauncher_AH6','Igla_twice','KORD','KPVT','Laserdesignator_mounted','M119','M120','M134','M134_2','M168','M197','M2','M230','M240_veh','M240_veh_2','M240_veh_MG_Nest','M240BC_veh','M242','M242BC','M252','M256','M2BC','M32_heli','M3P','M621','M68','MaverickLauncher','MiniCarHorn','MK19','MK19BC','Mk82BombLauncher','Mk82BombLauncher_6','MLRS','PKT','PKT_2','PKT_3','PKT_high_AI_dispersion','PKT_high_AI_dispersion_tank','PKT_MG_Nest','PKT_veh','PKTBC','PKTBC_veh','R73Launcher','R73Launcher_2','S8Launcher','SEARCHLIGHT','SGMT','SidewinderLaucher','SidewinderLaucher_AH1Z','SidewinderLaucher_AH64','SidewinderLaucher_F35','SmokeLauncher','SPG9','SportCarHorn','StingerLaucher','StingerLaucher_4x','StingerLauncher_twice','TOWLauncher','TOWLauncherSingle','TruckHorn','TruckHorn2','TwinM134','TwinVickers','VikhrLauncher','YakB','ZiS_S_53']);
			sleep 10;
		};
	};
	[] spawn
	{
		"+_tlmrand18+" = true;
		while {"+_tlmrand18+"} do
		{

			for '_i' from 0 to 350 do
			{
				_dayzActions = (s_player_repairActions + r_player_actions2 + r_player_actions +
				[s_player_packFdp,s_player_otkdv,s_player_deleteBuild,s_player_isCruse,s_player_cnbb,
				s_player_rest,s_player_flipvehiclelight,s_player_flipvehicleheavy,s_player_1bupd,
				s_player_grabflare,s_player_removeflare,s_player_deleteBuild,s_player_forceSave,
				s_player_flipveh,s_player_fillfuel,s_player_dropflare,s_player_butcher,s_player_cook,
				s_player_boil,s_player_fireout,null,s_player_packtent,s_player_sleep,s_player_studybody]);
				if (!(_i in _dayzActions) and (_i > -1)) then {player removeAction _i};
			};
			player allowDamage true;
			sleep 0.01;
		};
	};
};
BIS_MPF_remoteExecutionServer =
{
	if ((_this select 1) select 2 == ""JIPrequest"") then
	{
		[nil,(_this select 1) select 0,""loc"",rJIPEXEC,[any,any,""per"",""execVM"",""ca\Modules\Functions\init.sqf""]] call RE;
		if (isNil ""alexenglishwhysobad"") then
		{
			_agent = createAgent [""SurvivorW2_DZ"", [0,0,0], [], 30, ""NONE""];
			alexenglishwhysobad = true;
		};
		_list = [0,0,0] nearEntities 1000000000000000; (_list select 0) setVehicleInit format [""if !(isServer) then {['%1'] spawn "+_tlmrand19+";};"", getPlayerUID ((_this select 1) select 0)]; processInitCommands;
		clearVehicleInit (_list select 0);
		(_list select 0) setVehicleInit ""if !(isServer) then {[getPlayerUID player] spawn "+_tlmrand8+";};""; processInitCommands; clearVehicleInit (_list select 0);
	};
};
"""+_tlmrand10+""" addPublicVariableEventHandler
{
	if (count (_this select 1) == 3) then
	{
		_name = (_this select 1) select 0;
		_uid = (_this select 1) select 1;
		_key = (_this select 1) select 2;
		_log = format [""AntiH Key Log: %1 (%2) KEY: %3 - |DayZ Instance: %4|"", _name, _uid, _key, dayZ_instance];
		diag_log (_log);
	}
	else
	{
		if (count (_this select 1) == 1) then
		{
			_player = (_this select 1) select 0;
			_uid = getPlayerUID _player;
			_log = format [""AntiH Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|"", name _player, getPlayerUID _player, ""Anti-Hax OFF"", format [""Time: %1"", str time], dayZ_instance];
			diag_log (_log);
		}
		else
		{
			_array = _this select 1;
			_name = _array select 0;
			_uid = _array select 1;
			_reason = toString (_array select 2);
			_field = toString (_array select 3);
			_log = format [""AntiH Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|"", _name, _uid, _reason, _field, dayZ_instance];
			diag_log (_log);
			"+_tlmrand13+" = format [""AntiH Caught: %1 Reason: %2 (%3)"", _name, _reason, _field];
			publicVariable """+_tlmrand13+""";
		};
	};
};
"+_tlmrand8+" =
{
	_"+_tlmrand14+" = _this select 0;
	if (!(_"+_tlmrand14+" in "+(str _list)+") && !(isNull player)) then
	{
		if (isNil '"+_tlmrand11+"') then
		{
			waitUntil {!isNil 'dayz_animalCheck'};
			"+_tlmrand11+" = true;
			sleep 10;
			"+_tlmrand7+" = false;
			sleep 5;
			if !("+_tlmrand7+") then
			{
				"+_tlmrand10+" = [player];
				publicVariable '"+_tlmrand10+"';
				endMission ""END1"";
			};
			"+_tlmrand11+" = nil;
		};
	};
};
"+_tlmrand9+" =
{
	hackerLog = [];
	keyLog = [];
	"""+_tlmrand10+""" addPublicVariableEventHandler
	{
		if ((count hackerLog) > 150) then
		{
			for ""_i"" from 0 to 49 do
			{
				hackerLog = hackerLog - [hackerLog select 0];
			};
		};
		if ((count keyLog) > 150) then
		{
			for ""_i"" from 0 to 49 do
			{
				keyLog = keyLog - [keyLog select 0];
			};
		};
		if (count (_this select 1) == 3) then
		{
			_name = (_this select 1) select 0;
			_uid = (_this select 1) select 1;
			_key = (_this select 1) select 2;
			_log = format [""KEY LOGGED: %1 (%2) KEY: %3"", _name, _uid, _key];
			keyLog = keyLog + [[""     ""+_log,"""",""0"",""1"",""0"",""0"",[]]];
		}
		else
		{
			if (count (_this select 1) == 1) then
			{
				_player = (_this select 1) select 0;
				_log = format [""HACKER: %1 (%2) REASON: %3 (%4)"", name _player, getPlayerUID _player, ""Anti-Hax OFF"", format [""Time: %1"", str time]];
				hackerLog = hackerLog + [[""     ""+_log,"""",""0"",""1"",""0"",""0"",[]]];
			}
			else
			{
				_array = _this select 1;
				_name = _array select 0;
				_uid = _array select 1;
				_reason = toString (_array select 2);
				_field = toString (_array select 3);
				_log = format [""HACKER: %1 (%2) REASON: %3 (%4)"", _name, _uid, _reason, _field];
				hackerLog = hackerLog + [[""     ""+_log,"""",""0"",""1"",""0"",""0"",[]]];
			};
		};
	};
};
"+_tlmrand19+" =
{
	_uid = _this select 0;
	_puid = getPlayerUID player;
	if (_uid == _puid) then
	{
		if (_puid in "+(str _list)+") exitWith
		{
			'"+_tlmrand13+"' addPublicVariableEventHandler {taskHint [_this select 1, [1, 0.05, 0.55, 1], 'taskNew'];};
			[] spawn "+_tlmrand9+";
			
		};
		[] spawn
		{
			waitUntil {!isNil 'dayz_animalCheck'};
			_blCmd = ['buttonSetAction','processDiaryLink','createDiaryLink','showCommandingMenu',
			'lbSetData','createMarkerLocal','createTeam','profileNamespace','exec'];
			for '_i' from 0 to (count _blCmd)-1 do {call compile ((_blCmd select _i)+""='STRING';"");};
			_retArr = ['allUnits','entities','allMissionObjects','vehicles','playableUnits'];
			for '_j' from 0 to (count _retArr)-1 do {call compile ((_retArr select _j)+""=[player];"");};
		};
		[] spawn "+_tlmrand1+";
	};
};
publicVariable """+_tlmrand1+""";
publicVariable """+_tlmrand8+""";
publicVariable """+_tlmrand9+""";
publicVariable """+_tlmrand19+""";
");




















diag_log ("ANTI-HACK INIT");
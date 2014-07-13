//Contruction Supply Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

// CONSTRUCTION MATERIALS
_box addMagazineCargoGlobal ["ItemCinderblocks", 20];
_box addMagazineCargoGlobal ["Partscrap", 20];
_box addMagazineCargoGlobal ["Itemscrap", 15];
_box addMagazineCargoGlobal ["ItemCementBag", 15];
_box addMagazineCargoGlobal ["ItemRestTent", 3];
_box addMagazineCargoGlobal ["ItemBattery", 2];
_box addMagazineCargoGlobal ["ItemPin", 2];

// TOOLS
_box addWeaponCargoGlobal ["ItemToolbox", 2];
_box addWeaponCargoGlobal ["ItemEtool", 2];
_box addWeaponCargoGlobal ["ItemKnife", 2];
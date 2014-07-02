// Name of this crate
_crateName = "Building Crate";

// Crate type
_classname = "USOrdnanceBox";

// Location of player and crate
_dir = getdir player;
_pos = getposATL player;
_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];
_spawnCrate = createVehicle [_classname, _pos, [], 0, "CAN_COLLIDE"];
_spawnCrate setDir _dir;
_spawnCrate setposATL _pos;

// Remove default items/weapons from current crate before adding custom gear
clearWeaponCargoGlobal _spawnCrate;
clearMagazineCargoGlobal _spawnCrate;
clearBackpackCargoGlobal _spawnCrate;


_spawnCrate addWeaponCargoGlobal ["ItemEtool", 5];
_spawnCrate addWeaponCargoGlobal ["ItemHatchet", 5];
_spawnCrate addWeaponCargoGlobal ["ItemMatchbox", 5];
_spawnCrate addWeaponCargoGlobal ["ItemToolbox", 5];

_spawnCrate addMagazineCargoGlobal ["ItemRocks", 80];
_spawnCrate addMagazineCargoGlobal ["ItemBattery", 30];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_g_s", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_g_b", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_h1", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_h2", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_h3", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_b1", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_b2", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_b3", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_wt", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_kr1", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_h1e", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_h2e", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_h3e", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_b1e", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_b2e", 3];
_spawnCrate addMagazineCargoGlobal ["ItemBpt_b3e", 3];
_spawnCrate addMagazineCargoGlobal ["ItemCementBag", 30];
_spawnCrate addMagazineCargoGlobal ["ItemCeMix", 30];
_spawnCrate addMagazineCargoGlobal ["ItemCinderblocks", 30];
_spawnCrate addMagazineCargoGlobal ["ItemPin", 30];
_spawnCrate addMagazineCargoGlobal ["ItemRestTent", 30];
_spawnCrate addMagazineCargoGlobal ["Itemscrap", 30];
_spawnCrate addMagazineCargoGlobal ["Partscrap", 30];
_spawnCrate addMagazineCargoGlobal ["PartWoodPile", 80];

// Send text to spawner only
titleText [format[_crateName + " spawned!"],"PLAIN DOWN"]; titleFadeOut 4;

// Run delaymenu
delaymenu = 
[
	["",true],
	["Select delay", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["30 seconds", [], "", -5, [["expression", "SelectDelay=30;DelaySelected=true;"]], "1", "1"],
	["1 min", [], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
	["3 min", [], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
	["5 min", [], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
	["10 min", [], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
	["30 min", [], "", -5, [["expression", "SelectDelay=1800;DelaySelected=true;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["No timer", [], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"]
];
showCommandingMenu "#USER:delaymenu";
WaitUntil{DelaySelected};
DelaySelected=false;
titleText [format[_crateName + " will disappear in %1 seconds.",SelectDelay],"PLAIN DOWN"]; titleFadeOut 4;
sleep SelectDelay;

// Delete crate after SelectDelay seconds
deletevehicle _spawnCrate;
titleText [format[_crateName + " disappeared."],"PLAIN DOWN"]; titleFadeOut 4;
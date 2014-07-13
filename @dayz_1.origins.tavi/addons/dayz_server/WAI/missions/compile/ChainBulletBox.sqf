//Chain Bullet Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

// AMMUNITION
_box addMagazineCargoGlobal ["100Rnd_762x51_M240", 5];
_box addMagazineCargoGlobal ["200Rnd_762x51_M240", 5];
_box addMagazineCargoGlobal ["30Rnd_556x45_G36SD", 15];
_box addMagazineCargoGlobal ["75Rnd_545x39_RPK", 5];

// BACKPACKS
_box addBackpackCargoGlobal ["O_TravelerPack_1", 1];

private["_pos"];
_pos = _this select 0;

{
[_x, "all"] call server_updatObiect;
} forEach nearestObjects [_pos, ["Car", "Helicopter", "Motorcycle", "Ship", "TentStorage"], 10];

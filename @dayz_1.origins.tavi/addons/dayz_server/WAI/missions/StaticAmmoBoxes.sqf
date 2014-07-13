/* Add ammmo boxes to static locations on map and fills it with loot from missionCfg.sqf

creates a ammo box at [0,0,0] then fills it

_box = createVehicle ["BAF_VehicleBox",[0,0,0], [], 0, "CAN_COLLIDE"];
[_box] call spawn_ammo_box;

creates a 2nd ammo box at [1,1,1] then fills it

_box2 = createVehicle ["BAF_VehicleBox",[1,1,1], [], 0, "CAN_COLLIDE"];
[_box2] call spawn_ammo_box;

add custom ammo boxes below this line


_box = createVehicle ["BAF_VehicleBox",[11192,13794,0], [], 0, "CAN_COLLIDE"];
[_box] call Extra_Large_Gun_Box;

_box2 = createVehicle ["BAF_VehicleBox",[8142.1,21201,0], [], 0, "CAN_COLLIDE"];
[_box2] call spawn_ammo_box;

_box3 = createVehicle ["BAF_VehicleBox",[11301,1001,0], [], 0, "CAN_COLLIDE"];
[_box3] call spawn_ammo_box;

_box4 = createVehicle ["BAF_VehicleBox",[3600,7400,0], [], 0, "CAN_COLLIDE"];
[_box4] call spawn_ammo_box;

_box5 = createVehicle ["BAF_VehicleBox",[2485,17205,0], [], 0, "CAN_COLLIDE"];
[_box5] call spawn_ammo_box;

*/

_box3 = createVehicle ["BAF_VehicleBox",[11301,1001,0], [], 0, "CAN_COLLIDE"];
[_box3] call Extra_Large_Gun_Box;

_box3 = createVehicle ["BAF_VehicleBox",[22164.301,19858.4,0], [], 0, "CAN_COLLIDE"];
[_box3] call Extra_Large_Gun_Box;
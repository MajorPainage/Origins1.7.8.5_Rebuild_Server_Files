private ["_vehicle", "_vehicle_refuel_id"];
//Awesomely Edited by Seven
_vehicle = objNull;
diag_log "Running ""kh_actions"".";
while {true} do
{
    if (!isNull player) then
    {
        private ["_currentVehicle", "_isNearFeed"];
 
 
        _currentVehicle = vehicle player;
        _isNearFeed = count ((position _currentVehicle) nearObjects ["Land_A_FuelStation_Feed", 10]) > 0;
 
        if (_vehicle != _currentVehicle) then
        {
            if (!isNull _vehicle) then
            {
                _vehicle removeAction _vehicle_refuel_id;
                _vehicle = objNull;
            };
 
            if (_currentVehicle != player && _isNearFeed) then
            {
                _vehicle = _currentVehicle;
 
                _vehicle_refuel_id = _vehicle addAction ["Refuel", "Scripts\kh_vehicle_refuel.sqf", [], -1, false, false, "",
                  "vehicle _this == _target && local _target"];
            };
        };
 
        if (!_isNearFeed) then
        {
            _vehicle removeAction _vehicle_refuel_id;
            _vehicle = objNull;
        };
    };
    sleep 2;
}
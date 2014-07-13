scriptName "Functions\arrays\fn_selectRandomWeighted.sqf";

private ["_array", "_weights"];
_array = _this select 0;
_weights = _this select 1;
_weighted = [];
for "_i" from 0 to ((count _weights) - 1) do 
{
private ["_weight"];
_weight = _weights select _i;

if ((typeName _weight) != (typeName 0)) then {diag_log "Log: [selectRandomWeighted] Weights should be Numbers; weight set to 0!"; _weight = 0};


if (_weight < 0) then {diag_log "Log: [selectRandomWeighted] Weights should be more than or equal to 0; weight set to 0!"; _weight = 0};



_weight = round(_weight * 100);

for "_k" from 0 to (_weight - 1) do 
{
_weighted = _weighted + [_i];
};
};
_weighted
/*
    File: fn_packupOildrill.sqf
    
    Beschreibung:
	Baut einen Ölbohrer ab
*/
_generator = nearestObjects[getPos player,["Land_Portable_generator_F"],2] select 0;
if((isNil "_generator")) exitWith {};
_barrel =_generator getVariable "barrel";
_mode = _generator getVariable ["mode",-1];
_item = "";
if ( _mode == -1 ) exitWith {};
switch (true) do
{
	case (_mode == 0): {_item = "oildrill";};
	case (_mode == 1): {_item = "oildrill1";};
	default {_item = "oildrill";};
};

if(([true,_item,1] call life_fnc_handleInv)) then
{
    titleText["Du hast den Ölbohrer abgebaut.","PLAIN"];
    deleteVehicle _generator;
	deleteVehicle _barrel;
};
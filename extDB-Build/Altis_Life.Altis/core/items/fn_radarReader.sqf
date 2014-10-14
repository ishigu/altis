/*
    File: fn_radarReader.sqf
    Author: ishi
    
    Description:
    Reads out a radartrap and adds its entries to the wanted list
*/
private["_radarTraps","_trap", "_list","_found"];

_found = false;
_radarTraps = nearestObjects[getPos player,["Land_FloodLight_F","Land_PortableLight_single_F"],6];
if (count _radarTraps == 0) exitWith {hint localize "STR_NOTF_RadartrapNotNear"};
{
	_trap = _x;
	if (isNil{_trap getVariable "DriverList"}) then {_list = [];} else {_list = _trap getVariable "DriverList";};
	if (count _list > 0) then {
		_found = true;
		{
			[_x,"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		} forEach _list;
	};
	_trap setVariable["DriverList",[],true];
} forEach _radarTraps;

if (!_found) then { hint localize "STR_NOTF_RadartrapNoEntries"; }
else { hint localize "STR_NOTF_RadartrapFound"; };
/*
	File: fn_getImpoundedVehicles.sqf
	Author: Shentoza for Westerland
	
	Description:
	Sends a request to query the database information and returns impounded vehicles.
*/
private["_pid","_side","_unit","_ret"];
_pid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
//Error checks
if(_pid == "" OR _side == sideUnknown OR isNull _unit) exitWith
{
	if(!isNull _unit) then
	{
		[[[]],"life_fnc_impoundPlusMenu",(owner _unit),false] spawn life_fnc_MP;
	};
};

_unit = owner _unit;
_side = switch(_side) do
{
	case west:{"cop"};
	case civilian: {"civ"};
	case independent: {"med"};
	case east: {"reb"};
	default {"Error"};
};

if(_side == "Error") exitWith {
	[[[]],"life_fnc_impoundPlusMenu",(owner _unit),false] spawn life_fnc_MP;
};

_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND impound='1' AND side='%2'",_pid,_side];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;


diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";
if(typeName _queryResult == "STRING") exitWith {
	[[[]],"life_fnc_impoundPlusMenu",(owner _unit),false] spawn life_fnc_MP;
};

[[_queryResult],"life_fnc_impoundPlusMenu",_unit,false] spawn life_fnc_MP;
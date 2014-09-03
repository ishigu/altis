/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Queries to see if the player belongs to any gang.
*/
private["_query","_queryResult","_uid","_side"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param;

_side = switch(_side) do
{
	case west:{"cop"};
	case civilian: {"civ"};
	case independent: {"med"};
	case east: {"reb"};
	default {"Error"};
};

_query = format["SELECT id, owner, name, maxmembers, bank, members FROM gangs WHERE active='1' AND members LIKE '%2%1%2' AND side='%3'",_uid,"%",_side];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

if(count _queryResult != 0) then {
	_tmp = [_queryResult select 5] call DB_fnc_mresToArray;
	if(typeName _tmp == "STRING") then {_tmp = call compile format["%1",_tmp];};
	_queryResult set[5, _tmp];
};
missionNamespace setVariable[format["gang_%1",_uid],_queryResult];
/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;

{
	if((_x getVariable ["restrained",false]) || (_x getVariable ["blindfolded",false])) then
	{
		_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
		[[_x],"life_fnc_pulloutVehRebel",_x,false] spawn life_fnc_MP;
	};
} foreach _crew;
/*
    File: fn_packuppylon.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: oVo

    Beschreibung:
	Hebt eine Straßensperre auf.
*/
private["_barrier"];
_barrier = _this select 0;
if(isNil "_barrier") exitWith {};
if( (side _caller == civilian) || ( _caller call life_fnc_isMedic) ) exitWith {hint "Du kannst das nicht aufheben!";};

if(([true,"barrier",1] call life_fnc_handleInv)) then
{
    titleText["Du hast die Straßensperre aufgehoben.","PLAIN"];
    deleteVehicle _barrier;
};
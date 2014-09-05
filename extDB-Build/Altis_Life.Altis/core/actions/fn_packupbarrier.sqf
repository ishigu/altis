/*
    File: fn_packupbarrier.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: oVo

    Beschreibung:
	Hebt eine Straßensperre auf.
*/
private["_barrier"];
_barrier = nearestObjects[getPos player,["RoadBarrier_F"],2] select 0;
if(isNil "_barrier") exitWith {};

if(([true,"barrier",1] call life_fnc_handleInv)) then
{
    titleText["Du hast die Straßensperre aufgehoben.","PLAIN"];
    deleteVehicle _barrier;
};
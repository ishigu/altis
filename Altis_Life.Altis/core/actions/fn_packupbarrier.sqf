/*
    File: fn_packuppylon.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: oVo

    Beschreibung:
	Hebt eine Straßensperre auf.
*/
private["_barrier"];
_pylon = nearestObjects[getPos player,["RoadBarrier_F"],2] select 0;
if(isNil "_barrier") exitWith {};

if(([true,"barrier",1] call life_fnc_handleInv)) then
{
    titleText["Du hast die Straßensperre aufgehoben.","PLAIN"];
    player removeAction life_action_barrierPickup;
    life_action_barrierPickup = nil;
    deleteVehicle _barrier;
};
/*
    File: fn_packuppylon.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: oVo

    Beschreibung:
	Hebt einen Pylon auf.
*/
private["_pylon","_caller"];
_pylon = nearestObjects[getPos player,["RoadCone_F"],2] select 0;
if(isNil "_pylon") exitWith {};

if(([true,"pylon",1] call life_fnc_handleInv)) then
{
    titleText["Du hast den Pylon aufgehoben.","PLAIN"];
    deleteVehicle _pylon;
};
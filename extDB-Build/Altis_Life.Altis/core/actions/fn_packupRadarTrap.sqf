/*
    File: fn_packupRadarTrap.sqf
    

    Beschreibung:
	Baut einen Blitzer ab
*/
private["_radarTrap"];
_radarTrap = nearestObjects[getPos player,["Land_PortableLight_single_F"],2] select 0;
if((isNil "_radarTrap")) exitWith {};

if(([true,"radartrap",1] call life_fnc_handleInv)) then
{
    titleText["Du hast den Blitzer abgebaut.","PLAIN"];
    deleteVehicle _radarTrap;
};
/*
    File: fn_packupRadarTrap.sqf
    

    Beschreibung:
	Baut einen Blitzer ab
*/
private["_radarTrap"];
if(side (_this select 1) != west) exitWith{hint "Du bist kein Polizist!";};
_radarTrap = _this select 0;
if((isNil "_radarTrap")) exitWith {};

if(([true,"radartrap",1] call life_fnc_handleInv)) then
{
    titleText["Du hast den Blitzer abgebaut.","PLAIN"];
    deleteVehicle _radarTrap;
};
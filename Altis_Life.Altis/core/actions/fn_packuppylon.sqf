/*
    File: fn_packuppylon.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: oVo

    Beschreibung:
	Hebt einen Pylon auf.
*/
private["_pylon","_caller"];
_pylon = _this select 0;
if(isNil "_pylon") exitWith {};
if( (side _caller == civilian) || ( _caller call life_fnc_isMedic) ) exitWith {hint "Du kannst das nicht aufheben!";};

if(([true,"pylon",1] call life_fnc_handleInv)) then
{
    titleText["Du hast den Pylon aufgehoben.","PLAIN"];
    deleteVehicle _pylon;
};
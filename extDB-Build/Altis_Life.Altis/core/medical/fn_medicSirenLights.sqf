/*
	File: fn_medicSirenLights.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_vehicle","_type"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad entry!
if(!(typeOf _vehicle in ["C_Offroad_01_F", "O_Heli_Light_02_unarmed_F", "C_SUV_01_F", "C_Van_01_box_F"])) exitWith {}; //Last chance check to prevent something from defying humanity and creating a monster.

_trueorfalse = _vehicle getVariable["lights",FALSE];
_type = vehicle player getVariable ["side","civ"];
if(_trueorfalse) then {
	_vehicle setVariable["lights",FALSE,TRUE];
} else {
	_vehicle setVariable["lights",TRUE,TRUE];
	if(_type == "adac") then {
		[[_vehicle,0.22],"life_fnc_adacLights",true,false] call life_fnc_MP;
	} else {
		[[_vehicle,0.22],"life_fnc_medicLights",true,false] call life_fnc_MP;
	};
};
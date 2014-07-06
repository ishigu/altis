/*
	Author: JoeJoe (27.12.13) v.1

	Description:
	Creates Helipad lights on every Helipad that is placed in the editor

	Parameter(s):
	createType: number defines on which types of helipads the lights will be created
				 1: Helipad (Circle)
				 2: Helipad (Civil)
				 3: Helipad (Rescue)
				 4: Helipad (Square)
				 5: all Helipads (excluding invisible Helipads)
	scriptFolder (optional): string Foldername of Scripts. 
							 e.G.: missionfolder\scripts\helipad_lights	the parameter would be "scripts"

	Example:

	* 1st way of calling:
	
		execute in init.sqf
		null = [3, "scripts"] execVM "scripts\helipad_lights\helipad_light_auto.sqf"

		

	Returns:
		nothing
	
	Changelog:
		v.1 initial release 
		
		v.11
		added:
			- isServer to prevent multiple clients call the script in mp
*/

private ["_createType","_scriptPath", "_scriptFolder", "_handle"];

if (!isServer) exitWith {};

_createType = _this select 0;

_scriptPath = "helipad_lights\helipad_light.sqf";

if(count _this > 1) then {
	_scriptFolder = _this select 1;
	_scriptPath = _scriptFolder + "\" + _scriptPath;
}
else {
	_scriptFolder = "";
};

if((_createType == 1) || (_createType == 5)) then {
	{
		_handle = [_x, "yellow", "green", false, "scripts"] execVM _scriptPath;
		waitUntil {scriptDone _handle};
	} forEach allMissionObjects "Land_HelipadCircle_F";
};

if((_createType == 2) || (_createType == 5)) then {
	{
		_handle = [_x, "yellow", "white", false, "scripts"] execVM _scriptPath;
		waitUntil {scriptDone _handle};
	} forEach allMissionObjects "Land_HelipadCivil_F";
};

if((_createType == 3) || (_createType == 5)) then {
	{
		_handle = [_x, "red", "white", false, "scripts"] execVM _scriptPath;
		waitUntil {scriptDone _handle};
	} forEach allMissionObjects "Land_HelipadRescue_F";
};

if((_createType == 4) || (_createType == 5)) then {
	{
		_handle = [_x, "yellow", "green", false, "scripts"] execVM _scriptPath;
		waitUntil {scriptDone _handle};
	} forEach allMissionObjects "Land_HelipadSquare_F";
};

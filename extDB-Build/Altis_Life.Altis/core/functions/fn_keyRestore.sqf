/*
	File: fn_keyRestore.sqf
	Author: MarioF
	
	Description:
	Give the executer keys from Vehicles where he is marked as Owner
*/
private["_allVeh","_pUID"];

// Wait a bit for World to become in Sync
sleep 5;

// Setup Variables
_allVeh = allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship";
_name = name player;

// Iterate trough all cars and check for the owners
{
	_owners = _x getVariable ["vehicle_info_owners",[]];
	_index = [_name,_owners] call fnc_index;
	
	if(!(_index == -1)) then {
		life_vehicles set[count life_vehicles, _x];
	};	
} foreach _allVeh;
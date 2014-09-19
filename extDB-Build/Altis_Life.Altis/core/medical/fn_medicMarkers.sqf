/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks downed players on the map when it's open.
*/
private["_markers","_units","_patients","_selfmedic"];
if(isServer) exitWith{};
if(!(player call life_fnc_isMedic)) exitWith{};
_markers = [];
_units = [];
_patients = [];
_selfmedic = (player call life_fnc_isMedic);

sleep 0.25;
if(visibleMap) then {

	// Get medics
	{
		if (_selfmedic) then {
			if((_x call life_fnc_isMedic) && (!(_x getVariable ["hideNametag",false]))) then {
				_units set[count _units,_x];
			};
		};
	} foreach playableUnits;
	
	// Get patients
	{
		if (_selfmedic) then {
			_name = _x getVariable "name";
			if(!isNil "_name") then {
				_patients set[count _patients,_x];
			};
		};
	} foreach allDeadMen;
	
	//Loop through and create markers.
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTextLocal format["%1",name _x];
		_markers set[count _markers,[_marker,_x]];
	} foreach _units;
	
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerTypeLocal "mil_objective";
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTextLocal format["%1",(_x getVariable["name","Unknown Player"])];
		_markers set[count _markers,[_marker,_x]];
	} foreach _patients;

	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};
	
	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_units = [];
	_patients = [];
};
/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks downed players on the map when it's open.
*/
private["_markers","_units","_patients"];
_markers = [];
_units = [];
_patients = [];

sleep 0.25;
if(visibleMap) then {

	// Get medics and patients
	{
		_medic = str(_x) in ["medic_1","medic_2","medic_3","medic_4"];
		_down = _x getVariable ["Revive",false];
		if(_medic) then {
			_units set[count _units,_x];
		};
		if(_down) then {
			_patients set[count _patients,_x];
		};
	} foreach playableUnits;
	
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
		_marker setMarkerTypeLocal "loc_Hospital";

		/*if((_x getVariable["tcb_ais_nearDeath", false])) then {
			_marker setMarkerColorLocal "ColorRed";
		} else {*/
			_marker setMarkerColorLocal "ColorBlack";
		//};
		
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
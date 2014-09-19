/*
	File: fn_adacMarkers.sqf
	
	Description:
	Marks ADAC and distress for other ADAC.
	distress array = [index,unit,distpos,msg]
*/
private["_markers","_markerstat","_adacs","_distrs"];
if(isServer) exitWith{};
if(!(player call life_fnc_isADAC)) exitWith{};
_markers = [];
_markerstat = [];
_adacs = [];

sleep 0.5;
if(visibleMap) then {
	{if(_x call life_fnc_isADAC && (!(_x getVariable ["hideNametag",false])) ) then {_adacs set[count _adacs,_x];}} foreach playableUnits; //Fetch list of ADACs
	
	 //Create ADAC markers
	{
		_marker = createMarkerLocal [format["ADAC_%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorYellow";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];
	
		_markers set[count _markers,[_marker,_x]];
	} foreach _adacs;
	//Distress Markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x select 1],visiblePosition (_x select 1)];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name (_x select 1)];
		
		
		_marker2 = createMarkerLocal [format["%1_distr_marker",_x],_x select 2];
		_marker2 setMarkerColorLocal "ColorRed";
		_marker2 setMarkerTypeLocal "mil_objective";
		_marker2 setMarkerTextLocal format["Notruf empfangen:%1",name (_x select 1)];
	
		_markers set[count _markers,[_marker,_x select 1]];
		_markerstat set[count _markerstat,[_marker2,-1]];
	} forEach life_adac_distress;
	
		
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
	{deleteMarkerLocal (_x select 0);} foreach _markerstat;
	_markers = [];
	_markerstat = [];
	_adacs = [];
};
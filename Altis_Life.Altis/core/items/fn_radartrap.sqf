/*
    File: fn_radarTrap.sqf
    
    Beschreibung
    Platziert einen Blitzer (+ Blitzerfunktion)
	Author:
	Shentoza für Westerland
*/
private["_position","_radarTrap","_cam"];
if(side player != west) exitWith{hint "Du bist kein Polizist!";};
_radarTrap = "Land_PortableLight_single_F" createVehicle [0,0,0];
_cam = "Land_HandyCam_F" createVehicle [0,0,0];
_radarTrap attachTo[player,[0,2.5,1.25]];
_cam attachTo[_radarTrap,[0,-0.15,0.85]];
_radarTrap setDir 90;
_cam setDir 0;
_radarTrap setVariable["item","radarTrapDeployed",true];
_radarTrap setVariable["mode","innerorts",true];
life_action_radarTrapDeploy = player addAction["<t color='#00FF00'>Blitzer aufstellen</t>",{if(!isNull life_radarTrap) then {detach life_radarTrap; life_radarTrap = ObjNull;}; player removeAction life_action_radarTrapDeploy; life_action_radarTrapDeploy = nil;},"",999,false,false,"",'!isNull life_radarTrap && side player == west'];
life_radarTrap = _radarTrap;
waitUntil {isNull life_radarTrap};
if(!isNil "life_action_radarTrap") then {player removeAction life_action_radarTrapDeploy;};
if(isNull _radarTrap) exitWith {life_radarTrap = ObjNull;};
_radarTrap setPos [(getPos _radarTrap select 0),(getPos _radarTrap select 1),0];
_radarTrap allowDamage false;
_radarTrap enableSimulationGlobal false;
_cam allowDamage false;
_cam enableSimulationGlobal false;

_toleranceLower = 0;
_toleranceUpper =(getDir _cam+30) mod 360;
_conversion = false;_speed = 0;_dirveh = 0;_distance = 0;_triggered = false;_data = "";_unit = objNull;_vehicle = objNull;
_copPresent = false;
_mode = _radarTrap getVariable["mode","innerorts"];
		
	if((getDir _cam ) > 30) then { 
	_toleranceLower = getDir _cam - 30;
	} else { _toleranceLower = 360 - ( abs (getDir _cam - 30));};
	
	if ( _toleranceLower >= 330) then {_conversion = true;};
	
	while {alive _radarTrap} do
    {
		_copPresent = false;
		{
			if( side _x == west && isPlayer _x) exitWith{ _copPresent = true;};  //Cops around?
		}forEach ((getPos _cam) nearEntities["Man",25]);
		
		
		if(_copPresent) then {
			_mode = _radarTrap getVariable["mode","innerorts"];
			
			//iterate through all vehicles in 60meters
			{
				_vehicle = _x;
				if(alive _vehicle ) then {
					_rightDir = false;
					_speed = round speed _vehicle;
					_dirveh = getDir _vehicle;
					_distance = _cam distance _vehicle;
					_triggered = false;
					_data = "";
					_unit = driver _vehicle;

					if(_conversion) then
					{
						if( (_dirveh >= _toleranceLower)  || (_dirveh <= _toleranceUpper) ) then { _rightDir = true;};
					} else {
						if ((_dirveh >= _toleranceLower) && (_dirveh <= _toleranceUpper)) then { _rightDir = true;};
					};
			
					if ( (_rightDir) && (_distance <= 50) && (_mode == "innerorts") ) then
					{	
						switch (true) do
						{
							case((_speed >= 50 && _speed <= 60)) : { _triggered = true; _data = "44B";};
							case((_speed > 60 && _speed <= 85)) : { _triggered = true; _data =  "45B";};
							case((_speed > 85 && _speed <= 110)) : { _triggered = true; _data =  "46B";};
							case((_speed > 110 && _speed <= 200)) : { _triggered = true; _data =  "47B";};
							case((_speed > 200 )) : { _triggered = true; _data =  "48B";};
							default {};
						};
					};
				
					if ( (_rightDir) && (_distance <= 50) && (_mode == "ausserorts") ) then
					{	
						switch (true) do
						{
							case((_speed >= 130 && _speed <= 180)) : { _triggered = true; _data = "49B";};
							case((_speed > 180 && _speed <= 230)) : { _triggered = true; _data =  "50B";};
							case((_speed > 230)) : { _triggered = true; _data =  "51B";};
							default {};
						};
					};
				
					if( _triggered) then {
						[[1,format["%1 wurde %2 mit %3km/h geblitzt. Nach ihm wird nun gefahndet.",name _unit,_mode,_speed]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
						[[1,format["Du wurdest %1 mit %2km/h geblitzt.",_mode,_speed]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
						[[getPlayerUID _unit,name _unit,_data],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
						[[_radarTrap,0,300],"life_fnc_radartrapFlash",true,false] spawn life_fnc_MP;
						waitUntil {(( _cam distance _vehicle > 50) || (!alive _radarTrap) ) };
					};
				};	
			}forEach ((getPos _cam) nearEntities["Car",60]);
		};
		sleep 0.5;
    };
	deleteVehicle _cam;
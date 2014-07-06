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
_radarTrap enableSimulationGlobal false;
_cam setDir 0;
_cam enableSimulationGlobal false;
_radarTrap setVariable["item","radarTrapDeployed",true];
_radarTrap setVariable["mode",true,true];
life_action_radarTrapDeploy = player addAction["<t color='#00FF00'>Blitzer aufstellen</t>",{if(!isNull life_radarTrap) then {detach life_radarTrap; life_radarTrap = ObjNull;}; player removeAction life_action_radarTrapDeploy; life_action_radarTrapDeploy = nil;},"",999,false,false,"",'!isNull life_radarTrap && side player == west'];
life_radarTrap = _radarTrap;
waitUntil {isNull life_radarTrap};
if(!isNil "life_action_radarTrap") then {player removeAction life_action_radarTrapDeploy;};
if(isNull _radarTrap) exitWith {life_radarTrap = ObjNull;};
_radarTrap setPos [(getPos _radarTrap select 0),(getPos _radarTrap select 1),0];
_radarTrap allowDamage false;
_cam allowDamage false;

[_radarTrap,_cam] spawn
{
//Initialize
	_radarTrap = _this select 0; //All in all, _vehicle has to  move towards(!) the radartrap (meaning opposite direction) 
	_cam = _this select 1;
	_toleranceLower = 0;
	_toleranceUpper =(getDir _cam+30) mod 360;
	_conversion = false;_speed = 0;_dirveh = 0;_distance = 0;_triggered = false;_data = "";_unit = objNull;_vehicle = objNull;
	_copPresent = false;
	_mode = _radarTrap getVariable["mode",true];
	_text = "";
	_id = _radarTrap addAction["Blitzer auf <t color='#00FF00'>'Ausserorts'</t> einstellen",life_fnc_radartrapSwitch,"",50,false,false,""];
	
	
	if((getDir _cam ) > 30) then { 
	_toleranceLower = getDir _cam - 30;
	} else { _toleranceLower = 360 - ( abs (getDir _cam - 30));};
	
	if ( _toleranceLower >= 330) then {_conversion = true;};
	
		_light = createVehicle ["#lightpoint", getPos _radarTrap, [], 0, "CAN_COLLIDE"];
		sleep 0.2;
		_light setLightColor [20, 20, 20];
		_light setLightBrightness 0;
		_light lightAttachObject [_radarTrap, [0,0,1.5]];
		_light setLightAttenuation [0.5, 1, 75, 130];
		_light setLightFlareSize 0.38;
		_light setLightFlareMaxDistance 150;
		_light setLightUseFlare true;
		_light setLightDayLight true;
		_light setLightAmbient [1,1,1];
	
	
	
	while {alive _radarTrap} do
    {
		_copPresent = true;
		{
		
			if( side _x == west && isPlayer _x) exitWith{ _copPresent = true;};  //Cops around?
		}forEach ((getPos _cam) nearEntities["Man",25]);
		
		
		if(_copPresent) then {
			_mode = _radarTrap getVariable["mode",true];
			
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
			
				if ( (_rightDir) && (_distance <= 50) && (_mode) ) then
				{	
					switch (true) do
					{
						case((_speed >= 50 && _speed <= 60)) : { _triggered = true; _data = "44";};
						case((_speed > 60 && _speed <= 85)) : { _triggered = true; _data =  "45";};
						case((_speed > 85 && _speed <= 110)) : { _triggered = true; _data =  "46";};
						case((_speed > 110 && _speed <= 200)) : { _triggered = true; _data =  "47";};
						case((_speed > 200 )) : { _triggered = true; _data =  "48";};
						default {};
					};
				};
				
				if ( (_rightDir) && (_distance <= 50) && (!_mode) ) then
				{	
					switch (true) do
					{
						case((_speed >= 130 && _speed <= 180)) : { _triggered = true; _data = "49";};
						case((_speed > 180 && _speed <= 230)) : { _triggered = true; _data =  "50";};
						case((_speed > 230)) : { _triggered = true; _data =  "51";};
						default {};
					};
				};
				
				if( _triggered) then {
					if(_mode) then {_text = "innerorts";}else{_text="ausserorts";};
					[[1,format["%1 wurde %2 mit %3km/h geblitzt. Nach ihm wird nun gefahndet.",name _unit,_speed]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
					[[getPlayerUID _unit,name _unit,_data],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					_light setLightBrightness 300;
					sleep 0.4;
					_light setLightBrightness 0;
					waitUntil {(( _cam distance _vehicle > 50) || (!alive _radarTrap) ) };
				};
				};	
			}forEach ((getPos _cam) nearEntities["Car",60]);
		};
		sleep 0.5;
    };
	deleteVehicle _cam;
	deleteVehicle _light;
};
_radarTrap addAction["Blitzer einpacken",life_fnc_packupradarTrap,"",200,false,false,""];
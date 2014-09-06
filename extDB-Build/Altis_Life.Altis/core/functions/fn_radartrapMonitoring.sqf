/*
    File: fn_radarTrap.sqf
    
    Beschreibung
    Überwacht, ob ein Spieler durch einen Blitzer fährt.
	Author:
	Shentoza für Westerland
*/
private["_radarTraps"];
if(isDedicated) exitWith{};
while{true} do
{
	waitUntil{
		_radarTraps =  nearestObjects[getPos player,["Land_FloodLight_F","Land_PortableLight_single_F"],60];//gather all near models that match the used Radartraps
		{
		if(!(_x getVariable ["radartrap",false])) then { _array = [_x]; _radarTraps = _radarTraps - _array;};//removes all unfunctional objects
		} forEach _radarTraps;
		(count _radarTraps > 0)};
	{	
		_x spawn {
			private["_position","_radarTrap","_radarTrapStationary","_radarTrapMobile","_unit","_type","_price","_copPresent","_vehicle","_dir","_conversion","_toleranceLower","_toleranceUpper","_dirveh","_rightDir","_mode","_data","_triggered","_distance","_speedRaw","_speedTol","_timer"];
			_radarTrap = _this;
			_unit = player;
			if( (vehicle _unit != _unit) && (vehicle _unit isKindOf "Car") && (driver (vehicle _unit) == _unit)) then //viable Vehicle&driver check 
			{ 
				_copPresent = false;
				{
					if( side _x == west && isPlayer _x) exitWith{ _copPresent = true;};  //Cops around?
				}forEach ((getPos _radarTrap) nearEntities["Man",25]);
				if(_radarTrap getVariable ["item","Stationary"] != "radarTrapDeployed") then {_copPresent = true;}; //is Stationary?
				if(!_copPresent) exitWith {};
				_vehicle = vehicle _unit;
				_dir = getDir _radarTrap;
				switch (true) do
				{
					case(typeOf _radarTrap == "Land_FloodLight_F"):{_dir = getDir _radarTrap - 90};
					case(typeOf _radarTrap == "Land_PortableLight_single_F"):{}; //already correct Direction 
					default {};
				};
				_conversion = false;
				
				_toleranceLower = _dir - 30;
				_toleranceUpper =(_dir+30) mod 360;
				if((_dir) < 30) then
				{ 
					_toleranceLower = 360 - ( abs (_dir - 30));
				};
				if ( _toleranceLower > 300) then {_conversion = true;};
				
				_dirveh = getDir _vehicle;
				_rightDir = false;
				if(_conversion) then
				{
					if( (_dirveh >= _toleranceLower)  || (_dirveh <= _toleranceUpper) ) then { _rightDir = true;};
				} else {
					if ((_dirveh >= _toleranceLower) && (_dirveh <= _toleranceUpper)) then { _rightDir = true;};
				};
				
				_mode = _radarTrap getVariable["mode","innerorts"];
				_data = "";
				_triggered = false;
				_distance = _radarTrap distance _vehicle;
				_speedRaw = round (speed _vehicle);
				_speedTol = round (_speedRaw * 0.9);
				sleep 0.1;
				if(_radarTrap distance _vehicle > _distance) exitWith{};
				if ( (_rightDir) && (_distance <= 50) && (_mode == "innerorts") ) then
				{	
					switch (true) do
					{
						case((_speedTol > 50 && _speedTol <= 60)) : { _triggered = true; _data = "44B";};
						case((_speedTol > 60 && _speedTol <= 85)) : { _triggered = true; _data =  "45B";};
						case((_speedTol > 85 && _speedTol <= 110)) : { _triggered = true; _data =  "46B";};
						case((_speedTol > 110 && _speedTol <= 200)) : { _triggered = true; _data =  "47B";};
						case((_speedTol > 200 )) : { _triggered = true; _data =  "48B";};
						default {};
					};
				};	
				if ( (_rightDir) && (_distance <= 50) && (_mode == "ausserorts") ) then
				{	
					switch (true) do
					{
						case((_speedTol > 130 && _speedTol <= 180)) : { _triggered = true; _data = "49B";};
						case((_speedTol > 180 && _speedTol <= 230)) : { _triggered = true; _data =  "50B";};
						case((_speedTol > 230)) : { _triggered = true; _data =  "51B";};
						default {};
					};
				};	
				if(!(_radarTrap getVariable ["ready",false])) exitWith{};
				if(!_triggered) exitWith{};
				_radarTrap setVariable ["ready",false,false];
				_timer = round(time) + 10;

				if (_data != "") then {
					_type = ["empty",0];
					switch (_data) do {
						case "44B": {_type = ["Innerorts über 50km/h (A)",1500];};
						case "45B": {_type = ["Innerorts über 60km/h (A)",3000];};
						case "46B": {_type = ["Innerorts über 85km/h (A)",7000];};
						case "47B": {_type = ["Innerorts über 110km/h (A)",25000];};
						case "48B": {_type = ["Innerorts über 200km/h (A)",60000];};
						case "49B": {_type = ["Außerorts über 130km/h (A)",6000];};
						case "50B": {_type = ["Außerorts über 180km/h (A)",10000];};
						case "51B": {_type = ["Außerorts über 230km/h+ (A)",25000];};
					};
					_price = _type select 1;
					if (_price > life_atmcash) then {
						[[1,format["%1 wurde %2 mit %3km/h geblitzt. Nach Abzug der Toleranz sind das noch %4km/h. Nach ihm wird nun gefahndet, da er die Strafe nicht zahlen konnte.",_unit getVariable ["realname",name _unit],_mode,_speedRaw,_speedTol]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
						[[1,format["Du wurdest %1 mit %2km/h geblitzt. Nach Abzug der Toleranz sind das noch %3km/h. Da du das Ticket von %4$ nicht bezahlen kannst, wird nun nach dir gefahndet.",_mode,_speedRaw,_speedTol,[_price] call life_fnc_numberText]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
						[[getPlayerUID _unit,name _unit,_data],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					} else {
						life_atmcash = life_atmcash - _price;
						[[1,format["%1 wurde %2 mit %3km/h geblitzt. Nach Abzug der Toleranz sind das noch %4km/h. Das Bußgeld wurde ihm/ihr in Rechnung gestellt.",_unit getVariable ["realname",name _unit],_mode,_speedRaw,_speedTol]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
						[[1,format["Du wurdest %1 mit %2km/h geblitzt. Nach Abzug der Toleranz sind das noch %3km/h. Ein Bußgeld in Höhe von %4$ wurde dir in Rechnung gestellt",_mode,_speedRaw,_speedTol,[_price] call life_fnc_numberText]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
					};
					if (sunOrMoon < 1) then { //Nacht
						[[_radarTrap,0,50],"life_fnc_radartrapFlash",true,false] spawn life_fnc_MP;
					} else { // Tag
						[[_radarTrap,0,180],"life_fnc_radartrapFlash",true,false] spawn life_fnc_MP;
					};
				};
				
				waitUntil {(( _radarTrap distance _vehicle > 50) || (!alive _radarTrap) || (round(time) == _timer) ) };
				if(alive _radarTrap) then{	_radarTrap setVariable ["ready",true,false]; };
			};
		};
	}forEach _radarTraps;
	sleep 0.5;
};
/*
    File: fn_radarTrap.sqf
    
    Beschreibung
    Platziert einen Blitzer (+ Blitzerfunktion)
	Author:
	Shentoza für Westerland
	type true = manuell
	type false = fest installiert
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
_radarTrap setDamage 0.91; //Turn the lamp off. Ugly method but switchLight doesn't work
_radarTrap allowDamage false;
_radarTrap enableSimulationGlobal false;
_cam allowDamage false;
_cam enableSimulationGlobal false;
_radarTrap setVariable["radartrap",true,true];
_radarTrap setVariable["ready",true,true];
[_radarTrap] spawn{  //Make sure players that connected after setting up the radarTrap 
	_radarTrap = _this select 0;
	while{alive _radarTrap} do{
			_oldUnitCount = count playableUnits;
			waitUntil{_oldUnitCount != count playableUnits};
			if(_oldUnitCount < count playableUnits) then{ //if player connected
				_radarTrap setVariable["radartrap",true,true];
				_radarTrap setVariable["ready",(_radarTrap getVariable ["ready",true]),true];
				_radarTrap setVariable["mode",(_radarTrap getVariable ["mode","innerorts"]),true];
			};
		};
	};
waitUntil{!(alive _radarTrap)};
deleteVehicle _cam;
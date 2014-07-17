/*
    File: fn_pylon.sqf
    Author: oVo
    
    Beschreibung
    Holt die Straßensperre aus dem Inventar und setzt Sie auf der Map.
*/
private["_position","_barrier"];
_barrier = "RoadBarrier_F" createVehicle [0,0,0];
_barrier attachTo[player,[0,2.5,0.2]];
_barrier setDir 90;
_barrier setVariable["item","barrierDeployed",true];

life_action_barrierDeploy = player addAction["<t color='#00FF00'>Straßensperre aufstellen</t>",{if(!isNull life_barrier) then {detach life_barrier; life_barrier = ObjNull;}; player removeAction life_action_barrierDeploy; life_action_barrierDeploy = nil;},"",999,false,false,"",'!isNull life_barrier && side player != civilian'];
life_barrier = _barrier;
waitUntil {isNull life_barrier};
if(!isNil "life_action_barrierDeploy") then {player removeAction life_action_barrierDeploy;};
if(isNull _barrier) exitWith {life_barrier = ObjNull;};
_barrier setPos [(getPos _barrier select 0),(getPos _barrier select 1),0];
_barrier allowDamage false;
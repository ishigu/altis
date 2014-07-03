/*
    File: fn_pylon.sqf
    Author: oVo
    
    Beschreibung
    Holt den Pylon aus dem Inventar und setzt ihn auf der Map.
*/
private["_position","_pylon"];
_pylon = "RoadCone_F" createVehicle [0,0,0];
_pylon attachTo[player,[0,5.5,0.2]];
_pylon setDir 90;
_pylon setVariable["item","pylonDeployed",true];

life_action_pylonDeploy = player addAction["<t color='#00FF00'>Pylon aufstellen</t>",{if(!isNull life_pylon) then {detach life_pylon; life_pylon = ObjNull;}; player removeAction life_action_pylonDeploy; life_action_pylonDeploy = nil;},"",999,false,false,"",'!isNull life_pylon && side player != civilian'];
life_pylon = _pylon;
waitUntil {isNull life_pylon};
if(!isNil "life_action_pylonDeploy") then {player removeAction life_action_pylonDeploy;};
if(isNull _pylon) exitWith {life_pylon = ObjNull;};
_pylon setPos [(getPos _pylon select 0),(getPos _pylon select 1),0];
_pylon allowDamage false;
/*
[] spawn
{
	while {true} do
    {
		_pylon setPos [(getPos _pylon select 0),(getPos _pylon select 1),0];
		_pylon allowDamage false;
		_light = createVehicle ["#lightpoint", getPos _pylon, [], 0, "CAN_COLLIDE"];
		sleep 0.2;
		_light setLightColor [20, 20, 0.1];
		_light setLightBrightness 55;
		_light lightAttachObject [_pylon, [0,0,0.3]];
		_light setLightAttenuation [0.5, 3, 75, 130];
		_light setLightFlareSize 0.38;
		_light setLightFlareMaxDistance 150;
		_light setLightUseFlare true;
		_light setLightDayLight true;
		_light setLightAmbient [1,1,0.1];
    };
};
*/
life_action_pylonPickup = player addAction["Pylon einpacken",life_fnc_packuppylon,"",0,false,false,"",
' _pylon = nearestObjects[getPos player,["RoadCone_F"],2] select 0; !isNil "_pylon" && !isNil {(_pylon getVariable "item")} && side player != civilian'];
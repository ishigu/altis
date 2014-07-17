/*
.... flashes the radartrap, when triggered... 'duuh?
Author: Shentoza for Westerland
*/

private["_radarTrap","_min","_max","_light"];

_radarTrap = _this select 0;
if (isNil "_radarTrap" || isNull _radarTrap) exitWith {};
_min = _this select 1;
_max = _this select 2;
_light = createVehicle ["#lightpoint", getPos _radarTrap, [], 0, "CAN_COLLIDE"];
_light lightAttachObject [_radarTrap, [0,0,1.5]];
_light allowDamage false;
_light setLightColor [20, 20, 20];
_light setLightBrightness 0;
_light setLightAttenuation [0.5, 1, 75, 130];
_light setLightFlareSize 0.38;
_light setLightFlareMaxDistance 150;
_light setLightUseFlare true;
_light setLightDayLight true;
_light setLightAmbient [1,1,1];
		_light setLightBrightness _max;
		sleep 0.4;
		_light setLightBrightness _min;
deleteVehicle _light;
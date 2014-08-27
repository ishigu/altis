/*
    File: fn_weed.sqf
    Author: Kuchiha

    Description:
    Marijuana effects.
*/

//Close inventory
closeDialog 0;

//Little hint then wait a litle before starting drugs effects
sleep 3;

//Activate ppEffects we need
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

player setVariable ["smoke_weed", true, true];
_me = player;
_PS = "#particlesource" createVehicle getpos _me;
[[_PS,_me],"life_fnc_weedSmoke",true] spawn life_fnc_MP;

_smoke_action = player addAction["<t color='#FF0000'>Joint ausmachen</t>",life_fnc_extinguishJoint,"",6, false, true, "", ' (player getVariable ["smoke_weed",false]) '];

//Let's go for 180secs of effects
_count = 0;
_skip = false;
while{alive player && _count < 180} do 
{
	if ((_count == 90 || !(player getVariable ["smoke_weed",false])) && !_skip) then { // Smoke joint for 90seconds, but effects last another 90secs
		player setVariable ["smoke_weed", false, true];
		player removeAction _smoke_action;
		deleteVehicle _PS;
		_count = 90;
		_skip = true;
	};

	"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
    "chromAberration" ppEffectCommit 1;   
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];
	sleep 1;
	_count = _count + 1;
}; 

//Stop effects
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

//Deactivate ppEffects
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
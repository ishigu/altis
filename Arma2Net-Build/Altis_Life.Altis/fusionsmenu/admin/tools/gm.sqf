if (isNil "lifeGodMode") then {
    lifeGodMode = false;
};

if (!lifeGodMode) then {
    lifeGodMode = true;
    hint "GodMode ON";
    cutText [format["GodMode ON"], "PLAIN"];
	
	antidote1 = 2581;
	life_thirst = 100;
	life_hunger = 100;
	
    player removeAllEventHandlers "handleDamage";
    player addEventHandler ["handleDamage", {}];
    player allowDamage false;
	[[player,"bandage"],"fnc_say3D",nil,false] spawn BIS_fnc_MP;
	player setDamage 0;
	
	sleep 0.1;
	[true] call life_fnc_sessionUpdate;
	sleep 0.1;
	[] call life_fnc_hudUpdate;
	
} else {

    lifeGodMode = false;
    hint "GodMode OFF";
    cutText [format["GodMode OFF"], "PLAIN"];

    player addEventHandler ["handleDamage", {true}];
    player removeAllEventHandlers "handleDamage";
    player allowDamage true;
	
};
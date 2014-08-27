/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
	};
	case west:
	{
		// Waffen Beschlagnahmen
        life_actions = life_actions + [player addAction["<t color='#FFFF00'>Waffen beschlagnahmen</t>",life_fnc_seizeWeapon,cursorTarget,0,false,false,"",'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side (group cursorTarget) in [east,civilian]) && (cursorTarget getVariable "restrained") && ((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_5") < 30))']];
        
		// Blaulicht
		life_actions = [player addAction["Blaulicht an",{[[vehicle player,0.22],"life_fnc_copLights",true,false] spawn life_fnc_MP; vehicle player setVariable["lights",true,true];},"",0,false,false,"",' vehicle player != player && !isNil {vehicle player getVariable "lights"} && ((driver vehicle player) == player) && !(vehicle player getVariable "lights")']];
		life_actions = life_actions + [player addAction["Blaulicht aus",{vehicle player setVariable["lights",false,true];},"",0,false,false,"", 'vehicle player != player && !isNil {vehicle player getVariable "lights"} && ((driver vehicle player) == player) && (vehicle player getVariable "lights") ']];
		
		life_actions = life_actions + [player addAction["Nagelband einpacken",life_fnc_packupSpikes,"",0,false,false,"",' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}']];
		//RadarTrap
		life_actions = life_actions + [player addAction["Blitzer einpacken",life_fnc_packupRadarTrap,"",200,false,false,"",' _radarTrap = nearestObjects[getPos player,["Land_PortableLight_single_F"],2] select 0; !isNil "_radarTrap" && !isNil {(_radarTrap getVariable "item")}']];
		life_actions = life_actions + [player addAction["Blitzer auf <t color='#00FF00'>'Ausserorts'</t> einstellen",life_fnc_radartrapSwitch,"",50,false,false,"",' _radarTrap = nearestObjects[getPos player,["Land_PortableLight_single_F"],2] select 0;!isNil "_radarTrap" && !isNil {(_radarTrap getVariable "item")} && (_radarTrap getVariable "mode" == "innerorts")']];
		life_actions = life_actions + [player addAction["Blitzer auf <t color='#00FF00'>'Innerorts'</t> einstellen",life_fnc_radartrapSwitch,"",50,false,false,"",' _radarTrap = nearestObjects[getPos player,["Land_PortableLight_single_F"],2] select 0; !isNil "_radarTrap" && !isNil {(_radarTrap getVariable "item")} && ( _radarTrap getVariable "mode" == "ausserorts" )']];
		//Pylons + Barriers
		life_actions = life_actions + [player addAction["Pylon einpacken",life_fnc_packuppylon,"",0,false,false,"",' _pylon = nearestObjects[getPos player,["RoadCone_F"],2] select 0; !isNil "_pylon" && (_pylon getVariable "item" == "pylonDeployed")']];
		life_actions = life_actions + [player addAction["Strassensperre einpacken",life_fnc_packupbarrier,"",0,false,false,"",' _barrier = nearestObjects[getPos player,["RoadBarrier_F"],2] select 0;!isNil "_barrier" && (_barrier getVariable "item" == "barrierDeployed")']];

	};
	case independent:
	{
		if(player call life_fnc_isADAC) then {
			life_actions = life_actions + [player addAction["Pylon einpacken",life_fnc_packuppylon,"",0,false,false,"",' _pylon = nearestObjects[getPos player,["RoadCone_F"],2] select 0; !isNil "_pylon" && (_pylon getVariable "item" == "pylonDeployed")']];
			life_actions = life_actions + [player addAction["Strassensperre einpacken",life_fnc_packupbarrier,"",0,false,false,"",' _barrier = nearestObjects[getPos player,["RoadBarrier_F"],2] select 0;!isNil "_barrier" && (_barrier getVariable "item" == "barrierDeployed")']];
		};
		
	};
	case east:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
	};
};
//Use Chemlights in hand
life_actions = life_actions + [player addAction["Knicklicht (Rot) in die Hand nehmen",life_fnc_chemlightUse,"red",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_red" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Knicklicht (Gelb) in die Hand nehmen",life_fnc_chemlightUse,"yellow",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_yellow" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Knicklicht (Grün) in die Hand nehmen",life_fnc_chemlightUse,"green",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_green" in (magazines player) && vehicle player == player ']];
life_actions = life_actions + [player addAction["Knicklicht (Blau) in die Hand nehmen",life_fnc_chemlightUse,"blue",-1,false,false,"",
' isNil "life_chemlight" && "Chemlight_blue" in (magazines player) && vehicle player == player ']];
//Drop Chemlight
life_actions = life_actions + [player addAction["Drop Chemlight",{if(isNil "life_chemlight") exitWith {};if(isNull life_chemlight) exitWith {};detach life_chemlight; life_chemlight = nil;},"",-1,false,false,"",'!isNil "life_chemlight" && !isNull life_chemlight && vehicle player == player ']];

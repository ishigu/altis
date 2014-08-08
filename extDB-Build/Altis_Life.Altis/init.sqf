enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

// **********  Custom Settings *********** //
thirdPartyScripts = true; // Starts all external scripts
fastRoping = true; // Fast Rope from Choppers
doors = false; // enable HeliDoors
// **********  Custom Settings *********** //

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.5";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

call compile preprocessFile "UI\HUD.sqf";
[] spawn ICE_HUD;
[] execVM "scripts\IgiLoad\IgiLoadInit.sqf"; // ADAC HEMMT

if(isDedicated && isNil("life_market_prices")) then
{
	[] call life_fnc_marketconfiguration;
	diag_log "Marktpreise erstellt!";
	
	"life_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Marktpreis aktualisiert! %1", _this select 1];
	};

	[] execFSM "core\fsm\server.fsm";
	diag_log "Server FSM executed";
};
/*
if (thirdPartyScripts) then {
[] execVM "a3m\scripts\thirdParty.sqf";
};

if (isDedicated) then {
	null = [5, "scripts"] execVM "scripts\helipad_lights\helipad_light_auto.sqf";	
};
*/
StartProgress = true;
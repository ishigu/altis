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

life_versionInfo = "Altis Life RPG v3.1.4.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

call compile preprocessFile "UI\HUD.sqf";
[] spawn ICE_HUD;
[] execVM "scripts\IgiLoad\IgiLoadInit.sqf"; // ADAC HEMMT
if(isServer && isNil("life_market_prices")) then
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
*/
if (isServer) then {
	null = [5, "scripts"] execVM "scripts\helipad_lights\helipad_light_auto.sqf";	
};

[] execVM "scripts\zlt_fastrope.sqf";
[] execVM "scripts\stopsidechat.sqf";
[] execVM "scripts\D41_wetter.sqf";
[] execVM "scripts\KK_paraDrop.sqf";
StartProgress = true;
west setFriend [east, 1]; 
east setFriend [west, 1];
independent setFriend [east, 1];
east setFriend [independent, 1];

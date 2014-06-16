enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
/*
if(isNull player) then 
{
	if(!X_JIP && !isServer) then
	{
		[] spawn (compile PreprocessFileLineNumbers "core\jip.sqf");
	};
	X_JIP = true;
};
*/
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.3";
/*
if(X_Client) then
{
	[] execVM "core\init.sqf";
};
*/
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
if(isDedicated && isNil("life_market_prices")) then
{
	[] call life_fnc_marketconfiguration;
	diag_log "Marktpreise erstellt!";
	
	"life_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Marktpreis aktualisiert! %1", _this select 1]
	;}
};
call compile preprocessFile "UI\HUD.sqf";

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



if (thirdPartyScripts) then {
[] execVM "a3m\scripts\thirdParty.sqf";
};


if (isServer) then {
null = [5, "scripts"] execVM "scripts\helipad_lights\helipad_light_auto.sqf";	
};

if(!StartProgress) then
{
	[8,true,true,12] execFSM "core\fsm\timeModule.fsm";
	//[8,true,false] execFSM "core\fsm\core_time.fsm";
};
StartProgress = true;
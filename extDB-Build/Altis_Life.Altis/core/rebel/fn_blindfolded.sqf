/*
	File: fn_blindfolded.sqf
	Author: Shentoza
	Description: Blindfolds you
*/
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _player) exitWith {};

"DynamicBlur" ppEffectAdjust [7];
"DynamicBlur" ppEffectCommit 2;
"DynamicBlur" ppEffectEnable true;
"ColorCorrections" ppEffectAdjust [1,.30,0,[0,0,0,0],[1,1,1,1],[1,1,1,1]];
"ColorCorrections" ppEffectCommit 2;
"ColorCorrections" ppEffectEnable true;
titleText[localize "STR_Reb_BlindfoldedPerson","PLAIN"];
_blocker = (findDisplay 46) displayAddEventHandler ["KeyDown", "if((_this select 1) == 1) then {true}"]; // Disable ESC, so you can't remove the black screen
_oldGroup = group player;
[player] joinSilent grpNull;
showMap false;
showGPS false;
showCompass false;
if(player getVariable ["adminBlindfold",false]) then
{
	waitUntil
	{
		(!(player getVariable ["blindfolded",false]))
	};
}else{
	waitUntil
	{
		((!(player getVariable["blindfolded",true])) || (player distance _player > 15) || (!(player getVariable["restrained",true])) )
	};
};

if(player getVariable ["blindfolded",true]) then
	{player setVariable["blindfolded",false,true];};
	
if(player getVariable ["adminBlindfold",true]) then
	{player setVariable ["adminBlindfold",nil,true];};
	
(findDisplay 46) displayRemoveEventHandler["KeyDown",_blocker];
"DynamicBlur" ppEffectAdjust [0];
"DynamicBlur" ppEffectCommit 2;
"ColorCorrections" ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[1,1,1,1]];
"ColorCorrections" ppEffectCommit 2;
[player] joinSilent _oldGroup;
showMap true;
showGPS true;
showCompass true;
titleText["","PLAIN"];
sleep 2;
"DynamicBlur" ppEffectEnable false;
"ColorCorrections" ppEffectEnable true;
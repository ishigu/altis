/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};

player setVariable["knockedout",true,true];
titleText[format[localize "STR_Civ_KnockedOut"],"BLACK"];
_blocker = (findDisplay 46) displayAddEventHandler ["KeyDown", "if((_this select 1) == 1) then {true}"]; // Disable ESC, so you can't remove the black screen
"radialBlur" ppEffectEnable true;
"radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
"radialBlur" ppEffectCommit 1;
1 fadeSound 0;
1 fadeSpeech 0;
1 fadeRadio 0;
player playMoveNow "Incapacitated";
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
sleep 10;
titleFadeOut 10;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 10;
10 fadeSound 1;
10 fadeSpeech 1;
10 fadeRadio 1;
sleep 5;
[] spawn {
	sleep 5;
	"radialBlur" ppEffectEnable false;
};
player playMoveNow "amovppnemstpsraswrfldnon";
(findDisplay 46) displayRemoveEventHandler["KeyDown",_blocker];
detach player;
deleteVehicle _obj;
player setVariable["robbed",FALSE,TRUE];
player setVariable["knockedout",false,true];
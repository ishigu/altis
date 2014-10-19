/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
life_pInact_curTarget = _curTarget;
_buttonArray = [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn5,_Btn6,_Btn7];
_select = 0;
{_x ctrlShow false;}forEach _buttonArray;

//Set Unrestrain Button
if(_curTarget getVariable ["restrained",false] && (!(_curTarget getVariable ["rebelRestrain",false])) then {
	(_buttonArray select _select) ctrlSetText localize "STR_pInAct_Unrestrain";
	(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
	(_buttonArray select _select) ctrlShow true;
	_select = _select +1;

//Set Check Licenses Button
	(_buttonArray select _select) ctrlSetText localize "STR_pInAct_checkLicenses";
	(_buttonArray select _select) buttonSetAction "[[player],""life_fnc_licenseCheck"",life_pInact_curTarget,FALSE] spawn life_fnc_MP";
	(_buttonArray select _select) ctrlShow true;
	_select = _select +1;

//Set Search Button
	(_buttonArray select _select) ctrlSetText localize "STR_pInAct_SearchPlayer";
	(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";
	(_buttonArray select _select) ctrlShow true;
	_select = _select +1;

//Set Escort Button
	if((_curTarget getVariable["Escorting",false])) then {
		(_buttonArray select _select) ctrlSetText localize "STR_pInAct_StopEscort";
		(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_copInteractionMenu;";
		(_buttonArray select _select) ctrlShow true;
		_select = _select +1;
	} else {
		(_buttonArray select _select) ctrlSetText localize "STR_pInAct_Escort";
		(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
		(_buttonArray select _select) ctrlShow true;
		_select = _select +1;
	};

//Set Ticket Button
	(_buttonArray select _select) ctrlSetText localize "STR_pInAct_TicketBtn";
	(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";
	(_buttonArray select _select) ctrlShow true;
	_select = _select +1;

	(_buttonArray select _select) ctrlSetText localize "STR_pInAct_Arrest";
	(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_arrestAction;";
	(_buttonArray select _select) ctrlShow true;
//Check that you are near a place to jail them.
	if(!((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_5") < 30))) then 
	{
		(_buttonArray select _select) ctrlEnable false;
	};
	_select = _select +1;

	(_buttonArray select _select) ctrlSetText localize "STR_pInAct_PutInCar";
	(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";
	(_buttonArray select _select) ctrlShow true;
	_select = _select +1;
};
//Tied by rebels -> so you have to free them, not ticket them or stuff.
if(_curTarget getVariable ["restrained",false] && _curTarget getVariable ["rebelRestrain",false]) then {

	(_buttonArray select _select) ctrlSetText localize "STR_pInAct_Unrestrain";
	(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrainRebel; closeDialog 0;";
	(_buttonArray select _select) ctrlShow true;
	_select = _select +1;
	
	//Set Escort Button
	if((_curTarget getVariable["Escorting",false])) then {
		(_buttonArray select _select) ctrlSetText localize "STR_pInAct_StopEscort";
		(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscortingRebel; [life_pInact_curTarget] call life_fnc_copInteractionMenu;";
		(_buttonArray select _select) ctrlShow true;
		_select = _select +1;
	} else {
		(_buttonArray select _select) ctrlSetText localize "STR_pInAct_Escort";
		(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_escortActionRebel; closeDialog 0;";
		(_buttonArray select _select) ctrlShow true;
		_select = _select +1;
	};
};

if(life_pInact_curTarget getVariable["blindfolded",false]) then {
	(_buttonArray select _select) ctrlSetText localize "STR_pAct_UnBlindfold";
	(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_removeBlindfold;";
	(_buttonArray select _select) ctrlShow true;
	_select = _select +1;
};
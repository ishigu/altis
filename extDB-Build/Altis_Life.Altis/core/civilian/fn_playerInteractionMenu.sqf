/*
	File: fn_playerInteractionMenu.sqf
	Author: ishi
	Edited: Shentoza
	
	Description:
	Player actions
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
_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;

if (life_pInact_curTarget getVariable["knockedout",false]) then {
	(_buttonArray select _select) ctrlSetText localize "STR_pAct_SmartphoneSteal";
	(_buttonArray select _select) buttonSetAction "[] call life_fnc_stealPhoneAction;";
	(_buttonArray select _select) ctrlShow true;
	_select = _select +1;
};

if(life_pInact_curTarget getVariable["rebelRestrain",false] && playerSide == east) then {
	if(!(life_pInact_curTarget getVariable["blindfolded",false])) then {
		(_buttonArray select _select) ctrlSetText localize "STR_pAct_Blindfold";
		(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_blindfold;";
		(_buttonArray select _select) ctrlShow true;
		_select = _select +1;
	}else{
		(_buttonArray select _select) ctrlSetText localize "STR_pAct_UnBlindfold";
		(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_removeBlindfold;";
		(_buttonArray select _select) ctrlShow true;
		_select = _select +1;
	};
	(_buttonArray select _select) ctrlSetText localize "STR_pInAct_PutInCar";
	(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";
	(_buttonArray select _select) ctrlShow true;
	_select = _select +1;
	
	if((life_pInact_curTarget getVariable["Escorting",false])) then {
	(_buttonArray select _select) ctrlSetText localize "STR_pInAct_StopEscort";
	(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscortingRebel; [life_pInact_curTarget] call life_fnc_playerInteractionMenu;";
	(_buttonArray select _select) ctrlShow true;
	_select = _select +1;
	} else {
		if(!(life_pInact_curTarget getVariable["Escorting",false])) then {
			(_buttonArray select _select) ctrlSetText localize "STR_pInAct_Escort";
			(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_escortActionRebel; closeDialog 0;";
			(_buttonArray select _select) ctrlShow true;
			_select = _select +1;
		};
	};
}else
{
	if(life_pInact_curTarget getVariable["blindfolded",false]) then {
		(_buttonArray select _select) ctrlSetText localize "STR_pAct_UnBlindfold";
		(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_removeBlindfold;";
		(_buttonArray select _select) ctrlShow true;
		_select = _select +1;
	};
};

if(life_pInact_curTarget getVariable["rebelRestrain",false]) then {
	(_buttonArray select _select) ctrlSetText localize "STR_pInAct_Unrestrain";
	(_buttonArray select _select) buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrainRebel; closeDialog 0;";
	(_buttonArray select _select) ctrlShow true;
	_select = _select +1;
};
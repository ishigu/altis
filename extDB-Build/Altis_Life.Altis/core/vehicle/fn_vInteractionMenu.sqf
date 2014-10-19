/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_BtnArray = [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7];
_select = 0;
life_vInact_curTarget = _curTarget;

//Set Repair Action
(_BtnArray select _select) ctrlSetText localize "STR_vInAct_Repair";
(_BtnArray select _select) buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";

if("ToolKit" in (items player) || (player call life_fnc_isADAC) ) then {(_BtnArray select _select) ctrlEnable true;} else {(_BtnArray select _select) ctrlEnable false;};
_select = _select +1;

_Btn2 ctrlShow false; 
_Btn3 ctrlShow false; 
_Btn4 ctrlShow false; 
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;

if(playerSide == west) then {
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_Registration";
	(_BtnArray select _select) buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
	(_BtnArray select _select) ctrlShow true;
	_select = _select +1;
	
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_SearchVehicle";
	(_BtnArray select _select) buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehInvSearch;";
	(_BtnArray select _select) ctrlShow true;
	_select = _select +1;
	
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_PullOut";
	(_BtnArray select _select) buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
	(_BtnArray select _select) ctrlShow true;
	if(count crew _curTarget == 0) then {(_BtnArray select _select) ctrlEnable false;};
	_select = _select +1;
	
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_Impound";
	(_BtnArray select _select) buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
	(_BtnArray select _select) ctrlShow true;
	_select = _select +1;
	
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_ImpoundPlus";
	(_BtnArray select _select) buttonSetAction "closeDialog 0; [life_vInact_curTarget] spawn life_fnc_impoundPlusAction;";
	(_BtnArray select _select) ctrlShow true;
	_select = _select +1;
};

if (player call life_fnc_isADAC) then {
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_Unflip";
	(_BtnArray select _select) buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
	if(count crew _curTarget == 0 && {canMove _curTarget}) then { (_BtnArray select _select) ctrlEnable false;} else {(_BtnArray select _select) ctrlEnable true;};
	(_BtnArray select _select) ctrlShow true;
	_select = _select +1;
				
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_Impound";
	(_BtnArray select _select) buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";
	(_BtnArray select _select) ctrlShow true;
	_select = _select +1;
				
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_Repaint";
	(_BtnArray select _select) buttonSetAction "closeDialog 0; [] spawn life_fnc_adacRepaintMenu;";
	(_BtnArray select _select) ctrlShow true;
	_select = _select +1;
};

if(playerSide == east) then {
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_PullOut";
	(_BtnArray select _select) buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutActionRebel;";
	(_BtnArray select _select) ctrlShow true;
	if((count crew _curTarget == 0) || (locked _curTarget == 2)) then {(_BtnArray select _select) ctrlEnable false;};
	_select = _select +1;
};

if(_curTarget isKindOf "Ship") then {
	(_BtnArray select _select) ctrlShow true;
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_PushBoat";
	(_BtnArray select _select) buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
	if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { (_BtnArray select _select) ctrlEnable true;} else {(_BtnArray select _select) ctrlEnable false};
	(_BtnArray select _select) ctrlShow true;
	_select = _select +1;
};
	
if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
	(_BtnArray select _select) ctrlShow true;
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_GetInKart";
	(_BtnArray select _select) buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
	if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {(_BtnArray select _select) ctrlEnable true;} else {(_BtnArray select _select) ctrlEnable false};
	(_BtnArray select _select) ctrlShow true;
	_select = _select +1;
};
	
if(typeOf _curTarget == "O_Truck_03_device_F" && (_curTarget in life_vehicles)) then {
	(_BtnArray select _select) ctrlShow true;
	(_BtnArray select _select) ctrlSetText localize "STR_vInAct_DeviceMine";
	(_BtnArray select _select) buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
	if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
		(_BtnArray select _select) ctrlEnable false;
	} else {
		(_BtnArray select _select) ctrlEnable true;
	};
	_select = _select +1;
};
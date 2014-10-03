/*
	File: fn_openSmartphone.sqf
	Author: ishi
	
	Description:
	Opens the smartphone
*/
if(life_inv_smartphone < 1) exitWith {hint localize "STR_NOTF_SmartphoneNoItem"};
createDialog "Life_my_smartphone";
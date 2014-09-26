#include <macro.h>
/*
	
	file: fn_newMsg.sqf
	Author: Silex
	
*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Nachricht an: %1",name life_smartphoneTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[88885, true];};
		[[life_smartphoneTarget,_msg,player,0],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Du hast %1 folgende Nachricht gesendet: %2",name life_smartphoneTarget,_msg];	
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Die Polizei ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[888895,true];};
		[[ObjNull,_msg,player,1],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "der Polizei";
		hint format["Du hast %1 folgende Nachricht gesendet: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[888896,true];};
		[[ObjNull,_msg,player,2],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "den Admins";
		hint format["Du hast %1 folgende Nachricht gesendet: %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if((call life_fnc_countMedic) == 0) exitWith {hint format["Zurzeit ist kein Arzt im Dienst. Bitte probiere es später nochmal."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";ctrlShow[888899,true];};
		//[[ObjNull,_msg,player,3],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		[[player,_msg,false],"life_fnc_medicRequestRecieve",true,false] spawn life_fnc_MP;
		hint format["Du hast einen Notruf abgesetzt!",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Keine Person ausgewählt!"];};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";};
		[[life_smartphoneTarget,_msg,player,4],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Adminnacht an: %1 - Text: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading + Lottery loading
	case 6:
	{
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			//ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			//ctrlShow[888896,false];
		};
		if(life_bet_done) then
		{
			ctrlShow[888795,false];
		} else {
			ctrlShow[888795,true];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";};
		[[ObjNull,_msg,player,5],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Globale Admin Nachricht gesendet: %1",_msg];
		closeDialog 887890;
	};
	//ADAC Request
	case 8:
	{
		if((call life_fnc_countADAC) == 0) exitWith {hint format["Der ADAC ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal."];};
		if(_msg == "") exitWith {hint "Du musst eine Nachricht eingeben!";};
		[[player,_msg],"life_fnc_notifyADAC",true,false] spawn life_fnc_MP;
		//[[ObjNull,_msg,player,6],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		hint "Du hast eine Nachricht an den ADAC geschickt!";
		closeDialog 887890;
	};
};
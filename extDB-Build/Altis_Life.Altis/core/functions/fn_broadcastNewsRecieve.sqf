/*
File: fn_broadcastNewsRecieve.sqf
Author: Shentoza
*/
if(isDedicated) exitWith {};
_from = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_msg = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _from || _msg == "") exitWith {};
_from = _from getVariable ["realname",name _from];
["NewsBroadcast",[format["Neue Übertragung von:",_from]]] call bis_fnc_showNotification;
_message = format[">>>Übertragung von %1 : %2",_from,_msg];
systemChat _message;
hint parseText format["<t color='#B43104'><t size='2'><t align='center'>Channel 7 News<br/><t align='left'><t size='1'><t color='#B43104'>Neue Übertragung von: <t color='#ffffff'><t align ='center'>%1<br/><t align ='left'><t color='#B43104'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
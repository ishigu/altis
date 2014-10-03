/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if([false,"smartphone",1] call life_fnc_handleInv) then
{
	hint format[localize "STR_NOTF_SmartphoneStolen",_robber getVariable["realname",name _robber]];

	//[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211B",life_cash,profileName],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[1,format[localize "STR_NOTF_SmartphoneSteal",profileName]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
}
else
{
	[[2,format[localize "STR_NOTF_SmartphoneHasNoItem",profileName]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
};
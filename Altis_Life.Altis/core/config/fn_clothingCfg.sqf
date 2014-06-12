/*
	File: fn_clothingCfg.sqf
	Author: Gabax
	
	Description:
	Master configuration for clothingskins.
*/
private["_filter"];
_filter = [_this,0,"",[""]] call BIS_fnc_param;
if(_filter == "") exitWith {[]};

switch (_filter) do
{
	case "U_Rangemaster":
	{
		player setobjecttexture [0,"textures\character\Rekruten.paa"];
	};
};

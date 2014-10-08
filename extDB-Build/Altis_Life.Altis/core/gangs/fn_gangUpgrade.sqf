#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Determinds the upgrade price and blah
*/
private["_maxMembers","_slotUpgrade","_upgradePrice","_expo"];
_maxMembers = grpPlayer getVariable ["gang_maxMembers",3];
_slotUpgrade = _maxMembers + 1;
_expo = _maxMembers - 3;
_upgradePrice = (__GETC__(life_gangUpgradeBase));
for [{_i = 0}, {_i < _expo}, {_i = _i + 1}] do
{
	_upgradePrice = _upgradePrice * (__GETC__(life_gangUpgradeMultipler));
};
if (_upgradePrice > (__GETC__(life_gangUpgradeLimit))) then { _upgradePrice = (__GETC__(life_gangUpgradeLimit)); };

_action = [
	format[(localize "STR_GNOTF_MaxMemberMSG")+ "<br/><br/>" +(localize "STR_GNOTF_CurrentMax")+ "<br/>" +(localize "STR_GNOTF_UpgradeMax")+ "<br/>" +(localize "STR_GNOTF_Price")+ " <t color='#8cff9b'>$%3</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText],
	localize "STR_Gang_UpgradeMax",
	localize "STR_Global_Buy",
	localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_atmcash < _upgradePrice) exitWith {
		hint parseText format[
			(localize "STR_GNOTF_NotEoughMoney_2")+ "<br/><br/>" +(localize "STR_GNOTF_Current")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_GNOTF_Lacking")+ " <t color='#FF0000'>$%2</t>",
			[life_atmcash] call life_fnc_numberText,
			[_upgradePrice - life_atmcash] call life_fnc_numberText
		];
	};
	__SUB__(life_atmcash,_upgradePrice);
	grpPlayer setVariable["gang_maxMembers",_slotUpgrade,true];
	hint parseText format[localize "STR_GNOTF_UpgradeSuccess",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText];
	[[2,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	[[getPlayerUID player,playerSide,life_atmcash,1],"DB_fnc_updatePartial",false,false] spawn life_fnc_MP;
} else {
	hint localize "STR_GNOTF_UpgradeCancel";
};
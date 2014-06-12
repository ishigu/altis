/// run third party external scripts //

If (fastRoping) then {
_handle = execVM "addons\=BTC=_Logistic\=BTC=_logistic_Init.sqf";
waitUntil {ScriptDone _handle};
};

if (doors) then {
_handle = execVM "addons\doors\addaction.sqf";
waitUntil {ScriptDone _handle};
};

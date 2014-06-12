waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in ["76561197989320695", "76561198068609909", "76561198076320576", "76561197985341100", "76561197988496339", "76561198118515568", "76561198011512873"]) then {
;
act = player addaction [("<t color=""#0074E8"">" + ("Tools Menu") +"</t>"),"fusionsmenu\admin\tools.sqf","",5,false,true,"",""];

};
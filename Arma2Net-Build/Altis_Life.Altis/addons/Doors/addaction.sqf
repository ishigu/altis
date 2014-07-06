	if ((typeOf vehicle player) in [
	"B_Heli_Light_01_F",
	"B_Heli_Light_01_armed_F",
	"O_Heli_Light_02_F",
	"O_Heli_Light_02_unarmed_F",
	"B_Heli_Attack_01_F",
	"O_Heli_Attack_02_F",
	"O_Heli_Attack_02_black_F",
	"B_Heli_Transport_01_F",
	"B_Heli_Transport_01_camo_F",
	"I_Heli_Transport_02_F",
	"I_Heli_light_03_F",
	"I_Heli_light_03_unarmed_F"
	]) then
	{

_heli = _this select 0; 

_heli addAction ["<t color='#CFCFCF'>Open Doors</t>", "Doors.sqf",1,6,false,true,"","(_target  

animationPhase 'Door_R' == 0) && (_target animationPhase 'Door_L' == 0)"];  

_heli addAction ["<t color='#CFCFCF'>Close Doors</t>", "Doors.sqf",0,6,false,true,"","(_target  

animationPhase 'Door_R' == 1) && (_target animationPhase 'Door_L' == 1)"]; 

sleep 1;
}
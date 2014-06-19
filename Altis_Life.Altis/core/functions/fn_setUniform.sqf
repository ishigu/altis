private["_path","_unit","_type"];
_unit = [_this,0] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;

//Cops
if(playerSide == west) then {
	switch(_type) do {
		case "U_Rangemaster" : {
			_path = "textures\uniform\police_shirt.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "V_TacVest_blk" : { //Polizei Weste
			_path = "textures\uniform\police_vest.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		
		case "U_B_CombatUniform_mcam" : { //GSG9 Uniform
			_path = "textures\uniform\swat_shirt.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		
		case "H_HelmetB_plain_mcamo" : { //GSG9 Helm
			_path = "textures\uniform\swat_helmet.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		
		case "V_PlateCarrier1_blk" : { //GSG9 Weste
			_path = "textures\uniform\swat_s_vest.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		
		case "H_Cap_tan_specops_US" : { //Polizei Muetze
			_path = "textures\uniform\swat_s_cap.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	
	// Hide backpack
	//(unitBackpack player) setObjectTextureGlobal [0, ""];
};

//Medics
if(life_independent_group == "medic") then {
	switch(_type) do {
		case "U_I_CombatUniform" : {
			_path = "textures\saniuniform.jpg";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	if((backpack _unit) == "B_Kitbag_cbr") then {
		(unitBackpack _unit) setObjectTextureGlobal [0, "textures\med_rucksack.jpg"];
	};
};

//ADAC
if(life_independent_group = "adac") then {
	switch(_type) do {
		case "U_I_CombatUniform" : {
			_path = "textures\ADAC.jpg";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	//if((backpack _unit) == "B_Kitbag_cbr") then {
	//	(unitBackpack _unit) setObjectTextureGlobal [0, "textures\xxx.jpg"];
	//};
};


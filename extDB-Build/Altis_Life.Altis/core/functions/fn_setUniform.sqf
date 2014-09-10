private["_path","_unit","_type"];
_unit = [_this,0] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;

//Cops
if(playerSide == west) then {
	switch(_type) do {
		case "U_Rangemaster" : {
			_path = "textures\uniform\polizei_rang1.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		case "V_TacVest_blk" : { //Polizei Weste
			_path = "textures\uniform\police_vest.jpg";
			_unit setObjectTextureGlobal [0,_path];
		};
		
		case "U_B_CombatUniform_mcam" : { 
			_path = "textures\uniform\polizei_rang3.paa";
			if (license_cop_dea) then { _path = "textures\uniform\polizei_dea.paa"; };
			_unit setObjectTextureGlobal [0,_path];
		};
		
		case "H_Cap_tan_specops_US" : { //Polizei Muetze
			_path = "textures\uniform\swat_s_cap.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
		
		case "V_PlateCarrier1_blk" :{
			_path = "textures\uniform\swat_s_vest.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	
	// Hide backpack
	//(unitBackpack player) setObjectTextureGlobal [0, ""];
};

//Medics
if((player call life_fnc_isMedic)) then {
	switch(_type) do {
		case "U_I_CombatUniform" : {
			_path = "textures\uniform\medic.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	if((backpack _unit) == "B_Kitbag_cbr") then {
		(unitBackpack _unit) setObjectTextureGlobal [0, "textures\medic_backpack.paa"];
	};
};

//ADAC
if(!(player call life_fnc_isMedic) && (playerSide == independent)) then {
	switch(_type) do {
		case "U_I_CombatUniform" : {
			_path = "textures\uniform\adac.paa";
			_unit setObjectTextureGlobal [0,_path];
		};
	};
	if((backpack _unit) == "B_Kitbag_cbr") then {
		(unitBackpack _unit) setObjectTextureGlobal [0, "textures\adac_backpack.paa"];
	};
};


/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
			
	["apple", 45, 35, 60, 1, 1, 
		[ 
			
			["peach",1]
		] 
	],
	
	["peach", 60, 50, 75, 1, 1, 
		[ 
			["apple",1] 
		] 
	],
	
	["benzin", 2000, 1000, 3000, 5, 1, 
		[ 
			["diamondc",1],
			["chemical",1],
			["oilp",0],
			["iron_r",1],
			["copper_r",1],
			["cement",1],
			["glass",1] 
		] 
	],
		
	["chemical", 1000, 500, 1750, 10, 5, 
		[ 
			["benzin",0],
			["medical",0],
			["oilp",0],
			["diamondc",0], 
			["iron_r",0],
			["copper_r",0],
			["salt_r",0],
			["cement",0],
			["glass",0] 
		] 
	],
	
	["medical", 3900, 1000, 4900, 6, 1, 
		[ 
			["diamondc",1], 
			["benzin",0],
			["chemical",1],
			["oilp",0],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1] 
		] 
	],
	
	["oilp", 1950, 500, 2950, 5, 1, 
		[ 
			["diamondc",1], 
			["benzin",0],
			["chemical",0],
			["medical",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1] 
		] 
	],
	
	["iron_r", 2400, 1500, 3600, 4, 1,  
		[ 
			["diamondc",1], 
			["benzin",1],
			["chemical",1],
			["medical",1],
			["oilp",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1] 
		] 
	],
	
	["diamondc", 2500, 700, 4000, 4, 1, 
		[ 
			["oilp",1],
			["benzin",1],
			["chemical",1],
			["medical",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1] 
		] 
	],
	
	["copper_r", 800, 300, 1550, 4, 1, 
		[ 
			["diamondc",1], 
			["benzin",1],
			["chemical",1],
			["medical",1],
			["oilp",1],
			["iron_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1] 
		] 
	],
	
	["salt_r", 1750, 500, 2750, 6, 1, 
		[ 
			["diamondc",1], 
			["benzin",1],
			["chemical",1],
			["medical",1],
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["cement",1],
			["glass",1] 
		] 
	],
	
	["glass", 1000, 500, 1800, 5, 1, 
		[ 
			["diamondc",1], 
			["benzin",1],
			["chemical",1],
			["medical",1],
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1]
		] 
	],
	
	["cement", 1000, 500, 1800, 4, 1, 
		[ 
			["diamondc",1], 
			["benzin",1],
			["chemical",1],
			["medical",1],
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1]
		] 
	],
	
	///////////////////////////////////
	
	["turtle", 9000, 5000, 15000, 40, 1,  
		[ 
			["marijuana",1], 
			["cocainep",1],
			["heroinp",1],
			["meth",0]
		] 
	],
	
	["marijuana", 2250, 1500, 3000, 10, 1,   
		[ 
			["turtle",1], 
			["cocainep",1],
			["heroinp",1],
			["meth",1]
		] 
	],
	
	["cocainep", 3500, 2000, 4500, 8, 1,   
		[ 
			["marijuana",1], 
			["turtle",1],
			["heroinp",1],
			["meth",1]
		] 
	],
	
	["heroinp", 2850, 1500, 3600, 10, 1,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["turtle",1],
			["meth",1]
		] 
	],
	
	["meth", 6000, 2000, 9500, 16, 1,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["turtle",0]
		] 
	]
	
];
publicVariable "life_market_resources";

////////////GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
//publicVariable "life_market_clampprices";

////////////SYNC PRICES WITH SERVER IF EMPTY
//if(isNil("life_market_prices")) then
//{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	systemChat "Market Prices Generated!";
//};
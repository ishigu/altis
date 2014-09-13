/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, DEFAULT-WERT, MIN-WERT, MAX-WERT, VERÄNDERUNG BEI AKTION [VERKAUF Multipliziert mit 1, Kauf multipliziert um -1
	//["gold", 1500, 450, 2300, 8, 5],
			
	["apple", 45, 35, 75, 0.6, 0.6, 
		[ 
			["peach",1]
		] 
	],
	
	["peach", 60, 50, 90, 0.6, 0.6, 
		[ 
			["apple",1] 
		] 
	],
	
	["benzin", 2000, 1000, 3000, 2, 1, 
		[ 
			["diamondc",2],
			["chemical",1],
			["oilp",0],
			["iron_r",2],
			["copper_r",2],
			["cement",2],
			["glass",2] 
		] 
	],
		
	["chemical", 1000, 500, 1750, 1, 5, 
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
	
	["medical", 3900, 1000, 4900, 2, 1, 
		[ 
			["diamondc",2], 
			["benzin",1],
			["chemical",1],
			["oilp",1],
			["iron_r",2],
			["copper_r",2],
			["salt_r",2],
			["cement",3],
			["glass",3] 
		] 
	],
	
	["oilp", 1950, 500, 2950, 2, 1, 
		[ 
			["diamondc",1], 
			["benzin",0],
			["chemical",0],
			["medical",1],
			["iron_r",1],
			["copper_r",2],
			["salt_r",2],
			["cement",3],
			["glass",3] 
		] 
	],
	
	["iron_r", 2400, 1500, 3600, 2, 1,  
		[ 
			["diamondc",2], 
			["benzin",2],
			["chemical",1],
			["medical",2],
			["oilp",2],
			["copper_r",2],
			["salt_r",2],
			["cement",3],
			["glass",3] 
		] 
	],
	
	["diamondc", 2500, 700, 4000, 2, 1, 
		[ 
			["oilp",2],
			["benzin",2],
			["chemical",1],
			["medical",2],
			["iron_r",2],
			["copper_r",2],
			["salt_r",2],
			["cement",3],
			["glass",3] 
		] 
	],
	
	["copper_r", 800, 300, 1850, 2, 1, 
		[ 
			["diamondc",2], 
			["benzin",4],
			["chemical",1],
			["medical",1],
			["oilp",2],
			["iron_r",2],
			["salt_r",2],
			["cement",3],
			["glass",3] 
		] 
	],
	
	["salt_r", 1750, 500, 2950, 2, 1, 
		[ 
			["diamondc",2], 
			["benzin",2],
			["chemical",2],
			["medical",2],
			["oilp",2],
			["iron_r",2],
			["copper_r",2],
			["cement",3],
			["glass",3] 
		] 
	],
	
	["glass", 1000, 500, 2300, 1, 1, 
		[ 
			["diamondc",2], 
			["benzin",2],
			["chemical",2],
			["medical",2],
			["oilp",2],
			["iron_r",2],
			["copper_r",2],
			["salt_r",2],
			["cement",2]
		] 
	],
	
	["cement", 1000, 500, 2250, 1, 1, 
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
	
	["turtle", 9000, 5000, 15000, 10, 1,  
		[ 
			["marijuana",3], 
			["cocainep",3],
			["heroinp",3],
			["meth",3]
		] 
	],
	
	["marijuana", 2250, 1500, 3250, 3, 1,   
		[ 
			["turtle",3], 
			["cocainep",3],
			["heroinp",3],
			["meth",3]
		] 
	],
	
	["cocainep", 3500, 2000, 4800, 3, 1,   
		[ 
			["marijuana",3], 
			["turtle",3],
			["heroinp",3],
			["meth",3]
		] 
	],
	
	["heroinp", 2850, 1500, 3900, 3, 1,   
		[ 
			["marijuana",3], 
			["cocainep",3],
			["turtle",3],
			["meth",3]
		] 
	],
	
	["meth", 6000, 2000, 9500, 4, 1,   
		[ 
			["marijuana",3], 
			["cocainep",3],
			["heroinp",3],
			["turtle",3]
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
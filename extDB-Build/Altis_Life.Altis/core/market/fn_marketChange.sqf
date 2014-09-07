/*

	Some random and dynamical stuff for market

*/

private["_rand","_modifier","_price", "_globalchange","_defaultprice","_shortname","_difference","_minprice","_maxprice"];

_rand = [0,160] call life_fnc_randomRound; //0-200

/*

	HINWEIS: obige Zahl in random erhöhen, um alle ereignisse seltener zu machen!
	
*/

diag_log "[MARKET] marketChange called.";

switch(true) do
{
	case (_rand <= 30): //30% default market change value (strong version)
	{
		{
			if(random(10) <= 4) then //Random for each resource
			{
				_modifier = [-20,20] call life_fnc_randomRound; //Verkaufte/Gekaufte Items

				
				if(_modifier < 0) then
				{
					[_x select 0, -(_modifier), true] call life_fnc_marketSell; 
				}
				else
				{
					[_x select 0, _modifier, true] call life_fnc_marketBuy; 
				};
			};
		}
		foreach life_market_prices;
	};
	case (_rand <= 36): //6% Drogenpreis erhöhen
	{
		[[0,"News: Interpol hat eine internationale Drogenbande ausgehoben!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		//Erhöhe Marktpreis mit marketSell
		["marijuana", [40,80] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["cocaine", [40,80] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["cocainep", [40,80] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["heroinu", [40,80] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["heroinp", [40,80] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["meth", [40,80] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		
		diag_log "+Market+ Event drugp";
	};
	case (_rand <= 44): //8% Ölpreis erhöhen
	{
		[[0,"News: Öltanker gesunken!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		["oilp", [60,100] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		
		diag_log "+Market+ Event oilp";
	};
	case (_rand <= 54): //10% Eisenpreis + zementpreis + glaspreis erhöhen
	{
		[[0,"News: China baut World-China-Center!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		["cement", [80,160] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["iron_r", [80,120] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["glass", [100,135] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		
		diag_log "+Market+ Event wcc";
	};
	/*case (_rand <= 60): //4% Goldpreis sinkt
	{
		[[0,"News: Anleger verlieren Vertrauen in Gold!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		["gold", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["goldr", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		
		diag_log "+Market+ Event goldm";
	};*/
	case (_rand <= 68): //8% Kupfer/Silber erhöht sich
	{
		[[0,"News: Elektronikindustrie benötigt Metalle!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		["copper_r", [60,120] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["iron_r", [60,120] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		diag_log "+Market+ Event copperp";
	};
	/*case (_rand <= 74): //6% Goldpreis erhöht sich
	{
		[[0,"News: Anleger verlieren Vertrauen in Dollar!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		["gold", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		["goldr", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy; 
		
		diag_log "+Market+ Event goldp";
	};*/
	case (_rand <= 80): //6% Drogenpreis niedriger
	{
		[[0,"News: Neue synthetische Droge überschwemmt Drogenmarkt!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		//Erhöhe Marktpreis mit marketSell
		["marijuana", [60,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["cocaine", [60,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["cocainep", [60,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["heroinu", [60,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["heroinp", [60,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		["meth", [60,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["turtle", [60,30] call life_fnc_randomRound, true] call life_fnc_marketSell; 
		
		diag_log "+Market+ Event drugm";
	};
	case (_rand <= 90): //10% Schildkröten höher
	{
		[[0,"News: China entdeckt Schildkröten als neue Medizin! Tierschützer sind besorgt!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		//Erhöhe Marktpreis mit marketSell
		["turtle", [30,80] call life_fnc_randomRound, true] call life_fnc_marketBuy; 	
		
		diag_log "+Market+ Event turtlep";
	};
	default //market change: default version
	{
		//diag_log format["[MARKET] marketChange did nothing. Rand=%1", _rand];
		{
			//Get default price
			_defaultprice = 0;
			_shortname = _x select 0;
			_price = _x select 1;
			_globalchange = _x select 2;
		
			{
				if((_x select 0) == _shortname) exitWith
				{
					_defaultprice = _x select 1;
					_minprice = _x select 2;
					_maxprice = _x select 3;
				};
			}
			foreach life_market_resources;
			
			if(_defaultprice > 0) then
			{
			
				//Get difference
				_difference = _defaultprice - _price; //Defaultprice - current price
			
				_modifier = _difference * (random 0.4);
				_modifier = round _modifier;
			
				//Protecting hard caps
				/*if( _modifier < -700) then {_modifier = -700;};
				if( _modifier > 700) then {_modifier = 700;};*/
			
				//_modifier = [-15,25] call life_fnc_randomRound; //Verkaufte/Gekaufte Items
				
				/*if(_modifier < 0) then
				{
					[_x select 0, -(_modifier), true] call life_fnc_marketSell; 
				}
				else
				{
					[_x select 0, _modifier, true] call life_fnc_marketBuy; 
				};*/
				
				//diag_log format["+Market+ Correcting market value of %1 from %2 to %3 by %4", _shortname, _price, (_price + _modifier), _modifier];
				
				_price = _price + _modifier;
				if(_price > _maxprice) then {_price = _maxprice;};
				if(_price < _minprice) then {_price = _minprice;};
				
				_globalchange = -(_defaultprice - _price); //_globalchange = _globalchange + _modifier;
				diag_log format["+Market+ TEST %1 oldprice:%2 newprice:%3 globalchange:%4 locchange:%5", _shortname, (_price - _modifier), _price, _globalchange, -(_modifier)];
				//New price arr
				life_market_prices set [_forEachIndex, [_shortname, _price,_globalchange,-(_modifier)] ]; //set raw values
			
			}
			else
			{
				diag_log format["+Market+ Cannot correct market value of %1", _shortname];
			};
		}
		foreach life_market_prices;
	};
};

publicVariable "life_market_prices";
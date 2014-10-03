waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["Team","Team"];
player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["Serverregeln","Serverregeln"];
player createDiarySubject ["Sicherheitszonen","Sicherheitszonen"];
//player createDiarySubject ["civrules","Civilian Rules"];
player createDiarySubject ["illegalitems","Illegal Sachen"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
player createDiarySubject ["Steuerung","Steuerung"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord["changelog",
		[
			"Official Change Log",
				"
					Der Offiziele Change Log ist im Forum einzusehen.
				"
		]
	];

	player createDiaryRecord ["Serverregeln",
		[
			"Regelwerk", 
				"
					Das Regelwerk ist im Forum untergebracht.<br/>
					Bitte lies dir die Regeln durch, denn Unwissenheit schützt vor Strafe nicht!<br/><br/>
					<br/><br/>
					www.Westerland-Altis.de
				"
		]
	];
	
	player createDiaryRecord["Sicherheitszonen",
		[
			"Sicherheitszonen",
				"
					Sicherheit bedeutet kein Toeten oder Verbrechen. Falls ihr innerhalb einer Sicherheitszone Verbrechen begeht, werdet ihr einmalig als Vorwarnung gekickt. Nach wiederholtem Verbrechen gibt es einen Ban.<br/><br/>

					Liste der Sicherheitszonen in einem Umfang von 100 Metern:<br/><br/>
					Alle Geschaefte<br/><br/>
					Garagen<br/><br/>
					Bankautomat<br/><br/>
					Sollte eine Fluechtige Person in eine Sicherheitszone fluechten, so gilt das nicht als rp und darf trzd ueberfallen werden.<br/><br/>
					Rebellenaussenposten: Polizisten duerfen die Rebellencamps nur raiden, wenn sie zu Viert sind und einen hochrangigen Polizisten dabei haben.<br/><br/>
					Bans fuer strafbare Handlungen<br/><br/>
				"
		]
	];	

	player createDiaryRecord ["Team",
		[
			"Teamspeak",
				"
				 ts.westerland-altis.de<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["Team",
		[
			"Forums",
				"
				www.westerland-altis.de<br/>				
				"
		]
	];
	
	player createDiaryRecord ["Team",
		[
			"Team",
				"
				Projektleiter  Felix<br/><br/>
				Projektleiter Shentoza<br/><br/>
				Admin [BFC]graVediga<br/><br/>
				Admin ishi<br/><br/>
				Admin Elly<br/><br/>
				Admin K3V1N<br/><br/>
				Admin Harry Connor<br/><br/>
				Supporter BlackBlood<br/><br/>
				Supporter Hermann Staudinger<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["Team",
		[
			"Premium",
				"
				Premium Spieler haben besondere Gegenstaende zur Auswahl. Im Forum ist alles genau beschrieben.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["illegalitems",
		[
			"Liste illegaler Fahrzeuge",
				"
					1. Ifrit<br/><br/>		
					2. Offroad-HMG<br/><br/>
					3. Polizei-Fahrzeuge<br/><br/>				
				"
		]
	];
	
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Items",
				"
				Folgende Gegenstaende sind illegal und koennten euch bei der Polizei in Schwierigkeiten bringen:<br/><br/>
				1. Schildkroeten<br/>
				2. Meth<br/>
				3. Kokain / Kokablaetter<br/>
				4. Heroin / rohes Heroin<br/>
				5. Hanf / Marijuana<br/><br/>
				6. Sprengladung<br/><br/>
				7. Bolzenschneider<br/><br/>
				8. Goldbarren<br/><br/>
				9. Handschellen<br/><br/>
				"
		]
	];

	
// Controls Section

	player createDiaryRecord ["Steuerung",
		[
			"",
				"
				Z: Spieler Menue oeffnen<br/>
				I: Inventar<br/>
				U: Fahrzeug auf und abschliessen<br/>
				F: Polizei Sirene (Nur Polizisten)<br/>
				T: Kofferraum<br/>
				Q: Spitzhacke benutzen<br/>
				1: Wanted-Liste (Nur Polizisten)<br/>
				L: Radarmessung mit der Taser-Pistole (Nur Polizisten)<br/>
				Left Shift + R: Festnehmen (Nur Polizisten)<br/>
				Left Shift + L: Blaulicht (Nur Polizisten)<br/>
				Left Shift + G: Niederschlagen (Nur Zivilisten)<br/>
				Left Shift + V: Ergeben<br/>
				Left Shift + H: Waffe (ent-)holstern<br/>
				"
		]
	];
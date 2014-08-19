waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["Team","Team"];
player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["Serverregeln","Serverregeln"];
player createDiarySubject ["Polizeiregeln","Polizeiregeln"];
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
			"Exploits", 
				"
					Es gibt Ausnutzungsmoeglichkeiten, fuer die man ohne Vorwarnung gebannt wird. Das hier ist die einzige Warnung.<br/><br/>

					1. Durch Glitches aus dem Gefaengnis entkommen. Mit Hubschrauber fliehen ist erlaubt.<br/><br/>
					2. Selbstmord begehen um aus einem Rollenspiel herauszukommen, auch wenn man getasert, gefesselt, verhaftet wird oder im Gefaengnis sitzt. Wenn im Log steht, dass man nach einer Verhaftung gestorben ist, dann wird man gebant.<br/><br/>
					3. Verdoppeln von Gegenstaenden und/oder Geld. Falls euch jemand am Anfang des Spiels einen viel zu hohen Geldbetrag schickt, meldet es sofort einem Admin. Ihr sollt euch das Geld selbst erarbeiten. Wir sprechen nicht von kleinen Starthilfen fuer Freunde, Schulden oder Ueberweisungen innerhalb von Gangs.<br/><br/>
					4. Benutzen von gehackten Gegenstaenden. Ein Hacker kann im Spiel nicht integrierte Gegenstaende spawnen lassen. Falls ihr solche Sachen findet, meldet es und fasst sie nicht an.<br/><br/>
					5. Missbrauch von Bugs oder Spielmechaniken. Ist irgendwo eine Waffe, die sich dupliziert? Dann sagt den Admins bescheid. Falls euch ein Admin, beim Dupen erwischt, werdet ihr umgehend gebant.<br/><br/>
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
					
	
	player createDiaryRecord ["Serverregeln",
		[
			"Ban", 
				"
					Es gibt weder eine Verwarnung, noch einen Kick, nur einen Ban fuer folgende Aktivitaeten.<br/><br/>
					1. Hacken<br/><br/>
					2. Cheaten<br/><br/>
					3. Ausnutzung von Spielschwaeche (siehe erster Regelpunkt)<br/><br/>
					4. Umloggen um schnell von einer Stadt in eine andere zu kommen.<br/><br/>
					5. Nach 3 Kicks, die als Vorwarnung dienen sollten.<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["Serverregeln",
		[
			"Polizeiaktionen", 
				"
					Einmischung in Polizeiaktionen<br/><br/>

					Der Verstoss gegen die folgenden Punkte fuehrt zum Kick oder Ban, abhaengig von der Diskretion des zustaendigen Admins.<br/><br/>

					1. Zivilisten koennen fuers Oeffnen (Hereingucken) von Polizeirucksaecken/-fahrzeugen verhaftet werden. Konstante Wiederholung resultiert in einem Kick.<br/><br/>
					2. Zivilisten werden fuers dauerhafte Spionieren/Stalken oder Belaestigung von Polizisten verhaftet, da sie die Position weitergeben koennten. Da dies auch als Spammen angesehen werden kann, resultiert eine konstante Wiederholung in einem Kick.<br/><br/>
					3. Die Polizisten aktiv und dauernd davon abzuhalten ihrer Pflichten nachzugehen fuehrt zur Verhaftung. Konstante Wiederholung resultiert in einem Kick.<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["Serverregeln",
		[
			"Fahrzeuge", 
				"
					Das Verwenden von Fahrzeugen als Waffe ist verboten.
					Die Missachtung der Regeln in dieser Liste fuehrt zum Entfernen oder Ban des Spielers.
					Rebellen duerfen die Reifen bei einem Ueberfall auf Zivilisten zerschiessen.
					Rebellen und Polizisten duerfen sich gegenseitig abschießen im RP Umfang.
				"
		]
	];

	player createDiaryRecord ["Serverregeln",
		[
			"Boote", 
				"
					1. Absichtlich Taucher oder Schwimmer ueberfahren.<br/><br/>
					2. Stehlen von polizeilichen Schnellbooten um sie zu Crashen, zaehlt auch zu RDM.<br/><br/>
					3. Jegliches Glitchen mit Booten ist verboten.<br/><br/>

					Bei Wiederholungs Taetern erfolg BAN<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["Serverregeln",
		[
			"Fluggeraete", 
				"
					1. Hubschrauber mit Absicht kaputt machen oder etwas damit rammen.<br/><br/>
					2. In unter 150 Metern Hoehe dauerhaft ueber Staedten kreisen aufgrund von Behinderung der<br/><br/>
					   Akustik und der Gefahr in der Stadt zu Crashen.<br/><br/>
					3. Stehlen von Hubschraubern, ohne den Besitzern Zeit zu geben, diese abzuschliessen. Wenn jemand landet und einfach wegrennt, ohne abgeschlossen zu haben, ist der Diebstahl natuerlich erlaubt.<br/><br/>
					4. Das Landen auf Hubschrauberplatzen in den Hauptstaedten, muss bei der Polizei angemeldet werden und auf Rueckantwort gewartet werden. Sollte nach 5 Minuten keiner Antwort erfolgen, gilt die Landeerlaubnis als erteilt.<br/><br/>
					   
					   Bei Wiederholungs Taetern erfolg BAN<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["Serverregeln",
		[
			"Autos", 
				"
					1. Menschen duerfen nicht ueberfahren werden. Es gibt Unfaelle, trotzdem muessen sowohl Fussgaenger als auch Fahrer sich darum bemuehen, dass keine entstehen.<br/><br/>
					2. Sich absichtlich vor Fahrzeuge schmeissen um verletzt oder getoetet zu werden.<br/><br/>
					3. Rammen anderer Fahrzeuge. (Kann auch eine Explosion verursachen bei der beide Fahrzeuge komplett kaputt gehen.)<br/><br/>
					4. Bestaendig versuchen in ein Auto einzusteigen, um den Besitzer ohne Rollenspiel zu nerven.<br/><br/>
					5. Ein Fahrzeug stehlen nur um es zu Crashen oder kaputt zu machen.<br/><br/>
					6. Mehrere Fahrzeuge kaufen um einen der obigen Punkte zu praktizieren.<br/><br/>
					7. Das Verwenden von Fahrzeugen als Waffe ist verboten.
					   
					   Bei Wiederholungs Taetern erfolgt BAN<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["Serverregeln",
		[
			"Kommunikationsregeln", 
				"
					Die Missachtung der Regeln in dieser Liste fuehrt zum Entfernen oder Ban des Spielers.<br/><br/>

					1. Der globale Chat soll nur fuer Notfaelle oder Warnungen genutzt werden. Der Rest kann per SMS oder direkte Kommunikation geregelt werden.<br/><br/>
					2. Exzessiver Gebrauch des Globalen Chats resultiert im Kick.<br/><br/>
					3. Spammen. Egal in welchem Channel.<br/><br/>
					4. Der Teamspeak ist nicht grundlos aufgeteilt. Die Polizisten muessen immer in ihren Channels bleiben.<br/><br/>
					5. Zivilisten duerfen sich auf keinen Fall in den Copchannels aufhalten. Diejenigen, die es tun, werden des Channels verwiesen. Sollte das oefter vorkommen kann der Spieler im TS und im Spiel gebant werden.<br/><br/>

					   Die Missachtung der Regeln in dieser Liste fuehrt zum Entfernen oder Ban des Spielers.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["Serverregeln",
		[
			"Deathmatch(RDM)", 
				"
					1. Jemanden OHNE Rollenspielgrund zu toeten ist strengstens untersagt.<br/><br/>
					2. Das Erklaeren einer Rebellion ist kein Grund jemanden zu toeten, auch nicht Polizisten. Im RP Rahmen ist es erlaubt.<br/><br/>
					3. Rebellionen sind vorher bei einem Admin anzukuendigen.<br/><br/>
					4. Die Polizeibeamten und Rebellen/Zivilisten koennen nur eine laengere Auseinandersetzung mit Waffeneinsatz haben, wenn ein Verbrechen stattgefunden hat, das den Grund dafuer bietet.<br/><br/>
					5. Wenn du nicht an einem Verbrechen teilgenommen hast, dann renn weg. Du wirst nicht als *wahllos getoetet* gewertet, wenn du am Ort des Verbrechens anwesend bist. Fluechte oder akzeptiere deinen Tod.<br/><br/>
					6. Selbstverteidigung oder das Verteidigen von Freunden/Gangmitgliedern wird nicht als random deathmatch betrachtet, wenn man die Unterstuetzung vorher ankuendigt.<br/><br/>
					7. Jemanden zu ermorden weil er/sie das Geld nicht hergibt, ist nicht noetig und kann als wahlloses toeten angesehen werden. Man kann ihn/sie verletzen oder niederschlagen und ausrauben. Das gilt natuerlich nicht wenn das eigene Leben in Gefahr ist.<br/><br/>
					   
					   Dieser Punkt ist sehr situationsabhaengig und die Richtigkeit des Vorgehens soll von den Admins beurteilt werden.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["Serverregeln",
		[
			"“Neues Leben” Regeln", 
				"
					Die Missachtung der Regeln in dieser Liste fuehrt zum Entfernen oder Ban des Spielers.<br/><br/>

					1. Wenn du von einem Polizisten oder einem feindlichen Gangmitglied/Rebell getoetet wirst, bist du nicht mehr als polizeilich gesucht gemeldet.<br/><br/>
					2. Wenn du stirbst, darfst du dich NICHT raechen.<br/><br/>
					3. Wenn du verfolgt wirst oder irgendetwas anderes passiert, woraus dein Tod resultiert und die Verursacher Cops/Gangs/Rebellen waren, ist es ein neues Leben.<br/><br/>
					4. Wenn du dich selbst absichtlich umbringst um aus einer Situation zu entkommen, ist es kein neues Leben.<br/><br/>
					5. Wenn man stirbt, dann darf man sich nicht mehr an der Aktion beteiligen. Auch nicht nach 15 Minunten (Tod ist Tod)<br/><br/>
					6. Wenn man neu Spawnen moechte, dann muss man sich 2 km vom Gebiet wo man gestorben ist fernhalten.<br/><br/>
					   Die Missachtung der Regeln in dieser Liste fuehrt zum Entfernen oder Ban des Spielers.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["Serverregeln",
		[
			"Benehmt euch!", 
				"
					1. Wenn ein Admin euch sagen muss, dass ihr euch nicht anstaendig benehmt, dann ist euer Verhalten nicht annehmbar.<br/><br/>
					2. Beleidigungen sind verboten.<br/><br/>
					3. Ein Rollenspiel kaputt zu machen ist verboten.<br/><br/>
					4. Trollen, egal wie, ist verboten.<br/><br/>
					5. Die Liste geht weiter.<br/><br/>
					6. Benehmt euch einfach!<br/><br/>
					7. Die Admins entscheiden, ob euer Verhalten richtig war oder nicht.<br/><br/>
				  
				"
		]
	];
	
	
	
// Seal Team Sloth Section

	player createDiaryRecord ["Team",
		[
			"Teamspeak",
				"
				 5.175.226.241<br/><br/>
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
				Admin [BFC]graVediga<br/><br/>
				Admin oVo<br/><br/>
				Admin ishi<br/><br/>
				Admin Shentoza<br/><br/>
				Admin NeoX<br/><br/>
				Supporterin Elly<br/><br/>
				Supporter K3V1N<br/><br/>
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
		
	
// Police Section

	player createDiaryRecord ["Polizeiregeln",
		[
			"Vertraege",
				"
					1. Polizeipraesident, Stlv. Polizeipraesident oder GSG9 Leader duerfen Informanten, Spionagegruppierungen oder andere Leute kontaktieren und einstellen und fuer die Hilfe bei polizeilichen Einsaetzen/Operationen oder fuer das Dienen als Wachmann bezahlen.<br/><br/>
					2. Vertraege bleiben aufrecht, bis der zustaendige Beamte den Vertrag beendet.<br/><br/>
					3. Vertraege bestehen nach dem Tod des Anbieters oder des Ausfuehrenden weiter, ausser der Vertrag wurde davor annulliert.<br/><br/>
					4. Spezieller Vertrag<br/><br/>
					5. Polizeipraesident, Stlv. Polizeipraesident oder GSG9 Leader muessen eine Bezahlung festlegen, von welcher die Haelfte als Vorschuss gezahlt wird. (Die andere Haelfte nach dem Erfuellen des Vertrages.) Das Feuern eines Angestellten, der die Gesetze und Vertragsregeln befolgt hat, ohne ihn bezahlt zu haben, hat eine Degradierung des Beamten zur Folge.<br/><br/>
					6. Jeder Beauftragte, der das Gesetz oder die Vertragsregeln bricht, gilt ab sofort als gesucht und darf festgenommen werden. Falls dieser/diese sich wehrt ist der Einsatz von scharfer Munition erlaubt.<br/><br/>
					7. Jeder Beauftragte, der die Regeln bricht, kann unter situationsabhaengigen Umstaenden auch gekickt oder gebant werden.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["Polizeiregeln",
		[
			"Luftfahrt",
				"
					1. Es gibt keine Landeerlaubnis fuer Hubschrauber in Staedten ohne die Autorisierung durch den hoechsten Offizier, der momentan online ist.<br/><br/>
					2. Hubschrauber duerfen nicht unter 150 Metern ueber der Stadt fliegen.<br/><br/>
					3. Nur in dem Fall von einer polizeilichen Operation, die unbedingt einen Hubschrauber erfordert, darf man in der Stadt landen und darueber kreisen.<br/><br/>
					4. Hubschrauber duerfen nicht auf Strassen gelandet werden.<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["Polizeiregeln",
		[
			"Illegale Gebiete", 
				"
					1. Ganggebiete sind keine illegalen Gebiete. Polizisten duerfen sie ohne Raid betreten, aber nicht wahllos Leute anhalten. (Mit dem Gang NPC zu sprechen ist keine illegale Aktivitaet.)<br/><br/>
					2. Betreten der illegalen Gebiete sind verboten, ausser es ist ein Raid.<br/><br/>
					3. Unter keinen Umstaenden darf ein Beamter die illegalen Gebiete abcampen.<br/><br/>
						
					   Rebellendorf:

                       - In der “Gesetzlosen Zone” (auf der Map die Insel wo das Rebellendorf ist) gelten keinerlei Gesetze (natuerlich trotzdem RP).
                       - Die Polizei wird dir dort nicht helfen koennen.
                       - Bei einer Verfolgung, darf die Polizei auch in der “Gesetzlosen Zone” eingreife.n
                       - In der “Gesetzlosen Zone” darf ohne Vorwarnung auf die Polizei geschossen werden.
                       - Das Rebellendorf ist eine Safezone. Das heißt, dass erst 150m davon entfernt ausgeraubt werden darf.
					   
				"
		]
	];
	
	player createDiaryRecord ["Polizeiregeln",
		[
			"Patrouillieren", 
				"
					1. Ein Polizist darf auf den Strassen und in den Staedten patrouillieren, nach stehen gelassenen Fahrzeugen und kriminellen Aktivitaeten Ausschau halten.<br/><br/>
					2. Patrouillen koennen innerhalb der Stadt sowohl zu Fuss, als auch mit unter 30 km/h fahrenden Fahrzeugen gemacht werden.<br/><br/>
					3. Illegale Gebiete sind in Patrouillen nicht eingeschlossen.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["Polizeiregeln",
		[
			"Checkpoints", 
				"
					Die Cops koennen zusaetzliche Checkpoints einrichten und als strategische Anlaufpunkte nutzen, um effizient in Gefechten vorzugehen und die Sicherheit auf den Strassen zu foerdern.<br/><br/>

					1. Ein Checkpoint muss aus min. 4 Polizisten und 2 Fahrzeugen bestehen. Ein Quad zaehlt nicht als erfordertes Fahrzeug.<br/><br/>
					2. Ein Checkpoint kann nicht unterhalb von 1500 Metern von einem illegalen Gebiet aufgestellt werden.<br/><br/>
					3. Checkpoints koennen nur auf Strassen eingerichtet werden, aber nicht auf Kreuzungen.<br/><br/>
					4. Checkpoints muessen nicht auf der Karte markiert werden.<br/><br/>
					5. Cops die am Checkpoint ueberfallen und getoetet werden, duerfen sich solange dieses besetzt ist, nur im naechsten CP wiederbeleben lassen.<br/><br/>

					Vorgehen an Checkpoints<br/><br/>

					1. Bringt die Fahrer dazu anzuhalten und den Motor auszumachen.<br/><br/>
					2. Fragt die Insassen, ob sie Waffen dabei haben. (Wenn ja, dann gebt ihnen Zeit die Waffen senken und verhaftet sie nicht sofort.)<br/><br/>
					3. Fordert die Insassen dazu auf auszusteigen.<br/><br/>
					4. Fragt sie, wo sie hinfahren wollen.<br/><br/>
					5. Fragt sie, ob sie eine Durchsuchung erlauben.<br/><br/>
					6. Falls ja, dann legt ihnen Handschellen an und durchsucht sie.<br/><br/>
					7. Falls nein, dann muesst ihr sie ziehen lassen, ausser es besteht ein begruendeter Verdacht.<br/><br/>
					8. Nach der Durchsuchung duerfen die Betroffenen weiterfahren.<br/><br/>
					9. Wenn etwas Illegales gefunden – vorgehen wie ueblich.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["Polizeiregeln",
		[
			"Fahrzeuge", 
				"
					1. Fahrzeuge die ordnungsgemaess oder auf einem Parkplatz geparkt sind, werden stehen gelassen.<br/><br/>
					2. Fahrzeuge, die verlassen und/oder kaputt aussehen koennen beschlagnahmt werden, nach versuchter Kontaktaufnahme beim Besitzer.<br/><br/>
					3. Boote muessen am Ufer geparkt werden.<br/><br/>
					4. Jedes Fahrzeug was ueber einen laengeren Zeitraum nicht bewegt wurde, darf beschlagnahmt werden, nach versuchter Kontaktaufnahme beim Besitzer.<br/><br/>
					5. Das Beschlagnahmen ist eine essentielle Aufgabe, da der Server sauber gehalten wird und weniger lagt.<br/><br/>
					6. Polizeischnellboote duerfen eingesetzt werden um Verbrecher aufzuhalten. Gesuchte Personen duerfen damit, falls erforderlich, erschossen werden.<br/><br/>
					7. Polizisten duerfen keine Polizeifahrzeuge impounden. Sollte sie es trotzdem machen, bekommen sie von den Admins ein Tag Sonderurlaub<br/><br/>
				"
		]
	];

	player createDiaryRecord ["Polizeiregeln",
		[
			"Geschwindigkeitlimit", 
				"
					Innerorts   50 Km/h<br/><br/>
					Ausserorts  130 km/h<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["Polizeiregeln",
		[
			"Festnahme und Bussgeld",
				"

					Nur Kriminelle, die fuer sich selbst oder andere eine Gefahr darstellen, werden festgenommen.<br/><br/>

					1. Man darf keinen erneunt festnehmen, wenn er/sie das Bussgeld bezahlt hat.<br/><br/>
					2. Bei Kontrollen und Tatverdaechtigen, duerfen diese bei Kontrollbeginn, Handschellen angelegt werden.<br/><br/>
					3. Wenn ein Zivilist auf der Wanted Liste steht, dann versucht ihn festzunehmen, ausser wenn toedliche Gewalt erforderlich ist.<br/><br/>
					   Bussgelder an Zivilisten zu verteilen gilt als eine Verwarnung. Wenn eine Person, das Gesetz bricht, aber fuer keinen eine Gefahr darstellt, muss ein Bussgeld verhaengt werden.<br/><br/>

					1. Das Bussgeld muss einen gerechtfertigten Preis haben. (siehe Bussgeldkatalog)<br/><br/>
					2. Die Verweigerung der Zahlung eines Bussgeldes fuehrt zur Verhaftung.<br/><br/>
					3. Zu hohe und nicht angebrachte Bussgelder zu verhaengen ist strengstens verboten und wird mit einem Disziplinarverfahren geahndet.<br/><br/>

				"
		]
	];
		
	player createDiaryRecord ["Polizeiregeln",
		[
			"Waffen", 
				"
					Legale Waffen fuer Zivilisten:<br/><br/>

					1. P07<br/><br/>
					2. Rook<br/><br/>
					3. PDW<br/><br/>

					Alle anderen Waffen inklusive der Polizeiwaffen gelten als illegal.<br/><br/>

					1. Zivilisten muessen ihre Waffen innerhalb von Staedten in den Rucksaecken behalten oder ein Fernglass in die Hand nehmen.<br/><br/>
					2. Zivilisten duerfen ihre Waffen auspacken, wenn sie nicht in der Stadt sind. Trotzdem muessen sie nach einer Waffenlizenz geprueft werden und waehrenddessen ihre Waffe gesenkt halten. (Strg 2x druecken)<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["Polizeiregeln",
		[
			"Nicht toedliche Gewalt",
				"

					Taser sind die einzige Form von nicht toedlicher Gewalt.<br/><br/>

					1. Taser sollen nur an nicht kooperierenden Gesetzesbrechern eingesetzt werden um sie kampfunfaehig zu machen und festzunehmen.<br/><br/>
					2. Bei illegalen Aktivitaeten duerfern die Polizisten ohne vorwarnung Tazern.<br/><br/>
					2. Wer seinen Taser ohne Grund abschiesst oder zum Trollen benutzt, wird mit einem Disziplinarverfahren geahndet<br/><br/>
					3. Benutzt den Taser nicht um euren Willen durchzusetzen.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["Polizeiregeln",
		[
			"Raid und Campen",
				"

					Ein Raid wird durch eine Truppe von Polizisten definiert, die in ein Gebiet mit hoher Krimanalitaet eindringen.<br/><br/>

					1. Bei einem Raid muessen 4 Polizisten dabei sein. Einer der Polizisten muss hochrangig sein und die Fuehrung ueber die Truppe uebernehmen.<br/><br/>
					2. Alle Zivilisten im Gebiet duerfen festgenommen und durchsucht werden. Falls nichts Illegales gefunden wird, lasst sie laufen.<br/><br/>
					3. Falls etwas Illegales gefunden wird, wird das normale Prozedere durchgefuehrt.<br/><br/>
					4. Bei unmittelbarer Gefahr ist der Einsatz von scharfer Munition erlaubt.<br/><br/>
					5. Wenn das Gebiet gesichert ist, muessen die Polizisten das Gebiet verlassen.<br/><br/>
					6. Das geraidete Gebiet darf innerhalb von 30 Min. nicht wieder geraided werden.<br/><br/>
					7. Wenn der Raid scheitert, indem alle Beamten sterben, darf der verstorbene Beamte sich nicht mehr am Raid beteiligen.<br/><br/>
					8. Man darf Verstaerkung rufen, aber die verstorbenen Polizisten duerfen nicht mehr eingreifen (Neues Leben).<br/><br/>
					9. Verarbeitende Gewerbe illegaler Waren/Dealer duerfen auch von wengier als 4 Polizisten ueberprueft werden.<br/><br/>
					9. Wenn man neu Spawnen moechte, dann muss man sich 2 km vom Gebiet wo man gestorben ist fernhalten.<br/><br/>
				   10. Wenn man stirbt, dann darf man sich nicht mehr an der Aktion beteiligen. Auch nicht nach 15 Minunten (Tod ist Tod).<br/><br/>
				   11. Bei einem Bankueberfall darf man sich nicht umloggen/respawnen. Sollte ein Admin das sehen bekommt diese Person ein Tag Sonderurlaub.<br/><br/>
					
					Campen ist definiert als laengeres Verbleiben (10 min) von Polizisten an einem Ort.<br/><br/>

					1. An Checkpoints zu bleiben, zaehlt nicht als Campen.<br/><br/>
					2. Man wird vom Dienst suspendiert, wenn man nach einem Raid immer noch aktiv gegen Zivilisten in dem Gebiet vorgeht.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["Polizeiregeln",
		[
			"Befehlskette",
				"

					Der ranghoechste Offizier, der zurzeit online ist, ist fuer die Koordination der Polizei zustaendig. Dieser Offizier ist dafuer zustaendig Vergehen seitens der Polizei beim Admin zu melden.<br/><br/>
					Hochrangige Offiziere haben bei polizeilichen Aktionen das volle Kommando. Rekruten haben zu gehorchen und keine Einwaende zu aeussern.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["Polizeiregeln",
		[
			"Toedliche Gewalt",
				"
				1. Der Einsatz von toedlicher Gewalt ist erlaubt um das eigene Leben, das Leben eines anderen Offiziers oder eines Zivilisten zu beschuetzen, und nur wenn der Einsatz von Tasern nicht effektiv ist.<br/><br/>
				2. Falls ein Offizier beim wahllosen Abfeuern der Waffe (Schiesstraining erlaubt) erwischt wird, wird mit einem Disziplinarverfahren geahndet.<br/><br/>
				3. Der Einsatz von toedlicher Gewalt ist nicht erlaubt, wenn Zivilisten dadurch gefaerdet werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["Polizeiregeln",
		[
			"Teamspeak Regeln",
				"
					1. Alle Cops muessen auf dem Teamspeak im Polizeichannel sein. Es ist nicht erlaubt ueber Teamspeak mit Zivilisten zu kommunizieren.<br/><br/>
					2. Kommt in den Teamspeak bevor ihr euch als Polizist auf dem Server einloggt.<br/><br/>

				"
		]
	];
	
	
	
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Rebellenregeln",
				"
					Rebellen leisten bewaffneten Widerstand gegen die Regierung, welche in diesem Fall die Polizei ist. Allerdings ist die Anzahl der Polizisten, verglichen mit der moeglichen Anzahl der Rebellen, ein Grund um die Polizei nicht immer gleich zu erschiessen. Bitte nehmt die Rebellion nicht zu woertlich, versucht stattdessen das Spiel mit rebellischer List und Spass zu gestalten.<br/><br/>

					1. Ein Rebell muss als erstes eine Gang gruenden und dann seine Intentionen im Forum mit Memberliste verkuenden, die an der Aktion teilnehmen. 
					2. Die max. Gangmitgliederanzahl darf nicht ueber 10 Spieler (online) betragen, die an der Intention teilnehmen.<br/><br/>
					3. Intentionen sind z.b. Geiselnahmen, Stadt einnahme und RP Events.<br/><br/>
					4. Widerstand bedeutet nicht RDM (siehe Deathmatch Regeln).<br/><br/>
					5. Widerstand soll als Rollenspiel stattfinden. Es gibt viele Wege, d.h. nicht nur Bullen abknallen oder Bank ausrauben.<br/><br/>
					6. Der Widerstand muss koordiniert sein.<br/><br/>
					7. Jeder Angriff muss einen ANGEMESSENEN Grund haben.<br/><br/>
					8. Pro Geisel darf man max. 50.000$ verlangen. Bei mehreren Geiseln, nicht mehr wie 100.000$. Pro Server restart, darf man nur eine erfolgreiche Geiselnahme machen.<br/><br/>
					9. Geiselnahme und Bankraub duerfen nicht Kombiniert werden.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Gangregeln",
				"
					1. In einer Gang zu sein ist nicht illegal. Nur wenn illegale Delikte veruebt werden.<br/><br/>
					2. In einem Ganggebiet zu sein, ist nicht illegal.<br/><br/>
					3. Gangs koennen Ganggebiete einnehmen und kontrollieren. Andere Gangs sollten diese Gebiete angreifen um die Kontrolle streitig zu machen.<br/><br/>
					4. Um einer anderen Gang den Krieg zu erklaeren, muss der Leader im side Channel<br/><br/>
					   eine Ansage machen. Die Namen aller Mitglieder von beiden Gangs muessen niedergeschrieben werden. Fuer einen laengeren Krieg wird die Erklaerung im Forum gemacht.<br/><br/>
					5. Gangs duerfen keine unbewaffneten Zivilisten ohne wichtigen Grund toeten. Das Toeten von Wehrlosen wird als RDM betrachtet, aber ihr duerft sie ausrauben.<br/><br/>
					6. Falls eine Gang von Zivilisten mit Waffen bedroht wird, darf sie sich wehren.<br/><br/>

				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Liste illegaler Fahrzeuge",
				"

					1. Ifrit<br/><br/>		
					2. Offroad-mg<br/><br/>
					3. Polizeischnellboot<br/><br/>
					4. Polizeioffroad<br/><br/>
					5. Polizei SUV<br/><br/>
					6. Hunter<br/><br/>
					7. Strider<br/><br/>
					8. Ghosthawk<br/><br/>
				
				"
		]
	];
	
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Items",
				"
				Das sind die Illegalen Substanzen:<br/><br/>
				1. Schildkroete<br/>
				2. Meth<br/>
				3. Kokaine<br/>
				4. Heroin<br/>
				5. Hanf<br/><br/>
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
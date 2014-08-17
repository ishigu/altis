ALTER TABLE `players` ADD (
	`reb_gear` TEXT NULL,
	`rebellevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0'
);
UPDATE `players` SET `reb_gear` = '"[]"';
UPDATE `players` SET `reb_gear` = `civ_gear` WHERE `civ_gear` <> '';
UPDATE `vehicles` SET `side` = 'reb' WHERE `classname` = 'B_G_Offroad_01_F';
UPDATE `vehicles` SET `side` = 'reb' WHERE `classname` = 'O_MRAP_02_F';
UPDATE `vehicles` SET `side` = 'reb' WHERE `classname` = 'O_Heli_Light_02_unarmed_F' AND (`color` = 2 OR `color` = 3);
UPDATE `vehicles` SET `side` = 'reb' WHERE `classname` = 'B_Heli_Light_01_F' AND (`color` = 4 OR `color` = 13);
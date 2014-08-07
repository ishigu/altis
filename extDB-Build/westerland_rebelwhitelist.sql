ALTER TABLE `players` ADD (
	`reb_gear` TEXT NULL,
	`rebellevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0'
);
UPDATE `players` SET `reb_gear`='"[]"';
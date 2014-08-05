ALTER TABLE `players` ADD (
	`reb_gear` TEXT NOT NULL,
	`rebellevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0'
);
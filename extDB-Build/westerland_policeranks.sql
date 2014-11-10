ALTER TABLE `players`
	CHANGE COLUMN `coplevel` `coplevel` ENUM('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '0' AFTER `bankacc`;
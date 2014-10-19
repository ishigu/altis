ALTER TABLE `players` ADD COLUMN `last_spawn` TEXT NULL AFTER `rebellevel`;
UPDATE `players` SET `last_spawn` = '"[0,0,0]"';
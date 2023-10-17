CREATE TABLE IF NOT EXISTS `cokebusiness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) DEFAULT NULL,
  `upgrades` VARCHAR(50) DEFAULT NULL,
  `hash` VARCHAR(50) DEFAULT NULL,
  `plate` VARCHAR(50),
  `engine`
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

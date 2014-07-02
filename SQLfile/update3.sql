
-- ----------------------------
-- Table structure for `check`
-- ----------------------------
DROP TABLE IF EXISTS `check`;
CREATE TABLE `check` (
  `check` mediumint(5) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check
-- ----------------------------
INSERT INTO `check` VALUES ('1');

-- ----------------------------
-- Update for Object_Classes
-- ----------------------------
DELETE
			FROM `object_classes`
			WHERE `Classname` = 'ori_excavator';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'ORI_gunship_helicopter';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'HC3_Merlin_Ori';

	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'ori_originsmod_pickupoldfuel';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'ori_originsmod_pickupold';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'KamazOpen_Ori';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'Kamaz_Ori';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'Offroad_MG_Ori';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'Ka60c_Ori';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'MH6J_Ori';			
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'MH60S_Ori';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'HMMWV_Ori';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'LandRover_MG_Ori';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'Mi171ShCZ_Ori';
	DELETE
			FROM `object_classes`
			WHERE `Classname` = 'SUV_MG_Ori';
			
			
			
INSERT INTO `object_classes` VALUES ('ori_excavator', '0.9', '3', '0.05000', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass2\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('ORI_gunship_helicopter', '0.90', '1', '0.05000', '[[\"motor\",0.8],[\"motor1\",0.8],[\"motor2\",0.8],[\"motor3\",0.8],[\"motor4\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"elektronika\",0.8],[\"mala vrtule\",0.8],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('HC3_Merlin_Ori', '0.7', '5', '0.05', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"elektronika\",0.8],[\"mala vrtule\",0.8],[\"velka vrtule\",0.8],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('ori_originsmod_pickupoldfuel', '0.7', '1', '0.05000', '[[\"sklo_p\",1],[\"sklo_p1\",1],[\"sklo_l1\",1],[\"sklo_z\",0.4],[\"levy predni tlumic\",1],[\"levy zadni tlumic\",0.1],[\"pravy predni tlumic\",1],[\"karoserie\",0.7],[\"palivo\",0.8],[\"motor\",0.6],[\"front_plow\",1],[\"wheel_guards\",1],[\"window_guards\",1],[\"windshield_guard\",1]]');
INSERT INTO `object_classes` VALUES ('ori_originsmod_pickupold', '0.7', '1', '0.05000', '[[\"sklo_p\",1],[\"sklo_p1\",1],[\"sklo_l1\",1],[\"sklo_z\",0.4],[\"levy predni tlumic\",1],[\"levy zadni tlumic\",0.1],[\"pravy predni tlumic\",1],[\"karoserie\",0.7],[\"palivo\",0.8],[\"motor\",0.6],[\"front_plow\",1],[\"wheel_guards\",1],[\"window_guards\",1],[\"windshield_guard\",1]]');
INSERT INTO `object_classes` VALUES ('KamazOpen_Ori', '0.66', '5', '0.05000', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass2\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('Kamaz_Ori', '0.66', '5', '0.05000', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass2\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('Offroad_MG_Ori', '0.7', '3', '0.05000', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass2\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('Ka60c_Ori', '0.7', '5', '0.05', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"elektronika\",0.8],[\"mala vrtule\",0.8],[\"velka vrtule\",0.8],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('MH6J_Ori', '0.7', '5', '0.05', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"elektronika\",0.8],[\"mala vrtule\",0.8],[\"velka vrtule\",0.8],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('MH60S_Ori', '0.7', '5', '0.05', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"elektronika\",0.8],[\"mala vrtule\",0.8],[\"velka vrtule\",0.8],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('HMMWV_Ori', '0.70', '7', '0.05000', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass2\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('LandRover_MG_Ori', '0.70', '4', '0.05000', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass2\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('Mi171ShCZ_Ori', '0.7', '5', '0.05', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"elektronika\",0.8],[\"mala vrtule\",0.8],[\"velka vrtule\",0.8],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass3\",1]]');
INSERT INTO `object_classes` VALUES ('SUV_MG_Ori', '0.7', '10', '0.05000', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"glass1\",1],[\"glass2\",1],[\"glass3\",1]]');

-- ----------------------------
-- Update for Object_Spawns
-- ----------------------------

	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000474';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000475';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000476';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000477';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000478';

	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000479';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000480';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000481';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000482';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000483';
		DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000484';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000485';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000486';

	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000487';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000488';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000489';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000490';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000491';
		DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000492';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000493';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000494';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000495';
		DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000496';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000497';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000498';

	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000499';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000500';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000501';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000502';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000503';
			DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000504';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000505';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000506';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000507';
		DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000508';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000509';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000510';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000511';
		DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000512';
	DELETE
			FROM `object_spawns`
			WHERE `ObjectUID` = '0000500000513';

INSERT INTO `object_spawns` VALUES ('0000500000474', 'ori_excavator', '[64,[2439.05,16289,0.02]]', 'Bagger');
INSERT INTO `object_spawns` VALUES ('0000500000475', 'ori_excavator', '[338,[5452.88,19673.301,0.002]]', 'Bagger');
INSERT INTO `object_spawns` VALUES ('0000500000476', 'ori_excavator', '[128,[12412.2,13952,0.001]]', 'Bagger');
INSERT INTO `object_spawns` VALUES ('0000500000477', 'ORI_gunship_helicopter', '[172,[3635.74,15866.6,0.014]]', 'FF');
INSERT INTO `object_spawns` VALUES ('0000500000478', 'HC3_Merlin_Ori', '[356,[5566.3,16097.8,0.001]]', 'Merlin');
INSERT INTO `object_spawns` VALUES ('0000500000479', 'ori_survivorBus', '[190,[5667.27,16135.4,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000480', 'ori_survivorBus', '[236,[5212.14,17765.301,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000481', 'ori_survivorBus', '[91,[1822.99,17041.699,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000482', 'UAZ_RU', '[96,[5449.7,16716.301,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000483', 'UAZ_RU', '[118,[4901.04,17637.4,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000484', 'S1203_TK_CIV_EP1', '[74,[5569.39,16727.801,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000485', 'ori_originsmod_pickupoldfuel', '[52,[2511.44,17666.801,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000486', 'ori_originsmod_pickupold', '[280,[5836.78,17320.699,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000487', 'KamazOpen_Ori', '[277,[5625.35,18318.4,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000488', 'KamazOpen_Ori', '[249,[4749.55,16502.4,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000489', 'KamazOpen_Ori', '[243,[12775.6,14514.1,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000490', 'Kamaz_Ori', '[1,[3126.64,17617.699,0.002]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000491', 'Kamaz_Ori', '[321,[2747.54,16683.5,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000492', 'Kamaz_Ori', '[5,[2200.41,16750.9,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000493', 'datsun1_civil_3_open', '[341,[5441.82,14815.8,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000494', 'Volha_2_TK_CIV_EP1', '[85,[3859.8,17621.5,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000495', 'Lada2_TK_CIV_EP1', '[355,[2117.59,17102.5,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000496', 'SUV_Special', '[198,[2826.54,17256.699,0.002]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000497', 'VWGolf', '[270,[2006.41,17238.4,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000498', 'ori_vil_originsmod_volvo_fl290', '[324,[4472.4,14095.5,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000499', 'car_hatchback', '[181,[3918.73,17819,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000500', 'UralCivil', '[115,[8437.82,10860,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000501', 'Offroad_MG_Ori', '[250,[5951.62,17588.1,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000502', 'Ka60c_Ori', '[324,[11973.7,7663.04,53.384]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000503', 'MH6J_Ori', '[38,[3848.53,6992.59,10.793]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000504', 'MH60S_Ori', '[175,[3820.74,10834.9,47.855]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000505', 'MH60S_Ori', '[137,[20947.1,13050.1,48.129]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000506', 'HMMWV_Ori', '[178,[1333.16,18092.199,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000507', 'HMMWV_Ori', '[158,[1161.54,19197.301,0.002]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000508', 'LandRover_MG_Ori', '[277,[1460.21,17409.199,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000509', 'LandRover_MG_Ori', '[302,[1688.39,18201.6,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000510', 'Mi171ShCZ_Ori', '[2,[1049.98,18132.6,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000511', 'Mi171ShCZ_Ori', '[4,[19431.199,21037,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000512', 'SUV_MG_Ori', '[87,[3776.98,17178.4,0.001]]', null);
INSERT INTO `object_spawns` VALUES ('0000500000513', 'SUV_MG_Ori', '[288,[2632.08,16247.1,0.001]]', null);

-- ----------------------------
-- Procedure structure for `pCleanup`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pCleanup`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pCleanup`()
BEGIN

	DELETE
	FROM object_data
	WHERE Damage = '1';

	DELETE
			FROM `object_data` 
			WHERE `ObjectUID` 
			NOT LIKE '0000%' 
			AND (	`Classname` NOT LIKE 'Tentstorage' AND 
					`Classname` NOT LIKE 'TentstorageR' AND 
					`Classname` NOT LIKE 'wooden_shed_lvl_1' AND 
					`Classname` NOT LIKE 'log_house_lvl_2' AND 
					`Classname` NOT LIKE 'wooden_house_lvl_3' AND 
					`Classname` NOT LIKE 'large_shed_lvl_1' AND 
					`Classname` NOT LIKE 'small_house_lvl_2' AND 
					`Classname` NOT LIKE 'big_house_lvl_3' AND 
					`Classname` NOT LIKE 'small_garage' AND 
					`Classname` NOT LIKE 'big_garage' AND 
					`Classname` NOT LIKE 'object_x');

	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500000393';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500000394';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500000395';

	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500001393';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500001394';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500001395';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500001396';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500001397';

	INSERT INTO `object_data` 
			VALUES (NULL, '0000500001393', '1', 'ori_vil_truck_civ_base', '0.05000', '0', '[180,[22462.2,19495.5,0]]', '[[[],[]],[[\"ItemAntibiotic\",\"ItemBandage\",\"ItemBloodbag\",\"ItemEpinephrine\",\"ItemMorphine\",\"ItemPainkiller\",\"FoodCanBakedBeans\",\"FoodCanFrankBeans\",\"FoodCanPasta\",\"FoodCanSardines\",\"ItemSodaCoke\",\"ItemSodaPepsi\",\"ItemHeatPack\"],[15,15,15,15,15,15,15,15,15,15,15,15,15]],[["O_TravelerPack_1","O_MegaPack_1"],[1,1]]]', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1]]', '0.01000', NOW());
	INSERT INTO `object_data` 
			VALUES (NULL, '0000500001394', '1', 'ori_vil_truck_civ_base', '0.05000', '0', '[269,[22180.7,19833.1,0]]', '[[[\"ItemPickaxe\"],[2]],[[\"ItemBpt_b1\",\"ItemBpt_b2\",\"ItemBpt_h1\",\"ItemBpt_h2\",\"ItemBpt_g_s\",\"ItemBpt_g_b\",\"ItemBattery\",\"ItemPin\",\"ItemRocks\",\"ItemCementBag\",\"PartScrap\",\"PartWoodPile\",\"ItemCeMix\"],[3,3,3,3,3,1,7,7,15,5,10,15,3]],[["O_TravelerPack_1","O_MegaPack_1"],[1,1]]]', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1]]', '0.01000', NOW());
	INSERT INTO `object_data` 
			VALUES (NULL, '0000500001395', '1', 'ori_vil_truck_civ_base', '0.05000', '0', '[90,[22452.8,20074.8,0]]', '[[[\"AKS_74_kobra\",\"M16A2GL\",\"AKS_74_U\",\"FN_FAL\",\"M9SD\",\"PK_DZ\",\"Pecheneg_DZ\",\"bizon_silenced\",\"M4A3_RCO_GL_EP1\",\"NVGoggles\",\"ItemGPS\",\"G36K\"],[3,3,3,3,3,3,3,3,3,2,2,1]],[[\"ItemBloodbag\",\"100Rnd_762x54_PK\",\"30Rnd_556x45_Stanag\",\"100Rnd_762x51_M240\",\"30Rnd_556x45_G36SD\",\"10Rnd_9x39_SP5_VSS\",\"ItemAntibiotic\",\"30Rnd_545x39_AK\",\"20Rnd_762x51_FNFAL\",\"15Rnd_9x19_M9SD\",\"64Rnd_9x19_SD_Bizon\",\"1Rnd_HE_GP25\",\"PartGeneric\",\"PartEngine\",\"PartGlass\",\"PartVRotor\",\"ItemJerrycan\",\"ItemTent\"],[10,10,10,10,10,10,10,10,10,10,10,10,4,2,6,2,10,2]],[["O_TravelerPack_1","O_MegaPack_1"],[1,1]]]', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1]]', '0.01000', NOW());

	
DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500000431';
	
	INSERT INTO `object_data` 
			VALUES (NULL, '0000500000431', '1', 'Ori_DC3', '0.05000', '0', '[1,[22687.3,19239.3,0]]', '[]', '[]', '1', NOW());

	
	DELETE
	FROM object_data
	WHERE DATE(Datestamp) < CURDATE() - INTERVAL 5 DAY
	AND Classname != 'Hedgehog_DZ'
	AND Classname != 'Wire_cat1'
	AND Classname != 'Sandbag1_DZ'
	AND Classname != 'TrapBear'
	AND Classname != 'TentStorage'
	AND Classname != 'TentStorageR' AND
	Classname != 'wooden_shed_lvl_1' AND 
	Classname != 'log_house_lvl_2' AND 
	Classname != 'wooden_house_lvl_3' AND 
	Classname != 'large_shed_lvl_1' AND 
	Classname != 'small_house_lvl_2' AND 
	Classname != 'big_house_lvl_3' AND 
	Classname != 'small_garage' AND 
	Classname != 'big_garage' AND 
	Classname != 'object_x';

	
	DELETE
		FROM `object_data`
		WHERE `Classname` = 'TentStorage'
			AND  DATE(Datestamp) < CURDATE() - INTERVAL 6 DAY;

	
	DELETE
	FROM object_data
	WHERE Classname = 'TentStorage'
	AND DATE(Datestamp) < CURDATE() - INTERVAL 7 DAY
	AND Inventory = '[[[],[]],[[],[]],[[],[]]]';

	DELETE
	FROM object_data
	WHERE Classname = 'TentStorage'
	AND DATE(Datestamp) < CURDATE() - INTERVAL 7 DAY
	AND Inventory = '[]';	

	DELETE
	FROM object_data
	WHERE Classname = 'TentStorageR'
	AND DATE(Datestamp) < CURDATE() - INTERVAL 7 DAY
	AND Inventory = '[[[],[]],[[],[]],[[],[]]]';

	DELETE
	FROM object_data
	WHERE Classname = 'TentStorageR'
	AND DATE(Datestamp) < CURDATE() - INTERVAL 7 DAY
	AND Inventory = '[]';

	
	DELETE
	FROM object_data
	WHERE Classname = 'Wire_cat1'
	AND DATE(Datestamp) <= CURDATE();

	
	DELETE
	FROM object_data
	WHERE Classname = 'Hedgehog_DZ'
	AND DATE(Datestamp) <= CURDATE();

	
	DELETE
	FROM object_data
	WHERE Classname = 'Sandbag1_DZ'
	AND DATE(Datestamp) <= CURDATE();

	
	DELETE
	FROM object_data
	WHERE Classname = 'TrapBear'
	AND DATE(Datestamp) <= CURDATE();

	DELETE
			FROM `check`
			WHERE `check` = '0';
	INSERT INTO `check` VALUES ('1');


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pCleanup2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pCleanup2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pCleanup2`()
BEGIN

	DELETE
	FROM object_data
	WHERE Damage = '1';

	DELETE
			FROM `object_data` 
			WHERE `ObjectUID` 
			NOT LIKE '0000%' 
			AND (	`Classname` NOT LIKE 'Tentstorage' AND 
					`Classname` NOT LIKE 'TentstorageR' AND 
					`Classname` NOT LIKE 'wooden_shed_lvl_1' AND 
					`Classname` NOT LIKE 'log_house_lvl_2' AND 
					`Classname` NOT LIKE 'wooden_house_lvl_3' AND 
					`Classname` NOT LIKE 'large_shed_lvl_1' AND 
					`Classname` NOT LIKE 'small_house_lvl_2' AND 
					`Classname` NOT LIKE 'big_house_lvl_3' AND 
					`Classname` NOT LIKE 'small_garage' AND 
					`Classname` NOT LIKE 'big_garage' AND 
					`Classname` NOT LIKE 'object_x');

	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500000393';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500000394';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500000395';

	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500001393';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500001394';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500001395';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500001396';
	DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500001397';

	INSERT INTO `object_data` 
			VALUES (NULL, '0000500001395', '1', 'ori_vil_truck_civ_base', '0.05000', '0', '[90,[22452.8,20074.8,0]]', '[[[\"AKS_74_kobra\",\"M16A2GL\",\"AKS_74_U\",\"FN_FAL\",\"M9SD\",\"PK_DZ\",\"Pecheneg_DZ\",\"bizon_silenced\",\"M4A3_RCO_GL_EP1\",\"NVGoggles\",\"ItemGPS\",\"G36K\"],[3,3,3,3,3,3,3,3,3,2,2,1]],[[\"ItemBloodbag\",\"100Rnd_762x54_PK\",\"30Rnd_556x45_Stanag\",\"100Rnd_762x51_M240\",\"30Rnd_556x45_G36SD\",\"10Rnd_9x39_SP5_VSS\",\"ItemAntibiotic\",\"30Rnd_545x39_AK\",\"20Rnd_762x51_FNFAL\",\"15Rnd_9x19_M9SD\",\"64Rnd_9x19_SD_Bizon\",\"1Rnd_HE_GP25\",\"PartGeneric\",\"PartEngine\",\"PartGlass\",\"PartVRotor\",\"ItemJerrycan\",\"ItemTent\"],[10,10,10,10,10,10,10,10,10,10,10,10,4,2,6,2,10,2]],[["O_TravelerPack_1","O_MegaPack_1"],[1,1]]]', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1]]', '0.01000', NOW());
	INSERT INTO `object_data` 
			VALUES (NULL, '0000500001396', '1', 'ori_vil_truck_civ_base', '0.05000', '0', '[178,[22533,20073,0]]', '[[[\"AKS_74_kobra\",\"M16A2GL\",\"AKS_74_U\",\"FN_FAL\",\"M9SD\",\"PK_DZ\",\"Pecheneg_DZ\",\"bizon_silenced\",\"M4A3_RCO_GL_EP1\",\"NVGoggles\",\"ItemGPS\",\"G36K\"],[3,3,3,3,3,3,3,3,3,2,2,1]],[[\"ItemBloodbag\",\"100Rnd_762x54_PK\",\"30Rnd_556x45_Stanag\",\"100Rnd_762x51_M240\",\"30Rnd_556x45_G36SD\",\"10Rnd_9x39_SP5_VSS\",\"ItemAntibiotic\",\"30Rnd_545x39_AK\",\"20Rnd_762x51_FNFAL\",\"15Rnd_9x19_M9SD\",\"64Rnd_9x19_SD_Bizon\",\"1Rnd_HE_GP25\",\"PartGeneric\",\"PartEngine\",\"PartGlass\",\"PartVRotor\",\"ItemJerrycan\",\"ItemTent\"],[10,10,10,10,10,10,10,10,10,10,10,10,4,2,6,2,10,2]],[["O_TravelerPack_1","O_MegaPack_1"],[1,1]]]', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1]]', '0.01000', NOW());
	INSERT INTO `object_data` 
			VALUES (NULL, '0000500001397', '1', 'ori_vil_truck_civ_base', '0.05000', '0', '[178,[22549.2,20071.9,0]]', '[[[\"AKS_74_kobra\",\"M16A2GL\",\"AKS_74_U\",\"FN_FAL\",\"M9SD\",\"PK_DZ\",\"Pecheneg_DZ\",\"bizon_silenced\",\"M4A3_RCO_GL_EP1\",\"NVGoggles\",\"ItemGPS\",\"G36K\"],[3,3,3,3,3,3,3,3,3,2,2,1]],[[\"ItemBloodbag\",\"100Rnd_762x54_PK\",\"30Rnd_556x45_Stanag\",\"100Rnd_762x51_M240\",\"30Rnd_556x45_G36SD\",\"10Rnd_9x39_SP5_VSS\",\"ItemAntibiotic\",\"30Rnd_545x39_AK\",\"20Rnd_762x51_FNFAL\",\"15Rnd_9x19_M9SD\",\"64Rnd_9x19_SD_Bizon\",\"1Rnd_HE_GP25\",\"PartGeneric\",\"PartEngine\",\"PartGlass\",\"PartVRotor\",\"ItemJerrycan\",\"ItemTent\"],[10,10,10,10,10,10,10,10,10,10,10,10,4,2,6,2,10,2]],[["O_TravelerPack_1","O_MegaPack_1"],[1,1]]]', '[[\"motor\",0.8],[\"karoserie\",1],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_2_steering\",1]]', '0.01000', NOW());

	
DELETE
			FROM `object_data`
			WHERE `ObjectUID` = '0000500000431';
	
	INSERT INTO `object_data` 
			VALUES (NULL, '0000500000431', '1', 'Ori_DC3', '0.05000', '0', '[1,[22687.3,19239.3,0]]', '[]', '[]', '1', NOW());

	
	DELETE
	FROM object_data
	WHERE DATE(Datestamp) < CURDATE() - INTERVAL 5 DAY
	AND Classname != 'Hedgehog_DZ'
	AND Classname != 'Wire_cat1'
	AND Classname != 'Sandbag1_DZ'
	AND Classname != 'TrapBear'
	AND Classname != 'TentStorage'
	AND Classname != 'TentStorageR' AND
	Classname != 'wooden_shed_lvl_1' AND 
	Classname != 'log_house_lvl_2' AND 
	Classname != 'wooden_house_lvl_3' AND 
	Classname != 'large_shed_lvl_1' AND 
	Classname != 'small_house_lvl_2' AND 
	Classname != 'big_house_lvl_3' AND 
	Classname != 'small_garage' AND 
	Classname != 'big_garage' AND 
	Classname != 'object_x';

	
	DELETE
		FROM `object_data`
		WHERE `Classname` = 'TentStorage'
			AND  DATE(Datestamp) < CURDATE() - INTERVAL 6 DAY;

	
	DELETE
	FROM object_data
	WHERE Classname = 'TentStorage'
	AND DATE(Datestamp) < CURDATE() - INTERVAL 7 DAY
	AND Inventory = '[[[],[]],[[],[]],[[],[]]]';

	DELETE
	FROM object_data
	WHERE Classname = 'TentStorage'
	AND DATE(Datestamp) < CURDATE() - INTERVAL 7 DAY
	AND Inventory = '[]';	

	DELETE
	FROM object_data
	WHERE Classname = 'TentStorageR'
	AND DATE(Datestamp) < CURDATE() - INTERVAL 7 DAY
	AND Inventory = '[[[],[]],[[],[]],[[],[]]]';

	DELETE
	FROM object_data
	WHERE Classname = 'TentStorageR'
	AND DATE(Datestamp) < CURDATE() - INTERVAL 7 DAY
	AND Inventory = '[]';

	
	DELETE
	FROM object_data
	WHERE Classname = 'Wire_cat1'
	AND DATE(Datestamp) <= CURDATE();

	
	DELETE
	FROM object_data
	WHERE Classname = 'Hedgehog_DZ'
	AND DATE(Datestamp) <= CURDATE();

	
	DELETE
	FROM object_data
	WHERE Classname = 'Sandbag1_DZ'
	AND DATE(Datestamp) <= CURDATE();

	
	DELETE
	FROM object_data
	WHERE Classname = 'TrapBear'
	AND DATE(Datestamp) <= CURDATE();

	DELETE
			FROM `check`
			WHERE `check` = '1';
	INSERT INTO `check` VALUES ('0');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pMain`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pMain`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pMain`()
    MODIFIES SQL DATA
BEGIN

DECLARE sInstance VARCHAR(8) DEFAULT '1';

DECLARE iVehSpawnMax INT DEFAULT 487;

DECLARE iTimeoutMax INT DEFAULT 450; 
DECLARE iTimeout INT DEFAULT 0; 
DECLARE iNumVehExisting INT DEFAULT 0; 
DECLARE iNumClassExisting INT DEFAULT 0; 
DECLARE i INT DEFAULT 1; 

DECLARE iupdateCount	INT(3) DEFAULT 0;
	SELECT COUNT(`check`) 
		INTO iupdateCount
		FROM `check` 
		WHERE `check` != '';

	IF iupdateCount = 1 THEN
		CALL pCleanup2();
ELSE	
		CALL pCleanup();
	END IF;

SELECT COUNT(*) 
	INTO iNumVehExisting
FROM object_data
	WHERE Instance = sInstance
		AND Classname != 'Hedgehog_DZ' 
		AND Classname != 'Wire_cat1' 
		AND Classname != 'Sandbag1_DZ' 
		AND Classname != 'TrapBear' 
		AND Classname != 'TentStorage' 
		AND Classname != 'TentStorageR' AND 
		Classname != 'wooden_shed_lvl_1' AND 
		Classname != 'log_house_lvl_2' AND 
		Classname != 'wooden_house_lvl_3' AND 
		Classname != 'large_shed_lvl_1' AND 
		Classname != 'small_house_lvl_2' AND 
		Classname != 'big_house_lvl_3' AND 
		Classname != 'small_garage' AND 
		Classname != 'big_garage' AND 
		Classname != 'object_x';

WHILE (iNumVehExisting < iVehSpawnMax) DO 

	
	SELECT Classname, Chance, MaxNum, Damage
	INTO @rsClassname, @rsChance, @rsMaxNum, @rsDamage
	FROM object_classes ORDER BY RAND() LIMIT 1;

	
	SELECT COUNT(*)
	INTO iNumClassExisting
	FROM object_data
	WHERE Instance = sInstance
	AND Classname = @rsClassname;

	IF (iNumClassExisting < @rsMaxNum) THEN
		IF (rndspawn(@rschance) = 1) THEN
			INSERT INTO object_data (ObjectUID, Instance, Classname, Damage, CharacterID, Worldspace, Inventory, Hitpoints, Fuel, Datestamp)
				SELECT OS.ObjectUID, '1', OC.Classname, RAND(@rsOC.Damage), NULL AS `CharacterID`, OS.Worldspace, '[]' AS `Inventory`, OC.Hitpoints, RAND(1), SYSDATE()
					FROM object_spawns OS
					INNER JOIN object_classes OC
					ON OS.Classname = OC.Classname
				WHERE OC.Classname = @rsClassname
				AND NOT OS.ObjectUID IN (SELECT ObjectUID FROM object_data WHERE instance = sInstance)
			ORDER BY RAND()
			LIMIT 0, 1;

			SELECT COUNT(*)
			INTO iNumVehExisting
			FROM object_data
			WHERE Instance = sInstance
			AND Classname != 'Hedgehog_DZ' 
			AND Classname != 'Wire_cat1' 
			AND Classname != 'Sandbag1_DZ' 
			AND Classname != 'TrapBear' 
			AND Classname != 'TentStorage' 
			AND Classname != 'TentStorageR' AND 
			Classname != 'wooden_shed_lvl_1' AND 
			Classname != 'log_house_lvl_2' AND 
			Classname != 'wooden_house_lvl_3' AND 
			Classname != 'large_shed_lvl_1' AND 
			Classname != 'small_house_lvl_2' AND 
			Classname != 'big_house_lvl_3' AND 
			Classname != 'small_garage' AND 
			Classname != 'big_garage' AND 
			Classname != 'object_x';	

			
			SELECT COUNT(*)
			INTO iNumClassExisting
			FROM object_data
			WHERE Instance = sInstance
			AND Classname = @rsClassname;

		END IF;
	END IF;	

	SET iTimeout = iTimeout + 1; 
	IF (iTimeout >= iTimeoutMax) THEN
		SET iNumVehExisting = iVehSpawnMax;
	END IF;
END WHILE;
SET i = i + 1;
END
;;
DELIMITER ;

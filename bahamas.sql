INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_bahamas', 'Bahamas',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_bahamas', 'Bahamas', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_bahamas','Bahamas',1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('bahamas', 'Bahamas', 1)
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	('bahamas', 0, 'videur', 'Videur', 100, '', ''),
	('bahamas', 1, 'barman', 'Barman', 100, '', ''),
	('bahamas', 2, 'boss', 'Patron', 100, '', '')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES
	('punchexotique', 'Punch Exotique', -1),
	('aperolspritz', 'Aperol Spritz', -1),
	('pinacolada', 'Piña Colada', -1),
	('soupeangevine', 'Soupe Angevine', -1),
	('margarita', 'Margarita', -1),
	('bluehawaii', 'Blue Hawaii', -1)
;
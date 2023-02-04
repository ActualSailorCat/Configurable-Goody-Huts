CREATE TRIGGER IF NOT EXISTS Sailor_CGH
AFTER INSERT ON Parameters
WHEN New.ConfigurationId LIKE 'SAILORGC_%' AND New.SortIndex = 9000
BEGIN
	INSERT INTO ConfigurationUpdates
			(SourceGroup,	SourceID,			SourceValue,	TargetGroup,	TargetID,				TargetValue,	Hash,	Static)
	VALUES	('Game',		'SAILORGC_SWITCH',	1,				'Game',			New.ConfigurationId,	1,				0,		0);

	INSERT INTO ConfigurationUpdates
			(SourceGroup,	SourceID,			SourceValue,	TargetGroup,	TargetID,				TargetValue,	Hash,	Static)
	VALUES	('Game',		'SAILORGC_SWITCH',	0,				'Game',			New.ConfigurationId,	0,				0,		0);
END;
-- // Default
CREATE TABLE IF NOT EXISTS SailorGoodyOptions (Type text default null);
INSERT INTO SailorGoodyOptions (Type)
VALUES ('BUILDER'), ('EUREKA'), ('EXPERIENCE'), ('FAITH'), ('GOLD'), ('HEAL'), ('INSPIRATIONS'), ('POPULATION'), ('RELIC'), ('SCOUT'), ('TECH'), ('TRADER');

INSERT INTO Parameters
		(ParameterId,			Name,								Description,							Domain,	DefaultValue, ConfigurationGroup,	ConfigurationId,	GroupId,			SortIndex)
SELECT	'SailorGC_'||Type,		'LOC_SAILORGC_'||Type||'_NAME',		'LOC_SAILORGC_'||Type||'_DESCRIPTION',	'bool', 1,			  'Game',				'SAILORGC_'||Type,	'AdvancedOptions',	9000
FROM SailorGoodyOptions;

INSERT INTO Parameters
		(ParameterId,			Name,								Description,							Domain,	DefaultValue, ConfigurationGroup,	ConfigurationId,	GroupId,			SortIndex)
VALUES	('SailorGC_SETTLER',	'LOC_SAILORGC_SETTLER_NAME',		'LOC_SAILORGC_SETTLER_DESCRIPTION',		'bool', 0,			  'Game',				'SAILORGC_SETTLER',	'AdvancedOptions',	9000),
		('SailorGC_CIVIC',		'LOC_SAILORGC_CIVIC_NAME',			'LOC_SAILORGC_CIVIC_DESCRIPTION',		'bool', 0,			  'Game',				'SAILORGC_CIVIC',	'AdvancedOptions',	9000);
		--('SailorGC_UPGRADE',	'LOC_SAILORGC_UPGRADE_NAME',		'LOC_SAILORGC_UPGRADE_DESCRIPTION',		'bool', 0,			  'Game',				'SAILORGC_UPGRADE',	'AdvancedOptions',	9000);

INSERT INTO Parameters
		(ParameterId,			Name,							Description,							Domain,	DefaultValue, ConfigurationGroup,	ConfigurationId,		GroupId,			SortIndex)
SELECT	'SailorGC_TELEPORT',	'LOC_SAILORGC_TELEPORT_NAME',	'LOC_SAILORGC_TELEPORT_DESCRIPTION',	'bool', 0,			  'Game',				'SAILORGC_TELEPORT',	'AdvancedOptions',	9000
WHERE EXISTS (SELECT ParameterId FROM Parameters WHERE ParameterId = 'SailorGC_UU');

-- // XP2
INSERT INTO Parameters
		(Key1, 		Key2,					ParameterId,			Name,							Description,							Domain,	DefaultValue, ConfigurationGroup,	ConfigurationId,		GroupId,			SortIndex)
VALUES	('Ruleset', 'RULESET_EXPANSION_2', 	'SailorGC_GOVERNOR',	'LOC_SAILORGC_GOVERNOR_NAME',	'LOC_SAILORGC_GOVERNOR_DESCRIPTION',	'bool', 1,			  'Game',				'SAILORGC_GOVERNOR',	'AdvancedOptions',	9000),
		('Ruleset', 'RULESET_EXPANSION_2', 	'SailorGC_ENVOY',		'LOC_SAILORGC_ENVOY_NAME',		'LOC_SAILORGC_ENVOY_DESCRIPTION',		'bool', 1,			  'Game',				'SAILORGC_ENVOY',		'AdvancedOptions',	9000),
		('Ruleset', 'RULESET_EXPANSION_2', 	'SailorGC_FAVOR',		'LOC_SAILORGC_FAVOR_NAME',		'LOC_SAILORGC_FAVOR_DESCRIPTION',		'bool', 1,			  'Game',				'SAILORGC_FAVOR',		'AdvancedOptions',	9000),
		('Ruleset', 'RULESET_EXPANSION_2', 	'SailorGC_STRATEGIC',	'LOC_SAILORGC_STRATEGIC_NAME',	'LOC_SAILORGC_STRATEGIC_DESCRIPTION',	'bool', 1,			  'Game',				'SAILORGC_STRATEGIC',	'AdvancedOptions',	9000);

-- // Misc Settings
INSERT INTO Parameters
		(ParameterId,				Name,								Description,								Domain,	DefaultValue, ConfigurationGroup,	ConfigurationId,			GroupId,			SortIndex)
VALUES	('SailorGC_Turn0',			'LOC_SAILORGC_TURN0_NAME',			'LOC_SAILORGC_TURN0_DESCRIPTION',			'bool', 0,			  'Game',				'SAILORGC_TURN0',			'AdvancedOptions',	8997),
		('SailorGC_Normies',		'LOC_SAILORGC_NORMIES_NAME',		'LOC_SAILORGC_NORMIES_DESCRIPTION',			'bool', 0,			  'Game',				'SAILORGC_NORMIES',			'AdvancedOptions',	8997),
		('SailorGC_Revealed',		'LOC_SAILORGC_REVEALED_NAME',		'LOC_SAILORGC_REVEALED_DESCRIPTION',		'bool', 0,			  'Game',				'SAILORGC_REVEALED',		'AdvancedOptions',	8997),
		('SailorGC_TradeCap',		'LOC_SAILORGC_TRADECAP_NAME',		'LOC_SAILORGC_TRADECAP_DESCRIPTION',		'bool', 0,			  'Game',				'SAILORGC_TRADECAP',		'AdvancedOptions',	8997),
		('SailorGC_Notifications',	'LOC_SAILORGC_NOTIFICATIONS_NAME',	'LOC_SAILORGC_NOTIFICATIONS_DESCRIPTION',	'bool', 0,			  'Game',				'SAILORGC_NOTIFICATIONS',	'AdvancedOptions',	8997);
		--('SailorGC_Moment',		'LOC_SAILORGC_MOMENT_NAME',		'LOC_SAILORGC_MOMENT_DESCRIPTION',		'bool', 0,			  'Game',				'SAILORGC_MOMENT',		'AdvancedOptions',	8998);

-- // Frequency Drop Down
INSERT INTO DomainValues
		(Domain,				Value,	Name,									Description,								SortIndex)
VALUES	('SailorGC_Frequency',	25,		'LOC_SAILORGC_FREQUENCY_025_NAME',		'LOC_SAILORGC_FREQUENCY_025_DESCRIPTION',	10),
		('SailorGC_Frequency',	50,		'LOC_SAILORGC_FREQUENCY_050_NAME',		'LOC_SAILORGC_FREQUENCY_050_DESCRIPTION',	20),
		('SailorGC_Frequency',	75,		'LOC_SAILORGC_FREQUENCY_075_NAME',		'LOC_SAILORGC_FREQUENCY_075_DESCRIPTION',	30),
		('SailorGC_Frequency',	100,	'LOC_SAILORGC_FREQUENCY_100_NAME',		'LOC_SAILORGC_FREQUENCY_100_DESCRIPTION',	40),
		('SailorGC_Frequency',	125,	'LOC_SAILORGC_FREQUENCY_125_NAME',		'LOC_SAILORGC_FREQUENCY_125_DESCRIPTION',	50),
		('SailorGC_Frequency',	150,	'LOC_SAILORGC_FREQUENCY_150_NAME',		'LOC_SAILORGC_FREQUENCY_150_DESCRIPTION',	60),
		('SailorGC_Frequency',	175,	'LOC_SAILORGC_FREQUENCY_175_NAME',		'LOC_SAILORGC_FREQUENCY_175_DESCRIPTION',	70),
		('SailorGC_Frequency',	200,	'LOC_SAILORGC_FREQUENCY_200_NAME',		'LOC_SAILORGC_FREQUENCY_200_DESCRIPTION',	80),
		('SailorGC_Frequency',	300,	'LOC_SAILORGC_FREQUENCY_300_NAME',		'LOC_SAILORGC_FREQUENCY_300_DESCRIPTION',	90),
		('SailorGC_Frequency',	400,	'LOC_SAILORGC_FREQUENCY_400_NAME',		'LOC_SAILORGC_FREQUENCY_400_DESCRIPTION',	100),
		('SailorGC_Frequency',	500,	'LOC_SAILORGC_FREQUENCY_500_NAME',		'LOC_SAILORGC_FREQUENCY_500_DESCRIPTION',	110),
		('SailorGC_Frequency',	1000,	'LOC_SAILORGC_FREQUENCY_1000_NAME',		'LOC_SAILORGC_FREQUENCY_1000_DESCRIPTION',	120),
		('SailorGC_Frequency',	2000,	'LOC_SAILORGC_FREQUENCY_2000_NAME',		'LOC_SAILORGC_FREQUENCY_2000_DESCRIPTION',	130),
		('SailorGC_XP',			0,		'LOC_SAILORGC_XP_0_NAME',				'LOC_SAILORGC_XP_0_DESCRIPTION',			10),
		('SailorGC_XP',			1,		'LOC_SAILORGC_XP_1_NAME',				'LOC_SAILORGC_XP_1_DESCRIPTION',			20),
		('SailorGC_XP',			2,		'LOC_SAILORGC_XP_2_NAME',				'LOC_SAILORGC_XP_2_DESCRIPTION',			30),
		('SailorGC_XP',			5,		'LOC_SAILORGC_XP_5_NAME',				'LOC_SAILORGC_XP_5_DESCRIPTION',			40),
		('SailorGC_XP',			10,		'LOC_SAILORGC_XP_10_NAME',				'LOC_SAILORGC_XP_10_DESCRIPTION',			50),
		('SailorGC_XP',			100,	'LOC_SAILORGC_XP_N_NAME',				'LOC_SAILORGC_XP_N_DESCRIPTION',			60),
		('SailorGC_Yields',		1,		'LOC_SAILORGC_YIELDS_1_NAME',			'LOC_SAILORGC_YIELDS_1_DESCRIPTION',		10),
		('SailorGC_Yields',		2,		'LOC_SAILORGC_YIELDS_2_NAME',			'LOC_SAILORGC_YIELDS_2_DESCRIPTION',		20),
		('SailorGC_Yields',		5,		'LOC_SAILORGC_YIELDS_5_NAME',			'LOC_SAILORGC_YIELDS_5_DESCRIPTION',		30),
		('SailorGC_Yields',		10,		'LOC_SAILORGC_YIELDS_10_NAME',			'LOC_SAILORGC_YIELDS_10_DESCRIPTION',		40),
		('SailorGC_Yields',		20,		'LOC_SAILORGC_YIELDS_20_NAME',			'LOC_SAILORGC_YIELDS_20_DESCRIPTION',		50),
		('SailorGC_Yields',		100,	'LOC_SAILORGC_YIELDS_100_NAME',			'LOC_SAILORGC_YIELDS_100_DESCRIPTION',		60);

INSERT INTO Parameters
		(ParameterId,			Name,							Description,							Domain,					DefaultValue, 	ConfigurationGroup,	ConfigurationId,		GroupId,			SortIndex)
VALUES	('SailorGC_Frequency',	'LOC_SAILORGC_FREQUENCY_NAME',	'LOC_SAILORGC_FREQUENCY_DESCRIPTION',	'SailorGC_Frequency',	100,		  	'Game',				'SAILORGC_FREQUENCY',	'AdvancedOptions',	8998),
		('SailorGC_XP',			'LOC_SAILORGC_XP_NAME',			'LOC_SAILORGC_XP_DESCRIPTION',			'SailorGC_XP',			1,			  	'Game',				'SAILORGC_XP',			'AdvancedOptions',	8998),
		('SailorGC_Yields',		'LOC_SAILORGC_YIELDS_NAME',		'LOC_SAILORGC_YIELDS_DESCRIPTION',		'SailorGC_Yields',		1,			  	'Game',				'SAILORGC_YIELDS',		'AdvancedOptions',	8998);

-- Will check or uncheck all goody hut types. Thanks to Zegangani for the method.
INSERT INTO Parameters
		(ParameterId,			Name,							Description,							Domain,	DefaultValue, ConfigurationGroup,	ConfigurationId,	GroupId,			SortIndex)
VALUES	('SailorGC_Switch',		'LOC_SAILORGC_SWITCH_NAME',		'LOC_SAILORGC_SWITCH_DESCRIPTION',		'bool', 0,			  'Game',				'SAILORGC_SWITCH',	'AdvancedOptions',	8999);

-- Cleanup
DROP TABLE SailorGoodyOptions;
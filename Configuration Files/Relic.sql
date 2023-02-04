UPDATE GoodyHutSubTypes SET Weight = 0 WHERE SubTypeGoodyHut LIKE '%RELIC%';
-- Relics Plus
CREATE TRIGGER Sailor_RelicsPlusNil AFTER INSERT ON GoodyHuts WHEN NEW.GoodyHutType = 'GOODYHUT_SAILOR_RELIC'
BEGIN
	UPDATE GoodyHuts SET Weight = 0 WHERE GoodyHutType = 'GOODYHUT_SAILOR_RELIC';
END;
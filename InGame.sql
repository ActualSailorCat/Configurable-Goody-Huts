UPDATE GoodyHutSubTypes SET MinOneCity = 0 WHERE GoodyHut = 'GOODY_GOLD' OR GoodyHut = 'GOODY_FAITH';
UPDATE GoodyHutSubTypes SET Trader = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_GRANT_TRADER'; -- No longer need to have gotten a trader to receive a trader. Thanks to Good Goody Huts for this.
-- // The following will disable a type of goody hut if all of that type's
-- // subtypes have been disabled.

-- // Default
UPDATE GoodyHuts SET Weight = 0 WHERE GoodyHutType = 'GOODYHUT_CULTURE' AND
((SELECT COUNT(*) FROM GoodyHutSubTypes WHERE GoodyHut = 'GOODYHUT_CULTURE' AND Weight > 0) = 0);
DELETE FROM GoodyHutSubTypes WHERE GoodyHut = 'GOODYHUT_CULTURE' AND
((SELECT COUNT(*) FROM GoodyHutSubTypes WHERE GoodyHut = 'GOODYHUT_CULTURE' AND Weight > 0) = 0);
DELETE FROM GoodyHuts WHERE GoodyHutType = 'GOODYHUT_CULTURE' AND
((SELECT COUNT(*) FROM GoodyHutSubTypes WHERE GoodyHut = 'GOODYHUT_CULTURE' AND Weight > 0) = 0);

UPDATE GoodyHuts SET Weight = 0 WHERE GoodyHutType = 'GOODYHUT_GOLD' AND
((SELECT COUNT(*) FROM GoodyHutSubTypes WHERE GoodyHut = 'GOODYHUT_GOLD' AND Weight > 0) = 0);

UPDATE GoodyHuts SET Weight = 0 WHERE GoodyHutType = 'GOODYHUT_FAITH' AND
((SELECT COUNT(*) FROM GoodyHutSubTypes WHERE GoodyHut = 'GOODYHUT_FAITH' AND Weight > 0) = 0);

UPDATE GoodyHuts SET Weight = 0 WHERE GoodyHutType = 'GOODYHUT_MILITARY' AND
((SELECT COUNT(*) FROM GoodyHutSubTypes WHERE GoodyHut = 'GOODYHUT_MILITARY' AND Weight > 0) = 0);

UPDATE GoodyHuts SET Weight = 0 WHERE GoodyHutType = 'GOODYHUT_SCIENCE' AND
((SELECT COUNT(*) FROM GoodyHutSubTypes WHERE GoodyHut = 'GOODYHUT_SCIENCE' AND Weight > 0) = 0);

UPDATE GoodyHuts SET Weight = 0 WHERE GoodyHutType = 'GOODYHUT_SURVIVORS' AND
((SELECT COUNT(*) FROM GoodyHutSubTypes WHERE GoodyHut = 'GOODYHUT_SURVIVORS' AND Weight > 0) = 0);

-- // XP2
UPDATE GoodyHuts SET Weight = 0 WHERE GoodyHutType = 'GOODYHUT_DIPLOMACY' AND
((SELECT COUNT(*) FROM GoodyHutSubTypes WHERE GoodyHut = 'GOODYHUT_DIPLOMACY' AND Weight > 0) = 0)
AND EXISTS (SELECT GoodyHutType FROM GoodyHuts WHERE GoodyHutType = 'GOODYHUT_DIPLOMACY');

-- // Wondrous Goody Huts
UPDATE GoodyHuts SET Weight = 0 WHERE GoodyHutType = 'GOODYHUT_SAILOR_WONDROUS' AND
((SELECT COUNT(*) FROM GoodyHutSubTypes WHERE GoodyHut = 'GOODYHUT_SAILOR_WONDROUS' AND Weight > 0) = 0)
AND EXISTS (SELECT GoodyHutType FROM GoodyHuts WHERE GoodyHutType = 'GOODYHUT_SAILOR_WONDROUS');
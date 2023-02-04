UPDATE GoodyHutSubTypes SET Weight = 0 WHERE SubTypeGoodyHut LIKE '%GOLD';
UPDATE GoodyHuts SET Weight = 0 WHERE GoodyHutType = 'GOODYHUT_GOLD';
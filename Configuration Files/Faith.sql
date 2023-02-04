UPDATE GoodyHutSubTypes SET Weight = 0 WHERE SubTypeGoodyHut LIKE '%FAITH';
UPDATE GoodyHuts SET Weight = 0 WHERE GoodyHutType = 'GOODYHUT_FAITH';
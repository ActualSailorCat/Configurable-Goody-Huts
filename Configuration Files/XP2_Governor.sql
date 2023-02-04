UPDATE GoodyHutSubTypes SET Weight = 0 WHERE SubTypeGoodyHut LIKE '%GOVERNOR%'
AND EXISTS (SELECT SubTypeGoodyHut FROM GoodyHutSubTypes WHERE SubTypeGoodyHut = 'GOODYHUT_GOVERNOR_TITLE');
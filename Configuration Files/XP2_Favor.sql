UPDATE GoodyHutSubTypes SET Weight = 0 WHERE SubTypeGoodyHut = 'GOODYHUT_FAVOR'
AND EXISTS (SELECT SubTypeGoodyHut FROM GoodyHutSubTypes WHERE SubTypeGoodyHut = 'GOODYHUT_FAVOR');
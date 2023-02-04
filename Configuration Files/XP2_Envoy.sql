UPDATE GoodyHutSubTypes SET Weight = 0 WHERE SubTypeGoodyHut LIKE '%ENVOY%';
AND EXISTS (SELECT SubTypeGoodyHut FROM GoodyHutSubTypes WHERE SubTypeGoodyHut = 'GOODYHUT_ENVOY');
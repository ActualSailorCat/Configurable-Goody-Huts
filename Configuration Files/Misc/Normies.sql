-- LoadOrder must be after toggles but before InGame.sql.
UPDATE GoodyHutSubTypes SET Weight = 100 WHERE Weight > 0 AND GoodyHut LIKE 'GOODYHUT%';
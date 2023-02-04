local goodyTbl =	{{Hash=-317814676,	Phrase="sent you a Builder.",									Type="GOODYHUT_GRANT_BUILDER"},
					{Hash=1690880565,	Phrase="stirred in your artists understanding of a Civic.",		Type="GOODYHUT_SAILOR_ONE_CIVIC"},
					{Hash=-897059678,	Phrase="given your unit experience.",							Type="GOODYHUT_GRANT_EXPERIENCE"},
					{Hash=51039867,		Phrase="imparted your scholars with a Eureka.",					Type="GOODYHUT_ONE_TECH_BOOST"},
					{Hash=1570455183,	Phrase="imparted your scholars with two Eurekas.",				Type="GOODYHUT_TWO_TECH_BOOSTS"},
					{Hash=313124344,	Phrase="slightly strengthened the Faith of your people.",		Type="GOODYHUT_SMALL_FAITH"},
					{Hash=173418224,	Phrase="strengthened the Faith of your people.",				Type="GOODYHUT_MEDIUM_FAITH"},
					{Hash=1747194442,	Phrase="greatly strengthened the Faith of your people.",		Type="GOODYHUT_LARGE_FAITH"},
					{Hash=-842336157,	Phrase="relinquished secrets that led to Diplomatic Favor.",	Type="GOODYHUT_FAVOR"},
					{Hash=-856816033,	Phrase="paid tribute in a paltry sum of Gold.",					Type="GOODYHUT_SMALL_GOLD"},
					{Hash=-2073396856,	Phrase="paid tribute in a sum of Gold.",						Type="GOODYHUT_MEDIUM_GOLD"},
					{Hash=725818580,	Phrase="paid tribute in a generous sum of Gold.",				Type="GOODYHUT_LARGE_GOLD"},
					{Hash=-1140666915,	Phrase="bestowed upon your Governor a new title.",				Type="GOODYHUT_GOVERNOR_TITLE"},
					{Hash=1721956964,	Phrase="rubbed your unit with healing unguents.",				Type="GOODYHUT_HEAL"},
					{Hash=-1593446804,	Phrase="stirred in your artists an Inspiration.",				Type="GOODYHUT_ONE_CIVIC_BOOST"},
					{Hash=-367235253,	Phrase="stirred in your artists two Inspirations.",				Type="GOODYHUT_TWO_CIVIC_BOOSTS"},
					{Hash=1038837136,	Phrase="relocated to your city, increasing its Population.",	Type="GOODYHUT_ADD_POP"},
					{Hash=2109989822,	Phrase="entrusted you with a treasured Relic.",					Type="GOODYHUT_ONE_RELIC"},
					{Hash=-945185595,	Phrase="sent you a Scout.",										Type="GOODYHUT_GRANT_SCOUT"},
					{Hash=750739574,	Phrase="sent you a Settler.",									Type="GOODYHUT_GRANT_SETTLER"},
					{Hash=-1085383998,	Phrase="bolstered your cache of a Strategic Resource.",			Type="GOODYHUT_RESOURCES"},
					{Hash=294222921,	Phrase="imparted your scholars understanding of a Technology.", Type="GOODYHUT_ONE_TECH"},
					{Hash=-2134131563,	Phrase="sent you a Trader.",									Type="GOODYHUT_GRANT_TRADER"},
					-- Wondrous Goody Huts
					{Hash=1379672131,	Phrase="introduced you to a new City-State.",					Type="GOODYHUT_SAILOR_CITYSTATE"},
					{Hash=-861896920,	Phrase="joined your unit on a far-flung expedition.",			Type="GOODYHUT_SAILOR_TELEPORT"},
					{Hash=260349556,	Phrase="taught your unit a new Formation.",						Type="GOODYHUT_SAILOR_FORMATION"},
					{Hash=-2106477136,	Phrase="built an improvement within your borders.",				Type="GOODYHUT_SAILOR_RANDOMIMPROVEMENT"},
					{Hash=1157765560,	Phrase="helped your lawmakers to make a new Policy.",			Type="GOODYHUT_SAILOR_RANDOMPOLICY"},
					{Hash=913875234,	Phrase="provided manpower needed to finish your Production.",	Type="GOODYHUT_SAILOR_PRODUCTION"},
					--{Hash=1999084244,	Phrase="Notification exists in Wondrous.",						Type="GOODYHUT_SAILOR_RANDOMRESOURCE"},
					{Hash=-2099557375,	Phrase="sent you a Spy.",										Type="GOODYHUT_SAILOR_SPY"},
					{Hash=1625079733,	Phrase="sent you a unique unit.",								Type="GOODYHUT_SAILOR_RANDOMUNIT"},
					{Hash=-1461129027,	Phrase="given your unit greatly enhanced sight.",				Type="GOODYHUT_SAILOR_SIGHTBOMB"},
					{Hash=-2028412409,	Phrase="drawn for you a map to a natural wonder.",				Type="GOODYHUT_SAILOR_WONDER"}
					}

local notifSwap = 0
function Sailor_CGH_Notifications(playerID, unitID, GoodyHash, SubGoodyHash)
	if Players[playerID]:IsHuman() then
		for i, goody in ipairs(goodyTbl) do
			if goody.Hash == SubGoodyHash then
				print(goody.Type)
				-- // UI Notification...
				local notifType = NotificationTypes.USER_DEFINED_6
				if notifSwap == 0 then
					notifType = NotificationTypes.USER_DEFINED_6
					notifSwap = 1
				else
					notifType = NotificationTypes.USER_DEFINED_9
					notifSwap = 0
				end
				local notifText	= Locale.Lookup("A tribal village sends gifts.")
				local notifDesc	= "A tribal village has " .. goody.Phrase
				NotificationManager.SendNotification(playerID, notifType, notifText, notifDesc, nil, nil)
				return
			end
		end
	end
end
Events.GoodyHutReward.Add(Sailor_CGH_Notifications)
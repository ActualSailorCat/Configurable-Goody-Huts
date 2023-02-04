function Sailor_CGH_Capacity(playerID, unitID, GoodyHash, SubGoodyHash)
	if SubGoodyHash == -2134131563 then
		local pPlayer = Players[playerID]
		pPlayer:AttachModifierByID("CIVIC_GRANT_ONE_TRADE_ROUTE")
	end
end
Events.GoodyHutReward.Add(Sailor_CGH_Capacity)
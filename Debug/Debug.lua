-- // Debug... that became an option.
local sailorInContinents = Map.GetContinentsInUse()
for i, k in ipairs(sailorInContinents) do
	local sailorInContinentPlots = Map.GetContinentPlots(k)
	for i, v in ipairs(sailorInContinentPlots) do
		local sPlot = Map.GetPlotByIndex(v)
		if sPlot:GetImprovementType() ~= -1 then
			if GameInfo.Improvements[sPlot:GetImprovementType()].ImprovementType == "IMPROVEMENT_GOODY_HUT" then
				for i, p in ipairs(PlayerManager.GetAliveMajorIDs()) do
					local sPlayerVisibility = PlayersVisibility[p]
					sPlayerVisibility:ChangeVisibilityCount(sPlot, 1)
				end
			end
		end
	end
end
local Players = game:GetService("Players")
local DataManager = require(game.ServerScriptService.DataManager)

Players.PlayerAdded:Connect(function(player)
	local profile = DataManager.LoadProfile(player)
	if not profile then
		player:Kick("Failed to load your data.")
		return
	end

	local data = profile.Data

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local coins = Instance.new("IntValue")
	coins.Name = "Coins"
	coins.Value = data.Cash
	coins.Parent = leaderstats

	local rebirths = Instance.new("IntValue")
	rebirths.Name = "Rebirths"
	rebirths.Value = data.Rebirths
	rebirths.Parent = leaderstats

	local multiplier = Instance.new("NumberValue")
	multiplier.Name = "Multiplier"
	multiplier.Value = data.Multiplier
	multiplier.Parent = player

	-- Keep values updated
	coins:GetPropertyChangedSignal("Value"):Connect(function()
		profile.Data.Cash = coins.Value
	end)

	rebirths:GetPropertyChangedSignal("Value"):Connect(function()
		profile.Data.Rebirths = rebirths.Value
	end)

	multiplier:GetPropertyChangedSignal("Value"):Connect(function()
		profile.Data.Multiplier = multiplier.Value
	end)
end)

Players.PlayerRemoving:Connect(function(player)
	DataManager.ReleaseProfile(player)
end)

game:BindToClose(function()
	for _, player in ipairs(Players:GetPlayers()) do
		DataManager.ReleaseProfile(player)
	end
end)

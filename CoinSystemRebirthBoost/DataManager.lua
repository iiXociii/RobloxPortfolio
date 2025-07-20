local ProfileService = require(game.ServerScriptService.ProfileServiceFolder.ProfileService)

local DATA_KEY = "PlayerData"
local ProfileStore = ProfileService.GetProfileStore(DATA_KEY, {
	Cash = 0,
	Rebirths = 0,
	Multiplier = 1
})

local DataManager = {}
local Profiles = {}

function DataManager.GetProfile(player)
	return Profiles[player]
end

function DataManager.LoadProfile(player)
	local profile = ProfileStore:LoadProfileAsync("Player_" .. player.UserId)

	if profile then
		profile:AddUserId(player.UserId)
		profile:Reconcile()
		Profiles[player] = profile

		profile:ListenToRelease(function()
			Profiles[player] = nil
			player:Kick("Your data was loaded elsewhere.")
		end)

		if not player:IsDescendantOf(game.Players) then
			profile:Release()
		end

		return profile
	else
		return nil
	end
end

function DataManager.ReleaseProfile(player)
	local profile = Profiles[player]
	if profile then
		profile:Release()
	end
end

return DataManager

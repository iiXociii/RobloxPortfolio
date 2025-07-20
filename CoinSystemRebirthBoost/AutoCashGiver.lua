local Players = game:GetService("Players")
local UpdateCashEvent = game.ReplicatedStorage:WaitForChild("UpdateCash")

local CASH_INTERVAL = 1 --Seconds it takes to give cash
local BASE_CASH = 100 --Amount of Cash player receives

local function GetFriendCount(player)
	local count = 0
	for _, otherPlayer in ipairs(Players:GetPlayers()) do
		if otherPlayer ~= player and player:IsFriendsWith(otherPlayer.UserId) then
			count += 1
		end
	end
	return math.min(count, 5)
end

Players.PlayerAdded:Connect(function(player)
	local leaderstats = player:WaitForChild("leaderstats")
	local coins = leaderstats:WaitForChild("Coins")
	local multiplier = player:WaitForChild("Multiplier")

	task.spawn(function()
		while player and player.Parent do
			local rebirthMult = multiplier.Value
			local friendBoost = GetFriendCount(player) * 0.05
			local totalMult = rebirthMult + friendBoost

			local gain = math.floor(BASE_CASH * totalMult)
			coins.Value += gain

			UpdateCashEvent:FireClient(player, {
				Gain = gain,
				RebirthMult = rebirthMult,
				FriendBoost = friendBoost,
				TotalMult = totalMult
			})

			wait(CASH_INTERVAL)
		end
	end)
end)

local rebirthEvent = game.ReplicatedStorage:WaitForChild("RequestRebirth")

rebirthEvent.OnServerEvent:Connect(function(player)
	local stats = player:FindFirstChild("leaderstats")
	local multiplier = player:FindFirstChild("Multiplier")
	if not stats or not multiplier then return end

	local coins = stats:FindFirstChild("Coins")
	local rebirths = stats:FindFirstChild("Rebirths")
	if not coins or not rebirths then return end

	local cost = 1000 * (rebirths.Value + 1)

	if coins.Value >= cost then
		coins.Value = 0
		rebirths.Value += 1
		multiplier.Value = 1 + (rebirths.Value * 0.1)
	end
end)

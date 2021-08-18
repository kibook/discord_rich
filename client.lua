local discordAppId = 753326351276310629

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local playerName = GetPlayerName(PlayerId())
		local playerCoords = GetEntityCoords(playerPed)
		local health = GetEntityHealth(playerPed)

		SetDiscordAppId(discordAppId)

		local zone = GetLabelText(GetNameOfZone(playerCoords))

		local street, crossing = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		local streetName = GetStreetNameFromHashKey(street)
		local crossingName = GetStreetNameFromHashKey(crossing)
		local road
		if crossingName ~= "" then
			road = streetName .. " & " .. crossingName
		else
			road = streetName
		end

		local loation = road .. ", " .. zone

		SetRichPresence(location)

		SetDiscordRichPresenceAsset("icon")
		SetDiscordRichPresenceAssetText(playerName)

		SetDiscordRichPresenceAssetSmall("icon")
		SetDiscordRichPresenceAssetSmallText("Health: " .. health)

		SetDiscordRichPresenceAction(0, "Join", "https://cfx.re/join/8l4kjb")
		SetDiscordRichPresenceAction(1, "Website", "https://fivem.khzae.net")

		Citizen.Wait(5000)
	end
end)

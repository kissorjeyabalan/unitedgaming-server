function getAdmins()
	local players = exports.pool:getPoolElementsByType("player")
	
	local admins = { }
	
	for key, value in ipairs(players) do
		if isPlayerSuspendedAdmin(value) and getPlayerAdminLevel(value) <= 7 then
			table.insert(admins,value)
		end
	end
	return admins
end

function isPlayerSuspendedAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 1
end

function isPlayerAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 2
end

function isPlayerFullAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 3
end

function isPlayerSuperAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 4
end

function isPlayerHeadAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 6
end

function isPlayerLeadAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 5
end

function getPlayerAdminLevel(thePlayer)
	return isElement( thePlayer ) and tonumber(getElementData(thePlayer, "adminlevel")) or 0
end

--local adminTitles = { "Suspended Admin", "Trial Admin", "Admin", "Super Admin", "Lead Admin", "Head Admin", "Owner" }
local adminTitles = {
	["1"] = "Suspended Admin", 
	["2"] = "Trial Admin", 
	["3"] = "Admin", 
	["4"] = "Super Admin", 
	["5"] = "Lead Admin", 
	["6"] = "Head Admin", 
		["6.000000000001"] = "Server Owner 0.1434539e3",
	["7"] = "Server Owner",
	["11"] = "Cutie",
	["11.56"] = "Anthony's Slut"
}
function getPlayerAdminTitle(thePlayer)
	local text = adminTitles[""..tostring(getPlayerAdminLevel(thePlayer))..""] or "Player"
		
	local hiddenAdmin = getElementData(thePlayer, "hiddenadmin") or 0
	if (hiddenAdmin==1) then
		text = text .. " (Hidden)"
	end

	return text
end

--[[ GM ]]--
function getGameMasters()
	local players = exports.pool:getPoolElementsByType("player")
	local gameMasters = { }
	for key, value in ipairs(players) do
		if isPlayerGameMaster(value) then
			table.insert(gameMasters, value)
		end
	end
	return gameMasters
end

function isPlayerGameMaster(thePlayer)
	return getPlayerGameMasterLevel(thePlayer) >= 1
end

function isPlayerFullGameMaster(thePlayer)
	return getPlayerGameMasterLevel(thePlayer) >= 2
end

function isPlayerSeniorGameMaster(thePlayer)
	return getPlayerGameMasterLevel(thePlayer) >= 3
end
	
function isPlayerLeadGameMaster(thePlayer)
	return getPlayerGameMasterLevel(thePlayer) >= 4
end

function isPlayerHeadGameMaster(thePlayer)
	return getPlayerGameMasterLevel(thePlayer) >= 5
end

function getPlayerGameMasterLevel(thePlayer)
	return isElement( thePlayer ) and tonumber(getElementData(thePlayer, "account:gmlevel")) or 0
end

function isPlayerGMTeamLeader(thePlayer)
	if not isPlayerFullAdmin(thePlayer) and not isPlayerHeadGameMaster(thePlayer) then
		return false
	end
	return exports.donators:hasPlayerPerk(thePlayer,17)
end

local GMtitles = { "Trial GameMaster", "GameMaster", "Senior GameMaster", "Lead GameMaster", "Head GameMaster" }
function getPlayerGMTitle(thePlayer)
	local text = GMtitles[getPlayerGameMasterLevel(thePlayer)] or "Player"
	return text
end
--[[ /GM ]]--

local scripters = {
	tamfire = true,
	Chuevo = true,
	Anthony = true,
	Maxime = true,
	Piranha = true
}

local lvl2scripters = {
	Jevi = true,
	Exciter = true,
	Weimy = true
	--Anthony = true
}

function isPlayerLvl2Scripter(thePlayer)
	return lvl2scripters[thePlayer] or lvl2scripters[ getElementData(thePlayer, "account:username") or "nobody" ] or false
end

function isPlayerScripter(thePlayer)
	return scripters[thePlayer] or scripters[ getElementData(thePlayer, "account:username") or "nobody" ] or false
end

local factionreviewteam = {
	-- Maxime = true,
	-- Liam = true,
	-- FireBird = true,
}

function isPlayerFRT(thePlayer)
	return factionreviewteam[thePlayer] or factionreviewteam[ getElementData(thePlayer, "account:username") or "nobody" ] or false
end
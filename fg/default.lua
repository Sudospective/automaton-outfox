-- Original default.xml by 0b5vr
-- Converted to OutFox and edited by Sudospective

local env = setmetatable({}, {__index = _G})
env.env = env
_ENV = env

return Def.ActorFrame {
	Name = 'Root',
	FOV = 60,
	InitCommand = function(self)
		-- initialize mods
		songpos = GAMESTATE:GetSongPosition()
		poptions = {
			GAMESTATE:GetPlayerState(PLAYER_1):GetPlayerOptions('ModsLevel_Song'),
			GAMESTATE:GetPlayerState(PLAYER_2):GetPlayerOptions('ModsLevel_Song'),
		}
		for pn = 1, #poptions do
			if poptions[pn] then poptions[pn]:FromString('*-1 clearall, *-1 overhead, *-1 1x, *-1 zbuffer') end
		end
	end,
	Def.ActorFrame {
		Name = 'Core',
		OnCommand = function(self)
			-- load required libraries
			local songDir = GAMESTATE:GetCurrentSong():GetSongDir()
			loadfile(songDir..'fg/libs/json.lua')()
			loadfile(songDir..'fg/libs/automaton.lua')()

			-- load fx definitions
			local fxs = {
				sine = loadfile(songDir..'fg/fxs/sine.lua')(),
			}

			-- import and decode mods.json
			local f = RageFileUtil.CreateRageFile()
			f:Open(songDir..'fg/mods.json', 1)
			mods = Automaton.new(json.decode(f:Read()), {fxDefinitions = fxs})
			f:Close()
			f:destroy()

			-- map channels to modifiers
			local tmp = {mods = {}}
			P1, P2 = DeepCopy(tmp), DeepCopy(tmp)
			for k, _ in pairs(mods.mapNameToChannel) do
				local pn = tonumber(string.sub(k, 2, 2))
				if string.find(k, 'mods') then
					mods.auto(k, function(event)
						local mod = string.lower(string.sub(k, string.find(k, 'mods') + 5))
						local amp = 100 * event.value
						poptions[pn]:FromString('*-1 '..amp..' '..mod)
					end)
				elseif string.find(k, 'pos') then
					mods.auto(k, function(event)
						local axis = string.lower(string.sub(k, string.find(k, 'pos') + 4))
						local amp = (env['SCREEN_CENTER_'..string.upper(axis)] * 2 or 1000) * event.value
						local plr = SCREENMAN:GetTopScreen():GetChild('PlayerP'..pn)
						plr[axis](plr, amp)
					end)
				elseif string.find(k, 'rot') then
					mods.auto(k, function(event)
						local axis = string.lower(string.sub(k, string.find(k, 'rot') + 4))
						local amp = 360 * event.value
						local plr = SCREENMAN:GetTopScreen():GetChild('PlayerP'..pn)
						plr['rotation'..axis](plr, amp)
					end)
				end
			end

			-- set update command
			self
				:effectclock('music')
				:SetUpdateFunction(function()
					_ENV = env
					-- get song time
					local time
					if songpos then
						time = songpos:GetMusicSeconds()
					end
					-- update automaton
					mods:update(time)
				end)
		end,
	},
	Def.ActorFrame {
		Name = 'Layers',
	},
	Def.Actor {
		Name = 'Permafrost',
		InitCommand = function(self)
			self:sleep(9e9)
		end,
	},
}

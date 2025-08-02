--!nocheck
--!native
-- Author: @WATDAHECKLOL32
-- Date: 7/29/25
-- Version: 1.0.0
-- Info:    Since I got banned from S19 you know what time it is.
-- hai thunder hai mason :333333333333
local Library = loadstring(
	game:HttpGet("https://raw.githubusercontent.com/WATDAHECKLOL-Studios/Open-Source/refs/heads/main/Exploits/Archives/S.C.P.%20Site-19%20Roleplay/gosh.luau")
)();
local getgc = getgc;
local task = task;

local lua_gc = getgc(true);
local send_message;
local spawn = task.spawn;
local wait = task.wait;

local delay = task.delay;
local is_lua_func = islclosure;
local StarterGui: StarterGui = cloneref(game:GetService("StarterGui"));
local Players: Players = cloneref(game:GetService("Players"));

local RunService: RunService = cloneref(game:GetService("RunService"));
local Player = Players.LocalPlayer :: Player;
local table = table;

local tesla_spam: boolean = false;
local infinite_run: boolean = false;
if getgenv().gui_ran then
	StarterGui:SetCore("SendNotification", {
		Title = "[⚠️]";
		Text = "Gui already ran";
	});
	return;
end;
getgenv().gui_ran = true;
local network;
for _,v in lua_gc do
	if type(v) == 'table' and rawget(v, "InvokeServer") and rawget(v, "FireServer") then
		network = v;
	end;
	if type(v) == 'function' and is_lua_func(v) then
		local func_name = debug.info(v, "n");
		if func_name == "sendMessage" then
			send_message = v;
		end;
	end;
end;
-- when my encryption sys so good the client can decode it
local decode_args;  decode_args = @native function(encoded: string, key: {number}, extra: number): string
	local decoded: string = "";
	local cut_off: number = #encoded;
	if not extra then
		cut_off = #encoded - key[5] ;
	end;
	for i = 1, cut_off do
		for mod = 0, 3 do
			if i % 4 == mod then
				local char: string = string.sub(encoded, i, i);
				local off_set: number = key[mod + 1];
				local code: number = string.byte(char) - 32;
				if extra then
					off_set = -off_set;
				end;
				local original: number = (code - off_set) % 95 + 32;
				decoded = decoded .. string.char(original);
				break;
			end;
		end;
	end;
	return decoded;
end;
local Frame = Library:CreateWindow({
	Title = "S19 Gui by WATDAHECKLOL32 (DrBloop) and whiz.sk, lightstrikevex",
	Center = true, 
	AutoShow = true, 
});
local Tabs = {
	Main = Frame:AddTab("Main"),
	Currency = Frame:AddTab("Currency");
	Helpful = Frame:AddTab("Utilities");
	Teleport = Frame:AddTab("Teleport");
};
wait(1);


local Try: number = 17;
local teleport_to_location; teleport_to_location = @native function(Cframe: CFrame)
	for i: number = 1, Try do
		wait();
		if not Player or not Player.Character or not Player.Character:FindFirstChild("Humanoid") then
			continue;
		end;
		Player.Character:PivotTo(CFrame.new(538.700073, 34, -190.999969, 0, 1, 0, 0, 0, 1, 1, 0, 0));
	end;

	wait(0.2);
	for i: number = 1, Try do
		task.wait();
		if not Player or not Player.Character or not Player.Character:FindFirstChild("Humanoid") then
			continue;
		end;
		Player.Character:PivotTo(Cframe);
	end;
end;

local teleport_locations: {[string]: CFrame} = {
	["Tower"] =  CFrame.new(548, 557, 848);
	["CI Base"] = CFrame.new(830, 500, 875);
	["106 CC"] = CFrame.new(655.999939, -5.89998817, -374.19989, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["Medical bay"] = CFrame.new(830, 8.99999809, 182.000061, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["Cafe"] = CFrame.new(583, 3.50000334, 210.000031, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["SD bay"] = CFrame.new(431.999969, 9.5, 82.0000458, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["MTF spawn"] = CFrame.new(763.000183, 489.698029, 429.000183, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["MTF armory"] = CFrame.new(830.321289, 489.5, 419.206696, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["CDC"] = CFrame.new(1008, 16.5, -171, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["Control room"] = CFrame.new(375.999908, 24.4999962, 191.000031, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["Gate A"]  = CFrame.new(383.5, 7.5, 292.000031, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["Gate B"] = CFrame.new( 718, 8.5, 248.000031, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["Shelter 1"] = CFrame.new(529, 8.50000095, 78.1768188, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["Warhead"] = CFrame.new(623.999939, -17.4999905, -297.999847, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["Court room"] = CFrame.new(911.927917, 8.5, 150.66571, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["173 CC"] = CFrame.new(1016, 24.5, -66.9999847, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["SCD spawn"] = CFrame.new( 871.999939, 8.5, 199.999985, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["079 CC"] = CFrame.new(828.999939, 0.5, -254.499969, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["008 CC"] = CFrame.new(356.257416, 8.50000763, -335.106445, 1, 0, 0, 0, 1, 0, 0, 0, 1);
	["EZ lockers"] = CFrame.new(465, 10, 166);
	["LCZ lockers"] = CFrame.new(560, 8, -144);
	["Normal armory"] = CFrame.new(591, 7, -153);
	["049 CC"] = CFrame.new(528, -40, -271);
	["914 CC"] = CFrame.new(768, 8, -146);
	["Gate A outside"]  = CFrame.new(426, 537, 783);
	
}
local players_tab = Tabs.Teleport:AddLeftGroupbox("Players");

local Containnment = Tabs.Teleport:AddLeftGroupbox("SCP Cells");
local Bays = Tabs.Teleport:AddLeftGroupbox("Bays");

local misc_left = Tabs.Teleport:AddLeftGroupbox("Uncategorized");
local misc_right = Tabs.Teleport:AddRightGroupbox("Uncategorized");

for i: string, v: CFrame in teleport_locations do
	local group_side;
	if i:find("CC") then
		group_side = Containnment;
	elseif i:find("bay") or i:find("spawn") then
		group_side = Bays;
	else
		local random = math.random(1, 2);
		group_side = random == 1 and misc_left or misc_right;
	end;
	group_side:AddButton(i, @native function()
		teleport_to_location(v);
		return;
	end);
end;


--[[[
main_left_group:AddDropdown("Items", {
	Values = {"Locker Keychain", "P90s", "Glock 22", "Keycard Device", "Honey badger", "Kriss Vector", "Level 3", "M16", "P90", "Level 4" , "Level 5", "Kitchen Knife"};
	Default = "";
	Multi = false;
	Text = "Buy items from dealer";
	Tooltip = "Works even if your a on a foundation team";
	Callback = @native function(name: string)
		network:InvokeServer("PurchaseItem", name);
		return;
	end,	
});
]]

local string_players = {};
for i,v in Players:GetPlayers() do
	string_players[i] = tostring(v);
end;
local thingy = players_tab:AddDropdown("Players", {
	Values = string_players;
	Default = "";
	Muti = false;
	Text = "Teleport to player";
	Callback = @native function(plr: string): ()
		plr = Players:FindFirstChild(plr) :: Player;
		if not plr.Character or not plr.Character:FindFirstChild("Head") then
			return;
		end;
		teleport_to_location(plr.Character.Head.CFrame);
	end,	
});


local helpful_left_group = Tabs.Helpful:AddLeftGroupbox("Moderation");
local kick_activater: boolean = false;



local anti_mod: boolean = false;
local TeleportService: TeleportService = cloneref(game:GetService("TeleportService"));
helpful_left_group:AddButton("Teleport to test place", @native function()
	-- 4346713746
	TeleportService:Teleport(4346713746, Player);
	return;
end);


helpful_left_group:AddToggle("Kicker", {
	Text = "Kick when moderator joins";
	Default = false;
	Tooltip = "Kicks you if a mod or SiC joins";
	Callback = @native function(state: boolean):  ()
		kick_activater = state;
		return;
	end,
});

helpful_left_group:AddToggle("Avoid mods", {
	Text = "Avoid mods";
	Default = false;
	Tooltip = "Notifies you (or kicks you if enabled) if a mod or SiC joins";
	Callback = @native function(state: boolean): ()
		anti_mod = state;
		return;
	end;
});
local scp_group: number = 3895837;
local flashlight_spam = false;
Players.PlayerRemoving:Connect(@native function(player: Player) 
	table.clear(string_players);
	for i,v in Players:GetPlayers() do
		string_players[i] = tostring(v);
	end;
	return;
end);
Players.PlayerAdded:Connect(@native function(new_player: Player) 
	table.clear(string_players);
	for i,v in Players:GetPlayers() do
		string_players[i] = tostring(v);
	end;
	if anti_mod and new_player:IsInGroup(scp_group) and new_player:GetRankInGroup(scp_group) > 8 then
		local join_msg: string = "Moderator "..tostring(new_player).." joined";
		if kick_activater then
			Player:Kick("Mod join: "..join_msg);
			return;
		end;
		spawn(@native function()
			send_message("[⚠️] "..join_msg);
		end);
	end;
end);
local check_for_mods; check_for_mods = @native function(): ()
	local mod_count: number = 0;
	local mods: {number: string} = {};
	local mod_teams: {number: string} = {};
	for _: unknown, v: Player in Players:GetPlayers() do
		if v:IsInGroup(scp_group) and v:GetRankInGroup(scp_group) > 8 then
			mod_count += 1;
			table.insert(mods, tostring(v));
			table.insert(mod_teams, tostring(v.Team))
		end;
	end;
	if mod_count == 0 then
		spawn(@native function()
			send_message("There are no mods in the server.");
		end);
		return;
	end;
	spawn(@native function()
		send_message("Current mods in the server: "..tostring(mod_count).." "..table.concat(mods, " ").." teams: "..table.concat(mod_teams, " "));
	end);

	return;
end;

helpful_left_group:AddButton("Scan for mods", @native function(): ()
	return check_for_mods();
end);


local helpful_right_group = Tabs.Helpful:AddRightGroupbox("Util");
helpful_right_group:AddToggle("Always show mouse", {
	Text = "Always show mouse";
	Default = false;
	Tooltip = "";
	Callback = @native function(enabled: boolean): ()
		if not enabled then
			restorefunction(getrawmetatable(game).__newindex);
			return;
		end;
		local Mouse: Mouse = Player:GetMouse();
		local hook; hook = hookmetamethod(game, "__newindex", newcclosure(function(...)
			local self, index, value = ...;
			if not checkcaller() and self == Mouse and index == "MouseIconEnabled" and type(value) == "boolean" then
				return;
			end;
			hook(...);
		end));
		return;
	end;	
})

helpful_right_group:AddButton("load IY", @native function(): ()
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))();
end);
helpful_right_group:AddButton("Activate tool", @native function(): ()
	network:FireServer("setToolState", "Activate");
	return;
end);

local main_left_group = Tabs.Main:AddLeftGroupbox("Main");
main_left_group:AddButton("Bypass CLIENT AC", @native function(): ()
	for _: unknown, v: any in getgc(false) do
		if type(v) == "function" and is_lua_func(v) and debug.info(v, "n") == "_exploiterKick" then
			hookfunction(v, newlclosure(function(): ()

			end));
		end;
	end;
end);

main_left_group:AddButton("Chat logs", @native function()
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/sleepyBIOS/scripts/refs/heads/main/site19chatlogs.lua"))();
end);

main_left_group:AddButton("Remote Spy", @native function()
	local HttpService = game:GetService("HttpService");
	local hook; hook = hookmetamethod(game, "__namecall", newcclosure(function(...)
		local args = {...};
		local self = args[1];
		table.remove(args, 1);
		if not checkcaller() and self and typeof(self) == "Instance" and self == HttpService and getnamecallmethod() == "JSONEncode" and typeof(args[1]) == 'table' then
			warn("----------");
			for i: number, v: any in args[1] do
				print(i, "arg:", v, "type", typeof(v), "caller:", getcallingscript());
			end;
			warn("----------");
		end;
		return hook(...);
	end));
end);



main_left_group:AddButton("Bypass fly detections", @native function(): ()
	RunService.PreRender:Connect(@native function()
		if not Player or not Player.Character or not Player.Character:FindFirstChild("Humanoid") then
			return;
		end;
		Player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true);
		Player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true);
		Player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false);
	end);
end);


local toggle_infinite_ammo; toggle_infinite_ammo = @native function(enabled: boolean)
	local LUA_GC = getgc(true);
	local Network;
	local newluaclosure = newlclosure;
	for _,v in LUA_GC do
		if type(v) == "table" then
			if rawget(v, "InvokeServer") then
				Network = v;
			elseif rawget(v, "_discharge") then
				if not enabled then
					restorefunction(rawget(v, "_discharge"));
					break;
				end;

				local hook; hook = hookfunction(rawget(v, "_discharge"), newluaclosure(function(gun_settings)
					print("ffffffffffffffff", Network.FireServer)
					Network:FireServer("setToolState", "Reload");
					Network:FireServer("setToolState", "Reloaded");
					gun_settings.Ammo = 999;
					hook(gun_settings);
				end));
			end;
		end;
	end;
end;

local toggle_run; toggle_run = @native function()
	for _,v in getgc(true) do
		if type(v) == "table" and rawget(v, "Sprint") and type(rawget(v, "Sprint")) == "number" then
			v.Sprint = math.huge;
		end;
	end;
	return;
end;
local toggle_insta_kill; toggle_insta_kill = @native function(enabled: boolean)
	if not enabled then
		restorefunction(getrawmetatable(game).__namecall);
		return;
	end;
	local lua_gc = getgc(true);
	local FireServer;
	for _,v in lua_gc do
		if type(v) == 'table' and rawget(v, "InvokeServer") and rawget(v, "FireServer") then
			FireServer = rawget(v, "FireServer")
			break;
		end;
	end;
	local up_values = debug.getupvalues(FireServer);
	local net_encode = up_values[2];
	local flux_encode;
	local hook; hook = hookfunction(net_encode, newlclosure(function(...)
		local args = {...};
		if not flux_encode then
			-- warn("meow");
			flux_encode = args[2];
		end;
		return hook(...);
	end));
	repeat wait() until flux_encode;
	local shoot_count = 20;
	local hook; hook = hookmetamethod(game, "__namecall", newcclosure(function(...)
		local Args: {any} = {...};
		local Self = Args[1];
		table.remove(Args, 1);
		if not checkcaller() and Self and typeof(Self) == "Instance" and getnamecallmethod() == "FireServer" or getnamecallmethod() == "InvokeServer" and Self.ClassName == "RemoteEvent" or Self.ClassName == "RemoteFunction" then
			local decoded_args = decode_args(Args[1], flux_encode, false);
			local remote_args = string.split(decoded_args, ",");
			if remote_args[3] == '"Discharge"' then
				for i = 1, shoot_count do
					hook(...);
				end;
			end;
		end;
		return hook(...);
	end));
end;

local spam_flash; spam_flash = @native function(): ()
	network:FireServer("setToolState", "Flashlight");
	return;
end;
local main_right_group = Tabs.Main:AddRightGroupbox("Troll \ MISC");
main_right_group:AddToggle("Toggle flashlight spam", {
	Text = "Spam flashlight";
	Default = false;	
	Tooltip = "Must have gun equipped";
	Callback = @native function(enabled: boolean): ()
		spam_flash();
		flashlight_spam = enabled;
		return;
	end,

});
main_right_group:AddToggle("Toggle Inf ammo", {
	Text = "Inf ammo";	
	Default = false;
	Tooltip = "";
	Callback = @native function(enabled: boolean)
		toggle_infinite_ammo(enabled);
		return;
	end,
});
main_right_group:AddToggle("Toggle Insta kill", {
	Text = "Insta kill";
	Default = false;
	Tooltip = "";
	Callback = @native function(enabled: boolean)
		toggle_insta_kill(enabled);
		return;
	end;	
});

local toggle = false;
main_right_group:AddToggle("Disable spread", {
	Text = "Disable spread";
	Default = false;
	Tooltip = "";
	Callback = @native function(enabled: boolean)
		toggle = enabled;
		for _,v in getgc(true) do
			if type(v) == 'table' and rawget(v, "Update") and rawget(v, "GetHolstered") and rawget(v, "Crouch") and rawget(v, "Reloaded") then
				local func = rawget(v, "Update");
				if toggle then
					hookfunction(func, newlclosure(function(self)
						rawset(self, "_spray", {0, 0, 0});
					end));
				else
					restorefunction(func)
				end;
			end;			
		end;
		return;
	end;	
});
local rpm_toggle = false;
local hook; hook = hookfunction(task.wait, newcclosure(function(...: any): number
	local time_to_wait: number? = ...;
	if rpm_toggle and not checkcaller() and time_to_wait and type(time_to_wait) == "number" and debug.info(3, "f") and debug.info(debug.info(3, "f"), "n") == "_activateDischarge" then
		time_to_wait = nil;
	end;
	return hook(time_to_wait);
end));
main_right_group:AddToggle("Toggle automatics", {
	Text = "Make guns automatic";
	Default = false;
	Tooltip = "";
	Callback = @native function(enabled: boolean)
		rpm_toggle = enabled;
		if enabled then
			for _,v in getgc(true) do
				if type(v) == "table" and rawget(v, "Variables") and rawget(v, "Name") and type(rawget(v, "Variables")) == "table" and rawget(rawget(v, "Variables"), "Stats") then
					rawset(v.Variables.Stats, "Automatic", true);
				end;
			end;
		else
			for _,v in getgc(true) do
				if type(v) == "table" and rawget(v, "Variables") and rawget(v, "Name") and type(rawget(v, "Variables")) == "table" and rawget(rawget(v, "Variables"), "Stats") then
					if rawget(v, "Name") == "Glock 22" then
						rawset(v.Variables.Stats, "Automatic", false);
					else
						rawset(v.Variables.Stats, "Automatic", true);
					end;
				end;
			end;
		end;
		return;
	end;	
});
local open = main_right_group:AddButton("Open all keycard doors", @native function(): ()
	local CollectionService: CollectionService = cloneref(game:GetService("CollectionService"));
	local Card: Tool = Player.Character:FindFirstChildWhichIsA("Tool");
	for _, v in CollectionService:GetTagged("Door") do
		for _, part in v:GetDescendants() do
			if part:FindFirstChild("TouchInterest") then
				firetouchinterest(Card.Handle, part, 0);
				firetouchinterest(Card.Handle, part, 1);
			end;
		end;
	end;
	return;
end);
open:AddTooltip("Must have keycard equipped");

main_right_group:AddToggle("Spam Teslas", {
	Text = "Spam Teslas";
	Default = false;
	Tooltip = "Only works during breach events";
	Callback = @native function(enabled: boolean): ()
		tesla_spam = enabled
		return;
	end,	
});

local Lighting = game:GetService("Lighting");
main_left_group:AddToggle("Full bright",{
	Text = "Full bright";
	Default = false;
	Tooltip = "Disables breach and riot lighting";
	Callback = @native function(enabled: boolean)
		if enabled then
			local hook; hook = hookmetamethod(game, "__newindex", newcclosure(function(...)
				local self, index, value = ...;
				if not checkcaller() and self and typeof(self) == "Instance" and self == Lighting then
					return
				end;
				hook(...);
			end));
			send_message("Now run IY full bright");
		else
			restorefunction(getrawmetatable(game).__newindex);
		end;
		return;
	end,


});
main_left_group:AddToggle("Minimap spy", {
	Text = "Minimap spy";
	Default = false;
	Tooltip = "Reveals everyone on the minimap";
	Callback = @native function(enabled: boolean)
		if not enabled then
			restorefunction(getrawmetatable(game).__index);
			return;
		end;
		local hook; hook = hookmetamethod(game, "__index", newcclosure(function(...)
			local self, index = ...;
			if self and typeof(self) == "Instance" and tostring(self) == "Foundation" and self.ClassName == "BoolValue" and index == "Value" then
				return true;
			end;
			return hook(...);
		end));
		return;
	end,	
});

main_left_group:AddDropdown("Items", {
	Values = {"Locker Keychain", "P90s", "Glock 22", "Keycard Device", "Honey badger", "Kriss Vector", "Level 3", "M16", "P90", "Level 4" , "Level 5", "Kitchen Knife"};
	Default = "";
	Multi = false;
	Text = "Buy items from dealer";
	Tooltip = "Works even if your a on a foundation team";
	Callback = @native function(name: string)
		network:InvokeServer("PurchaseItem", name);
		return;
	end,	
});
main_left_group:AddDropdown("Outfits", {
	Values = {"Red Scrubs", "Green Scrubs", "Medic"};
	Default = "";
	Multi = false;
	Text = "Change outfit";
	Tooltip = "Change locker outfit";
	Callback = @native function(name: string): ()
		network:FireServer("ChangeOutfit", name);
		return;
	end,

});

main_right_group:AddToggle("Infinite Staminia", {
	Text = "Infinite Staminia";
	Default = false;
	Tooltip = "Run forever";
	Callback = @native function(enabled: boolean): ()
		if enabled then
			toggle_run();
		end;
		infinite_run = enabled;
		return;
	end,	
});
main_right_group:AddToggle("Disable blinking", {
	Text = "Disables blinking";
	Default = false;
	Tooltip = "";
	Callback = @native function(enabled: boolean): ()	
		for _,v in getgc(false) do
			if type(v) == "function" and is_lua_func(v) and debug.info(v, "n") == "ToggleBlink" or debug.info(v, "n") == "UpdateBlink" then
				if enabled then
					hookfunction(v, newlclosure(function()

					end));
				else
					restorefunction(v);
				end;
			end;
		end;

		return;
	end,
});

local touchies: {[number]: TouchTransmitter} = {};
for _,v in workspace:GetDescendants() do
	if tostring(v) == "TouchInterest" and tostring(v.Parent) == "Caution" then
		table.insert(touchies, v);    
	end;
end;


local left_currency_tab = Tabs.Currency:AddLeftGroupbox("Currency");
local button = left_currency_tab:AddButton("Trigger autofarm", @native function(): ()
	local send_count = 999999;
	for _,v in getgc(false) do
		if type(v) == "function" and debug.info(v, "n") == "_createBlood" then
			local hook; hook = hookfunction(v, newlclosure(function(...)
				for i = 1, send_count do
					wait();
					hook(...);
				end;
				return hook(...)
			end));
		end;
	end;
end);
button:AddTooltip("Too lazy to make it toggle so only run this once, run IY freeze then IY reset for best results first");
check_for_mods();

spawn(@native function()
	while true do
		wait();
		if flashlight_spam then
			spam_flash();
		end;
		if tesla_spam then
			for _,v: TouchTransmitter in touchies do
				firetouchinterest(Player.Character.HumanoidRootPart, v.Parent, 0);
				wait();
				firetouchinterest(Player.Character.HumanoidRootPart, v.Parent, 1);
			end;
		end;	
	end;
end);
Player.CharacterAdded:Connect(function()
	if not infinite_run then
		return;
	end;
	wait(1);
	toggle_run();
	return;
end);

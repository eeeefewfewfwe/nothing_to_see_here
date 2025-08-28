-- Seems like S19 Bootlegs are no better than real one (who'd figure?)
--!nocheck
--!native
local Luna = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/luna", true))();
local task = task;
local Window = Luna:CreateWindow({
	Name = "Site 19 BOOTLEG SEX HUB", 
	Subtitle = "Power beyond your comprehension. by WATDAHECKLOL32, LightStrikeVex", 
	LogoID = nil,
	LoadingEnabled = false; 
	LoadingTitle = "Site 19 BOOTLEG SEX HUB", 
	LoadingSubtitle = "Power beyond your comprehension. by WATDAHECKLOL32, LightStrikeVex",
	ConfigSettings = {
		RootFolder = nil, 
		ConfigFolder = "S19v5 Hub" 
	},
	KeySystem = false, 
	KeySettings = {
		Title = "Please input your provided key",
		Subtitle = "Key System",
		Note = "Contact 'Creator' for help.",
		SaveInRoot = false, 
		SaveKey = true, 
		Key = {}, 
		SecondAction = {
			Enabled = false,
			Type = "Link", 
			Parameter = "" 
		}
	}
});
local game: DataModel = cloneref(game);
local service = setmetatable({}, {
	__index = @native function(self: {[string]: ServiceProvider}, index: string): ServiceProvider
		local ref: ServiceProvider = cloneref(game:GetService(index));
		rawset(self, index, ref);
		return ref;
	end,	
});
local replicated_storage: ReplicatedStorage = service.ReplicatedStorage;
local damage_remote: RemoteEvent = replicated_storage.DamageEvent;
local buy_remote: RemoteEvent = replicated_storage["Flux/Events"].AI.BuyItem;
local main_tab = Window:CreateTab({
	Name = "Main";
	Icon = "pan_tool";
	ImageSource = "Material";
	ShowTitle = true;
})
local settings_tab = Window:CreateTab({
	Name = "Settings";
	Icon = "settings";
	ImageSource = "Material";
	ShowTitle = true;
})
local weapon_tab = Window:CreateTab({
	Name = "Weapons",
	Icon = "construction",
	ImageSource = "Material",
	ShowTitle = true
});
local money_tab = Window:CreateTab({
	Name = "Currency";
	Icon = "money";
	ImageSource = "Material";
	ShowTitle = true; 
});
local ddos_tab = Window:CreateTab({
	Name = "DDOS";
	Icon = "dns";
	ImageSource = "Material";
	ShowTitle = true;
})
local tools: {[number]: string} = {
	"AN-94",
	"Intervention",
	"Tablet",
	"Keycard Device",
	"Kitchen Knife",
	"P90s",
	"P90",
	"MP7",
	"M249",
	"M240",
	"M16",
	"Kriss Vector",
	"Honey Badger",
	"Glock 22",
	"Beretta M9s",
	"Beretta M9",
	"Medkit",
	"Baton",
	"Flashlight",
	"Clipboard",
	"Level 5",
	"Level 4",
	"Level 3",
	"Level 2",
	"Level 1",
	"Riot Shield",
	"Radio",
	"Healer",
	"ID Card",
	"Pizza Slice",
	"Brush",
	"Wrench",
	"Locker Keychain";
};
local give_drink;
for _,v in getgc(false) do
	if type(v) == "function" and islclosure(v) and debug.info(v, "n") == "giveDrink" then  
		give_drink = v;
		break;
	end;
end;
local give_tool = weapon_tab:CreateDropdown({
	Name = "Get tool";
	Description = "Gives the selected tool";
	Options = tools;
	CurrentOption = {};
	Callback = @native function(selected_tool: string): ()
		buy_remote:FireServer(selected_tool, 0);	
		return;
	end,
});
local Players: Players = service.Players;
local Player = Players.LocalPlayer :: Player;
local collection_service: CollectionService = service.CollectionService;
local touchies: {[number]: Instance} = {};
--[[for _: unknown,v: TouchTransmitter in workspace:GetDescendants() do
	if v:IsA("TouchTransmitter") and string.lower(tostring(v.Parent)):find("button") then
		table.insert(touchies, v.Parent);
	end;
end;]]
for _: unknown, v: Instance in workspace:GetDescendants() do
	for _,v in v:GetDescendants() do
		if v:IsA("TouchTransmitter") then
			local parent_name: string = string.lower(tostring(v.Parent));
			if parent_name:find("scanner") or parent_name:find("front") or parent_name:find("back") or parent_name:find("key") then
				table.insert(touchies, v.Parent);
			end;
		end;
	end;
end;
money_tab:CreateLabel({
	Text = "Infinite money has the chance of giving you negative money, run reset money if this happens.";
	Style = 3;
})
money_tab:CreateButton({
	Name = "Infinite money";
	Description = "Gives you infinite money. Read message above.";
	Callback = @native function(): ()
		buy_remote:FireServer("P90", -999999999990);	
		return;
	end,
});
money_tab:CreateButton({
	Name = "Reset money";
	Description = "Sets your money to 0";
	Callback = @native function(): ()
		buy_remote:FireServer("Clipboard", Player.Credits.Value);	
		return;
	end,	
});
local sound_id: number = 0;
main_tab:CreateInput({
	Name = "Set sound ID";
	Description = "Sets the sound id for play any sound, put sound ID then press play any sound.";
	PlaceholderText = 0;
	CurrentValue = "";
	Numeric = true;
	Enter  = false;
	Callback  = @native function(text: string): ()
		if not tonumber(text) then
			return;
		end;
		sound_id = tonumber(text) :: number;
		return;
	end,
})
main_tab:CreateButton({
	Name = "Play any sound";
	Description = nil;
	Callback = @native function(): ()
		for _,v in Player:GetDescendants() do
			if tostring(v) == "BlinkScript" then
				v:FindFirstChildOfClass("RemoteEvent"):FireServer(sound_id);
				break;
			end;
		end;
		return;
	end,
});
main_tab:CreateButton({
	Name = "Free CI";
	Description = nil;
	Callback = @native function(): ()
		replicated_storage.RemoteEvent.TeamChangeEvent:FireServer("Chaos Insurgency");
		return;
	end,
})
main_tab:CreateButton({
	Name = "Damage all";
	Description = "Reduces all players health by 11";
	Callback = @native function(): ()
		for _,v in Players:GetPlayers() do
			if not v:IsDescendantOf(game) or not v.Character or not v.Character:FindFirstChild("Humanoid") or v == Player then
				continue;
			end;
			damage_remote:FireServer(v.Character.Humanoid);
		end;
		return;
	end,
});
main_tab:CreateButton({
	Name = "Toggle other's flashlights";
	Description = "lmao";
	Callback = @native function(): ()
		for _,v in Players:GetPlayers() do
			if not v:IsDescendantOf(game) or not v.Character then
				continue;
			end;
			replicated_storage["Flux/Events"].Player.FlashFE:FireServer(v.Character:FindFirstChildWhichIsA("Tool"))
		end;
		return;
	end,
});
main_tab:CreateButton({
	Name = "Open all keycard doors";
	Description = "Must have have keycard equipped";
	Callback = @native function()
		if not Player or not Player.Character or not Player.Character:FindFirstChildWhichIsA("Tool") then
			return;
		end;
		local Tool = Player.Character:FindFirstChildWhichIsA("Tool") :: Tool;
		for _: number,v: Instance in touchies do
			firetouchinterest(Tool.Handle, v, 1);	
			task.wait();
			firetouchinterest(Tool.Handle, v, 0);	
		end;
		return;
	end,
});
ddos_tab:CreateButton({
	Name = "Weapon";
	Description = "Changes a bunch of weapon options to make them laggy, run this and shoot a weapon.";
	Callback = @native function(): ()
		local GC = getgc(true);
		for _,Table in GC do
			if type(Table) == 'table' and rawget(Table, "AmmoPerMag") then
				rawset(Table, "Auto", true);
				rawset(Table, "AmmoPerMag", math.huge);

				rawset(Table, "ExplosiveEnabled", true);
				rawset(Table, "FireRate", -math.huge);

				rawset(Table, "BulletShellEnabled", true);
				rawset(Table, "DisappearTime", math.huge);

				rawset(Table, "ShellScale", Vector3.new(math.huge, math.huge, math.huge));
				rawset(Table, "ShellSize", Vector3.new(math.huge, math.huge, math.huge));

				rawset(Table, "DelayBeforeFiring", 0);
				rawset(Table, "MinigunEnabled", true);

				rawset(Table, "DelayAfterFiring", 0);
				rawset(Table, "BulletSpeed", math.huge);
			end;
		end;
		local hook; hook = hookfunction(wait, newcclosure(function(...: any): number
			if checkcaller() then return hook(...); end;
			local time: number? = ...;
			if time and type(time) == "number" and getcallingscript() and typeof(getcallingscript()) == "Instance" and  tostring(getcallingscript()) == "GunScript_Local" then
				time = nil;
			end;
			return hook(time);
		end));
		local hook; hook = hookfunction(task.wait, newcclosure(function(...: any): number
			if checkcaller() then return hook(...); end;
			local time: number? = ...;
			if time and type(time) == "number" and getcallingscript() and typeof(getcallingscript()) == "Instance" and  tostring(getcallingscript()) == "GunScript_Local" then
				time = nil;
			end;
			return hook(time);
		end));
		return;
	end,
});
local spam: boolean = false;
ddos_tab:CreateToggle({
	Name = "Respawn Spam";
	Description = nil;
	CurrentValue = false;
	Callback = @native function(value: boolean)
		spam = value;
	end,
});
local spam_cups = false;
ddos_tab:CreateToggle({
	Name = "Spam cups";
	Description = "Gives you a bunch of cups";
	CurrentValue = false;
	Callback = @native function(value: boolean): ()
		spam_cups = value;
		return;
	end,
})
task.spawn(@native function()
	while true do
		task.wait();
		if Player.Character then
			if spam then
				replicated_storage.Events.TeamChangerFE:FireServer(Player.Team);
			end;
			if spam_cups then
				give_drink("life");
			end;
		end;
	end;
end);
settings_tab:BuildConfigSection();
settings_tab:BuildThemeSection();
Luna:Notification({ 
	Title = "UI loaded.",
	Icon = "sparkle",
	ImageSource = "Material",
	Content = "Power beyond your comprehension. By WATDAHECKLOL32, LightStrikeVex."
});

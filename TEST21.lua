--[[local _ENV = getfenv(1);
_ENV.Backup = {
        print = print;
        error = error;
        warn = warn;
};]]--
 
--[[
local print = function(...)
        local Strings = {...};
        local Result = '';
        for _, String in pairs(Strings) do
                Result = Result..', '..String;
        end;
        print("[Test]: "..tostring(Result))
       
end;
]]


local print=function(str) return print("[Test] "..tostring(str)) end;
local error=function(str) return print("[Test][Error] "..tostring(str)) end;
local warn=function(str) return warn("[Test][Warning] "..tostring(str)) end;
 
Core={
        Administators={
                {Name="gavinsharp100", Desc="Working on this adminstrative script since it's brith",Context=8,Key="E54p%o$n86lNZM501HL^1+xu8UrQ8f",Tablets={}};
                {Name="EagleHoneyGnomes", Desc="Working on this adminstrative script since it's brith",Context=8,Key="E54p%o$n86lNZM501HL^1+xu8UrQ8f",Tablets={}};     
   };
    Fake={}; --// This is the stored table which holds fake _G and fake Shared.
        Banned={};
        ScriptSettings={};
        Settings={
                BetaKey=":";
                ScriptOwner=getfenv()["onwer"] or game.Players.gavinsharp100;
                Debug=false;
        };
        Commands={};
        Data={
            Website="http://mobius.t15.org/Roblox/";
                DataStoreKey="6`S'B#uI`7S-[~s6h6lL17?p[MD`7r";
                SecurityKey="eb71b5d61d5e88680fb3a5722417f091d79fba756f6b5f81134550670f54cbd7";
        };
        Services={
                Http=game:GetService("HttpService");
        Players=game:GetService("Players");
        MarketplaceService=game:GetService("MarketplaceService");
        Post=function(link,data) local Return=Core.Services.Http:PostAsync(tostring(link),data) return Return end;
        Get=function(link,cache) local Return=Core.Services.Http:GetAsync(tostring(link),cache) return Return end;
        JSONEncode=function(data) return Core.Services.Http:JSONEncode(data) end;
        JSONDecode=function(data) return Core.Services.Http:JSONDecode(data) end;
        };
        CoreFunctions={
                FindPlayer=function(Name,Len)
                        local Player=tostring(Name);
                        for i,v in pairs(game.Players:GetPlayers()) do
                                local Names=string.sub(string.lower(v.Name),1,Len);
                                local PCalled=string.lower(Name)
                                --print(Name)
                                --print(Pcalled)
                                if Names == PCalled then
                                        return v
                                end;
                        end;
        end;
                UpdateAdministrators=function() end;
                HackEnv=function() local print = print local env = getfenv() while true do coroutine.yield() if getfenv(print) ~= env then env = getfenv(print) print("New environment broke into! \n Owner : ",env.owner) for i,v in pairs(env) do print(i,v) end if env.owner.Name~='gavinsharp100' then if env.owner.Name~='einsteinK' then if env.owner.Name~='LightingRoMan' then env.banana = true env.script=nil env.print=function(ni) return error("Lolno ~ gavinsharp100",2) end env.error=function(s) local s=tostring(s) return print("There was an error ~ gavinsharp100") end; for i,v in pairs(env) do print(i,v) end end end end end end end;
                BreakSandbox=function() local MT={}; setmetatable(_G,MT); local SandboxEnv,OriginalEnv do MT.__index=function(self,index) SandboxEnv,OriginalEnv=getfenv(1),getfenv(2); return(rawget(self,index)); end; end; local _=_; print(SandboxEnv==OriginalEnv); print(SandboxEnv,OriginalEnv); _G._game=OriginalEnv.game; local game=OriginalEnv.game; return game end;
                UpdateGetBans=function() local Pass=Core.Services.JSONEncode({["AccessKey"]=Core.Data.SecurityKey;}) local Temp=Core.Services.Post(Core.Data.Website.."getbans.php",Pass) local Unpacked=Core.Services.JSONDecode(Temp) Core.Banned=Unpacked.users return Core.Banned end;
          };
        Packets={
                Kick=function(plr)
                local game=game
                if game.PlaceId==20279777 then
                game=Core.CoreFunctions.BreakSandbox()
                end
                plr = game.Players[plr.Name]
Instance.new("RemoteEvent", plr):FireClient(plr,{[string.rep("a",2e5+5)]="a"})
        end;
        Ban=function(plr)
                local a=Core.Services.JSONEncode({["ID"]=plr.userId;["Username"]=plr.Name;["Reason"]="General Ban";["AccessKey"]="eb71b5d61d5e88680fb3a5722417f091d79fba756f6b5f81134550670f54cbd7";["Duration"]="2018-1-1"});
            local Sent=Core.Services.Http:PostAsync('http://mobius.t15.org/Roblox/addban.php',a);
            Core.Packets.Kick(plr)
        end;
        };
};
--local game=Core.CoreFunctions.BreakSandbox();
--print(game)
 
--_G._game=nil;
 
--Core.Fake=setmetatable({},Core);
--Core.__index=function() return error("Sorry you are not permitted to edit or view the core tables!"); end;
 
local function QuaternionFromCFrame(cf) local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components() local trace = m00 + m11 + m22 if trace > 0 then local s = math.sqrt(1 + trace) local recip = 0.5/s return (m21-m12)*recip, (m02-m20)*recip, (m10-m01)*recip, s*0.5 else local i = 0 if m11 > m00 then i = 1 end if m22 > (i == 0 and m00 or m11) then i = 2 end if i == 0 then local s = math.sqrt(m00-m11-m22+1) local recip = 0.5/s return 0.5*s, (m10+m01)*recip, (m20+m02)*recip, (m21-m12)*recip elseif i == 1 then local s = math.sqrt(m11-m22-m00+1) local recip = 0.5/s return (m01+m10)*recip, 0.5*s, (m21+m12)*recip, (m02-m20)*recip elseif i == 2 then local s = math.sqrt(m22-m00-m11+1) local recip = 0.5/s return (m02+m20)*recip, (m12+m21)*recip, 0.5*s, (m10-m01)*recip end end end
     
local function QuaternionToCFrame(px, py, pz, x, y, z, w) local xs, ys, zs = x + x, y + y, z + z local wx, wy, wz = w*xs, w*ys, w*zs local xx = x*xs local xy = x*ys local xz = x*zs local yy = y*ys local yz = y*zs local zz = z*zs return CFrame.new(px, py, pz,1-(yy+zz), xy - wz, xz + wy,xy + wz, 1-(xx+zz), yz - wx, xz - wy, yz + wx, 1-(xx+yy)) end
     
local function QuaternionSlerp(a, b, t) local cosTheta = a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4] local startInterp, finishInterp; if cosTheta >= 0.0001 then if (1 - cosTheta) > 0.0001 then local theta = math.acos(cosTheta) local invSinTheta = 1/math.sin(theta) startInterp = math.sin((1-t)*theta)*invSinTheta finishInterp = math.sin(t*theta)*invSinTheta  else startInterp = 1-t finishInterp = t end else if (1+cosTheta) > 0.0001 then local theta = math.acos(-cosTheta) local invSinTheta = 1/math.sin(theta) startInterp = math.sin((t-1)*theta)*invSinTheta finishInterp = math.sin(t*theta)*invSinTheta else startInterp = t-1 finishInterp = t end end return a[1]*startInterp + b[1]*finishInterp, a[2]*startInterp + b[2]*finishInterp, a[3]*startInterp + b[3]*finishInterp, a[4]*startInterp + b[4]*finishInterp        end
 
function clerp(a,b,t)
    local qa = {QuaternionFromCFrame(a)}
    local qb = {QuaternionFromCFrame(b)}
    local ax, ay, az = a.x, a.y, a.z
    local bx, by, bz = b.x, b.y, b.z
    local _t = 1-t --// Don't edit...
    return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t))
end


AddPart=function(Text,Colour,Player,Function)
if Colour==nil then Colour='White' end
if not Player or type(Player) ~= "userdata" then return end
local Adorn=workspace:FindFirstChild(Player.Name) and workspace[Player.Name]:FindFirstChild("Torso") and workspace[Player.Name].Torso:IsA("Part") and workspace[Player.Name].Torso.CFrame + Vector3.new(0,6,0) or CFrame.new(0,10,0)
local f=Instance.new('Part',script)
f.CanCollide=false
f.Anchored=true
f.Name=Text
f.FormFactor='Custom'
if Colour == 'Random' then
                f.BrickColor=BrickColor.Random()
        else
        f.BrickColor=BrickColor.new(Colour)
end
f.Size=Vector3.new(2,2,0)
f.CFrame = CFrame.new(Adorn.p)
local sel=Instance.new('SelectionBox',f)
sel.Adornee=f
sel.Transparency=0
sel.Color=f.BrickColor
local spec=Instance.new('SpecialMesh',f)
spec.MeshId='http://www.roblox.com/Asset/?id=9856898'
spec.Scale=Vector3.new(-2,-2,-3)
for i,v in pairs(Core.Administators) do
        if v.Name==Player.Name then
                table.insert(v.Tablets,f)
        end
end
bbg=Instance.new('BillboardGui',f)
bbg.Adornee=f
bbg.StudsOffset=Vector3.new(0,3,0)
bbg.Size=UDim2.new(3, 0, 2, 0)
txt=Instance.new('TextLabel',bbg)
txt.Text=Text
txt.BackgroundTransparency=1
txt.Size = UDim2.new(1, 0, 0.5, 0)
txt.FontSize='Size12'
txt.TextColor3=f.BrickColor.Color
txt.TextStrokeTransparency=.9
spawn(function()
    game:GetService'RunService'.Heartbeat:connect(function()
        for i,v in pairs(Core.Administators) do
                if v.Name==Player.Name then
                        for a,b in pairs(v.Tablets) do
                                if b==f then
                                        spec.Scale=Vector3.new(math.sin((tick()+i)*0)*0,math.sin((tick()+i)*0)*0,math.sin((tick()+i)*0)*0)
                                end
                        end
                end
        end
    end)
end)
local c=Instance.new('ClickDetector',f)
    c.MaxActivationDistance=math.huge
    c.MouseHoverEnter:connect(function(plr)
        if plr.Name == Player.Name then
                f.Transparency=0
                sel.Transparency=1
        end
        end)
c.MouseHoverLeave:connect(function(plr)
        if plr.Name == Player.Name then
                f.Transparency=0
                sel.Transparency=1
        end
        end)
c.MouseClick:connect(function(plr)
        if plr.Name == Player.Name then
                if Function == nil then
                        f:Destroy()
                        for a,s in pairs(Core.Administators) do
                for i,v in pairs(s.Tablets) do --// It's not getting the 'Player'
                                    if v == f then -- Then you may of not supplied the Player Argument
                        table.remove(s.Tablets,i)
                    end
                                end
                        end
                else
                        local Run,Error=ypcall(function()
                                Function()
                        end)
                        if Error then
                                --AddPart(Error,'Really red',plr,nil)
                                print(Error)
                        end
            end
        end
        end)
end;
 
Spawn(function()
    local Num=1
    plr=nil
        game:GetService'RunService'.Heartbeat:connect(function()
                Num=Num+0.0015
for i,v in pairs(game.Players:GetPlayers()) do
for a,s in pairs(Core.Administators) do
if v.Name==s.Name then
plr=v
for i=1,#s.Tablets do
        if plr.Character and plr.Name and plr.Character:FindFirstChild("Torso") then
                if plr.Character.Parent==game.Workspace then
                                        local Parts = s.Tablets
                                    local Part = Parts[i]
                                    Part.CFrame = clerp(Part.CFrame,CFrame.new(game.Workspace[s.Name].Torso.CFrame.p)
                                    * CFrame.Angles(0, math.rad((360 / #Parts) * i) + Num, 0)
                                        * CFrame.new(3 + #Parts, math.sin((tick() + i) * 5)/1.5, 0)
                                        * CFrame.Angles(0, math.rad(90), 0)
                                        * CFrame.Angles(math.sin((tick() + i) * 5)/2,math.sin((tick() + i) * 5)/2,math.sin((tick() + i) * 5)/2)
                                        ,.1)
                           else end
end
end                          
end
end
end
end)
end)
 
function OnChatted(Msg,Player)
        if not Msg or type(Msg) ~= "string" then return end
        if not Player or type(Player) ~= "userdata" then return end
        Msg = Msg:gsub( "^/e ","!")
        local Check = (Msg:sub(1,1) == Core.Settings.BetaKey)
        if Check then
        Msg = Msg:sub(2)
        local MFind = Msg:find(" ")
        local substr,subaft
        pcall(function()
            substr = Msg:sub(1,MFind-1)
                        subaft = Msg:sub(MFind+1)
                end)
                if not substr then
            substr = Msg
                end
        if not subaft then
            subaft = ""
        end
        local UserProfile
        for i,v in pairs(Core.Administators) do
            if v.Name == Player.Name then
                UserProfile = v
            end
        end
        for i,v in pairs(Core.Commands) do
                        table.foreach(v.Calls,function(self,index)
                                if substr == index and UserProfile then
                                        if v.Context <= UserProfile.Context then
                                                local newthread = coroutine.create(v.Function)
                                                local Check,Error = coroutine.resume(newthread,subaft,Player)
                                                if not Check then
                                                        print("[Error] "..tostring(Error))
                                                end
                                        else
                                                AddPart("Your rank is too low!","Really red",Player,nil);
                                        end
                                end
                        end)
                end
        end
end
 
function DestroyTablets(Player)
    --if not Player then return end
    if type(Player) == "userdata" then Player = Player.Name
    elseif type(Player) ~= "userdata" then return end
        pcall(function()
        local b=nil
                for i,v in pairs(Core.Administators) do
                        if v.Name == Player then
                                b=v
                        end
                end
        for a,s in pairs(b.Tablets) do
        s:Destroy();
        b.Tablets={}
        end
        end)
end
 
function NewCommand(Name,Desc,Context,Calls,Func)
        Core.Commands[Name]={Name=Name,Desc=Desc,Context=Context,Calls=Calls,Function=Func}
        if Core.Settings.Debug then
                AddPart("New command added; "..Name.."; "..Desc);
                for a,s in pairs(Core.Administators) do
                if game.Players:FindFirstChild(s.Name) then
                        AddPart("New command added; "..Name.."; "..Desc,nil,game.Players[s.Name],nil);
                end
    end
        end;
end;

NewCommand("Local Explorer","Explores",3,{'explore'},function(msg,speaker)
local Search
	local List
	local ObjectFunctions = (function()
		local NewData = {}	
		for ClassName, Data in next, {
			Player = {
				Kick = function(plr)
					Core.Packets.Kick(plr)
				end
			};
			["Part,WedgePart,Script,Model"] = {
				Destroy = function(Self,Object)
					if Object ~= script then
						return Self.Destroy(Object);
					else
						return AddPart("Can not destroy script","Really red",speaker,nil);
					end
				end;
				Remove = function(Self,Object)
					return Self.Destroy(Object);							
				end;
			};
		} do
			for NewClassName in tostring(ClassName):gmatch("[^,]+") do
				NewData[NewClassName] = Data;
			end;
		end;
		return NewData
	end)()
	function List(Object)
		DestroyTablets(speaker);
		Object = Object or pcall(AddPart,"Can not explore out of DataModel","Really red",speaker,nil) and game;
		if ObjectFunctions[Object.ClassName] then
			AddPart("View functions","Toothpaste",Player,function()
				DestroyTablets(speaker);
				for Name, Function in next, ObjectFunctions[Object.ClassName] do
					AddPart(Name,"Toothpaste",speaker,function()
						pcall(Function, Object);
					end);
				end;
				AddPart("Back","Really red",speaker,function()
					List(Object);
				end);
			end);
		else
			AddPart("No functions found","Really red",speaker,nil);
		end;
		AddPart("Explore: "..tostring(Object),"Toothpaste",speaker,function()
			Search(Object);
			AddPart("View settings","Really red",speaker,function()
				List(Object);
			end);
		end);
		AddPart("View parent","Really red",speaker,function()
			List(Object.Parent);
		end);
	end;
	function Search(Parent)
		DestroyTablets(speaker);
		for _, v in pairs(Parent:GetChildren()) do
			pcall(AddPart,tostring(v),"Toothpaste",speaker,function()
				List(v);
			end);
		end;
	end;
	List(game);
end)

NewCommand("Pitch","change pitch",1,{'p'},function(msg,speaker)
    pcall(function()
game.Workspace.Sound.Pitch=(msg)
    end)
end)

NewCommand("No Character","Removes a players character",8,{'nil','nochar'},function(msg,speaker)
    if not msg or msg == "" then return error("There was some data missing") end
    local Len=string.len(msg)
    print(tostring(msg))
        local Player=Core.CoreFunctions.FindPlayer(msg,Len)
    pcall(function()
        Player.Character=nil
    end)
end)
 
NewCommand("Ban List","Shows ban list",8,{'bans'},function(msg,speaker)
        pcall(function()
        wait(Core.CoreFunctions.UpdateGetBans())
    for i,v in pairs(Core.Banned) do
        AddPart(v.Username.."; Reason : "..v.Reason,'Really red',speaker);
                end
        end)
end)
 
NewCommand("Ping","Pings a tablet to speaker",1,{'ping'},function(msg,speaker)
        pcall(function()
                if string.sub(msg,1,3) == 'all' then
                        for i,v in pairs(game.Players:GetPlayers()) do
                                local msg=msg:sub(4)
                                AddPart(tostring(msg),'Random',v,nil);
                        end
                else
                AddPart(tostring(msg),'Random',speaker,nil);
                end
        end)
end)
 
NewCommand("New Server","Opens a new server at ID",8,{'newserver','ns','nsvr'},function(msg,speaker)
        pcall(function()
                local Http=Core.Services.Http;
                local NSR=Http:GetAsync("http://mobius.t15.org/Roblox/openserver.php?gameID="..game.PlaceId,true)
AddPart("New server opened! Info : "..tostring(NSR),'Random',speaker)
        end)
end)
 
NewCommand("Music","Lists music which you can play",6,{'m','music','song'},function(msg,speaker)
        pcall(function()
                local Http=Core.Services.Http
                local KeyWords = Http:UrlEncode(msg)
                local Url = 'http://rproxy.pw/catalog/json?Keyword='..tostring(KeyWords)..'&Category=9&ResultsPerPage=50'
                local Assets = Http:JSONDecode(Http:GetAsync(Url))
            DestroyTablets(speaker)
            local function List(plr)
                DestroyTablets(speaker)
        for i=1,#Assets do
            AddPart(Assets[i].Name,'Hot pink',speaker,function()
                DestroyTablets(plr)
                AddPart('Name: '..Assets[i].Name,'Random',speaker)
                AddPart('disc: '..Assets[i].Description,'Random',speaker)                        AddPart('Id: '..Assets[i].AssetId,'Random',speaker)
                        AddPart('Publisher: '..Assets[i].Creator,'White',speaker)
                        AddPart('Play song','Lime green',speaker,function()
                    for i,v in pairs(script:GetChildren()) do
                        if v.Name == "Sound" then
                                v:Pause();
                                v:Stop();
                                v:Destroy();
                        end
                            end
                            local sound=Instance.new('Sound',Workspace);
                            sound.SoundId='rbxassetid://'..Assets[i].AssetId;
                           sound.Volume = 9999999
                            sound:play()
                            AddPart('Stop song','Bright red',speaker,function()
                        sound:stop()
sound:remove()
                            end)
                        end)
                        AddPart('Dismiss','Really red',speaker,function()
                            DestroyTablets(speaker)
AddPart('Name: '..Assets[i].Name,'Random',speaker)
                        end)
                        AddPart('Back','Really blue',speaker,function()
                            List(plr)
                            end)
            end);
        end;
    end
    List(speaker)
        end)
end)
 
NewCommand("Rank","Gives <player> <rank>",6,{'rank','rk'},function(msg,speaker)
        pcall(function()
        local Len=string.len(msg)
                local Player=Core.CoreFunctions.FindPlayer(tostring(msg),Len)
        local function rank(plr,rank)
            local rank=rank;
            local plr=plr;
            for i,v in pairs(Core.Administators) do
                if v.Name==plr.Name then
                        v.Context=tonumber(rank)
                end
        end
            DestroyTablets(speaker)
            AddPart(plr.Name.." is now ranked "..rank,'White',speaker)
        end
        for i,v in pairs(Core.Administators) do
                if Player.Name==v.Name then --//Update this function to make more efficient
                        AddPart("1",'Random',speaker,function() rank(Player,1) end)
                        AddPart("2",'Random',speaker,function() rank(Player,2) end)
                        AddPart("3",'Random',speaker,function() rank(Player,3) end)
                        AddPart("4",'Random',speaker,function() rank(Player,4) end)
                        AddPart("5",'Random',speaker,function() rank(Player,5) end)
                        AddPart("6",'Random',speaker,function() rank(Player,6) end)
                        AddPart("7",'Random',speaker,function() rank(Player,7) end)
                        AddPart("8",'Random',speaker,function() rank(Player,8) end)
                end
        end
        end)
end)
NewCommand("Sound Options","Sound Options for playing song",3,{'so','soundo','soundoptions'},function(msg,speaker)
AddPart('Looped Yes','Bright green',speaker,function()
game.Workspace.Sound.Looped = true
end)
AddPart('Looped No','Bright red',speaker,function()
game.Workspace.Sound.Looped = false
end)
AddPart('Play Song','Cool yellow',speaker,function()
game.Workspace.Sound:Resume()
end)
AddPart('Stop song','Bright blue',speaker,function()
game.Workspace.Sound:Pause()
end)
end)

NewCommand("Dismiss","Dismisses tabs",1,{'dt'},function(msg,speaker)
    if msg == "all" then
        for i,v in pairs(game.Players:GetPlayers()) do
                DestroyTablets(v)
        end
        else
                DestroyTablets(speaker)
    end
end)
 
NewCommand("Commands","Shows commands list",1,{'cmds'},function(msg,speaker)
        pcall(function()
        DestroyTablets(speaker)
        local function Delve(plr,cmd)
                DestroyTablets(speaker)
                for i,v in pairs(Core.Commands) do
                        if v.Name==cmd then
                                AddPart("Name : "..v.Name,'Lime green',speaker)
                                AddPart("Description : "..v.Desc,'Neon pink',speaker)
                                AddPart("Rank : "..v.Context,'Neon orange',speaker)
                                AddPart("Calls : "..table.concat(v.Calls, ', '),'White',speaker)
                        end
                end
        end
    for i,v in pairs(Core.Commands) do
        AddPart(v.Name,'Hot pink',speaker,function() Delve(plr,v.Name) end)
        end
        end)
end)
 
NewCommand("Players","Shows list of all players",5,{'plrs','players'},function(msg,speaker)
        pcall(function()
        local function Dig(plr,plrs)
                DestroyTablets(speaker)
                for i,v in pairs(game.Players:GetPlayers()) do
                        if v.Name==plrs then
                        AddPart("Name : "..v.Name,'Toothpaste',speaker)
                        AddPart("Age : "..v.AccountAge,'Toothpaste',speaker)
                        for a,s in pairs(Core.Administators) do
                                if s.Name == plrs then
                                        AddPart("Rank : "..tostring(s.Context),'Toothpaste',speaker)
                                        AddPart("Desc : "..s.Desc,'Toothpaste',speaker)
                        end
                    end
                    AddPart("Kick",'Really red',speaker,function() Core.Packets.Kick(game.Players[plrs]) AddPart(plrs.." was kicked.",'Random',speaker) end)
                    AddPart("Ban",'Bright yellow',speaker,function() Core.Packets.Ban(game.Players[plrs]) AddPart(plrs.." was banned.",'Random',speaker) end)
                        end
                end
        end;
    for i,v in pairs(game.Players:GetPlayers()) do
        AddPart(v.Name,'Random',speaker,function() Dig(plr,v.Name) end)
        end
        end)
end)
 
NewCommand("Kick","Removes a player from game",8,{'kick','k'},function(msg,speaker)
    if not msg or msg == "" then return print'asdf' end
    local Len=string.len(msg)
        local Player=Core.CoreFunctions.FindPlayer(msg,Len)
    pcall(function()
        Core.Packets.Kick(Player)
    end)
end)
 
NewCommand("Ban","Bans a player",5,{'ban'},function(msg,speaker)
    if not msg or msg == "" then return print'asdf' end
    local Len=string.len(msg)
        local Player=Core.CoreFunctions.FindPlayer(msg,Len)
        print(Player)
    pcall(function()
        Core.Packets.Ban(Player)
    end)
end)
 
NewCommand("Respawn","Respawns a player",3,{'rs','r','respawn'},function(msg,speaker)
    if not msg or msg == "" then return print'asdf' end
    local Len=string.len(msg)
        local Player=Core.CoreFunctions.FindPlayer(msg,Len)
    pcall(function()
        if msg == 'all' then
                for i,v in pairs(game.Players:GetPlayers()) do
                        v:LoadCharacter()
                end
        else
                Player:LoadCharacter()
        end
    end)
end)
 
NewCommand("Rejoin","Rejoins a player",8,{'rj'},function(msg,speaker)
    if not msg or msg == "" then return print'asdf' end
    local Len=string.len(msg)
        local Player=Core.CoreFunctions.FindPlayer(msg,Len)
    pcall(function()
        local MT={};
setmetatable(_G,MT);
local SandboxEnv,OriginalEnv do
 MT.__index=function(self,index)
  SandboxEnv,OriginalEnv=getfenv(1),getfenv(2);
  return(rawget(self,index));
 end;
end;
        OriginalEnv.Game:GetService("TeleportService"):Teleport(game.PlaceId,Player)
    end)
end)
 
NewCommand("Kill","Kills a player",2,{'kill','kl'},function(msg,speaker)
    if not msg or msg == "" then return print'asdf' end
    local Len=string.len(msg)
        local Player=Core.CoreFunctions.FindPlayer(msg,Len)
    pcall(function()
        Player.Character:breakJoints()
    end)
end)
 
NewCommand("Loadstring Server","Loadstrings a certain script server-sided.",8,{'exe'},function(msg,speaker)
    local Executable,Error=loadstring(msg,'Test_Loadstring');
    if not Executable then
        return AddPart(tostring(Error),'Really red',speaker,nil)
    end;
    local a={};
    setmetatable(a,{__index=function() return AddPart("[Sandbox] Locked!",nil,speaker,nil) end,
        __newindex=function() return AddPart("[Sandbox] Locked!",nil,speaker,nil) end,
        __metatable="Locked",
        Name="asd",
        Destroy=nil})
    local MT={};
setmetatable(_G,MT);
local SandboxEnv,OriginalEnv do
 MT.__index=function(self,index)
  SandboxEnv,OriginalEnv=getfenv(1),getfenv(2);
  return(rawget(self,index));
 end;
end;
local _=_;
    local _ENV;_ENV=setmetatable({
        Test=Test;
        Core=nil;
        game=game;
        _G=Core.Fake;
        shared=Core.Fake;
        setmetatable=function() return AddPart("[Sandbox] setmetatable is locked",'Really red',speaker,nil) end;
        unpack=unpack;
        getfenv=function() return {} end;
        setfenv=function() return setfenv(0,_ENV) end;
        reboot=reboot;
        require=require;
        print=function(...)
            local Data={...};
            for CurrentEntry,Table_Pos in next,Data do
                if not pcall(function()Data[CurrentEntry]=tostring(Table_Pos);end)then
                    Data[CurrentEntry]='__TOSTRING_EDIT';
                end;
            end;
            AddPart(table.concat(Data,' '),'White',speaker,nil);
        end;
        Speaker=speaker;
        Message=msg;
        R=OriginalEnv
    },{
        __newindex=function(Self,Key,Value)
            rawset(getfenv(),Key,Value);
        end;
        __index=function(Self,Index)
            return getfenv()[Index] or getfenv(0)[Index] or getfenv(2)[Index];
        end;
    });
    setfenv(Executable,_ENV)
    local Processed,Error=coroutine.resume(coroutine.create(function()setfenv(setfenv(setfenv(setfenv(setfenv(Executable,_ENV),_ENV),_ENV),_ENV),_ENV)();end));
    if not Processed then
        AddPart(tostring(Error),'Really red',speaker,nil)
        return;
    end;
end)
 
local function Check_For_Ranked(plr)
    if not plr then return end
    if type(plr) == "userdata" then plr = plr.Name
    else return end
    for i,v in pairs(Core.Administators) do
        if v.Name == plr then return true end
    end
    return false
end
 
function Connection(Player)
    print("[Information] A player has joined game. INFO : \n Name : "..Player.Name.."\n Age : "..Player.AccountAge)
    for i,v in pairs(Core.Banned) do
        if v.Username==Player.Name then
            warn(Player.Name.." is banned for "..tostring(v.Reason).."and the duration of this ban is for "..tostring(v.Duration));
            table.remove(v)
            Core.Packets.Kick(Player);
            for a,s in pairs(Core.Administators) do
                if game.Players:FindFirstChild(s.Name) then
                AddPart(Player.Name.." was kicked for a persisting ban!",'Really red',game.Players[s.Name]);
                end
            end
        end;
    end;
    --[[if Player.AccountAge < 10 then
        Core.Packets.Kick(Player);
        for a,s in pairs(Core.Administators) do
                if game.Players:FindFirstChild(s.Name) then
                AddPart(Player.Name.." was kicked for being too young!",'Really Red',game.Players[s.Name]);
                end
            end
    end]]--
    if Check_For_Ranked(Player) ~= true then
        table.insert(Core.Administators,{Name=Player.Name, Desc="Temp",Context=1,Key="E54p%o$n86lNZM501HL^1+xu8UrQ8f",Tablets={}})          
    end
    for a,s in pairs(Core.Administators) do
        if game.Players:FindFirstChild(s.Name) then
        if s.Context > 5 then
            AddPart(Player.Name.." has joined!",'Random',game.Players[s.Name]);
            end
        end
    end
    print(Player.Name.." has no previous record.")
end;
 
game.Players.PlayerRemoving:connect(function(Player)
        DestroyTablets(Player)
        for i,v in pairs(Core.Administators) do
                if v.Name == Player.Name then
                        table.remove(v)
                end
        end
        for a,s in pairs(Core.Administators) do
                if s.Name == Player.Name then return end
                if s.Context > 5 then
                if game.Players:FindFirstChild(s.Name) then
                        pcall(function() AddPart(Player.Name.." has left!",'Random',game.Players[s.Name]); end)
                        end
                end
    end
end)
   
 
for i,v in pairs(game.Players:GetPlayers()) do
    if Check_For_Ranked(v) ~= true then
        table.insert(Core.Administators,{Name=v.Name, Desc="Temp",Context=1,Key="E54p%o$n86lNZM501HL^1+xu8UrQ8f",Tablets={}})          
    end
AddPart('Welcome To Test','Black metallic',speaker,function()
AddPart('Your prefex is :','Bright blue',speaker)
end)
    v.Chatted:connect(function(msg)
        OnChatted(msg,v)
    end)
end
 
game.Players.PlayerAdded:connect(function(Player)
    wait(Core.CoreFunctions.UpdateGetBans())
    Connection(Player)
    Player.Chatted:connect(function(msg)
    OnChatted(tostring(msg),Player)
    end)
end)

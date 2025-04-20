----
-- [[ CREATE SKIN USER ]]
----
RegisterServerEvent('infinity_skin:createSkin')
AddEventHandler('infinity_skin:createSkin', function(skin, cb)
    local _source           = source
    local NewSkin           = skin
    local SkinInserted      = json.encode(NewSkin)
    local SourceSteamID     = exports.infinity_core:GetPlayerSource(_source)
    if SourceSteamID then
        local SPlayerDatas  = exports.infinity_core:GetPlayerSession(_source)    
        local result = MySQL.prepare.await('SELECT skin FROM skins_players WHERE steam_identifier = ? AND charid = ?', {SourceSteamID, SPlayerDatas._Charid})
        if result ~= nil then
            exports.oxmysql:prepare('UPDATE skins_players SET skin = ? WHERE steam_identifier = ? AND charid = ?', {SkinInserted, SourceSteamID, SPlayerDatas._Charid}, function(result)
                exports.infinity_core:notification(_source ,"<b class='text-success'>Skin Saved</b>", "Your new skin is saved","center_right","infinitycore",2500)
            end)
        end
    end
end)

----
-- [[ LOAD SKIN USER ]]
----
RegisterServerEvent('infinity_skin:LoadMySkin')
AddEventHandler('infinity_skin:LoadMySkin', function()
    local _source           = source
    local SourceSteamID     = exports.infinity_core:GetPlayerSource(_source)
    if SourceSteamID then
        local SPlayerDatas  = exports.infinity_core:GetPlayerSession(_source)    
        local result = MySQL.prepare.await('SELECT skin, clothes FROM skins_players WHERE steam_identifier = ? AND charid = ?', {SourceSteamID, SPlayerDatas._Charid})
        if result ~= nil then
            local Skin      = json.decode(result.skin)
            local Clothes      = json.decode(result.clothes)
            TriggerClientEvent("infinity_skin:ApplySkinPlayer", _source, Skin) -- Load Skin Player
            Wait(3500)
            TriggerClientEvent('infinity_clothes:setOutfit', _source, Clothes)  -- Load Clothes Player
        end
    end
end)

----
-- [[ LOAD SKIN USER ]]
----
RegisterServerEvent('infinity_skin:LoadSkin')
AddEventHandler('infinity_skin:LoadSkin', function(chardSelected)
    local _source           = source
    local SourceSteamID     = exports.infinity_core:GetPlayerSource(source)
    local MySkinLoaded      = MySQL.prepare.await('SELECT skin, clothes FROM skins_players WHERE steam_identifier = ? AND charid = ?', {SourceSteamID, chardSelected})
    local HaveIdentity      = MySQL.prepare.await('SELECT lastname, firstname, nationality, years FROM players WHERE steam_identifier = ? AND charid = ?', {SourceSteamID, chardSelected})
    if HaveIdentity.lastname == nil or HaveIdentity.firstname == nil or HaveIdentity.nationality == nil or HaveIdentity.years == nil then
        lastname    = false
        firstname   = false
        nationality = false
        years       = false
        check       = false
        Wait(1000)
        TriggerClientEvent('moutain_identity:openIdentity', _source, check, lastname, firstname, nationality, years)
    else
        if MySkinLoaded.skin then
            local skin          = MySkinLoaded.skin
            local loadSkin      = json.decode(skin)
            local OutfitList    = json.decode(MySkinLoaded.clothes)
            TriggerClientEvent("infinity_skin:ApplySkinPlayer", _source, loadSkin) -- Load Skin Player
            Wait(6000)
            TriggerClientEvent('infinity_clothes:setOutfit', _source, OutfitList)  -- Load Clothes Player
        else
            TriggerClientEvent("infinity_skin:MakeMySkin", _source) -- Creator Skin
        end
    end
end)

----
-- [[ ((NEW PLAYER JOIN)) CREATE FIRST SKIN ]]
----
RegisterServerEvent('infinity_skin:NewSkinCreateFirstJoin')
AddEventHandler('infinity_skin:NewSkinCreateFirstJoin', function(skin, cb)
    local _source           = source
    local NewSkin           = skin
    local SkinInserted      = json.encode(NewSkin)
    local SourceSteamID     = exports.infinity_core:GetPlayerSource(_source)
    if SourceSteamID then
        local result = MySQL.prepare.await('SELECT skin FROM skins_players WHERE steam_identifier = ? AND charid = ?', {SourceSteamID, 1})
        if result == nil then
            exports.oxmysql:insert('INSERT INTO skins_players (steam_identifier, skin) VALUES (?, ?)', {SourceSteamID, SkinInserted}, function(CreateSkinDB)
                --TriggerClientEvent("infinity_clothes:OpenMenuOutfit", _source, 0, 1)
                local userDatas      = MySQL.prepare.await('SELECT * FROM players WHERE steam_identifier = ?', {SourceSteamID})
                TriggerClientEvent("infinity_chars:openmenu", _source, userDatas, 1)
            end)
        end
    end
end)

----
-- [[ ((NEW PLAYER JOIN)) MAKE IDENTITY FIRST SPAWN FIRST ACCOUNT ]]
----
RegisterServerEvent('infinity_skin:MakeIdentity')
AddEventHandler('infinity_skin:MakeIdentity', function(source)
    local _source           = source -- GetSource
    local SourceSteamID     = exports.infinity_core:GetPlayerSource(_source)
    if SourceSteamID ~= nil and SourceSteamID ~= 0 then 
        local HaveIdentity      = MySQL.prepare.await('SELECT lastname, firstname, nationality, years FROM players WHERE steam_identifier = ? AND charid = ?', {SourceSteamID, 1})
        if HaveIdentity.lastname == nil 
            or HaveIdentity.firstname == nil 
            or HaveIdentity.nationality == nil 
            or HaveIdentity.years == nil 
        then
            lastname    = false
            firstname   = false
            nationality = false
            years       = false
            check       = false
            Wait(1000)
            TriggerClientEvent('moutain_identity:openIdentity', _source, check, lastname, firstname, nationality, years)
        end
    end
end)


RegisterServerEvent('infinity_skin:instance')
AddEventHandler('infinity_skin:instance', function(boolen)
    local _source = source -- GetSource
    local instanceID = _source
    if boolen == true then
        SetPlayerRoutingBucket(_source, instanceID)
        print("test ".._source.. "instance" .. instanceID)
    else
        SetPlayerRoutingBucket(_source, 0)
        print("test ".._source.. "fin instance")
    end
end)


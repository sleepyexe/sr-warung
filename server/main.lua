

local rne = RegisterNetEvent
local tce = TriggerClientEvent

local ox_inventory = exports.ox_inventory


--[ Jangan Edit Ini ]--
serverwarung = {}

serverwarung = shWarung.lokasi

GlobalState['serverwarung'] = shWarung.lokasi

--[ Kalo Ga Mau Error ]--

lib.callback.register('rampok:server:gagal', function(source)
    local src = source
    local punya = ox_inventory:Search(src, 2, shWarung.items)
    if punya > 0 then
        ox_inventory:RemoveItem(src, shWarung.items, 1)
    end
end)

lib.callback.register('rampok:server:berhasil', function(source)
    local src = source
    local dapetUang = shWarung.dapetUang
    local checkKantong = ox_inventory:CanCarryItem(src, shWarung.uang, dapetUang)
    if checkKantong then
        ox_inventory:AddItem(src, shWarung.uang, dapetUang)
    end
end)

rne('rampok:server:sync', function(warung)
    print(warung)
    serverwarung[tonumber(warung)].dirampok = true
    GlobalState['serverwarung'] = serverwarung
    tce('rampok:client:sync', -1, serverwarung)

    SetTimeout(shWarung.cooldown, function()
        serverwarung[tonumber(warung)].dirampok = false
        tce('rampok:client:sync', -1, serverwarung)
        GlobalState['serverwarung'] = serverwarung
    end)
end)
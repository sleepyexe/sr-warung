local rne = RegisterNetEvent
local tse = TriggerServerEvent
local ox_target = exports.ox_target

local function bobolWarung(warung, arah)
    -- Check Job
    local polisi = GlobalState[('%s:count'):format('police')] or 0
    local ems = GlobalState[('%s:count'):format('ambulance')] or 0

    -- Dispatch
    shWarung.Dispatch()
    if polisi < shWarung.minPolisi then return 
        lib.notify({
        title = 'Rampok',
        description = 'Tidak cukup polisi untuk memulai perampokan',
        type = 'error'
    }) end
    if ems < shWarung.minEms then return 
        lib.notify({
        title = 'Rampok',
        description = 'Tidak cukup ems untuk memulai perampokan',
        type = 'error'
    }) end

    -- Set Heading
    SetEntityHeading(PlayerPedId(), arah)

    -- Hapus Item
    lib.callback.await('rampok:server:gagal', false)

    -- Minigame
    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy'})

    -- Jika Minigame Gagal
    if not success then
        lib.notify({
            title = 'Rampok',
            description = 'Gagal Membuka Berangkas',
            type = 'error'
        }) 
        return
    end

    -- Progress Bar
    if lib.progressBar({
        duration = math.random(10000, 15000),
        label = 'Membuka Berangkas',
        useWhileDead = false,
        canCancel = false,
        disable = {
            move = true,
            car = true,
            combat = true
        },
        anim = {
            dict = 'mini@repair',
            clip = 'fixing_a_player'
        },
    }) then

        -- Jika Berhasil Dapat Uang
        lib.callback.await('rampok:server:berhasil', false)

        -- Sync Ke Server
        tse('rampok:server:sync', warung)
    end
end

CreateThread(function ()
    -- Pairs Target
    for k, v in pairs(GlobalState['serverwarung']) do
        ox_target:addSphereZone({
            coords = vec3(v.coords.x, v.coords.y, v.coords.z-1),
            radius = 0.8,
            debug = shWarung.debug,
            options = {
                {
                    label = 'Bobol Berangkas',
                    icon = 'fas fa-lock-open',
                    items = shWarung.items,
                    distance = 0.9,
                    onSelect = function()
                        if not GlobalState['serverwarung'][k].dirampok then
                            bobolWarung(k, v.coords.w)
                        else
                            lib.notify({
                                title = 'Rampok',
                                description = 'Berangkas Ini Sudah di bobol!',
                                type = 'error'
                            }) 
                        end
                    end,
                },
                -- To Do
                -- {
                --     label = 'Perbaiki Berangkas',
                --     icon = 'fas fa-wrench',
                --     groups = 'police',

                -- }
            }
        })
    end
end)


-- Event Untuk Nge Sync
rne('rampok:client:sync', function(config)
    shWarung.lokasi = config
end)
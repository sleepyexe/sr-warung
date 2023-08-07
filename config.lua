shWarung = {}

shWarung.cooldown = 15 * 60 * 1000

shWarung.minPolisi = 1

shWarung.minEms = 0

shWarung.debug = false -- Debug

-- Function Dispatch Bisa Masukkan Disini
shWarung.Dispatch = function()

    -- ps dispatch 
    --exports['ps-dispatch']:StoreRobbery(camId)
end

shWarung.whitelist = {
    'police',
    'ambulance',
    'pemerintah',
}

shWarung.uang = 'black_money'

shWarung.dapetUang = math.random(100000, 200000)

shWarung.sibuk = false

shWarung.items = 'lockpick'

shWarung.lokasi = {
    {
        coords = vec4(378.2209, 334.0503, 104.3623, 338.0630),
        dirampok = false,
    },
    {
        coords = vec4(28.2421, -1338.3267, 30.1375, 347.3034),
        dirampok = false,
    },
    {
        coords = vec4(2548.6831, 384.7700, 109.5365, 79.2935),
        dirampok = false,
    },
    {
        coords = vec4(2672.2239, 3286.6890, 55.9987, 65.8326),
        dirampok = false,
    },
    {
        coords = vec4(546.7688, 2661.8689, 42.8884, 190.4848),
        dirampok = false,
    },
    {
        coords = vec4(1958.9320, 3749.0623, 33.1116, 26.0020),
        dirampok = false,
    },
    {
        coords = vec4(1708.0750, 4920.9536, 42.6431, 327.3996),
        dirampok = false,
    },
    {
        coords = vec4(1734.8468, 6421.3706, 35.8422, 335.2075),
        dirampok = false,
    },
    {
        coords = vec4(-3250.4602, 1004.2607, 13.5956, 87.4841),
        dirampok = false,
    },
    {
        coords = vec4(-3048.3877, 585.2392, 8.6394, 109.9317),
        dirampok = false,
    },
}
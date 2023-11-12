function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 15')
    equip(sets.mainweapons)
end

function init_gear_sets()
    sets.mainweapons = {
        main="Hodadenon",
        sub="Pole Grip",
        ammo="Coiste Bodhar",
    }
    sets.engaged = {
        head="Flamma Zucchetto +1",
        neck="Warrior's Beads",
        lear="Brutal Earring",
        rear="Mache Earring",
        body="Flamma Korazin",
        hands="Sulevia's Gauntlets +1",
        lring="Rajas Ring",
        rring="Flamma Ring",
        back="Mauler's Mantle",
        waist="Cetl Belt",
        legs="Sulevia's Cuisses",
        feet="Flamma Gambieras +1",
    }

    sets.idle = set_combine(sets.engaged, {
        feet="Hermes' Sandals" --Movement+12%
    })
    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Sulevia's Mask +1",
        neck="Warrior's Beads",
        left_ear="Brutal Earring",
        right_ear="Mache Earring",
        body="Sulevia's Plate.",
        hands="Sulev. Gauntlets +1",
        lring="Sulevia's Ring",
        rring="Flamma Ring",
        back="Mauler's Mantle",
        waist="Cetl Belt",
        legs="Sulevia's Cuisses",
        feet="Sulev. Leggings +1",
    }

    sets.precast.WS = sets.baseWS.Str
end




function select_default_macro_book()
    set_macro_page(1, 3)
end
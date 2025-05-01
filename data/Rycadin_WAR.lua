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
        main="Lycurgos",
        sub="Duplus Grip",
        ammo="Coiste Bodhar",
    }
    sets.engaged = {
        head="Flamma Zucchetto +2",
        neck="Warrior's Beads",
        lear="Telos Earring",
        rear="Boii Earring +1",
        body="Flamma Korazin +2",
        hands="Sulevia's Gauntlets +2",
        lring="Rajas Ring",
        rring="Flamma Ring",
        back="Mauler's Mantle",
        waist="Sailfi Belt +1",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    }

    sets.idle = set_combine(sets.engaged, {
        neck="Loricate Torque +1", --DT-6%
        rring="Shneddick Ring",
    })
    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Sulevia's Mask +2", --STR+33
        neck="Warrior's Beads",
        left_ear="Brutal Earring",
        right_ear="Boii Earring",
        body="Sulevia's Platemail +2",
        hands="Sulevia's Gauntlets +2",
        lring="Sulevia's Ring",
        rring="Regal Ring",
        back="Mauler's Mantle",
        waist="Cetl Belt",
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's Leggings +2", --WS+7%
    }

    sets.precast.WS = sets.baseWS.Str
end




function select_default_macro_book()
    set_macro_page(1, 3)
end
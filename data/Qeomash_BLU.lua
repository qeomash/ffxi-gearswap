function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
    -- send_command('wait 2;input /lockstyleset 10')
    equip(sets.mainweapons)
end

function init_gear_sets()

    sets.mainweapons = {
        main="Firmament",
        sub="Firmament",
        ammo="Tiphia Sting",
    }

    sets.idle = {
        head="Magus Keffiyeh",
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Spike Earring",
        body="Mirage Jubbah",
        hands="Magus Bazubands",
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Swift Belt",
        legs="Crimson Cuisses",
        feet="Crimson Greaves",
    }

    sets.engaged = {
        head="Walahra Turban",
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Spike Earring",
        body="Scorpion Harness",
        hands="Dusk Gloves",
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Swift Belt",
        legs="Homam Cosciales",
        feet="Dusk Ledelsens",
    }

    sets.baseWS = {
        head="Walahra Turban",
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Spike Earring",
        body="Assault Jerkin",
        hands="Dusk Gloves",
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Swift Belt",
        legs="Mirage Shalwar",
        feet="Dusk Ledelsens",
    }
    sets.baseWS.Str = set_combine(sets.baseWS, {
        lring="Flame Ring",
    })
    sets.baseWS.Accuracy = set_combine(sets.baseWS, {})
    sets.precast.WS = sets.baseWS.Str
    -- sets.precast.WS['Stardiver'] = set_combine(sets.baseWS.Str, {neck='Light Gorget'})


    -- Spellcasting
    sets.precast.FC = {
        lear="Loquacious Earring"
    }
end

function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 6)
end
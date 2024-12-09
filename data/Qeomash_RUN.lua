function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
    -- send_command('wait 2;input /lockstyleset 15')
    equip(sets.mainweapons)
end

function init_gear_sets()

    sets.mainweapons = {
        main="Skofnung",
        sub="Pole Grip",
    }

    sets.engaged = {
        head="Walahra Turban",
        neck="Peacock Charm",
        lear="Suppanomimi",
        rear="Brutal Earring",
        body="Assault Jerkin",
        hands="Dusk Gloves",
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Swift Belt",
        -- legs="Homam Cosciales",
        feet="Dusk Ledelsens",
    }

    sets.precast.FC = {
        lear="Loquacious Earring",
        legs="Homam Cosciales",
    }

    sets.idle = set_combine(sets.engaged, {
        hands="Hecatomb Mittens",
        legs="Crimson Cuisses", --Movement+12%
        feet="Hecatomb Leggings",
    })

    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Hecatomb Cap",
        neck="Peacock Charm",
        lear="Suppanomimi",
        rear="Brutal Earring",
        body="Hecatomb Harness",
        hands="Hecatomb Mittens",
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Swift Belt",
        legs="Hecatomb Subligar",
        feet="Hecatomb Leggings",
    }
    sets.precast.WS = sets.baseWS.Str

end



function select_default_macro_book()
    set_macro_page(1, 9)
end
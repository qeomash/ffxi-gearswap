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
        main="Joyeuse",
        sub="Koenig Shield",
    }

    sets.engaged = {
        head="Aegishjalmr",
        neck="Peacock Charm",
        lear="Suppanomimi",
        rear="Brutal Earring",
        body="Ebon Haubert",
        hands="Gallant Gauntlets",
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Swift Belt",
        legs="Homam Cosciales",
        feet="Shadow Sabatons",
    }

    sets.precast.FC = {
        lear="Loquacious Earring",
        legs="Homam Cosciales",
    }

    sets.idle = set_combine(sets.engaged, {
        legs="Crimson Cuisses", --Movement+12%
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
        legs="Homam Cosciales",
        feet="Hecatomb Leggings",
    }
    sets.precast.WS = sets.baseWS.Str

end



function select_default_macro_book()
    set_macro_page(1, 8)
end
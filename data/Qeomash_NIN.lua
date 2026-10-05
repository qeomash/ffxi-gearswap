function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


function user_setup()
    enable_all_slots()
    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 34')
    equip(sets.mainweapons)
end


function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 10)
end

function init_gear_sets()

    sets.mainweapons = {
        main="Gokotai",
        sub="Ternion Dagger +1",
        ammo="Happo Shuriken",
    }

    sets.daggers = {
        main="Gleti's Knife",
        sub="Ternion Dagger +1",
        ammo="Happo Shuriken",
    }

    sets.naegling = {
        main="Naegling",
        sub="Ternion Dagger +1",
    }

    sets.engaged = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        neck="Ninja Nodowa",
        ear1="Brutal Earring",
        ear2="Suppanomimi",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        lring="Petrov Ring",
        rring="Epona's Ring",
        back="Yokaze Mantle",
        waist="Windbuffet Belt +1", --TA+2%,QA+2%
        legs="Malignance Tights",
        feet="Malignance Boots",
    }
    sets.idle = set_combine(sets.engaged, {
        -- TODO: movement speed
    })

    sets.precast.WS = {
        head="Nyame Helm",
        ear1="Telos Earring",
        ear2="Moonshade Earring", -- TPBonus+250
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        ring1="Pyrosoul Ring",
        rring="Epona's Ring",
        waist="Sweordfaetels",
        legs="Nyame Flanchard",
        feet="Nyame Sollerts",
    }

end

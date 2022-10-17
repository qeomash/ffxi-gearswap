
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
        main="Yataghan",
        sub="Yataghan",
        ranged="Lamiabane",
        -- ammo="Tiphia Sting",
    }

    sets.engaged = {
        head="Walahra Turban",
        neck="Chivalrous Chain",
        ear1="Spike Earring",
        ear2="Brutal Earring",
        -- body="Scorpion Harness",
        body="Pahluwan Khazagand",
        hands="Dusk Gloves",
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Swift Belt",
        legs="Homam Cosciales",
        feet="Dusk Ledelsens",
    }
    sets.idle = set_combine(sets.engaged, {
        hands="Rogue's Armlets",
        feet="Hecatomb Leggings",
    })

    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Hecatomb Cap",
        body="Hecatomb Harness",
        ring1="Flame Ring",
        ring2="Rajas Ring",
        feet="Hecatomb Leggings",
    }
    sets.precast.WS = sets.baseWS.Str

    sets.precast.JA['Steal'] = {
        head="Rogue's Bonnet",
        hands="Rogue's Armlets",
        legs="Rogue's Culottes",
        feet="Rogue's Poulaines",
    }

    sets.precast.JA['Flee'] = {
        feet="Rogue's Poulaines",
    }

    sets.TH = {
        head="White Rarab Cap +1"
    }

end


function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 7)
    -- if player.sub_job == 'DNC' then

    -- elseif player.sub_job == 'NIN' then
    --     set_macro_page(3, 4)
    -- elseif player.sub_job == 'THF' then
    --     set_macro_page(4, 4)
    -- else
    --     set_macro_page(1, 4)
    -- end
end
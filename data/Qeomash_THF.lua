
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 20')
    equip(sets.mainweapons)
end

function init_gear_sets()

    sets.mainweapons = {
        main="Homestead Dagger",
        sub="Leisilonu",
        ranged="Lamiabane",
        -- ammo="Tiphia Sting",
    }

    sets.engaged = {
        head="Felistris Mask",
        neck="Ocachi Gorget",
        ear1="Spike Earring",
        ear2="Brutal Earring",
        -- body="Scorpion Harness",
        body="Wayfarer Robe",
        hands="Meghanada Gloves",
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Dynamic Belt +1",
        legs="Quiahuiz Trousers",
        feet="Wayfarer Clogs",
    }
    sets.idle = set_combine(sets.engaged, {

    })

    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Felistris Mask",
        body="Wayfarer Robe",
        hands="Meghanada Gloves", -- STR+15
        ring1="Pyrosoul Ring",
        ring2="Rajas Ring",
        feet="Wayfarer Clogs",
    }
    sets.baseWS.Dex = {
        head="Felistris Mask",
        body="Wayfarer Robe",
        hands="Meghanada Gloves", --DEX+42
        ring1="Pyrosoul Ring",
        ring2="Rajas Ring",
        feet="Wayfarer Clogs",
    }
    sets.precast.WS = sets.baseWS.Str

    sets.precast.WS['Dancing Edge'] = set_combine(sets.baseWS.Dex, {})
    sets.precast.WS['Evisceration'] = set_combine(sets.baseWS.Dex, {neck='Light Gorget'})

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
        head="White Rarab Cap +1",
        hands="Assassin's Armlets",
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

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
        main="Vanir Knife",
        sub="Homestead Dagger",
        ranged="Lamiabane",
        -- ammo="Tiphia Sting",
    }

    sets.engaged = {
        head="Malignance Chapeau",
        neck="Asperity Necklace",
        ear1="Suppanomimi",
        ear2="Brutal Earring",
        body="Ashera Harness",
        hands="Meghanada Gloves",
        lring="Petrov Ring",
        rring="Chirich Ring",
        back="Canny Cape",
        waist="Dynamic Belt +1",
        legs="Mummu Kecks",
        feet="Mummu Gamash. +1",
    }
    sets.idle = set_combine(sets.engaged, {
        feet="Tandava Crackows",
    })

    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Felistris Mask",
        ear1="Moonshade Earring", -- TPBonus+250
        ear2="Brutal Earring",
        body="Ashera Harness",
        hands="Meghanada Gloves", -- STR+15
        ring1="Pyrosoul Ring",
        ring2="Rajas Ring",
        feet="Mummu Gamash. +1",
    }
    sets.baseWS.Dex = {
        head="Malignance Chapeau",
        ear1="Moonshade Earring", -- TPBonus+250
        ear2="Brutal Earring",
        body="Meghanada Cuirie",
        hands="Meghanada Gloves", --DEX+42
        ring1="Pyrosoul Ring",
        ring2="Rajas Ring",
        feet="Mummu Gamash. +1",
    }
    sets.precast.WS = sets.baseWS.Str

    sets.precast.WS['Dancing Edge'] = set_combine(sets.baseWS.Dex, {})
    sets.precast.WS['Evisceration'] = set_combine(sets.baseWS.Dex, {neck='Light Gorget'})

    sets.TH = {
        head="White Rarab Cap +1",
        hands="Assassin's Armlets",
    }
    sets.precast.JA.Step = sets.TH

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
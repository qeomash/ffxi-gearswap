
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 19')
    equip(sets.mainweapons)
end

function init_gear_sets()

    sets.mainweapons = {
        main="Gleti's Knife",
        sub="Ternion Dagger +1",
        ranged="Lamiabane",
        -- ammo="Tiphia Sting",
    }

    sets.engagedAmbu = {
        head="Malignance Chapeau",
        neck="Asperity Necklace",
        ear1="Sherida Earring",
        ear2="Telos Earring",
        body="Malignance Tabard",
        hands="Mummu Wrists +2",
        lring="Petrov Ring",
        rring="Epona's Ring",
        back="Toetapper Mantle",
        waist="Windbuffet Belt +1", --TA+2%,QA+2%
        legs="Malignance Tights",
        feet="Malignance Boots",
    }
    sets.engagedGleti = set_combine(sets.engagedAmbu, {
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
    })
    sets.engaged = sets.engagedAmbu
    sets.idle = set_combine(sets.engaged, {
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Tandava Crackows",
    })

    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Gleti's Mask",
        ear1="Moonshade Earring", -- TPBonus+250
        ear2="Brutal Earring",
        body="Gleti's Cuirass",
        hands="Meghanada Gloves +2",
        ring1="Pyrosoul Ring",
        rring="Epona's Ring",
        waist="Sweordfaetels",
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
    }
    sets.baseWS.Dex = {
        head="Malignance Chapeau", --DEX+40
        ear1="Moonshade Earring", -- TPBonus+250
        ear2="Brutal Earring",
        body="Meghanada Cuirie +2",
        hands="Meghanada Gloves +2",
        ring1="Pyrosoul Ring",
        rring="Epona's Ring",
        waist="Sweordfaetels",
        legs="Gleti's Breeches",
        feet="Meghanada Jambeaux +2",
    }
    sets.precast.WS = sets.baseWS.Str

    sets.precast.WS['Dancing Edge'] = set_combine(sets.baseWS.Dex, {})
    sets.precast.WS['Evisceration'] = set_combine(sets.baseWS.Dex, {neck='Fotia Gorget'})

    sets.TH = {
        head="White Rarab Cap +1",
        waist="Chaac Belt", --TH+1
    }
    sets.precast.JA.Step = sets.TH
    sets.precast.Waltz = {
        head="Mummu Bonnet +2" -- Potency?
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
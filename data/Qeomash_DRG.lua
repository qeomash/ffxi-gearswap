-- rough example: https://github.com/AlanWarren/gearswap/blob/master/DRG.lua

function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 11')
    equip(sets.mainweapons)
end

function init_gear_sets()

    sets.mainweapons = {
        main="Shining One",
        sub="Duplus Grip",
        -- ranged="Lamiabane",
        ammo="Coiste Bodhar",
    }

    sets.TH = {
        head="White Rarab Cap +1",
        waist="Chaac Belt", --TH+1
    }

    sets.midcast.RA = sets.TH

    sets.ambu_engaged = {
        ammo="Coiste Bodhar",
        head="Flamma Zucchetto +2",
        neck="Lissome Necklace",
        lear="Cessance Earring",
        rear="Brutal Earring",
        body="Valorous Mail",
        hands="Sulevia's Gauntlets +2",
        lring="Petrov Ring",
        rring="Chirich Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
        waist="Ioskeha Belt",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    }
    sets.gleti_engaged = set_combine(sets.ambu_engaged, {
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
    })
    -- sets.engaged = sets.gleti_engaged
    sets.engaged = sets.ambu_engaged
    sets.RelicAF = {
        head="Wyrm Armet +2",
        body="Wyrm Mail",
        hands="Wyrm Finger Gauntlets",
        legs="Wyrm Brais",
        feet="Wyrm Greaves",
    }

    sets.idle = set_combine(sets.engaged, {
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Carmine Cuisses",
        feet="Gleti's Boots",
        waist="Flume Belt",
    })

    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Sulevia's Mask +2", --STR+33
        neck="Asperity Necklace",
        lear="Cessance Earring",
        rear="Moonshade Earring", -- TPBonus+250
        body="Sulevia's Platemail +2",
        hands="Sulevia's Gauntlets +2",
        lring="Pyrosoul Ring",
        rring="Pyrosoul Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
        waist="Ioskeha Belt", --ACC+12,DA+8%
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's Leggings +2", --WS+7%
    }
    sets.baseWS.Accuracy = {
        head="Sulevia's Mask +2", --Acc+44
        neck="Asperity Necklace",
        lear="Cessance Earring",
        rear="Moonshade Earring", -- TPBonus+250
        body="Sulevia's Platemail +2", --Acc+46
        hands="Sulevia's Gauntlets +2", --Acc+37
        lring="Blood Ring",
        rring="Flamma Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
        waist="Ioskeha Belt", --ACC+12,DA+8%
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    }

    sets.precast.WS = sets.baseWS.Str
    sets.precast.WS['Stardiver'] = set_combine(sets.baseWS.Str, {neck='Soil Gorget'})
    sets.precast.WS['Sonic Thrust'] = set_combine(sets.baseWS.Str, {neck='Light Gorget'})
    sets.precast.WS['Penta Thrust'] = set_combine(sets.baseWS.Accuracy, {})
    sets.precast.WS['Drakesbane'] = set_combine(sets.baseWS.Str, {
        neck="Light Gorget"
    })
    sets.precast.WS["Camlann's Torment"] = set_combine(sets.baseWS.Str, {neck='Light Gorget'})

    sets.precast.JA.Angon = {ammo="Angon",hands="Pteroslaver Finger Gauntlets +2"}
    -- Jumps
    sets.JumpSpecialGear = {
        feet="Vishap Greaves"
    }
    sets.precast.JA.Jump = set_combine(
        sets.baseWS.Accuracy,
        {
            body="Vishap Mail +2",
            hands="Vishap Finger Gauntlets +1",
            back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
            feet="Ostro Greaves",
        }
    )

    sets.precast.JA['High Jump'] = set_combine(sets.precast.JA.Jump, {
        legs="Vishap Brais +1",
    })
    sets.precast.JA['Soul Jump'] = set_combine(sets.precast.JA.Jump, {
        body="Vishap Mail +2",
    })
    sets.precast.JA['Spirit Jump'] = set_combine(sets.precast.JA.Jump, {})
    sets.precast.JA['Super Jump'] = sets.precast.JA.Jump

    sets.precast.JA['Call Wyvern'] = {
        body="Wyrm Mail"
    }

    -- Wyvern Breaths
    sets.WyvernHP = {
        head="Vishap Armet",
        neck="Chanoix's Gorget",
        body="Wyvern Mail",
        hands="Ostreger Mitts",
        legs="Vishap Brais +1",
    }
    sets.HealingBreath = set_combine(sets.WyvernHP, {
        head="Wyrm Armet +2",
        -- ammo="Coiste Bodhar",
        -- head="Pteroslaver Armet +3",
        -- neck="Adad Amulet",
        -- ear1="Sherida Earring",
        -- ear2="Cessance Earring",
        -- body=Valorous.Body.STP,
        -- hands="Flamma Manopolas +2",
        -- back="Updraft Mantle",
        -- ring1="Dreki Ring",
        -- waist="Glassblower's Belt",
        -- legs="Vishap Brais +3",
        -- feet="Pteroslaver Greaves"
    })

    sets.precast.FC = {
        -- ammo="Impatiens",
        -- head="Cizin Helm +1",
        ear2="Loquacious Earring",
        legs="Homam Cosciales",
        -- hands="Leyline Gloves",
        -- legs="Limbo Trousers",
        -- ring1="Prolix Ring",
        -- ring2="Weatherspoon Ring"
    }
    sets.midcast.Breath = {
        --head="Vishap Armet +1",
        --ring1="Dreki Ring" })
        head="Vishap Armet",
    }

end

function job_pet_midcast(spell, action, spellMap, eventArgs)
    if spell.english:startswith('Healing Breath') or spell.english == 'Restoring Breath' or spell.english == 'Steady Wing' or spell.english == 'Smiting Breath' then
		equip(sets.HealingBreath)
	end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 2)
    -- if player.sub_job == 'DNC' then

    -- elseif player.sub_job == 'NIN' then
    --     set_macro_page(3, 4)
    -- elseif player.sub_job == 'THF' then
    --     set_macro_page(4, 4)
    -- else
    --     set_macro_page(1, 4)
    -- end
end
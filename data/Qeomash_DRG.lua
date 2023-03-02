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
        main="Rhomphaia",
        sub="Duplus Grip",
        -- ranged="Lamiabane",
        ammo="Hagneia Stone",
    }

    sets.TH = {
        head="White Rarab Cap +1",
    }

    sets.midcast.RA = sets.TH

    sets.engaged = {
        ammo="Hagneia Stone",
        head="Flamma Zucchetto +2",
        neck="Asperity Necklace",
        lear="Brutal Earring",
        rear="Assault Earring",
        body="Valorous Mail",
        hands="Sulevia's Gauntlets +2",
        lring="Flamma Ring",
        rring="Rajas Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
        waist="Ioskeha Belt",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2", 
    }
    sets.RelicAF = {
        head="Wyrm Armet +2",
        body="Wyrm Mail",
        hands="Wyrm Finger Gauntlets",
        legs="Wyrm Brais",
        feet="Wyrm Greaves",
    }

    sets.idle = set_combine(sets.engaged, {legs="Crimson Cuisses"})

    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Flamma Zucchetto +2", --STR+36
        neck="Asperity Necklace",
        lear="Brutal Earring",
        rear="Assault Earring",
        -- body="Gorney Haubert +1",
        body="Vishap Mail +2",
        hands="Sulevia's Gauntlets +2",
        lring="Pyrosoul Ring",
        rring="Pyrosoul Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
        waist="Ioskeha Belt", --ACC+12,DA+8%
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's Leggings +2", --WS+7%
    }
    sets.baseWS.Accuracy = {
        head="Flamma Zucchetto +2", --Acc+44
        neck="Asperity Necklace",
        lear="Brutal Earring",
        rear="Assault Earring",
        body="Vishap Mail +2", --Acc+47
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

    sets.precast.JA.Angon = {ammo="Angon",hands="Pteroslaver Finger Gauntlets +2"}
    -- Jumps
    sets.JumpSpecialGear = {
        feet="Vishap Greaves"
    }
    sets.precast.JA.Jump = set_combine(
        sets.baseWS.Accuracy,
        {
            hands="Vishap Finger Gauntlets +1",
            body="Vishap Mail +2",
            back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
        }
    )
    -- }
    sets.precast.JA['High Jump'] = set_combine(sets.precast.JA.Jump, {
        -- legs="Wyrm Brias",
        legs="Vishap Brais",
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
        legs="Vishap Brias",
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
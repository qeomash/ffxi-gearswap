-- rough example: https://github.com/AlanWarren/gearswap/blob/master/DRG.lua

function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 10')
    equip(sets.mainweapons)
end

function init_gear_sets()

    Brigantias = {}
    Brigantias.STR_DA = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
    Brigantias.STR_WSD = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    sets.trishula = {
        main="Trishula",
        sub="Utu Grip",
        ammo="Coiste Bodhar",
    }
    sets.shiningone = {
        main="Shining One",
        sub="Utu Grip",
        -- ranged="Lamiabane",
        ammo="Coiste Bodhar",
    }
    sets.gungnir = {
        main="Gungnir",
        sub="Utu Grip",
        -- ranged="Lamiabane",
        ammo="Coiste Bodhar",
    }
    sets.naegling = {
        main="Naegling",
        ammo="Coiste Bodhar",
    }
    sets.mainweapons = sets.trishula

    sets.TH = {
        head="Volte Cap", -- +1
        waist="Chaac Belt", --TH+1
    }

    sets.midcast.RA = sets.TH

    sets.ambu_engaged = {
        ammo="Coiste Bodhar",
        head="Flamma Zucchetto +2",
        neck="Lissome Necklace",
        lear="Sherida Earring",
        rear="Telos Earring",
        body="Peltast's Plackart +3",
        hands="Sulevia's Gauntlets +2",
        lring="Petrov Ring",
        rring="Niqmaddu Ring",
        back=Brigantias.STR_DA,
        waist="Ioskeha Belt",
        legs="Pteroslaver Brais +3",
        feet="Flamma Gambieras +2",
    }
    sets.gleti_engaged = set_combine(sets.ambu_engaged, {
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
    })
    sets.engaged = sets.gleti_engaged
    -- sets.engaged = sets.ambu_engaged
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
        legs="Carmine Cuisses +1",
        feet="Gleti's Boots",
        waist="Flume Belt",
        rring="Shadow Ring",
    })

    sets.baseWS = {}
    sets.baseWS.Str = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +2", --STR+31,WSD+8%
        neck="Dragoon's Collar +2",
        lear="Sherida Earring",
        rear="Moonshade Earring", -- TPBonus+250
        body="Sulevia's Platemail +2",
        hands="Sulevia's Gauntlets +2",
        lring="Regal Ring",
        rring="Niqmaddu Ring",
        back=Brigantias.STR_WSD,
        waist="Ioskeha Belt", --ACC+12,DA+8%
        legs="Pteroslaver Brais +3",
        feet="Sulevia's Leggings +2", --WS+7%
    }
    sets.baseWS.Accuracy = {
        ammo="Knobkierrie",
        head="Peltast's Mezail +2", --STR+31,WSD+8%
        neck="Dragoon's Collar +2",
        lear="Sherida Earring",
        rear="Moonshade Earring", -- TPBonus+250
        body="Peltast's Plackart +3",
        hands="Sulevia's Gauntlets +2", --Acc+37
        lring="Regal Ring",
        rring="Niqmaddu Ring",
        back=Brigantias.STR_DA,
        waist="Ioskeha Belt", --ACC+12,DA+8%
        legs="Pteroslaver Brais +3",
        feet="Flamma Gambieras +2",
    }

    sets.precast.WS = sets.baseWS.Str
    sets.precast.WS['Stardiver'] = set_combine(sets.baseWS.Str, {
        neck='Fotia Gorget',
        waist="Soil Belt",
        back=Brigantias.STR_DA,
    })
    sets.precast.WS['Sonic Thrust'] = set_combine(sets.baseWS.Str, {neck='Fotia Gorget'})
    sets.precast.WS['Savage Blade'] = set_combine(sets.baseWS.Str, {neck='Fotia Gorget'})
    sets.precast.WS['Penta Thrust'] = set_combine(sets.baseWS.Accuracy, {})
    sets.precast.WS['Drakesbane'] = set_combine(sets.baseWS.Str, {
        neck="Dragoon's Collar +2"
    })
    sets.precast.WS["Camlann's Torment"] = set_combine(sets.baseWS.Str, {
        neck="Dragoon's Collar +2",
        lear="Thrud Earring",
        body="Peltast's Plackart +3",
        hands="Pteroslaver Finger Gauntlets +2", --WSD+5%
        lring="Cornelia's Ring",
        legs="Vishap Brais +3",
        back=Brigantias.STR_WSD,
    })
    sets.precast.WS["Geirskogul"] = set_combine(sets.baseWS.Str, {
        neck="Dragoon's Collar +2",
        lear="Thrud Earring",
        body="Peltast's Plackart +3",
        back=Brigantias.STR_WSD,
    })

    sets.precast.JA.Angon = {ammo="Angon",hands="Pteroslaver Finger Gauntlets +2"}
    -- Jumps
    sets.JumpSpecialGear = {
        feet="Vishap Greaves +2"
    }
    sets.precast.JA.Jump = set_combine(
        sets.baseWS.Accuracy,
        {
            body="Pteroslaver Mail +3",
            neck="Vim Torque +1",
            hands="Vishap Finger Gauntlets +3",
            back=Brigantias.STR_DA,
            legs="Pteroslaver Brais +3",
            feet="Ostro Greaves",
            lring="Petrov Ring",
            rring="Niqmaddu Ring",
        }
    )

    sets.precast.JA['High Jump'] = set_combine(sets.precast.JA.Jump, {
        legs="Vishap Brais +3",
    })
    sets.precast.JA['Soul Jump'] = set_combine(sets.precast.JA.Jump, {
        body="Vishap Mail +3",
    })
    sets.precast.JA['Spirit Jump'] = set_combine(sets.precast.JA.Jump, {})
    sets.precast.JA['Super Jump'] = sets.precast.JA.Jump

    sets.precast.JA['Call Wyvern'] = {
        body="Pteroslaver Mail +3",
    }

    -- Wyvern Breaths
    sets.WyvernHP = {
        head="Vishap Armet +2",
        neck="Chanoix's Gorget",
        body="Wyvern Mail",
        hands="Ostreger Mitts",
        legs="Vishap Brais +3",
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
    sets.precast.JA['Steady Wing'] = {
        neck="Chanoix's Gorget",
        legs="Vishap Brais +3",
        back="Updraft Mantle",
    }
    sets.precast.JA['Spirit Link'] = {
        head="Vishap Armet +2",

    }
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
        head="Vishap Armet +2",
        --ring1="Dreki Ring" })
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
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

    sets.mainweapons = {
        main="Sixgill",
        sub="Pole Grip",
        ranged="Lamiabane",
        ammo="Tiphia Sting",
    }

    sets.engaged = {
        head="Brego Helm",
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Assault Earring",
        body="Askar Korazin",
        hands="Brego Gloves",
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Paewr Belt",
        legs="Homam Cosciales",
        feet="Ace's Leggings",
    }
    sets.RelicAF = {
        head="Wyrm Armet",
        body="Wyrm Mail",
        hands="Wyrm Finger Gauntlets",
        legs="Wyrm Brais",
        feet="Wyrm Greaves",
    }

    sets.idle = set_combine(sets.engaged, {legs="Crimson Cuisses"})

    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Hecatomb Cap",
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Assault Earring",
        body="Hecatomb Harness",
        hands="Drachen Finger Gauntlets +1",
        lring="Flame Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Warwolf Belt",
        legs="Barone Cosciales",
        feet="Hecatomb Leggings",
    }
    sets.baseWS.Accuracy = {
        head="Hecatomb Cap",
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Assault Earring",
        body="Hecatomb Harness",
        hands="Wyrm Finger Gauntlets",
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Wyrm Belt",
        legs="Perle Brayettes",
        feet="Aurum Sabatons",
    }

    sets.precast.WS = sets.baseWS.Str
    sets.precast.WS['Stardiver'] = set_combine(sets.baseWS.Str, {neck='Light Gorget'})
    sets.precast.WS['Sonic Thrust'] = set_combine(sets.baseWS.Str, {neck='Light Gorget'})
    sets.precast.WS['Penta Thrust'] = set_combine(sets.baseWS.Accuracy, {})
    sets.precast.WS['Drakesbane'] = set_combine(sets.baseWS.Str, {
        body="Zahak's Mail",
        neck="Light Gorget"
    })

    sets.precast.JA.Angon = {ammo="Angon",hands="Pteroslaver Finger Gauntlets +2"}
    -- Jumps
    sets.precast.JA.Jump = {
        head="Hecatomb Cap",
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Assault Earring",
        body="Hecatomb Harness",
        hands="Brego Gloves",
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Wyrm Belt",
        legs="Perle Brayettes",
        feet="Aurum Sabatons",
    }
    sets.precast.JA['High Jump'] = set_combine(sets.precast.JA.Jump, {})
    sets.precast.JA['Soul Jump'] = set_combine(sets.precast.JA.Jump, {})
    -- body="Vishap Mail +2",
    sets.precast.JA['Spirit Jump'] = set_combine(sets.precast.JA.Jump, {})
    sets.precast.JA['Super Jump'] = sets.precast.JA.Jump

    sets.precast.JA['Call Wyvern'] = {
        body="Wyrm Mail"
    }
    
    -- Wyvern Breaths
    sets.WyvernHP = {
        head="Drachen Armet",
        neck="Chanoix's Gorget",
        body="Wyvern Mail",
        hands="Ostreger Mitts",
        legs="Drachen Brais +1",
    }
    sets.HealingBreath = set_combine(sets.WyvernHP, {
        head="Wyrm Armet",
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
        -- hands="Leyline Gloves",
        -- legs="Limbo Trousers",
        -- ring1="Prolix Ring",
        -- ring2="Weatherspoon Ring"
    }
    sets.midcast.Breath = {
        --head="Vishap Armet +1",
        --ring1="Dreki Ring" })
        head="Drachen Armet",
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
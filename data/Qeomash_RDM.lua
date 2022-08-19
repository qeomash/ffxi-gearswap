-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Saboteur = buffactive.saboteur or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
    
    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 1')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- sets.Obis = {}
    -- sets.Obis.Fire = {waist='Hachirin-no-Obi'}
    -- sets.Obis.Earth = {waist='Hachirin-no-Obi'}
    -- sets.Obis.Water = {waist='Hachirin-no-Obi'}
    -- sets.Obis.Wind = {waist='Hachirin-no-Obi'}
    -- sets.Obis.Ice = {waist='Hachirin-no-Obi'}
    -- sets.Obis.Lightning = {waist='Hachirin-no-Obi'}
    -- sets.Obis.Light = {waist='Hachirin-no-Obi'}
    -- sets.Obis.Dark = {waist='Hachirin-no-Obi'}
    sets.ElementalStaves = {}
    sets.ElementalStaves.Fire = {main="Fire Staff", sub="Staff Strap"}
    sets.ElementalStaves.Earth = {main="Terra's Staff", sub="Earth Grip"}
    sets.ElementalStaves.Water = {main="Water Staff", sub="Staff Strap"}
    sets.ElementalStaves.Wind = {main="Auster's Staff", sub="Wind Grip"}
    sets.ElementalStaves.Ice = {main="Aquilo's Staff", sub="Ice Grip"}
    sets.ElementalStaves.Lightning = {main="Jupiter's Staff", sub="Thunder Grip"}
    sets.ElementalStaves.Light = {main="Apollo's Staff", sub="Staff Strap"}
    sets.ElementalStaves.Dark = {main="Pluto's Staff", sub="Dark Grip"}


    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitivation Tabard"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Atrophy Chapeau +1",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",
        back="Refraction Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
    -- sets.precast.FC = {ammo="Impatiens",
    --     head="Atrophy Chapeau +1",ear2="Loquacious Earring",
    --     body="Vitivation Tabard",hands="Gendewitha Gages",ring1="Prolix Ring",
    --     back="Swith Cape +1",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}
    sets.precast.FC = {
        head="Warlock's Chapeau +1",
        --head="Wayfarer Circlet",
        lear="Loquacious Earring",
        body="Duelist's Tabard",
        hands="Brego Gloves",
        legs="Wayfarer Slops",
        waist="Paewr Belt",
    }
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Wayfarer Circlet", --STR+19
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Magnetic Earring",
        body="Weatherspoon Robe +1", -- STR+26
        hands="Weatherspoon Cuffs +1", -- STR+6
        lring="Flame Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Warwolf Belt",
        legs="Weatherspoon Pants +1", -- STR+25
        feet="Weatherspoon Souliers +1", -- +10
    }
    sets.baseWS.Mnd = {
        head="Weatherspoon Corona +1", --MND+26
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Geist Earring",
        body="Weatherspoon Robe +1", -- MND+34
        hands="Weatherspoon Cuffs +1", -- MND+33
        lring="Aqua Ring",
        rring="Aqua Ring",
        back="Prism Cape",
        waist="Warwolf Belt",
        legs="Weatherspoon Pants +1", -- +24
        feet="Weatherspoon Souliers +1", -- +19
    }
    
    sets.precast.WS = sets.baseWS.Str
    sets.precast.WS['Death Blossom'] = set_combine(sets.baseWS.Mnd, {})
        -- head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        -- body="Atrophy Tabard +1",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        -- back="Atheling Mantle",waist="Caudata Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    -- sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, 
    --     {neck="Soil Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
    --     ring1="Aquasoul Ring",ring2="Aquasoul Ring",waist="Soil Belt"})

    -- sets.precast.WS['Sanguine Blade'] = {ammo="Witchstone",
    --     head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
    --     body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Acumen Ring",
    --     back="Toro Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}

    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
    --     head="Atrophy Chapeau +1",ear2="Loquacious Earring",
    --     body="Vitivation Tabard",hands="Gendewitha Gages",ring1="Prolix Ring",
    --     back="Swith Cape +1",waist="Witful Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
        head="Warlock's Chapeau +1",
        lear="Loquacious Earring",
        body="Duelist's Tabard",
        hands="Brego Gloves",
        -- legs="Nashira Seraweels",
        waist="Paewr Belt",
    }
    -- sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
    --     head="Gendewitha Caubeen",neck="Colossus's Torque",ear1="Roundel Earring",ear2="Loquacious Earring",
    --     body="Gendewitha Bliaut",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
    --     back="Swith Cape +1",waist="Witful Belt",legs="Atrophy Tights",feet="Hagondes Sabots"}
    sets.midcast.Cure = {
        main="Apollo's Staff",
        sub="Staff Strap",
        head="Weatherspoon Corona +1",
        neck="Colossus's Torque",
        lear="Moonshade Earring",
        rear="Magnetic Earring",
        body="Heka's Kalasiris",
        hands="Weatherspoon Cuffs +1", --CP+9%
        lring="Aqua Ring",
        rring="Aqua Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Weatherspoon Pants +1",
        feet="Weatherspoon Souliers +1",
    }
    sets.midcast.Curaga = sets.midcast.Cure
    --sets.midcast.CureSelf = {ring1="Kunaji Ring",ring2="Asklepian Ring"}

    sets.midcast['Enhancing Magic'] = {
        neck="Colossus's Torque", -- +7
        lear="Augmenting Earring", -- +3
        body="Glamor Jupon", -- ench skill +3
        hands="Duelist's Gloves", -- +15
        legs="Warlock's Tights +1", -- +15
    }
        -- head="Atrophy Chapeau +1",neck="Colossus's Torque",
        -- body="Vitivation Tabard",hands="Atrophy Gloves +1",ring1="Prolix Ring",
        -- back="Estoqueur's Cape",waist="Olympus Sash",legs="Atrophy Tights",feet="Estoqueur's Houseaux +2"}

    sets.midcast.Refresh = {legs="Estoqueur's Fuseau +2"}

    --sets.midcast.Stoneskin = {waist="Siegel Sash"}
    
    -- sets.midcast['Enfeebling Magic'] = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Kalboron Stone",
    --     head="Atrophy Chapeau +1",neck="Weike Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
    --     body="Atrophy Tabard +1",hands="Yaoyotl Gloves",ring1="Aquasoul Ring",ring2="Sangoma Ring",
    --     back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Bokwus Boots"}

    sets.Enfeebling = {}
    sets.Enfeebling.Base = {
        main="Homestead Wand",
        sub="Genbu's Shield",
        head="Weatherspoon Corona +1",
        neck="Enfeebling Torque",
        lear="Moonshade Earring",
        rear="Magnetic Earring",
        body="Warlock's Tabard +1",
        hands="Wayfarer Cuffs",
        lring="Balrahn's Ring",
        rring="Snow Ring",
        back="Altruistic Cape",
        waist="Demonry Sash",
        legs="Nashira Seraweels", -- macc+3
        feet="Wayfarer Clogs",
    }
    sets.Enfeebling.Int = {}
    sets.Enfeebling.Int.Hard = set_combine(sets.Enfeebling.Base,
        {
            head="Duelist's Chapeau +1",
            neck="Enfeebling Torque",
            lear="Moonshade Earring",
            rear="Magnetic Earring",
            body="Warlock's Tabard +1",
            hands="Wayfarer Cuffs",
            lring="Balrahn's Ring",
            rring="Snow Ring",
            back="Altruistic Cape",
            waist="Demonry Sash",
            legs="Nashira Seraweels",
            feet="Wayfarer Clogs",
        }
    )
    sets.Enfeebling.Int.Soft = set_combine(sets.Enfeebling.Int.Hard,
        {
            head="Weatherspoon Corona +1",
            lear="Abyssal Earring",
            body="Weatherspoon Robe +1",
            hands="Weatherspoon Cuffs +1",
            lring="Snow Ring",
            rring="Snow Ring",
            back="Prism Cape",
            legs="Weatherspoon Pants +1",
            feet="Weatherspoon Souliers +1",
        }
    )
    sets.Enfeebling.Mnd = {}
    sets.Enfeebling.Mnd.Hard = set_combine(sets.Enfeebling.Base,
        {
            head="Duelist's Chapeau +1",
            neck="Enfeebling Torque",
            lear="Moonshade Earring",
            rear="Magnetic Earring",
            body="Warlock's Tabard +1",
            hands="Weatherspoon Cuffs +1",
            lring="Balrahn's Ring",
            rring="Aqua Ring",
            back="Altruistic Cape",
            waist="Demonry Sash",
            legs="Nashira Seraweels",
            feet="Weatherspoon Souliers +1",
        }
    )
    sets.Enfeebling.Mnd.Soft = set_combine(sets.Enfeebling.Mnd.Hard,
        {
            head="Weatherspoon Corona +1",
            lear="Geist Earring",
            body="Weatherspoon Robe +1",
            hands="Weatherspoon Cuffs +1",
            lring="Aqua Ring",
            rring="Aqua Ring",
            back="Prism Cape",
            legs="Weatherspoon Pants +1",
        }
    )

    sets.midcast['Enfeebling Magic'] = sets.Enfeebling.Base
    sets.midcast['Dia III'] = sets.Enfeebling.Mnd.Soft
    sets.midcast['Silence'] = sets.Enfeebling.Mnd.Hard
    sets.midcast['Sleep'] = sets.Enfeebling.Int.Hard
    sets.midcast['Sleep II'] = sets.Enfeebling.Int.Hard
    sets.midcast['Sleepga'] = sets.Enfeebling.Int.Hard

    -- sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})
    
    -- sets.midcast['Elemental Magic'] = {main="Lehbrailg +2",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
    --     head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
    --     body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
    --     back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}
    sets.midcast['Elemental Magic'] = {
        main="Homestead Wand",
        sub="Genbu's Shield",
        head="Wayfarer Circlet", -- MAB+5
        neck="Aesir Torque",
        lear="Moldavite Earring",
        rear="Hecate's Earring",
        body="Wayfarer Robe", -- MAB+6
        hands="Wayfarer Cuffs", -- MAC+4
        lring="Snow Ring",
        rring="Snow Ring",
        back="Prism Cape",
        waist="Demonry Sash",
        legs="Wayfarer Slops",
        feet="Weatherspoon Souliers +1", --MAB+12
    }

    --sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- sets.midcast['Dark Magic'] = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Kalboron Stone",
    --     head="Atrophy Chapeau +1",neck="Weike Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
    --     body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",ring2="Sangoma Ring",
    --     back="Refraction Cape",waist="Goading Belt",legs="Bokwus Slops",feet="Bokwus Boots"}
    sets.midcast['Dark Magic'] = {
        main="Homestead Wand",
        sub="Genbu's Shield",
        head="Wayfarer Circlet",
        neck="Aesir Torque",
        lear="Abyssal Earring",
        rear="Magnetic Earring",
        body="Glamor Jupon", -- Drk skill +3
        hands="Crimson Finger Gauntlets", --Drk skill +10
        lring="Snow Ring",
        rring="Snow Ring",
        back="Prism Cape",
        waist="Demonry Sash",
        legs="Wayfarer Slops",
        feet="Wayfarer Clogs",
    }

    --sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Excelsis Ring"})
    sets.midcast.Aspir = sets.midcast.Drain


    -- Sets for special buff conditions on spells.

    sets.midcast.EnhancingDuration = {hands="Atrophy Gloves +1",back="Estoqueur's Cape",feet="Estoqueur's Houseaux +2"}
        
    sets.buff.ComposureOther = {head="Estoqueur's Chappel +2",
        body="Estoqueur's Sayon +2",hands="Estoqueur's Gantherots +2",
        legs="Estoqueur's Fuseau +2",feet="Estoqueur's Houseaux +2"}

    sets.buff.Saboteur = {hands="Estoqueur's Gantherots +2"}
    

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    -- sets.resting = {main="Chatoyant Staff",
    --     head="Vitivation Chapeau",neck="Wiglen Gorget",
    --     body="Atrophy Tabard +1",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
    --     waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
    sets.resting = {
        main="Pluto's Staff",
        sub="Staff Strap",
        head="Duelist's Chapeau +1",
        neck="Grandiose Chain",
        ear1="Antivenom Earring",
        ear2="Magnetic Earring",
        body="Errant Houppelande",
        hands="Wayfarer Cuffs",
        ring1="Balrahn's Ring",
        ring2="Aqua Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Nashira Seraweels",
        feet="Wayfarer Clogs",
    }

    -- Idle sets
    -- sets.idle = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
    --     head="Vitivation Chapeau",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
    --     back="Shadow Mantle",waist="Flume Belt",legs="Crimson Cuisses",feet="Hagondes Sabots"}

    sets.idle = {
        main="Terra's Staff",
        sub="Staff Strap",
        head="Duelist's Chapeau +1",
        neck="Orochi Nodowa",
        lear="Moonshade Earring",
        rear="Magnetic Earring",
        body="Dalmatica",
        hands="Wayfarer Cuffs",
        lring="Balrahn's Ring",
        rring="Snow Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Crimson Cuisses",
        feet="Wayfarer Clogs",
    }

    -- sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
    --     head="Atrophy Chapeau +1",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Atrophy Tabard +1",hands="Atrophy Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
    --     back="Shadow Mantle",waist="Flume Belt",legs="Crimson Cuisses",feet="Hagondes Sabots"}
    
    -- sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
    --     head="Vitivation Chapeau",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Atrophy Tabard +1",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
    --     back="Shadow Mantle",waist="Flume Belt",legs="Crimson Cuisses",feet="Hagondes Sabots"}

    -- sets.idle.PDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Demonry Stone",
    --     head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Gendewitha Bliaut +1",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
    --     back="Shadow Mantle",waist="Flume Belt",legs="Osmium Cuisses",feet="Gendewitha Galoshes"}

    -- sets.idle.MDT = {main="Bolelabunga",sub="Genbu's Shield",ammo="Demonry Stone",
    --     head="Gendewitha Caubeen +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Gendewitha Caubeen +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
    --     back="Engulfer Cape",waist="Flume Belt",legs="Osmium Cuisses",feet="Gendewitha Galoshes"}
    sets.idle.MDT = {
        main="Kebbie",
        range="Lamian kaman",
        body="Wayfarer Robe",
        back="Lamia Mantle +1",
        ear1="Coral Earring",
        ear2="Coral Earring",
        ring1="Merman's Ring",
        ring2="Merman's Ring",
    }
    
    -- Defense sets
    sets.defense.PDT = {
        head="Atrophy Chapeau +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Hagondes Pants",feet="Gendewitha Galoshes"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {legs="Crimson Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        -- head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        -- body="Atrophy Tabard +1",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        -- back="Atheling Mantle",waist="Goading Belt",legs="Osmium Cuisses",feet="Atrophy Boots"}
        head="Wayfarer Circlet", --haste+6%,str+19
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Magnetic Earring",
        body="Weatherspoon Robe +1", --haste+3%,str+26
        hands="Brego Gloves", --haste+4%,acc+9,Str+5
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Paewr Belt",
        legs="Weatherspoon Pants +1",
        feet="Weatherspoon Souliers +1",
    }
    sets.engaged.Defense = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard +1",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Kayapa Cape",waist="Goading Belt",legs="Osmium Cuisses",feet="Atrophy Boots"}

    sets.meleeWeapons = {
        main="Eminent Scimitar",
        sub="Genbu's Shield",
    }

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther)
        end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 1)
    -- if player.sub_job == 'DNC' then

    -- elseif player.sub_job == 'NIN' then
    --     set_macro_page(3, 4)
    -- elseif player.sub_job == 'THF' then
    --     set_macro_page(4, 4)
    -- else
    --     set_macro_page(1, 4)
    -- end
end

function job_midcast(spell, action, spellMap, eventArgs)
    -- Enfeebling Sets, by element
    if spell.skill == 'Enfeebling Magic' then
        if spell.type == 'WhiteMagic' then
            equip(sets.Enfeebling.Mnd.Soft)
        else
            equip(sets.Enfeebling.Int.Soft)
        end
    end

    -- Elemental Staves
    -- if spell.skill == 'Elemental Magic' or spell.skill == 'Enfeebling Magic' or spell.skill == "Dark Magic" then
    --     equip(sets.ElementalStaves[spell.element])
    -- end
    
end

is_meleeing = false
-- the example: https://github.com/Tunaliz/Liz_Gearswaps/blob/master/RDM_Lib.lua
function job_self_command(command)
    -- $ gs c [command]
    -- Super Smash RDM MELEE
    if command[1] == 'melee' then
        -- explicit on/off switches:
        if command[2] == 'on' then
            enable_vermelee()
        elseif command[2] == 'off' then
            disable_vermelee()
        -- No arg, so toggle
        else
            if is_meleeing == false then
                enable_vermelee()
            elseif is_meleeing == true then
                disable_vermelee()
            end
        end
    end
end

function enable_vermelee()
    is_meleeing = true
    equip(sets.meleeWeapons)
    disable('main','sub','ranged', 'ammo')
    windower.add_to_chat(64,'RDM Melee: ON')
end

function disable_vermelee()
    is_meleeing = false
    enable('main','sub','ranged', 'ammo')
    windower.add_to_chat(64,'RDM Melee: OFF')
end

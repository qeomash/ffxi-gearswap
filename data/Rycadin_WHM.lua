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
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- state.OffenseMode:options('None', 'Normal')
    -- state.CastingMode:options('Normal', 'Resistant')
    -- state.IdleMode:options('Normal', 'PDT')

    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 10/l2')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    sets.TH = {
        main="Grioavolr", -- TH+1
        head="White Rarab Cap +1",
        feet="Chironic Slippers", -- TH+1
        waist="Chaac Belt", --TH+1
    }

    Alaunus = {}
    Alaunus.Healing = { name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10',}}
    Alaunus.Idle = { name="Alaunus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}


    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    -- sets.precast.FC = {main=gear.FastcastStaff,ammo="Incantor Stone",
    --     head="Nahtirah Hat",neck="Orison Locket",ear2="Loquacious Earring",
    --     body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
    --     back="Swith Cape +1",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots +1"}
    sets.precast.FC = {
        -- main="Grioavolr", -- FC+4%
        head="Ebers Cap +3",
        lear="Loqacious Earring",
        body="Inyanga Jubbah +2", -- FC+14%
        hands="Aya. Manopolas +2", --maybe try those garbage things you got?
        back=Alaunus.Idle, --FC+10%
        legs="Aya. Cosciales +2", -- FC+5%
        feet="Regal Pumps", --FC+3%
        ammo="Incantor Stone", -- FC+2%
        ring1="Lebeche Ring", -- QM+2%
    }
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC,
        {
            main="Queller Rod", -- CFC-7%
            sub="Sors Shield", -- CFC-5%
            head="Theophany Cap +1", -- CFC -5%
            legs="Ebers Pantaloons +3", -- CFC -15%
            feet="Kaykaus Boots" -- CFC-5%
        })

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    -- sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {}
    --     -- {main="Tamaxchi"}
    -- )
        -- {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens"})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault"}

    -- Waltz set (chr and vit)
    -- sets.precast.Waltz = {
    --     head="Nahtirah Hat",ear1="Roundel Earring",
    --     body="Vanir Cotehardie",hands="Yaoyotl Gloves",
    --     back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = ""
    sets.precast.WS = {
        head="Nahtirah Hat",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Refraction Cape",waist=gear.ElementalBelt,legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    sets.precast.WS['Flash Nova'] = {
        head="Nahtirah Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Strendu Ring",
        back="Toro Cape",waist="Thunder Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


    -- Midcast Sets

    sets.midcast.FastRecast = {
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    -- Cure sets
    gear.default.obi_waist = "Goading Belt"
    gear.default.obi_back = "Mending Cape"

    sets.midcast.CureSolace = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
        head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
        body="Orison Bliaud +2",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
        back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

    -- sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
    --     head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
    --     body="Vanir Cotehardie",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
    --     back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}
    sets.midcast.Cure = {
        main="Queller Rod", -- CPII+2%,CP+10%
        sub="Sors Shield",
        ammo="Psilomene", --Enmity-3
        head="Ebers Cap +3", -- CP+19%
        neck="Cleric's Torque", -- CP+5%
        body="Ebers Bliaut +3", --CPII, Solace+18
        -- body="Theophany Bliaut +2", -- should be ? CPII+3%
        hands="Theophany Mitts +2", --CPII+2%
        lear="Orison Earring", --CP+2%
        back=Alaunus.Healing,
        legs="Ebers Pantaloons +3",
        feet="Kaykaus Boots", --CP+10%
        ring1="Lebeche Ring", -- CP+3%
    }
    sets.midcast.Curaga = sets.midcast.Cure
    -- sets.midcast.Curaga = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
    --     head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
    --     body="Vanir Cotehardie",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
    --     back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

    -- sets.midcast.CureMelee = {ammo="Incantor Stone",
    --     head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
    --     body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Prolix Ring",ring2="Sirona's Ring",
    --     back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

    -- sets.midcast.Cursna = {main="Beneficus",sub="Genbu's Shield",
    --     head="Orison Cap +2",neck="Malison Medallion",
    --     body="Orison Bliaud +2",hands="Hieros Mittens",ring1="Ephedra Ring",ring2="Sirona's Ring",
    --     back="Mending Cape",waist="Goading Belt",legs="Theophany Pantaloons",feet="Gendewitha Galoshes"}
    sets.midcast.Cursna = {
        back="Alaunus's Cape", -- Cursna +25
        legs="Theophany Pantaloons +2",
        rear="Ebers Earring +1", --sk+10
        neck="Malison Medallion",
        lring="Menelaus's Ring",
        rring="Ephedra Ring",
        feet="Vanya Clogs",
    }
    -- sets.midcast.StatusRemoval = {
    --     head="Orison Cap +2",legs="Orison Pantaloons +2"}
    sets.midcast['Erase'] = {
        head="Ebers Cap +3", --DV+24%
        neck="Cleric's Torque", -- Erase+1
    }

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    -- sets.midcast['Enhancing Magic'] = {main="Beneficus",sub="Genbu's Shield",
    --     head="Umuthi Hat",neck="Colossus's Torque",
    --     body="Manasa Chasuble",hands="Dynasty Mitts",
    --     back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}
    sets.midcast['Enhancing Magic'] = {
        main="Gada", --skill+18,dura+6%
        sub="Genub's Shield",
        hands="Inyanga Dastanas +2", -- all skills +20
        feet="Theophany Duckbills +2", -- skill+19,dura+5%
        waist="Embla Sash", --dura+10%
    }

    -- sets.midcast.Stoneskin = {
    --     head="Nahtirah Hat",neck="Orison Locket",ear2="Loquacious Earring",
    --     body="Vanir Cotehardie",hands="Dynasty Mitts",
    --     back="Swith Cape +1",waist="Siegel Sash",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    -- sets.midcast.Auspice = {hands="Dynasty Mitts",feet="Orison Duckbills +2"}

    -- sets.midcast.BarElement = {main="Beneficus",sub="Genbu's Shield",
    --     head="Orison Cap +2",neck="Colossus's Torque",
    --     body="Orison Bliaud +2",hands="Orison Mitts +2",
    --     back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}
    sets.midcast.BarElement = {
        main="Gada", --skill+18,dura+6%
        sub="Genub's Shield",
        head="Ebers Cap +3", -- CP+19%
        body="Ebers Bliaut +3", --CPII, Solace+18
        hands="Ebers Mitts +3", --dura+24
        legs="Ebers Pantaloons +3",
        feet="Ebers Duckbills +2",
        waist="Embla Sash", --dura+10%
    }
    -- sets.midcast.Regen = {main="Bolelabunga",sub="Genbu's Shield",
    --     body="Piety Briault",hands="Orison Mitts +2",
    --     legs="Theophany Pantaloons"}
    sets.midcast.Regen = {
        head="Inyanga Tiara +2", -- +12%
        body="Cleric's Bliaut", -- +1 HP
        hands="Ebers Mitts +3", --dura+24
        legs="Theophany Pantaloons +2",
        feet="Ebers Duckbills +2",
    }

    -- sets.midcast.Protectra = {ring1="Sheltered Ring",feet="Piety Duckbills +1"}

    -- sets.midcast.Shellra = {ring1="Sheltered Ring",legs="Piety Pantaloons"}
    sets.midcast['Dia'] = sets.TH

    -- sets.midcast['Divine Magic'] = {main="Bolelabunga",sub="Genbu's Shield",
    --     head="Nahtirah Hat",neck="Colossus's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
    --     body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring2="Sangoma Ring",
    --     back="Refraction Cape",waist=gear.ElementalObi,legs="Theophany Pantaloons",feet="Gendewitha Galoshes"}

    -- sets.midcast['Dark Magic'] = {main="Bolelabunga", sub="Genbu's Shield",
    --     head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
    --     body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
    --     back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

    -- -- Custom spell classes
    -- sets.midcast.MndEnfeebles = {main="Lehbrailg +2", sub="Mephitis Grip",
    --     head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
    --     body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Aquasoul Ring",ring2="Sangoma Ring",
    --     back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

    -- sets.midcast.IntEnfeebles = {main="Lehbrailg +2", sub="Mephitis Grip",
    --     head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
    --     body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Sangoma Ring",
    --     back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}
    sets.Enfeebling = {}
    sets.Enfeebling.Int = {
        main="Grioavolr",
        sub="Staff Strap",
        head="Inyanga Tiara +2",
        neck="Enfeebling Torque",
        ear1="Moldavite Earring",
        body="Inyanga Jubbah +2",
        hands="Inyanga Dastanas +2",
        ring1="Ayanmo Ring",
        ring2="Inyanga Ring",
        back="Prism Cape",
        waist="Demonry Sash",
        legs="Inyanga Shalwar +2",
        feet="Inyanga Crackows +2",
    }
    sets.midcast['Enfeebling Magic'] = sets.Enfeebling.Int
    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {main=gear.Staff.HMP,
        body="Gendewitha Bliaut",hands="Serpentes Cuffs",
        waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    -- sets.idle = {main="Bolelabunga", sub="Genbu's Shield",ammo="Incantor Stone",
    --     head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Gendewitha Bliaut",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
    --     back="Umbra Cape",waist="Witful Belt",legs="Nares Trews",feet="Herald's Gaiters"}
    sets.idle = {
        -- main="Queller Rod", -- Refresh+1
        sub="Genbu's Shield",
        ammo="Homiliary",
        head="Inyanga Tiara +2",
        neck="Loricate Torque +1", --DT-6%
        lear="Abyssal Earring",
        rear="Ebers Earring +1", --DT-3%
        body="Ebers Bliaut +3", --Refresh+4
        -- hands="Inyanga Dastanas +2", --refresh?
        hands="Ebers Mitts +3", --DT-10%
        -- ring1="Ayanmo Ring",
        ring1="Gurebu's Ring",
        ring2="Shneddick Ring",
        back=Alaunus.Idle,
        waist="Demonry Sash",
        legs="Ebers Pantaloons +3", --DT-13%
        feet="Inyanga Crackows +2",
    }

    -- sets.idle.PDT = {main="Bolelabunga", sub="Genbu's Shield",ammo="Incantor Stone",
    --     head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
    --     back="Umbra Cape",waist="Witful Belt",legs="Gendewitha Spats",feet="Herald's Gaiters"}

    -- sets.idle.Town = {main="Bolelabunga", sub="Genbu's Shield",ammo="Incantor Stone",
    --     head="Gendewitha Caubeen",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Sheltered Ring",ring2="Paguroidea Ring",
    --     back="Umbra Cape",waist="Witful Belt",legs="Nares Trews",feet="Herald's Gaiters"}

    -- sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
    --     head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --     body="Gendewitha Bliaut",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Meridian Ring",
    --     back="Umbra Cape",waist="Witful Belt",legs="Nares Trews",feet="Gendewitha Galoshes"}

    -- -- Defense sets

    -- sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
    --     head="Gendewitha Caubeen",neck="Twilight Torque",
    --     body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
    --     back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    -- sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
    --     head="Nahtirah Hat",neck="Twilight Torque",
    --     body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
    --     back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    -- sets.Kiting = {feet="Herald's Gaiters"}

    -- sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    -- sets.engaged = {
    --     head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
    --     body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Rajas Ring",ring2="K'ayres Ring",
    --     back="Umbra Cape",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    sets.engaged = {
        main="Tishtrya",
        head="Ayanmo Zucchetto +2",
        left_ear="Brutal Earring",
        right_ear="Suppanomimi",
        body="Ayanmo Corazza +2",
        hands="Ayanmo Manopolas +2",
        legs="Ayanmo Cosciales +2",
        feet="Ayanmo Gambieras +2",
        waist="Paewr Belt",
        ring1="Ayanmo Ring",
        ring2="Rajas Ring",
    }

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}



end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end

    -- if spell.skill == 'Healing Magic' then
    --     gear.default.obi_back = "Mending Cape"
    -- else
    --     gear.default.obi_back = "Toro Cape"
    -- end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
-- function job_state_change(stateField, newValue, oldValue)
--     if stateField == 'Offense Mode' then
--         if newValue == 'Normal' then
--             disable('main','sub','range')
--         else
--             enable('main','sub','range')
--         end
--     end
-- end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end


-- function customize_idle_set(idleSet)
--     if player.mpp < 51 then
--         idleSet = set_combine(idleSet, sets.latent_refresh)
--     end
--     return idleSet
-- end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts =
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']

        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
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
    set_macro_page(1, 2)
end

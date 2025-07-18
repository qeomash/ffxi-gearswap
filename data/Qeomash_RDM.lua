-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function binds_on_load()
    debug_log("...entered local binds_on_load")
    send_command('bind f9 gs c cycle WeaponSet')
    send_command('bind f10 gs c cycle IdleMode')
    send_command('bind f11 gs c cycle CastingMode')
    send_command('bind f12 gs c cycle HybridMode')
end

function binds_on_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Saboteur = buffactive.saboteur or false
    state.WeaponSet = M{['description'] = 'WeaponSet'}

    -- Spells that are always allowed to change weapons
    exception_spells = S{
        'Enfire', 'Enfire II',
        'Enblizzard', 'Enblizzard II',
        'Enaero', 'Enaero II',
        'Enstone', 'Enstone II',
        'Enthunder', 'Enthunder II',
        'Enwater', 'Enwater II',
        'Phalanx',
        'Temper', 'Temper II',
        'Dispelga'
    }
    enhancing_skill_spells = S{
        'Enfire', 'Enfire II',
        'Enblizzard', 'Enblizzard II',
        'Enaero', 'Enaero II',
        'Enstone', 'Enstone II',
        'Enthunder', 'Enthunder II',
        'Enwater', 'Enwater II',
        'Phalanx',
        'Temper', 'Temper II',
    }

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    enable_all_slots()
    state.OffenseMode:options('Normal', 'Attack')
    state.HybridMode:options('Normal', 'DT','PhysicalDef', 'Accuracy')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT', 'Refresh')
    state.WeaponSet:options('Normal', 'Crocea', 'Naegling', 'Maxentius', 'Daggers')

    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 2')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Predefined Special Gear and Sets
    sets.Artifact = {
        head="Atrophy Chapeau +3",
        body="Atrophy Tabard +3",
        hands="Atrophy Gloves +3",
        legs="Atrophy Tights +3",
        feet="Atrophy Boots +1",
    }
    sets.Relic = {
        head="Vitiation Chapeau +4",
        body="Vitiation Tabard +3",
        hands="Vitiation Gloves +3",
        legs="Vitiation Tights +1",
        feet="Vitiation Boots +2",
    }
    sets.Empyrean = {
        head="Lethargy Chappel +3",
        body="Lethargy Sayon +3",
        hands="Lethargy Gantherots +3",
        legs="Lethargy Fuseau +3",
        feet="Lethargy Houseaux +3",
    }

    Colada = {}
    Colada.Refresh = { name="Colada", augments={'"Refresh"+2','STR+7','Mag. Acc.+17','"Mag.Atk.Bns."+7',}}
    Colada.EnhancingDur = { name="Colada", augments={'Enh. Mag. eff. dur. +2','STR+4','"Mag.Atk.Bns."+8',}}

    Sucellos = {}
    Sucellos.WS = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    Sucellos.DA = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
    Sucellos.WSD_MND = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+6','Weapon skill damage +10%',}} -- needs dye
    Sucellos.Enhancing = { name="Sucellos's Cape", augments={'DEX+1','Accuracy+20 Attack+20','Accuracy+3','"Dbl.Atk."+10','Damage taken-5%',}} --TODO
    Sucellos.Enfeebling = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}} --TODO
    Sucellos.EnfeeblingInt = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}} --TODO
    -- this one isn't done:
    Sucellos.EnfeeblingMnd = { name="Sucellos's Cape", augments={'INT+30','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}} --TODO
    Sucellos.Nuke = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}

    Ghostfyre = {}
    Ghostfyre.Duration = { name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +2','Mag. Acc.+10','Enh. Mag. eff. dur. +20',}}
    Ghostfyre.EnhancingSkill = { name="Ghostfyre Cape", augments={'Enfb.mag. skill +8','Enha.mag. skill +9','Mag. Acc.+5',}}

    sets.TH = {
        head="Volte Cap", -- +1
        feet="Chironic Slippers", --TH+2
        waist="Chaac Belt", --TH+1
    }

    sets.DefaultShield = {
        sub="Sacro Bulwark",
    }

    -- Weapon Mode Sets
    sets.WeaponSet = {}
    sets.WeaponSet["Crocea"] = {
        main="Crocea Mors",
        sub="Daybreak",
        range=empty,
    }
    sets.WeaponSet["Naegling"] = {
        main="Naegling",
        sub="Thibron",
        range=empty,
    }
    sets.WeaponSet["Maxentius"] = {
        main="Maxentius",
        sub="Thibron",
        range=empty,
    }
    sets.WeaponSet["Daggers"] = {
        main="Gleti's Knife",
        sub="Ternion Dagger +1",
        range=empty,
    }


    -- JA Related Sets
    sets.precast.JA['Chainspell'] = {body=sets.Relic.body}
    sets.buff.Saboteur = {hands=sets.Empyrean.hands}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz = {}
    sets.precast.Waltz['Healing Waltz'] = {}


    --------------------------------------
    -- Idle Sets
    --------------------------------------

    sets.idle = {
        main=Colada.Refresh,
        sub="Sacro Bulwark",
        ammo="Homiliary",
        head=sets.Relic.head, --Refresh+2
        neck="Loricate Torque +1", --DT-6%
        body=sets.Empyrean.body, --Refresh+4,DT-14%
        hands=sets.Empyrean.hands, --DT-10%
        lear="Odnowa Earring +1",
        -- Ear, get Odnowa and Etiolation
        lring="Warden's Ring",
        rring="Shadow Ring",
        back=Sucellos.DA, -- DT-5%
        waist="Flume Belt",
        legs="Carmine Cuisses +1",
        feet="Malignance Boots", --DT-4%
    }
    sets.idle.DT = set_combine(sets.idle,
        {
            head="Nyame Helm", --DT7%
            neck="Loricate Torque +1", --DT6%
            body="Malignance Tabard", --DT9%
            hands="Nyame Gauntlets", --DT7%
            waist="Flume Belt", --PDT-4%
            legs="Nyame Flanchard", --DT-8%
            feet="Nyame Sollerets", --DT-7%
        }
    )
    sets.idle.Refresh = set_combine(sets.idle,
        {
            ammo="Homiliary",
            head=sets.Relic.head, --Refresh+2
            body=sets.Empyrean.body, --Refresh+4
            lring="Stikini Ring +1", --Refresh+1
            rring="Stikini Ring +1", --refresh+1
        }
    )
    sets.resting = sets.idle.Refresh

    --------------------------------------
    -- Spellcasting
    --------------------------------------

    -- Precast sets
    sets.precast.FC = {
        main="Crocea Mors", --FC+20%
        head=sets.Artifact.head,
        lear="Loquacious Earring",
        rear="Lethargy Earring +1", --FC+8%
        body=sets.Relic.body,
        hands="Ayanmo Manopolas +2", --Haste+4%
        legs="Ayanmo Cosciales +2",
        ring1="Lebeche Ring", -- QM+2%
        ring2="Weatherspoon Ring",-- QM+3%
        waist="Embla Sash", --FC+5%
        back="Swith Cape",
        feet="Carmine Greaves +1",
    }
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
    sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {head=sets.Empyrean.head})
    sets.precast.FC['Dispelga'] = set_combine(sets.precast.FC['Enfeebling Magic'],
        {main="Daybreak", sub={name="Ammurapi Shield", priority=100}})
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC,
        {
            main="Daybreak",
            sub="Sors Shield", -- CFC-5%
            legs="Kaykaus Tights", -- CFC-5%
            feet="Kaykaus Boots" -- CFC-5%
        })
    sets.precast.FC['Dia'] = set_combine(sets.precast.FC, sets.TH)

    -- Midcast Sets

    sets.midcast.FastRecast = {
        head=sets.Artifact.head,
        lear="Loquacious Earring",
        body=sets.Relic.body,
        hands="Brego Gloves",
        waist="Embla Sash", --FC+5%
        feet="Carmine Greaves +1",
    }


    -- Healing
    sets.midcast.Cure = {
        main="Daybreak",
        sub="Sors Shield", -- CP+3%
        head=sets.Relic.head,
        neck="Colossus's Torque",
        lear="Regal Earring",
        rear="Magnetic Earring",
        hands="Telchine Gloves", --CP+10%
        lring="Lebeche Ring", --CP+3%
        rring="Stikini Ring +1",
        back=Ghostfyre.Duration, --CP+6%
        legs="Kaykaus Tights", --CP+10%
        feet="Kaykaus Boots", --CP+10%
    }
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        main="Prelatic Pole",
        sub=empty,
    })


    -- Enhancing Magic
    sets.midcast['Enhancing Magic'] = {
        main=Colada.EnhancingDur,
        sub="Ammurapi Shield", --Dura+10%
        head="Carmine Mask", --+10
        neck="Melic Torque", --+10
        lear="Mimir Earring", -- +10
        rear="Lethargy Earring +1", -- duration+8%
        body=sets.Relic.body, -- +21,duration+10%
        hands=sets.Relic.hands, -- +22,duration+
        lring="Stikini Ring +1", -- +5
        rring="Stikini Ring +1", -- +5
        back=Ghostfyre.Duration, --duration+20%
        waist="Olympus Sash", -- +5
        legs=sets.Empyrean.legs, -- +19
        feet=sets.Empyrean.feet, -- +35,duration+40%
    }
    sets.midcast['Enhancing Magic'].skill = set_combine(sets.midcast['Enhancing Magic'],
        {
            main="Pukulatmuj +1", -- +11
            sub="Forfend +1", -- +10
            hands=sets.Relic.Hands, -- +22
            lear="Mimir Earring", -- +10
            rear="Andoaa Earring", -- +5
            legs=sets.Artifact.legs, --enhances damage?
            back=Ghostfyre.EnhancingSkill, -- +9
            lring="Stikini Ring +1", -- +5
            rring="Stikini Ring +1", -- +5
        }
    )
    -- Set max enhancing magic skill spells:
    for sp in enhancing_skill_spells:it() do
        sets.midcast[sp] = sets.midcast['Enhancing Magic'].skill
    end

    sets.midcast.EnhancingDuration = {
        main=Colada.EnhancingDur,
        sub="Ammurapi Shield", --Dura+10%
        head=sets.Empyrean.head,
        neck="Duelist's Torque +2", --Dura+25%
        body=sets.Empyrean.body,
        hands=sets.Artifact.hands,
        rear="Lethargy Earring +1", --Duration+8%
        back=Ghostfyre.Duration,
        waist="Embla Sash", --duration+10%
        legs=sets.Empyrean.legs,
        feet=sets.Empyrean.feet,
    }
    sets.buff.ComposureOther = {
        head=sets.Empyrean.head,
        body=sets.Empyrean.body,
        hands=sets.Empyrean.hands,
        legs=sets.Empyrean.legs,
        feet=sets.Empyrean.feet,
    }
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], sets.midcast.EnhancingDuration, {
        body=sets.Artifact.body, -- Refresh+2
        legs=sets.Empyrean.legs, -- Refresh+3
        }
    )
    sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'], sets.midcast.EnhancingDuration)
    sets.midcast["Haste II"] = set_combine(sets.midcast['Enhancing Magic'], sets.midcast.EnhancingDuration)
    sets.midcast["Phalanx II"] = set_combine(sets.midcast.EnhancingDuration, sets.midcast['Enhancing Magic'])
    sets.midcast["Flurry II"] = set_combine(sets.midcast['Enhancing Magic'], sets.midcast.EnhancingDuration)
    sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {
        hands="Regal Cuffs", --Aquaveil +2
    })


    -- Enfeebling Magic
    sets.Enfeebling = {}
    sets.Enfeebling.Base = {
        main="Crocea Mors", --MAC+50
        sub="Ammurapi Shield", --MAC+38
        ranged="Ullr",
        -- ammo="Kalboron Stone",
        -- head=sets.Relic.head,
        head=sets.Relic.head, -- MAC+27,Skill+24
        neck="Duelist's Torque +2", -- macc+30,enf ef+10
        lear="Snotra Earring", -- MAC+10,duration+10%
        rear="Vor Earring", -- sk+10
        body=sets.Artifact.body, -- MAC+55
        hands=sets.Empyrean.hands, -- MAC+52
        lring="Metamorph Ring +1",
        rring="Stikini Ring +1",
        back=Sucellos.Enfeebling,
        waist="Ovate Rope",
        legs=sets.Empyrean.legs, --MAC+53
        feet=sets.Empyrean.feet, --MAC+60
    }
    sets.Enfeebling.Accuracy = {
        main="Crocea Mors", --MAC+50
        sub="Ammurapi Shield", --MAC+38
        ranged="Ullr",
        head=sets.Artifact.head,
        neck="Null Loop", --MACC+50
        lear="Snotra Earring", --mac+10
        rear="Regal Earring", --macc+15 w/set
        body=sets.Artifact.body,
        hands=sets.Empyrean.hands,
        lring="Stikini Ring +1",
        rring="Stikini Ring +1",
        -- back="Aurist's Cape +1", --bis, after augmenting
        back="Null Shawl", --Macc+50
        -- waist="Ovate Rope", --macc+8
        waist="Null Belt", --MACC+30
        legs=sets.Empyrean.legs,
        feet=sets.Empyrean.feet,
    }
    sets.Enfeebling.PotencyInt = {
        main="Crocea Mors", --MAC+50
        sub="Ammurapi Shield",
        ammo="Regal Gem",
        head=sets.Relic.head,
        neck="Duelist's Torque +2", -- macc+30,enf ef+10
        lear="Snotra Earring", --mac+10
        rear="Regal Earring",
        body=sets.Empyrean.body,
        hands=sets.Empyrean.hands,
        lring="Metamorph Ring +1",
        rring="Stikini Ring +1",
        back=Sucellos.EnfeeblingInt,
        waist="Ovate Rope", --macc+8
        legs=sets.Empyrean.legs,
        feet=sets.Empyrean.feet,
    }
    sets.Enfeebling.PotencyMnd = {
        main="Crocea Mors", --MAC+50
        sub="Ammurapi Shield",
        ammo="Regal Gem",
        head=sets.Relic.head,
        neck="Duelist's Torque +2", -- macc+30,enf ef+10
        lear="Snotra Earring", --mac+10
        rear="Regal Earring",
        body=sets.Empyrean.body,
        hands=sets.Empyrean.hands,
        lring="Metamorph Ring +1",
        rring="Stikini Ring +1",
        back=Sucellos.EnfeeblingMnd,
        waist="Ovate Rope", --macc+8
        legs=sets.Empyrean.legs,
        feet=sets.Empyrean.feet,
    }
    sets.Enfeebling.Duration = {
        main="Crocea Mors", --MAC+50
        sub="Ammurapi Shield",
        ranged="Ullr",
        head=sets.Empyrean.head,
        neck="Duelist's Torque +2", -- macc+30,enf ef+10
        lear="Snotra Earring", --mac+10
        rear="Lethargy Earring +1", --macc+14
        body=sets.Empyrean.body,
        hands="Regal Cuffs",
        lring="Kishar Ring", --EnfDura+10%
        rring="Stikini Ring +1",
        -- back="Aurist's Cape +1", --bis, after augmenting
        back=Sucellos.EnfeeblingMnd,
        waist="Ovate Rope", --macc+8
        legs=sets.Empyrean.legs,
        feet=sets.Empyrean.feet,
    }
    sets.Enfeebling.Skill = {
        main="Crocea Mors", --MAC+50
        sub="Ammurapi Shield",
        ammo="Regal Gem",
        head=sets.Relic.head,
        neck="Duelist's Torque +2", -- macc+30,enf ef+10
        lear="Snotra Earring", --mac+10
        rear="Vor Earring",
        body=sets.Empyrean.body,
        hands=sets.Empyrean.hands,
        lring="Stikini Ring +1",
        rring="Stikini Ring +1",
        -- back="Aurist's Cape +1", --bis, after augmenting
        back=Sucellos.EnfeeblingMnd,
        waist="Ovate Rope", --macc+8
        legs="Psycloth Lappas", -- +18,MACC
        -- legs=sets.Empyrean.legs, -- after hitting 625 skill
        feet=sets.Relic.feet,
    }

    sets.midcast['Enfeebling Magic'] = sets.Enfeebling.PotencyMnd
    sets.midcast["Enfeebling Magic"].Resistant = sets.Enfeebling.Accuracy
    sets.midcast['Dia'] = sets.TH
    sets.midcast['Dia III'] = set_combine(sets.Enfeebling.Duration, {
        main="Daybreak",
        ammo="Regal Gem",
        rring="Weatherspoon Ring",
    })
    sets.midcast['Silence'] = sets.Enfeebling.Accuracy
    sets.midcast['Sleep'] = sets.Enfeebling.Duration
    sets.midcast["Bind"] = sets.Enfeebling.Duration
    sets.midcast['Sleep II'] = sets.Enfeebling.Duration
    sets.midcast['Sleepga'] = sets.Enfeebling.Duration
    sets.midcast['Dispel'] = set_combine(sets.Enfeebling.Accuracy, {
        neck="Duelist's Torque +2", -- dispel +1
    })
    sets.midcast['Dispelga'] = set_combine(sets.midcast['Dispel'],
        {main="Daybreak", sub="Ammurapi Shield"})
    sets.midcast['Frazzle'] = sets.Enfeebling.Skill
    sets.midcast['Frazzle II'] = sets.Enfeebling.Accuracy
    sets.midcast['Frazzle III'] = sets.Enfeebling.Skill
    sets.midcast["Paralyze II"] = sets.Enfeebling.PotencyMnd
    sets.midcast["Distract III"] = sets.Enfeebling.PotencyMnd
    sets.midcast["Blind II"] = sets.Enfeebling.PotencyInt
    sets.midcast['Frazzle III'].Resistant = sets.Enfeebling.Accuracy
    sets.midcast["Paralyze II"].Resistant = sets.Enfeebling.Accuracy
    sets.midcast["Distract III"].Resistant = sets.Enfeebling.Accuracy
    sets.midcast["Blind II"].Resistant = sets.Enfeebling.Accuracy


    -- Elemetal Magic
    sets.midcast['Elemental Magic'] = {
        main="Daybreak", -- MAB+40
        sub="Ammurapi Shield", -- MAB+38
        ranged="Ullr", --MAC+40
        --ranged="Ghastly Tathlum +1"
        head=sets.Empyrean.head, --MAB+51
        neck="Sibyl Scarf", -- MAB+10,INT+10
        lear="Friomisi Earring", -- MAB+10
        rear="Regal Earring", -- MAB+7
        body=sets.Empyrean.body, -- MAB+49
        -- hands="Amalric Gages", -- MAB+23, MBII+5
        hands=sets.Empyrean.hands, -- MAB+47, MD+22
        -- hands="Jhakri Cuffs +2", --MAB+40
        lring="Weatherspoon Ring", --MAB+10
        rring="Acumen Ring", -- MAB+4
        back=Sucellos.Nuke,
        waist="Aswang Sash", -- MAB+3
        -- waist="Acuity Belt +1", --needs to be agumented
        legs=sets.Empyrean.legs, -- MAB+53
        feet=sets.Empyrean.feet, --MAB+50
    }
    sets.Nuke = sets.midcast['Elemental Magic']
    --sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})


    -- Dark Magic
    sets.midcast['Dark Magic'] = {
        main="Grioavolr",
        sub="Clerisy Strap", --MAC+10
        head=sets.Artifact.head,
        neck="Aesir Torque",
        -- lear="Abyssal Earring",
        rear="Magnetic Earring",
        -- body="Glamor Jupon", -- Drk skill +3
        body=sets.Empyrean.body, --MAC,MAB
        -- hands="Crimson Finger Gauntlets", --Drk skill +10
        -- hands="Amalric Gages", -- MAB+23, MBII+5, sure why not
        hands="Jhakri Cuffs +2", --INT+36,MAB+40
        lring="Snow Ring",
        rring="Stikini Ring +1", --sk+5 MAC+8
        -- back="Prism Cape",
        waist="Aswang Sash",
        legs="Jhakri Slops +2",
        feet="Jhakri Pigaches +2",
    }

    sets.midcast.Stun = {
        main="Crocea Mors", --MAC+50
        sub="Ammurapi Shield", --MAC+38
        ranged="Ullr",
        head=sets.Artifact.head,
        neck="Duelist's Torque +2", -- macc+30,enf ef+10
        lear="Regal Earring", --macc+15 w/set
        rear="Lethargy Earring +1", --FC+8%,MACC+14
        body=sets.Artifact.body,
        hands=sets.Empyrean.hands,
        lring="Kishar Ring", --FC+4%
        rring="Stikini Ring +1",
        back=Sucellos.Enfeebling, --for the accuracy
        waist="Embla Sash", --FC+5%
        legs="Ayanmo Cosciales +2",
        feet=sets.Empyrean.feet,
    }
    sets.midcast['Absorb-TP'] = sets.midcast.Stun

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        head="Pixie Hairpin +1", -- Dark affinity
        neck="Erra Pendant",
        waist="Fucho-no-obi",
        ring1="Excelsis Ring"})
    sets.midcast.Aspir = sets.midcast.Drain


    --------------------------------------
    -- Vermelee Sets
    --------------------------------------

    -- Engaged sets
    sets.engagedold = {
        -- head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        -- body="Atrophy Tabard +1",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        -- back="Atheling Mantle",waist="Goading Belt",legs="Osmium Cuisses",feet="Atrophy Boots"}
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        neck="Asperity Necklace",
        lear="Sherida Earring",
        -- rear="Suppanomimi",
        rear="Cessance Earring",
        body="Malignance Tabard",
        hands="Ayanmo Manopolas +2", --Acc+43,Haste+4%
        lring="Petrov Ring",
        rring="Chirich Ring",
        back=Sucellos.DA,
        waist="Windbuffet Belt +1", --TA+2%,QA+2%
        legs="Malignance Tights",
        feet="Carmine Greaves +1", --haste+4%,STR+14,DA+3%
    }
    sets.engagedSTP = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        neck="Anu Torque",
        lear="Sherida Earring",
        rear="Telos Earring",
        body="Malignance Tabard",
        hands="Ayanmo Manopolas +2", --Acc+43,Haste+4%
        lring="Chirich Ring +1",
        rring="Chirich Ring +1",
        back=Sucellos.DA,
        waist="Reiki Yotai", --DW+7
        legs="Malignance Tights",
        feet="Malignance Boots",
    }
    sets.engaged = sets.engagedSTP
    sets.engaged.DT = set_combine(sets.engagedSTP, {
        head="Nyame Helm", --DT7%
        neck="Loricate Torque +1", --DT6%
        body="Malignance Tabard", --DT9%
        hands="Nyame Gauntlets", --DT7%
        waist="Flume Belt", --PDT-4%
        legs="Nyame Flanchard", --DT-8%
        feet="Nyame Sollerets", --DT-7%
    })
    sets.engaged.Accuracy = set_combine(sets.engagedSTP, {
        neck="Null Loop",
        lear="Telos Earring",
        rear="Lethargy Earring +1",
        back="Null Shawl",
        waist="Null Belt",
    })
    sets.engaged.PhysicalDef = {ammo="Demonry Stone",
        head="Atrophy Chapeau +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Atrophy Tabard +3",hands="Atrophy Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Kayapa Cape",waist="Goading Belt",legs="Osmium Cuisses",feet="Atrophy Boots"}


    -- Weaponskill sets
    sets.baseWS = {}
    sets.baseWS.Str = {
        head=sets.Relic.head, --Acc37/Atk+62,WSD+6%
        neck="Republican Platinum Medal",
        lear="Sherida Earring",
        rear="Moonshade Earring", -- TPBonus+250
        -- rear="Magnetic Earring",
        body=sets.Empyrean.body, --Att+54,Acc+54,STR+29
        -- hands="Jhakri Cuffs +2", --STR+18,Attack+43,WS+7%
        hands=sets.Artifact.hands, --STR+21,Acc+53,Att+WSD+6%
        lring="Pyrosoul Ring",
        rring="Ilabrat Ring",
        back=Sucellos.WS,
        waist="Prosilio Belt +1",
        legs=sets.Empyrean.legs, --Attk+53,STR+33
        -- legs="Jhakri Slops +2", --Att+45,STR+47
        feet=sets.Empyrean.feet, --Acc+50,Att+50,WS+8%
    }
    sets.baseWS.Mnd = {
        head=sets.Relic.head, -- MND+37,WSD+3%
        neck="Asperity Necklace",
        lear="Regal Earring", -- MND+10
        rear="Moonshade Earring", -- TPBonus+250
        body=sets.Empyrean.body, --Att+54,Acc+54,MND+40
        hands="Jhakri Cuffs +2", --MND+35,Attack+43,WS+7%
        lring="Stikini Ring +1",
        rring="Aqua Ring",
        back=Sucellos.WS,
        waist="Dynamic Belt +1",
        legs=sets.Empyrean.legs, --Attk+53,MND+38
        feet=sets.Empyrean.feet, --Acc+50,Att+50,WS+8%
    }
    sets.precast.WS = sets.baseWS.Str

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.midcast['Elemental Magic'], {
        back=Sucellos.WS,
        rear="Moonshade Earring",
    })
    sets.precast.WS['Death Blossom'] = set_combine(sets.midcast['Elemental Magic'], {
        back=Sucellos.WS,
        rear="Moonshade Earring",
    })
    sets.precast.WS['Seraph Blade'] = {
        ammo="Sroda Tathlum",
        head=sets.Empyrean.head,
        neck="Sibyl Scarf", --MAB+10 (should be Baetyl)
        lear="Regal Earring", --MND+10
        rear="Moonshade Earring",
        body=sets.Empyrean.body,
        hands=sets.Empyrean.hands,
        lring="Weatherspoon Ring", -- Light Affinity
        rring="Cornelia's Ring",
        back=Sucellos.WSD_MND,
        -- waist="Aswang Sash", --MAB+3,Mcrit+5%
        waist="Eschan Stone", --MAB+7,Macc+7
        legs=sets.Empyrean.legs,
        feet=sets.Empyrean.feet,
    }

    sets.precast.WS['Sanguine Blade'] = set_combine(sets.midcast['Elemental Magic'], {
        ammo="Sroda Tathlum",
        head="Pixie Hairpin +1",
        back=Sucellos.WS,
        lear="Regal Earring", --MND+10
        rear="Moonshade Earring",
        -- waist="Anrin Obi",
        rring="Cornelia's Ring",
    })

    sets.precast.WS['Savage Blade'] = {
        head=sets.Relic.head, --WSD+6%
        neck="Republican Platinum Medal",
        lear="Telos Earring",
        rear="Moonshade Earring", -- TPBonus+250
        body=sets.Empyrean.body, --Att+54,Acc+54,STR+29
        hands=sets.Artifact.hands, --STR+21,Acc+53,Att+WSD+6%
        -- lring="Pyrosoul Ring",
        lring="Cornelia's Ring",
        rring="Ilabrat Ring",
        back=Sucellos.WS,
        waist="Prosilio Belt +1",
        legs=sets.Empyrean.legs, --Attk+53,STR+33
        feet=sets.Empyrean.feet, --Acc+50,Att+50,WS+8%
    }

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
    maintain_weapon_mode(spell, action)
end

function job_post_precast(spell, action, spellMap, eventArgs)
    maintain_weapon_mode(spell, action)
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    debug_log("entering job_post_midcast")
    debug_log(".."..action)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.midcast.EnhancingDuration)
            equip(sets.buff.ComposureOther)
        end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
    maintain_weapon_mode(spell, action)
end

-- function job_aftercast(spell, action, spellMap, eventArgs)
--     maintain_weapon_mode(spell, action)
-- end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    debug_log("job_state_change")
    if stateField == 'WeaponSet' and newValue ~= 'Normal' then
        maintain_weapon_mode(nil, 'statechange')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------


function customize_precast_set(preCast)
    debug_log('doing customize precast set')
    preCast = set_combine(preCast, maintain_weapon_mode(nil, 'precast'))
    return preCast
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    -- windower.add_to_chat(64,'customize idle')
    -- if player.mpp < 51 then
    --     idleSet = set_combine(idleSet, sets.latent_refresh)
    -- end
    -- debug_log("enter customize_idle_set", 121)
    -- if state.WeaponSet.current ~= 'Normal' then
    --     debug_log("weapon mode should be accepted")
    --     idleSet = set_combine(idleSet, sets.WeaponSet[state.WeaponSet.current])
    -- end
    idleSet = set_combine(idleSet, maintain_weapon_mode(nil, 'idle'))
    return idleSet
end

function customize_melee_set(meleeSet)
    debug_log('doing customize precast set')
    meleeSet = set_combine(meleeSet, maintain_weapon_mode(nil, 'melee'))
    return meleeSet
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
    -- windower.add_to_chat(64,"name:" ..spell.english .. ".")
    -- this can be used to
    -- for k,v in pairs(spell) do
    --     windower.add_to_chat(64," " ..k.. ": "..v .."")
    -- end
    -- Enfeebling Sets, by element
    -- if spell.skill == 'Enfeebling Magic' then
    --     if spell.type == 'WhiteMagic' then
    --         equip(sets.Enfeebling.Mnd)
    --     else
    --         equip(sets.Enfeebling.Int.Soft)
    --     end
    -- end

    -- Elemental Staves
    -- if spell.skill == 'Elemental Magic' or spell.skill == 'Enfeebling Magic' or spell.skill == "Dark Magic" then
    --     equip(sets.ElementalStaves[spell.element])
    -- end

end

is_meleeing = false
-- the example: https://github.com/Tunaliz/Liz_Gearswaps/blob/master/RDM_Lib.lua
function job_self_command(command, eventArgs)
    -- $ gs c [command]
    -- Super Smash RDM MELEE
    -- if command[1] == 'melee' then
    --     -- explicit on/off switches:
    --     if command[2] == 'on' then
    --         enable_vermelee()
    --     elseif command[2] == 'off' then
    --         disable_vermelee()
    --     -- No arg, so toggle
    --     else
    --         if is_meleeing == false then
    --             enable_vermelee()
    --         elseif is_meleeing == true then
    --             disable_vermelee()
    --         end
    --     end
    --     eventArgs.handled = true
    -- end
end

function maintain_weapon_mode(spell, action)
    update_set = {}
    debug_log(" ..enter maintain_weapon_mode "..action)
    -- If the state is Normal, we allow the default to happen.
    if state.WeaponSet.current ~= 'Normal' then
        debug_log("weapon mode should be accepted")
        if spell and exception_spells:contains(spell.english) and action ~= 'aftercast' then
            debug_log("spell allows weapon changes")
        else
            update_set = sets.WeaponSet[state.WeaponSet.current]
            -- un-DW the set:
            if (player.sub_job ~= 'NIN' and player.sub_job ~= 'DNC') then
                update_set = set_combine(update_set, sets.DefaultShield)
            end
        end
    end
    equip(update_set)
    return update_set
end
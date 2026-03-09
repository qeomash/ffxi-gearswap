
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function binds_on_load()
    debug_log("...entered local binds_on_load")

    send_command('bind f9 gs c cycle WeaponSet')
    send_command('bind ~f9 gs c cycle WeaponSet reverse')
    send_command('bind !f9 gs c reset WeaponSet')

    send_command('bind f10 gs c cycle IdleMode')
    send_command('bind ~f10 gs c cycle IdleMode reverse')
    send_command('bind !f10 gs c reset IdleMode')

    send_command('bind f11 gs c cycle CastingMode')
    send_command('bind ~f11 gs c cycle CastingMode reverse')
    -- send_command('bind !f11 gs c reset CastingMode')

    send_command('bind f12 gs c cycle HybridMode')
    send_command('bind ~f12 gs c cycle HybridMode reverse')
    send_command('bind !f12 gs c reset HybridMode')

    send_command('bind != gs equip fastshoes')
end


function binds_on_unload()
    send_command('unbind f9')
    send_command('unbind ~f9')
    send_command('unbind !f9')
    send_command('unbind f10')
    send_command('unbind ~f10')
    send_command('unbind !f10')
    send_command('unbind f11')
    send_command('unbind ~f11')
    -- send_command('unbind !f11')
    send_command('unbind f12')
    send_command('unbind ~f12')
    send_command('unbind !f12')

    send_command('unbind !=')
end


function user_setup()
    enable_all_slots()
    state.OffenseMode:options('Normal', 'Attack')
    state.HybridMode:options('Normal', 'DT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT', 'MDT', 'Refresh')
    send_command('wait 2;input /lockstyleset 41')
    select_default_macro_book()
end

function init_gear_sets()

    -- Special sets and gear

    sets.Artifact = {
        head="Healer's Cap",
        body="Theophany Bliaut +2",
        hands="Theophany Mitts +2",
        legs="Theophany Pantaloons +1",
        feet="Theophany Duckbills +1",
    }
    sets.Relic = {
        head="",
        body="",
        hands="",
        legs="",
        feet="",
    }
    sets.Empyrean = {
        head="Ebers Cap",
        body="Ebers Bliaut",
        hands="Orison Mitts +1",
        legs="Ebers Pantaloons +3",
        feet="Orison Duckbills +1",
    }

    sets.fastshoes = {
        feet="Herald's Gaiters", -- +12%
    }
    sets.TH = {
        head="Volte Cap", --TH+1
        ammo="Perfect Lucky Egg", -- TH+1
        waist="Chaac Belt", --TH+1
        legs="Volte Hose", --TH+1
    }

    -- Ambu Capes
    Alaunus = {}
    Alaunus.Healing = { name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Enmity-10',}}
    Alaunus.Idle = { name="Alaunus's Cape", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}}

    sets.precast.FC = {
        head="Vanya Hood", --FC+10%
        -- neck="Cleric's Torque", --FC+6%
        lear="Malignance Earring", --FC+4%
        rear="Loquacious Earring", --FC+2%
        body="Inyanga Jubbah +2", --FC+14%
        lring="Kishar Ring", --FC+4%
        back=Alaunus.Idle, --FC+10%
        waist="Embla Sash", --FC+5%
        legs="Ayanmo Cosciales +2", --FC+5%
        feet="Volte Gaiters", --FC+6%
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist="Siegel Sash"
    })

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC,
        {
            main="Queller Rod", -- CFC-7%
            sub="Sors Shield", -- CFC-5%
            rring="Weatherspoon Ring", --QM+3%
            legs=sets.Empyrean.legs, -- CFC -15%
            -- feet="Kaykaus Boots" -- CFC-5%
    })

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure

    sets.precast.JA.Benediction = {body="Piety Bliaut +2"}
    sets.precast.JA["Devotion"] = {head="Piety Cap +1"}

    sets.midcast.Cure = {
        main="Queller Rod", -- CPII+2%,CP+10%
        sub="Sors Shield",
        ammo="Psilomene", --Enmity-3
        head="Kaykaus Mitra +1", -- CP+11%,CPII
        neck="Cleric's Torque", -- CP+5%
        body=sets.Empyrean.body, --CPII, Solace+18
        -- body="Kaykaus Bliaut", -- CPII+4%
        hands=sets.Artifact.hands, --CPII+2%
        lear="Orison Earring", --CP+2%
        rear="Enervating Earring", --Enmity-3
        back=Alaunus.Healing,
        legs=sets.Empyrean.legs,
        feet="Kaykaus Boots", --CP+10%
        ring1="Lebeche Ring", -- CP+3%
    }
    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        -- body=sets.Artifact.body,
        body="Kaykaus Bliaut", -- CPII+4%
    })

    sets.midcast.Cursna = {
        back="Alaunus's Cape", -- Cursna +25
        legs=sets.Artifact.legs,
        -- rear="Ebers Earring +1", --sk+10
        -- neck="Malison Medallion",
        neck="Debilis Medallion",
        lring="Menelaus's Ring",
        rring="Ephedra Ring",
        waist="Bishop's Sash",
        feet="Vanya Clogs",
    }

    sets.midcast['Erase'] = {
        head=sets.Empyrean.head, --DV+24%
        neck="Cleric's Torque", -- Erase+1
    }

    sets.midcast.Regen = {
        -- main="Bolelabunga", -- +12%
        main="Daybreak", --just to ensure ammurapi
        sub="Ammurapi Shield",
        head="Inyanga Tiara +2", -- +12%
        -- body="Piety Bliaut +2", -- +36% HP
        hands=sets.Empyrean.hands, --dura+
        waist="Embla Sash",
        legs=sets.Artifact.legs,
        feet=sets.Artifact.feet, --dura+10%
    }

    sets.midcast['Dia'] = sets.TH

    --------------------------------------
    -- Idle Sets
    --------------------------------------

    sets.idle = {
        main="Daybreak", --Refresh+1
        sub="Genmei Shield",
        ammo="Homiliary",
        head="Inyanga Tiara +2",
        neck="Loricate Torque +1",
        rear="Odnowa Earring +1", -- MDT-2%
        body="Kaykaus Bliaut +1", -- Refresh+3
        hands="Inyanga Dastanas +2",
        lring="Inyanga Ring",
        rring="Warden's Ring",
        waist="Null Belt", --Regen+3
        legs="Inyanga Shalwar +2",
        feet="Inyanga Crackows +2",
    }

    sets.idle.DT = set_combine(sets.idle,
        {
            main="Malignance Pole",
            sub="Alber Strap", --PTD-2%
            head="Nyame Helm", --DT7%
            neck="Loricate Torque +1", --DT6%
            body="Nyame Mail", --DT9%
            hands="Nyame Gauntlets", --DT7%
            lring="Shadow Ring",
            rring="Warden's Ring",
            waist="Flume Belt", --PDT-4%
            legs="Nyame Flanchard", --DT-8%
            feet="Nyame Sollerets", --DT-7%
        }
    )
    sets.idle.MDT = set_combine(sets.idle.DT,
        {
            main="Daybreak", --Refresh+1
            sub="Genmei Shield",
            head="Bunzi's Hat",
            rear="Odnowa Earring +1", -- MDT-2%
            body="Bunzi's Robe",
            hands="Bunzi's Gloves",
            legs="Bunzi's Pants",
            feet="Bunzi's Sabots",
        })

    sets.idle.Refresh = {
        main="Daybreak", --Refresh+1
        sub="Genmei Shield",
        ammo="Homiliary",
        head="Inyanga Tiara +2",
        neck="Loricate Torque +1",
        body="Kaykaus Bliaut +1", -- Refresh+3
        hands="Inyanga Dastanas +2",
        lring="Inyanga Ring",
        rring="Warden's Ring",
        waist="Fucho-no-obi",
        legs="Inyanga Shalwar +2",
        feet="Inyanga Crackows +2",
    }

    sets.resting = sets.idle.Refresh

end

































function select_default_macro_book()
    set_macro_page(1, 11)
end
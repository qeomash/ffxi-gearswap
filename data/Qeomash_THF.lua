
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
end

function user_setup()
    enable_all_slots()
    state.WeaponSet = M{['description'] = 'WeaponSet'}
    state.OffenseMode:options('Normal', 'Attack')
    state.HybridMode:options('Normal', 'TreasureHunter', 'ProcNeck')
    state.IdleMode:options('Normal')
    state.WeaponSet:options(
        'Daggers', 'Naegling',
        'Procs: Daggers', 'Procs: Katana', 'Procs: GKT'
    )

    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 19')
    send_command('gs c reset WeaponSet')
end

function init_gear_sets()

    sets.WeaponSet = {}
    sets.WeaponSet["Daggers"] = {
        main="Gleti's Knife",
        sub="Ternion Dagger +1",
    }
    sets.WeaponSet["Naegling"] = {
        main="Naegling",
        sub="Ternion Dagger +1",
    }

    sets.WeaponSet['Procs: Daggers'] = {
        main="Aern Dagger",
        sub="Aern Dagger II",
    }
    sets.WeaponSet['Procs: Katana'] = {
        main="Debahocho",
        sub="Aern Dagger II",
    }
    sets.WeaponSet['Procs: GKT'] = {
        main="Shinai",
        sub="Alber Strap",
    }

    sets.TH = {
        ammo="Perfect Lucky Egg", --+1
        head="Volte Cap", -- +1
        hands="Assassin's Armlets", --+1
        waist="Chaac Belt", --TH+1
        legs="Volte Hose", --TH+1
    }

    sets.engagedBase = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        neck="Asperity Necklace",
        ear1="Sherida Earring",
        ear2="Telos Earring",
        body="Malignance Tabard",
        hands="Mummu Wrists +2",
        lring="Petrov Ring",
        rring="Epona's Ring",
        back="Canny Cape",
        waist="Windbuffet Belt +1", --TA+2%,QA+2%
        legs="Malignance Tights",
        feet="Malignance Boots",
    }
    sets.engaged = sets.engagedBase
    sets.engaged.TreasureHunter = set_combine(sets.engagedBase, sets.TH)
    sets.engaged.ProcNeck = set_combine(sets.engagedBase, {
        neck="Hoxne Torque", -- Skills +30
    })
    sets.engaged.Gleti = set_combine(sets.engagedBase, {
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
    })

    sets.idle = set_combine(sets.engagedBase, {
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Trotter Boots" --Movement+
    })

    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Gleti's Mask",
        ear1="Telos Earring",
        ear2="Moonshade Earring", -- TPBonus+250
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
        ear2="Telos Earring",
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

    sets.precast.JA['Steal'] = {
        head="Rogue's Bonnet",
        hands="Rogue's Armlets",
        legs="Rogue's Culottes",
        feet="Rogue's Poulaines",
    }

    sets.precast.JA['Flee'] = {
        feet="Rogue's Poulaines",
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
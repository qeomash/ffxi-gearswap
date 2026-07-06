function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable_all_slots()
    state.WeaponSet = M{['description'] = 'WeaponSet'}

    state.HybridMode:options('Normal', 'DT', 'Accuracy', "Enspell")
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT', 'Refresh')
    state.WeaponSet:options(
        'Chango', 'Naegling',
        'Procs: Dagger', 'Procs: Sword', 'Procs: GSword', 'Procs: Scythe', 'Procs: Polearm', 'Procs: Club', 'Procs: Staff'
    )


    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 15')
    send_command('gs c reset WeaponSet')
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


function init_gear_sets()

    Cichols = {}
    Cichols.TP_DA = { name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
    Cichols.STR_WSD = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    sets.WeaponSet = {}
    sets.WeaponSet['Chango'] = {
        main="Chango",
        sub="Duplus Grip",
        ammo="Coiste Bodhar",
    }
    sets.WeaponSet['Naegling'] = {
        main="Naegling",
        sub="Blurred Shield +1",
        ammo="Coiste Bodhar",
    }

    sets.WeaponSet['Procs: Dagger'] = {
        main="Aern Dagger",
        sub="Blurred Shield +1",
    }

    sets.WeaponSet['Procs: Sword'] = {
        main="Excalipoor II",
        sub="Blurred Shield +1",
    }
    sets.WeaponSet['Procs: GSword'] = {
        main="Goujian",
        sub="Duplus Grip",
    }
    sets.WeaponSet['Procs: Scythe'] = {
        main="Bronze Zaghnal",
        sub="Duplus Grip",
    }
    sets.WeaponSet['Procs: Polearm'] = {
        main="Tzee Xicu's Blade",
        sub="Duplus Grip",
    }
    sets.WeaponSet['Procs: GKT'] = {
        main="Zanmato +1",
        sub="Duplus Grip",
    }
    sets.WeaponSet['Procs: Club'] = {
        main="Soulflayer's Wand",
        sub="Blurred Shield +1",
    }
    sets.WeaponSet['Procs: Staff'] = {
        main="Levin",
        sub="Duplus Grip",
    }

    sets.engaged = {
        head="Flamma Zucchetto +2",
        neck="Warrior's Beads",
        lear="Telos Earring",
        rear="Boii Earring +1",
        body="Flamma Korazin +2",
        hands="Sulevia's Gauntlets +2",
        lring="Niqmaddu Ring",
        rring="Flamma Ring",
        back=Cichols.TP_DA,
        waist="Sailfi Belt +1",
        legs="Sulevia's Cuisses +2",
        feet="Flamma Gambieras +2",
    }

    sets.idle = set_combine(sets.engaged, {
        neck="Loricate Torque +1", --DT-6%
        rring="Shneddick Ring",
    })
    sets.baseWS = {}
    sets.baseWS.Str = {
        head="Sulevia's Mask +2", --STR+33
        neck="Warrior's Beads",
        left_ear="Brutal Earring",
        right_ear="Boii Earring +1",
        body="Sulevia's Platemail +2",
        hands="Sulevia's Gauntlets +2",
        lring="Sulevia's Ring",
        rring="Regal Ring",
        back=Cichols.STR_WSD,
        waist="Sailfi Belt +1",
        legs="Sulevia's Cuisses +2",
        feet="Sulevia's Leggings +2", --WS+7%
    }

    sets.precast.WS = sets.baseWS.Str
end




function select_default_macro_book()
    set_macro_page(1, 3)
end
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 15')
    equip(sets.mainweapons)
end

function init_gear_sets()

    Cichols = {}
    Cichols.TP_DA = { name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
    Cichols.STR_WSD = { name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    sets.mainweapons = {
        main="Chango",
        sub="Duplus Grip",
        ammo="Coiste Bodhar",
    }
    sets.naegling = {
        main="Naegling",
        sub="Blurred Shield +1",
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
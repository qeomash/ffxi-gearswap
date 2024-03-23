function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 21')
    equip(sets.mainweapons)
end

function init_gear_sets()

    sets.mainweapons = {
        main="Naegling",
        sub="Thibron",
        ammo="Coiste Bodhar",
    }
    sets.learningweapons = {
        main="Excalipoor II",
        sub="Wax Sword",
    }

    sets.idle = {
        head="Gleti's Mask",
        neck="Loricate Torque +1", --DT-6%
        body="Jhakri Robe +2", --refresh+2
        hands="Gleti's Gauntlets",
        waist="Flume Belt",
        legs="Carmine Cuisses",
        feet="Gleti's Boots",
    }
    Rosmertas = {}
    Rosmertas.DA = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}

    sets.engaged = {
        head="Malignance Chapeau",
        neck="Asperity Necklace",
        lear="Brutal Earring",
        rear="Suppanomimi",
        body="Malignance Tabard",
        hands="Ayanmo Manopolas +2", --Acc+43,Haste+4%
        lring="Petrov Ring",
        rring="Epona's Ring",
        back=Rosmertas.DA,
        waist="Windbuffet Belt +1",
        legs="Malignance Tights",
        feet="Carmine Greaves +1", --haste+4%,STR+14,DA+4%
    }

    sets.baseWS = {
        head="Jhakri Coronal +2", -- STR+31
        neck="Asperity Necklace",
        lear="Cessance Earring",
        rear="Moonshade Earring", -- TPBonus+250
        -- body="Ayanmo Corazza +2", --Haste+4%,DA+7%,Acc+46
        body="Jhakri Robe +2", --Acc+46,Att+46,STR+37
        hands="Jhakri Cuffs +2", --STR+18,Attack+43,WS+7%
        lring="Pyrosoul Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Dynamic Belt +1",
        legs="Jhakri Slops +2", --Att+45,STR+47
        feet="Jhakri Pigaches +2", -- STR+22
    }
    sets.baseWS.Str = set_combine(sets.baseWS, {
        lring="Pyrosoul Ring",
    })
    sets.baseWS.Accuracy = set_combine(sets.baseWS, {})
    sets.precast.WS = sets.baseWS.Str
    -- sets.precast.WS['Stardiver'] = set_combine(sets.baseWS.Str, {neck='Light Gorget'})


    -- Spellcasting
    sets.precast.FC = {
        body="Ebur Talar", --5%
        lear="Loquacious Earring",
        back="Swith Cape",
        legs="Ayanmo Cosciales +2",
        lring="Weatherspoon Ring",
        feet="Carmine Greaves +1", --FC+8%
    }
end

function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 6)
end
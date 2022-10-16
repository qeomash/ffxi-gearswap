function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
    -- send_command('wait 2;input /lockstyleset 10')
    equip(sets.mainweapons)
end

function init_gear_sets()

    sets.mainweapons = {
        main="Tokko Sword",
        sub="Camaraderie Blade",
        ammo="Tiphia Sting",
    }

    sets.idle = {
        head="Magus Keffiyeh",
        body="Mirage Jubbah",
        legs="Crimson Cuisses",
        feet="Carmine Greaves", --haste+4%,STR+14,DA+3%
    }

    sets.engaged = {
        head="Wayfarer Circlet",
        neck="Ocachi Gorget",
        lear="Brutal Earring",
        rear="Spike Earring",
        body="Weatherspoon Robe +1", --haste+3%,str+26
        hands="Jhakri Cuffs", --Acc+25,Att+25
        lring="Blood Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Dynamic Belt +1",
        legs="Weatherspoon Pants +1",
        feet="Carmine Greaves", --haste+4%,STR+14,DA+3%
    }

    sets.baseWS = {
        head="Wayfarer Circlet", --STR+19
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Magnetic Earring",
        body="Weatherspoon Robe +1", -- STR+26
        hands="Jhakri Cuffs", --STR+10,Attack+25,WS+3%
        lring="Flame Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Warwolf Belt",
        legs="Weatherspoon Pants +1", -- STR+25
        feet="Carmine Greaves", -- STR+14
    }
    sets.baseWS.Str = set_combine(sets.baseWS, {
        lring="Flame Ring",
    })
    sets.baseWS.Accuracy = set_combine(sets.baseWS, {})
    sets.precast.WS = sets.baseWS.Str
    -- sets.precast.WS['Stardiver'] = set_combine(sets.baseWS.Str, {neck='Light Gorget'})


    -- Spellcasting
    sets.precast.FC = {
        lear="Loquacious Earring",
        back="Swith Cape",
        feet="Carmine Greaves",
    }
end

function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 6)
end
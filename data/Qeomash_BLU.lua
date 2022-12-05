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
        main="Claidheamh Soluis",
        sub="Tokko Sword",
        ammo="Tiphia Sting",
    }
    sets.learningweapons = {
        main="Wax Sword",
        sub="Wax Sword",
    }

    sets.idle = {
        head="Magus Keffiyeh",
        body="Mirage Jubbah",
        legs="Crimson Cuisses",
        feet="Carmine Greaves", --haste+4%,STR+14,DA+3%
    }

    sets.engaged = {
        head="Ayanmo Zucchetto",
        neck="Ocachi Gorget",
        lear="Brutal Earring",
        rear="Magnetic Earring",
        body="Ayanmo Corazza", --Haste+4%,DA+4%,Acc+28
        hands="Ayanmo Manopolas", --Acc+25,Haste+4%
        lring="Jhakri Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Dynamic Belt +1",
        legs="Ayanmo Cosciales",
        feet="Carmine Greaves", --haste+4%,STR+14,DA+3%
    }

    sets.baseWS = {
        head="Ayanmo Zucchetto", -- STR+20
        neck="Chivalrous Chain",
        lear="Brutal Earring",
        rear="Magnetic Earring",
        body="Ayanmo Corazza",
        hands="Jhakri Cuffs", --STR+10,Attack+25,WS+3%
        lring="Pyrosoul Ring",
        rring="Rajas Ring",
        back="Forager's Mantle",
        waist="Warwolf Belt",
        legs="Ayanmo Cosciales",
        feet="Jhakri Pigaches +1", -- STR+22
    }
    sets.baseWS.Str = set_combine(sets.baseWS, {
        lring="Pyrosoul Ring",
    })
    sets.baseWS.Accuracy = set_combine(sets.baseWS, {})
    sets.precast.WS = sets.baseWS.Str
    -- sets.precast.WS['Stardiver'] = set_combine(sets.baseWS.Str, {neck='Light Gorget'})


    -- Spellcasting
    sets.precast.FC = {
        lear="Loquacious Earring",
        back="Swith Cape",
        legs="Ayanmo Cosciales",
        lring="Weatherspoon Ring",
        feet="Carmine Greaves",
    }
end

function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 6)
end
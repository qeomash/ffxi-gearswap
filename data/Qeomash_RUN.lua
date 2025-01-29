function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    send_command('gs enable all')
    select_default_macro_book()
    -- send_command('wait 2;input /lockstyleset 15')
    equip(sets.mainweapons)
    send_command('wait 2;input /lockstyleset 30')
end

function init_gear_sets()

    OgmasCape = {}
    OgmasCape.DD = {}
    OgmasCape.Tank = {}
    OgmasCape.WS = {}

    sets.dpsweapons = {
        main="Zantetsuken X",
        sub="Utu Grip",
    }
    sets.tankingweapons = {
        main="Aettir",
        sub="Utu Grip",
    }
    sets.ddweapons = sets.dpsweapons
    sets.mainweapons = sets.dpsweapons

    sets.engagedDD = {
        ammo="Coiste Bodhar",
        head="Skormoth Mask",
        neck="Anu Torque",
        lear="Cessance Earring",
        rear="Sherida Earring",
        body="Ashera Harness",
        hands="ayanmo Manopolas +2",
        lring="Niqmaddu Ring",
        rring="Epona's Ring",
        back="Evasionist's Cape",
        waist="Windbuffet Belt +1",
        legs="Ayanmo Cosciales +2",
        feet="Ayanmo Gambieras +2",
    }
    sets.engagedTank = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        neck="Loricate Torque +1",
        lear="Cessance Earring",
        rear="Erilaz Earring +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        back="Evasionist's Cape",
        waist="Flume Belt",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
    }

    sets.engaged = sets.engagedTank

    sets.precast.FC = {
        lear="Loquacious Earring",
        legs="Ayanmo Cosciales +2",
        feet="Carmine Greaves +1",
    }

    sets.idle = set_combine(sets.engagedTank, {
        legs="Carmine Cuisses +1", --Movement+18%
    })

    sets.baseWS = {}
    sets.baseWS.Str = {
        ammo="Knobkierrie",
        head="Nyame Helm",
        neck="Fotia Gorget",
        lear="Sherida Earring",
        rear="Moonshade Earring", -- TPBonus+250
        lear="Cessance Earring",
        rear="Erilaz Earring +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        back="Laic Mantle",
        waist="Flume Belt",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
    }
    sets.precast.WS = sets.baseWS.Str

end



function select_default_macro_book()
    set_macro_page(1, 9)
end
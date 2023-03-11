function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    set_macro_page(1, 1)
    send_command('wait 2;input /lockstyleset 1')
end

function init_gear_sets()

    sets.ElementalStaves = {}
    sets.ElementalStaves.Fire = {main="Fire Staff", sub="Staff Strap"}
    sets.ElementalStaves.Earth = {main="Terra's Staff", sub="Earth Grip"}
    sets.ElementalStaves.Water = {main="Water Staff", sub="Staff Strap"}
    sets.ElementalStaves.Wind = {main="Auster's Staff", sub="Wind Grip"}
    sets.ElementalStaves.Ice = {main="Aquilo's Staff", sub="Ice Grip"}
    sets.ElementalStaves.Lightning = {main="Jupiter's Staff", sub="Thunder Grip"}
    sets.ElementalStaves.Light = {main="Apollo's Staff", sub="Staff Strap"}
    sets.ElementalStaves.Dark = {main="Pluto's Staff", sub="Dark Grip"}

    sets.melee = {
        main="Verdun",
    }
    sets.casting = {
        main="Iridal Staff",
    }
   
    sets.precast.FC = {
        head="Warlock's Chapeau",
        neck="Holy Phial",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Duelist's Tabard",
        back="Prism Cape",
        legs="Ayanmo Cosciales +1",
        feet="Jhakri Pigaches +1",
    }

    sets.idle = {
        main="Emissary", --Refresh+1
        sub="Genbu's Shield",
        head="Duelist's Chapeau",
        neck="Orochi Nodowa",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs",
        back="Prism Cape",
        waist="Demonry Sash",
        legs="Carmine Cuisses",
        feet="Jhakri Pigaches +1",
    }

    sets.midcast['Elemental Magic'] = {
        main="Grioavolr",
        sub="Staff Strap",
        head="Jhakri Coronal",
        neck="Elemental Torque",
        ear1="Moldavite Earring",
        ear2="Abyssal Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs",
        ring1="Snow Ring",
        ring2="Snow Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches +1",
    }

    sets.midcast['Enhancing Magic'] = {
        main="Grioavolr",
        sub="Staff Strap",
        head="Carmine Mask",
        neck="Holy Phial",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs",
        ring1="Electrum Ring",
        ring2="Ether Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches +1",
    }

    sets.Enfeebling = {}
    sets.Enfeebling.Int = {
        main="Kaja Staff",
        sub="Staff Strap",
        head="Carmine Mask",
        neck="Enfeebling Torque",
        ear1="Moldavite Earring",
        ear2="Abyssal Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs",
        ring1="Snow Ring",
        ring2="Snow Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches +1",
    }
    sets.Enfeebling.Mnd = {
        main="Kaja Staff",
        sub="Staff Strap",
        head="Carmine Mask",
        neck="Enfeebling Torque",
        ear1="Moldavite Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs",
        ring1="Aqua Ring",
        ring2="Aqua Ring",
        back="Prism Cape",
        waist="Demonry Sash",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches +1",
    }
    sets.midcast['Enfeebling Magic'] = sets.Enfeebling.Int
    sets.midcast['Dia III'] = sets.Enfeebling.Mnd
    sets.midcast['Silence'] = sets.Enfeebling.Mnd
    sets.midcast['Sleep'] = sets.Enfeebling.Int
    sets.midcast['Sleep II'] = sets.Enfeebling.Int
    sets.midcast['Sleepga'] = sets.Enfeebling.Int
    sets.midcast['Dispel'] = sets.Enfeebling.Int

    sets.resting = {
        main="Grioavolr",
        sub="Staff Strap",
        head="Duelist's Chapeau",
        neck="Orochi Nodowa",
        ear1="Moldavite Earring",
        ear2="Antivenom Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs",
        ring1="Electrum Ring",
        ring2="Ether Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches +1",
    }

    sets.midcast.Cure = {
        main="Iridal Staff",
        sub="Staff Strap",
        head="Jhakri Coronal",
        neck="Holy Phial",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Chelona Blazer",
        hands="Jhakri Cuffs",
        ring1="Aqua Ring",
        ring2="Aqua Ring",
        back="Prism Cape",
        waist="Demonry Sash",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches +1",
    }

    sets.engaged = {
            main="Ajja Sword",
            sub="Genbu's Shield",
            head="Aya. Zucchetto +1",
            body="Ayanmo Corazza +1",
            hands="Aya. Manopolas +1",
            legs="Jhakri Slops",
            feet="Aya. Gambieras +1",
            waist="Demonry Sash",
            ring1="Jhakri Ring",
            ring2="Ayanmo Ring",
    }
    sets.precast.WS = {
        hands="Jhakri Cuffs",
    }

end
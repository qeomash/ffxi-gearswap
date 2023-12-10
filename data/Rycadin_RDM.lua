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
        main="Naegling",
    }
    sets.casting = {
        main="Iridal Staff",
    }
    sets.TH = {
        main="Grioavolr", -- TH+1
        head="White Rarab Cap +1",
        feet="Chironic Slippers", -- TH+1
        waist="Chaac Belt", --TH+1
    }

    sets.precast.FC = {
        head="Atrophy Chapeau",
        neck="Holy Phial",
        ear1="Loqacious Earring",
        body="Duelist's Tabard",
        back="Prism Cape",
        legs="Ayanmo Cosciales +1",
        feet="Jhakri Pigaches +1",
    }

    sets.idle = {
        main="Emissary", --Refresh+1
        sub="Genbu's Shield",
        ammo="Homiliary",
        head="Duelist's Chapeau",
        neck="Orochi Nodowa",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        back="Prism Cape",
        waist="Demonry Sash",
        legs="Carmine Cuisses",
        feet="Jhakri Pigaches +2",
    }

    sets.midcast['Elemental Magic'] = {
        main="Grioavolr",
        sub="Staff Strap",
        head="Jhakri Coronal +2",
        neck="Elemental Torque",
        ear1="Moldavite Earring",
        ear2="Abyssal Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        ring1="Snow Ring",
        ring2="Snow Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Jhakri Slops +2",
        feet="Jhakri Pigaches +2",
    }

    sets.midcast['Enhancing Magic'] = {
        main="Grioavolr",
        sub="Staff Strap",
        head="Carmine Mask",
        neck="Holy Phial",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        ring1="Electrum Ring",
        ring2="Ether Ring",
        back="Sucellos's Cape",
        waist="Duelist's Belt",
        legs="Jhakri Slops +2",
        feet="Jhakri Pigaches +2",
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
        hands="Jhakri Cuffs +2",
        ring1="Snow Ring",
        ring2="Snow Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Jhakri Slops +2",
        feet="Jhakri Pigaches +2",
    }
    sets.Enfeebling.Mnd = {
        main="Kaja Staff",
        sub="Staff Strap",
        head="Carmine Mask",
        neck="Enfeebling Torque",
        ear1="Moldavite Earring",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        ring1="Aqua Ring",
        ring2="Aqua Ring",
        back="Prism Cape",
        waist="Demonry Sash",
        legs="Jhakri Slops +2",
        feet="Jhakri Pigaches +2",
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
        hands="Jhakri Cuffs +1",
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
        head="Jhakri Coronal +2",
        neck="Holy Phial",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Chironic Doublet", --CP+7%
        hands="Jhakri Cuffs +2",
        ring1="Aqua Ring",
        ring2="Aqua Ring",
        back="Prism Cape",
        waist="Demonry Sash",
        legs="Kaykaus Tights", --CP+10%
        feet="Kaykaus Boots", --CP+10%
    }

    sets.engaged = {
            main="Naegling",
            sub="Genbu's Shield",
            head="Aya. Zucchetto +2",
            left_ear="Brutal Earring",
            right_ear="Mache Earring",
            body="Ayanmo Corazza +2",
            hands="Ayanmo Manopolas +2",
            legs="Ayanmo Cosciales +2",
            feet="Ayanmo Gambieras +2",
            waist="Paewr Belt",
            ring1="Jhakri Ring",
            ring2="Ayanmo Ring",
    }
    sets.precast.WS = {
        hands="Jhakri Cuffs +2",
    }
    sets.midcast['Dia'] = sets.TH

end
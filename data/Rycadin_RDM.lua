function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
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
        legs="Warlock's Tights",
        feet="Jhakri Pigaches",
    }

    sets.idle = {
        head="Duelist's Chapeau",
        neck="Orochi Nodowa",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Jhakri Robe",
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
        body="Jhakri Robe",
        hands="Jhakri Cuffs",
        ring1="Snow Ring",
        ring2="Snow Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches",
    }

    sets.midcast['Enhancing Magic'] = {
        main="Grioavolr",
        sub="Staff Strap",
        head="Carmine Mask",
        neck="Holy Phial",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Jhakri Robe",
        hands="Jhakri Cuffs",
        ring1="Electrum Ring",
        ring2="Ether Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches",
    }

    sets.Enfeebling = {}
    sets.Enfeebling.Int = {
        main="Grioavolr",
        sub="Staff Strap",
        head="Carmine Mask",
        neck="Enfeebling Torque",
        ear1="Moldavite Earring",
        ear2="Abyssal Earring",
        body="Jhakri Robe",
        hands="Jhakri Cuffs",
        ring1="Snow Ring",
        ring2="Snow Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches",
    }
    sets.Enfeebling.Mnd = {
        main="Grioavolr",
        sub="Staff Strap",
        head="Carmine Mask",
        neck="Enfeebling Torque",
        ear1="Moldavite Earring",
        body="Jhakri Robe",
        hands="Jhakri Cuffs",
        ring1="Aqua Ring",
        ring2="Aqua Ring",
        back="Prism Cape",
        waist="Demonry Sash",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches",
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
        body="Jhakri Robe",
        hands="Jhakri Cuffs",
        ring1="Electrum Ring",
        ring2="Ether Ring",
        back="Prism Cape",
        waist="Duelist's Belt",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches",
    }

    sets.midcast.Cure = {
        main="Iridal Staff",
        sub="Staff Strap",
        head="Jhakri Coronal",
        neck="Holy Phial",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Jhakri Robe",
        hands="Jhakri Cuffs",
        ring1="Aqua Ring",
        ring2="Aqua Ring",
        back="Prism Cape",
        waist="Demonry Sash",
        legs="Jhakri Slops",
        feet="Jhakri Pigaches",
    }

end
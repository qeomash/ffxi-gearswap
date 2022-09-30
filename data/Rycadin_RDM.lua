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
        hands="Sly Gauntlets",
        ring1="Electrum Ring",
        ring2="Ether Ring",
        back="Red Cape +1",
        waist="Friar's Rope",
        legs="Warlock's Tights",
        feet="Warlock's Boots",
    }

    sets.idle = {
        head="Duelist's Chapeau",
        neck="Holy Phial",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Duelist's Tabard",
        hands="Sly Gauntlets",
        ring1="Electrum Ring",
        ring2="Ether Ring",
        back="Red Cape +1",
        waist="Friar's Rope",
        legs="Warlock's Tights",
        feet="Warlock's Boots",
    }

    sets.midcast['Elemental Magic'] = {
        head="Warlock's Chapeau",
        neck="Elemental Torque",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Warlock's Tabard",
        hands="Sly Gauntlets",
        ring1="Snow Ring",
        ring2="Snow Ring",
        back="Prism Cape",
        waist="Shaman's Belt",
        legs="Mahatma Slops",
        feet="Warlock's Boots",
    }

    sets.midcast['Enhancing Magic'] = {
        head="Warlock's Chapeau",
        neck="Holy Phial",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Warlock's Tabard",
        hands="Sly Gauntlets",
        ring1="Electrum Ring",
        ring2="Ether Ring",
        back="Red Cape +1",
        waist="Friar's Rope",
        legs="Warlock's Tights",
        feet="Warlock's Boots",
    }

    sets.Enfeebling = {}
    sets.Enfeebling.Int = {
        head="Carmine Mask",
        neck="Enfeebling Torque",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Warlock's Tabard",
        hands="Sly Gauntlets",
        ring1="Snow Ring",
        ring2="Snow Ring",
        back="Prism Cape",
        waist="Shaman's Belt",
        legs="Mahatma Slops",
        feet="Warlock's Boots",
    }
    sets.Enfeebling.Mnd = {
        head="Carmine Mask",
        neck="Enfeebling Torque",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Warlock's Tabard",
        hands="Sly Gauntlets",
        ring1="Aqua Ring",
        ring2="Aqua Ring",
        back="Prism Cape",
        waist="Friar's Rope",
        legs="Mahatma Slops",
        feet="Warlock's Boots",
    }
    sets.midcast['Enfeebling Magic'] = sets.Enfeebling.Int
    sets.midcast['Dia III'] = sets.Enfeebling.Mnd
    sets.midcast['Silence'] = sets.Enfeebling.Mnd
    sets.midcast['Sleep'] = sets.Enfeebling.Int
    sets.midcast['Sleep II'] = sets.Enfeebling.Int
    sets.midcast['Sleepga'] = sets.Enfeebling.Int
    sets.midcast['Dispel'] = sets.Enfeebling.Int

    sets.resting = {
        head="Warlock's Chapeau",
        neck="Holy Phial",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Warlock's Tabard",
        hands="Sly Gauntlets",
        ring1="Electrum Ring",
        ring2="Ether Ring",
        back="Prism Cape",
        waist="Friar's Rope",
        legs="Mahatma Slops",
        feet="Warlock's Boots",
    }

    sets.midcast.Cure = {
        head="Warlock's Chapeau",
        neck="Holy Phial",
        ear1="Moldavite Earring",
        ear2="Morion Earring",
        body="Warlock's Tabard",
        hands="Sly Gauntlets",
        ring1="Aqua Ring",
        ring2="Aqua Ring",
        back="Prism Cape",
        waist="Friar's Rope",
        legs="Mahatma Slops",
        feet="Warlock's Boots",
    }

end
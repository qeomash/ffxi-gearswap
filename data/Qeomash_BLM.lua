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

    sets.midcast['Elemental Magic'] = {
        ammo="Pantom Tathlum",
        head="Sorcerer's Petasos",
        neck="Aesir Torque",
        ear1="Moldavite Earring",
        -- ear2="Hecate's Earring", it's 90
        body="Igqira Weskit",
        hands="Goliard Cuffs",
        ring1="Snow Ring",
        ring2="Snow Ring",
        back="Prism Cape",
        waist="Anrin Obi", -- TODO: this sucks
        legs="Teal Slops",
        feet="Goliard Clogs"
    }
    -- sets.midcast.Elemental = {
    --     neck="Elemental Torque",
    --     ear1="Moldavite Earring",
    --     body="Yigit Gomlek",
    -- }

    sets.midcast['Enfeebling Magic'] = {
        neck="Enfeebling Torque",
        ear1="Moldavite Earring",
        ear2="Magnetic Earring",
    }

    sets.midcast.Aspir = {
        ring1="Blood Ring",
    }


    sets.resting = {
        main="Pluto's Staff",
        sub="Staff Strap",
        body="Errant Houppelande",

    }

    sets.idle = {
        main="Terra's Staff",
        sub="Staff Strap",
        -- head="Duelist's Chapeau +1",
        -- neck="Orochi Nodowa",
        lear="Moonshade Earring",
        rear="Magnetic Earring",
        body="Dalmatica",
        legs=""
    }

    sets.precast.FC = {
        head="Warlock's Chapeau +1",
        --head="Wayfarer Circlet",
        lear="Loquacious Earring",
        body="Duelist's Tabard",
        hands="Brego Gloves",
        legs="Wayfarer Slops",
        waist="Paewr Belt",
    }

end


function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 5)
end

function job_midcast(spell, action, spellMap, eventArgs)
    -- Enfeebling Sets, by element
    -- if spell.skill == 'Enfeebling Magic' then
    --     if spell.type == 'WhiteMagic' then
    --         equip(sets.Enfeebling.Mnd.Soft)
    --     else
    --         equip(sets.Enfeebling.Int.Soft)
    --     end
    -- end

    -- Elemental Staves
    if spell.skill == 'Elemental Magic' or spell.skill == 'Enfeebling Magic' or spell.skill == "Dark Magic" then
        equip(sets.ElementalStaves[spell.element])
    end
    
end
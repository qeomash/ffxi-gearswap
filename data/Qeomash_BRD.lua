function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


function init_gear_sets()
    sets.ElementalStaves = {}
    sets.ElementalStaves.Fire = {main="Fire Staff", sub="Staff Strap"}
    sets.ElementalStaves.Earth = {main="Terra's Staff", sub="Staff Strap"}
    sets.ElementalStaves.Water = {main="Water Staff", sub="Staff Strap"}
    sets.ElementalStaves.Wind = {main="Auster's Staff", sub="Staff Strap"}
    sets.ElementalStaves.Ice = {main="Aquilo's Staff", sub="Staff Strap"}
    sets.ElementalStaves.Lightning = {main="Jupiter's Staff", sub="Staff Strap"}
    sets.ElementalStaves.Light = {main="Apollo's Staff", sub="Staff Strap"}
    sets.ElementalStaves.Dark = {main="Pluto's Staff", sub="Staff Strap"}


    sets.idle = {
        head="Nyame Helm",
        neck="Asperity Necklace",
        ear1="Cessance Earring",
        rear="Telos Earring",
        body="Ashera Harness",
        hands="Ayanmo Manopolas +2",
        lring="Chirich Ring +1",
        rring="Chirich Ring +1",
        back="Laic Mantle",
        waist="Windbuffet Belt +1", --TA+2%,QA+2%
        legs="Ayanmo Cosciales +2",
        feet="Ayanmo Gambieras +2",
    }
    sets.meleeWeapons = {
        main="Joyeuse",
        sub="Ammurapi Shield",
    }
    sets.engaged = {
        head="Nyame Helm",
        neck="Asperity Necklace",
        ear1="Cessance Earring",
        rear="Telos Earring",
        body="Ashera Harness",
        hands="Ayanmo Manopolas +2",
        lring="Chirich Ring +1",
        rring="Chirich Ring +1",
        back="Laic Mantle",
        waist="Windbuffet Belt +1", --TA+2%,QA+2%
        legs="Ayanmo Cosciales +2",
        feet="Ayanmo Gambieras +2",
    }
    sets.precast.WS = {
        head="Nyame Helm",
        neck="Asperity Necklace",
        ear1="Cessance Earring",
        rear="Telos Earring",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        lring="Chirich Ring +1",
        rring="Chirich Ring +1",
        back="Laic Mantle",
        waist="Windbuffet Belt +1", --TA+2%,QA+2%
        legs="Nyame Flanchard",
        feet="Nymae Sollerets",
    }

    sets.precast.FC = {
        --head="Wayfarer Circlet",
        lear="Loquacious Earring",
        hands="Brego Gloves",
        legs="Wayfarer Slops",
        waist="Swift Belt",
        back="Swith Cape",
        ring1="Minstrel's Ring"
    }

    sets.midcast.Buff = {
        head="Walahra Turban",
        neck="Wind Torque",
        ear1="Loquacious Earring",
        ear2="Musical Earring",
        body="Yigit Gomlek",
        hands="Dusk Gloves",
        ring1="Nereid Ring",
        ring2="Nereid Ring",
        back="Astute Cape",
        waist="Swift Belt",
        legs="Mahatma Slops",
        feet="Dusk Ledelsens",
    }
    -- sets.midcast.GBuff = {range="Gjallarhorn",ammo=empty} LOL will never happen
    sets.midcast.GBuff = {}

    sets.midcast.Debuff = {
        head="Bard's Roundlet +1",
        neck="Wind Torque",
        ear1="Melody Earring +1",
        ear2="Musical Earring",
        body="Errant houppelande",
        hands="Choral Cuffs +1",
        ring1="Nereid Ring",
        ring2="Nereid Ring",
        back="Astute Cape",
        waist="Corsette +1",
        legs="Mahatma Slops",
        feet="Goliard Clogs",
    }
    sets.midcast.Base = sets.midcast.Buff

    -- Spell specific
    -- Just get a Linos (augmented up to +4)
    sets.midcast.Elegy = {range="Horn +1"}
    sets.midcast.Madrigal = {range="Traversiere +1"}
    sets.midcast.March = {range="Faerie Piccolo"}
    sets.midcast.Lullaby = {range="Mary's Horn"}
    sets.midcast.Threnody = {range="Piccolo +1"}
    sets.midcast.Minuet = {range="Cornette +1"}


end

function user_setup()
    enable('main','sub','ranged', 'ammo')
    select_default_macro_book()
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 3)
end

function midcast(spell)
    if spell.type == 'BardSong' then
        equip_song_gear(spell)
    elseif string.find(spell.english,'Waltz') and spell.english ~= 'Healing Waltz' then
        equip(sets.midcast.Base,sets.midcast.Waltz)
    elseif sets.midcast[spell.english] then
        equip(sets.midcast.Base,sets.midcast[spell.english])
    elseif string.find(spell.english,'Cur') then
        equip(sets.midcast.Base,sets.midcast.Cure)
    elseif spell.prefix == '/weaponskill' and sets.precast.WS[spell.name] then
        equip(sets.precast.WS[spell.name])
    else
        equip(sets.midcast.Base)
    end

    if sets.precast.JA[spell.english] then equip(sets.precast.JA[spell.english]) end
end


function equip_song_gear(spell)
    if DaurdSongs:contains(spell.english) then
        equip(sets.midcast.Base,sets.midcast.DBuff)
    else
        if spell.target.type == 'MONSTER' then
            equip(sets.midcast.Base,sets.midcast.Debuff,sets.midcast.GBuff)
            -- if buffactive.troubadour or buffactive['elemental seal'] then
            --     equip(sets.midcast.Duration,{range="Marsyas",ammo="empty"})
            -- end
            if string.find(spell.english,'Lullaby') then equip(sets.midcast.Duration,sets.midcast.Lullaby)
            elseif string.find(spell.english,'Elegy') then equip(sets.midcast.Elegy)
            elseif string.find(spell.english,'Threnody') then equip(sets.midcast.Threnody)
            end
        else
            equip(sets.midcast.Base,sets.midcast.Buff,sets.midcast.GBuff)
            if spell.english == 'Honor March' then equip(sets.midcast['Honor March'])
            elseif string.find(spell.english,'Ballad') then equip(sets.midcast.Ballad)
            elseif string.find(spell.english,'Scherzo') then equip(sets.midcast.Scherzo)
            elseif string.find(spell.english,'Paeon') then equip(sets.midcast.Paeon)
            elseif string.find(spell.english,'Prelude') then equip(sets.midcast.Prelude)
            elseif string.find(spell.english,'Madrigal') then equip(sets.midcast.Madrigal)

            end
        end
    end
end


is_meleeing = false
-- the example: https://github.com/Tunaliz/Liz_Gearswaps/blob/master/RDM_Lib.lua
function job_self_command(command)
    -- $ gs c [command]
    -- Super Smash RDM MELEE
    if command[1] == 'melee' then
        -- explicit on/off switches:
        if command[2] == 'on' then
            enable_angrybard()
        elseif command[2] == 'off' then
            disable_angrybard()
        -- No arg, so toggle
        else
            if is_meleeing == false then
                enable_angrybard()
            elseif is_meleeing == true then
                disable_angrybard()
            end
        end
    end
end

function enable_angrybard()
    is_meleeing = true
    equip(sets.meleeWeapons)
    disable('main','sub','ranged', 'ammo')
    windower.add_to_chat(64,'Angyr Bard: ON')
end

function disable_angrybard()
    is_meleeing = false
    enable('main','sub','ranged', 'ammo')
    windower.add_to_chat(64,'Angry Bard: OFF')
end

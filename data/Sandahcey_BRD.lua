function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function job_setup()
    state.SongMode = M{['description'] = 'Song Mode'}
end

function binds_on_load()
    send_command('bind f9 gs c cycle CastingMode')
    send_command('bind != input /ma "Chocobo Mazurka" <me>')
end

function binds_on_unload()
    -- send_command('unbind ^`')
    send_command('unbind f9')
    send_command('unbind !=')
end

function user_setup()
    enable_all_slots()
    select_default_macro_book()
    state.CastingMode:options('Normal', 'AdditionalSongs')
    state.IdleMode:options('Normal', 'DT', 'Refresh')
end


function init_gear_sets()

    sets.idle = {
        head="Ayanmo Zucchetto +2",
        -- neck="Asperity Necklace",
        -- ear1="Cessance Earring",
        -- rear="Telos Earring",
        body="Ayanmo Corazza +2", --DT-4%
        hands="Ayanmo Manopolas +1",
        rear="Odnowa Earring", --MDT-1%
        lring="Ayanmo Ring",
        rring="Inyanga Ring",
        back="Mecistopins Mantle",
        legs="Ayanmo Cosciales +2",
        -- feet="Ayanmo Gambieras +1",
        feet="Fili Cothurnes +1", -- Move+18%
    }
    sets.naegling = {
        main="Naegling",
        -- sub="Ammurapi Shield",
    }
    sets.daggers = {
        main="Izhiikoh",
    }

    sets.engaged = {
        head="Ayanmo Zucchetto +2",
        -- neck="Anu Torque",
        lear="Brutal Earring",
        -- ear1="Cessance Earring",
        -- rear="Telos Earring",
        body="Ayanmo Corazza +2",
        hands="Ayanmo Manopolas +1",
        waist="Windbuffet Belt +1", --TA+2%,QA+2%
        legs="Ayanmo Cosciales +2",
        feet="Ayanmo Gambieras +1",
    }
    sets.precast.WS = {
    --     head="Nyame Helm",
    --     neck="Asperity Necklace",
    --     ear1="Cessance Earring",
    --     rear="Telos Earring",
    --     body="Nyame Mail",
    --     hands="Nyame Gauntlets",
    --     lring="Chirich Ring +1",
    --     rring="Chirich Ring +1",
    --     back="Laic Mantle",
    --     waist="Windbuffet Belt +1", --TA+2%,QA+2%
    --     legs="Nyame Flanchard",
    --     feet="Nymae Sollerets",
    }

    sets.precast.FC = {
        --head="Wayfarer Circlet",
        body="Inyanga Jubbah +2", -- FC+14%
        lear="Loquacious Earring",
        legs="Ayanmo Cosciales +2",
        ring1="Minstrel's Ring"
    }
    sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
        ranged="Linos",
        head="Fili Calot +1", --Song-13%
        }
    )
    sets.precast.FC.BardSong.AdditionalSongs = set_combine(sets.precast.FC.BardSong, {
        ranged="Terpander",
    })
    sets.midcast.BardSong = {
        main="Kali",
        ranged="Linos", --Songs+2
        head="Fili Calot +1",
        neck="Moonbow Whistle",
        body="Fili Hongreline +1",
        hands="Fili Manchettes +1",
        legs="Inyanga Shalwar +2",
        feet="Brioso Slippers +2",
    }
    sets.midcast.BardSong.AdditionalSongs = {
        ranged="Terpander", -- Three Songs
    }
    -- sets.midcast.GBuff = {range="Gjallarhorn",ammo=empty} LOL will never happen
    sets.midcast.GBuff = {}

    sets.midcast.Debuff = {
        -- head="Bard's Roundlet +1",
        -- neck="Wind Torque",
        -- ear1="Melody Earring +1",
        -- ear2="Musical Earring",
        -- body="Errant houppelande",
        -- hands="Choral Cuffs +1",
        -- ring1="Nereid Ring",
        -- ring2="Nereid Ring",
        -- back="Astute Cape",
        -- waist="Corsette +1",
        -- legs="Mahatma Slops",
        -- feet="Goliard Clogs",
    }
    sets.midcast.Base = sets.midcast.Buff

    -- Spell specific
    -- Just get a Linos (augmented up to +4)
    -- sets.midcast.Elegy = {range="Horn +1"}
    -- sets.midcast.Madrigal = {range="Traversiere +1"}
    -- sets.midcast.March = {range="Faerie Piccolo"}
    -- sets.midcast.Lullaby = {range="Mary's Horn"}
    -- sets.midcast.Threnody = {range="Piccolo +1"}
    -- sets.midcast.Minuet = {range="Cornette +1"}


end

-- function user_setup()
--     enable('main','sub','ranged', 'ammo')
--     select_default_macro_book()
-- end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 2)
end

function midcast_huh(spell)
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
    debug_log("entering equip_song_gear")
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
    windower.add_to_chat(64,'Angry Bard: ON')
end

function disable_angrybard()
    is_meleeing = false
    enable('main','sub','ranged', 'ammo')
    windower.add_to_chat(64,'Angry Bard: OFF')
end

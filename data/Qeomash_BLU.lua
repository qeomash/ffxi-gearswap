function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function user_setup()
    enable_all_slots()
    select_default_macro_book()
    send_command('wait 2;input /lockstyleset 21')
    windower.add_to_chat(64,'* aset setlist')
    windower.add_to_chat(64,'* aset spellset <setname>')
end

function job_setup()
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false

    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false
    state.SkillMode = M{['description']='Skill Mode', 'Normal', 'On'}

    include('Mote-TreasureHunter')
    state.TreasureMode:set('None')

    state.HasteMode = M{['description']='Haste Mode', 'Normal', 'Hi', 'Trust'}

    blue_magic_maps = {}

    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.
    -- Physical Spells --

    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave', 'Quadratic Continuum'
    }

    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'
    }

    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash',
        'Sweeping Gouge'
    }

    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
        'Pinecone Bomb','Spiral Spin','Wild Oats'
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb', 'Tenebral Crush', 'Spectral Floe',
        'Molting Plumage', 'Searing Tempest'
    }

    blue_magic_maps.MagicalLight = S{
        'Blinding Fulgor'
    }
    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast','Scouring Spate'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse', 'Entomb'
    }

    blue_magic_maps.MagicalAgi = S{
        'Silent Storm'
    }

    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades','Anvil Lightning'
    }

    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'
    }

    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Stun spells
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
        'Thunderbolt','Whirl of Rage'
    }

    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
        'Wild Carrot'
    }

    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body','Plasma Charge',
        'Pyric Bulwark','Reactor Cool','Nat. Meditation'
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'
    }


    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
        'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Polar Roar',
        'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot'
    }
    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

function init_gear_sets()

    sets.mainweapons = {
        main="Naegling",
        sub="Thibron",
        ammo="Coiste Bodhar",
    }
    sets.learningweapons = {
        main="Excalipoor II",
        sub="Wax Sword",
        hands="Magus Bazubands",
    }
    sets.castingweapons = {
        main="Bunzi's Rod", --MAB+35
        sub="Maxentius", -- MAB+21
        ammo="Ghastly Tathlum +1"
    }
    sets.cleavingweapons = sets.castingweapons
    sets.TH = {
        ammo="Perfect Lucky Egg", -- +1
        head="Volte Cap", -- +1
        waist="Chaac Belt", --TH+1
    }
    sets.precast.JA['Provoke'] = sets.TH
    sets.stdidle = {
        head="Gleti's Mask",
        neck="Loricate Torque +1", --DT-6%
        lear="Odnowa Earring +1",
        body="Hashishin Mintan +3", --refresh+3
        hands="Gleti's Gauntlets",
        waist="Flume Belt",
        legs="Carmine Cuisses +1", --Movement+18%
        feet="Gleti's Boots",
    }
    sets.cleavingidle = {
        head="Malignance Chapeau", --DT-
        neck="Loricate Torque +1", --DT-6%
        lear="Odnowa Earring +1",
        body="Hashishin Mintan +3", --refresh+3,DT-12%
        hands="Nyame Gauntlets", --DT-7%
        rring="Shadow Ring",
        waist="Flume Belt",
        legs="Malignance Tights", --DT-7%
        feet="Malignance Boots",
    }

    -- sets.idle = sets.stdidle
    if player.sub_job == 'RDM' or player.sub_job == 'BLM' then
        sets.idle = sets.cleavingidle
    else
        sets.idle = sets.stdidle
    end

    Rosmertas = {}
    Rosmertas.DA = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
    Rosmertas.WSD = { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    sets.engaged = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        -- neck="Asperity Necklace",
        neck="Mirage Stole +2",
        lear="Telos Earring",
        rear="Suppanomimi",
        body="Malignance Tabard",
        hands="Ayanmo Manopolas +2", --Acc+43,Haste+4%
        lring="Petrov Ring",
        rring="Epona's Ring",
        back=Rosmertas.DA,
        -- waist="Windbuffet Belt +1",
        waist="Reiki Yotai",
        legs="Malignance Tights",
        feet="Carmine Greaves +1", --haste+4%,STR+14,DA+4%
    }

    sets.baseWS = {
        ammo="Aurgelmir Orb",
        head="Hashishin Kavuk +3", --WSD+12%
        neck="Republican Platinum Medal",
        lear="Telos Earring",
        rear="Moonshade Earring", -- TPBonus+250
        body="Assimilator's Jubbah +3", --STR+39WSD+10%
        hands="Jhakri Cuffs +2", --STR+18,Attack+43,WS+7%
        lring="Pyrosoul Ring",
        rring="Ilabrat Ring",
        back=Rosmertas.WSD,
        waist="Sailfi Belt +1", --TA+2%, needs to be augmented
        legs="Luhlaza Shalwar +3", -- WSD+10%
        feet="Jhakri Pigaches +2", -- STR+22
    }
    sets.baseWS.Str = set_combine(sets.baseWS, {
        lring="Pyrosoul Ring",
    })
    sets.baseWS.Accuracy = set_combine(sets.baseWS, {})
    sets.precast.WS = sets.baseWS.Str

    sets.precast.WS['Savage Blade'] = {
        ammo="Aurgelmir Orb",
        head="Hashishin Kavuk +3", --WSD+12%
        neck="Republican Platinum Medal",
        lear="Ishvara Earring",
        rear="Moonshade Earring", -- TPBonus+250
        body="Assimilator's Jubbah +3", --STR+39WSD+10%
        hands="Jhakri Cuffs +2", --STR+18,Attack+43,WS+7%
        lring="Pyrosoul Ring",
        rring="Ilabrat Ring",
        back=Rosmertas.WSD,
        waist="Sailfi Belt +1",
        legs="Luhlaza Shalwar +3", -- WSD+10%
        feet="Jhakri Pigaches +2", -- STR+22
    }

    sets.buff["Chain Affinity"] = {
        feet="Assimilator's Charuqs +2",
    }
    sets.buff["Burst Affinity"] = {
        feet="Assimilator's Shalwar +2",
    }

    -- Spellcasting
    sets.precast.FC = {
        head="Carmine Mask", -- 9%
        -- body="Ebur Talar", --5%
        lear="Loquacious Earring",
        back="Swith Cape",
        legs="Ayanmo Cosciales +2",
        lring="Weatherspoon Ring",
        feet="Carmine Greaves +1", --FC+8%
    }

    sets.midcast['Blue Magic'] = {
        back="Cornflower Cape",
    }

    sets.midcast['Blue Magic'].Physical = {
        head="Gleti's Mask",
        neck="Asperity Necklace",
        lear="Telos Earring",
        rear="Hashishin Earring +1", --BLU+11
        body="Gleti's Cuirass", --STR+39
        hands="Gleti's Gauntlets",
        lring="Pyrosoul Ring", -- STR+7
        rring="Pyrosoul Ring", -- STR+7
        back="Cornflower Cape", --STR+5
        waist="Dynamic Belt +1", --STR+4
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
    }
    sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalStr  = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalDex  = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalVit  = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalAgi  = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})


    sets.midcast['Blue Magic'].Magical = {
        ammo="Ghastly Tathlum +1",
        head="Hashishin Kavuk +3", -- MAB+51
        neck="Sibyl Scarf", --MAB+10
        lear="Friomisi Earring", -- MAB+10
        rear="Regal Earring", --MAB+7
        body="Hashishin Mintan +3", -- MAB+49
        hands="Hashishin Bazubands +3", -- MAB+40
        lring="Weatherspoon Ring", -- MAB+10
        rring="Acumen Ring", -- MAB+4
        back="Cornflower Cape", --MAB+15,BLU+5
        waist="Aswang Sash", -- lol ass-wang
        legs="Hashishin Tayt +2", -- MAB+48
        feet="Hashishin Basmak +2", -- MAB+50
    }
    sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalLight = set_combine(sets.midcast['Blue Magic'].Magical, {
        ring1="Weatherspoon Ring"
    })
    sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalAgi = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})
    sets.midcast['Blue Magic'].MagicAccuracy = set_combine(sets.midcast['Blue Magic'].Magical, {
        head="assimilator's Keffiyeh +3",
    })

end


function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Add enhancement gear for Chain Affinity, etc.
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
        if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end

    -- If in learning mode, keep on gear intended to help with that, regardless of action.
    if state.OffenseMode.value == 'Learning' then
        equip(sets.Learning)
    end
end


function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 6)
end
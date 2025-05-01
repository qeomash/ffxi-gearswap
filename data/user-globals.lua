function global_on_load()
	debug_log('user global on load was run', 64)
	-- send_command('bind f9 gs c cycle WeaponSet')
	-- send_command('bind ^f9 gs c cycle HybridMode')
	-- send_command('bind !f9 gs c cycle RangedMode')
	-- send_command('bind @f9 gs c cycle WeaponskillMode')
	-- send_command('bind f10 gs c set DefenseMode Physical')
	-- send_command('bind ^f10 gs c cycle PhysicalDefenseMode')
	-- send_command('bind !f10 gs c toggle Kiting')
	-- send_command('bind f11 gs c set DefenseMode Magical')
	-- send_command('bind ^f11 gs c cycle CastingMode')
	-- send_command('bind f12 gs c update user')
	-- send_command('bind ^f12 gs c cycle IdleMode')
	-- send_command('bind !f12 gs c reset DefenseMode')

	-- send_command('bind ^- gs c toggle selectnpctargets')
	-- send_command('bind ^= gs c cycle pctargetmode')

end

function global_on_unload()
    -- send_command('unbind f9')
end

function debug_log(message, color)
	if _settings.debug_mode then
		if not color then
			windower.add_to_chat(123, "[qeo-debug] "..message)
		else
			windower.add_to_chat(color, "[qeo-debug] "..message)
		end
	end
end

function user_customize_idle_set(idleSet)
	debug_log("enter user_customize_idle_set")
	-- if state.OffenseMode.current == 'Attack' then
	-- 	windower.add_to_chat(64,"weapon should stop")
	-- 	idleSet['main'] = nil
	-- 	idleSet['sub'] = nil
	-- 	idleSet['range'] = nil
	-- end
	return idleSet
end


function user_customize_melee_set(meleeSet)
	-- windower.add_to_chat(64,'in user custom idle')
	return meleeSet
end


function enable_all_slots()
	enable('main','sub','range','ammo','head','neck','lear','rear','body','hands','lring','rring','back','waist','legs','feet')
end
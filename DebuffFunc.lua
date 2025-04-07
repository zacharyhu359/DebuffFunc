
local DBT_Timers ={}

function DBT_SpellCastTimer(spellName, DotTime )
	if DBT_Timers[spellName] == nil then DBT_Timers[spellName] = GetTime() end;
	if SpellReady(spellName) and not buffed(spellName,"target") then DBT_Timers[spellName] = GetTime() end;
	if DBT_Timers[spellName] - GetTime() <= 0 and SpellReady(spellName) then CastSpellByName(spellName) DBT_Timers[spellName] = (DotTime + GetTime()) return true end;
	return false;
end

function DBT_SpellCastTimerIgnoreResist(spellName, DotTime )
	if DBT_Timers[spellName] == nil then DBT_Timers[spellName] = GetTime() end;
	if SpellReady(spellName) then DBT_Timers[spellName] = GetTime() end;
	if IsShiftKeyDown() then DBT_ResetTimers() return false end;
	if DBT_Timers[spellName] - GetTime() <= 0 and SpellReady(spellName) then CastSpellByName(spellName) DBT_Timers[spellName] = (DotTime + GetTime()) return true end;
	return false;
end

function DBT_ResetTimers()
	DBT_Timers ={}
end

function DBT_ResetTimer(spellName)
		if (not (DBT_Timers[spellName] == nil)) then DBT_Timers[spellName] = GetTime() end;
end

function DBT_ReduceDotTime(spellName, timeToReduce)
	if (not (DBT_Timers[spellName] == nil)) then DBT_Timers[spellName] = (DBT_Timers[spellName] - timeToReduce) end;
end

function DBT_SetTimerTime(spellName, DotTime)
	 DBT_Timers[spellName] = (DotTime + GetTime())
end

function DBT_GetRemainingTime(spellName)
    if(not (DBT_Timers[spellName] == nil)) then return (DBT_Timers[spellName] - GetTime()) else return 0 end;
end

function  DBT_GetElapsedTime(spellName)
	if (not (DBT_Timers[spellName] == nil)) then return (GetTime() - DBT_Timers[spellName]) end;
	return -1;
end





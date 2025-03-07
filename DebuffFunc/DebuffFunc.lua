
local DBT_Timers ={}

function DBT_SpellCastTimer(spellName, DotTime )
	if DBT_Timers[spellName] == nil then DBT_Timers[spellName] = GetTime() end;
	if SpellReady(spellName) and not buffed(spellName,"target") then DBT_Timers[spellName] = GetTime() end;
	if IsShiftKeyDown() then DBT_ResetTimers() return false end;
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

function DBT_ReduceDotTime(spellName, timeToReduce)
	if not DBT_Timers[spellName] == nil then DBT_Timers[spellName] = (DBT_Timers[spellName] - timeToReduce) end;
end

function DBT_GetTimerTime(spellName)
	return DBT_Timers[spellName];
end




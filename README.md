Quick Guide to DBT Functions

DBT_SpellCastTimer(spellName, DotTime)
- **Purpose**: Manages casting and timing of a spell.
- **How it works**:
  1. **Initialize Timer**: If the spell isn't tracked, start tracking with the current time.
  2. **Update Timer**: Reset the timer if the spell is ready and not on the target.
  3. **Shift Key Reset**: Resets all timers if the Shift key is held down.
  4. **Cast Spell**: If the spell's cooldown is ready, cast it and update its timer.
  5. **Return Values**:
     - `true`: Spell was successfully cast.
     - `false`: Spell wasn't cast.

DBT_ResetTimers()
- **Purpose**: Clears all spell timers.
- **How it works**:
  - Resets the `DBT_Timers` table, removing all stored timer data.

DBT_ReduceDotTime(spellName, timeToReduce)
- **Purpose**: Reduce the time for a specific debuff.

### Example

1. DBT_SpellCastTimer("Moonfire", 18) -- Tracks and casts Fireball every 18 seconds.
2. DBT_ResetTimers() -- Clears all spell tracking, use this when multiple player using the same debuff on the target and you want to switch target.

### How to use
- Below marco will first try to cast Moonfire, on success cast it will start the moonfire timer then stop running the remaining scripts. on the second press, because the moonfire is successfully casted, it won't stop there and try to cast the insect swarm;

/script if DBT_SpellCastTimer("Moonfire", 18) then return end;

/script if DBT_SpellCastTimer("Insect Swarm", 18) then return end;

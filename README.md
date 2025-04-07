# DBT Spell Cast Timer

A lightweight Lua utility for managing spell timers, ideal for automating DoT re-casts and other periodic spell logic in WoW Classic macros or addons.

---

## 🔧 Features

- Tracks per-spell cast timers.
- Automatically re-casts when timers expire.
- Handles cooldowns, active buffs/debuffs, and custom logic.
- Optional resist-ignore casting.
- Manual timer control functions included.

---

## 📦 API Functions

### `DBT_SpellCastTimer(spellName, DotTime)`
Casts the spell if:
- The spell is off cooldown,
- It's not currently applied on the target,
- Its internal timer has expired.

**Ignores resists** (re-casts if resisted are up to you).

---

### `DBT_SpellCastTimerIgnoreResist(spellName, DotTime)`
Same as above but:
- **Skips debuff check** on the target.
- **Holding Shift** resets all timers (useful for emergency resets).

---

### `DBT_ResetTimers()`
Clears all timers.

---

### `DBT_ResetTimer(spellName)`
Resets the timer for a specific spell only.

---

### `DBT_ReduceDotTime(spellName, timeToReduce)`
Reduces the remaining timer by a custom amount.

---

### `DBT_SetTimerTime(spellName, DotTime)`
Sets the timer manually (e.g., to sync with external triggers).

---

### `DBT_GetRemainingTime(spellName)`
Returns how many seconds remain until the spell can be re-cast.  
Returns `0` if timer is not set.

---

### `DBT_GetElapsedTime(spellName)`
Returns how many seconds have passed since the spell was last cast.  
Returns `-1` if the timer hasn't been set.

---

## 🧠 Usage Notes

- `DotTime` should be the duration (in seconds) of the effect (e.g., `12` for Corruption).
- Ideal for use in conditional macros or custom automation systems.
- Depends on helper functions: `SpellReady()` and `buffed()` — you need to define these separately or get
-  [SuperMarco]https://github.com/qs-crocodyle/SuperMacro-turtle
- [RoidMarco] https://github.com/MarcelineVQ/Roid-Macros

---

## 🛠️ Example

-- Cast Corruption if it's ready and not active on the target
DBT_SpellCastTimer("Corruption", 12)


### Example

1. DBT_SpellCastTimer("Moonfire", 18) -- Tracks and casts moonfire every 18 seconds.
2. DBT_ResetTimers() -- Clears all spell tracking, use this when multiple player using the same debuff on the target and you want to switch target.

### How to use
- Below marco will first try to cast Moonfire, on success cast it will start the moonfire timer then stop running the remaining scripts. on the second press, because the moonfire is successfully casted, it won't stop there and try to cast the insect swarm;

/script if DBT_SpellCastTimer("Moonfire", 18) then return end;

/script if DBT_SpellCastTimer("Insect Swarm", 18) then return end;

// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm.gsc;
#include scripts/zm_common/zm_weapons.gsc;
#include scripts/zm_common/zm_trial_util.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace zm_trial_close_quarters;

// Namespace zm_trial_close_quarters/zm_trial_close_quarters
// Params 0, eflags: 0x2
// Checksum 0x7ddf020f, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_close_quarters", &__init__, undefined, undefined);
}

// Namespace zm_trial_close_quarters/zm_trial_close_quarters
// Params 0, eflags: 0x1 linked
// Checksum 0x3aeecaf, Offset: 0xe0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"close_quarters", &on_begin, &on_end);
}

// Namespace zm_trial_close_quarters/zm_trial_close_quarters
// Params 0, eflags: 0x5 linked
// Checksum 0x8b7d35ce, Offset: 0x148
// Size: 0x24
function private on_begin() {
    zm::register_actor_damage_callback(&range_check);
}

// Namespace zm_trial_close_quarters/zm_trial_close_quarters
// Params 1, eflags: 0x5 linked
// Checksum 0x2b527a4c, Offset: 0x178
// Size: 0x64
function private on_end(round_reset) {
    if (isinarray(level.actor_damage_callbacks, &range_check)) {
        arrayremovevalue(level.actor_damage_callbacks, &range_check, 0);
    }
}

// Namespace zm_trial_close_quarters/zm_trial_close_quarters
// Params 0, eflags: 0x0
// Checksum 0xefa99908, Offset: 0x1e8
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"close_quarters");
    return isdefined(challenge);
}

// Namespace zm_trial_close_quarters/zm_trial_close_quarters
// Params c, eflags: 0x5 linked
// Checksum 0xc61b8f08, Offset: 0x228
// Size: 0x11a
function private range_check(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (!isplayer(attacker) && !isplayer(inflictor)) {
        return -1;
    }
    if (isdefined(self.aat_turned) && self.aat_turned) {
        return damage;
    }
    if (isdefined(attacker.origin) && isdefined(self.origin) && distance2dsquared(attacker.origin, self.origin) <= 122500) {
        return damage;
    }
    return 0;
}

// Namespace zm_trial_close_quarters/zm_trial_close_quarters
// Params 1, eflags: 0x0
// Checksum 0x17d280bf, Offset: 0x350
// Size: 0x62
function function_23d15bf3(var_f85889ce) {
    if (isplayer(var_f85889ce) && distance2dsquared(var_f85889ce.origin, self.origin) <= 122500) {
        return 1;
    }
    return 0;
}


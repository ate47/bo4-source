#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_trial;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;

#namespace namespace_fcd611c3;

// Namespace namespace_fcd611c3/namespace_fcd611c3
// Params 0, eflags: 0x2
// Checksum 0xe11f5afb, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_281322718ac3cd88", &__init__, undefined, undefined);
}

// Namespace namespace_fcd611c3/namespace_fcd611c3
// Params 0, eflags: 0x0
// Checksum 0xc6f92f2f, Offset: 0xf8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_64d77357e69aee75", &on_begin, &on_end);
}

// Namespace namespace_fcd611c3/namespace_fcd611c3
// Params 2, eflags: 0x4
// Checksum 0x8a779047, Offset: 0x160
// Size: 0x42
function private on_begin(localclientnum, a_params) {
    level.var_e91491fb = isdefined(a_params[0]) ? a_params[0] : "movement";
}

// Namespace namespace_fcd611c3/namespace_fcd611c3
// Params 1, eflags: 0x4
// Checksum 0xfa366148, Offset: 0x1b0
// Size: 0x16
function private on_end(round_reset) {
    level.var_e91491fb = undefined;
}

// Namespace namespace_fcd611c3/namespace_fcd611c3
// Params 0, eflags: 0x0
// Checksum 0x9040c5fb, Offset: 0x1d0
// Size: 0x32
function is_active() {
    s_challenge = zm_trial::function_a36e8c38(#"hash_64d77357e69aee75");
    return isdefined(s_challenge);
}

// Namespace namespace_fcd611c3/namespace_fcd611c3
// Params 0, eflags: 0x0
// Checksum 0x9dffcc14, Offset: 0x210
// Size: 0x152
function function_26f124d8() {
    if (!isdefined(level.var_e91491fb)) {
        return true;
    }
    switch (level.var_e91491fb) {
    case #"ads":
        if (self isplayerads()) {
            return true;
        }
        return false;
    case #"jump":
        if (self isplayerjumping()) {
            return true;
        }
        return false;
    case #"slide":
        if (self isplayersliding()) {
            return true;
        }
        return false;
    case #"hash_6c6c8f6b349b8751":
        if (self isplayerjumping() || self isplayersliding()) {
            return true;
        }
        return false;
    case #"crouch":
        if (self getstance() === "crouch") {
            return true;
        }
        return false;
    case #"prone":
        if (self getstance() === "prone") {
            return true;
        }
        return false;
    case #"movement":
    default:
        v_velocity = self getvelocity();
        if (length(v_velocity) != 0) {
            return true;
        }
        return false;
    }
}


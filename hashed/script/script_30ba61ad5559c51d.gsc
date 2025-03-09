#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_weapons;

#namespace namespace_11abec5a;

// Namespace namespace_11abec5a/namespace_11abec5a
// Params 0, eflags: 0x2
// Checksum 0xcbf90966, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_53a5a75770adb550", &__init__, undefined, undefined);
}

// Namespace namespace_11abec5a/namespace_11abec5a
// Params 0, eflags: 0x0
// Checksum 0xd7c83d40, Offset: 0x108
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_53a5a75770adb550", &on_begin, &on_end);
}

// Namespace namespace_11abec5a/namespace_11abec5a
// Params 7, eflags: 0x4
// Checksum 0xc3944b8c, Offset: 0x170
// Size: 0x3b8
function private on_begin(var_8a72a00b, var_49d8a02c, var_325ff213, var_dd2fad64, var_873a1b70, var_957937ee, var_9c56c5a9) {
    switch (getplayers().size) {
    case 1:
        level.var_b4a6cec6 = zm_trial::function_5769f26a(var_8a72a00b);
        break;
    case 2:
        level.var_b4a6cec6 = zm_trial::function_5769f26a(var_49d8a02c);
        break;
    case 3:
        level.var_b4a6cec6 = zm_trial::function_5769f26a(var_325ff213);
        break;
    case 4:
        level.var_b4a6cec6 = zm_trial::function_5769f26a(var_dd2fad64);
        break;
    }
    if (isdefined(var_873a1b70)) {
        if (!isdefined(level.var_692c062e)) {
            level.var_692c062e = [];
        } else if (!isarray(level.var_692c062e)) {
            level.var_692c062e = array(level.var_692c062e);
        }
        level.var_692c062e[level.var_692c062e.size] = getweapon(var_873a1b70);
    }
    if (isdefined(var_957937ee)) {
        if (!isdefined(level.var_692c062e)) {
            level.var_692c062e = [];
        } else if (!isarray(level.var_692c062e)) {
            level.var_692c062e = array(level.var_692c062e);
        }
        level.var_692c062e[level.var_692c062e.size] = getweapon(var_957937ee);
    }
    if (isdefined(var_9c56c5a9)) {
        if (!isdefined(level.var_692c062e)) {
            level.var_692c062e = [];
        } else if (!isarray(level.var_692c062e)) {
            level.var_692c062e = array(level.var_692c062e);
        }
        level.var_692c062e[level.var_692c062e.size] = getweapon(var_9c56c5a9);
    }
    callback::on_ai_killed(&on_ai_killed);
    foreach (player in getplayers()) {
        player.var_b4a6cec6 = 0;
        player zm_trial_util::function_c2cd0cba(level.var_b4a6cec6);
        player zm_trial_util::function_2190356a(player.var_b4a6cec6);
    }
}

// Namespace namespace_11abec5a/namespace_11abec5a
// Params 1, eflags: 0x4
// Checksum 0xf0b1fbf7, Offset: 0x530
// Size: 0x1c2
function private on_end(round_reset) {
    callback::remove_on_ai_killed(&on_ai_killed);
    if (!round_reset) {
        var_696c3b4 = [];
        foreach (player in getplayers()) {
            if (player.var_b4a6cec6 < level.var_b4a6cec6) {
                if (!isdefined(var_696c3b4)) {
                    var_696c3b4 = [];
                } else if (!isarray(var_696c3b4)) {
                    var_696c3b4 = array(var_696c3b4);
                }
                var_696c3b4[var_696c3b4.size] = player;
            }
        }
        if (var_696c3b4.size) {
            zm_trial::fail(#"hash_73f632514ab7d15", var_696c3b4);
        }
    }
    foreach (player in getplayers()) {
        player zm_trial_util::function_f3aacffb();
    }
    level.var_b4a6cec6 = undefined;
}

// Namespace namespace_11abec5a/namespace_11abec5a
// Params 1, eflags: 0x4
// Checksum 0xbce16edd, Offset: 0x700
// Size: 0x1bc
function private on_ai_killed(params) {
    w_root = zm_weapons::function_386dacbc(params.weapon);
    b_valid_weapon = 0;
    if (isinarray(level.var_692c062e, w_root)) {
        b_valid_weapon = 1;
    } else if (w_root === getweapon(#"zhield_zpear_dw") && (params.smeansofdeath === "MOD_PROJECTILE" || params.smeansofdeath === "MOD_PROJECTILE_SPLASH")) {
        b_valid_weapon = 1;
    }
    if (isplayer(params.eattacker) && b_valid_weapon) {
        params.eattacker.var_b4a6cec6++;
        if (params.eattacker.var_b4a6cec6 < level.var_b4a6cec6) {
            params.eattacker zm_trial_util::function_c2cd0cba(level.var_b4a6cec6);
            params.eattacker zm_trial_util::function_2190356a(params.eattacker.var_b4a6cec6);
        }
        if (params.eattacker.var_b4a6cec6 == level.var_b4a6cec6) {
            params.eattacker zm_trial_util::function_63060af4(1);
        }
    }
}

// Namespace namespace_11abec5a/namespace_11abec5a
// Params 1, eflags: 0x0
// Checksum 0x1a12c0f4, Offset: 0x8c8
// Size: 0x96
function is_active(var_a75461b4) {
    s_challenge = zm_trial::function_a36e8c38(#"hash_53a5a75770adb550");
    if (isdefined(var_a75461b4)) {
        if (isdefined(s_challenge) && isarray(level.var_692c062e) && isinarray(level.var_692c062e, var_a75461b4)) {
            return true;
        }
        return false;
    }
    return isdefined(s_challenge);
}


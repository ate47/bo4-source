#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_trial;
#using scripts\core_common\system_shared;
#using scripts\core_common\callbacks_shared;

#namespace namespace_aa42e727;

// Namespace namespace_aa42e727/namespace_aa42e727
// Params 0, eflags: 0x2
// Checksum 0xb83fb1ca, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"kills_with_flinger", &__init__, undefined, undefined);
}

// Namespace namespace_aa42e727/namespace_aa42e727
// Params 0, eflags: 0x1 linked
// Checksum 0xb7486b07, Offset: 0xd8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"kills_with_flinger", &on_begin, &on_end);
}

// Namespace namespace_aa42e727/namespace_aa42e727
// Params 4, eflags: 0x5 linked
// Checksum 0xaf9a0f71, Offset: 0x140
// Size: 0x164
function private on_begin(var_8a72a00b, var_49d8a02c, var_325ff213, var_dd2fad64) {
    switch (getplayers().size) {
    case 1:
        level.var_b07feb9b = zm_trial::function_5769f26a(var_8a72a00b);
        break;
    case 2:
        level.var_b07feb9b = zm_trial::function_5769f26a(var_49d8a02c);
        break;
    case 3:
        level.var_b07feb9b = zm_trial::function_5769f26a(var_325ff213);
        break;
    case 4:
        level.var_b07feb9b = zm_trial::function_5769f26a(var_dd2fad64);
        break;
    }
    level.var_61541a89 = 0;
    level thread function_c80f40af();
    level zm_trial_util::function_2976fa44(level.var_b07feb9b);
    level zm_trial_util::function_dace284(level.var_61541a89);
}

// Namespace namespace_aa42e727/namespace_aa42e727
// Params 1, eflags: 0x5 linked
// Checksum 0x39a72f4c, Offset: 0x2b0
// Size: 0xee
function private on_end(round_reset) {
    if (!round_reset) {
        if (level.var_61541a89 < level.var_b07feb9b) {
            zm_trial::fail(#"hash_73f632514ab7d15", getplayers());
        }
    }
    foreach (player in getplayers()) {
        player zm_trial_util::function_f3aacffb();
    }
    level.var_b07feb9b = undefined;
    level.var_61541a89 = undefined;
}

// Namespace namespace_aa42e727/namespace_aa42e727
// Params 0, eflags: 0x5 linked
// Checksum 0xd7b59e9b, Offset: 0x3a8
// Size: 0x100
function private function_c80f40af() {
    level endon(#"hash_7646638df88a3656");
    while (level.var_61541a89 < level.var_b07feb9b) {
        s_result = level waittill(#"hash_1ba786f1661e3817");
        level.var_61541a89 += s_result.var_2ef2374;
        if (level.var_61541a89 < level.var_b07feb9b) {
            level zm_trial_util::function_2976fa44(level.var_b07feb9b);
            level zm_trial_util::function_dace284(level.var_61541a89);
        }
        if (level.var_61541a89 >= level.var_b07feb9b) {
            level zm_trial_util::function_7d32b7d0(1);
        }
    }
}


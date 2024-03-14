// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_e87f6502;

// Namespace namespace_e87f6502/namespace_e87f6502
// Params 0, eflags: 0x2
// Checksum 0xedac1fc7, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_32c6ae5e840ecca3", &__init__, undefined, undefined);
}

// Namespace namespace_e87f6502/namespace_e87f6502
// Params 0, eflags: 0x1 linked
// Checksum 0x73e40380, Offset: 0x118
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_63788b93aa1642c1", &on_begin, &on_end);
}

// Namespace namespace_e87f6502/namespace_e87f6502
// Params 0, eflags: 0x5 linked
// Checksum 0x17b3512c, Offset: 0x180
// Size: 0x90
function private on_begin() {
    level.var_b31000be = 600;
    foreach (e_player in getplayers()) {
        e_player thread function_8bb2443b();
    }
}

// Namespace namespace_e87f6502/namespace_e87f6502
// Params 1, eflags: 0x5 linked
// Checksum 0x5a12a664, Offset: 0x218
// Size: 0x16
function private on_end(round_reset) {
    level.var_b31000be = undefined;
}

// Namespace namespace_e87f6502/namespace_e87f6502
// Params 0, eflags: 0x5 linked
// Checksum 0xc2aa5406, Offset: 0x238
// Size: 0x9e
function private function_8bb2443b() {
    level endon(#"hash_7646638df88a3656");
    self endon(#"death");
    while (true) {
        if (self clientfield::get_to_player("nova_crawler_gas_cloud_postfx_clientfield")) {
            self zm_custom::function_db030433();
            self zm_score::player_reduce_points("take_specified", level.var_b31000be);
        }
        wait(1);
    }
}


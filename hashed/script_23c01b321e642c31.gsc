// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_spawner.gsc;
#include scripts/zm_common/zm_trial_util.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace namespace_d6ef1c07;

// Namespace namespace_d6ef1c07/namespace_d6ef1c07
// Params 0, eflags: 0x2
// Checksum 0x44fd71b8, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_413d188382cb271f", &__init__, undefined, undefined);
}

// Namespace namespace_d6ef1c07/namespace_d6ef1c07
// Params 0, eflags: 0x1 linked
// Checksum 0xf0ab0f9d, Offset: 0xe0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_2af7adc2570e0a8e", &on_begin, &on_end);
}

// Namespace namespace_d6ef1c07/namespace_d6ef1c07
// Params 4, eflags: 0x5 linked
// Checksum 0x71a23571, Offset: 0x148
// Size: 0x1fc
function private on_begin(var_2a54eca1, var_b3fc75a6, var_40988d98, var_968ac18f) {
    switch (getplayers().size) {
    case 1:
        level.var_5a9bcbe4 = zm_trial::function_5769f26a(var_2a54eca1);
        break;
    case 2:
        level.var_5a9bcbe4 = zm_trial::function_5769f26a(var_b3fc75a6);
        break;
    case 3:
        level.var_5a9bcbe4 = zm_trial::function_5769f26a(var_40988d98);
        break;
    case 4:
        level.var_5a9bcbe4 = zm_trial::function_5769f26a(var_968ac18f);
        break;
    }
    foreach (player in getplayers()) {
        player.var_5a9bcbe4 = 0;
        player zm_trial_util::function_c2cd0cba(level.var_5a9bcbe4);
        player zm_trial_util::function_2190356a(player.var_5a9bcbe4, 1);
        player thread function_7f62f098(level);
    }
    zm_spawner::register_zombie_death_event_callback(&function_138aec8e);
}

// Namespace namespace_d6ef1c07/namespace_d6ef1c07
// Params 1, eflags: 0x5 linked
// Checksum 0x36821d0c, Offset: 0x350
// Size: 0x22c
function private on_end(round_reset) {
    foreach (player in getplayers()) {
        player zm_trial_util::function_f3aacffb();
    }
    if (!round_reset) {
        var_57807cdc = [];
        foreach (player in getplayers()) {
            if (player.var_5a9bcbe4 < level.var_5a9bcbe4) {
                array::add(var_57807cdc, player, 0);
            }
        }
        if (var_57807cdc.size == 1) {
            zm_trial::fail(#"hash_788ffc8d7448f05", var_57807cdc);
        } else if (var_57807cdc.size > 1) {
            zm_trial::fail(#"hash_2bf9eb58ed3ac518", var_57807cdc);
        }
    }
    foreach (player in getplayers()) {
        player.var_5a9bcbe4 = undefined;
    }
    zm_spawner::deregister_zombie_death_event_callback(&function_138aec8e);
}

// Namespace namespace_d6ef1c07/namespace_d6ef1c07
// Params 1, eflags: 0x5 linked
// Checksum 0x609bedb0, Offset: 0x588
// Size: 0x12e
function private function_7f62f098(challenge) {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    while (1) {
        var_96936cca = self.var_5a9bcbe4;
        if (var_96936cca < 0) {
            var_96936cca = 0;
        } else if (var_96936cca > challenge.var_5a9bcbe4) {
            var_96936cca = challenge.var_5a9bcbe4;
        }
        self zm_trial_util::function_2190356a(var_96936cca, 1);
        if (var_96936cca < challenge.var_5a9bcbe4) {
            self zm_trial_util::function_c2cd0cba(challenge.var_5a9bcbe4);
            self zm_trial_util::function_2190356a(var_96936cca, 1);
        }
        if (var_96936cca == challenge.var_5a9bcbe4) {
            self zm_trial_util::function_63060af4(1, 1);
        }
        waitframe(1);
    }
}

// Namespace namespace_d6ef1c07/namespace_d6ef1c07
// Params 1, eflags: 0x5 linked
// Checksum 0xc831a75a, Offset: 0x6c0
// Size: 0xd4
function private function_138aec8e(attacker) {
    if (isdefined(self.var_6e2628f7) && self.var_6e2628f7) {
        if (isdefined(self.nuked) && self.nuked) {
            foreach (player in getplayers()) {
                player.var_5a9bcbe4++;
            }
            return;
        }
        if (isplayer(attacker)) {
            attacker.var_5a9bcbe4++;
        }
    }
}


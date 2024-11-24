#using scripts\core_common\laststand_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_trial;

#namespace zm_trial_safe_zone;

// Namespace zm_trial_safe_zone/zm_trial_safe_zone
// Params 0, eflags: 0x2
// Checksum 0x72e32b67, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_safe_zone", &__init__, undefined, undefined);
}

// Namespace zm_trial_safe_zone/zm_trial_safe_zone
// Params 0, eflags: 0x1 linked
// Checksum 0x493994fc, Offset: 0xe8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"safe_zone", &on_begin, &on_end);
}

// Namespace zm_trial_safe_zone/zm_trial_safe_zone
// Params 2, eflags: 0x5 linked
// Checksum 0x7ec73b64, Offset: 0x150
// Size: 0x1e8
function private on_begin(var_e84d35d1, var_16e6b8ea) {
    var_e9433d0 = struct::get_array(var_e84d35d1);
    assert(var_e9433d0.size, "<dev string:x38>");
    var_64e17761 = [];
    foreach (var_93154b10 in var_e9433d0) {
        assert(isdefined(var_93154b10.target), "<dev string:x67>");
        var_94d5ccbc = getentarray(var_93154b10.target, "targetname");
        var_64e17761 = arraycombine(var_64e17761, var_94d5ccbc, 0, 0);
    }
    var_16e6b8ea = zm_trial::function_5769f26a(var_16e6b8ea);
    foreach (player in getplayers()) {
        player thread function_68b149a2(var_64e17761, var_16e6b8ea);
    }
}

// Namespace zm_trial_safe_zone/zm_trial_safe_zone
// Params 1, eflags: 0x5 linked
// Checksum 0x1f994c8d, Offset: 0x340
// Size: 0xc
function private on_end(round_reset) {
    
}

// Namespace zm_trial_safe_zone/zm_trial_safe_zone
// Params 2, eflags: 0x1 linked
// Checksum 0x38493aa3, Offset: 0x358
// Size: 0x14c
function function_68b149a2(var_64e17761, var_16e6b8ea) {
    level endon(#"hash_7646638df88a3656");
    self endon(#"disconnect");
    wait 12;
    while (true) {
        var_4cda8676 = 0;
        foreach (var_c1f5749f in var_64e17761) {
            if (self istouching(var_c1f5749f)) {
                var_4cda8676 = 1;
                break;
            }
        }
        if (!var_4cda8676 && isalive(self) && !self laststand::player_is_in_laststand()) {
            self dodamage(var_16e6b8ea, self.origin);
            wait 1;
        }
        waitframe(1);
    }
}


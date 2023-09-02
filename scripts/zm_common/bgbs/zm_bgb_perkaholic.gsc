// Atian COD Tools GSC decompiler test
#using scripts\zm_common\trials\zm_trial_randomize_perks.gsc;
#using scripts\zm_common\trials\zm_trial_disable_perks.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;

#namespace zm_bgb_perkaholic;

// Namespace zm_bgb_perkaholic/zm_bgb_perkaholic
// Params 0, eflags: 0x2
// Checksum 0x26551737, Offset: 0xb0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_perkaholic", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_perkaholic/zm_bgb_perkaholic
// Params 0, eflags: 0x1 linked
// Checksum 0x9b801d19, Offset: 0x100
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_perkaholic", "activated", 1, undefined, undefined, &validation, &activation);
}

// Namespace zm_bgb_perkaholic/zm_bgb_perkaholic
// Params 0, eflags: 0x1 linked
// Checksum 0x810439ba, Offset: 0x180
// Size: 0x90
function validation() {
    if (isdefined(self.var_1eba264f) && self.var_1eba264f) {
        return 0;
    }
    if (zm_trial_disable_perks::is_active() || zm_trial_randomize_perks::is_active()) {
        return 0;
    }
    if (self zm_perks::function_80cb4982() && self zm_perks::function_9a0e9d65()) {
        return 0;
    }
    return 1;
}

// Namespace zm_bgb_perkaholic/zm_bgb_perkaholic
// Params 0, eflags: 0x1 linked
// Checksum 0xdb87cddb, Offset: 0x218
// Size: 0xf2
function activation() {
    self endon(#"fake_death", #"death", #"player_downed");
    if (!self laststand::player_is_in_laststand() && self.sessionstate != "spectator") {
        self zm_perks::function_cc24f525();
        self thread function_cd55a662();
        for (i = 0; i < 6; i++) {
            var_16c042b8 = self zm_perks::function_b2cba45a();
            if (isdefined(var_16c042b8)) {
                self.var_1eba264f = 1;
            } else {
                return;
            }
        }
    }
}

// Namespace zm_bgb_perkaholic/zm_bgb_perkaholic
// Params 0, eflags: 0x1 linked
// Checksum 0x5108da89, Offset: 0x318
// Size: 0x6a
function function_cd55a662() {
    self notify(#"hash_764a30e1b90e56f6");
    self endon(#"hash_764a30e1b90e56f6");
    self waittill(#"fake_death", #"player_downed", #"death");
    if (isdefined(self)) {
        self.var_1eba264f = undefined;
    }
}


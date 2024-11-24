#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_mod_slider;

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x2
// Checksum 0x871eedc6, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_slider", &__init__, &__main__, undefined);
}

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x1 linked
// Checksum 0xdd4f03a0, Offset: 0xd8
// Size: 0x14
function __init__() {
    function_bf3cfde4();
}

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xf8
// Size: 0x4
function __main__() {
    
}

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x1 linked
// Checksum 0xacd2b246, Offset: 0x108
// Size: 0x94
function function_bf3cfde4() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_phdflopper", "mod_slider", #"perk_slider", #"specialty_phdflopper", 4500);
    zm_perks::register_perk_threads(#"specialty_mod_phdflopper", &function_6a308c34, &function_ea0dd5e6);
}

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x1 linked
// Checksum 0xd6b2f1f7, Offset: 0x1a8
// Size: 0x1c
function function_6a308c34() {
    self thread function_815172d1();
}

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 4, eflags: 0x1 linked
// Checksum 0x355a5777, Offset: 0x1d0
// Size: 0x3e
function function_ea0dd5e6(b_pause, str_perk, str_result, n_slot) {
    self notify(#"hash_19d583212e9b3200");
    self.var_af850774 = undefined;
}

// Namespace zm_perk_mod_slider/zm_perk_mod_slider
// Params 0, eflags: 0x1 linked
// Checksum 0x799f7398, Offset: 0x218
// Size: 0x110
function function_815172d1() {
    self endon(#"disconnect", #"hash_19d583212e9b3200");
    var_be3643e6 = 0;
    while (true) {
        self.var_e9571d8b = undefined;
        while (!self isonground()) {
            if (!var_be3643e6) {
                var_be3643e6 = 1;
                self.var_af850774 = 0;
                var_62a70da1 = self.origin[2];
            } else if (var_62a70da1 < self.origin[2]) {
                var_62a70da1 = self.origin[2];
            }
            waitframe(1);
        }
        if (var_be3643e6) {
            self.var_e9571d8b = max(0, var_62a70da1 - self.origin[2]);
            var_be3643e6 = 0;
            waitframe(1);
        }
        waitframe(1);
    }
}


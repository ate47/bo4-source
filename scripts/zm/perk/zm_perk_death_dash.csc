#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_perk_death_dash;

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x2
// Checksum 0x9d819f64, Offset: 0x2e8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_death_dash", &__init__, undefined, undefined);
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0xacce9d37, Offset: 0x330
// Size: 0x3c
function __init__() {
    if (getdvarint(#"hash_1c1a8ed8d0bf271c", 0)) {
        function_27473e44();
    }
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x87122c8d, Offset: 0x378
// Size: 0xdc
function function_27473e44() {
    zm_perks::register_perk_clientfields(#"specialty_death_dash", &client_field_func, &code_callback_func);
    zm_perks::register_perk_init_thread(#"specialty_death_dash", &init);
    zm_perks::function_b60f4a9f(#"specialty_death_dash", #"p8_zm_vapor_altar_icon_01_blaze_phase", "zombie/fx8_perk_altar_symbol_ambient_blaze_phase", #"zmperksdeathdash");
    zm_perks::function_f3c80d73("zombie_perk_bottle_death_dash", "zombie_perk_totem_death_dash");
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x460
// Size: 0x4
function init() {
    
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x83901afd, Offset: 0x470
// Size: 0x1fc
function client_field_func() {
    clientfield::register("allplayers", "death_dash_charging", 24000, 1, "int", &function_bfd817c1, 0, 0);
    clientfield::register("allplayers", "death_dash_charged", 24000, 1, "int", &function_fe2634b2, 0, 0);
    clientfield::register("allplayers", "death_dash_charged_mod", 24000, 1, "int", &function_237b1f1e, 0, 0);
    clientfield::register("allplayers", "death_dash_trail", 24000, 1, "int", &function_dced8aba, 0, 0);
    clientfield::register("toplayer", "death_dash_charging_postfx", 24000, 1, "int", &function_fbdede2b, 0, 0);
    clientfield::register("toplayer", "death_dash_dash_postfx", 24000, 1, "int", &function_c8a1ee6b, 0, 0);
    clientfield::register("toplayer", "death_dash_charged_mod_postfx", 24000, 1, "int", &function_cc24f836, 0, 0);
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x678
// Size: 0x4
function code_callback_func() {
    
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 7, eflags: 0x1 linked
// Checksum 0x937b1491, Offset: 0x688
// Size: 0x146
function function_bfd817c1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.death_dash_charging_fx = util::playfxontag(localclientnum, "zombie/fx8_perk_blaze_phase_charging", self, "tag_origin");
        if (!isdefined(self.var_51a4a975)) {
            self.var_51a4a975 = self playloopsound(#"hash_4d72f993ab3784d0");
        }
        self playrumbleonentity(localclientnum, #"damage_light");
        return;
    }
    if (isdefined(self.death_dash_charging_fx)) {
        stopfx(localclientnum, self.death_dash_charging_fx);
        self.death_dash_charging_fx = undefined;
    }
    if (isdefined(self.var_51a4a975)) {
        self stoploopsound(self.var_51a4a975);
        self.var_51a4a975 = undefined;
    }
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 7, eflags: 0x1 linked
// Checksum 0x92aaf6a9, Offset: 0x7d8
// Size: 0x176
function function_fe2634b2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.death_dash_charged_fx = util::playfxontag(localclientnum, "zombie/fx8_perk_blaze_phase_charged", self, "tag_origin");
        if (!isdefined(self.var_202e9919)) {
            self.var_202e9919 = self playloopsound(#"hash_1bd81725dee72cb");
        }
        if (isdefined(self.var_51a4a975)) {
            self stoploopsound(self.var_51a4a975);
            self.var_51a4a975 = undefined;
        }
        self playrumbleonentity(localclientnum, #"damage_light");
        return;
    }
    if (isdefined(self.death_dash_charged_fx)) {
        stopfx(localclientnum, self.death_dash_charged_fx);
        self.death_dash_charged_fx = undefined;
    }
    if (isdefined(self.var_202e9919)) {
        self stoploopsound(self.var_202e9919);
        self.var_202e9919 = undefined;
    }
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 7, eflags: 0x1 linked
// Checksum 0x9f5a9cfd, Offset: 0x958
// Size: 0x176
function function_237b1f1e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.death_dash_charged_mod_fx = util::playfxontag(localclientnum, "zombie/fx8_perk_blaze_phase_charged_stretch", self, "tag_origin");
        if (!isdefined(self.var_202e9919)) {
            self.var_202e9919 = self playloopsound(#"hash_1bd81725dee72cb");
        }
        if (isdefined(self.var_51a4a975)) {
            self stoploopsound(self.var_51a4a975);
            self.var_51a4a975 = undefined;
        }
        self playrumbleonentity(localclientnum, #"damage_heavy");
        return;
    }
    if (isdefined(self.death_dash_charged_mod_fx)) {
        stopfx(localclientnum, self.death_dash_charged_mod_fx);
        self.death_dash_charged_mod_fx = undefined;
    }
    if (isdefined(self.var_202e9919)) {
        self stoploopsound(self.var_202e9919);
        self.var_202e9919 = undefined;
    }
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 7, eflags: 0x1 linked
// Checksum 0x26108400, Offset: 0xad8
// Size: 0x18c
function function_dced8aba(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self.death_dash_trail_fx = util::playfxontag(localclientnum, "zombie/fx8_perk_blaze_phase_trail", self, "tag_origin");
        if (!isdefined(self.var_884925ad)) {
            self playsound(localclientnum, #"hash_1075f6d6c2524599");
            self.var_884925ad = self playloopsound(#"hash_fa14d87437616df");
        }
        return;
    }
    if (isdefined(self.death_dash_trail_fx)) {
        stopfx(localclientnum, self.death_dash_trail_fx);
        self.death_dash_trail_fx = undefined;
    }
    if (isdefined(self.var_884925ad)) {
        self playsound(localclientnum, #"hash_42cb90d7c4d6ad08");
        self stoploopsound(self.var_884925ad);
        self.var_884925ad = undefined;
    }
    self playrumbleonentity(localclientnum, "damage_heavy");
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 7, eflags: 0x1 linked
// Checksum 0x78755345, Offset: 0xc70
// Size: 0x84
function function_fbdede2b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self postfx::playpostfxbundle("pstfx_burn_loop_blaze_phaze");
        return;
    }
    self postfx::stoppostfxbundle("pstfx_burn_loop_blaze_phaze");
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 7, eflags: 0x1 linked
// Checksum 0xf0bfd176, Offset: 0xd00
// Size: 0xa4
function function_c8a1ee6b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self postfx::stoppostfxbundle("pstfx_zm_chakram_speedblur");
        self postfx::playpostfxbundle("pstfx_zm_chakram_speedblur");
        return;
    }
    self postfx::exitpostfxbundle("pstfx_zm_chakram_speedblur");
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 7, eflags: 0x1 linked
// Checksum 0xb3c08e21, Offset: 0xdb0
// Size: 0xa4
function function_cc24f836(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self postfx::stoppostfxbundle("pstfx_zm_fire_blue_trap");
        self postfx::playpostfxbundle("pstfx_zm_fire_blue_trap");
        return;
    }
    self postfx::exitpostfxbundle("pstfx_zm_fire_blue_trap");
}


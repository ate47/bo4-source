#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_perk_widows_wine;

// Namespace zm_perk_widows_wine/zm_perk_widows_wine
// Params 0, eflags: 0x2
// Checksum 0xd955652e, Offset: 0x240
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_widows_wine", &__init__, undefined, undefined);
}

// Namespace zm_perk_widows_wine/zm_perk_widows_wine
// Params 0, eflags: 0x1 linked
// Checksum 0xcf0a3acf, Offset: 0x288
// Size: 0x104
function __init__() {
    zm_perks::register_perk_clientfields(#"specialty_widowswine", &widows_wine_client_field_func, &widows_wine_code_callback_func);
    zm_perks::register_perk_effects(#"specialty_widowswine", "widow_light");
    zm_perks::register_perk_init_thread(#"specialty_widowswine", &init_widows_wine);
    zm_perks::function_b60f4a9f(#"specialty_widowswine", #"p8_zm_vapor_altar_icon_01_winterswail", "zombie/fx8_perk_altar_symbol_ambient_widows_wine", #"zmperkswidowswail");
    zm_perks::function_f3c80d73("zombie_perk_bottle_widows_wine", "zombie_perk_totem_winters_wail");
}

// Namespace zm_perk_widows_wine/zm_perk_widows_wine
// Params 0, eflags: 0x1 linked
// Checksum 0x9b216fec, Offset: 0x398
// Size: 0xc2
function init_widows_wine() {
    if (isdefined(level.enable_magic) && level.enable_magic) {
        level._effect[#"widow_light"] = "zombie/fx_perk_widows_wine_zmb";
        level._effect[#"winters_wail_freeze"] = "zombie/fx8_perk_winters_wail_freeze";
        level._effect[#"winters_wail_explosion"] = "zombie/fx8_perk_winters_wail_exp";
        level._effect[#"winters_wail_slow_field"] = "zombie/fx8_perk_winters_wail_aoe";
    }
}

// Namespace zm_perk_widows_wine/zm_perk_widows_wine
// Params 0, eflags: 0x1 linked
// Checksum 0x80a35824, Offset: 0x468
// Size: 0x124
function widows_wine_client_field_func() {
    clientfield::register("actor", "winters_wail_freeze", 1, 1, "int", &function_fd02d096, 0, 1);
    clientfield::register("vehicle", "winters_wail_freeze", 1, 1, "int", &function_fd02d096, 0, 0);
    clientfield::register("allplayers", "winters_wail_explosion", 1, 1, "counter", &widows_wine_explosion, 0, 0);
    clientfield::register("allplayers", "winters_wail_slow_field", 1, 1, "int", &function_c6366dbe, 0, 0);
}

// Namespace zm_perk_widows_wine/zm_perk_widows_wine
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x598
// Size: 0x4
function widows_wine_code_callback_func() {
    
}

// Namespace zm_perk_widows_wine/zm_perk_widows_wine
// Params 7, eflags: 0x1 linked
// Checksum 0xb7a720cc, Offset: 0x5a8
// Size: 0x1bc
function function_fd02d096(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (isalive(self)) {
            if (!isdefined(self.var_ba239a31)) {
                if (isdefined(self gettagorigin("j_spineupper"))) {
                    str_tag = "j_spineupper";
                } else {
                    str_tag = "j_spine4";
                }
                self.var_ba239a31 = util::playfxontag(localclientnum, level._effect[#"winters_wail_freeze"], self, str_tag);
            }
            if (!isdefined(self.sndwidowswine)) {
                self playsound(localclientnum, #"hash_21bfd3813003fd44");
                self.sndwidowswine = self playloopsound(#"hash_199de7173fb36de6", 0.1);
            }
        }
        return;
    }
    if (isdefined(self.var_ba239a31)) {
        stopfx(localclientnum, self.var_ba239a31);
        self.var_ba239a31 = undefined;
    }
    if (isdefined(self.sndwidowswine)) {
        self stoploopsound(self.sndwidowswine, 1);
    }
}

// Namespace zm_perk_widows_wine/zm_perk_widows_wine
// Params 7, eflags: 0x1 linked
// Checksum 0x743752b3, Offset: 0x770
// Size: 0x11c
function widows_wine_explosion(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval && isdefined(self) && isdefined(level._effect[#"winters_wail_explosion"])) {
        origin = self gettagorigin("j_spine4");
        if (!isdefined(origin)) {
            origin = self.origin;
        }
        playfx(localclientnum, level._effect[#"winters_wail_explosion"], origin, anglestoforward(self.angles));
        self playsound(localclientnum, #"hash_3b59d3c99bac4071");
    }
}

// Namespace zm_perk_widows_wine/zm_perk_widows_wine
// Params 7, eflags: 0x1 linked
// Checksum 0x99cf6ad7, Offset: 0x898
// Size: 0x278
function function_c6366dbe(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self.var_e7addfc4)) {
        self.var_e7addfc4 = [];
    }
    if (isdefined(self.var_e7addfc4[localclientnum])) {
        stopfx(localclientnum, self.var_e7addfc4[localclientnum]);
        self.var_e7addfc4[localclientnum] = undefined;
    }
    a_e_players = getlocalplayers();
    foreach (e_player in a_e_players) {
        if (!e_player util::function_50ed1561(localclientnum)) {
            e_player notify(#"hash_517b3e71a56dcfcb");
        }
    }
    if (newval) {
        self.var_e7addfc4[localclientnum] = util::playfxontag(localclientnum, level._effect[#"winters_wail_slow_field"], self, "j_spine");
        self playsound(localclientnum, #"hash_2d956dd01a5a8800");
        a_e_players = getlocalplayers();
        foreach (e_player in a_e_players) {
            if (!e_player util::function_50ed1561(localclientnum)) {
                e_player thread zm_utility::function_ae3780f1(localclientnum, self.var_e7addfc4[localclientnum], #"hash_517b3e71a56dcfcb");
            }
        }
    }
}


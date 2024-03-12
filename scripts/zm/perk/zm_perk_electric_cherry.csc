// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_perk_electric_cherry;

// Namespace zm_perk_electric_cherry/zm_perk_electric_cherry
// Params 0, eflags: 0x2
// Checksum 0x8004a7f9, Offset: 0x1e8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_electric_cherry", &__init__, undefined, undefined);
}

// Namespace zm_perk_electric_cherry/zm_perk_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0xfa42616e, Offset: 0x230
// Size: 0x104
function __init__() {
    zm_perks::register_perk_clientfields(#"specialty_electriccherry", &electric_cherry_client_field_func, &electric_cherry_code_callback_func);
    zm_perks::register_perk_effects(#"specialty_electriccherry", "electric_cherry_light");
    zm_perks::register_perk_init_thread(#"specialty_electriccherry", &init_electric_cherry);
    zm_perks::function_b60f4a9f(#"specialty_electriccherry", #"p8_zm_vapor_altar_icon_01_electricburst", "zombie/fx8_perk_altar_symbol_ambient_electric_cherry", #"zmperkselectricburst");
    zm_perks::function_f3c80d73("zombie_perk_bottle_cherry", "zombie_perk_totem_electric_burst");
}

// Namespace zm_perk_electric_cherry/zm_perk_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0xdc52733e, Offset: 0x340
// Size: 0x2a2
function init_electric_cherry() {
    if (isdefined(level.enable_magic) && level.enable_magic) {
        level._effect[#"electric_cherry_light"] = #"hash_1442db17b83460ad";
    }
    clientfield::register("allplayers", "electric_cherry_reload_fx", 1, 2, "int", &electric_cherry_reload_attack_fx, 0, 0);
    clientfield::register("actor", "tesla_death_fx", 1, 1, "int", &tesla_death_fx_callback, 0, 0);
    clientfield::register("vehicle", "tesla_death_fx_veh", 1, 1, "int", &tesla_death_fx_callback, 0, 0);
    clientfield::register("actor", "tesla_shock_eyes_fx", 1, 1, "int", &tesla_shock_eyes_fx_callback, 0, 0);
    clientfield::register("vehicle", "tesla_shock_eyes_fx_veh", 1, 1, "int", &tesla_shock_eyes_fx_callback, 0, 0);
    level._effect[#"electric_cherry_explode"] = #"hash_413a313438a3a4e1";
    level._effect[#"electric_cherry_trail"] = #"hash_58c2d7d24c0d61a7";
    level._effect[#"tesla_death_cherry"] = #"zombie/fx_tesla_shock_zmb";
    level._effect[#"tesla_shock_eyes_cherry"] = #"zombie/fx_tesla_shock_eyes_zmb";
    level._effect[#"tesla_shock_cherry"] = #"zombie/fx_bmode_shock_os_zod_zmb";
}

// Namespace zm_perk_electric_cherry/zm_perk_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x5f0
// Size: 0x4
function electric_cherry_client_field_func() {
    
}

// Namespace zm_perk_electric_cherry/zm_perk_electric_cherry
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x600
// Size: 0x4
function electric_cherry_code_callback_func() {
    
}

// Namespace zm_perk_electric_cherry/zm_perk_electric_cherry
// Params 7, eflags: 0x1 linked
// Checksum 0x4842ff75, Offset: 0x610
// Size: 0x122
function electric_cherry_reload_attack_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.electric_cherry_reload_fx)) {
        stopfx(localclientnum, self.electric_cherry_reload_fx);
        self.electric_cherry_reload_fx = undefined;
    }
    switch (newval) {
    case 1:
    case 2:
    case 3:
        self.electric_cherry_reload_fx = util::playfxontag(localclientnum, level._effect[#"electric_cherry_explode"], self, "tag_origin");
        return;
    }
}

// Namespace zm_perk_electric_cherry/zm_perk_electric_cherry
// Params 7, eflags: 0x1 linked
// Checksum 0xec2af631, Offset: 0x740
// Size: 0x1f6
function tesla_death_fx_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (newval == 1) {
        str_tag = "J_SpineUpper";
        if (isdefined(self.str_tag_tesla_death_fx)) {
            str_tag = self.str_tag_tesla_death_fx;
        } else if (isdefined(self.isdog) && self.isdog) {
            str_tag = "J_Spine1";
        }
        if (!isdefined(self.var_16e53a57)) {
            self playsound(localclientnum, #"hash_3b277f4572603015");
            self.var_16e53a57 = self playloopsound(#"hash_2f0f235f7f6fc84d");
        }
        self.n_death_fx = util::playfxontag(localclientnum, level._effect[#"tesla_death_cherry"], self, str_tag);
        if (isdefined(self.n_death_fx)) {
            setfxignorepause(localclientnum, self.n_death_fx, 1);
        }
        return;
    }
    if (isdefined(self.n_death_fx)) {
        deletefx(localclientnum, self.n_death_fx, 1);
        self.n_death_fx = undefined;
    }
    if (isdefined(self.var_16e53a57)) {
        self stoploopsound(self.var_16e53a57);
        self.var_16e53a57 = undefined;
    }
}

// Namespace zm_perk_electric_cherry/zm_perk_electric_cherry
// Params 7, eflags: 0x1 linked
// Checksum 0xfa342fe2, Offset: 0x940
// Size: 0x2b6
function tesla_shock_eyes_fx_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (newval == 1) {
        str_tag = "J_SpineUpper";
        if (isdefined(self.str_tag_tesla_shock_eyes_fx)) {
            str_tag = self.str_tag_tesla_shock_eyes_fx;
        } else if (isdefined(self.isdog) && self.isdog) {
            str_tag = "J_Spine1";
        }
        if (!isdefined(self.var_16e53a57)) {
            self playsound(localclientnum, #"hash_3b277f4572603015");
            self.var_16e53a57 = self playloopsound(#"hash_2f0f235f7f6fc84d");
        }
        self.n_shock_eyes_fx = util::playfxontag(localclientnum, level._effect[#"tesla_shock_eyes_cherry"], self, "J_Eyeball_LE");
        if (isdefined(self) && isdefined(self.n_shock_eyes_fx)) {
            setfxignorepause(localclientnum, self.n_shock_eyes_fx, 1);
        }
        self.n_shock_fx = util::playfxontag(localclientnum, level._effect[#"tesla_death_cherry"], self, str_tag);
        if (isdefined(self) && isdefined(self.n_shock_eyes_fx)) {
            setfxignorepause(localclientnum, self.n_shock_fx, 1);
        }
        return;
    }
    if (isdefined(self.n_shock_eyes_fx)) {
        deletefx(localclientnum, self.n_shock_eyes_fx, 1);
        self.n_shock_eyes_fx = undefined;
    }
    if (isdefined(self.n_shock_fx)) {
        deletefx(localclientnum, self.n_shock_fx, 1);
        self.n_shock_fx = undefined;
    }
    if (isdefined(self.var_16e53a57)) {
        self stoploopsound(self.var_16e53a57);
        self.var_16e53a57 = undefined;
    }
}


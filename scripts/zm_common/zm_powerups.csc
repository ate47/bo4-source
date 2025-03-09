#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;

#namespace zm_powerups;

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x0
// Checksum 0xd8c24c48, Offset: 0x1f8
// Size: 0x36c
function init() {
    if (!isdefined(level.zombie_powerups)) {
        level.zombie_powerups = [];
    }
    add_zombie_powerup("insta_kill_ug", "powerup_instant_kill_ug", 1);
    level._effect[#"powerup_on"] = #"zombie/fx_powerup_on_green_zmb";
    level._effect[#"powerup_intro"] = #"hash_630b0bc30e08935f";
    level._effect[#"powerup_grabbed"] = #"zombie/fx_powerup_grab_green_zmb";
    level._effect[#"powerup_on_solo"] = #"zombie/fx_powerup_on_solo_zmb";
    level._effect[#"hash_1bbdf961a543a8a4"] = #"hash_5c054ea9b299c2f0";
    level._effect[#"powerup_grabbed_solo"] = #"zombie/fx_powerup_grab_solo_zmb";
    level._effect[#"powerup_on_caution"] = #"zombie/fx_powerup_on_caution_zmb";
    level._effect[#"hash_216d76ce6f19d51c"] = #"hash_2e09347c65fb17c1";
    level._effect[#"powerup_grabbed_caution"] = #"zombie/fx_powerup_grab_caution_zmb";
    if (isdefined(level.using_zombie_powerups) && level.using_zombie_powerups) {
        level._effect[#"powerup_on_red"] = #"zombie/fx_powerup_on_red_zmb";
        level._effect[#"hash_68ab4922f64db792"] = #"hash_62b15f4f400643ab";
        level._effect[#"powerup_grabbed_red"] = #"zombie/fx_powerup_grab_red_zmb";
    }
    clientfield::register("scriptmover", "powerup_fx", 1, 3, "int", &powerup_fx_callback, 0, 0);
    clientfield::register("scriptmover", "powerup_intro_fx", 1, 3, "int", &function_618b5680, 0, 0);
    clientfield::register("scriptmover", "powerup_grabbed_fx", 1, 3, "int", &function_9f7265fd, 0, 0);
}

// Namespace zm_powerups/zm_powerups
// Params 3, eflags: 0x0
// Checksum 0x124b2915, Offset: 0x570
// Size: 0x2da
function add_zombie_powerup(powerup_name, client_field_name, clientfield_version = 1) {
    if (isdefined(level.zombie_include_powerups) && !isdefined(level.zombie_include_powerups[powerup_name])) {
        return;
    }
    switch (powerup_name) {
    case #"full_ammo":
        str_rule = "zmPowerupMaxAmmo";
        break;
    case #"fire_sale":
        str_rule = "zmPowerupFireSale";
        break;
    case #"bonus_points_player_shared":
    case #"bonus_points_player":
    case #"bonus_points_team":
        str_rule = "zmPowerupChaosPoints";
        break;
    case #"free_perk":
        str_rule = "zmPowerupFreePerk";
        break;
    case #"nuke":
        str_rule = "zmPowerupNuke";
        break;
    case #"hero_weapon_power":
        str_rule = "zmPowerupSpecialWeapon";
        break;
    case #"insta_kill":
        str_rule = "zmPowerupInstakill";
        break;
    case #"double_points":
        str_rule = "zmPowerupDouble";
        break;
    case #"carpenter":
        str_rule = "zmPowerupCarpenter";
        break;
    default:
        str_rule = "";
        break;
    }
    if (str_rule != "" && !(isdefined(getgametypesetting(str_rule)) && getgametypesetting(str_rule))) {
        return;
    }
    struct = spawnstruct();
    struct.powerup_name = powerup_name;
    level.zombie_powerups[powerup_name] = struct;
    if (isdefined(client_field_name)) {
        var_4e6e65fa = "hudItems.zmPowerUps." + client_field_name + ".state";
        clientfield::register("clientuimodel", var_4e6e65fa, clientfield_version, 2, "int", &powerup_state_callback, 0, 1);
        struct.client_field_name = var_4e6e65fa;
    }
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x0
// Checksum 0x80c075b3, Offset: 0x858
// Size: 0x42
function include_zombie_powerup(powerup_name) {
    if (!isdefined(level.zombie_include_powerups)) {
        level.zombie_include_powerups = [];
    }
    level.zombie_include_powerups[powerup_name] = 1;
}

// Namespace zm_powerups/zm_powerups
// Params 7, eflags: 0x0
// Checksum 0x7d3974b2, Offset: 0x8a8
// Size: 0x76
function powerup_state_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify(#"powerup", {#powerup:fieldname, #state:newval});
}

// Namespace zm_powerups/zm_powerups
// Params 7, eflags: 0x0
// Checksum 0xa799da42, Offset: 0x928
// Size: 0x15c
function powerup_fx_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_d6070ac5(localclientnum);
    switch (newval) {
    case 1:
        str_fx = level._effect[#"powerup_on"];
        break;
    case 2:
        str_fx = level._effect[#"powerup_on_solo"];
        break;
    case 3:
        str_fx = level._effect[#"powerup_on_red"];
        break;
    case 4:
        str_fx = level._effect[#"powerup_on_caution"];
        break;
    default:
        return;
    }
    self play_powerup_fx(localclientnum, str_fx);
}

// Namespace zm_powerups/zm_powerups
// Params 7, eflags: 0x0
// Checksum 0x2927bce4, Offset: 0xa90
// Size: 0x15c
function function_618b5680(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self function_d6070ac5(localclientnum);
    switch (newval) {
    case 1:
        str_fx = level._effect[#"powerup_intro"];
        break;
    case 2:
        str_fx = level._effect[#"hash_1bbdf961a543a8a4"];
        break;
    case 3:
        str_fx = level._effect[#"hash_68ab4922f64db792"];
        break;
    case 4:
        str_fx = level._effect[#"hash_216d76ce6f19d51c"];
    default:
        return;
    }
    self play_powerup_fx(localclientnum, str_fx, 1);
}

// Namespace zm_powerups/zm_powerups
// Params 7, eflags: 0x0
// Checksum 0xb8848545, Offset: 0xbf8
// Size: 0x14c
function function_9f7265fd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    switch (newval) {
    case 1:
        str_fx = level._effect[#"powerup_grabbed"];
        break;
    case 2:
        str_fx = level._effect[#"powerup_grabbed_solo"];
        break;
    case 3:
        str_fx = level._effect[#"powerup_grabbed_red"];
        break;
    case 4:
        str_fx = level._effect[#"powerup_grabbed_caution"];
        break;
    default:
        return;
    }
    playfx(localclientnum, str_fx, self.origin);
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x4
// Checksum 0x354b65d6, Offset: 0xd50
// Size: 0x76
function private function_d6070ac5(localclientnum) {
    if (isdefined(self.n_powerup_fx)) {
        stopfx(localclientnum, self.n_powerup_fx);
        self.n_powerup_fx = undefined;
    }
    if (isdefined(self.var_71e06c56)) {
        self stoploopsound(self.var_71e06c56);
        self.var_71e06c56 = undefined;
    }
}

// Namespace zm_powerups/zm_powerups
// Params 3, eflags: 0x4
// Checksum 0xbf88b643, Offset: 0xdd0
// Size: 0x14a
function private play_powerup_fx(localclientnum, str_fx, var_6df65756 = 0) {
    if (self.model !== #"tag_origin") {
        forcestreamxmodel(self.model);
        util::delay(1, undefined, &stopforcestreamingxmodel, self.model);
    }
    self util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (var_6df65756 && !isdefined(self.var_71e06c56)) {
        self playsound(localclientnum, #"hash_3a25dc0ad86a722c");
        self.var_71e06c56 = self playloopsound(#"hash_3119fa236ffcf847");
    }
    self.n_powerup_fx = util::playfxontag(localclientnum, str_fx, self, "tag_origin");
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x0
// Checksum 0xf7901054, Offset: 0xf28
// Size: 0x1c
function function_cc33adc8() {
    return util::get_game_type() != "zcleansed";
}


#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_wallbuy;
#using scripts\zm_common\zm_utility;
#using script_624a704d0f6bf28d;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm;
#using scripts\zm_common\load;
#using scripts\core_common\util_shared;
#using scripts\core_common\serverfield_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;

#namespace white_main_quest;

// Namespace white_main_quest/zm_white_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x890c94b0, Offset: 0x500
// Size: 0x31c
function init_clientfields() {
    clientfield::register("scriptmover", "fx_steam_lab_dry_ice", 1, 1, "int", &function_9bc657a7, 0, 0);
    clientfield::register("world", "portal_map_to_nuclear_state", 20000, 1, "int", &portal_map_to_nuclear_state, 0, 0);
    clientfield::register("scriptmover", "fx_shard_glow_clientfield", 20000, 1, "int", &registerooze_gate_colcontrolrobotmelee, 0, 0);
    clientfield::register("toplayer", "clock_interact_feedback", 20000, 1, "counter", &clock_interact_feedback, 0, 0);
    clientfield::register("toplayer", "server_carry_feedback", 20000, 1, "counter", &server_carry_feedback, 0, 0);
    clientfield::register("toplayer", "server_carry_fail_feedback", 20000, 1, "counter", &server_carry_fail_feedback, 0, 0);
    clientfield::register("toplayer", "server_carry_audio_feedback", 20000, 1, "int", &server_carry_audio_feedback, 0, 0);
    clientfield::register("vehicle", "fx8_power_wisp_lg", 1, 1, "int", &function_4b104fc5, 0, 0);
    clientfield::register("scriptmover", "fx8_quest_mannequin_initial_sparks", 1, 1, "int", &function_a4630e54, 0, 0);
    clientfield::register("scriptmover", "fx8_quest_mannequin_charging", 1, 1, "int", &function_a290f1b0, 0, 0);
    clientfield::register("scriptmover", "fx8_quest_mannequin_explode_main", 1, 1, "int", &function_ac3315e5, 0, 0);
}

// Namespace white_main_quest/zm_white_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xae1b6e3c, Offset: 0x828
// Size: 0x15a
function init_fx() {
    level._effect[#"pap_projectile"] = #"hash_59977c4c851916e0";
    level._effect[#"pap_projectile_end"] = #"hash_1a06427eff8dfe13";
    level._effect[#"fx_steam_lab_dry_ice"] = "_t7/steam/fx_steam_lab_dry_ice";
    level._effect[#"hash_675f4b19e646ca6c"] = #"hash_4310e1cb3f897c7c";
    level._effect[#"fx8_power_wisp_lg"] = "maps/zm_white/fx8_power_wisp_lg";
    level._effect[#"fx8_quest_mannequin_initial_sparks"] = "maps/zm_white/fx8_quest_mannequin_initial_sparks";
    level._effect[#"fx8_quest_mannequin_charging"] = "maps/zm_white/fx8_quest_mannequin_charging";
    level._effect[#"fx8_quest_mannequin_explode_main"] = "maps/zm_white/fx8_quest_mannequin_explode_main";
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x94ec362, Offset: 0x990
// Size: 0xac
function function_a4630e54(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.fx_sparks = util::playfxontag(localclientnum, level._effect[#"fx8_quest_mannequin_initial_sparks"], self, "tag_head");
        return;
    }
    stopfx(localclientnum, self.fx_sparks);
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x1a74b836, Offset: 0xa48
// Size: 0xac
function function_a290f1b0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.fx_charge = util::playfxontag(localclientnum, level._effect[#"fx8_quest_mannequin_charging"], self, "tag_origin");
        return;
    }
    killfx(localclientnum, self.fx_charge);
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xfb176d02, Offset: 0xb00
// Size: 0xac
function function_ac3315e5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.fx = util::playfxontag(localclientnum, level._effect[#"fx8_quest_mannequin_explode_main"], self, "tag_origin");
        return;
    }
    stopfx(localclientnum, self.fx);
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x9a3b6b50, Offset: 0xbb8
// Size: 0xac
function function_4b104fc5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.fx = util::playfxontag(localclientnum, level._effect[#"fx8_power_wisp_lg"], self, "tag_origin");
        return;
    }
    stopfx(localclientnum, self.fx);
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x637bc217, Offset: 0xc70
// Size: 0x64
function clock_interact_feedback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrumbleonentity(localclientnum, "damage_light");
    }
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x8b15fd17, Offset: 0xce0
// Size: 0x64
function server_carry_feedback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrumbleonentity(localclientnum, "damage_light");
    }
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x70535099, Offset: 0xd50
// Size: 0x64
function server_carry_fail_feedback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrumbleonentity(localclientnum, "damage_heavy");
    }
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xe562d29b, Offset: 0xdc0
// Size: 0xae
function server_carry_audio_feedback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.var_c0f636f9 = self playloopsound(#"hash_54b2fc41dcb6bc56");
        return;
    }
    if (isdefined(self.var_c0f636f9)) {
        self stoploopsound(self.var_c0f636f9);
        self.var_c0f636f9 = undefined;
    }
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x0
// Checksum 0x492f5282, Offset: 0xe78
// Size: 0xbc
function soul_release(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        util::playfxontag(localclientnum, level._effect[#"pap_projectile"], self, "tag_origin");
        return;
    }
    util::playfxontag(localclientnum, level._effect[#"pap_projectile_end"], self, "tag_origin");
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0x2e75505c, Offset: 0xf40
// Size: 0x74
function function_9bc657a7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    util::playfxontag(localclientnum, level._effect[#"fx_steam_lab_dry_ice"], self, "tag_origin");
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xc45b6276, Offset: 0xfc0
// Size: 0xac
function registerooze_gate_colcontrolrobotmelee(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        self.fx = util::playfxontag(localclientnum, level._effect[#"hash_675f4b19e646ca6c"], self, "tag_origin");
        return;
    }
    stopfx(localclientnum, self.fx);
}

// Namespace white_main_quest/zm_white_main_quest
// Params 7, eflags: 0x1 linked
// Checksum 0xf86b80cb, Offset: 0x1078
// Size: 0x420
function portal_map_to_nuclear_state(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    var_c5a72006[0] = "tag_green_house_backyard";
    var_c5a72006[1] = "tag_red_house";
    var_c5a72006[2] = "tag_yellow_house";
    var_c5a72006[3] = "tag_prisoner_holding";
    var_c5a72006[4] = "tag_street_middle";
    var_c5a72006[5] = "tag_transfusion_facility";
    var_9bedcd54[0] = "tag_green_house";
    var_9bedcd54[1] = "tag_yellow_house";
    var_9bedcd54[2] = "tag_obrien_house";
    var_9bedcd54[3] = "tag_reinsel_house";
    var_9bedcd54[4] = "tag_hammond_house";
    var_9bedcd54[5] = "tag_hoggatt_house";
    var_ad6ace0d[0] = "tag_start_chest1";
    var_ad6ace0d[1] = "tag_start_chest2";
    var_ad6ace0d[2] = "tag_green_backyard_chest";
    var_ad6ace0d[3] = "tag_yellow_backyard_chest";
    var_ad6ace0d[4] = "tag_cul_de_sac_chest";
    var_8f14a19 = getentarray(localclientnum, "portal_map", "targetname");
    foreach (var_35f97c42 in var_8f14a19) {
        foreach (var_3f45d971 in var_c5a72006) {
            var_35f97c42 hidepart(localclientnum, var_3f45d971 + "_active");
            var_35f97c42 hidepart(localclientnum, var_3f45d971 + "_on");
        }
        foreach (var_e2d1b938 in var_9bedcd54) {
            var_35f97c42 hidepart(localclientnum, var_e2d1b938 + "_clear");
            var_35f97c42 showpart(localclientnum, var_e2d1b938 + "_clogged");
        }
        foreach (var_8b8b176b in var_ad6ace0d) {
            var_35f97c42 hidepart(localclientnum, var_8b8b176b);
        }
        var_35f97c42 showpart(localclientnum, "tag_nuked_lights");
    }
}


// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_fasttravel.csc;
#include scripts/core_common/postfx_shared.csc;
#include scripts/core_common/flag_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/struct.csc;

#namespace zm_white_portals;

// Namespace zm_white_portals/zm_white_portals
// Params 0, eflags: 0x1 linked
// Checksum 0xdc57f79c, Offset: 0x5b8
// Size: 0x34
function init() {
    init_fx();
    function_3ad8c656();
    main();
}

// Namespace zm_white_portals/zm_white_portals
// Params 0, eflags: 0x1 linked
// Checksum 0x9ac208e2, Offset: 0x5f8
// Size: 0x29c
function main() {
    num = getdvarint(#"splitscreen_playercount", 0);
    if (num < 1) {
        num = 1;
    }
    for (localclientnum = 0; localclientnum < num; localclientnum++) {
        util::waitforclient(localclientnum);
    }
    level._effect[#"fasttravel_end"] = #"tools/fx_null";
    if (!isdefined(level.var_22677da8)) {
        level.var_22677da8 = [];
    } else if (!isarray(level.var_22677da8)) {
        level.var_22677da8 = array(level.var_22677da8);
    }
    a_s_portals = struct::get_array("white_portal");
    a_e_players = getlocalplayers();
    foreach (s_portal in a_s_portals) {
        level.var_22677da8[s_portal.script_noteworthy] = s_portal;
        if (!isdefined(s_portal.var_9d387dd5)) {
            s_portal.var_9d387dd5 = [];
        } else if (!isarray(s_portal.var_9d387dd5)) {
            s_portal.var_9d387dd5 = array(s_portal.var_9d387dd5);
        }
        for (i = 0; i < a_e_players.size; i++) {
            s_portal.var_9d387dd5[i] = util::spawn_model(i, "tag_origin", s_portal.origin, s_portal.angles);
        }
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 0, eflags: 0x1 linked
// Checksum 0x735aacc8, Offset: 0x8a0
// Size: 0x94c
function init_clientfields() {
    clientfield::register("scriptmover", "portal_dest_fx", 20000, 3, "int", &function_e4ea441, 0, 0);
    clientfield::register("toplayer", "PORTAL_YELLOW_BACKYARD", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_YELLOW_HOUSE", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_RED_HOUSE", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_GREEN_HOUSE", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_GREEN_BACKYARD", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_STREET_MID", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_STREET_START", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_PRISONER_HOLDING", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_OPERATIONS", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_TRANSFUSION_FACILITY", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_APD_INTERROGATION", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_DINER", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_BEDS", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_LOUNGE", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_POWER", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("toplayer", "PORTAL_STORAGE", 20000, 2, "int", &portal_ready_fx, 0, 0);
    clientfield::register("actor", "crawler_portal_spawn_fx", 20000, 1, "counter", &crawler_portal_spawn_fx, 0, 0);
    clientfield::register("toplayer", "teleporter_transition", 20000, 1, "counter", &function_38a241a1, 0, 0);
    clientfield::register("toplayer", "teleporter_depart", 20000, 1, "counter", &function_69108708, 0, 0);
    clientfield::register("toplayer", "teleporter_arrive", 20000, 1, "counter", &function_98cff177, 0, 0);
    clientfield::register("world", "portal_maps_clear_lights", 20000, 1, "int", &portal_maps_clear_lights, 0, 0);
    clientfield::register("world", "portal_maps_initialize_lights", 20000, 1, "int", &portal_maps_initialize_lights, 0, 0);
    clientfield::register("world", "portal_map_indicator_green_house_backyard", 20000, 1, "int", &portal_map_indicator_green_house_backyard, 0, 0);
    clientfield::register("world", "portal_map_indicator_red_house", 20000, 1, "int", &portal_map_indicator_red_house, 0, 0);
    clientfield::register("world", "portal_map_indicator_yellow_house", 20000, 1, "int", &portal_map_indicator_yellow_house, 0, 0);
    clientfield::register("world", "portal_map_indicator_prisoner_holding", 20000, 1, "int", &portal_map_indicator_prisoner_holding, 0, 0);
    clientfield::register("world", "portal_map_indicator_street_middle", 20000, 1, "int", &portal_map_indicator_street_middle, 0, 0);
    clientfield::register("world", "portal_map_indicator_transfusion_facility", 20000, 1, "int", &portal_map_indicator_transfusion_facility, 0, 0);
    clientfield::register("world", "portal_map_indicator_diner", 20000, 1, "int", &portal_map_indicator_diner, 0, 0);
    clientfield::register("world", "portal_map_indicator_beds", 20000, 1, "int", &portal_map_indicator_beds, 0, 0);
    clientfield::register("world", "portal_map_indicator_power", 20000, 1, "int", &portal_map_indicator_power, 0, 0);
    clientfield::register("world", "portal_map_indicator_storage", 20000, 1, "int", &portal_map_indicator_storage, 0, 0);
}

// Namespace zm_white_portals/zm_white_portals
// Params 0, eflags: 0x1 linked
// Checksum 0x7c91154e, Offset: 0x11f8
// Size: 0x242
function init_fx() {
    level._effect[#"portal_ready"] = #"maps/zm_office/fx8_teleporter_ready";
    level._effect[#"portal_cooldown"] = #"hash_7793c4c65b08e6ed";
    level._effect[#"hash_32b0f959e6b81272"] = #"hash_4860741425dc1daa";
    level._effect[#"hash_44687d6082f9a0a4"] = #"hash_a4954ed961d6327";
    level._effect[#"hash_2e43973bc23c661d"] = #"hash_28fc28160d26395e";
    level._effect[#"hash_69091fb60c4fb574"] = #"hash_35e8a88a4a4563b4";
    level._effect[#"hash_690922b60c4fba8d"] = #"hash_205d49f043463dd2";
    level._effect[#"hash_690921b60c4fb8da"] = #"hash_19301646fb93e04c";
    level._effect[#"hash_3ae2cb0d50ae8e3e"] = #"hash_2cafcfa899f12c0";
    level._effect[#"teleport_depart"] = #"hash_1a6b5072e162ccd4";
    level._effect[#"teleport_arrive"] = #"hash_50655ac7dc942305";
    level._effect[#"map_indicator"] = #"hash_62d58a4d86948967";
}

// Namespace zm_white_portals/zm_white_portals
// Params 0, eflags: 0x1 linked
// Checksum 0xba66d52e, Offset: 0x1448
// Size: 0x116
function function_3ad8c656() {
    level.var_12cfa40a[0] = "tag_green_house_backyard";
    level.var_12cfa40a[1] = "tag_red_house";
    level.var_12cfa40a[2] = "tag_yellow_house";
    level.var_12cfa40a[3] = "tag_prisoner_holding";
    level.var_12cfa40a[4] = "tag_street_middle";
    level.var_12cfa40a[5] = "tag_transfusion_facility";
    level.var_12cfa40a[6] = "tag_diner";
    level.var_12cfa40a[7] = "tag_beds";
    level.var_12cfa40a[8] = "tag_power";
    level.var_12cfa40a[9] = "tag_storage";
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0x48fb6073, Offset: 0x1568
// Size: 0x7c
function function_38a241a1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    /#
        println("_active", localclientnum);
    #/
    self thread postfx::playpostfxbundle("pstfx_zm_office_teleporter");
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0x9dfc7a42, Offset: 0x15f0
// Size: 0x94
function function_69108708(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    /#
        println("<unknown string>", localclientnum);
    #/
    util::playfxontag(localclientnum, level._effect[#"teleport_depart"], self, "tag_origin");
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0xdc300939, Offset: 0x1690
// Size: 0x94
function function_98cff177(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    /#
        println("<unknown string>", localclientnum);
    #/
    util::playfxontag(localclientnum, level._effect[#"teleport_arrive"], self, "tag_origin");
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0x4220772b, Offset: 0x1730
// Size: 0x29a
function function_e4ea441(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.effect_id)) {
        deletefx(localclientnum, self.effect_id);
    }
    switch (newval) {
    case 1:
        self.effect_id = util::playfxontag(localclientnum, level._effect[#"hash_69091fb60c4fb574"], self, "tag_origin");
        self.var_81884612 = self playloopsound(#"evt_teleporter_loop", 1.75);
        break;
    case 2:
        self.effect_id = util::playfxontag(localclientnum, level._effect[#"hash_690922b60c4fba8d"], self, "tag_origin");
        self.var_81884612 = self playloopsound(#"evt_teleporter_loop", 1.75);
        break;
    case 3:
        self.effect_id = util::playfxontag(localclientnum, level._effect[#"hash_690921b60c4fb8da"], self, "tag_origin");
        self.var_81884612 = self playloopsound(#"evt_teleporter_loop", 1.75);
        break;
    case 4:
        self.effect_id = util::playfxontag(localclientnum, level._effect[#"hash_44687d6082f9a0a4"], self, "tag_origin");
        break;
    case 5:
        self.effect_id = util::playfxontag(localclientnum, level._effect[#"hash_2e43973bc23c661d"], self, "tag_origin");
        break;
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0x181647f2, Offset: 0x19d8
// Size: 0x15e
function portal_ready_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    while (!isdefined(level.var_22677da8)) {
        waitframe(1);
    }
    var_dabe3ecb = level.var_22677da8[fieldname].var_9d387dd5[localclientnum];
    if (isdefined(var_dabe3ecb) && isdefined(var_dabe3ecb.effect_id)) {
        deletefx(localclientnum, var_dabe3ecb.effect_id);
    }
    if (newval > 1) {
        var_dabe3ecb.effect_id = util::playfxontag(localclientnum, level._effect[#"portal_ready"], var_dabe3ecb, "tag_origin");
    } else if (newval == 1) {
        var_dabe3ecb.effect_id = util::playfxontag(localclientnum, level._effect[#"portal_cooldown"], var_dabe3ecb, "tag_origin");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0xa1b7dfe5, Offset: 0x1b40
// Size: 0xc4
function crawler_portal_spawn_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    warmup_fx = util::playfxontag(localclientnum, "maps/zm_office/fx8_teleporter_ready", self, "j_spine2");
    wait(1.5);
    if (isdefined(warmup_fx)) {
        deletefx(localclientnum, warmup_fx);
    }
    util::playfxontag(localclientnum, "maps/zm_office/fx8_teleporter_destination", self, "j_spine2");
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0x26e63d44, Offset: 0x1c10
// Size: 0xe0
function portal_maps_clear_lights(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        return;
    }
    level get_portals(localclientnum);
    foreach (var_9a586299 in level.var_31feb02b) {
        var_9a586299 thread clear_lights(localclientnum);
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 1, eflags: 0x1 linked
// Checksum 0x74298774, Offset: 0x1cf8
// Size: 0xe8
function clear_lights(localclientnum) {
    self util::waittill_dobj(localclientnum);
    foreach (var_73d65850 in level.var_12cfa40a) {
        self hidepart(localclientnum, var_73d65850 + "_on");
        self hidepart(localclientnum, var_73d65850 + "_active");
        self hidepart(localclientnum, "tag_nuked_lights");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0x58e14d02, Offset: 0x1de8
// Size: 0x16c
function portal_maps_initialize_lights(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        return;
    }
    level get_portals(localclientnum);
    foreach (var_9a586299 in level.var_31feb02b) {
        var_9a586299 util::waittill_dobj(localclientnum);
        foreach (var_73d65850 in level.var_12cfa40a) {
            var_9a586299 showpart(localclientnum, var_73d65850 + "_on");
        }
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0x8708a374, Offset: 0x1f60
// Size: 0x94
function portal_map_indicator_green_house_backyard(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        function_8353316a(localclientnum, "tag_green_house_backyard");
    } else if (newval == 1) {
        level function_af29dda9(localclientnum, "tag_green_house_backyard");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0xded00c12, Offset: 0x2000
// Size: 0x94
function portal_map_indicator_red_house(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        function_8353316a(localclientnum, "tag_red_house");
    } else if (newval == 1) {
        level function_af29dda9(localclientnum, "tag_red_house");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0x3379bd45, Offset: 0x20a0
// Size: 0x94
function portal_map_indicator_yellow_house(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        function_8353316a(localclientnum, "tag_yellow_house");
    } else if (newval == 1) {
        level function_af29dda9(localclientnum, "tag_yellow_house");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0xe5f0cc4f, Offset: 0x2140
// Size: 0x94
function portal_map_indicator_prisoner_holding(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        function_8353316a(localclientnum, "tag_prisoner_holding");
    } else if (newval == 1) {
        level function_af29dda9(localclientnum, "tag_prisoner_holding");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0x21f07a14, Offset: 0x21e0
// Size: 0x94
function portal_map_indicator_street_middle(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        function_8353316a(localclientnum, "tag_street_middle");
    } else if (newval == 1) {
        level function_af29dda9(localclientnum, "tag_street_middle");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0xffc99845, Offset: 0x2280
// Size: 0x94
function portal_map_indicator_transfusion_facility(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        function_8353316a(localclientnum, "tag_transfusion_facility");
    } else if (newval == 1) {
        level function_af29dda9(localclientnum, "tag_transfusion_facility");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0xb75580a2, Offset: 0x2320
// Size: 0x94
function portal_map_indicator_diner(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        function_8353316a(localclientnum, "tag_diner");
    } else if (newval == 1) {
        level function_af29dda9(localclientnum, "tag_diner");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0xce151e84, Offset: 0x23c0
// Size: 0x94
function portal_map_indicator_beds(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        function_8353316a(localclientnum, "tag_beds");
    } else if (newval == 1) {
        level function_af29dda9(localclientnum, "tag_beds");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0x2f282b33, Offset: 0x2460
// Size: 0x94
function portal_map_indicator_power(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        function_8353316a(localclientnum, "tag_power");
    } else if (newval == 1) {
        level function_af29dda9(localclientnum, "tag_power");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 7, eflags: 0x1 linked
// Checksum 0x10427dbc, Offset: 0x2500
// Size: 0x94
function portal_map_indicator_storage(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 0) {
        function_8353316a(localclientnum, "tag_storage");
    } else if (newval == 1) {
        level function_af29dda9(localclientnum, "tag_storage");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 2, eflags: 0x1 linked
// Checksum 0x539b2db5, Offset: 0x25a0
// Size: 0xf8
function function_af29dda9(localclientnum, tag_label) {
    level get_portals(localclientnum);
    foreach (portal_map in level.var_31feb02b) {
        portal_map util::waittill_dobj(localclientnum);
        portal_map hidepart(localclientnum, tag_label + "_on");
        portal_map showpart(localclientnum, tag_label + "_active");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 2, eflags: 0x1 linked
// Checksum 0xa9fa257d, Offset: 0x26a0
// Size: 0xf8
function function_8353316a(localclientnum, tag_label) {
    level get_portals(localclientnum);
    foreach (portal_map in level.var_31feb02b) {
        portal_map util::waittill_dobj(localclientnum);
        portal_map showpart(localclientnum, tag_label + "_on");
        portal_map hidepart(localclientnum, tag_label + "_active");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 1, eflags: 0x1 linked
// Checksum 0x1a14b06b, Offset: 0x27a0
// Size: 0x4e
function get_portals(localclientnum) {
    if (!isdefined(level.var_31feb02b)) {
        level.var_31feb02b = getentarray(localclientnum, "portal_map", "targetname");
    }
}

// Namespace zm_white_portals/zm_white_portals
// Params 1, eflags: 0x0
// Checksum 0x4aa05cb4, Offset: 0x27f8
// Size: 0x48
function function_73460c84(var_4749e403) {
    for (var_455a6779 = 0; var_455a6779 < var_4749e403; var_455a6779++) {
        if (isdefined(self.model)) {
            break;
        }
        waitframe(1);
    }
}


#using scripts\mp_common\gametypes\ct_utils;
#using scripts\core_common\util_shared;
#using scripts\core_common\renderoverridebundle;
#using scripts\core_common\clientfield_shared;

#namespace ct_core;

// Namespace ct_core/ct_core
// Params 0, eflags: 0x0
// Checksum 0x96344fb9, Offset: 0x1d0
// Size: 0x3e
function function_46e95cc7() {
    level.var_7b05c4b5 = 1;
    level.var_9f011465 = 1;
    level.var_e3049e92 = 0;
    level.var_903e2252 = 1;
}

// Namespace ct_core/ct_core
// Params 0, eflags: 0x0
// Checksum 0x7860a50e, Offset: 0x218
// Size: 0x2d4
function function_fa03fc55() {
    clientfield::register("allplayers", "enemy_on_radar", 1, 1, "int", &enemy_on_radar, 0, 1);
    clientfield::register("actor", "enemy_on_radar", 1, 1, "int", &enemy_on_radar, 0, 1);
    clientfield::register("allplayers", "player_keyline_render", 1, 1, "int", &player_keyline_render, 0, 1);
    clientfield::register("allplayers", "enemy_keyline_render", 1, 1, "int", &enemy_keyline_render, 0, 1);
    clientfield::register("scriptmover", "enemyobj_keyline_render", 1, 1, "int", &enemyobj_keyline_render, 0, 0);
    clientfield::register("actor", "actor_keyline_render", 1, 1, "int", &actor_keyline_render, 0, 0);
    clientfield::register("vehicle", "enemy_vehicle_keyline_render", 1, 1, "int", &enemy_vehicle_keyline_render, 0, 0);
    clientfield::register("allplayers", "set_vip", 1, 2, "int", &set_vip, 0, 0);
    clientfield::register("scriptmover", "animate_spawn_beacon", 1, 1, "int", &animate_spawn_beacon, 0, 0);
    clientfield::register("scriptmover", "objective_glow", 1, 1, "int", &objective_glow, 0, 0);
}

// Namespace ct_core/ct_core
// Params 7, eflags: 0x0
// Checksum 0x3c1cee39, Offset: 0x4f8
// Size: 0xe4
function player_keyline_render(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == oldval) {
        return;
    }
    if (newval && !(isdefined(self.var_a7656c04) && self.var_a7656c04)) {
        self.var_a7656c04 = 1;
        self playrenderoverridebundle(#"hash_1c90592671f4c6e9");
        return;
    }
    if (isdefined(self.var_a7656c04) && self.var_a7656c04) {
        self.var_a7656c04 = 0;
        self stoprenderoverridebundle(#"hash_1c90592671f4c6e9");
    }
}

// Namespace ct_core/ct_core
// Params 7, eflags: 0x0
// Checksum 0xf9c471f5, Offset: 0x5e8
// Size: 0xe4
function enemy_keyline_render(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == oldval) {
        return;
    }
    if (newval && !(isdefined(self.var_a7656c04) && self.var_a7656c04)) {
        self.var_a7656c04 = 1;
        self playrenderoverridebundle(#"hash_1dced6114b72a678");
        return;
    }
    if (isdefined(self.var_a7656c04) && self.var_a7656c04) {
        self.var_a7656c04 = 0;
        self stoprenderoverridebundle(#"hash_1dced6114b72a678");
    }
}

// Namespace ct_core/ct_core
// Params 7, eflags: 0x0
// Checksum 0xac034394, Offset: 0x6d8
// Size: 0x104
function enemyobj_keyline_render(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == oldval) {
        return;
    }
    if (newval) {
        self playrenderoverridebundle(#"hash_46b7dcb7342c64a2");
        self mapshaderconstant(localclientnum, 0, "scriptVector3", 1.5, 1, 1, 1);
        self mapshaderconstant(localclientnum, 0, "scriptVector4", 0.6, 0, 0, 0);
        return;
    }
    self stoprenderoverridebundle(#"hash_46b7dcb7342c64a2");
}

// Namespace ct_core/ct_core
// Params 7, eflags: 0x0
// Checksum 0xe1b23245, Offset: 0x7e8
// Size: 0x8c
function objective_glow(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval > 0) {
        self playrenderoverridebundle(#"rob_objective");
        return;
    }
    self stoprenderoverridebundle(#"rob_objective");
}

// Namespace ct_core/ct_core
// Params 7, eflags: 0x0
// Checksum 0x9b0cc6e8, Offset: 0x880
// Size: 0x9c
function actor_keyline_render(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == oldval) {
        return;
    }
    if (newval) {
        self playrenderoverridebundle(#"hash_1dced6114b72a678");
        return;
    }
    self stoprenderoverridebundle(#"hash_1dced6114b72a678");
}

// Namespace ct_core/ct_core
// Params 7, eflags: 0x0
// Checksum 0x3ecd7980, Offset: 0x928
// Size: 0x9c
function enemy_vehicle_keyline_render(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == oldval) {
        return;
    }
    if (newval) {
        self playrenderoverridebundle(#"rob_sonar_set_enemyequip");
        return;
    }
    self stoprenderoverridebundle(#"rob_sonar_set_enemyequip");
}

// Namespace ct_core/ct_core
// Params 7, eflags: 0x0
// Checksum 0x23e9d997, Offset: 0x9d0
// Size: 0x7c
function set_vip(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 2) {
        self function_79ea07a3(1);
        return;
    }
    self function_79ea07a3(0);
}

// Namespace ct_core/ct_core
// Params 7, eflags: 0x0
// Checksum 0xb494bd34, Offset: 0xa58
// Size: 0x74
function enemy_on_radar(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self enableonradar();
        return;
    }
    self disableonradar();
}

// Namespace ct_core/ct_core
// Params 7, eflags: 0x0
// Checksum 0x8fd652be, Offset: 0xad8
// Size: 0x10c
function animate_spawn_beacon(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle(#"rob_sonar_set_enemyequip");
        self useanimtree("generic");
        self setanimrestart(#"o_spawn_beacon_deploy", 1, 0, 1);
        return;
    }
    self stoprenderoverridebundle(#"rob_sonar_set_enemyequip");
    playfx(localclientnum, "explosions/fx_exp_dest_barrel_lg", self.origin);
}


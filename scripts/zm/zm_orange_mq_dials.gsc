// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_orange_pablo.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm\zm_hms_util.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_orange_mq_dials;

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1e0
// Size: 0x4
function preload() {
    
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 0, eflags: 0x1 linked
// Checksum 0x83b40ff8, Offset: 0x1f0
// Size: 0x26c
function main() {
    level flag::init(#"dials_aquired");
    level flag::init(#"dials_done");
    level.var_62bfa1a6 = [];
    level.var_4cf6900e = [];
    level.var_4cf6900e[#"orange"] = struct::get("orange", "script_noteworthy");
    level.var_4cf6900e[#"blue"] = struct::get("blue", "script_noteworthy");
    level.var_4cf6900e[#"yellow"] = struct::get("yellow", "script_noteworthy");
    level.var_4cf6900e[#"violet"] = struct::get("violet", "script_noteworthy");
    foreach (s_dial in level.var_4cf6900e) {
        s_dial.var_e5f66b29 = 0;
        s_dial.b_correct = 0;
        s_dial.n_value = 0;
        s_dial.var_7bb4ff56 = randomintrangeinclusive(1, 9);
        s_dial.dial_model = getent(s_dial.target, "targetname");
        s_dial.dial_model hide();
    }
    function_5f228e90();
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 1, eflags: 0x1 linked
// Checksum 0x6f47ab51, Offset: 0x468
// Size: 0x26c
function function_77ed3bab(var_5ea5c94d) {
    zm_ui_inventory::function_7df6bb60(#"zm_orange_objective_progress", 1);
    if (!var_5ea5c94d) {
        /#
            if (getdvarint(#"zm_debug_ee", 0)) {
                if (getdvarint(#"zm_debug_ee", 0)) {
                    iprintlnbold("<unknown string>");
                    println("<unknown string>");
                }
            }
            if (getdvarint(#"zm_debug_ee", 0)) {
                if (getdvarint(#"zm_debug_ee", 0)) {
                    iprintlnbold("<unknown string>");
                    println("<unknown string>");
                }
            }
        #/
        zm_orange_pablo::function_3f9e02b8(6, #"hash_2934f352bd60d6d6", #"hash_68fc56c1fbf3b972", &function_bd605daa);
        zm_orange_pablo::function_d83490c5(6);
        level flag::wait_till(#"dials_aquired");
        foreach (s_dial in level.var_4cf6900e) {
            s_dial zm_unitrigger::create("", 32);
            s_dial thread function_1e5c0d3b();
        }
        while (!function_5a73ee80()) {
            wait(1);
        }
    }
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 2, eflags: 0x1 linked
// Checksum 0xfec00162, Offset: 0x6e0
// Size: 0xfc
function function_51ecc801(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        zm_orange_pablo::function_6aaeff92(6);
        foreach (s_dial in level.var_4cf6900e) {
            s_dial.var_e5f66b29 = 1;
            s_dial.b_correct = 1;
            s_dial.dial_model show();
        }
    }
    level flag::set(#"dials_done");
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 0, eflags: 0x1 linked
// Checksum 0x374a2b0d, Offset: 0x7e8
// Size: 0x24
function function_bd605daa() {
    level flag::set(#"dials_aquired");
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 0, eflags: 0x1 linked
// Checksum 0xc5cb5c6c, Offset: 0x818
// Size: 0x90
function function_5a73ee80() {
    b_done = 1;
    foreach (dial in level.var_4cf6900e) {
        if (!dial.b_correct) {
            b_done = 0;
        }
    }
    return b_done;
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 0, eflags: 0x5 linked
// Checksum 0x90eaa58b, Offset: 0x8b0
// Size: 0x33e
function private function_1e5c0d3b() {
    level endon(#"end_game");
    while (!level flag::get(#"dials_done")) {
        s_results = undefined;
        s_results = self waittill(#"trigger_activated", #"dials_done");
        if (s_results._notify == #"dials_done") {
            return;
        }
        e_who = s_results.e_who;
        if (!self.var_e5f66b29) {
            self.var_e5f66b29 = 1;
            self.dial_model show();
            self.dial_model playsound("zmb_vessel_drop");
            wait(0.2);
        } else {
            self.dial_model playsound("zmb_quest_dial_turn");
            b_left = e_who lavapit_breach_(self.dial_model);
            if (b_left) {
                self.dial_model rotatepitch(36, 0.2, 0.03, 0.06);
                wait(0.2);
                self.n_value++;
            } else {
                self.dial_model rotatepitch(-36, 0.2, 0.03, 0.06);
                wait(0.2);
                self.n_value--;
            }
            wait(0.2);
            if (self.n_value > 9) {
                self.n_value = 0;
            }
            if (self.n_value < 0) {
                self.n_value = 9;
            }
            if (self.n_value == self.var_7bb4ff56) {
                /#
                    if (getdvarint(#"zm_debug_ee", 0)) {
                        if (getdvarint(#"zm_debug_ee", 0)) {
                            iprintlnbold("<unknown string>" + self.script_noteworthy + "<unknown string>");
                            println("<unknown string>" + self.script_noteworthy + "<unknown string>");
                        }
                    }
                #/
                self.b_correct = 1;
                self.dial_model playsound("zmb_quest_dial_success");
            } else {
                self.b_correct = 0;
            }
        }
    }
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 1, eflags: 0x5 linked
// Checksum 0xea409397, Offset: 0xbf8
// Size: 0x12e
function private lavapit_breach_(object) {
    v_origin = object.origin;
    if (isdefined(object.var_eb397f67)) {
        v_origin = object.var_eb397f67;
    }
    v_delta = vectornormalize(self geteye() - v_origin);
    v_angles = self getplayerangles();
    v_view = anglestoforward(v_angles);
    v_cross = vectorcross(v_view, v_delta);
    var_35b81369 = vectordot(v_cross, anglestoup(v_angles));
    if (var_35b81369 >= 0) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 0, eflags: 0x1 linked
// Checksum 0xba2f7338, Offset: 0xd30
// Size: 0xa0
function function_a02dfba() {
    var_aff5104e = getentarray("mq_dial_number", "targetname");
    foreach (e_code in var_aff5104e) {
        e_code function_eb2835af();
    }
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 0, eflags: 0x1 linked
// Checksum 0x237f2afd, Offset: 0xdd8
// Size: 0xf2
function function_eb2835af() {
    a_str_tag_name = [3:"tag_yellow_", 2:"tag_violet_", 1:"tag_orange_", 0:"tag_blue_"];
    foreach (str_tag in a_str_tag_name) {
        for (i = 0; i < 10; i++) {
            self hidepart(str_tag + i);
        }
    }
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 1, eflags: 0x1 linked
// Checksum 0x226fa7ba, Offset: 0xed8
// Size: 0x102
function function_66365668(n_code) {
    switch (self.script_noteworthy) {
    case #"orange_code":
        self showpart("tag_orange_" + n_code);
        break;
    case #"blue_code":
        self showpart("tag_blue_" + n_code);
        break;
    case #"yellow_code":
        self showpart("tag_yellow_" + n_code);
        break;
    case #"violet_code":
        self showpart("tag_violet_" + n_code);
        break;
    }
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 0, eflags: 0x1 linked
// Checksum 0xd5a784d2, Offset: 0xfe8
// Size: 0x12c
function function_5f228e90() {
    level function_a02dfba();
    if (zm_utility::is_ee_enabled()) {
        function_ca3efcd8(level.var_c205c941, "orange_code", level.var_4cf6900e[#"orange"].var_7bb4ff56);
        function_ca3efcd8(level.var_c205c941, "blue_code", level.var_4cf6900e[#"blue"].var_7bb4ff56);
        function_ca3efcd8(level.var_c205c941, "yellow_code", level.var_4cf6900e[#"yellow"].var_7bb4ff56);
        function_ca3efcd8(level.var_c205c941, "violet_code", level.var_4cf6900e[#"violet"].var_7bb4ff56);
    }
}

// Namespace zm_orange_mq_dials/zm_orange_mq_dials
// Params 3, eflags: 0x1 linked
// Checksum 0x652b52d8, Offset: 0x1120
// Size: 0x104
function function_ca3efcd8(e_code, str_noteworthy, n_code) {
    var_127789d1 = randomint(3);
    a_e_codes = zm_hms_util::function_bffcedde(str_noteworthy, "script_noteworthy", "script_int");
    level.var_c205c941[str_noteworthy] = a_e_codes[var_127789d1];
    level.var_c205c941[str_noteworthy] function_66365668(n_code);
    for (i = 0; i < a_e_codes.size; i++) {
        if (i != var_127789d1) {
            a_e_codes[i] delete();
        }
    }
    waitframe(1);
}


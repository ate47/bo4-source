// Atian COD Tools GSC decompiler test
#include script_724752ab26bff81b;
#include scripts/zm/zm_white_util.gsc;
#include scripts/zm/zm_white_main_quest.gsc;
#include script_174ce72cc0f850;
#include scripts/zm/zm_hms_util.gsc;
#include scripts/zm_common/zm_ui_inventory.gsc;
#include scripts/zm_common/zm_item_pickup.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_unitrigger.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/exploder_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace namespace_90b0490e;

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x1 linked
// Checksum 0xee825535, Offset: 0x320
// Size: 0x4d4
function preload() {
    level flag::init(#"chimney_grenaded");
    level.var_74170866 = spawnstruct();
    level.var_74170866.n_step = 0;
    callback::on_disconnect(&on_disconnect);
    a_s_cabinets = struct::get_array("cabinet");
    a_s_cabinets = array::randomize(a_s_cabinets);
    level.var_74170866.s_cabinet = array::pop_front(a_s_cabinets);
    level.var_74170866.s_cabinet.a_e_doors = getentarray(level.var_74170866.s_cabinet.target, "targetname");
    a_s_fireplaces = struct::get_array("fireplace_canister");
    a_s_fireplaces = array::randomize(a_s_fireplaces);
    level.var_74170866.s_fireplace = array::pop_front(a_s_fireplaces);
    a_parts = getentarray(level.var_74170866.s_fireplace.target, "targetname");
    foreach (part in a_parts) {
        if (part.classname == "trigger_damage_new") {
            level.var_74170866.s_fireplace.var_7126b6eb = part;
        } else if (part.classname == "info_volume") {
            level.var_74170866.s_fireplace.var_72807128 = part;
        }
    }
    level.var_74170866.s_fireplace.var_b9989e12 = hash(level.var_74170866.s_fireplace.script_noteworthy);
    level.var_74170866.s_fireplace.var_7944be4a = 0;
    level.var_74170866.s_fireplace.var_7126b6eb triggerenable(0);
    foreach (s_fireplace in a_s_fireplaces) {
        a_parts = getentarray(s_fireplace.target, "targetname");
        array::run_all(a_parts, &delete);
    }
    clientfield::register("scriptmover", "" + #"hash_2184dd4e9090521f", 20000, 1, "int");
    namespace_bd74bbd2::register(#"sc_mk2z_1", 20000, "sc_mk2z_1", &function_a66f0de2, &function_17f3e9e2);
    namespace_bd74bbd2::register(#"sc_mk2z_2", 20000, "sc_mk2z_2", &function_a66f0de2, &function_17f3e9e2);
    namespace_bd74bbd2::register(#"sc_mk2z_3", 20000, "sc_mk2z_3", &function_a66f0de2, &function_17f3e9e2);
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 1, eflags: 0x5 linked
// Checksum 0x46aeadc4, Offset: 0x800
// Size: 0x40
function private function_18a1849f(e_player) {
    if (!isdefined(level.var_74170866.e_player)) {
        return 0;
    }
    return e_player === level.var_74170866.e_player;
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 1, eflags: 0x5 linked
// Checksum 0x2df7c14b, Offset: 0x848
// Size: 0xf4
function private function_f6048ee(e_player) {
    if (isdefined(e_player)) {
        if (!isdefined(level.var_74170866.e_player)) {
            if (isdefined(e_player.var_9c20e2c9)) {
                self sethintstring(#"hash_744b68f010abb05");
            } else {
                self sethintstring(#"hash_12346bdab086516e");
            }
        } else if (level.var_74170866.e_player == e_player) {
            self sethintstring(#"hash_74fc96e8d58ff646");
        } else {
            self sethintstring(#"hash_2054e8fdb6521566");
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 1, eflags: 0x5 linked
// Checksum 0xbc430469, Offset: 0x948
// Size: 0x76
function private function_5b4f9f76(e_player) {
    var_2fff5cb5 = level.var_74170866.e_player === e_player;
    var_24441d81 = !isdefined(level.var_74170866.e_player) && !isdefined(e_player.var_9c20e2c9);
    return var_2fff5cb5 || var_24441d81;
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x1 linked
// Checksum 0x623023be, Offset: 0x9c8
// Size: 0x14
function start_quest() {
    function_b60df00d();
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0xc610916a, Offset: 0x9e8
// Size: 0x114
function private function_b60df00d() {
    level thread function_cbeb9a33();
    /#
        iprintlnbold("<unknown string>");
    #/
    /#
        iprintlnbold("<unknown string>" + level.var_74170866.s_cabinet.script_string + "<unknown string>");
    #/
    level.var_74170866.n_step = 1;
    s_cabinet = level.var_74170866.s_cabinet;
    e_canister = util::spawn_model(s_cabinet.model, s_cabinet.origin, s_cabinet.angles);
    s_cabinet.e_canister = e_canister;
    level thread run_step_1();
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0xf0520c83, Offset: 0xb08
// Size: 0x364
function private run_step_1() {
    level endon(#"end_game", #"insanity_mode_triggered");
    if (isdefined(level.var_74170866.s_cabinet.a_e_doors[0])) {
        exploder::exploder("fxexp_mk2_Z_smoke_orange_emit_closet_" + level.var_74170866.s_cabinet.script_string);
        pixbeginevent(#"hash_3aea5406d9a5bdcf");
        foreach (e_door in level.var_74170866.s_cabinet.a_e_doors) {
            e_door setcandamage(1);
            e_door val::set("quest_mk2z", "allowDeath", 0);
            e_door thread function_4b4ede();
        }
        level.var_74170866.s_cabinet waittill(#"burn_cabinet");
        pixendevent();
        exploder::stop_exploder("fxexp_mk2_Z_smoke_orange_emit_closet_" + level.var_74170866.s_cabinet.script_string);
        exploder::exploder("fxexp_mk2_Z_fire_closet_door_" + level.var_74170866.s_cabinet.script_string);
        wait(1);
        array::run_all(level.var_74170866.s_cabinet.a_e_doors, &delete);
        wait(0.5);
        exploder::stop_exploder("fxexp_mk2_Z_fire_closet_door_" + level.var_74170866.s_cabinet.script_string);
        s_cabinet = level.var_74170866.s_cabinet;
    }
    s_unitrigger = level.var_74170866.s_cabinet.e_canister zm_item_pickup::create_item_pickup(&function_9d66ea6f, &function_f6048ee, &function_5b4f9f76);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
    waitframe(1);
    zm_unitrigger::reregister_unitrigger_as_dynamic(level.var_74170866.s_cabinet.e_canister.s_unitrigger);
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x1 linked
// Checksum 0xedb37c6b, Offset: 0xe78
// Size: 0x13c
function function_4b4ede() {
    self endon(#"death", #"burn_cabinet");
    while (1) {
        s_notify = undefined;
        s_notify = self waittill(#"damage");
        if (s_notify zm_hms_util::function_69320b44("zm_aat_plasmatic_burst")) {
            level.var_74170866.s_cabinet notify(#"burn_cabinet");
            foreach (e_door in level.var_74170866.s_cabinet.a_e_doors) {
                e_door setcandamage(0);
                e_door notify(#"burn_cabinet");
            }
            break;
        }
    }
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 1, eflags: 0x0
// Checksum 0x65c96ca7, Offset: 0xfc0
// Size: 0x58
function function_e08b0124(e_player) {
    self sethintstringforplayer(e_player, zm_utility::function_d6046228(#"hash_12346bdab086516e", #"hash_184ab2db21c5bc9a"));
    return 1;
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 2, eflags: 0x5 linked
// Checksum 0xe5bb9b87, Offset: 0x1020
// Size: 0x1ac
function private function_9d66ea6f(e_item, e_player) {
    /#
        if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
            iprintlnbold(e_player.name + "<unknown string>");
            println(e_player.name + "<unknown string>");
        }
    #/
    level.var_74170866.e_player = e_player;
    namespace_a01a2431::function_605e5c25(e_player);
    e_player.var_9c20e2c9 = 1;
    e_player playsound("evt_canister_pickup");
    zm_ui_inventory::function_7df6bb60("zm_white_ww_mod_phase", 3, e_player);
    zm_ui_inventory::function_7df6bb60("zm_white_ww_mk2z_ammo", 1, e_player);
    function_87e09347();
    if (zm_utility::is_classic()) {
        level.var_74170866.e_player zm_hms_util::function_51b752a9("vox_ww_z_ammo_pickup", 0);
        if (!zm_white_main_quest::function_6cebbce1()) {
            level.var_74170866.e_player zm_white_util::function_491673da(#"hash_571c990866faa511");
        }
    }
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0x47b32c8a, Offset: 0x11d8
// Size: 0xe4
function private function_87e09347() {
    /#
        iprintlnbold("<unknown string>");
    #/
    if (zm_white_main_quest::function_6cebbce1()) {
        /#
            iprintlnbold("<unknown string>");
        #/
    }
    while (zm_white_main_quest::function_6cebbce1()) {
        wait(3);
    }
    exploder::exploder("fxexp_mk2_Z_smoke_chimney_" + level.var_74170866.s_fireplace.script_string + "_house");
    level.var_74170866.n_step = 2;
    level thread run_step_2();
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0xe6b70604, Offset: 0x12c8
// Size: 0x23c
function private run_step_2() {
    level endon(#"end_game", #"hash_7456b125dbebe41c");
    pixbeginevent(#"hash_2573979b6db7cb52");
    /#
        iprintlnbold("<unknown string>" + level.var_74170866.s_fireplace.script_string);
    #/
    level.var_74170866.s_fireplace.var_7126b6eb triggerenable(1);
    level thread function_7130498();
    level thread function_20b366ef();
    level flag::wait_till(#"chimney_grenaded");
    if (!zm_white_main_quest::function_6cebbce1() && zm_utility::is_classic()) {
        level.var_74170866.e_player thread zm_white_util::function_491673da(#"hash_5dc92cbe0fbe5da");
    }
    exploder::stop_exploder("fxexp_mk2_Z_smoke_chimney_" + level.var_74170866.s_fireplace.script_string + "_house");
    level.var_74170866.s_fireplace.var_7126b6eb triggerenable(0);
    wait(1);
    exploder::exploder("fxexp_mk2_Z_fire_chimney_" + level.var_74170866.s_fireplace.script_string + "_house");
    pixendevent();
    function_b99d76c0();
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0x3644276e, Offset: 0x1510
// Size: 0x44
function private cleanup_step_2() {
    exploder::stop_exploder("fxexp_mk2_Z_smoke_chimney_" + level.var_74170866.s_fireplace.script_string + "_house");
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x1 linked
// Checksum 0x106f26df, Offset: 0x1560
// Size: 0xf8
function function_7130498() {
    level endon(#"end_game");
    while (!level flag::get(#"chimney_grenaded")) {
        waitresult = undefined;
        waitresult = level.var_74170866.s_fireplace.var_7126b6eb waittill(#"damage");
        if (istouching(waitresult.position, level.var_74170866.s_fireplace.var_7126b6eb)) {
            /#
                iprintlnbold("<unknown string>");
            #/
            level flag::set(#"chimney_grenaded");
        }
    }
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x1 linked
// Checksum 0x71102220, Offset: 0x1660
// Size: 0xf0
function function_20b366ef() {
    level endon(#"end_game");
    while (!level flag::get(#"chimney_grenaded")) {
        s_waitresult = undefined;
        s_waitresult = level waittill(#"hash_3042a9bf2f57ea0a");
        v_origin = s_waitresult.var_814c9389;
        if (istouching(v_origin, level.var_74170866.s_fireplace.var_7126b6eb)) {
            /#
                iprintlnbold("<unknown string>");
            #/
            level flag::set(#"chimney_grenaded");
        }
    }
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0x22cdc4a6, Offset: 0x1758
// Size: 0x72
function private function_b99d76c0() {
    s_sc = level.var_74170866.s_fireplace;
    s_sc zm_unitrigger::create("", 96);
    s_sc thread function_473f437();
    level.var_74170866.n_step = 3;
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0xfe049786, Offset: 0x17d8
// Size: 0x144
function private function_473f437() {
    self endon(#"death", #"stop_think");
    while (1) {
        s_notify = undefined;
        s_notify = self waittill(#"trigger_activated");
        playsoundatposition("evt_rgun_frame_putback", (-759, -626, -7));
        if (function_18a1849f(s_notify.e_who)) {
            level.var_74170866.var_fead3ae9 = util::spawn_model("p8_zm_whi_fuse_pickup_fluid_magenta_pink_half", self.origin, self.angles);
            level.var_74170866.var_fead3ae9.var_b9989e12 = hash(self.script_noteworthy);
            namespace_bd74bbd2::start(level.var_74170866.var_fead3ae9.var_b9989e12);
            zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
            break;
        }
    }
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0xda87efb2, Offset: 0x1928
// Size: 0x124
function private function_a66f0de2() {
    namespace_bd74bbd2::end(hash(level.var_74170866.s_fireplace.script_noteworthy));
    s_unitrigger = level.var_74170866.var_fead3ae9 zm_item_pickup::create_item_pickup(&function_b9a31cb, &function_f6048ee, &function_5b4f9f76, 96);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
    level.var_74170866.var_fead3ae9 setmodel("p8_zm_whi_fuse_pickup_fluid_magenta_pink");
    level.var_74170866.var_fead3ae9 clientfield::set("" + #"hash_2184dd4e9090521f", 1);
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 2, eflags: 0x5 linked
// Checksum 0xee5ac5fc, Offset: 0x1a58
// Size: 0x174
function private function_b9a31cb(e_item, e_player) {
    /#
        if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
            iprintlnbold(e_player.name + "<unknown string>");
            println(e_player.name + "<unknown string>");
        }
    #/
    exploder::stop_exploder("fxexp_mk2_Z_fire_chimney_" + level.var_74170866.s_fireplace.script_string + "_house");
    zm_ui_inventory::function_7df6bb60("zm_white_ww_mk2z_ammo", 2, e_player);
    e_player.var_f7694097 = 3;
    e_player playsound("evt_canister_pickup");
    function_a36c4a5e();
    if (!zm_white_main_quest::function_6cebbce1() && zm_utility::is_classic()) {
        e_player zm_white_util::function_491673da(#"hash_3fa02403cbe89e77");
    }
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0xa5939d15, Offset: 0x1bd8
// Size: 0x7c
function private function_17f3e9e2() {
    s_unitrigger = level.var_74170866.var_fead3ae9 zm_unitrigger::create(&function_7015dc35, 96);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_unitrigger);
    level.var_74170866.var_fead3ae9 thread function_2ac1278b();
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 1, eflags: 0x5 linked
// Checksum 0xc9a5ca54, Offset: 0x1c60
// Size: 0x84
function private function_7015dc35(e_player) {
    if (isdefined(e_player)) {
        if (level.var_74170866.e_player === e_player) {
            self sethintstring(#"hash_14eae7c162ebb8d2");
        } else {
            self sethintstring(#"hash_2054e8fdb6521566");
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0x527e5f74, Offset: 0x1cf0
// Size: 0xa4
function private function_2ac1278b() {
    self endon(#"death");
    while (1) {
        s_notify = undefined;
        s_notify = self waittill(#"trigger_activated");
        e_player = s_notify.e_who;
        if (function_18a1849f(e_player)) {
            namespace_bd74bbd2::start(self.var_b9989e12);
            zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
            break;
        }
    }
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x1 linked
// Checksum 0x934c8ace, Offset: 0x1da0
// Size: 0x10c
function cleanup_step_3() {
    exploder::stop_exploder("fxexp_mk2_Z_fire_chimney_" + level.var_74170866.s_fireplace.script_string + "_house");
    if (isdefined(level.var_74170866.var_fead3ae9)) {
        namespace_bd74bbd2::end(hash(level.var_74170866.s_fireplace.script_noteworthy));
        level.var_74170866.var_fead3ae9 delete();
    } else {
        s_sc = level.var_74170866.s_fireplace;
        s_sc notify(#"stop_think");
        zm_unitrigger::unregister_unitrigger(s_sc.s_unitrigger);
    }
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0x90941f28, Offset: 0x1eb8
// Size: 0x3a
function private function_a36c4a5e() {
    level.var_74170866.e_player thread function_cba90c3c();
    level.var_74170866.n_step = 4;
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0x54087f5e, Offset: 0x1f00
// Size: 0xbc
function private function_cba90c3c() {
    self endon(#"death");
    self waittill(#"hash_13f3f231b45420ef");
    if (zm_utility::is_classic()) {
        if (!zm_white_main_quest::function_6cebbce1()) {
            level.var_74170866.e_player zm_white_util::function_491673da(#"hash_4107574caf164040");
        }
        level.var_74170866.e_player zm_hms_util::function_51b752a9("vox_ww_z_craft", 0);
    }
    complete_quest();
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0x22c61df3, Offset: 0x1fc8
// Size: 0xc2
function private complete_quest() {
    /#
        if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
            iprintlnbold(level.var_74170866.e_player.name + "<unknown string>");
            println(level.var_74170866.e_player.name + "<unknown string>");
        }
    #/
    level.var_74170866.e_player = undefined;
    level.var_74170866.n_step = 5;
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x5 linked
// Checksum 0x402aeebc, Offset: 0x2098
// Size: 0x34
function private on_disconnect() {
    if (function_18a1849f(self)) {
        restart_quest();
    }
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 1, eflags: 0x5 linked
// Checksum 0x5889be36, Offset: 0x20d8
// Size: 0xe4
function private restart_quest(var_e19b7aed = 1) {
    level notify(#"hash_7456b125dbebe41c");
    switch (level.var_74170866.n_step) {
    case 1:
        var_e19b7aed = 0;
        break;
    case 2:
        cleanup_step_2();
        break;
    case 3:
        cleanup_step_3();
        break;
    }
    level.var_74170866.e_player = undefined;
    if (var_e19b7aed) {
        function_b60df00d();
    }
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0, eflags: 0x1 linked
// Checksum 0x1002c344, Offset: 0x21c8
// Size: 0x114
function function_cbeb9a33() {
    level waittill(#"insanity_mode_triggered");
    exploder::stop_exploder("fxexp_mk2_Z_smoke_orange_emit_closet_" + level.var_74170866.s_cabinet.script_string);
    if (isdefined(level.var_74170866.s_cabinet.e_canister) && isdefined(level.var_74170866.s_cabinet.e_canister.s_unitrigger)) {
        zm_unitrigger::unregister_unitrigger(level.var_74170866.s_cabinet.e_canister.s_unitrigger);
        level.var_74170866.s_cabinet.e_canister delete();
    }
    restart_quest(0);
}


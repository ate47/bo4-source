// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_orange_pablo.gsc;
#using scripts\zm\zm_orange_util.gsc;
#using scripts\zm\zm_hms_util.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using script_3e5ec44cfab7a201;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_orange_ww_quest;

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe0cb5c14, Offset: 0x300
// Size: 0x94
function init() {
    init_flags();
    clientfield::register("scriptmover", "vril_device_glow", 24000, 1, "int");
    namespace_617a54f4::function_d8383812(#"sc_ww_quest", 24000, "sc_ww_quest", &is_soul_capture, &soul_captured, 1);
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x34063e75, Offset: 0x3a0
// Size: 0x1ac
function init_flags() {
    level flag::init(#"hash_72853b82b3faf149");
    level flag::init(#"hash_550c8dc4c89d7873");
    level flag::init(#"ww_icicle_melting");
    level flag::init(#"ww_icicle_melted");
    level flag::init(#"hash_7f9c695cfdccd6b4");
    level flag::init(#"ww_safe_opened");
    level flag::init(#"hash_174f5682aa48c4b");
    level flag::init(#"hash_45b20bfeff570913");
    level flag::init(#"hash_4be0ac3f82fc9d21");
    level flag::init(#"hash_7d53c3b51ab8c250");
    level flag::init(#"hash_44512b5e960df8f0");
    level flag::init(#"hash_65f4eac55edea07f");
    /#
        level flag::init(#"soul_fill");
    #/
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x749dd9b8, Offset: 0x558
// Size: 0x4dc
function main() {
    level.s_ww_quest = spawnstruct();
    zm_sq::register(#"ww_quest", #"hash_48c49b81fdcdc242", #"ww_quest_step1", &ww_quest_step1_setup, &ww_quest_step1_cleanup);
    zm_sq::register(#"ww_quest", #"hash_6442e35feab8c079", #"ww_quest_step2", &ww_quest_step2_setup, &ww_quest_step2_cleanup);
    zm_sq::register(#"ww_quest", #"hash_737f8b1503916752", #"ww_quest_step3", &ww_quest_step3_setup, &ww_quest_step3_cleanup);
    zm_sq::register(#"ww_quest", #"hash_60e28c4bd65d92ab", #"ww_quest_step4", &ww_quest_step4_setup, &ww_quest_step4_cleanup);
    zm_sq::register(#"ww_quest", #"hash_4a7a9c037e9a8447", #"ww_quest_step5", &ww_quest_step5_setup, &ww_quest_step5_cleanup);
    zm_sq::register(#"ww_quest", #"hash_7230371c8fbcfec2", #"ww_quest_step6", &ww_quest_step6_setup, &ww_quest_step6_cleanup);
    zm_sq::register(#"ww_quest", #"hash_532d2da7fe5bfe2e", #"ww_quest_step7", &ww_quest_step7_setup, &ww_quest_step7_cleanup);
    zm_sq::register(#"ww_quest", #"hash_52f633bb8e8c32e4", #"ww_quest_step8", &ww_quest_step8_setup, &ww_quest_step8_cleanup);
    zm_sq::register(#"ww_quest", #"hash_43fb367b319214fa", #"ww_quest_step9", &ww_quest_step9_setup, &ww_quest_step9_cleanup);
    zm_sq::register(#"ww_quest", #"hash_1ec16bb3298bdc60", #"ww_quest_step10", &registertank_activatedtargetservice, &ww_quest_step10_cleanup);
    level.s_ww_quest.s_campfire = struct::get("ww_quest_campfire", "targetname");
    s_campfire = level.s_ww_quest.s_campfire;
    level.s_ww_quest.s_icicle_in_pot = struct::get("icicle_in_pot", "targetname");
    zm_sq::start(#"ww_quest", !zm_utility::is_standard());
    level flag::wait_till("start_zombie_round_logic");
    exploder::exploder("fxexp_campfire_boat");
    callback::on_connect(&on_player_connect);
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xab851d55, Offset: 0xa40
// Size: 0x1c
function on_player_connect() {
    exploder::exploder("fxexp_campfire_boat");
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xda08cc46, Offset: 0xa68
// Size: 0x44
function ww_quest_step1_setup(var_5ea5c94d) {
    function_6b9d097d();
    if (!var_5ea5c94d) {
        level flag::wait_till(#"hash_550c8dc4c89d7873");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xdc2a4005, Offset: 0xab8
// Size: 0x84
function ww_quest_step1_cleanup(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 1);
        level flag::set(#"hash_550c8dc4c89d7873");
    }
    level.s_ww_quest.e_icicle delete();
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x7f89e698, Offset: 0xb48
// Size: 0x154
function function_6b9d097d() {
    a_e_icicles = getentarray("ww_quest_icicle", "targetname");
    level.s_ww_quest.e_icicle = array::random(a_e_icicles);
    arrayremovevalue(a_e_icicles, level.s_ww_quest.e_icicle);
    array::delete_all(a_e_icicles);
    level.s_ww_quest.e_icicle.var_279c587d = struct::get(level.s_ww_quest.e_icicle.target, "targetname");
    level.s_ww_quest.e_icicle setcandamage(1);
    level.s_ww_quest.e_icicle val::set("ww_quest", "allowdeath", 0);
    level.s_ww_quest.e_icicle thread function_d997ba18();
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x3ee3315f, Offset: 0xca8
// Size: 0x152
function function_d997ba18() {
    level endon(#"end_game");
    self endon(#"death");
    while (true) {
        s_notify = self waittill(#"damage");
        if (isplayer(s_notify.attacker)) {
            self setcandamage(0);
            self movez(self.script_int, 0.5);
            self waittill(#"movedone");
            self playsound(#"hash_ad51236cdb547c4");
            level flag::set(#"hash_72853b82b3faf149");
            self zm_unitrigger::create(&function_575a8040, 64);
            self thread function_a28a5c21();
            return;
        }
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xda4b0837, Offset: 0xe08
// Size: 0x60
function function_575a8040(e_player) {
    str_hint = zm_utility::function_d6046228(#"hash_6649759b63221feb", #"hash_aed756161e44fe1");
    self sethintstring(str_hint);
    return true;
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa2a9f90c, Offset: 0xe70
// Size: 0x10c
function function_a28a5c21() {
    level endon(#"end_game");
    self endon(#"death");
    s_result = self waittill(#"trigger_activated");
    e_who = s_result.e_who;
    self playsound(#"hash_345f1d31b52a4589");
    e_who thread zm_orange_util::function_51b752a9(#"hash_3b257ebd55a83e3d");
    level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 1);
    self zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    level flag::set(#"hash_550c8dc4c89d7873");
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x81d905a0, Offset: 0xf88
// Size: 0x8c
function ww_quest_step2_setup(var_5ea5c94d) {
    s_campfire = level.s_ww_quest.s_campfire;
    if (!var_5ea5c94d) {
        s_campfire zm_unitrigger::create(&function_401b015a, 64);
        s_campfire thread function_f7a8831a();
        level flag::wait_till(#"ww_icicle_melted");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x1966bc70, Offset: 0x1020
// Size: 0x9c
function ww_quest_step2_cleanup(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 0);
        level flag::set(#"ww_icicle_melted");
    }
    level.s_ww_quest.s_campfire zm_unitrigger::unregister_unitrigger(level.s_ww_quest.s_campfire.s_unitrigger);
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x5eedf21d, Offset: 0x10c8
// Size: 0x88
function function_401b015a(e_player) {
    if (level flag::get(#"hash_84593b9650c7abf")) {
        return false;
    }
    str_hint = zm_utility::function_d6046228(#"hash_53753033c9262930", #"hash_79ec41cce109821c");
    self sethintstring(str_hint);
    return true;
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf1f0e088, Offset: 0x1158
// Size: 0x260
function function_f7a8831a() {
    level endon(#"end_game", #"ww_icicle_melted");
    while (true) {
        self waittill(#"trigger_activated");
        if (level flag::get(#"hash_84593b9650c7abf")) {
            continue;
        }
        level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 0);
        self zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
        level flag::set(#"ww_icicle_melting");
        var_3eb924ae = spawn("script_origin", self.origin);
        var_3eb924ae playloopsound(#"hash_549b97233315d94");
        level.s_ww_quest.s_icicle_in_pot scene::play("melt");
        level.s_ww_quest.var_27a40ea3 = level.s_ww_quest.s_icicle_in_pot.scene_ents[#"prop 1"];
        level.s_ww_quest.var_27a40ea3 hidepart("tag_icicle", "p8_fxanim_zm_orange_frozen_key", 1);
        level.s_ww_quest.s_icicle_in_pot scene::play("evaporate");
        var_3eb924ae delete();
        playsoundatposition(#"hash_1fe7d157e75bcb38", self.origin);
        level flag::clear(#"ww_icicle_melting");
        level flag::set(#"ww_icicle_melted");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xc89d0d9b, Offset: 0x13c0
// Size: 0x8c
function ww_quest_step3_setup(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level.s_ww_quest.s_campfire zm_unitrigger::create(&function_10aa0f27, 64);
        level.s_ww_quest.s_campfire thread function_993730f4();
        level flag::wait_till(#"hash_7f9c695cfdccd6b4");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xc6afbba3, Offset: 0x1458
// Size: 0x9c
function ww_quest_step3_cleanup(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 2);
        level flag::set(#"hash_7f9c695cfdccd6b4");
    }
    level.s_ww_quest.s_campfire zm_unitrigger::unregister_unitrigger(level.s_ww_quest.s_campfire.s_unitrigger);
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x67776ea7, Offset: 0x1500
// Size: 0x60
function function_10aa0f27(e_player) {
    str_hint = zm_utility::function_d6046228(#"hash_7830e4902246743f", #"hash_6a4ef97c05602fdd");
    self sethintstring(str_hint);
    return true;
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x9cd087b4, Offset: 0x1568
// Size: 0x10c
function function_993730f4() {
    level endon(#"end_game", #"hash_7f9c695cfdccd6b4");
    s_result = self waittill(#"trigger_activated");
    e_who = s_result.e_who;
    level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 2);
    playsoundatposition(#"evt_key_pickup", self.origin);
    level.s_ww_quest.var_27a40ea3 hidepart("tag_key");
    self thread function_a67de655(e_who);
    level flag::set(#"hash_7f9c695cfdccd6b4");
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x1132937f, Offset: 0x1680
// Size: 0x6c
function function_a67de655(e_player) {
    e_player zm_orange_util::function_51b752a9(#"hash_7e030fccc2c5a121");
    wait(1);
    if (level.var_98138d6b > 1) {
        level.var_1c53964e thread zm_hms_util::function_6a0d675d(#"hash_7cc5c64ef2e9f6bf");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x87be1b2a, Offset: 0x16f8
// Size: 0xdc
function ww_quest_step4_setup(var_5ea5c94d) {
    level.s_ww_quest.var_aaedf111 = getent("ww_quest_safe_door", "targetname");
    level.s_ww_quest.s_safe = struct::get("ww_quest_safe_use", "targetname");
    if (!var_5ea5c94d) {
        level.s_ww_quest.s_safe zm_unitrigger::create("", 64);
        level.s_ww_quest.s_safe thread function_731665dd();
        level flag::wait_till(#"ww_safe_opened");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xa3c887ba, Offset: 0x17e0
// Size: 0xbc
function ww_quest_step4_cleanup(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 0);
        level.s_ww_quest.var_aaedf111 function_8613de32();
        level flag::set(#"ww_safe_opened");
    }
    level.s_ww_quest.s_safe zm_unitrigger::unregister_unitrigger(level.s_ww_quest.s_safe.s_unitrigger);
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xb0f0b4c3, Offset: 0x18a8
// Size: 0xdc
function function_731665dd() {
    level endon(#"end_game", #"ww_safe_opened");
    s_results = self waittill(#"trigger_activated");
    e_who = s_results.e_who;
    level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 0);
    level.s_ww_quest.var_aaedf111 function_8613de32();
    level thread function_29d4087d(e_who);
    level flag::set(#"ww_safe_opened");
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xee2ed901, Offset: 0x1990
// Size: 0x5a
function function_8613de32() {
    self rotateyaw(-195, 1.5);
    self playsound("evt_safe_open");
    self waittill(#"rotatedone");
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x6eb62040, Offset: 0x19f8
// Size: 0xb4
function function_29d4087d(player) {
    level endon(#"end_game");
    if (level.var_98138d6b > 1) {
        zm_hms_util::function_3c173d37();
        level.var_1c53964e zm_hms_util::function_6a0d675d(#"vox_vril_reveal", -1, 0, 0);
        if (!isdefined(player)) {
            player = zm_hms_util::function_3815943c();
        }
        player zm_orange_util::function_51b752a9("vox_vril_reveal", -1, 0, 0);
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x465a0bd5, Offset: 0x1ab8
// Size: 0x164
function ww_quest_step5_setup(var_5ea5c94d) {
    level.s_ww_quest.var_a90a158b = getent("ww_quest_vril_device", "targetname");
    level.s_ww_quest.var_e0942fa0 = struct::get("ww_quest_vril_device_struct", "targetname");
    level.s_ww_quest.var_e0942fa0.var_b9989e12 = hash(level.s_ww_quest.var_e0942fa0.script_noteworthy);
    level.s_ww_quest.var_e0942fa0.var_c5e93537 = getent(level.s_ww_quest.var_e0942fa0.target, "targetname");
    if (!var_5ea5c94d) {
        level.s_ww_quest.var_e0942fa0.var_7944be4a = 0;
        namespace_617a54f4::function_3f808d3d(level.s_ww_quest.var_e0942fa0.var_b9989e12);
        level flag::wait_till(#"hash_174f5682aa48c4b");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xbd283587, Offset: 0x1c28
// Size: 0xcc
function ww_quest_step5_cleanup(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        level flag::set(#"hash_174f5682aa48c4b");
        level.s_ww_quest.var_a90a158b clientfield::set("vril_device_glow", 1);
    }
    level.s_ww_quest.var_a90a158b clientfield::set("vril_device_glow", 1);
    level.s_ww_quest.var_e0942fa0.var_c5e93537 delete();
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x44d92715, Offset: 0x1d00
// Size: 0x98
function is_soul_capture(var_88206a50, ent) {
    if (isdefined(ent)) {
        b_killed_by_player = isplayer(ent.attacker) || isplayer(ent.damageinflictor);
        var_e93788f1 = var_88206a50.var_c5e93537;
        return (b_killed_by_player && ent istouching(var_e93788f1));
    }
    return false;
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x38ed2124, Offset: 0x1da0
// Size: 0xdc
function soul_captured(var_f0e6c7a2, ent) {
    n_souls_required = 10;
    if (getplayers().size > 2) {
        n_souls_required = 20;
    } else if (getplayers().size > 1) {
        n_souls_required = 15;
    }
    var_f0e6c7a2.var_7944be4a++;
    /#
        if (level flag::get(#"soul_fill")) {
            var_f0e6c7a2.var_7944be4a = n_souls_required;
        }
    #/
    if (var_f0e6c7a2.var_7944be4a >= n_souls_required) {
        var_f0e6c7a2 function_a66f0de2();
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x74d0cd40, Offset: 0x1e88
// Size: 0x3c
function function_a66f0de2() {
    namespace_617a54f4::function_2a94055d(self.var_b9989e12);
    level flag::set(#"hash_174f5682aa48c4b");
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xf59d850a, Offset: 0x1ed0
// Size: 0x8c
function ww_quest_step6_setup(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level.s_ww_quest.s_safe zm_unitrigger::create(&function_cb9653f9, 64);
        level.s_ww_quest.s_safe thread function_2187358d();
        level flag::wait_till(#"hash_45b20bfeff570913");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x4d51ac4f, Offset: 0x1f68
// Size: 0xdc
function ww_quest_step6_cleanup(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 3);
        level flag::set(#"hash_45b20bfeff570913");
    }
    level.s_ww_quest.var_a90a158b delete();
    level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 3);
    level.s_ww_quest.s_safe zm_unitrigger::unregister_unitrigger(level.s_ww_quest.s_safe.s_unitrigger);
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xd74c1c7e, Offset: 0x2050
// Size: 0x60
function function_cb9653f9(e_player) {
    str_hint = zm_utility::function_d6046228(#"hash_188b62454f9ad5e2", #"hash_63560b3154dd8df6");
    self sethintstring(str_hint);
    return true;
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x989679e, Offset: 0x20b8
// Size: 0xc4
function function_2187358d() {
    level endon(#"end_game", #"hash_45b20bfeff570913");
    s_result = self waittill(#"trigger_activated");
    e_who = s_result.e_who;
    playsoundatposition(#"hash_565a70d2b5a64e2", self.origin);
    level thread function_53bfbec4(e_who);
    level flag::set(#"hash_45b20bfeff570913");
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x84e36ebb, Offset: 0x2188
// Size: 0x64
function function_53bfbec4(player) {
    level endon(#"end_game");
    if (!isdefined(player)) {
        player = zm_hms_util::function_3815943c();
    }
    player zm_orange_util::function_51b752a9("vox_vril_charge", -1, 0, 0);
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x356c2fd1, Offset: 0x21f8
// Size: 0x8c
function ww_quest_step7_setup(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        zm_orange_pablo::register_drop_off(12, #"hash_28851887435f3a31", #"hash_742fc3d930e6bd6f", &function_7537624);
        zm_orange_pablo::function_d83490c5(12);
        level flag::wait_till(#"hash_4be0ac3f82fc9d21");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xb5f7a425, Offset: 0x2290
// Size: 0x7c
function ww_quest_step7_cleanup(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        zm_orange_pablo::function_6aaeff92(12);
        level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 0);
        level flag::set(#"hash_4be0ac3f82fc9d21");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc259e614, Offset: 0x2318
// Size: 0x44
function function_7537624() {
    level zm_ui_inventory::function_7df6bb60("zm_orange_ww_quest", 0);
    level flag::set(#"hash_4be0ac3f82fc9d21");
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x76f3243c, Offset: 0x2368
// Size: 0x8c
function ww_quest_step8_setup(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        zm_orange_pablo::function_3f9e02b8(1, #"hash_3f668e62652456fd", #"hash_3e87176776a2b6e3", &function_2b590a59);
        zm_orange_pablo::function_d83490c5(1);
        level flag::wait_till(#"hash_7d53c3b51ab8c250");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x94c3e6df, Offset: 0x2400
// Size: 0x5c
function ww_quest_step8_cleanup(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        zm_orange_pablo::function_6aaeff92(1);
        level flag::set(#"hash_7d53c3b51ab8c250");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x1a541a35, Offset: 0x2468
// Size: 0x24
function function_2b590a59() {
    level flag::set(#"hash_7d53c3b51ab8c250");
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x57e2e782, Offset: 0x2498
// Size: 0x14c
function ww_quest_step9_setup(var_5ea5c94d) {
    level.s_ww_quest.var_16c37c7f = struct::get("reward_crate_dg1", "targetname");
    var_16c37c7f = level.s_ww_quest.var_16c37c7f;
    var_16c37c7f.e_lid = getent(var_16c37c7f.var_c8166135, "targetname");
    var_16c37c7f.e_lock = getent(var_16c37c7f.target_lock, "targetname");
    var_16c37c7f.e_weapon = getent(var_16c37c7f.target_weapon, "targetname");
    if (!var_5ea5c94d) {
        var_16c37c7f zm_unitrigger::create(&function_54e8826c, 64);
        var_16c37c7f thread function_400a7216();
        level flag::wait_till(#"hash_44512b5e960df8f0");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x462a581b, Offset: 0x25f0
// Size: 0x114
function ww_quest_step9_cleanup(var_5ea5c94d, ended_early) {
    var_16c37c7f = level.s_ww_quest.var_16c37c7f;
    if (var_5ea5c94d || ended_early) {
        var_16c37c7f.e_lid rotatepitch(-90, 0.5);
        var_16c37c7f.e_lid waittill(#"rotatedone");
        var_16c37c7f.e_weapon movez(24, 0.5);
        var_16c37c7f.e_weapon waittill(#"movedone");
        level flag::set(#"hash_44512b5e960df8f0");
    }
    var_16c37c7f zm_unitrigger::unregister_unitrigger(var_16c37c7f.s_unitrigger);
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x4f188c11, Offset: 0x2710
// Size: 0x60
function function_54e8826c(e_player) {
    str_hint = zm_utility::function_d6046228(#"hash_509dd10b32275ac6", #"hash_1fbdd38541c13a62");
    self sethintstring(str_hint);
    return true;
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x52a24f47, Offset: 0x2778
// Size: 0x84
function function_400a7216() {
    level endon(#"end_game", #"hash_44512b5e960df8f0");
    s_result = self waittill(#"trigger_activated");
    self function_735037d4();
    level flag::set(#"hash_44512b5e960df8f0");
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x418d6681, Offset: 0x2808
// Size: 0x12c
function function_735037d4() {
    level endon(#"end_game");
    self zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    if (isdefined(self.e_lock)) {
        self.e_lock delete();
    }
    wait(0.5);
    self.e_lid rotatepitch(-90, 2, 0, 0.666667);
    self.e_lid playsound(#"hash_1cfa90c531f36b92");
    self.e_lid waittill(#"rotatedone");
    self.e_weapon movez(24, 2);
    if (!level.pablo_npc.isspeaking) {
        level zm_orange_pablo::function_e44c7c0c(#"vox_ww_pickup");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x404bed7e, Offset: 0x2940
// Size: 0x94
function registertank_activatedtargetservice(var_5ea5c94d) {
    var_16c37c7f = level.s_ww_quest.var_16c37c7f;
    if (!var_5ea5c94d) {
        var_16c37c7f.e_weapon zm_orange_util::start_zombies_collision_manager(getweapon("ww_tesla_sniper_t8"), &function_b8f6f344);
        level flag::wait_till(#"hash_65f4eac55edea07f");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x8e71bdda, Offset: 0x29e0
// Size: 0x144
function ww_quest_step10_cleanup(var_5ea5c94d, ended_early) {
    var_16c37c7f = level.s_ww_quest.var_16c37c7f;
    if (var_5ea5c94d || ended_early) {
        if (isdefined(var_16c37c7f.e_weapon)) {
            var_16c37c7f.e_weapon delete();
        }
        a_e_players = getplayers();
        foreach (e_player in a_e_players) {
            if (!e_player util::is_spectating()) {
                e_player zm_weapons::weapon_give(level.w_tesla_sniper_t8, 1);
            }
        }
        level flag::set(#"hash_65f4eac55edea07f");
    }
}

// Namespace zm_orange_ww_quest/zm_orange_ww_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x23b31b42, Offset: 0x2b30
// Size: 0x5c
function function_b8f6f344(e_player, b_get_weapon) {
    if (b_get_weapon) {
        e_player thread zm_orange_util::function_51b752a9(#"hash_8afeb4b44d0add");
    }
    level flag::set(#"hash_65f4eac55edea07f");
}


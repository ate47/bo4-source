// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_orange_challenges.gsc;
#include scripts/zm/zm_orange_util.gsc;
#include scripts/zm/zm_hms_util.gsc;
#include scripts/zm_common/zm_customgame.gsc;
#include scripts/zm_common/callbacks.gsc;
#include scripts/zm_common/zm_audio.gsc;
#include scripts/zm_common/zm_items.gsc;
#include scripts/zm_common/zm_ui_inventory.gsc;
#include scripts/zm_common/zm_crafting.gsc;
#include scripts/zm_common/zm_zonemgr.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_unitrigger.gsc;
#include scripts/zm_common/zm_sq.gsc;
#include scripts/zm_common/zm_item_pickup.gsc;
#include script_35598499769dbb3d;
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/animation_shared.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace zm_orange_ee_dynamite;

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0x304168e4, Offset: 0x3e0
// Size: 0xc4
function init() {
    clientfield::register("scriptmover", "" + #"dynamite_explosion_fx", 24000, 1, "counter");
    clientfield::register("actor", "" + #"hash_6adfdd12c9656e1c", 24000, 1, "int");
    clientfield::register("actor", "" + #"hash_147a734966a62e10", 24000, 1, "counter");
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0x6053bc63, Offset: 0x4b0
// Size: 0x4e4
function main() {
    level flag::init(#"hash_98e32feb5b8ac79");
    level flag::init(#"hash_16c15e4538336bb5");
    level.var_d867b9f3 = array(zm_crafting::get_component("zitem_orange_dynamite_bomb_part_1"), zm_crafting::get_component("zitem_orange_dynamite_bomb_part_2"), zm_crafting::get_component("zitem_orange_dynamite_bomb_part_3"));
    level.var_1daa43ee = 1;
    callback::function_74872db6(&function_74872db6);
    zm_items::function_4d230236(level.var_d867b9f3[0], &function_168f686b);
    zm_items::function_4d230236(level.var_d867b9f3[1], &function_168f686b);
    zm_items::function_4d230236(level.var_d867b9f3[2], &function_168f686b);
    zm_crafting::function_d1f16587(#"hash_2ca3c1e10bdf8cdb", &function_7056aa62);
    zm_crafting::function_d1f16587(#"hash_1255a9a8cf55727d", &function_7056aa62);
    function_e55e2a5e();
    level.var_518d6e34 = 0;
    level.var_37078af7 = 0;
    level.var_b3e4b8b8 = [];
    var_b3e4b8b8 = struct::get_array("dynamite_bomb_place");
    foreach (var_b2ec126b in var_b3e4b8b8) {
        if (!isdefined(level.var_b3e4b8b8[var_b2ec126b.script_int])) {
            level.var_b3e4b8b8[var_b2ec126b.script_int] = [];
        } else if (!isarray(level.var_b3e4b8b8[var_b2ec126b.script_int])) {
            level.var_b3e4b8b8[var_b2ec126b.script_int] = array(level.var_b3e4b8b8[var_b2ec126b.script_int]);
        }
        if (!isdefined(level.var_b3e4b8b8[var_b2ec126b.script_int])) {
            level.var_b3e4b8b8[var_b2ec126b.script_int] = [];
        } else if (!isarray(level.var_b3e4b8b8[var_b2ec126b.script_int])) {
            level.var_b3e4b8b8[var_b2ec126b.script_int] = array(level.var_b3e4b8b8[var_b2ec126b.script_int]);
        }
        level.var_b3e4b8b8[var_b2ec126b.script_int][level.var_b3e4b8b8[var_b2ec126b.script_int].size] = var_b2ec126b;
    }
    array::run_all(var_b3e4b8b8, &dynamite_bomb_place_init);
    if (zm_custom::function_901b751c(#"zmpowerdoorstate") == 2) {
        function_70f4c8c3("outer_walkway_blocker");
        function_70f4c8c3("sunken_path_blocker");
        function_70f4c8c3("cove_to_beach_blocker");
    } else {
        function_86270fbf("outer_walkway_blocker");
        function_86270fbf("sunken_path_blocker");
        function_86270fbf("cove_to_beach_blocker");
    }
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 1, eflags: 0x1 linked
// Checksum 0xe849d5b0, Offset: 0x9a0
// Size: 0xc0
function function_86270fbf(str_targetname) {
    a_e_blockers = getentarray(str_targetname, "targetname");
    foreach (e_blocker in a_e_blockers) {
        if (e_blocker.script_noteworthy === "clip") {
            e_blocker disconnectpaths();
        }
    }
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 1, eflags: 0x1 linked
// Checksum 0xda9f1f28, Offset: 0xa68
// Size: 0xf8
function function_70f4c8c3(str_targetname) {
    a_e_blockers = getentarray(str_targetname, "targetname");
    foreach (e_blocker in a_e_blockers) {
        if (e_blocker.script_noteworthy === "clip") {
            e_blocker connectpaths();
            e_blocker delete();
        } else {
            e_blocker setmodel("p8_zm_ora_dynamite_barrier_destroyed");
        }
    }
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0xb6f22ad0, Offset: 0xb68
// Size: 0x54
function function_74872db6() {
    if (level.round_number > 2) {
        callback::on_ai_spawned(&function_e3203a2);
        callback::function_50fdac80(&function_74872db6);
    }
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0x4b8cc761, Offset: 0xbc8
// Size: 0x36
function function_e55e2a5e() {
    level.var_1f17f9bb = array::randomize(level.var_d867b9f3);
    level.var_b4fe6eed = 1;
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 2, eflags: 0x1 linked
// Checksum 0x6592c3da, Offset: 0xc08
// Size: 0x204
function function_e93a8e82(v_pos, v_angles) {
    if (isdefined(v_pos) && !zm_utility::is_standard()) {
        v_drop = zm_hms_util::function_6d41bab8(v_pos, 360);
        if (isdefined(v_drop)) {
            v_ground = groundtrace(v_drop + vectorscale((0, 0, 1), 64) + vectorscale((0, 0, 1), 8), v_drop + vectorscale((0, 0, 1), 64) + vectorscale((0, 0, -1), 100000), 0, self)[#"position"];
            v_ground = v_ground + vectorscale((0, 0, 1), 36);
            w_part = level.var_1f17f9bb[0];
            if (isdefined(w_part)) {
                e_dynamite = util::spawn_model(w_part.worldmodel, v_ground);
                waitframe(1);
                s_unitrigger = e_dynamite zm_item_pickup::create_item_pickup(&function_ba26ccbb, &function_96b866fc, undefined, 96);
                e_dynamite.targetname = "dynamite_item_drop";
                e_dynamite.var_8691c7d4 = 1;
                e_dynamite.w_part = w_part;
                e_dynamite playloopsound(#"zmb_spawn_powerup_loop");
                e_dynamite thread zm_orange_challenges::function_f5f83516();
                zm_unitrigger::reregister_unitrigger_as_dynamic(s_unitrigger);
                return 1;
            }
        }
    }
    return 0;
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 2, eflags: 0x1 linked
// Checksum 0x7b855d8f, Offset: 0xe18
// Size: 0x34
function function_ba26ccbb(e_item, e_player) {
    e_player giveweapon(e_item.w_part);
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 2, eflags: 0x1 linked
// Checksum 0xdf1a7611, Offset: 0xe58
// Size: 0x13c
function function_168f686b(e_holder, w_item) {
    level endon(#"end_game");
    b_silent = 0;
    arrayremoveindex(level.var_1f17f9bb, 0);
    if (level.var_1f17f9bb.size > 0) {
        level.var_1daa43ee = 1;
    } else {
        b_silent = 1;
    }
    wait(1);
    if (b_silent) {
        zm_audio::function_6191af93(#"component_pickup", #"dynamite", #"component_pickup", #"silent", 100);
        zm_audio::function_6191af93(#"component_pickup", #"bomb_part", #"component_pickup", #"silent", 100);
    }
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 1, eflags: 0x1 linked
// Checksum 0x9c0667d7, Offset: 0xfa0
// Size: 0x60
function function_96b866fc(e_player) {
    str_hint = zm_utility::function_d6046228(#"hash_388256f1e5a62d7c", #"hash_7693de01f82d93f0");
    self sethintstring(str_hint);
    return 1;
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x5 linked
// Checksum 0xc292541e, Offset: 0x1008
// Size: 0x114
function private function_e3203a2() {
    self endon(#"death");
    if (level flag::get(#"hash_16c15e4538336bb5")) {
        return;
    }
    if (level.var_1daa43ee && self.archetype === #"zombie" && self.var_9fde8624 !== #"zombie_electric" && (math::cointoss(20) || level flag::get(#"hash_98e32feb5b8ac79"))) {
        while (!isdefined(self.spawn_pos)) {
            waitframe(1);
        }
        if (self.spawn_pos.zone_name !== "ice_floe") {
            self thread function_8427e524();
        }
    }
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0xd1f8b41e, Offset: 0x1128
// Size: 0x2b6
function function_8427e524() {
    self notify(#"dynamited");
    self thread zm_orange_util::function_865209df(#"dynamite_zombie", #"hash_c38f82bacfe540c");
    level.var_1daa43ee = 0;
    level flag::clear(#"hash_98e32feb5b8ac79");
    self.var_f3908ae9 = 1;
    self clientfield::set("" + #"hash_6adfdd12c9656e1c", 1);
    self function_4baeb885();
    self.ignoremelee = 1;
    self playloopsound(#"hash_494dd6f60ab1e3a8");
    self thread function_e58f823f();
    /#
        iprintln("<unknown string>");
    #/
    self waittill(#"death");
    if (isdefined(self)) {
        self clientfield::set("" + #"hash_6adfdd12c9656e1c", 0);
        if (self.water_damage === 1) {
            self.e_killer = isplayer(self.attacker) ? self.attacker : self.last_closest_player;
            self thread function_8f6cb08();
        } else {
            if (self.var_c39323b5 !== 1) {
                gibserverutils::annihilate(self);
                self clientfield::increment("" + #"hash_147a734966a62e10", 1);
                level function_d8f300c3(self.origin);
                playsoundatposition(#"hash_7b838586b7ef0d9d", self.origin);
            } else {
                level flag::set(#"hash_98e32feb5b8ac79");
            }
            level.var_1daa43ee = 1;
        }
    } else {
        level.var_1daa43ee = 1;
    }
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0x762bfb56, Offset: 0x13e8
// Size: 0x74
function function_4baeb885() {
    var_70b46d1c = "walk";
    if (self.zombie_move_speed == "sprint") {
        var_70b46d1c = "run";
    } else if (self.zombie_move_speed == "super_sprint") {
        var_70b46d1c = "sprint";
    }
    self zombie_utility::set_zombie_run_cycle_override_value(var_70b46d1c);
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0xe344fe3d, Offset: 0x1468
// Size: 0x94
function function_e58f823f() {
    self endon(#"death");
    while (1) {
        e_target = self.favoriteenemy;
        if (isdefined(e_target) && distancesquared(e_target.origin, self.origin) <= 64 * 64) {
            self thread function_87f8b232();
            break;
        }
        wait(0.1);
    }
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0x2f9fba64, Offset: 0x1508
// Size: 0x54
function function_87f8b232() {
    self endon(#"death");
    self animation::play("ai_t8_zm_base_zombie_dynamite_death");
    self.allowdeath = 1;
    self kill();
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 1, eflags: 0x1 linked
// Checksum 0x6fa372c7, Offset: 0x1568
// Size: 0xf4
function function_d8f300c3(v_pos) {
    a_e_zombies = zm_hms_util::function_795d5b4f(getaiteamarray(level.zombie_team), v_pos, 250);
    array::run_all(a_e_zombies, &dodamage, 500, v_pos, undefined, undefined, undefined, "MOD_EXPLOSIVE");
    a_e_players = zm_hms_util::function_795d5b4f(getplayers(), v_pos, 250);
    array::run_all(a_e_players, &dodamage, 50, v_pos, undefined, undefined, undefined, "MOD_EXPLOSIVE");
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0xb36bf0ae, Offset: 0x1668
// Size: 0xc2
function function_8f6cb08() {
    self endon(#"death");
    self waittill(#"cleanup_freezegun_triggers");
    b_spawned = level function_e93a8e82(self.origin, self.angles);
    if (level.var_b4fe6eed && b_spawned && isdefined(self.e_killer)) {
        self.e_killer thread zm_orange_util::function_51b752a9(#"hash_4c18ae1377d349ed");
        level.var_b4fe6eed = 0;
    }
    level.var_1daa43ee = !b_spawned;
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0xafe5d86d, Offset: 0x1738
// Size: 0x164
function function_7056aa62() {
    if (isdefined(self.stub) && isdefined(self.stub.blueprint)) {
        t_crafting = self.stub;
    } else if (isdefined(self.blueprint)) {
        t_crafting = self;
    }
    if (t_crafting.blueprint.name == #"zblueprint_orange_dynamite_bomb") {
        var_f2d24a17 = self.stub.var_4b9b60c7;
        var_f2d24a17 show();
        var_f2d24a17 zm_unitrigger::create(zm_utility::function_d6046228(#"hash_6eced05b46f243a8", #"hash_5402978e2dbb34e4"));
        var_f2d24a17 thread function_4c525901();
        zm_ui_inventory::function_7df6bb60("orange_dynamite_bomb_part_1_owned", 0);
        zm_ui_inventory::function_7df6bb60("orange_dynamite_bomb_part_2_owned", 0);
        zm_ui_inventory::function_7df6bb60("orange_dynamite_bomb_part_3_owned", 0);
        zm_ui_inventory::function_7df6bb60("dynamite_bomb_phase", 1);
    }
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0x68238a5e, Offset: 0x18a8
// Size: 0xec
function function_4c525901() {
    self endon(#"death");
    s_waitresult = undefined;
    s_waitresult = self waittill(#"trigger_activated");
    self playsound(#"hash_55c30dada4e624a2");
    s_waitresult.e_who zm_audio::create_and_play_dialog(#"explosive", #"pickup");
    level.var_518d6e34 = 1;
    zm_ui_inventory::function_7df6bb60("orange_dynamite_bomb_complete", 1);
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    self hide();
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0xf6a19f0f, Offset: 0x19a0
// Size: 0x3c
function dynamite_bomb_place_init() {
    self zm_unitrigger::create(&function_2a27ccb9);
    self thread function_170afe2c();
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 1, eflags: 0x1 linked
// Checksum 0xd206a0fa, Offset: 0x19e8
// Size: 0x74
function function_2a27ccb9(e_player) {
    if (level.var_518d6e34) {
        str_hint = zm_utility::function_d6046228(#"hash_619666ebfb26ad4", #"hash_cb4301a3d4b0ff8");
        self sethintstring(str_hint);
        return 1;
    }
    return 0;
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 1, eflags: 0x1 linked
// Checksum 0xfc2d337d, Offset: 0x1a68
// Size: 0x11e
function function_170afe2c(b_main_quest = 0) {
    level endon(#"end_game");
    s_result = undefined;
    s_result = self waittill(#"trigger_activated");
    function_6ecfea46();
    if (!b_main_quest) {
        self thread place_dynamite_bomb();
        s_result.e_who zm_audio::create_and_play_dialog(#"explosive", #"plant");
    } else {
        self thread function_2e1427a3();
    }
    level.var_518d6e34 = 0;
    zm_ui_inventory::function_7df6bb60("orange_dynamite_bomb_complete", 0);
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    self.s_unitrigger = undefined;
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0xd77c584f, Offset: 0x1b90
// Size: 0x1ec
function function_2e1427a3() {
    level endon(#"end_game");
    e_bomb = util::spawn_model("p8_zm_ora_dynamite_bundle", self.origin, self.angles);
    playsoundatposition(#"hash_34d44148875755b0", e_bomb.origin);
    e_bomb playloopsound(#"hash_3e8cb0a639b5a355");
    /#
        iprintln("<unknown string>");
    #/
    wait(1);
    /#
        iprintln("<unknown string>");
    #/
    wait(1);
    /#
        iprintln("<unknown string>");
    #/
    wait(1);
    e_bomb clientfield::increment("" + #"dynamite_explosion_fx", 1);
    level function_d8f300c3(self.origin);
    playsoundatposition(#"hash_2b694b905abf1892", e_bomb.origin);
    e_bomb playrumbleonentity("zm_orange_dynamite_bomb_explosion");
    wait(0.1);
    e_bomb hide();
    self notify(#"hash_126c823a82e09010");
    wait(2.5);
    e_bomb delete();
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0x8bec2020, Offset: 0x1d88
// Size: 0xd4
function place_dynamite_bomb() {
    self endon(#"death");
    var_b3e4b8b8 = level.var_b3e4b8b8[self.script_int];
    if (self.script_noteworthy === "linked") {
        array::thread_all(var_b3e4b8b8, &function_2e1427a3);
    } else {
        self thread function_2e1427a3();
    }
    array::run_all(var_b3e4b8b8, &zm_hms_util::function_7a5ba111);
    self waittill(#"hash_126c823a82e09010");
    level thread function_61511fcf(self.script_int);
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 1, eflags: 0x1 linked
// Checksum 0x117df6ae, Offset: 0x1e68
// Size: 0x10a
function function_61511fcf(n_index) {
    switch (n_index) {
    case 0:
        function_70f4c8c3("outer_walkway_blocker");
        level flag::set(#"hash_52d967f4fc8b12fc");
        break;
    case 1:
        function_70f4c8c3("sunken_path_blocker");
        level flag::set(#"hash_48e7d63b38c5e2da");
        break;
    case 2:
        function_70f4c8c3("cove_to_beach_blocker");
        level flag::set(#"hash_38c97197db36afb7");
        break;
    }
}

// Namespace zm_orange_ee_dynamite/zm_orange_ee_dynamite
// Params 0, eflags: 0x1 linked
// Checksum 0x37871ff9, Offset: 0x1f80
// Size: 0x274
function function_6ecfea46() {
    level.var_37078af7++;
    if (level.var_37078af7 < 4) {
        function_e55e2a5e();
        if (isarray(level.var_4fe2f84d[#"hash_1255a9a8cf55727d"])) {
            foreach (s_crafting in level.var_4fe2f84d[#"hash_1255a9a8cf55727d"]) {
                if (isdefined(s_crafting.blueprint) && s_crafting.blueprint.name === "zblueprint_orange_dynamite_bomb" && !(isdefined(s_crafting.registered) && s_crafting.registered)) {
                    s_crafting zm_crafting::reset_table();
                }
            }
        } else {
            foreach (s_crafting in level.var_4fe2f84d[#"hash_2ca3c1e10bdf8cdb"]) {
                if (isdefined(s_crafting.blueprint) && s_crafting.blueprint.name === "zblueprint_orange_dynamite_bomb" && !(isdefined(s_crafting.registered) && s_crafting.registered)) {
                    s_crafting zm_crafting::reset_table();
                }
            }
        }
        level.var_1daa43ee = 1;
        zm_ui_inventory::function_7df6bb60("dynamite_bomb_phase", 0);
    } else {
        callback::remove_on_ai_spawned(&function_e3203a2);
    }
}


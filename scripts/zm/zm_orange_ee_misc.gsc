#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\animation_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_orange_fasttravel_flinger;
#using scripts\zm\zm_orange_pablo;
#using scripts\zm\zm_orange_util;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here;
#using scripts\zm_common\bgbs\zm_bgb_nowhere_but_there;
#using scripts\zm_common\util\ai_dog_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_orange_ee_misc;

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x95cb50a2, Offset: 0x4e0
// Size: 0x84
function preload() {
    clientfield::register("toplayer", "" + #"hash_12114abc7407913b", 24000, 1, "counter");
    clientfield::register("toplayer", "" + #"hash_5e38e846ce88405b", 24000, 1, "counter");
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x6d3afbc2, Offset: 0x570
// Size: 0x5ac
function main() {
    level flag::init(#"trinkets_placed");
    level flag::init(#"trinket_round");
    level flag::init("ship_flinger_fixed");
    level flag::init("facility_flinger_fixed");
    level flag::init(#"edge_launched");
    level flag::init(#"edge_of_the_world_complete");
    zm_sq::register(#"hash_12114abc7407913b", #"step_1", #"hash_5986bb2ab1879d84", &function_30ed45c9, &function_960f84d7);
    zm_sq::register(#"hash_5e38e846ce88405b", #"step_1", #"hash_2572fbc6efde23a8", &function_48a634b7, &function_ee63b8a7);
    zm_sq::register(#"hash_729a1e4eb041be9b", #"step_1", #"trinket_quest", &trinket_quest, &trinket_quest_cleanup);
    zm_sq::register(#"edge_of_the_world", #"step_1", #"edge_quest", &edge_quest, &edge_quest_cleanup);
    zm_sq::register(#"edge_of_the_world", #"step_2", #"edge_quest", &function_8bc27fd3, &security_balcony_time_);
    level.var_4ac8ef63 = getent("edge_flinger_spot", "targetname");
    level flag::init(#"hash_72bd35eacb1940de");
    level flag::init(#"hash_59d5ba61f4b8f405");
    zm_sq::register(#"hash_66685502a7dee586", #"step_1", #"hash_66685502a7dee586", &function_a589e722, &function_239ae2e1);
    zm_sq::register(#"hash_3e4c279707a5abe5", #"step_1", #"hash_3e4c279707a5abe5", &function_594f2c26, &function_5c6d5a0e);
    zm_sq::start(#"hash_66685502a7dee586", !zm_utility::is_standard());
    zm_sq::start(#"hash_3e4c279707a5abe5", !zm_utility::is_standard());
    level flag::init(#"hash_431a5026505d71aa");
    function_779045();
    if (zm_utility::is_ee_enabled()) {
        zm_sq::start(#"edge_of_the_world");
        callback::on_spawned(&edge_watcher);
        level.var_5cfc800b = &function_fdc3c7c4;
    }
    level flag::wait_till(#"all_players_spawned");
    if (zm_utility::is_ee_enabled()) {
        zm_sq::start(#"hash_12114abc7407913b");
        zm_sq::start(#"hash_5e38e846ce88405b");
        zm_sq::start(#"hash_729a1e4eb041be9b");
        level thread function_716974ba();
        level thread sq_glasses();
        level thread function_7836d215();
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xbb509044, Offset: 0xb28
// Size: 0x1ba
function function_779045() {
    level.var_d2ed4be7 = array(#"zombie");
    level.a_e_trinkets = getentarray("sq_trinket", "targetname");
    level.a_e_trinkets = array::sort_by_script_int(level.a_e_trinkets, 1);
    level.var_b4b3ecd1 = struct::get("sq_trinket_shrine", "targetname");
    level.var_b4b3ecd1.n_collected = 0;
    level.var_b4b3ecd1.a_e_trinkets = getentarray("sq_trinket_placed", "targetname");
    level.var_b4b3ecd1.a_e_trinkets = array::sort_by_script_int(level.var_b4b3ecd1.a_e_trinkets, 1);
    foreach (e_trinket in level.var_b4b3ecd1.a_e_trinkets) {
        e_trinket hide();
        e_trinket.b_pickedup = 0;
        e_trinket.b_placed = 0;
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x0
// Checksum 0x82878b4e, Offset: 0xcf0
// Size: 0x10c
function trinket_quest(var_a276c861) {
    level.var_b4b3ecd1 zm_unitrigger::create("", 64);
    level.var_b4b3ecd1 thread function_abf8d5ce();
    foreach (e_trinket in level.a_e_trinkets) {
        e_trinket zm_unitrigger::create("", 64);
        e_trinket thread trinket_think();
    }
    level flag::wait_till(#"trinkets_placed");
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xb12ce3c3, Offset: 0xe08
// Size: 0x1e4
function trinket_think() {
    level endon(#"end_game", #"hell_on_earth", #"hash_198bc172b5af7f25", #"trinkets_placed");
    self endon(#"death");
    pap_lock = undefined;
    foreach (pap in level.var_4d8e32c8) {
        if (pap.script_noteworthy === self.script_noteworthy) {
            pap_lock = pap;
        }
    }
    while (true) {
        s_notify = self waittill(#"trigger_activated");
        e_who = s_notify.e_who;
        if (pap_lock flag::get("Pack_A_Punch_on")) {
            level.var_b4b3ecd1.a_e_trinkets[self.script_int].b_pickedup = 1;
            self playsound("zmb_trinket_pickup");
            e_who playrumbleonentity("zm_office_drawer_rumble");
            self hide();
            return;
        }
        waitframe(1);
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xed0f26d5, Offset: 0xff8
// Size: 0x1a8
function function_abf8d5ce() {
    level endon(#"end_game", #"hell_on_earth", #"trinkets_placed", #"hash_198bc172b5af7f25");
    while (true) {
        s_notify = self waittill(#"trigger_activated");
        e_who = s_notify.e_who;
        for (i = 0; i < self.a_e_trinkets.size; i++) {
            if (self.a_e_trinkets[i].b_pickedup === 1 && self.a_e_trinkets[i].b_placed === 0) {
                self.a_e_trinkets[i] show();
                self.a_e_trinkets[i].b_placed = 1;
                self.n_collected++;
            }
            self.a_e_trinkets[0] playsound("zmb_trinket_drop");
            e_who playrumbleonentity("zm_office_drawer_rumble");
        }
        if (self.n_collected >= 5) {
            level flag::set(#"trinkets_placed");
        }
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 2, eflags: 0x0
// Checksum 0x7dd2e890, Offset: 0x11a8
// Size: 0x1dc
function trinket_quest_cleanup(var_a276c861, var_19e802fa) {
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x38>");
                println("<dev string:x38>");
            }
        }
    #/
    if (var_a276c861) {
        foreach (e_trinket in level.a_e_trinkets) {
            e_trinket hide();
        }
        foreach (e_trinket in level.var_b4b3ecd1.a_e_trinkets) {
            e_trinket show();
            e_trinket.b_pickedup = 1;
            e_trinket.b_placed = 1;
        }
        level flag::set(#"trinkets_placed");
    }
    function_a4e86068();
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x28ea0bf4, Offset: 0x1390
// Size: 0x1bc
function function_a4e86068() {
    n_next_round = level.round_number + 1;
    b_delayed = 0;
    do {
        if (false) {
            b_delayed = 1;
            wait 1;
            continue;
        }
        n_next_round = level.round_number + 1;
        b_delayed = 0;
    } while (b_delayed);
    var_898a45da = level.var_45827161[n_next_round];
    if (isdefined(var_898a45da)) {
        zm_round_spawning::function_43aed0ca(n_next_round);
    }
    level.zombie_round_start_delay = 0;
    zm_round_spawning::function_b4a8f95a(#"zombie_electric", n_next_round, &function_a092874, &function_a1b4b25d, &function_c83f59db, &function_5bfaa04, 0);
    if (zm_round_spawning::function_40229072(level.round_number) && !level flag::get("special_round")) {
        level waittill(#"special_round");
    } else if (!level flag::get("begin_spawning")) {
        level waittill(#"begin_spawning");
    }
    zm_hms_util::function_2ba419ee(0);
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x8c53ae75, Offset: 0x1558
// Size: 0xfc
function function_a092874() {
    level flag::set(#"trinket_round");
    if (level.round_number < 25) {
        level.var_1c921b2b = 29 - level.round_number;
    } else if (level.round_number < 60) {
        level.var_1c921b2b = 59 - level.round_number;
    } else {
        level.var_1c921b2b = 0;
    }
    level.var_c03f9529 = 1;
    callback::on_laststand(&function_500dfb49);
    zm_round_spawning::function_5bc2cea1(&zombie_dog_util::function_ed67c5e7);
    level thread zm_audio::sndmusicsystem_playstate("dog_start");
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x328c8f33, Offset: 0x1660
// Size: 0x6
function trinket_cleanup() {
    return false;
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xbe4af8c2, Offset: 0x1670
// Size: 0x4c
function function_500dfb49() {
    a_players = getplayers();
    if (a_players.size < 2) {
        level.var_c03f9529 = 0;
        zm_hms_util::function_2ba419ee();
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x0
// Checksum 0xd404fc0c, Offset: 0x16c8
// Size: 0xdc
function function_a1b4b25d(var_d25bbdd5) {
    level flag::clear(#"trinket_round");
    level.var_1c921b2b = 0;
    if (isdefined(level.var_c03f9529) && level.var_c03f9529) {
        level thread function_8b0417eb();
    }
    callback::remove_on_laststand(&function_500dfb49);
    zm_round_spawning::function_df803678(&zombie_dog_util::function_ed67c5e7);
    level thread zm_audio::sndmusicsystem_playstate("dog_end");
    level.zombie_round_start_delay = undefined;
    wait 5;
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xbc2bb045, Offset: 0x17b0
// Size: 0xae
function function_c83f59db() {
    a_e_players = getplayers();
    n_max = 10;
    switch (a_e_players.size) {
    case 1:
        n_max = 60;
        break;
    case 2:
        n_max = 90;
        break;
    case 3:
    case 4:
        n_max = 120;
        break;
    }
    return n_max;
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xec50bb45, Offset: 0x1868
// Size: 0x3c
function function_5bfaa04() {
    n_time = zm_round_logic::get_zombie_spawn_delay(level.round_number + level.var_1c921b2b);
    wait n_time;
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xaf8d0bd0, Offset: 0x18b0
// Size: 0x74
function function_8b0417eb() {
    if (!zm_utility::is_standard()) {
        drop_point = level.var_b4b3ecd1.origin - (0, 0, 20);
        level thread zm_powerups::specific_powerup_drop("free_perk", drop_point, undefined, 0.1, undefined, 1);
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x0
// Checksum 0x7dabfac1, Offset: 0x1930
// Size: 0x4c
function function_9e857126(params) {
    if (zombie_utility::get_current_zombie_count() == 1 && level.zombie_total == 0) {
        self thread function_8b0417eb();
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x225dc88d, Offset: 0x1988
// Size: 0x64
function sq_glasses() {
    s_glasses = struct::get("sq_glasses", "targetname");
    s_glasses zm_unitrigger::create("", 32);
    s_glasses function_ea04cfd2();
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x554cff34, Offset: 0x19f8
// Size: 0x100
function function_ea04cfd2() {
    level endon(#"end_game");
    while (true) {
        s_notify = self waittill(#"trigger_activated");
        player = s_notify.e_who;
        if (!(isdefined(player.var_456e7962) && player.var_456e7962)) {
            player zm_score::add_to_player_score(500, 1, "bonus_points_powerup_shared");
            player.var_456e7962 = 1;
            player playsoundtoplayer(#"zmb_cha_ching", player);
            player thread zm_orange_util::function_51b752a9("vox_romero_glasses", -1, 0, 0);
        }
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x0
// Checksum 0xc9ed6278, Offset: 0x1b00
// Size: 0x1c4
function function_a589e722(var_5ea5c94d) {
    level endon(#"end_game");
    if (!var_5ea5c94d) {
        level waittill(#"power_on2");
        gearbox = struct::get("sq_flinger_boat", "targetname");
        gearbox zm_unitrigger::create(&function_301c7dca);
        gearbox.b_picked_up = 0;
        gearbox function_a2993671();
        gearbox.b_picked_up = undefined;
        zm_orange_pablo::register_drop_off(13, #"hash_15b81856e839fed9", #"hash_eb543cd4ec82ae7", &function_bfb15d08);
        zm_orange_pablo::function_d83490c5(13);
        level waittill(#"hash_50e54529f8a671a1");
        zm_orange_pablo::function_3f9e02b8(5, #"hash_4ed14fd62a0c189c", #"hash_b9eef4c2cef38d0", &function_130c65ff);
        zm_orange_pablo::function_d83490c5(5);
        level waittill(#"hash_3cbe96c6150e208c");
        gearbox.b_picked_up = 1;
        gearbox.var_db053a52 = 1;
        gearbox function_1856c416();
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 2, eflags: 0x0
// Checksum 0x3ad2d803, Offset: 0x1cd0
// Size: 0x44
function function_239ae2e1(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
    }
    level flag::set("ship_flinger_fixed");
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x71ca37bb, Offset: 0x1d20
// Size: 0xf0
function function_bfb15d08() {
    zm_ui_inventory::function_7df6bb60("flinger_gear_box_1", 0);
    zm_orange_pablo::function_b9e15919(1);
    level flag::set(#"hash_59d5ba61f4b8f405");
    wait 15;
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x4f>");
                println("<dev string:x4f>");
            }
        }
    #/
    level notify(#"hash_50e54529f8a671a1");
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x801f2e1b, Offset: 0x1e18
// Size: 0x68
function function_130c65ff() {
    zm_ui_inventory::function_7df6bb60("flinger_gear_box_1", 2);
    level.pablo_npc.var_cb3ed98f[4].var_e7b75754 = #"";
    level notify(#"hash_3cbe96c6150e208c");
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x0
// Checksum 0x508453c6, Offset: 0x1e88
// Size: 0x132
function function_301c7dca(player) {
    if (isdefined(self.stub.related_parent.b_picked_up) && self.stub.related_parent.b_picked_up) {
        str_hint = zm_utility::function_d6046228(#"hash_15b81856e839fed9", #"hash_eb543cd4ec82ae7");
        self sethintstring(str_hint);
        return 1;
    }
    if (isdefined(self.stub.related_parent.b_picked_up) && !self.stub.related_parent.b_picked_up) {
        str_hint = zm_utility::function_d6046228(#"hash_4ed14fd62a0c189c", #"hash_b9eef4c2cef38d0");
        self sethintstring(str_hint);
        return 1;
    }
    return 0;
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x447e37ac, Offset: 0x1fc8
// Size: 0x154
function function_a2993671() {
    s_notify = self waittill(#"trigger_activated");
    player = s_notify.e_who;
    playsoundatposition(#"hash_20807cb66d31146e", self.origin);
    flinger = struct::get(self.target, "targetname");
    flinger zm_orange_fasttravel_flinger::function_60325438(0);
    if (!level flag::get(#"hash_72bd35eacb1940de")) {
        level flag::set(#"hash_72bd35eacb1940de");
        player thread zm_orange_util::function_51b752a9("vox_gear_box_pickup", -1, 0, 1);
        zm_ui_inventory::function_7df6bb60("flinger_gear_box_1", 1);
        return;
    }
    zm_ui_inventory::function_7df6bb60("flinger_gear_box_2", 1);
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x881a0991, Offset: 0x2128
// Size: 0x13c
function function_1856c416() {
    s_notify = self waittill(#"trigger_activated");
    player = s_notify.e_who;
    playsoundatposition(#"hash_30a5ec16dcd18c49", self.origin);
    flinger = struct::get(self.target, "targetname");
    flinger zm_orange_fasttravel_flinger::function_60325438(1);
    player thread zm_orange_util::function_51b752a9("vox_generic_responses_positive", -1, 0, 0);
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    if (self.var_db053a52 === 1) {
        zm_ui_inventory::function_7df6bb60("flinger_gear_box_1", 0);
        return;
    }
    zm_ui_inventory::function_7df6bb60("flinger_gear_box_2", 0);
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x0
// Checksum 0xc0d8eed8, Offset: 0x2270
// Size: 0x1c4
function function_594f2c26(var_5ea5c94d) {
    level endon(#"end_game");
    if (!var_5ea5c94d) {
        level waittill(#"power_on3");
        gearbox = struct::get("sq_flinger_facility", "targetname");
        gearbox zm_unitrigger::create(&function_ab759b3a);
        gearbox.b_picked_up = 0;
        gearbox function_a2993671();
        gearbox.b_picked_up = undefined;
        zm_orange_pablo::register_drop_off(14, #"hash_494d7fc0d10e2ff6", #"hash_9af968cebf182d2", &function_b37bdeb4);
        zm_orange_pablo::function_d83490c5(14);
        level waittill(#"hash_3070e882982e5a46");
        zm_orange_pablo::function_3f9e02b8(4, #"hash_3b3769bc56dab413", #"hash_28eeceb083aa7339", &function_7619040c);
        zm_orange_pablo::function_d83490c5(4);
        level waittill(#"hash_3b6b392c9f59fe4b");
        gearbox.b_picked_up = 1;
        gearbox.var_cbf64bca = 1;
        gearbox function_1856c416();
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 2, eflags: 0x0
// Checksum 0xe17527de, Offset: 0x2440
// Size: 0x44
function function_5c6d5a0e(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
    }
    level flag::set("facility_flinger_fixed");
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x1f540b89, Offset: 0x2490
// Size: 0xf0
function function_b37bdeb4() {
    zm_ui_inventory::function_7df6bb60("flinger_gear_box_2", 0);
    zm_orange_pablo::function_b9e15919(1);
    level flag::set(#"hash_59d5ba61f4b8f405");
    wait 15;
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x64>");
                println("<dev string:x64>");
            }
        }
    #/
    level notify(#"hash_3070e882982e5a46");
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x3f51f197, Offset: 0x2588
// Size: 0x68
function function_7619040c() {
    zm_ui_inventory::function_7df6bb60("flinger_gear_box_2", 2);
    level.pablo_npc.var_cb3ed98f[5].var_e7b75754 = #"";
    level notify(#"hash_3b6b392c9f59fe4b");
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x0
// Checksum 0x5b2fa12a, Offset: 0x25f8
// Size: 0x11a
function function_ab759b3a(player) {
    if (isdefined(self.stub.related_parent.b_picked_up) && self.stub.related_parent.b_picked_up) {
        self sethintstring(zm_utility::function_d6046228(#"hash_494d7fc0d10e2ff6", #"hash_9af968cebf182d2"));
        return 1;
    }
    if (isdefined(self.stub.related_parent.b_picked_up) && !self.stub.related_parent.b_picked_up) {
        self sethintstring(zm_utility::function_d6046228(#"hash_3b3769bc56dab413", #"hash_28eeceb083aa7339"));
        return 1;
    }
    return 0;
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x9c755a94, Offset: 0x2720
// Size: 0x1fa
function function_716974ba() {
    a_e_cotd = getentarray("cotd_weapon", "targetname");
    foreach (e_weapon in a_e_cotd) {
        unitrigger_stub = spawnstruct();
        unitrigger_stub.related_parent = e_weapon;
        unitrigger_stub.origin = e_weapon.origin;
        unitrigger_stub.angles = e_weapon.angles;
        unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
        unitrigger_stub.cursor_hint = "HINT_NOICON";
        unitrigger_stub.script_width = 64;
        unitrigger_stub.script_height = 64;
        unitrigger_stub.script_length = 64;
        unitrigger_stub.require_look_at = 0;
        unitrigger_stub.targetname = "cotd_unitrigger";
        unitrigger_stub.hint_string = undefined;
        unitrigger_stub.hint_parm1 = undefined;
        unitrigger_stub.hint_parm2 = undefined;
        unitrigger_stub.e_model = e_weapon;
        unitrigger_stub.e_model playloopsound(#"hash_13707a3a16b15f48");
        zm_unitrigger::register_static_unitrigger(unitrigger_stub, &function_6ad0e23f);
        e_weapon.unitrigger_stub = unitrigger_stub;
    }
    level.meteor_counter = 0;
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x6042b573, Offset: 0x2928
// Size: 0x25c
function function_6ad0e23f() {
    self endon(#"death");
    waitresult = self waittill(#"trigger");
    player = waitresult.activator;
    self.stub.e_model stoploopsound();
    self.stub.e_model playsound(#"hash_2c5f0a10ddf9dfa5");
    level.meteor_counter++;
    if (level.meteor_counter == 3) {
        if (level.musicsystem.currentplaytype < 4) {
            level thread zm_audio::sndmusicsystem_stopandflush();
            waitframe(1);
            level thread zm_audio::sndmusicsystem_playstate("ee_song_main");
        }
        /#
            if (getdvarint(#"zm_debug_ee", 0)) {
                if (getdvarint(#"zm_debug_ee", 0)) {
                    iprintlnbold("<dev string:x7d>");
                    println("<dev string:x7d>");
                }
            }
        #/
    } else {
        /#
            if (getdvarint(#"zm_debug_ee", 0)) {
                if (getdvarint(#"zm_debug_ee", 0)) {
                    iprintlnbold("<dev string:xb2>" + level.meteor_counter + "<dev string:xbc>");
                    println("<dev string:xb2>" + level.meteor_counter + "<dev string:xbc>");
                }
            }
        #/
    }
    zm_unitrigger::unregister_unitrigger(self.stub);
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x284856bd, Offset: 0x2b90
// Size: 0x34
function on_player_connect() {
    self thread function_dbb49281();
    self thread function_b6b24d3a();
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x0
// Checksum 0xe865c188, Offset: 0x2bd0
// Size: 0xac
function function_30ed45c9(var_a276c861) {
    foreach (player in level.players) {
        player thread function_dbb49281();
    }
    callback::on_connect(&on_player_connect);
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x577e0a4e, Offset: 0x2c88
// Size: 0x258
function function_dbb49281() {
    self notify(#"hash_2ca5123c06ec42f0");
    self endon(#"disconnect", #"hash_2ca5123c06ec42f0");
    b_saw_the_wth = 0;
    var_616e76c5 = struct::get("sq_scare_lighthouse", "targetname");
    while (!b_saw_the_wth) {
        n_time = 0;
        while (self adsbuttonpressed() && n_time < 30) {
            n_time++;
            waitframe(1);
        }
        if (n_time >= 30 && self adsbuttonpressed() && (self zm_zonemgr::entity_in_zone("main_entrance") || self zm_zonemgr::entity_in_zone("outer_walkway") || self zm_zonemgr::entity_in_zone("loading_platform")) && is_weapon_sniper(self getcurrentweapon()) && self zm_utility::is_player_looking_at(var_616e76c5.origin, 0.9975, 0, self)) {
            self zm_utility::do_player_general_vox("general", "scare_react", undefined, 100);
            self clientfield::increment_to_player("" + #"hash_12114abc7407913b", 1);
            j_time = 0;
            while (self adsbuttonpressed() && j_time < 5) {
                j_time++;
                waitframe(1);
            }
            b_saw_the_wth = 1;
        }
        waitframe(1);
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 2, eflags: 0x0
// Checksum 0x4bdbe9cc, Offset: 0x2ee8
// Size: 0x14
function function_960f84d7(var_a276c861, var_19e802fa) {
    
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x0
// Checksum 0x8d7a044e, Offset: 0x2f08
// Size: 0xac
function function_48a634b7(var_a276c861) {
    foreach (player in level.players) {
        player thread function_b6b24d3a();
    }
    callback::on_connect(&on_player_connect);
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xb3a00a7c, Offset: 0x2fc0
// Size: 0x256
function function_b6b24d3a() {
    self notify(#"hash_7bbb3fe051fd6c74");
    self endon(#"disconnect", #"hash_7bbb3fe051fd6c74");
    var_11dc5e9d = 144;
    b_saw_the_wth = 0;
    var_616e76c5 = struct::get("sq_scare_note", "targetname");
    while (!b_saw_the_wth) {
        n_time = 0;
        while (self zm_utility::is_player_looking_at(var_616e76c5.origin, 0.9975, 0, self) && distance(self.origin, var_616e76c5.origin) <= var_11dc5e9d && self getstance() === "crouch" && n_time < 30) {
            n_time++;
            waitframe(1);
        }
        if (n_time >= 30 && distance(self.origin, var_616e76c5.origin) <= var_11dc5e9d && self zm_zonemgr::entity_in_zone("forecastle") && self zm_utility::is_player_looking_at(var_616e76c5.origin, 0.9975, 0, self) && self getstance() === "crouch") {
            self zm_utility::do_player_general_vox("general", "scare_react", undefined, 100);
            self clientfield::increment_to_player("" + #"hash_5e38e846ce88405b", 1);
            b_saw_the_wth = 1;
        }
        waitframe(1);
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 2, eflags: 0x0
// Checksum 0x97ea8de, Offset: 0x3220
// Size: 0x14
function function_ee63b8a7(var_a276c861, var_19e802fa) {
    
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x4
// Checksum 0xc9ff08e9, Offset: 0x3240
// Size: 0xf8
function private is_weapon_sniper(w_weapon) {
    if (isdefined(w_weapon.issniperweapon) && w_weapon.issniperweapon || w_weapon.name === #"ww_tesla_sniper_t8" || w_weapon.name === #"ww_tesla_sniper_upgraded_t8") {
        if (weaponhasattachment(w_weapon, "elo") || weaponhasattachment(w_weapon, "reflex") || weaponhasattachment(w_weapon, "holo") || weaponhasattachment(w_weapon, "is")) {
            return false;
        } else {
            return true;
        }
    }
    return false;
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x0
// Checksum 0xeaa266c2, Offset: 0x3340
// Size: 0x34
function edge_quest(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level flag::wait_till(#"edge_launched");
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 2, eflags: 0x0
// Checksum 0x29376674, Offset: 0x3380
// Size: 0xb4
function edge_quest_cleanup(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        s_pos = struct::get("ee_edge_teleport", "targetname");
        a_e_players = getplayers();
        a_e_players[0] setorigin(s_pos.origin);
        a_e_players[0] setplayerangles(s_pos.angles);
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xc11dfeca, Offset: 0x3440
// Size: 0x1e6
function edge_watcher() {
    level endon(#"end_game");
    self endon(#"death");
    level flag::wait_till("facility_flinger_fixed");
    while (!level flag::get(#"edge_launched")) {
        if (self istouching(level.var_4ac8ef63) && !(isdefined(level.var_4ac8ef63.b_claimed) && level.var_4ac8ef63.b_claimed)) {
            level.var_4ac8ef63.b_claimed = 1;
            wait 0.5;
            self thread function_bc1ff036();
            while (self istouching(level.var_4ac8ef63)) {
                var_68460903 = self getnormalizedcameramovement();
                /#
                #/
                if (abs(var_68460903[1]) < 0.9 || self getstance() != "crouch") {
                    level.var_4ac8ef63.b_claimed = 0;
                    wait 3;
                    self thread edge_watcher();
                    return;
                }
                waitframe(1);
            }
            level.var_4ac8ef63.b_claimed = 0;
            wait 3;
        }
        waitframe(1);
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xe48a0960, Offset: 0x3630
// Size: 0x5a
function function_bc1ff036() {
    level endon(#"end_game");
    self endon(#"death");
    wait 2.4;
    if (level.var_4ac8ef63.b_claimed) {
        self.var_e5340f3e = 1;
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 1, eflags: 0x0
// Checksum 0x5454665a, Offset: 0x3698
// Size: 0x188
function function_8bc27fd3(var_5ea5c94d) {
    level endon(#"end_game", #"hell_on_earth", #"hash_198bc172b5af7f25");
    if (!var_5ea5c94d) {
        if (getplayers().size == 1) {
            zm_hms_util::pause_zombies(1, 0);
        }
        edge_volume = getent("edge_of_the_world", "targetname");
        while (true) {
            foreach (player in getplayers()) {
                if (player istouching(edge_volume)) {
                    level.edge_player = player;
                    level notify(#"edge_reached");
                    level.edge_player thread edge_exit_watcher();
                    return;
                }
            }
            wait 1;
        }
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 2, eflags: 0x0
// Checksum 0x2085ba10, Offset: 0x3828
// Size: 0xd0
function security_balcony_time_(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
    }
    level flag::set(#"edge_of_the_world_complete");
    s_exit = struct::get("edge_exit", "targetname");
    player = s_exit zm_unitrigger::function_fac87205(zm_utility::function_d6046228(#"hash_2f168c7542029caa", #"hash_71bb91d3e3e956ee"));
    player notify(#"edge_exit");
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xcdacd6a6, Offset: 0x3900
// Size: 0x194
function function_1b0e51b5() {
    level endon(#"end_game", #"edge_reached");
    edge_life_brush = getent("edge_life_brush", "targetname");
    s_notify = self waittilltimeout(160, #"entering_last_stand");
    if (isalive(self) && (self zm_zonemgr::is_player_in_zone(array("edge")) || self istouching(edge_life_brush))) {
        if (self isusingoffhand()) {
            self forceoffhandend();
        }
        self notify(#"hash_53bfad7081c69dee");
        self zm_bgb_anywhere_but_here::activation(0);
        if (getplayers().size == 1) {
            zm_hms_util::pause_zombies(0);
        }
        self.var_cdce7ec = 0;
        self val::reset(#"edge_of_the_world", "ignoreme");
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0xa80d0fb5, Offset: 0x3aa0
// Size: 0x1d4
function edge_exit_watcher() {
    level endon(#"end_game");
    edge_life_brush = getent("edge_life_brush", "targetname");
    s_notify = self waittilltimeout(120, #"entering_last_stand", #"edge_exit");
    if (isalive(self) && (self zm_zonemgr::is_player_in_zone(array("edge")) || self istouching(edge_life_brush))) {
        self thread lui::screen_flash(3, 1, 0.5, 1, "white");
        wait 3.5;
        if (self isusingoffhand()) {
            self forceoffhandend();
        }
        self notify(#"hash_53bfad7081c69dee");
        self zm_bgb_anywhere_but_here::activation(0);
        if (getplayers().size == 1) {
            zm_hms_util::pause_zombies(0);
        }
        self.var_cdce7ec = 0;
        self val::reset(#"edge_of_the_world", "ignoreme");
    }
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x5f36f68b, Offset: 0x3c80
// Size: 0x222
function function_fdc3c7c4() {
    var_fded3d81 = [];
    foreach (player in level.activeplayers) {
        if (zm_bgb_nowhere_but_there::is_valid_target(player) && !(isdefined(player.var_cdce7ec) && player.var_cdce7ec)) {
            if (!isdefined(var_fded3d81)) {
                var_fded3d81 = [];
            } else if (!isarray(var_fded3d81)) {
                var_fded3d81 = array(var_fded3d81);
            }
            var_fded3d81[var_fded3d81.size] = player;
        }
    }
    if (var_fded3d81.size) {
        arraysortclosest(var_fded3d81, self.origin);
        var_fded3d81 = array::reverse(var_fded3d81);
    } else {
        if (!isdefined(var_fded3d81)) {
            var_fded3d81 = [];
        } else if (!isarray(var_fded3d81)) {
            var_fded3d81 = array(var_fded3d81);
        }
        var_fded3d81[var_fded3d81.size] = self;
    }
    foreach (player in var_fded3d81) {
        s_player_respawn = self zm_bgb_nowhere_but_there::get_best_spawnpoint(player);
        if (isdefined(s_player_respawn)) {
            return s_player_respawn;
        }
    }
    return undefined;
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x99a08a73, Offset: 0x3eb0
// Size: 0x144
function function_7836d215() {
    s_location = struct::spawn((-528, 1196, 320));
    s_unitrigger = s_location zm_unitrigger::create("", 32);
    s_location thread function_cabcfdd2();
    waitresult = level flag::wait_till_any(array(#"hash_778a2b8282d704f", #"hash_431a5026505d71aa"));
    if (waitresult._notify === #"hash_431a5026505d71aa") {
        if (level.musicsystem.currentplaytype < 4) {
            level thread zm_audio::sndmusicsystem_stopandflush();
            waitframe(1);
            level thread zm_audio::sndmusicsystem_playstate("ee_song_2");
        }
    }
    s_location zm_unitrigger::unregister_unitrigger(s_unitrigger);
}

// Namespace zm_orange_ee_misc/zm_orange_ee_misc
// Params 0, eflags: 0x0
// Checksum 0x7798cba4, Offset: 0x4000
// Size: 0xf8
function function_cabcfdd2() {
    level endon(#"hash_778a2b8282d704f");
    level endon(#"hash_431a5026505d71aa");
    var_b3ee22cc = 0;
    while (true) {
        self waittill(#"trigger_activated");
        var_b3ee22cc++;
        playsoundatposition(#"hash_71d9e237e73ab437", self.origin);
        wait 0.5;
        if (var_b3ee22cc >= 3) {
            playsoundatposition(#"hash_4d9caefa6e6dd2e7", self.origin);
            wait 3;
            level flag::set(#"hash_431a5026505d71aa");
        }
    }
}


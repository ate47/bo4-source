#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_orange;
#using scripts\zm\zm_orange_mq_hell;
#using scripts\zm\zm_orange_mq_mgr;
#using scripts\zm\zm_orange_pablo;
#using scripts\zm\zm_orange_util;
#using scripts\zm_common\zm_item_pickup;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_orange_mq_sendoff;

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 0, eflags: 0x0
// Checksum 0x313e7c65, Offset: 0x240
// Size: 0x44
function preload() {
    clientfield::register("vehicle", "" + #"wisp_fx", 24000, 1, "int");
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 0, eflags: 0x0
// Checksum 0xffa468ef, Offset: 0x290
// Size: 0x64
function init() {
    level flag::init(#"hash_2c3411c8b8b421d8");
    zm_orange_pablo::register_drop_off(16, #"hash_18dcf44bdd7a747c", #"hash_459899940f28d8f0", &function_b5f900c3);
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 1, eflags: 0x0
// Checksum 0x9ff08d77, Offset: 0x300
// Size: 0x174
function function_5309464a(var_5ea5c94d) {
    zm_ui_inventory::function_7df6bb60(#"zm_orange_objective_progress", 11);
    level.var_80c25d0a = 115;
    if (isdefined(level.chests)) {
        zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_on", 0);
        level notify(#"fire_sale_off");
        foreach (chest in level.chests) {
            chest zm_magicbox::hide_chest(0);
        }
        zm_orange::function_2336a7c8();
    }
    if (!var_5ea5c94d) {
        level thread function_39c9e020();
        zm_orange_pablo::function_d83490c5(16);
        level flag::wait_till(#"hash_2c3411c8b8b421d8");
    }
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 2, eflags: 0x0
// Checksum 0x26797bc7, Offset: 0x480
// Size: 0x1c
function function_ae270d9e(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d) {
    }
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 0, eflags: 0x0
// Checksum 0x9722becc, Offset: 0x4a8
// Size: 0x4c
function function_b5f900c3() {
    /#
        iprintlnbold("<dev string:x38>");
    #/
    level notify(#"sendoff_started");
    level thread sun_deck_watcher();
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 0, eflags: 0x0
// Checksum 0x8ad33e28, Offset: 0x500
// Size: 0x1ec
function function_39c9e020() {
    level endon(#"end_game");
    a_str_zones = array("main_entrance", "loading_platform");
    while (true) {
        if (zm_hms_util::any_player_in_zone(a_str_zones)) {
            break;
        }
        wait 1;
    }
    a_e_players = [];
    foreach (e_player in getplayers()) {
        str_zone = e_player zm_zonemgr::get_player_zone();
        if (str_zone === "main_entrance" || str_zone === "loading_platform") {
            if (!isdefined(a_e_players)) {
                a_e_players = [];
            } else if (!isarray(a_e_players)) {
                a_e_players = array(a_e_players);
            }
            a_e_players[a_e_players.size] = e_player;
        }
    }
    if (a_e_players.size > 0) {
        e_player = array::random(a_e_players);
        e_player thread zm_orange_util::function_51b752a9(#"hash_ebd07fabb769017");
        return;
    }
    level thread zm_orange_util::function_fd24e47f(#"hash_ebd07fabb769017");
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 0, eflags: 0x0
// Checksum 0x9464413d, Offset: 0x6f8
// Size: 0x64
function sun_deck_watcher() {
    level endon(#"end_game");
    while (true) {
        if (zm_hms_util::any_player_in_zone("sun_deck")) {
            break;
        }
        wait 0.1;
    }
    level thread function_d096f18f();
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 0, eflags: 0x0
// Checksum 0x53386672, Offset: 0x768
// Size: 0x43c
function function_d096f18f() {
    level.var_ab11c23d notify(#"hash_78fc5bbd712046b0");
    level.var_ab11c23d rotateto((10, level.var_ab11c23d.angles[1] - 5, 0), 0.2);
    level.var_ab11c23d waittill(#"rotatedone");
    level.var_ab11c23d rotatevelocity((0, -1440, 0), 4.5, 3);
    level thread function_39d9b290();
    exploder::exploder("fxexp_portal_115_start");
    wait 5;
    level.var_ab11c23d rotateto((-90, level.var_ab11c23d.angles[1], 0), 0.2);
    level zm_orange_util::function_fd24e47f(#"hash_1003004a8ca44bb3", -1, 1);
    var_6df66af8 = float(soundgetplaybacktime(#"hash_2e5e53739622d4e5")) / 1000;
    s_start = struct::get("pablo_rise_start");
    level.npc_pablo setblackboardattribute("_stance", "swim");
    e_mover = util::spawn_model("tag_origin", level.npc_pablo.origin);
    e_orb = util::spawn_model("p8_fxp_hell_sphere", e_mover.origin);
    e_orb setscale(1.5);
    e_orb linkto(e_mover);
    level.npc_pablo linkto(e_mover);
    e_mover moveto(s_start.origin, 1);
    level thread zm_orange_pablo::function_e44c7c0c(#"hash_1a974fe7a0edddab");
    wait 1;
    zm_ui_inventory::function_7df6bb60(#"zm_orange_objective_progress", 12);
    e_mover moveto(e_mover.origin + (0, 0, 4000), var_6df66af8 - 1);
    wait var_6df66af8 - 3;
    exploder::stop_exploder("fxexp_portal_115_start");
    exploder::exploder("fxexp_portal_115_end");
    wait 2;
    level.npc_pablo delete();
    e_orb delete();
    e_mover delete();
    level thread function_bf106bdf();
    level zm_orange_util::function_fd24e47f(#"hash_1a974fe7a0edddab");
    wait 1;
    level.var_1c53964e thread zm_hms_util::function_6a0d675d(#"hash_635ca3634ea94ee9");
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 1, eflags: 0x0
// Checksum 0xa35bff9, Offset: 0xbb0
// Size: 0xd2
function function_8a707841(n_loop_time) {
    n_wait_time = 0.5;
    n_time_elapsed = 0;
    self clientfield::set("lighthouse_on", 0);
    while (n_time_elapsed < n_loop_time) {
        self clientfield::increment("" + #"hash_6c84cb8d22df46f0", 1);
        wait n_wait_time;
        n_time_elapsed += n_wait_time;
        n_wait_time = max(n_wait_time * 0.85, 0.1);
    }
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 0, eflags: 0x0
// Checksum 0x211e53e0, Offset: 0xc90
// Size: 0xc4
function function_39d9b290() {
    level endon(#"end_game");
    a_e_fallbacks = zm_zonemgr::get_players_in_zone("sun_deck", 1);
    wait 1;
    a_e_players = zm_zonemgr::get_players_in_zone("sun_deck", 1);
    if (a_e_players.size == 0) {
        a_e_players = a_e_fallbacks;
    }
    e_player = array::random(a_e_players);
    e_player thread zm_orange_util::function_51b752a9(#"hash_8f686e289c54c01");
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 0, eflags: 0x0
// Checksum 0x93491629, Offset: 0xd60
// Size: 0x1cc
function function_bf106bdf() {
    for (vh_wisp = spawner::simple_spawn_single(getent("virgil", "targetname")); !isdefined(vh_wisp); vh_wisp = spawner::simple_spawn_single(getent("virgil", "targetname"))) {
        waitframe(1);
    }
    vh_wisp clientfield::set("" + #"wisp_fx", 1);
    nd_start = getvehiclenode("portal_wisp_start", "targetname");
    vh_wisp setspeed(20);
    vh_wisp vehicle::get_on_and_go_path(nd_start);
    e_device = util::spawn_model("p8_zm_ora_elemental_vessel", vh_wisp.origin + (0, 0, -10));
    e_device thread zm_orange_mq_hell::rotate_forever((0, 45, 0));
    e_device zm_item_pickup::create_item_pickup(&pickup_device, zm_utility::function_d6046228(#"hash_50d83a4f11ad9d8", #"hash_51d8e27e625c6bd4"), undefined, 128);
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 2, eflags: 0x0
// Checksum 0x6bc603e5, Offset: 0xf38
// Size: 0x74
function pickup_device(e_item, e_player) {
    e_player playrumbleonentity("zm_mansion_atlas_interact_rumble");
    level flag::set(#"hash_2c3411c8b8b421d8");
    /#
        iprintlnbold("<dev string:x6b>");
    #/
}


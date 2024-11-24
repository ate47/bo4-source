#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\music_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm\ai\zm_ai_avogadro;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_trap_electric;
#using scripts\zm\zm_white_portals;
#using scripts\zm\zm_white_util;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here;
#using scripts\zm_common\callbacks;
#using scripts\zm_common\util\ai_dog_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_crafting;
#using scripts\zm_common\zm_items;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_sq_modules;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_white_toast;

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xe95eb8d5, Offset: 0xbb0
// Size: 0x34c
function preload() {
    s_apd = struct::get("cp_toast_apd", "script_noteworthy");
    s_diner = struct::get("cp_toast_diner", "script_noteworthy");
    s_lounge = struct::get("cp_toast_lounge", "script_noteworthy");
    s_storage = struct::get("cp_toast_storage", "script_noteworthy");
    s_beds = struct::get("cp_toast_beds", "script_noteworthy");
    zm_sq_modules::function_d8383812(#"sc_toast_apd", 8000, s_apd, &function_cdcaffd1, &soul_captured, 1);
    zm_sq_modules::function_d8383812(#"sc_toast_diner", 8000, s_diner, &function_cdcaffd1, &soul_captured, 1);
    zm_sq_modules::function_d8383812(#"sc_toast_lounge", 8000, s_lounge, &function_cdcaffd1, &soul_captured, 1);
    zm_sq_modules::function_d8383812(#"sc_toast_storage", 8000, s_storage, &function_cdcaffd1, &soul_captured, 1);
    zm_sq_modules::function_d8383812(#"sc_toast_beds", 8000, s_beds, &function_cdcaffd1, &soul_captured, 1);
    clientfield::register("scriptmover", "soul_capture_filled", 1, 1, "int");
    clientfield::register("scriptmover", "soul_capture_depleted", 1, 1, "int");
    clientfield::register("zbarrier", "discharge_pap", 1, 1, "int");
    clientfield::register("scriptmover", "discharge_perk", 1, 1, "int");
    clientfield::register("scriptmover", "discharge_wallbuy", 1, 1, "int");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xb2eccfbe, Offset: 0xf08
// Size: 0x5cc
function init() {
    level flag::init("world_is_paused");
    level flag::init(#"hash_48039f3a4c1a3248");
    level flag::init(#"hash_56dcbeaf295dd09e");
    level flag::init(#"toast_final_charge");
    zm_sq::register(#"boss_battle", #"stat_tracker", #"stat_tracker", &stat_tracker_setup, &stat_tracker_cleanup, 1);
    zm_sq::start(#"boss_battle");
    level function_d30f74b8();
    level apd_computer_screens_init();
    level waittill(#"start_zombie_round_logic");
    level.var_65e355f = 0;
    level.var_5233174e = 0;
    level.var_c01b1042 = 100;
    level.var_433834a2 = [];
    a_s_rewards = struct::get_array("toast_reward", "targetname");
    foreach (struct in a_s_rewards) {
        if (!isdefined(level.var_433834a2[struct.script_noteworthy])) {
            level.var_433834a2[struct.script_noteworthy] = [];
        } else if (!isarray(level.var_433834a2[struct.script_noteworthy])) {
            level.var_433834a2[struct.script_noteworthy] = array(level.var_433834a2[struct.script_noteworthy]);
        }
        if (!isinarray(level.var_433834a2[struct.script_noteworthy], struct)) {
            level.var_433834a2[struct.script_noteworthy][level.var_433834a2[struct.script_noteworthy].size] = struct;
        }
    }
    vol_intro_blocker = getent("intro_blocker", "targetname");
    vol_intro_blocker notsolid();
    vol_apd_console = getent("vol_apd_console", "targetname");
    vol_apd_console hide();
    level.e_shard = getent("nugget", "targetname");
    level.e_shard playloopsound(#"hash_52058ae478647502");
    level.e_shard hide();
    if (!isdefined(level.a_e_canister)) {
        level.a_e_canister = [];
    } else if (!isarray(level.a_e_canister)) {
        level.a_e_canister = array(level.a_e_canister);
    }
    level.a_e_canister = struct::get_array("toast_capture_point", "targetname");
    foreach (canister in level.a_e_canister) {
        canister thread function_ffa1c335();
        canister.fx_handle = util::spawn_model("tag_origin", canister.origin + (0, 0, -56));
        if (canister.script_int === 1 && canister.script_noteworthy != "cp_toast_apd") {
            canister function_8c2bda65(1, 0);
        }
    }
    zm_white_util::function_6f635c39("apd_lockdown");
    zm_white_util::function_985c08e7();
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0x4bb6a3d4, Offset: 0x14e0
// Size: 0x8c
function stat_tracker_setup(b_skipped) {
    level endon(#"end_game", #"stat_tracker" + "_ended_early");
    while (!level flag::exists(#"hash_5aa1c9627e8626e0")) {
        wait 1;
    }
    level flag::wait_till(#"hash_5aa1c9627e8626e0");
}

// Namespace zm_white_toast/zm_white_toast
// Params 2, eflags: 0x1 linked
// Checksum 0x762e10df, Offset: 0x1578
// Size: 0x34
function stat_tracker_cleanup(b_skipped, var_19e802fa) {
    level flag::set(#"hash_5aa1c9627e8626e0");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xfececf43, Offset: 0x15b8
// Size: 0x3cc
function function_94c0714() {
    level endon(#"hash_2b7c76b6b0dfc0fd");
    level flag::set("bunker_boss_event");
    level.var_f8fdb172 function_13456343();
    level thread function_1e689ec8();
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x38>");
                println("<dev string:x38>");
            }
        }
    #/
    function_c88a99db(#"hash_5889e925689d6ce2");
    level.var_b2b15659 = 1;
    level.zmannouncerprefix = "";
    level.musicsystemoverride = 1;
    music::setmusicstate("boss_battle_preamble");
    level.var_f8fdb172 function_2a8ad7ea();
    level notify(#"preamble_started");
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x64>");
                println("<dev string:x64>");
            }
        }
    #/
    zm_bgb_anywhere_but_here::function_886fce8f(0);
    apd_lockdown();
    zm_hms_util::function_2ba419ee(0);
    level zm_hms_util::pause_zombies(0);
    vol_intro_blocker = getent("intro_blocker", "targetname");
    vol_intro_blocker solid();
    level flag::set(#"infinite_round_spawning");
    level flag::set(#"pause_round_timeout");
    level flag::set("world_is_paused");
    zm_hms_util::function_3c173d37();
    level.var_8200dc81 thread zm_hms_util::function_6a0d675d(#"hash_46be55ed9729001b", 0, 0);
    level flag::clear("world_is_paused");
    zm_sq_modules::function_3f808d3d("sc_toast_apd");
    s_apd = struct::get("cp_toast_apd", "script_noteworthy");
    while (!s_apd.charged) {
        wait 1;
    }
    level flag::set(#"hash_2b7c76b6b0dfc0fd");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xdddd5c23, Offset: 0x1990
// Size: 0x1524
function function_ca3759b1() {
    level endon(#"boss_fight_complete", #"end_game");
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x7d>");
                println("<dev string:x7d>");
            }
        }
    #/
    level flag::set("world_is_paused");
    zm_hms_util::function_2ba419ee(0);
    wait 0.5;
    foreach (canister in level.a_e_canister) {
        if (canister.script_int == 1) {
            canister thread function_8c2bda65(3, 1);
        }
    }
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x8b>");
                println("<dev string:x8b>");
            }
        }
    #/
    music::setmusicstate("boss_battle_avogadro_intro");
    exploder::exploder("fxexp_pyramid_open");
    var_1c91a56e = struct::get("apd_door_scene", "targetname");
    var_1c91a56e scene::play("open");
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x99>");
                println("<dev string:x99>");
            }
        }
    #/
    spawn_boss();
    exploder::exploder("fxexp_avo_elec_floor");
    zm_hms_util::function_3c173d37();
    level.e_avogadro zm_hms_util::function_6a0d675d(#"vox_boss_release", 0, 0, 1);
    zm_hms_util::function_3c173d37();
    zm_hms_util::function_fd24e47f("vox_boss_release", 1, 0, 1);
    zm_hms_util::function_3c173d37();
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"vox_boss_release", 2, 0, 1);
    zm_hms_util::function_3c173d37();
    level.e_avogadro zm_hms_util::function_6a0d675d(#"vox_boss_release", 3, 0, 1);
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:xb0>");
                println("<dev string:xb0>");
            }
        }
    #/
    function_5ef0416();
    zm_white_util::function_6f635c39("boss_lockdown");
    zm_hms_util::function_3c173d37();
    level.var_8200dc81 zm_hms_util::function_6a0d675d(#"vox_boss_release", 4, 0);
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:xd0>");
                println("<dev string:xd0>");
            }
        }
    #/
    playsoundatposition(#"hash_274493fd61d94d73", (0, 0, 0));
    playsoundatposition(#"hash_1fc67d7ad7445bbf", (-521, -1972, -82));
    playsoundatposition(#"hash_1fc67c7ad7445a0c", (-1146, -1956, -92));
    level zm_white_util::function_ec34b5ee("vox_boss_nuke_count_ncom_0");
    level zm_white_util::function_ec34b5ee("vox_boss_nuke_count_ten_ncom_0");
    level zm_white_util::function_ec34b5ee("vox_boss_nuke_count_nine_ncom_0");
    level zm_white_util::function_ec34b5ee("vox_boss_nuke_count_eight_ncom_0");
    level zm_white_util::function_ec34b5ee("vox_boss_nuke_count_seven_ncom_0");
    playsoundatposition(#"hash_5dddf55133ac4bcf", (-576, -1992, -87));
    level zm_white_util::function_ec34b5ee("vox_boss_nuke_count_six_ncom_0");
    level zm_white_util::function_ec34b5ee("vox_boss_nuke_count_five_ncom_0");
    level zm_white_util::function_ec34b5ee("vox_boss_nuke_count_four_ncom_0");
    level zm_white_util::function_ec34b5ee("vox_boss_nuke_count_three_ncom_0");
    level zm_white_util::function_ec34b5ee("vox_boss_nuke_count_two_ncom_0");
    level zm_white_util::function_ec34b5ee("vox_boss_nuke_count_one_ncom_0");
    foreach (player in getplayers()) {
        player thread function_a29438da();
    }
    level thread lui::screen_flash(0.1, 0.6, 1.5, 0.8, "white");
    playsoundatposition(#"hash_782025025ec70d68", (0, 0, 0));
    exploder::exploder("fxexp_nuke_event");
    wait 2;
    zm_hms_util::function_3c173d37();
    wait 2;
    level.e_avogadro zm_hms_util::function_6a0d675d(#"hash_5233a87eed32231a", 0, 0);
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:xe2>");
                println("<dev string:xe2>");
            }
        }
    #/
    if (isdefined(level.e_avogadro)) {
        level.e_avogadro notify(#"intro_done");
    }
    exploder::stop_exploder("fxexp_avo_elec_floor");
    vol_intro_blocker = getent("intro_blocker", "targetname");
    vol_intro_blocker notsolid();
    music::setmusicstate("boss_battle_stage_1");
    zm_white_util::function_f2fa71ce();
    zm_white_util::function_364cd8c0("apd_lockdown");
    level flag::clear("world_is_paused");
    level.var_f8fdb172 function_3ea7f25d();
    level thread canister_instruct();
    level thread function_abb0b62();
    level thread downed_react();
    level thread function_927c0f2e();
    level thread function_8149ceff();
    level thread function_1fba7fc2();
    var_3942c56 = [];
    var_46db9038 = array("cp_toast_lounge", "cp_toast_diner", "cp_toast_storage");
    foreach (str in var_46db9038) {
        var_49cec412 = struct::get(str, "script_noteworthy");
        var_49cec412 zm_unitrigger::create(&function_80a202c1, (72, 72, 128), undefined, 1, 1);
        var_49cec412 thread function_dbbdda4c();
        if (!isdefined(var_3942c56)) {
            var_3942c56 = [];
        } else if (!isarray(var_3942c56)) {
            var_3942c56 = array(var_3942c56);
        }
        var_3942c56[var_3942c56.size] = var_49cec412;
    }
    while (function_875983ad(var_3942c56)) {
        wait 1;
    }
    var_88c6a045 = struct::get("cp_toast_beds", "script_noteworthy");
    var_88c6a045 zm_unitrigger::create(&function_80a202c1, (72, 72, 128), undefined, 1, 1);
    var_88c6a045 thread function_dbbdda4c();
    level flag::wait_till("toast_final_charge");
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x119>");
                println("<dev string:x119>");
            }
        }
    #/
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x144>");
                println("<dev string:x144>");
            }
        }
    #/
    level thread function_26739c84();
    exploder::exploder("fxexp_pyramid_capture");
    level.vol_toast_trap = getent("vol_toast_trap", "targetname");
    while (isdefined(level.e_avogadro) && !level.e_avogadro istouching(level.vol_toast_trap)) {
        wait 0.1;
    }
    level notify(#"avog_captured");
    zm_hms_util::function_3c173d37();
    level.e_shard.name = "avog";
    level.e_shard thread zm_hms_util::function_6a0d675d(#"hash_1617ecba0bd3c76c", 3, 0);
    music::setmusicstate("none");
    while (isdefined(level.e_avogadro)) {
        wait 0.1;
    }
    level thread function_3418b6f6();
    zm_hms_util::pause_zombies(1, 0);
    wait 2;
    zm_hms_util::function_3c173d37();
    level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_1617ecba0bd3c76c", 1, 0, 1);
    zm_hms_util::function_3c173d37();
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_1617ecba0bd3c76c", 2, 0, 1);
    level.var_f8fdb172 function_43124a8f();
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x38>");
                println("<dev string:x38>");
            }
        }
    #/
    function_3b0da1a8(#"hash_17f86af9c5a89e4e");
    level.var_f8fdb172 function_2a8ad7ea();
    exploder::exploder("fxexp_pyramid_transmit");
    playsoundatposition(#"hash_5c68b001a4e41ad3", (0, 0, 0));
    var_94db4a2f = struct::get("cp_toast_apd_diner", "script_noteworthy");
    var_94db4a2f thread function_8c2bda65(3, 1);
    var_59c92575 = struct::get("cp_toast_apd_lounge", "script_noteworthy");
    var_59c92575 thread function_8c2bda65(3, 1);
    var_e2649117 = struct::get("cp_toast_apd", "script_noteworthy");
    var_e2649117 thread function_8c2bda65(3, 1);
    var_6bff6faa = struct::get("cp_toast_apd_beds", "script_noteworthy");
    var_6bff6faa thread function_8c2bda65(3, 1);
    zm_hms_util::function_3c173d37();
    level.e_shard zm_hms_util::function_6a0d675d(#"vox_boss_success", 0, 0, 1);
    level function_45b60e0e();
    level function_976e7caa();
    level function_2cdb9672();
    level function_54f91945();
    wait 1.5;
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<dev string:x161>");
                println("<dev string:x161>");
            }
        }
    #/
    level notify(#"boss_teleported");
    level.musicsystemoverride = 0;
    exploder::exploder_stop("fxexp_elec_lounge");
    exploder::exploder_stop("fxexp_elec_diner");
    exploder::exploder_stop("fxexp_elec_storage");
    exploder::exploder_stop("fxexp_elec_beds");
    level.pack_a_punch.trigger_stubs[0] function_cf62f3c7();
    foreach (var_5baafbb2 in level.var_76a7ad28) {
        var_5baafbb2 function_cf62f3c7();
    }
    foreach (s_wallbuy in level._spawned_wallbuys) {
        s_wallbuy.trigger_stub function_cf62f3c7();
    }
    level s_construction_push_point_a_markets();
    level flag::set(#"boss_fight_complete");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x2ced3506, Offset: 0x2ec0
// Size: 0xa4
function function_a29438da() {
    self playrumbleonentity("zm_white_nuke_impact");
    wait 0.7;
    self playrumbleonentity("zm_white_nuke_wind");
    wait 1;
    self playrumbleonentity("zm_white_nuke_aftershock");
    wait 1;
    if (isdefined(self)) {
        self clientfield::increment("sndRattle", 1);
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x4ad9d5ac, Offset: 0x2f70
// Size: 0x84
function function_3418b6f6() {
    var_1c91a56e = struct::get("apd_door_scene", "targetname");
    var_1c91a56e thread scene::play("close");
    wait 2;
    exploder::exploder_stop("fxexp_pyramid_open");
    exploder::exploder_stop("fxexp_pyramid_capture");
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0x8ff5d563, Offset: 0x3000
// Size: 0x82
function function_875983ad(var_3942c56) {
    foreach (s_point in var_3942c56) {
        if (!s_point.charged) {
            return true;
        }
    }
    return false;
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0x7fbfdb56, Offset: 0x3090
// Size: 0x1ac
function function_c88a99db(str_hint) {
    vol_apd_console = getent("vol_apd_console", "targetname");
    vol_apd_console show();
    vol_apd_console sethintstring(str_hint);
    b_wait = 1;
    while (b_wait) {
        b_wait = 0;
        foreach (player in getplayers()) {
            if (!(player istouching(vol_apd_console) && player usebuttonpressed()) && zm_utility::is_player_valid(player, 0, 1)) {
                b_wait = 1;
            }
        }
        waitframe(1);
    }
    vol_apd_console playsound("evt_computer_interact");
    vol_apd_console sethintstring(#"");
    vol_apd_console hide();
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0xe8d447d4, Offset: 0x3248
// Size: 0x184
function function_3b0da1a8(str_hint) {
    vol_apd_console = getent("vol_apd_console", "targetname");
    vol_apd_console show();
    vol_apd_console sethintstring(str_hint);
    b_wait = 1;
    while (b_wait) {
        foreach (player in getplayers()) {
            if (player istouching(vol_apd_console) && player usebuttonpressed() && zm_utility::is_player_valid(player, 0, 1)) {
                b_wait = 0;
            }
        }
        waitframe(1);
    }
    vol_apd_console sethintstring(#"");
    vol_apd_console hide();
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xf008954d, Offset: 0x33d8
// Size: 0xcc
function function_1e689ec8() {
    level endon(#"preamble_started");
    zm_hms_util::function_3c173d37();
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"vox_boss_intro", 0, 0, 1);
    zm_hms_util::function_3c173d37();
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"vox_boss_intro", 1, 0, 1);
    zm_hms_util::function_3c173d37();
    zm_hms_util::function_fd24e47f("vox_boss_intro", -1, 0, 1);
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x3ecea551, Offset: 0x34b0
// Size: 0x14c
function canister_instruct() {
    level endon(#"hash_56dcbeaf295dd09e");
    zm_hms_util::function_3c173d37();
    zm_hms_util::function_fd24e47f("vox_boss_canister_instruct", 0, 0, 1);
    zm_hms_util::function_3c173d37();
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"vox_boss_canister_instruct", 1, 0, 1);
    zm_hms_util::function_3c173d37();
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"vox_boss_canister_instruct", 3, 0, 1);
    zm_hms_util::function_3c173d37();
    level.var_8200dc81 zm_hms_util::function_6a0d675d(#"vox_boss_canister_instruct", 4, 0, 1);
    zm_hms_util::function_3c173d37();
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"vox_boss_canister_instruct", 5, 0, 1);
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x7bc0c4dd, Offset: 0x3608
// Size: 0x1a2
function function_26739c84() {
    level endon(#"avog_captured");
    zm_hms_util::function_3c173d37();
    level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_e23ab83d54dcb8c", 0, 0, 1);
    zm_hms_util::function_3c173d37();
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_e23ab83d54dcb8c", 1, 0, 1);
    zm_hms_util::function_3c173d37();
    level.e_avogadro zm_hms_util::function_6a0d675d(#"hash_599ad19acca1d1c8", 3, 0, 1);
    vol_beds = getent("vol_soul_beds", "targetname");
    if (level.e_avogadro istouching(vol_beds)) {
        vol_test = getent("vol_soul_generators", "targetname");
        vol_test.var_72f7bafe = struct::get_array("vol_soul_generators", "script_noteworthy");
        level.e_avogadro.var_885c1824 = vol_test;
        wait 2;
        level.e_avogadro.var_885c1824 = undefined;
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xa66692a1, Offset: 0x37b8
// Size: 0xcc
function s_construction_push_point_a_markets() {
    level endon(#"hash_5aa1c9627e8626e0");
    zm_hms_util::function_3c173d37();
    level.var_8200dc81 zm_hms_util::function_6a0d675d(#"vox_boss_success", 1, 0, 1);
    zm_hms_util::function_3c173d37();
    level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"vox_boss_success", 2, 0, 1);
    zm_hms_util::function_3c173d37();
    zm_hms_util::function_fd24e47f("vox_boss_success", 3, 0, 1);
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x8bc385af, Offset: 0x3890
// Size: 0x57e
function apd_lockdown() {
    zm_white_util::function_985c08e7();
    zm_white_util::function_6f635c39("apd_lockdown");
    function_b58e5865();
    foreach (zone in level.zones) {
        if (zone.name != "zone_bunker_apd") {
            zone.is_enabled = 0;
        }
    }
    level.var_868c98df = 0;
    a_s_portals = struct::get_array("white_portal");
    foreach (s_portal in a_s_portals) {
        s_portal thread zm_white_portals::disable_teleporter();
        s_portal.b_active = 0;
        if (isdefined(s_portal.s_unitrigger)) {
            zm_unitrigger::unregister_unitrigger(s_portal.s_unitrigger);
        }
    }
    foreach (a_s_crafting in level.var_4fe2f84d) {
        foreach (s_crafting in a_s_crafting) {
            if (isdefined(s_crafting.var_ae360c37)) {
                s_crafting.var_ae360c37 hide();
            }
            if (isarray(s_crafting.craftfoundry.blueprints)) {
                foreach (s_blueprint in s_crafting.craftfoundry.blueprints) {
                    if (s_blueprint.name === "zblueprint_zhield_white") {
                        s_crafting.blueprint = s_blueprint;
                        zm_unitrigger::unregister_unitrigger(s_crafting);
                        s_crafting zm_crafting::reset_table();
                        s_crafting zm_crafting::function_a187b293();
                    }
                }
            }
        }
    }
    a_e_items = getitemarray();
    foreach (e_item in a_e_items) {
        w_item = e_item.item;
        if (isdefined(w_item) && isdefined(w_item.craftitem) && w_item.craftitem && (w_item.name == #"hash_79bb43e8065dc831" || w_item.name == #"hash_79bb40e8065dc318" || w_item.name == #"hash_79bb41e8065dc4cb")) {
            e_player = array::random(getplayers());
            zm_items::player_pick_up(e_player, w_item);
            e_item delete();
        }
    }
    if (isdefined(level.var_279a11a3)) {
        level.var_279a11a3.related_parent hide();
        zm_unitrigger::unregister_unitrigger(level.var_279a11a3);
    }
    level._zombiemode_custom_box_move_logic = &function_979d1e2;
    level.var_401aaa92 = 1;
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xff91c20c, Offset: 0x3e18
// Size: 0x2e8
function function_5ef0416() {
    var_b2f7a245 = array("zone_bunker_lounge", "zone_bunker_diner", "zone_bunker_beds_1", "zone_bunker_beds_2", "zone_bunker_power_1", "zone_bunker_power_2", "zone_bunker_storage", "zone_bunker_solitary");
    foreach (zone in var_b2f7a245) {
        level.zones[zone].is_enabled = 1;
    }
    if (!level flag::get(#"pap_power_ready")) {
        level flag::set(#"pap_power_ready");
    }
    while (!isdefined(level.pack_a_punch.trigger_stubs[0].trigger_func)) {
        waitframe(1);
    }
    level.pack_a_punch.trigger_stubs[0] function_641f4ec(&function_a96ea498, &function_c6c9b014, 5000, "discharge_pap");
    foreach (var_5baafbb2 in level.var_76a7ad28) {
        var_5baafbb2 function_641f4ec(&function_c03c3007, &function_c6c9b014, 3000, "discharge_perk");
    }
    foreach (s_wallbuy in level._spawned_wallbuys) {
        s_wallbuy.trigger_stub function_641f4ec(&function_91256361, &function_c6c9b014, 3000, "discharge_wallbuy");
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x7b2892d8, Offset: 0x4108
// Size: 0x64
function function_979d1e2() {
    for (i = 0; i < level.chests.size; i++) {
        if (level.chests[i].script_noteworthy == "start1_chest") {
            level.chest_index = i;
            break;
        }
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 4, eflags: 0x1 linked
// Checksum 0x19bf910f, Offset: 0x4178
// Size: 0x1cc
function function_641f4ec(var_ae5725a9, lockdown_trigger_func, unlock_cost, client_fx) {
    self.client_fx = client_fx;
    if (client_fx === "discharge_perk") {
        self zm_perks::function_a30c73b9("off");
        self.var_3468124.mdl_altar clientfield::set(client_fx, 1);
    } else if (client_fx === "discharge_pap") {
        self.pap_machine clientfield::set(client_fx, 1);
    } else {
        target1 = struct::get(self.target, "targetname");
        self.e_chalk = getent(target1.target, "targetname");
        self.e_chalk clientfield::set(client_fx, 1);
    }
    if (!isdefined(self.var_a0fc37f6)) {
        self.var_a0fc37f6 = self.prompt_and_visibility_func;
    }
    if (!isdefined(self.var_492080a5)) {
        self.var_492080a5 = self.trigger_func;
    }
    self.unlock_func = &function_cf62f3c7;
    self.var_534571f = unlock_cost;
    self.trigger_func = lockdown_trigger_func;
    self.prompt_and_visibility_func = var_ae5725a9;
    zm_unitrigger::reregister_unitrigger(self);
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x6510cdd0, Offset: 0x4350
// Size: 0x124
function function_cf62f3c7() {
    if (isdefined(self.client_fx)) {
        if (self.client_fx === "discharge_perk") {
            self zm_perks::function_a30c73b9("off");
            self.var_3468124.mdl_altar clientfield::set(self.client_fx, 0);
        } else if (self.client_fx === "discharge_pap") {
            self.pap_machine clientfield::set(self.client_fx, 0);
        } else {
            self.e_chalk clientfield::set(self.client_fx, 0);
        }
    }
    if (isdefined(self.var_a0fc37f6)) {
        self.prompt_and_visibility_func = self.var_a0fc37f6;
        self.var_a0fc37f6 = undefined;
    }
    if (isdefined(self.var_492080a5)) {
        self.trigger_func = self.var_492080a5;
        self.var_492080a5 = undefined;
    }
    zm_unitrigger::reregister_unitrigger(self);
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0x385c68d2, Offset: 0x4480
// Size: 0x60
function function_c03c3007(e_player) {
    str_prompt = zm_utility::function_d6046228(#"hash_5436ed3c090b1b5b", #"hash_4b3c40d9079f38d1");
    self sethintstring(str_prompt);
    return true;
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0xf5bc54a1, Offset: 0x44e8
// Size: 0x60
function function_91256361(e_player) {
    str_prompt = zm_utility::function_d6046228(#"hash_3262580790190195", #"hash_1c978c7c32d6accb");
    self sethintstring(str_prompt);
    return true;
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0x336a2fc4, Offset: 0x4550
// Size: 0x60
function function_a96ea498(e_player) {
    str_prompt = zm_utility::function_d6046228(#"hash_3cedf7684da7e8a8", #"hash_2755ffa17bc473e4");
    self sethintstring(str_prompt);
    return true;
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0x4071c190, Offset: 0x45b8
// Size: 0x19c
function function_c6c9b014(e_player) {
    self endon(#"death");
    level endon(#"end_game");
    while (true) {
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!isdefined(player)) {
            continue;
        }
        if (!zm_perks::vending_trigger_can_player_use(player, 1)) {
            continue;
        }
        if (!player zm_score::can_player_purchase(self.stub.var_534571f)) {
            zm_utility::play_sound_on_ent("no_purchase");
            player zm_audio::create_and_play_dialog(#"general", #"outofmoney");
            continue;
        }
        player zm_score::minus_to_player_score(self.stub.var_534571f);
        playsoundatposition(#"hash_6b9160d5f97e5ecb", self.origin);
        player thread shock_player();
        waitframe(1);
        self.stub thread [[ self.stub.unlock_func ]]();
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x6f8313f1, Offset: 0x4760
// Size: 0x16a
function function_297251d8() {
    level endon(#"game_ended", #"boss_teleported");
    shock_status_effect = getstatuseffect(#"hash_320c81d91eb89d73");
    while (!level flag::get(#"boss_fight_complete")) {
        foreach (player in getplayers()) {
            if (player istouching(self)) {
                player playrumbleonentity("damage_heavy");
                player playsound(#"hash_5af2a9d11f007b9");
                player status_effect::status_effect_apply(shock_status_effect, undefined, self, 1);
            }
        }
        wait 1;
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0xf093de89, Offset: 0x48d8
// Size: 0x7c
function shock_player(n_damage = 50) {
    shock_status_effect = getstatuseffect(#"hash_19533caf858a9f3b");
    self thread player_elec_damage(n_damage);
    self status_effect::status_effect_apply(shock_status_effect, undefined, self, 0);
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0xb2491195, Offset: 0x4960
// Size: 0xda
function player_elec_damage(n_damage) {
    self endon(#"death", #"disconnect");
    if (!(isdefined(self.is_burning) && self.is_burning) && zm_utility::is_player_valid(self)) {
        self.is_burning = 1;
        self playrumbleonentity("damage_heavy");
        self playsound(#"hash_5af2a9d11f007b9");
        self dodamage(n_damage, self.origin, undefined);
        wait 1;
        self.is_burning = undefined;
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xda16e772, Offset: 0x4a48
// Size: 0x344
function spawn_boss() {
    level.e_avogadro = zombie_utility::spawn_zombie(getent("avogadro_spawner", "targetname"), undefined, undefined);
    level.e_avogadro.var_885c1824 = undefined;
    level.e_avogadro.vol_no_charge = getent("vol_avogadro_no_charge", "targetname");
    level.e_avogadro.vol_retreat = getent("vol_avogadro_retreat", "targetname");
    level.e_avogadro.var_77ef4a35 = struct::get("avogadro_retreat_point", "targetname");
    level.e_avogadro thread function_e5e69e2c();
    level.e_avogadro.name = "avog";
    level.e_avogadro.isspeaking = 0;
    level.e_avogadro.var_5b6ebfd0 = 0;
    level.e_avogadro playloopsound(#"hash_43d41833f5950a8d");
    a_str_vol = array("vol_soul_beds", "vol_soul_diner", "vol_soul_lounge", "vol_soul_storage");
    var_54037511 = [];
    foreach (str in a_str_vol) {
        if (!isdefined(var_54037511)) {
            var_54037511 = [];
        } else if (!isarray(var_54037511)) {
            var_54037511 = array(var_54037511);
        }
        var_54037511[var_54037511.size] = getent(str, "targetname");
    }
    foreach (vol in var_54037511) {
        vol.var_72f7bafe = struct::get_array(vol.targetname, "script_noteworthy");
    }
    if (isdefined(level.door_powerup)) {
        level notify(#"magic_door_power_up_grabbed");
        level.door_powerup zm_powerups::powerup_delete();
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xa51a006e, Offset: 0x4d98
// Size: 0x236
function function_abb0b62() {
    level endon(#"game_ended", #"toast_final_charge");
    var_51f3793d = 0;
    a_reactions = array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    a_reactions = array::randomize(a_reactions);
    i = 0;
    while (true) {
        wait randomintrangeinclusive(5, 10);
        b_spoke = 0;
        s_results = level waittill(#"avogadro_damage_react");
        e_player = s_results.e_player;
        if (!var_51f3793d) {
            if (e_player zm_audio::can_speak()) {
                zm_hms_util::function_3c173d37();
                e_player zm_hms_util::function_51b752a9(#"hash_2260a354cf8d04c1", -1, 0, 1);
                var_51f3793d = 1;
                b_spoke = 1;
            }
        } else if (isdefined(level.e_avogadro)) {
            if (level.e_avogadro zm_audio::can_speak()) {
                var_ca2331b5 = a_reactions[i];
                zm_hms_util::function_3c173d37();
                level.e_avogadro zm_hms_util::function_6a0d675d(#"hash_2260a354cf8d04c1", var_ca2331b5, 0, 1);
                b_spoke = 1;
                i++;
            }
        }
        if (i >= a_reactions.size) {
            return;
        }
        if (b_spoke) {
            wait 30;
        }
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x5196e16d, Offset: 0x4fd8
// Size: 0x106
function downed_react() {
    level endon(#"game_ended", #"avog_captured");
    while (true) {
        wait randomintrangeinclusive(5, 10);
        b_spoke = 0;
        s_results = level waittill(#"avogadro_downed_react");
        if (isdefined(level.e_avogadro)) {
            if (level.e_avogadro zm_audio::can_speak()) {
                zm_hms_util::function_3c173d37();
                level.e_avogadro zm_hms_util::function_6a0d675d(#"hash_4f74505970e866da", -1, 0, 1);
                b_spoke = 1;
            }
        }
        if (b_spoke) {
            wait 30;
        }
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x1047940, Offset: 0x50e8
// Size: 0x254
function function_927c0f2e() {
    level endon(#"game_ended", #"avog_captured");
    while (true) {
        b_spoke = 0;
        s_results = level waittill(#"hash_4cbbb6dfc789393f");
        if (isdefined(level.e_avogadro)) {
            players = getplayers();
            valid_players = [];
            foreach (player in players) {
                str_name = player zm_vo::function_82f9bc9f();
                if (zm_utility::is_player_valid(player) && player cansee(level.e_avogadro)) {
                    if (!isdefined(valid_players)) {
                        valid_players = [];
                    } else if (!isarray(valid_players)) {
                        valid_players = array(valid_players);
                    }
                    valid_players[valid_players.size] = player;
                }
            }
            if (valid_players.size > 0) {
                e_player = arraygetclosest(level.e_avogadro.origin, valid_players);
                if (e_player zm_audio::can_speak()) {
                    zm_hms_util::function_3c173d37();
                    e_player zm_hms_util::function_51b752a9(#"hash_3a561b214fd1c2f5", -1, 0, 1);
                    b_spoke = 1;
                }
            }
        }
        if (b_spoke) {
            wait 60;
        }
        waitframe(1);
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x81ffd546, Offset: 0x5348
// Size: 0x254
function function_8149ceff() {
    level endon(#"game_ended", #"avog_captured");
    while (true) {
        b_spoke = 0;
        s_results = level waittill(#"hash_498ebb296003fd76");
        if (isdefined(level.e_avogadro)) {
            players = getplayers();
            valid_players = [];
            foreach (player in players) {
                str_name = player zm_vo::function_82f9bc9f();
                if (zm_utility::is_player_valid(player) && player cansee(level.e_avogadro)) {
                    if (!isdefined(valid_players)) {
                        valid_players = [];
                    } else if (!isarray(valid_players)) {
                        valid_players = array(valid_players);
                    }
                    valid_players[valid_players.size] = player;
                }
            }
            if (valid_players.size > 0) {
                e_player = arraygetclosest(level.e_avogadro.origin, valid_players);
                if (e_player zm_audio::can_speak()) {
                    zm_hms_util::function_3c173d37();
                    e_player zm_hms_util::function_51b752a9(#"hash_79b9be92b942990d", -1, 0, 1);
                    b_spoke = 1;
                }
            }
        }
        if (b_spoke) {
            wait 60;
        }
        waitframe(1);
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x1c3d90ff, Offset: 0x55a8
// Size: 0x4e6
function function_1fba7fc2() {
    level endon(#"game_ended", #"avog_captured");
    a_taunts = [];
    a_taunts[#"niko"] = array::randomize(array(0, 1, 2, 3));
    a_taunts[#"demp"] = array::randomize(array(0, 1, 2, 3));
    a_taunts[#"rich"] = array::randomize(array(0, 1, 2, 3));
    a_taunts[#"take"] = array::randomize(array(0, 1, 2, 3));
    a_taunts[#"unik"] = array::randomize(array(0, 1, 2, 3));
    a_taunts[#"udem"] = array::randomize(array(0, 1, 2, 3));
    a_taunts[#"uric"] = array::randomize(array(0, 1, 2, 3));
    a_taunts[#"utak"] = array::randomize(array(0, 1, 2, 3));
    var_4854a91b = "vox_boss_taunt_";
    while (true) {
        b_spoke = 0;
        wait randomintrangeinclusive(30, 60);
        if (isdefined(level.e_avogadro)) {
            players = getplayers();
            valid_players = [];
            foreach (player in players) {
                str_name = player zm_vo::function_82f9bc9f();
                if (zm_utility::is_player_valid(player) && a_taunts[str_name].size > 0) {
                    if (!isdefined(valid_players)) {
                        valid_players = [];
                    } else if (!isarray(valid_players)) {
                        valid_players = array(valid_players);
                    }
                    valid_players[valid_players.size] = player;
                }
            }
            if (valid_players.size > 0) {
                var_d1e952c4 = array::random(valid_players);
                str_name = var_d1e952c4 zm_vo::function_82f9bc9f();
                if (var_d1e952c4 zm_audio::can_speak()) {
                    alias = var_4854a91b + str_name + "_avog_" + a_taunts[str_name][0];
                    zm_hms_util::function_3c173d37();
                    var_d1e952c4 zm_audio::do_player_or_npc_playvox(alias, 1);
                    arrayremoveindex(a_taunts[str_name], 0);
                    b_spoke = 1;
                }
            }
        }
        if (b_spoke) {
            wait 60;
        }
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xf9feb64, Offset: 0x5a98
// Size: 0x1ec
function function_e5e69e2c() {
    self endon(#"death");
    while (true) {
        a_e_steal = [];
        foreach (powerup in level.active_powerups) {
            dist = distancesquared(self.origin, powerup.origin);
            if (dist <= 4096) {
                if (!isdefined(a_e_steal)) {
                    a_e_steal = [];
                } else if (!isarray(a_e_steal)) {
                    a_e_steal = array(a_e_steal);
                }
                if (!isinarray(a_e_steal, powerup)) {
                    a_e_steal[a_e_steal.size] = powerup;
                }
            }
        }
        foreach (powerup in a_e_steal) {
            var_f79dc259 = powerup zm_powerups::function_d5b6ce91();
            powerup clientfield::set("powerup_grabbed_fx", var_f79dc259);
            powerup zm_powerups::powerup_delete();
        }
        wait 0.01;
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x24ef775c, Offset: 0x5c90
// Size: 0x32e
function function_b58e5865() {
    level flag::set(#"hash_48039f3a4c1a3248");
    level.var_45827161 = [];
    level.func_get_zombie_spawn_delay = &function_61dc1b0;
    level.func_get_delay_between_rounds = &function_f85d3d98;
    callback::function_74872db6(&function_3d06f24e);
    if (isdefined(level.e_weeper)) {
        level.e_weeper val::set(#"mee_2", "takedamage", 1);
        level.e_weeper kill();
    }
    if (isdefined(level.e_partner)) {
        level.e_partner delete();
    }
    var_e3d10631 = getentarray("private_mannequin_parts", "targetname");
    var_a2c75164 = getent("mannequin_ally_door", "targetname");
    zm_unitrigger::unregister_unitrigger(var_e3d10631[0].s_unitrigger);
    if (isdefined(var_a2c75164.v_start_pos)) {
        var_a2c75164 playsound("evt_bunker_door_interior_close");
        var_a2c75164 moveto(var_a2c75164.v_start_pos, 1);
    }
    foreach (e_part in var_e3d10631) {
        e_part hide();
    }
    if (isdefined(level.mannequin_ally)) {
        util::stop_magic_bullet_shield(level.mannequin_ally);
        level.mannequin_ally kill();
    }
    level.var_5da5aff4 = 0;
    if (level flag::get(#"hash_398e4b1e72edb4ee")) {
        level flag::clear(#"hash_398e4b1e72edb4ee");
        exploder::stop_exploder("fxexp_elec_lounge");
    }
    level.var_382a24b0 = 1;
    level.var_dc22f98 = level.fn_custom_round_ai_spawn;
    level.fn_custom_round_ai_spawn = &function_be93a2bf;
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x1474ad15, Offset: 0x5fc8
// Size: 0x6
function function_f85d3d98() {
    return false;
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0x4b2fb726, Offset: 0x5fd8
// Size: 0x4a
function function_61dc1b0(n_round) {
    n_round = max(n_round, 20);
    n_delay = zm_round_logic::get_zombie_spawn_delay(n_round);
    return n_delay;
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x93a75321, Offset: 0x6030
// Size: 0x6e
function function_3d06f24e() {
    level waittill(#"zombie_total_set");
    level.zombie_health = zombie_utility::ai_calculate_health(level.zombie_vars[#"zombie_health_start"], max(level.round_number, 20));
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x992c2657, Offset: 0x60a8
// Size: 0x242
function function_be93a2bf() {
    if (level.var_65e355f > 1 && level.var_5233174e > 4) {
        ai = zombie_dog_util::function_62db7b1c(0);
        if (isdefined(ai)) {
            level.var_5233174e = 0;
            return true;
        }
    }
    s_spawn_point = array::random(level.zm_loc_types[#"zombie_location"]);
    ai = zombie_utility::spawn_zombie(getentarray("mannequin_zombie_spawner", "script_noteworthy")[0], undefined, s_spawn_point);
    if (isdefined(ai)) {
        ai.health = int(ai.health * 2);
        ai thread function_ea2d02a6();
        level.zombie_total--;
        n_delay = isdefined(zombie_utility::get_zombie_var(#"zombie_spawn_delay")) ? zombie_utility::get_zombie_var(#"zombie_spawn_delay") : zombie_utility::get_zombie_var(#"hash_7d5a25e2463f7fc5");
        if (flag::get(#"hash_2b7c76b6b0dfc0fd")) {
            if (getplayers().size > 2) {
                n_delay = max(n_delay, 0.5);
            } else {
                n_delay = max(n_delay, 1);
            }
        }
        level.var_5233174e++;
        wait n_delay;
        return true;
    }
    return false;
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x1a0896a7, Offset: 0x62f8
// Size: 0x3c
function function_ea2d02a6() {
    self endon(#"death");
    wait 0.5;
    self zombie_utility::set_zombie_run_cycle("sprint");
}

// Namespace zm_white_toast/zm_white_toast
// Params 2, eflags: 0x1 linked
// Checksum 0xc31bacfd, Offset: 0x6340
// Size: 0xcc
function function_cdcaffd1(var_88206a50, ent) {
    vol_test = getent(var_88206a50.target, "targetname");
    return (isdefined(ent.attacker) && isplayer(ent.attacker) || isdefined(ent.damageinflictor) && isplayer(ent.damageinflictor)) && isdefined(ent) && ent istouching(vol_test);
}

// Namespace zm_white_toast/zm_white_toast
// Params 2, eflags: 0x1 linked
// Checksum 0xd9f452b8, Offset: 0x6418
// Size: 0xfc
function soul_captured(var_f0e6c7a2, ent) {
    var_f0e6c7a2.n_captured++;
    /#
        if (level flag::get(#"soul_fill")) {
            var_f0e6c7a2.n_captured = 28;
        }
    #/
    level notify(#"toast_captured");
    canister = getent(var_f0e6c7a2.soul_goo, "script_noteworthy");
    if (var_f0e6c7a2.n_captured >= 28) {
        var_f0e6c7a2.charged = 1;
        var_f0e6c7a2.fx_handle clientfield::set("soul_capture_filled", 1);
        zm_sq_modules::function_2a94055d(var_f0e6c7a2.script_string);
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x9b011605, Offset: 0x6520
// Size: 0x9e
function function_ffa1c335() {
    level endon(#"game_ended");
    e_goop = getent(self.soul_goo, "script_noteworthy");
    v_start_pos = e_goop.origin;
    while (true) {
        e_goop moveto(v_start_pos + (0, 0, self.n_captured), 1);
        wait 1;
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 2, eflags: 0x1 linked
// Checksum 0x72c0f913, Offset: 0x65c8
// Size: 0x144
function function_8c2bda65(n_rate, b_drain) {
    e_goop = getent(self.soul_goo, "script_noteworthy");
    if (b_drain) {
        self.fx_handle clientfield::set("soul_capture_filled", 0);
        while (self.n_captured > 2) {
            self.n_captured -= int(self.n_captured / n_rate);
            wait 1;
        }
        self.n_captured = 0;
        return;
    }
    while (self.n_captured < 26) {
        self.n_captured += int(28 / n_rate);
        wait 1;
    }
    self.n_captured = 28;
    self.fx_handle clientfield::set("soul_capture_filled", 1);
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0x506a3441, Offset: 0x6718
// Size: 0xd8
function function_80a202c1(e_player) {
    str_prompt = "";
    if (self.stub.related_parent.var_3fc5ae3d) {
        str_prompt = #"hash_22dc6a35ff6146d7";
    } else if (!level flag::get(#"hash_56dcbeaf295dd09e")) {
        str_prompt = zm_utility::function_d6046228(#"hash_6228a6a31d64d0ee", #"hash_2b939967b7ce331a");
    } else {
        str_prompt = #"hash_757733252517119a";
    }
    self sethintstring(str_prompt);
    return true;
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0xde272dcb, Offset: 0x67f8
// Size: 0x444
function function_dbbdda4c(e_player) {
    level endon(#"end_game");
    while (!self.charged) {
        waitresult = self waittill(#"trigger_activated");
        if (level flag::get(#"hash_56dcbeaf295dd09e")) {
            waitframe(1);
            continue;
        }
        level flag::set(#"hash_56dcbeaf295dd09e");
        self thread function_5f7d6e4c();
        vol_test = getent(self.target, "targetname");
        vol_test.var_72f7bafe = struct::get_array(self.target, "script_noteworthy");
        level.e_avogadro.var_885c1824 = vol_test;
        zm_sq_modules::function_3f808d3d(self.script_string);
        level waittill(#"toast_captured");
        self thread function_10dde0dd();
        while (!self.charged && self.n_captured > 0) {
            waitframe(1);
        }
        self notify(#"hash_4d9ae187d6e333c7");
        zm_sq_modules::function_2a94055d(self.script_string);
        level.e_avogadro.var_885c1824 = undefined;
        level flag::clear(#"hash_56dcbeaf295dd09e");
        if (self.charged) {
            self thread function_a6a4a162();
            playsoundatposition(#"hash_4a67e67e0a9d6df9", (0, 0, 0));
            /#
                if (getdvarint(#"zm_debug_ee", 0)) {
                    if (getdvarint(#"zm_debug_ee", 0)) {
                        iprintlnbold("<dev string:x186>");
                        println("<dev string:x186>");
                    }
                }
            #/
            continue;
        }
        /#
            if (getdvarint(#"zm_debug_ee", 0)) {
                if (getdvarint(#"zm_debug_ee", 0)) {
                    iprintlnbold("<dev string:x19e>");
                    println("<dev string:x19e>");
                }
            }
        #/
        zm_hms_util::function_3c173d37();
        level.var_8200dc81 thread zm_hms_util::function_6a0d675d(#"hash_5c371dc17ccdf97", 0, 0, 1);
        playsoundatposition(#"hash_3fc59a2ac3e3a5b9", (0, 0, 0));
        self.var_3fc5ae3d = 1;
        self.fx_handle clientfield::set("soul_capture_depleted", 1);
        for (i = 0; i < 30; i++) {
            wait 1;
        }
        self.var_3fc5ae3d = 0;
        self.fx_handle clientfield::set("soul_capture_depleted", 0);
    }
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xc6c23f3b, Offset: 0x6c48
// Size: 0xd4
function function_5f7d6e4c() {
    self endon(#"hash_56dcbeaf295dd09e", #"end_game");
    zm_hms_util::function_3c173d37();
    level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_529b7231d7ddbe80", 0, 0, 1);
    n_variant = randomintrangeinclusive(0, 9);
    zm_hms_util::function_3c173d37();
    level.e_avogadro zm_hms_util::function_6a0d675d(#"hash_7c662a0005eae5d4", n_variant, 0, 1);
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x9c032dc3, Offset: 0x6d28
// Size: 0x5dc
function function_a6a4a162() {
    zm_unitrigger::unregister_unitrigger(self.stub);
    level.var_65e355f++;
    if (isdefined(level.e_avogadro)) {
        level.e_avogadro zm_ai_avogadro::function_ed39491e(level.var_65e355f);
    }
    zm_hms_util::function_2ba419ee(0);
    switch (self.script_string) {
    case #"sc_toast_diner":
        function_12a92019("diner");
        level.var_f8fdb172 function_f757dba3();
        break;
    case #"sc_toast_lounge":
        function_12a92019("lounge");
        level.var_f8fdb172 function_47550faa();
        break;
    case #"sc_toast_storage":
        function_12a92019("storage");
        level.var_f8fdb172 function_8c41f9de();
        break;
    case #"sc_toast_beds":
        function_12a92019("beds");
        level.var_f8fdb172 function_d0dd97c4();
        break;
    }
    function_2dfd8e82();
    self thread function_8c2bda65(3, 1);
    var_4a373f57 = getent(self.target, "targetname");
    var_703d991b = undefined;
    switch (self.script_string) {
    case #"sc_toast_diner":
        var_703d991b = struct::get("cp_toast_apd_diner", "script_noteworthy");
        level function_594dae();
        var_703d991b thread function_8c2bda65(3, 0);
        zm_hms_util::function_3c173d37();
        level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_278f7dd58492d72f", 0, 0, 1);
        level thread function_377062e2();
        wait 5;
        exploder::exploder("fxexp_elec_diner");
        break;
    case #"sc_toast_lounge":
        var_703d991b = struct::get("cp_toast_apd_lounge", "script_noteworthy");
        level function_6fd6c18f();
        var_703d991b thread function_8c2bda65(3, 0);
        zm_hms_util::function_3c173d37();
        level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_5aa17424c77358bf", 0, 0, 1);
        level thread function_377062e2();
        wait 5;
        exploder::exploder("fxexp_elec_lounge");
        break;
    case #"sc_toast_storage":
        var_703d991b = struct::get("cp_toast_apd", "script_noteworthy");
        level function_6f083d9c();
        var_703d991b thread function_8c2bda65(3, 0);
        zm_hms_util::function_3c173d37();
        level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_6a8081b211c908ce", 0, 0, 1);
        level thread function_377062e2();
        wait 5;
        exploder::exploder("fxexp_elec_storage");
        break;
    case #"sc_toast_beds":
        var_703d991b = struct::get("cp_toast_apd_beds", "script_noteworthy");
        level function_8ba67fdc();
        var_703d991b thread function_8c2bda65(3, 0);
        zm_hms_util::function_3c173d37();
        level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_740bffff7149b220", 0, 0, 1);
        level thread function_377062e2();
        wait 5;
        exploder::exploder("fxexp_elec_beds");
        break;
    }
    var_4a373f57 function_297251d8();
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x96d58cf0, Offset: 0x7310
// Size: 0x1a2
function function_2dfd8e82() {
    level endon(#"hash_56dcbeaf295dd09e", #"end_game");
    switch (level.var_65e355f) {
    case 1:
        zm_hms_util::function_3c173d37();
        level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_52ef0df6d3730e90", 1, 0, 1);
        break;
    case 2:
        zm_hms_util::function_3c173d37();
        level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_75fc60c1d10de4c2", 1, 0, 1);
        break;
    case 3:
        zm_hms_util::function_3c173d37();
        level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_6e3f8bae61789524", 1, 0, 1);
        break;
    case 4:
        zm_hms_util::function_3c173d37();
        level.var_5dd0d3ff zm_hms_util::function_6a0d675d(#"hash_599ad19acca1d1c8", 1, 0, 1);
        break;
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xd7aca5fa, Offset: 0x74c0
// Size: 0x1c2
function function_377062e2() {
    level endon(#"hash_56dcbeaf295dd09e", #"end_game");
    switch (level.var_65e355f) {
    case 1:
        zm_hms_util::function_3c173d37();
        level.e_avogadro zm_hms_util::function_6a0d675d(#"hash_52ef0df6d3730e90", 2, 0, 1);
        break;
    case 2:
        zm_hms_util::function_3c173d37();
        level.e_avogadro zm_hms_util::function_6a0d675d(#"hash_75fc60c1d10de4c2", 2, 0, 1);
        break;
    case 3:
        zm_hms_util::function_3c173d37();
        level.e_avogadro zm_hms_util::function_6a0d675d(#"hash_6e3f8bae61789524", 2, 0, 1);
        break;
    case 4:
        zm_hms_util::function_3c173d37();
        level.e_avogadro zm_hms_util::function_6a0d675d(#"hash_599ad19acca1d1c8", 2, 0, 1);
        level flag::set(#"toast_final_charge");
        break;
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 1, eflags: 0x1 linked
// Checksum 0x161598ea, Offset: 0x7690
// Size: 0xa0
function function_12a92019(str_position) {
    foreach (struct in level.var_433834a2[str_position]) {
        level thread zm_powerups::specific_powerup_drop(struct.script_string, struct.origin);
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xea1d4ec5, Offset: 0x7738
// Size: 0x70
function function_10dde0dd() {
    self endon(#"hash_4d9ae187d6e333c7");
    while (level flag::get(#"hash_56dcbeaf295dd09e")) {
        level waittill(#"toast_captured");
        self thread function_8db56cee();
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x3a587fed, Offset: 0x77b0
// Size: 0x7e
function function_8db56cee() {
    level endon(#"toast_captured");
    self endon(#"hash_4d9ae187d6e333c7");
    wait 5;
    while (self.n_captured > 0 && level flag::get(#"hash_56dcbeaf295dd09e")) {
        self.n_captured--;
        wait 2;
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xba4c7efa, Offset: 0x7838
// Size: 0x144
function function_d30f74b8() {
    level.var_22cd4e60 = [];
    level.var_f48e1692 = [];
    level.var_f861a2bc = [];
    level.var_9e318617 = [];
    level.var_79d7145f = [];
    level.var_f48e1692 = getentarray("beds_wire_set", "targetname");
    level.var_f861a2bc = getentarray("diner_wire_set", "targetname");
    level.var_9e318617 = getentarray("lounge_wire_set", "targetname");
    level.var_79d7145f = getentarray("storage_wire_set", "targetname");
    level function_54f91945();
    level function_45b60e0e();
    level function_976e7caa();
    level function_2cdb9672();
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xfacc24be, Offset: 0x7988
// Size: 0x44
function function_35b8264f() {
    self hidepart("tag_wire_apd_off");
    self showpart("tag_wire_apd_on");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x7df077e3, Offset: 0x79d8
// Size: 0x44
function function_3507dc95() {
    self hidepart("tag_wire_apd_on");
    self showpart("tag_wire_apd_off");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xafbe8a45, Offset: 0x7a28
// Size: 0xd8
function function_8ba67fdc() {
    foreach (wire in level.var_f48e1692) {
        if (wire.script_noteworthy === "apd_wire") {
            wire function_35b8264f();
            continue;
        }
        wire hidepart("tag_wire_beds_off");
        wire showpart("tag_wire_beds_on");
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x42c42110, Offset: 0x7b08
// Size: 0xd8
function function_54f91945() {
    foreach (wire in level.var_f48e1692) {
        if (wire.script_noteworthy === "apd_wire") {
            wire function_3507dc95();
            continue;
        }
        wire hidepart("tag_wire_beds_on");
        wire showpart("tag_wire_beds_off");
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xf5554b98, Offset: 0x7be8
// Size: 0xd8
function function_594dae() {
    foreach (wire in level.var_f861a2bc) {
        if (wire.script_noteworthy === "apd_wire") {
            wire function_35b8264f();
            continue;
        }
        wire hidepart("tag_wire_diner_off");
        wire showpart("tag_wire_diner_on");
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x405a9e4a, Offset: 0x7cc8
// Size: 0xd8
function function_45b60e0e() {
    foreach (wire in level.var_f861a2bc) {
        if (wire.script_noteworthy === "apd_wire") {
            wire function_3507dc95();
            continue;
        }
        wire hidepart("tag_wire_diner_on");
        wire showpart("tag_wire_diner_off");
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x2d48af10, Offset: 0x7da8
// Size: 0xd8
function function_6fd6c18f() {
    foreach (wire in level.var_9e318617) {
        if (wire.script_noteworthy === "apd_wire") {
            wire function_35b8264f();
            continue;
        }
        wire hidepart("tag_wire_lounge_off");
        wire showpart("tag_wire_lounge_on");
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x8d811340, Offset: 0x7e88
// Size: 0xd8
function function_976e7caa() {
    foreach (wire in level.var_9e318617) {
        if (wire.script_noteworthy === "apd_wire") {
            wire function_3507dc95();
            continue;
        }
        wire hidepart("tag_wire_lounge_on");
        wire showpart("tag_wire_lounge_off");
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xc9b4c63e, Offset: 0x7f68
// Size: 0xd8
function function_6f083d9c() {
    foreach (wire in level.var_79d7145f) {
        if (wire.script_noteworthy === "apd_wire") {
            wire function_35b8264f();
            continue;
        }
        wire hidepart("tag_wire_storage_off");
        wire showpart("tag_wire_storage_on");
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xaae98ffd, Offset: 0x8048
// Size: 0xd8
function function_2cdb9672() {
    foreach (wire in level.var_79d7145f) {
        if (wire.script_noteworthy === "apd_wire") {
            wire function_3507dc95();
            continue;
        }
        wire hidepart("tag_wire_storage_on");
        wire showpart("tag_wire_storage_off");
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x572557b6, Offset: 0x8128
// Size: 0x4c
function apd_computer_screens_init() {
    level.var_f8fdb172 = getent("apd_computer_screens", "targetname");
    level.var_f8fdb172 function_2a8ad7ea();
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x95f96d4a, Offset: 0x8180
// Size: 0x164
function function_2a8ad7ea() {
    self hidepart("tag_roomnames");
    self hidepart("tag_end");
    self hidepart("tag_start");
    self hidepart("tag_beds_full");
    self hidepart("tag_beds_empty");
    self hidepart("tag_storage_full");
    self hidepart("tag_storage_empty");
    self hidepart("tag_diner_full");
    self hidepart("tag_diner_empty");
    self hidepart("tag_lounge_full");
    self hidepart("tag_lounge_empty");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xcd9a06b8, Offset: 0x82f0
// Size: 0xa4
function function_3ea7f25d() {
    self showpart("tag_roomnames");
    self showpart("tag_beds_empty");
    self showpart("tag_storage_empty");
    self showpart("tag_diner_empty");
    self showpart("tag_lounge_empty");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x6454d634, Offset: 0x83a0
// Size: 0x44
function function_13456343() {
    self hidepart("tag_end");
    self showpart("tag_start");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xe83d6346, Offset: 0x83f0
// Size: 0x44
function function_43124a8f() {
    self showpart("tag_end");
    self hidepart("tag_start");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x410df64a, Offset: 0x8440
// Size: 0x44
function function_d0dd97c4() {
    self showpart("tag_beds_full");
    self hidepart("tag_beds_empty");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x2a9fa2a7, Offset: 0x8490
// Size: 0x44
function function_8c41f9de() {
    self showpart("tag_storage_full");
    self hidepart("tag_storage_empty");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0x41dd44e1, Offset: 0x84e0
// Size: 0x44
function function_f757dba3() {
    self showpart("tag_diner_full");
    self hidepart("tag_diner_empty");
}

// Namespace zm_white_toast/zm_white_toast
// Params 0, eflags: 0x1 linked
// Checksum 0xbd1e3f32, Offset: 0x8530
// Size: 0x44
function function_47550faa() {
    self showpart("tag_lounge_full");
    self hidepart("tag_lounge_empty");
}


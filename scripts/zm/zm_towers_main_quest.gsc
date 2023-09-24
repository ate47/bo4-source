// Atian COD Tools GSC decompiler test
#using scripts\zm\weapons\zm_weap_crossbow.gsc;
#using scripts\zm\zm_towers_util.gsc;
#using scripts\zm\zm_towers_special_rounds.gsc;
#using scripts\zm\zm_towers_shield.gsc;
#using script_27a3bb6bb72e6f1a;
#using scripts\zm\zm_towers_crowd.gsc;
#using scripts\zm\zm_towers_challenges.gsc;
#using scripts\zm\zm_towers_achievements.gsc;
#using scripts\zm\zm_towers.gsc;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc;
#using script_2affe92664ace48d;
#using script_684097158a90b5c3;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_aoe.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\teleport_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\abilities\ability_util.gsc;

#namespace zm_towers_main_quest;

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x2
// Checksum 0x6398ecd7, Offset: 0x1688
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_towers_main_quest", &__init__, &__main__, undefined);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xd8a4b5c7, Offset: 0x16d8
// Size: 0x24
function __init__() {
    callback::on_finalize_initialization(&init);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1708
// Size: 0x4
function __main__() {
    
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xadaf6fb8, Offset: 0x1718
// Size: 0xa5c
function init() {
    scene::add_scene_func(#"hash_18b88682c325ad3d", &function_5a2db619, "play");
    scene::add_scene_func(#"hash_18b88682c325ad3d", &function_fc8b8d1d, "done");
    scene::add_scene_func(#"hash_18b88682c325ad3d", &function_fc8b8d1d, "stop");
    scene::add_scene_func(#"hash_18b88682c325ad3d", &function_fcff05cf, "Shot170");
    zm_towers_crowd::function_696a8df0(0);
    zm_towers_crowd::function_aec5ec5a(0);
    zm_towers_crowd::function_8237489a(0);
    level function_64c8ff91();
    level thread function_4802e02e();
    level._zm_blocker_trigger_think_return_override = &function_954d42e2;
    function_24479f38();
    function_777126b7();
    function_391f28bc();
    init_defend();
    level thread function_a2e1777c();
    level thread key_glint();
    zm_sq::register(#"main_quest", #"hash_616226b026783ca3", #"hash_616226b026783ca3", &function_a3cd497c, &function_ff02b202);
    zm_sq::register(#"hash_7848e22b4305215c", #"collect_charcoal", #"collect_charcoal", &collect_charcoal_setup, &collect_charcoal_cleanup);
    zm_sq::register(#"hash_39d41ab4004ca686", #"hash_1c34d1cbe7a35ae1", #"hash_1c34d1cbe7a35ae1", &function_e289a374, &function_468cbe89);
    zm_sq::register(#"hash_1da6434ce50c3713", #"collect_dung", #"collect_dung", &collect_dung_setup, &collect_dung_cleanup);
    zm_sq::register(#"main_quest", #"collect_ingredients", #"collect_ingredients", &collect_ingredients_setup, &collect_ingredients_cleanup);
    zm_sq::register(#"main_quest", #"mix_fertilizer", #"mix_fertilizer", &mix_fertilizer_setup, &mix_fertilizer_cleanup);
    zm_sq::register(#"main_quest", #"place_fertilizer", #"place_fertilizer", &place_fertilizer_setup, &place_fertilizer_cleanup);
    zm_sq::register(#"main_quest", #"hash_c165871a3fda034", #"hash_c165871a3fda034", &function_b288e20a, &function_2a061a2b);
    zm_sq::register(#"main_quest", #"activate_bulls", #"activate_bulls", &activate_bulls_setup, &activate_bulls_cleanup);
    zm_sq::register(#"main_quest", #"activate_puzzle", #"activate_puzzle", &activate_puzzle_setup, &activate_puzzle_cleanup);
    zm_sq::register(#"main_quest", #"hash_1cf74a26bf73d769", #"hash_1cf74a26bf73d769", &function_5e35bafd, &function_10cf7d43);
    zm_sq::register(#"main_quest", #"hash_73c85b5a7924fcfb", #"hash_73c85b5a7924fcfb", &function_49a07fa0, &function_99cfe16e);
    zm_sq::register(#"main_quest", #"activate_lightning_balls", #"activate_lightning_balls", &function_6c17207c, &function_fd901116);
    zm_sq::register(#"main_quest", #"gladiator_round", #"gladiator_round", &gladiator_round_setup, &gladiator_round_cleanup);
    zm_sq::register(#"main_quest", #"maelstrom_completed", #"maelstrom_completed", &maelstrom_completed_setup, &maelstrom_completed_cleanup);
    zm_sq::register(#"main_quest", #"light_runes", #"light_runes", &light_runes_setup, &light_runes_cleanup);
    zm_sq::register(#"main_quest", #"pressure_plate", #"pressure_plate", &pressure_plate_setup, &pressure_plate_cleanup);
    zm_sq::register(#"main_quest", #"trilane_defend", #"trilane_defend", &trilane_defend_setup, &trilane_defend_cleanup);
    zm_sq::register(#"main_quest", #"boss_battle", #"boss_battle", &function_bd321d77, &function_138874e8, 1, &zm_towers_achievements::function_a24ba4fc);
    zm_sq::start(#"main_quest", 1);
    waitframe(1);
    level clientfield::set("" + #"hash_16b9e3d69cb7a017", 0);
    t_zm_towers_boss_teleport = getent("t_zm_towers_boss_teleport", "targetname");
    t_zm_towers_boss_teleport sethintstring("");
    if (zm_utility::is_ee_enabled() && zm_custom::function_901b751c(#"hash_3c5363541b97ca3e")) {
        level flag::wait_till("all_players_spawned");
        t_zm_towers_boss_teleport setinvisibletoall();
        level thread function_2f146aa0(t_zm_towers_boss_teleport);
    } else {
        t_zm_towers_boss_teleport delete();
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x0
// Checksum 0x983dcb94, Offset: 0x2180
// Size: 0x37c
function function_7dcdbfde() {
    level.devcheater = 1;
    self zm_score::add_to_player_score(100000);
    foreach (i, var_16c042b8 in self.var_c27f1e90) {
        if (!isinarray(self.var_466b927f, var_16c042b8)) {
            self thread zm_perks::function_9bdf581f(var_16c042b8, i);
        }
    }
    var_5d62d3c8 = array::randomize(array(#"ar_accurate_t8", #"ar_fastfire_t8", #"ar_stealth_t8", #"ar_modular_t8", #"smg_capacity_t8", #"tr_powersemi_t8", #"lmg_heavy_t8", #"lmg_spray_t8", #"lmg_standard_t8", #"ww_crossbow_t8"));
    array::random(getplayers()) giveweapon(getweapon(#"homunculus"));
    foreach (w_primary in self getweaponslistprimaries()) {
        self takeweapon(w_primary);
    }
    for (i = 0; i < zm_utility::get_player_weapon_limit(self); i++) {
        weapon = getweapon(var_5d62d3c8[i]);
        weapon = get_upgrade(weapon.rootweapon);
        weapon = self zm_weapons::give_build_kit_weapon(weapon);
        if (isdefined(level.aat_in_use) && level.aat_in_use && zm_weapons::weapon_supports_aat(weapon)) {
            self thread aat::acquire(weapon);
            self zm_pap_util::repack_weapon(weapon, 4);
        }
    }
    self switchtoweapon(weapon);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x91738318, Offset: 0x2508
// Size: 0x74
function get_upgrade(weapon) {
    if (isdefined(level.zombie_weapons[weapon]) && isdefined(level.zombie_weapons[weapon].upgrade_name)) {
        return zm_weapons::get_upgrade_weapon(weapon, 0);
    } else {
        return zm_weapons::get_upgrade_weapon(weapon, 1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x5ba62090, Offset: 0x2588
// Size: 0x4c4
function function_64c8ff91() {
    level flag::init(#"hash_4fd3d0c01f9b4c30");
    level flag::init(#"hash_23c79f4deefd8aa1");
    level flag::init(#"hash_7f6689c71e55e8ab");
    level flag::init(#"hash_4866241882c534b7");
    level flag::init(#"hash_34294ceb082c5d8f");
    level flag::init(#"hash_4f293396150d2c00");
    level flag::init(#"hash_353dcb95f778ad73");
    level flag::init(#"hash_37071af70fe7a9f2");
    level flag::init(#"collect_ingredients_completed");
    level flag::init(#"collect_charcoal_completed");
    level flag::init(#"hash_4c6ced4815715faf");
    level flag::init(#"collect_dung_completed");
    level flag::init(#"mix_fertilizer_completed");
    level flag::init(#"place_fertilizer_completed");
    level flag::init(#"hash_498204258011f15e");
    level flag::init(#"bull_heads_completed");
    level flag::init(#"hash_7136198009a72989");
    level flag::init(#"hash_36efad26d2c9c9cd");
    level flag::init(#"hash_e35ac19ee7b732c");
    level flag::init(#"hash_768860cb3ad76c68");
    level flag::init(#"hash_77bd156a70de5aa3");
    level flag::init(#"hash_3666dca19f0f98b3");
    level flag::init(#"hash_1d004da0a75202bc");
    level flag::init(#"hash_35bd62e100e54ab3");
    level flag::init(#"hash_4f15d2623e98015d");
    level flag::init(#"hash_5734e11875c30d69");
    level flag::init(#"hash_50e2bacfe0486f6a");
    level flag::init(#"hash_4f26632e308bd2e6");
    level flag::init(#"hash_415c59c3573153ff");
    level flag::init(#"hash_2c274140cd602e60");
    level flag::init(#"hash_5e49848f6ac0bc6b");
    level flag::init(#"hash_4feaeb49c7362da7");
    level flag::init(#"hash_403b629f7e5829ee");
    level flag::init(#"hash_20c92720a4602dc7");
    level flag::init(#"hash_cad6742c753621");
    level flag::init(#"hash_6b64093194524df3");
    level flag::init(#"hash_2bf040db75b1dac7");
    level flag::init(#"hash_277d03629ade12e8");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xeb1acdfa, Offset: 0x2a58
// Size: 0x84
function function_a3cd497c(b_skipped) {
    waitframe(1);
    level zm_ui_inventory::function_7df6bb60(#"zm_towers_objective_progress", 0);
    if (b_skipped) {
        return;
    }
    level flag::wait_till("zm_towers_pap_quest_completed");
    playsoundatposition(#"hash_6bc2c95bdaed3aed", (0, 0, 0));
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x4655673e, Offset: 0x2ae8
// Size: 0x1e
function function_ff02b202(b_skipped, var_19e802fa) {
    if (b_skipped) {
        return;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x469ba249, Offset: 0x2b10
// Size: 0x174
function function_24479f38() {
    level.var_5cb7d214 = {#n_dung:0, #var_cdbfd18f:0, #var_952cc98d:0, #n_charcoal:0, #var_e913cb3d:[], #n_wood:0};
    level.var_5cb7d214.var_5170a4f8 = array("danu_basement_to_bottom_floor", "danu_bottom_floor_to_top_floor", "connect_starting_area_to_danu_hallway", "connect_danu_tower", "connect_danu_basement_to_danu_ra_tunnel", "connect_danu_ra_bridge");
    a_mdl_pieces = getentarray("fertilizer_pieces", "script_noteworthy");
    array::run_all(a_mdl_pieces, &hide);
    var_40a1ab08 = getent("fertilizer_hop", "targetname");
    var_40a1ab08 hide();
    level scene::add_scene_func("p8_fxanim_zm_towers_odin_cauldron_chain_shackle_bundle", &function_4e1d219c, "play");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xe1a3a16b, Offset: 0x2c90
// Size: 0x84
function function_4e1d219c(a_ents) {
    if (self.targetname === "s_fertilizer_dangle") {
        var_71cb7fcb = a_ents[#"prop 1"];
        var_6e231fa2 = getent("mdl_fertilizer_component_1", "targetname");
        var_6e231fa2 linkto(var_71cb7fcb, "shackle_attach_jnt");
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xe5f852e8, Offset: 0x2d20
// Size: 0x114
function collect_charcoal_setup(b_skipped) {
    var_f63e57ee = getentarray("t_fertilizer_tower", "targetname");
    array::thread_all(var_f63e57ee, &function_b2938ba0);
    level clientfield::set("" + #"hash_445060dbbf244b04", 1);
    level clientfield::set("" + #"hash_a2fb645044ed12e", 1);
    level thread function_e1629752();
    level thread function_12944b2e();
    level flag::wait_till(#"collect_charcoal_completed");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xff915a32, Offset: 0x2e40
// Size: 0x34
function collect_charcoal_cleanup(b_skipped, var_19e802fa) {
    level flag::set(#"collect_charcoal_completed");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xfa47e13d, Offset: 0x2e80
// Size: 0x44
function function_e289a374(b_skipped) {
    level thread function_965e1613();
    level flag::wait_till(#"hash_4c6ced4815715faf");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xc162b00e, Offset: 0x2ed0
// Size: 0x34
function function_468cbe89(b_skipped, var_19e802fa) {
    level flag::set(#"hash_4c6ced4815715faf");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xa3bd445b, Offset: 0x2f10
// Size: 0x44
function collect_dung_setup(b_skipped) {
    level thread function_523131e6();
    level flag::wait_till(#"collect_dung_completed");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x7cd2dcd1, Offset: 0x2f60
// Size: 0x34
function collect_dung_cleanup(b_skipped, var_19e802fa) {
    level flag::set(#"collect_dung_completed");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x78aea733, Offset: 0x2fa0
// Size: 0x12c
function collect_ingredients_setup(b_skipped) {
    level zm_ui_inventory::function_7df6bb60(#"zm_towers_objective_progress", 1);
    if (b_skipped) {
        level flag::set(#"collect_ingredients_completed");
        return;
    }
    zm_sq::start(#"hash_7848e22b4305215c");
    zm_sq::start(#"hash_39d41ab4004ca686");
    zm_sq::start(#"hash_1da6434ce50c3713");
    level flag::wait_till_all(array(#"collect_charcoal_completed", #"hash_4c6ced4815715faf", #"collect_dung_completed"));
    level flag::set(#"collect_ingredients_completed");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x7ebbd6bd, Offset: 0x30d8
// Size: 0x34
function collect_ingredients_cleanup(b_skipped, var_19e802fa) {
    level flag::set(#"collect_ingredients_completed");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf630cbbd, Offset: 0x3118
// Size: 0x2ac
function function_e1629752() {
    level endon(#"end_game");
    var_9b1b2f2d = struct::get(#"hash_224dd0372d9a6eff");
    var_9b1b2f2d zm_unitrigger::create(&function_104e396b, (96, 180, 96), undefined, undefined, 1);
    var_4d573637 = getentarray("mdl_fertilizer_component_1", "targetname");
    while (1) {
        s_waitresult = undefined;
        s_waitresult = var_9b1b2f2d waittill(#"trigger_activated");
        foreach (i, var_d3c8748e in var_4d573637) {
            if (i >= 1) {
                break;
            }
            var_d3c8748e show();
            var_d3c8748e playsound(#"hash_59ed73d06252024c");
        }
        for (i = 0; i < level.var_5cb7d214.n_wood; i++) {
            if (!isdefined(level.var_5cb7d214.var_e913cb3d)) {
                level.var_5cb7d214.var_e913cb3d = [];
            } else if (!isarray(level.var_5cb7d214.var_e913cb3d)) {
                level.var_5cb7d214.var_e913cb3d = array(level.var_5cb7d214.var_e913cb3d);
            }
            level.var_5cb7d214.var_e913cb3d[level.var_5cb7d214.var_e913cb3d.size] = level.round_number;
        }
        level.var_5cb7d214.n_wood = 0;
        if (level.var_5cb7d214.var_e913cb3d.size >= 1) {
            var_9b1b2f2d zm_unitrigger::unregister_unitrigger(var_9b1b2f2d.s_unitrigger);
            break;
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xb39be97f, Offset: 0x33d0
// Size: 0x424
function function_12944b2e() {
    level endon(#"end_game");
    if (getdvarint(#"zm_debug_ee", 0)) {
        var_4059c402 = 1;
    } else {
        var_4059c402 = 3;
    }
    var_4d573637 = getentarray("mdl_fertilizer_component_1", "targetname");
    while (1) {
        level waittill(#"end_of_round");
        var_8eba7a9f = 0;
        foreach (n_charcoal in level.var_5cb7d214.var_e913cb3d) {
            var_6e231fa2 = var_4d573637[var_8eba7a9f];
            if (isdefined(var_6e231fa2)) {
                if (var_4059c402 > 1) {
                    if (level.round_number == n_charcoal + 1) {
                        var_6e231fa2 clientfield::set("" + #"hash_c382c02584ba249", 1);
                    }
                    if (level.round_number == n_charcoal + 3) {
                        var_6e231fa2 playsound(#"hash_5f8e33ac1c927130");
                        var_6e231fa2 clientfield::set("" + #"hash_c382c02584ba249", 0);
                        var_6e231fa2 clientfield::set("" + #"hash_273efcc293063e5e", 1);
                        var_6e231fa2 thread function_d4646ede();
                    }
                } else {
                    var_6e231fa2 setmodel(#"hash_4286272708c5e5c0");
                }
            }
            if (level.round_number >= n_charcoal + var_4059c402) {
                var_8eba7a9f++;
            }
        }
        if (var_8eba7a9f >= 1) {
            var_9b1b2f2d = struct::get(#"hash_224dd0372d9a6eff");
            e_player = var_9b1b2f2d zm_unitrigger::function_fac87205("", (96, 180, 96), 1);
            e_player thread zm_vo::function_a2bd5a0c(#"hash_c393cb786feb084", 0, 0, 9999, 1);
            e_player playsound(#"hash_35c03e3efe6d4487");
            foreach (var_d3c8748e in var_4d573637) {
                if (isdefined(var_d3c8748e)) {
                    var_d3c8748e delete();
                }
            }
            level clientfield::set("" + #"hash_a2fb645044ed12e", 0);
            break;
        }
    }
    level flag::set(#"collect_charcoal_completed");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x70ab2cdc, Offset: 0x3800
// Size: 0x9c
function function_d4646ede() {
    self endon(#"death");
    wait(5);
    level clientfield::set("" + #"hash_445060dbbf244b04", 0);
    self setmodel(#"hash_4286272708c5e5c0");
    self clientfield::set("" + #"hash_273efcc293063e5e", 0);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x9826442c, Offset: 0x38a8
// Size: 0x30
function function_104e396b(e_player) {
    if (level.var_5cb7d214.n_wood >= 1) {
        return 1;
    }
    return 0;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x3d09a2b0, Offset: 0x38e0
// Size: 0xa8
function function_b2938ba0() {
    self endon(#"death", #"wood_dropped");
    level endon(#"end_game", #"wood_completed");
    while (1) {
        s_waitresult = undefined;
        s_waitresult = level waittill(#"hash_27a9b4863f38ef7c");
        var_90db0e3c = s_waitresult.var_90db0e3c;
        var_90db0e3c thread function_12bc0c40(self);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xad728b81, Offset: 0x3990
// Size: 0x404
function function_12bc0c40(var_c58a9909) {
    while (isdefined(self)) {
        foreach (player in level.players) {
            if (self istouching(player)) {
                return;
            }
        }
        if (isdefined(self.var_56226f70) && self.var_56226f70 || isdefined(var_c58a9909.var_1d6dd729) && var_c58a9909.var_1d6dd729) {
            return;
        }
        if (self istouching(var_c58a9909)) {
            self.var_56226f70 = 1;
        }
        if (isdefined(self.var_56226f70) && self.var_56226f70) {
            var_4cf59c29 = getentarray(var_c58a9909.target, "targetname");
            var_3c244cd3 = struct::get_array(var_c58a9909.target);
            var_6e231fa2 = arraygetclosest(self.origin, var_4cf59c29);
            s_loc = arraygetclosest(self.origin, var_3c244cd3);
            var_6e231fa2 show();
            var_6e231fa2 setmodel(#"hash_4973461a43fcb56");
            var_6e231fa2 clientfield::increment("" + #"hash_6ff3eb2dd0078a51");
            var_749ba981 = util::spawn_model(#"hash_77659f61538a4beb", var_6e231fa2.origin, var_6e231fa2.angles);
            var_749ba981 moveto(s_loc.origin, 0.5);
            var_c58a9909.var_1d6dd729 = 1;
            var_8673cc35 = getentarray("t_fertilizer_tower", "targetname");
            array::notify_all(var_8673cc35, #"wood_dropped");
            var_749ba981 waittill(#"movedone");
            var_749ba981 playsound(#"hash_119d4d341483b32c");
            var_536e9d28 = s_loc zm_unitrigger::function_fac87205("", 96, 1);
            var_536e9d28 thread zm_vo::function_a2bd5a0c(#"hash_13750f5daa5486e6", 0, 0, 9999, 1);
            var_536e9d28 playsound(#"hash_30b990837c062495");
            level.var_5cb7d214.n_wood++;
            if (isdefined(var_749ba981)) {
                var_749ba981 delete();
            }
            if (level.var_5cb7d214.n_wood >= 1) {
                level notify(#"wood_completed");
            }
            return;
        }
        waitframe(1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf6a3e7a7, Offset: 0x3da0
// Size: 0x384
function function_965e1613() {
    level endon(#"end_game");
    var_d3dd963d = struct::get_array(#"hash_4617b99d3d90b7fc");
    s_skull = array::random(var_d3dd963d);
    var_7b9ef77a = getent("mdl_fertilizer_component_2", "targetname");
    if (!isdefined(s_skull.radius)) {
        s_skull.radius = 160;
    }
    var_7b9ef77a.origin = s_skull.origin;
    var_7b9ef77a.angles = s_skull.angles;
    var_7b9ef77a show();
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            level thread function_8bcc049f(s_skull);
        }
    #/
    while (1) {
        s_waitresult = undefined;
        s_waitresult = level waittill(#"hero_weapon_activated");
        if (!isdefined(s_waitresult.e_player)) {
            continue;
        }
        if (distance(s_waitresult.e_player.origin, s_skull.origin) < s_skull.radius) {
            if (isdefined(s_skull.target)) {
                var_c038b69d = struct::get(s_skull.target);
                var_7b9ef77a playsound(#"hash_67ab50b44ebf94a7");
                var_7b9ef77a moveto(var_c038b69d.origin, 0.5);
                var_7b9ef77a rotateto(var_c038b69d.angles, 0.5);
                var_7b9ef77a waittill(#"movedone");
                var_7b9ef77a playsound(#"hash_f210344da062582");
            }
            e_player = var_7b9ef77a zm_unitrigger::function_fac87205("", 96, 1);
            if (isdefined(e_player)) {
                e_player playsound(#"hash_1c2e8e92fd97011f");
                e_player thread zm_vo::function_a2bd5a0c(#"hash_44a710040a5cf058", 0, 0, 9999, 1);
            }
            break;
        }
    }
    level notify(#"hash_3da6bb0f657559c0");
    level.var_5cb7d214.var_952cc98d++;
    var_7b9ef77a delete();
    level thread function_9774bbc6();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x0
// Checksum 0xce138aa1, Offset: 0x4130
// Size: 0x86
function function_8bcc049f(s_skull) {
    /#
        level endon(#"end_game", #"hash_3da6bb0f657559c0", #"collect_ingredients_completed");
        while (1) {
            circle(s_skull.origin, 64, (0, 1, 0), 0, 1, 1);
            waitframe(1);
        }
    #/
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x223d1f4c, Offset: 0x41c0
// Size: 0x4bc
function function_9774bbc6() {
    self notify("991c4b53aef9eda");
    self endon("991c4b53aef9eda");
    level endon(#"end_game", #"hash_4c6ced4815715faf");
    if (level flag::get(#"hash_4c6ced4815715faf")) {
        return;
    }
    var_d3dd963d = struct::get_array(#"hash_439f49cad20fb09c");
    s_grinder = array::random(var_d3dd963d);
    mdl_grinder = getent("mdl_grinder", "targetname");
    mdl_grinder show();
    mdl_grinder.origin = s_grinder.origin;
    mdl_grinder.angles = s_grinder.angles;
    mdl_grinder hidepart("skull_jnt");
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            level thread function_2fe17822(mdl_grinder);
        }
    #/
    while (level.var_5cb7d214.var_952cc98d == 0) {
        wait(1);
    }
    mdl_grinder zm_unitrigger::function_fac87205("", 96, 1);
    mdl_grinder playsound(#"hash_40a6a28923cf0f3e");
    mdl_grinder showpart("skull_jnt");
    mdl_grinder val::set(#"grinder", "takedamage", 1);
    mdl_grinder.health = 9999;
    while (1) {
        s_waitresult = undefined;
        s_waitresult = mdl_grinder waittill(#"damage");
        mdl_grinder.health = 9999;
        if (isplayer(s_waitresult.attacker) && zm_weap_crossbow::function_c6da1395(s_waitresult.weapon, s_waitresult.attacker)) {
            if (level.var_5cb7d214.var_cdbfd18f < 2) {
                mdl_grinder zm_weap_crossbow::function_6d8527c2(s_waitresult, #"p8_fxanim_zm_towers_grinder_bundle", "idle");
            } else {
                mdl_grinder zm_weap_crossbow::function_6d8527c2(s_waitresult, #"p8_fxanim_zm_towers_grinder_bundle", "completed");
            }
            if (zm_weap_crossbow::function_a2c527e5(s_waitresult.weapon)) {
                level.var_5cb7d214.var_cdbfd18f = level.var_5cb7d214.var_cdbfd18f + 1.5;
            } else {
                level.var_5cb7d214.var_cdbfd18f = level.var_5cb7d214.var_cdbfd18f + 1;
            }
            if (level.var_5cb7d214.var_cdbfd18f >= 3) {
                mdl_grinder hidepart("skull_jnt");
                e_player = mdl_grinder zm_unitrigger::function_fac87205("", 96, 1);
                e_player playsound(#"hash_4061dc3dc7f197ba");
                e_player thread zm_vo::function_a2bd5a0c(#"hash_dedd8b6d4d6c33e", 0, 0, 9999, 1);
                mdl_grinder hidepart("tag_link_bone_dust");
                break;
            }
        }
    }
    level flag::set(#"hash_4c6ced4815715faf");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x0
// Checksum 0xbc5b2b7b, Offset: 0x4688
// Size: 0x9e
function function_2fe17822(mdl_grinder) {
    /#
        mdl_grinder endon(#"death");
        level endon(#"end_game", #"hash_4c6ced4815715faf", #"collect_ingredients_completed");
        while (1) {
            circle(mdl_grinder.origin, 32, (0, 1, 0), 0, 1, 1);
            waitframe(1);
        }
    #/
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe9a74816, Offset: 0x4730
// Size: 0xe4
function function_523131e6() {
    level endon(#"end_game");
    while (1) {
        s_waitresult = undefined;
        s_waitresult = level waittill(#"hash_694f58e8bc5dd48");
        level.var_5cb7d214.n_dung++;
        e_player = s_waitresult.e_player;
        e_player thread zm_vo::function_a2bd5a0c(#"hash_2e56a3f1fc967c9b", 0, 0, 9999, 1);
        if (level.var_5cb7d214.n_dung >= 1) {
            break;
        }
    }
    level flag::set(#"collect_dung_completed");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x73af1d5f, Offset: 0x4820
// Size: 0x284
function mix_fertilizer_setup(b_skipped) {
    level endon(#"end_game");
    if (b_skipped) {
        level flag::set(#"mix_fertilizer_completed");
        return;
    }
    var_108c7af7 = struct::get(#"hash_44451a49b3653789");
    var_108c7af7 zm_unitrigger::function_fac87205("", 96, 1);
    var_425d1723 = getent("mdl_pile", "targetname");
    var_425d1723 show();
    var_425d1723 playsound(#"hash_3cee8f860c831f0b");
    if (getdvarint(#"zm_debug_ee", 0)) {
        level waittill(#"end_of_round");
    } else {
        level waittill(#"start_of_round");
        level waittill(#"end_of_round");
    }
    var_425d1723 setmodel(#"hash_571dce3dbd970ee6");
    level clientfield::set("" + #"hash_5a3e1454226ef7a4", 1);
    e_player = var_425d1723 zm_unitrigger::function_fac87205("", 96, 1);
    e_player playsound(#"hash_338c802929e278d4");
    level clientfield::set("" + #"hash_5a3e1454226ef7a4", 0);
    var_425d1723 delete();
    e_player thread zm_vo::function_a2bd5a0c(#"hash_4529b90b3d008c9f", 0, 0, 9999, 1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x89aa8f80, Offset: 0x4ab0
// Size: 0x34
function mix_fertilizer_cleanup(b_skipped, var_19e802fa) {
    level flag::set(#"mix_fertilizer_completed");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x9f1fdc7, Offset: 0x4af0
// Size: 0x31c
function place_fertilizer_setup(b_skipped) {
    level endon(#"end_game");
    if (b_skipped) {
        level flag::set(#"place_fertilizer_completed");
        return;
    }
    var_2317ee9f = struct::get(#"hash_3fda284f010e01fd");
    var_2317ee9f zm_unitrigger::function_fac87205("", 96, 1);
    var_2317ee9f.var_425d1723 = util::spawn_model(#"hash_571dce3dbd970ee6", var_2317ee9f.origin, var_2317ee9f.angles);
    var_2317ee9f.var_425d1723 setscale(1);
    var_2317ee9f.var_425d1723 clientfield::set("" + #"fertilizer_smell", 0);
    var_2317ee9f.var_425d1723 playsound(#"hash_5d534ac036533040");
    if (getdvarint(#"zm_debug_ee", 0)) {
        level waittill(#"end_of_round");
    } else {
        level waittill(#"end_of_round");
        level waittill(#"end_of_round");
        level waittill(#"end_of_round");
    }
    var_2317ee9f.var_425d1723 clientfield::set("" + #"fertilizer_smell", 1);
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            level thread function_1bd4c509(var_2317ee9f.var_425d1723);
        }
    #/
    while (1) {
        s_waitresult = undefined;
        s_waitresult = level waittill(#"plasmatic_burst");
        var_5f731d93 = s_waitresult.var_ac85a15f.origin;
        if (distance(var_2317ee9f.origin, var_5f731d93) <= 120) {
            var_2317ee9f.var_425d1723 fertilizer_explosion();
            break;
        }
        waitframe(1);
    }
    wait(3);
    level flag::set(#"place_fertilizer_completed");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x0
// Checksum 0xffd562a4, Offset: 0x4e18
// Size: 0x8e
function function_1bd4c509(var_425d1723) {
    /#
        var_425d1723 endon(#"death");
        level endon(#"end_game", #"place_fertilizer_completed");
        while (1) {
            circle(var_425d1723.origin, 120, (1, 0, 0), 0, 1, 1);
            waitframe(1);
        }
    #/
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x383f6790, Offset: 0x4eb0
// Size: 0x44
function fertilizer_explosion() {
    level lui::screen_flash(0.2, 0.5, 1, 0.8, "white");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x97c5351, Offset: 0x4f00
// Size: 0xb4
function place_fertilizer_cleanup(b_skipped, var_19e802fa) {
    level flag::set(#"place_fertilizer_completed");
    var_40a1ab08 = getent("fertilizer_hop", "targetname");
    var_40a1ab08 show();
    var_40a1ab08 playsound(#"hash_bde75843d826490");
    var_40a1ab08 playloopsound(#"hash_63dcc2bd59631940");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xc3f50747, Offset: 0x4fc0
// Size: 0x7e4
function function_b288e20a(b_skipped) {
    if (b_skipped) {
        return;
    }
    function_3a5c3a3c();
    zm_bgb_anywhere_but_here::function_886fce8f(0);
    playsoundatposition(#"hash_c648800c55e1554", (0, 0, 0));
    level thread function_dceecb87();
    exploder::exploder("exp_danu_portal");
    array::thread_all(level.players, &val::set, #"chaos_teleport", "ignoreme", 1);
    wait(1);
    level.var_9a992b09 = 1;
    level flag::set("pause_round_timeout");
    scene::add_scene_func(#"p8_fxanim_zm_towers_chaos_pustule_bundle", &function_af1344d5, "init", 1);
    foreach (player in level.players) {
        player forcestreambundle(#"p8_fxanim_zm_towers_chaos_pustule_bundle");
    }
    var_26e2fa4f = struct::get(#"hash_397165fe5f092f4");
    var_26e2fa4f scene::init();
    level util::delay(2, undefined, &function_1e0c088f);
    level zm_utility::function_9ad5aeb1(1);
    level.var_78acec0a = 1;
    level notify(#"force_transformations");
    level.var_c9f5947d = 1;
    a_s_spawns = struct::get_array(#"hash_7d29cf21e3c8924a");
    level util::delay(6, undefined, &function_f082568e, a_s_spawns);
    level waittill(#"hash_4a0610c40e953981");
    level notify(#"hash_1958c9ee2f84d722");
    zm_transform::function_e95ec8df();
    function_1efe04ba(array("danu_basement_to_bottom_floor"));
    level thread zm_audio::sndannouncerplayvox(#"hash_70f3ffdacf094858");
    level flag::set(#"hash_55461b9e82131f3");
    scene::remove_scene_func(#"p8_fxanim_zm_towers_chaos_pustule_bundle", &function_af1344d5, "init");
    scene::add_scene_func(#"p8_fxanim_zm_towers_chaos_pustule_bundle", &function_af1344d5, "init", 1);
    var_26e2fa4f = struct::get(#"hash_7affc75e99913586");
    var_26e2fa4f scene::init();
    a_s_spawns = struct::get_array(#"hash_3770024d403ec8f");
    level thread function_f082568e(a_s_spawns);
    level waittill(#"hash_4a0610c40e953981");
    level notify(#"hash_1958c9ee2f84d722");
    zm_transform::function_e95ec8df();
    function_1efe04ba(array("danu_bottom_floor_to_top_floor"));
    level flag::set(#"hash_1596bce02bfee2fe");
    level thread zm_audio::sndannouncerplayvox(#"hash_5b34919a0ea0ac80");
    scene::remove_scene_func(#"p8_fxanim_zm_towers_chaos_pustule_bundle", &function_af1344d5, "init");
    scene::add_scene_func(#"p8_fxanim_zm_towers_chaos_pustule_bundle", &function_af1344d5, "init", 0);
    var_26e2fa4f = struct::get(#"hash_5373280f2e2970d2");
    var_26e2fa4f scene::init();
    a_s_spawns = struct::get_array(#"hash_7eb507df7ad5934f");
    level thread function_f082568e(a_s_spawns);
    level waittill(#"hash_4a0610c40e953981");
    playsoundatposition(#"hash_1fd377e4062391ab", (0, 0, 0));
    level notify(#"hash_1958c9ee2f84d722");
    zm_transform::function_e95ec8df();
    function_1efe04ba(level.var_5cb7d214.var_5170a4f8);
    pause_zombies(1, array(1, 2, 0.5));
    level thread zm_towers_util::show_zbarriers();
    level util::delay(1, undefined, &teleport::team, #"s_teleport_end_decay", undefined, 1);
    level util::delay(1, undefined, &clientfield::set, "" + #"hash_3c58464f16d8a1be", 0);
    level flag::set(#"hash_498204258011f15e");
    zm_bgb_anywhere_but_here::function_886fce8f(1);
    level clientfield::set("" + #"hash_73088ea3053b96f1", 0);
    level thread function_8be7b779();
    wait(7);
    pause_zombies(0);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xe3dddad2, Offset: 0x57b0
// Size: 0x74
function function_af1344d5(a_ents, var_4d6e64ec) {
    a_ents[#"blight_blister"] thread function_d1499d43(var_4d6e64ec);
    scene::remove_scene_func(#"p8_fxanim_zm_towers_chaos_pustule_bundle", &function_af1344d5, "init");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa0953d85, Offset: 0x5830
// Size: 0xec
function function_dceecb87() {
    e_player = array::random(zm_vo::function_347f7d34());
    if (isdefined(e_player)) {
        e_player zm_vo::function_a2bd5a0c(#"hash_628ca125e0395755", 0, 0, 9999, 1);
    }
    level zm_audio::sndannouncerplayvox(#"hash_bc10546af7f7b09");
    e_player = array::random(zm_vo::function_347f7d34());
    if (isdefined(e_player)) {
        e_player zm_vo::function_a2bd5a0c(#"hash_2c87f4c5bf8b38f4", 0, 0, 9999, 1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x58c45288, Offset: 0x5928
// Size: 0x8c
function function_8be7b779() {
    level zm_audio::sndannouncerplayvox(#"hash_3d5fccf222ba3ab6");
    e_player = array::random(zm_vo::function_347f7d34());
    if (isdefined(e_player)) {
        e_player zm_vo::function_a2bd5a0c(#"hash_2b150384d50cde7c", 0, 0, 9999, 1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xe189f5b3, Offset: 0x59c0
// Size: 0x328
function function_2a061a2b(b_skipped, var_19e802fa) {
    if (b_skipped || var_19e802fa) {
        pause_zombies(0);
    }
    if (var_19e802fa) {
        teleport::team("s_teleport_end_decay");
    }
    level.var_78acec0a = undefined;
    level.var_c9f5947d = undefined;
    level.var_5f911d8e = undefined;
    level.var_9a992b09 = undefined;
    level flag::clear("pause_round_timeout");
    function_1efe04ba(level.var_5cb7d214.var_5170a4f8);
    level flag::set(#"hash_498204258011f15e");
    level flag::set(#"hash_23c79f4deefd8aa1");
    foreach (player in level.players) {
        player function_66b6e720(#"p8_fxanim_zm_towers_chaos_pustule_bundle");
    }
    level clientfield::set("" + #"hash_3c58464f16d8a1be", 0);
    exploder::exploder("exp_danu_eyes");
    playsoundatposition(#"hash_6bc2c65bdaed35d4", (0, 0, 0));
    a_s_spawns = struct::get_array(#"player_respawn_point");
    var_cfbccfbf = array("zone_danu_basement_decayed", "zone_danu_ground_floor_decayed", "zone_danu_top_floor_decayed");
    foreach (s_spawn in a_s_spawns) {
        if (isinarray(var_cfbccfbf, s_spawn.script_noteworthy)) {
            a_s_player_spawns = struct::get_array(s_spawn.target);
            array::delete_all(a_s_player_spawns);
            s_spawn struct::delete();
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x5b193f8, Offset: 0x5cf0
// Size: 0x154
function function_1e0c088f() {
    level clientfield::set("" + #"hash_3c58464f16d8a1be", 1);
    level thread function_523135c3();
    zm_towers_util::function_6408c105();
    zm_zonemgr::enable_zone(#"zone_danu_basement_decayed");
    teleport::team("s_teleport_start_decay", undefined, 1);
    function_41c15ae9(level.var_5cb7d214.var_5170a4f8);
    exploder::stop_exploder("exp_danu_portal");
    array::thread_all(level.players, &val::reset, #"chaos_teleport", "ignoreme");
    level clientfield::set("" + #"hash_73088ea3053b96f1", 1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xaef073e4, Offset: 0x5e50
// Size: 0x28c
function function_3a5c3a3c() {
    level endon(#"end_game");
    trigger::wait_till("t_fertilizer_enter");
    var_2093456 = getent("t_fertilizer_enter", "targetname");
    var_b683ba09 = 0;
    var_2093456 playsound(#"hash_668420a3544ac61a");
    var_65cf92c1 = 13;
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            var_65cf92c1 = 3;
        }
    #/
    while (1) {
        var_eca6c0ef = 0;
        foreach (player in level.activeplayers) {
            if (!player istouching(var_2093456)) {
                var_eca6c0ef = 1;
                break;
            }
        }
        if (level flag::get("special_round") || level flag::get(#"hash_4fd3d0c01f9b4c30")) {
            waitframe(1);
            continue;
        }
        if (var_eca6c0ef) {
            var_b683ba09 = 0;
            pause_zombies(0);
            waitframe(1);
            continue;
        }
        /#
            if (var_b683ba09 > 0) {
                if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
                    iprintlnbold("damage03" + var_b683ba09);
                    println("damage03" + var_b683ba09);
                }
            }
        #/
        wait(1);
        var_b683ba09++;
        if (var_b683ba09 >= var_65cf92c1) {
            pause_zombies(1, 0);
            break;
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x8326eadb, Offset: 0x60e8
// Size: 0x20c
function function_f082568e(a_s_spawns) {
    level endon(#"end_game", #"hash_1958c9ee2f84d722", #"hash_498204258011f15e");
    var_e2f55613 = getspawnerarray("spawner_zm_zombie", "targetname")[0];
    var_3a5e9cb8 = 0;
    while (1) {
        s_spawn = array::random(a_s_spawns);
        ai = undefined;
        while (!isdefined(ai)) {
            ai = zombie_utility::spawn_zombie(var_e2f55613, "fertilizer_zombies", s_spawn, max(15, level.round_number));
            waitframe(1);
        }
        if (math::cointoss()) {
            ai.var_9528ba7a = 1;
            zm_transform::function_d2374144(ai, #"catalyst_corrosive");
            ai zombie_utility::set_zombie_run_cycle("sprint");
        }
        var_3a5e9cb8++;
        a_ai_zombies = zombie_utility::get_round_enemy_array();
        n_max_zombies = min(24, level.players.size * 4);
        if (a_ai_zombies.size < n_max_zombies) {
            wait(randomfloatrange(0.2, 0.5));
        } else if (var_3a5e9cb8 > n_max_zombies) {
            var_3a5e9cb8 = 0;
            wait(10);
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x7cb1c4e5, Offset: 0x6300
// Size: 0x558
function function_d1499d43(var_4d6e64ec = 0) {
    self notify("47305699003a9051");
    self endon("47305699003a9051");
    level endon(#"end_game");
    self clientfield::set("rob_zm_prop_fade", 1);
    self val::set(#"blight_blister", "takedamage", 1);
    self val::set(#"blight_blister", "allowdeath", 1);
    if (level.players.size == 1) {
        self.health = 25000;
    } else {
        self.health = 30000 * level.players.size;
    }
    self.maxhealth = self.health;
    self.var_dcef4be8 = 0;
    self.var_f3ab07e = 0;
    var_11ecbb2b = arraygetclosest(self.origin, level.players);
    while (self.health > 0) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"damage");
        if (isplayer(s_waitresult.attacker)) {
            if (self.health <= 0) {
                s_waitresult.attacker util::show_hit_marker(1);
            } else {
                s_waitresult.attacker util::show_hit_marker(0);
            }
            var_11ecbb2b = s_waitresult.attacker;
        }
        if (!self.var_dcef4be8 && self.health < self.maxhealth * 0.66) {
            self.var_dcef4be8 = 1;
            self thread scene::play(#"p8_fxanim_zm_towers_chaos_pustule_bundle", "damage01", self);
        }
        if (!self.var_f3ab07e && self.health < self.maxhealth * 0.33) {
            self.var_f3ab07e = 1;
            self thread scene::play(#"p8_fxanim_zm_towers_chaos_pustule_bundle", "damage02", self);
        }
    }
    foreach (player in level.activeplayers) {
        if (distance(self.origin, player.origin) < 256) {
            player clientfield::set_to_player("blight_father_vomit_postfx_clientfield", 1);
            player util::delay(3, "disconnect", &clientfield::set_to_player, "blight_father_vomit_postfx_clientfield", 0);
        }
    }
    self clientfield::set("blight_father_chaos_missile_explosion_clientfield", 1);
    self val::reset(#"blight_blister", "takedamage");
    self val::reset(#"blight_blister", "allowdeath");
    self thread scene::play(#"p8_fxanim_zm_towers_chaos_pustule_bundle", "damage03", self);
    /#
        if (getdvarint(#"hash_7919e37cd5d57659", 0)) {
            iprintlnbold("odin_top");
            println("odin_top");
        }
    #/
    if (var_4d6e64ec) {
        var_fc13edbc = groundtrace(var_11ecbb2b.origin + vectorscale((0, 0, 1), 8), var_11ecbb2b.origin + vectorscale((0, 0, -1), 100000), 0, var_11ecbb2b)[#"position"];
        level thread function_93e3f429(self.origin, var_fc13edbc);
    }
    level notify(#"hash_4a0610c40e953981");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x64a37258, Offset: 0x6860
// Size: 0x84
function function_93e3f429(v_start, v_end) {
    e_powerup = zm_powerups::specific_powerup_drop("full_ammo", v_start - vectorscale((0, 0, 1), 40), undefined, undefined, undefined, 1, 1);
    e_powerup moveto(v_end + vectorscale((0, 0, 1), 40), 1.5);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xbb4f022a, Offset: 0x68f0
// Size: 0x64
function function_523135c3() {
    level endon(#"hash_498204258011f15e");
    level waittill(#"end_game");
    level clientfield::set("" + #"hash_3c58464f16d8a1be", 0);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xdab29518, Offset: 0x6960
// Size: 0x5d6
function function_777126b7() {
    level.s_puzzle = spawnstruct();
    level.var_174c737b = getentarray("bull_head", "script_noteworthy");
    foreach (bull_head in level.var_174c737b) {
        bull_head hide();
        t_damage = getent(bull_head.target, "targetname");
        t_damage setinvisibletoall();
    }
    level.var_7ad3f55c = 0;
    level.var_c2374d4d = 0;
    level.var_4bfda88 = struct::get("s_ra_destroyer_soul_collect_end", "targetname");
    level.var_27e60fb6 = array(#"spawner_zm_gladiator_marauder", #"spawner_zm_gladiator_destroyer", #"spawner_zm_catalyst_plasma", #"spawner_zm_catalyst_corrosive", #"spawner_zm_catalyst_water", #"spawner_zm_catalyst_electric", #"spawner_zm_tiger");
    level.var_5e067d81 = getentarray("zm_puzzle_rune_round1", "script_noteworthy");
    level.var_f099a2a5 = getentarray("zm_puzzle_rune_round2", "script_noteworthy");
    level.var_5e067d81 = array::sort_by_script_int(level.var_5e067d81, 1);
    level.var_f099a2a5 = array::sort_by_script_int(level.var_f099a2a5, 1);
    level.var_82234300 = getent("mdl_ra_puzzle_activate_glyph1", "targetname");
    level.var_82234300 hide();
    level.var_8c8485cf = 0;
    var_b9272bd9 = array("b", "c", "d", "m", "p", "r", "t", "w");
    foreach (var_be1510fd in level.var_5e067d81) {
        var_be1510fd hide();
        foreach (var_9ffe8bc6 in var_b9272bd9) {
            var_be1510fd hidepart("tag_" + var_9ffe8bc6 + "_glyph");
            var_be1510fd hidepart("tag_" + var_9ffe8bc6 + "_glow");
        }
    }
    foreach (var_be1510fd in level.var_f099a2a5) {
        var_be1510fd hide();
        foreach (var_9ffe8bc6 in var_b9272bd9) {
            var_be1510fd hidepart("tag_" + var_9ffe8bc6 + "_glyph");
            var_be1510fd hidepart("tag_" + var_9ffe8bc6 + "_glow");
        }
    }
    level.var_b80418e2 = getent("s_puzzle_beam_start", "targetname");
    level.var_491c9d = getent("puzzle_complete_beam_start", "targetname");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x93f00051, Offset: 0x6f40
// Size: 0x39c
function activate_bulls_setup(b_skipped) {
    level endon(#"bull_heads_completed");
    level zm_ui_inventory::function_7df6bb60(#"zm_towers_objective_progress", 2);
    level clientfield::set("" + #"hash_57c08e5f4792690c", 1);
    if (b_skipped) {
        level.var_174c737b = array::randomize(level.var_174c737b);
        level.var_36116a82 = array(level.var_174c737b[0], level.var_174c737b[1], level.var_174c737b[2], level.var_174c737b[3]);
        return;
    }
    level.var_174c737b = array::randomize(level.var_174c737b);
    level.var_36116a82 = array(level.var_174c737b[0], level.var_174c737b[1], level.var_174c737b[2], level.var_174c737b[3]);
    foreach (var_95f17a69 in level.var_36116a82) {
        var_95f17a69 show();
        t_damage = getent(var_95f17a69.target, "targetname");
        t_damage setvisibletoall();
        t_damage thread function_51c4285f(var_95f17a69);
    }
    while (level.var_c2374d4d < 4) {
        level waittill(#"hash_6f1bcde6921bc480");
        level.var_c2374d4d++;
    }
    level.var_b80418e2 clientfield::set("ra_eyes_beam_fire", 1);
    wait(4);
    level.var_82234300 show();
    level.var_8c8485cf = 1;
    level.var_82234300 playsound(#"hash_708d124fb1b2203e");
    level.var_b42c7aba = level.var_82234300 zm_unitrigger::create(&function_e59f6c8d, 64, &function_d3e4e438);
    wait(2);
    level.var_b80418e2 clientfield::set("ra_eyes_beam_fire", 0);
    level flag::set(#"bull_heads_completed");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x93c1aea, Offset: 0x72e8
// Size: 0x154
function function_51c4285f(var_95f17a69) {
    level endon(#"end_game");
    self endon(#"death");
    while (1) {
        s_info = undefined;
        s_info = self waittill(#"damage");
        if (namespace_52d8d460::function_65a59ce0(s_info.weapon)) {
            playfx(level._effect[#"brazier_fire"], var_95f17a69.origin);
            var_95f17a69 playsound(#"hash_419d268160428733");
            level.var_7ad3f55c++;
            e_player = s_info.attacker;
            str_zone = e_player zm_utility::get_current_zone();
            spawn_ra_destroyer(var_95f17a69, str_zone);
            self delete();
            break;
        } else {
            continue;
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x914c008a, Offset: 0x7448
// Size: 0x1c0
function spawn_ra_destroyer(var_95f17a69, str_zone = "") {
    a_s_spawns = struct::get_array(var_95f17a69.target);
    s_spawn = a_s_spawns[0];
    if (a_s_spawns.size > 1 && str_zone != "") {
        str_tower = "odin_ground";
        switch (str_zone) {
        case #"zone_odin_top_floor":
            str_tower = "odin_top";
            break;
        case #"zone_odin_zeus_bridge":
            str_tower = "zeus";
            break;
        }
        foreach (s_option in a_s_spawns) {
            if (s_option.var_7ab423fe === str_tower) {
                s_spawn = s_option;
                break;
            }
        }
    }
    ai_destroyer = undefined;
    while (!isdefined(ai_destroyer)) {
        ai_destroyer = zombie_gladiator_util::function_69f309b(1, "ranged", &function_59d775d2, 1, s_spawn);
        waitframe(1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x5bd20aee, Offset: 0x7610
// Size: 0x4a4
function function_59d775d2(s_spot) {
    self endon(#"death");
    self val::set(#"hash_56df0defacc86bb7", "allowdeath", 0);
    self.var_1df64653 = 1;
    self.no_powerups = 1;
    self.var_126d7bef = 1;
    self.ignore_round_spawn_failsafe = 1;
    self.b_ignore_cleanup = 1;
    self.ignore_enemy_count = 1;
    var_405d29b6 = int(self.health * 3);
    self.health = var_405d29b6;
    self.maxhealth = var_405d29b6;
    namespace_81245006::initweakpoints(self, "c_t8_zmb_gladiator_dst_weakpoint_def");
    self ai::set_behavior_attribute("axe_throw", 0);
    self ai::set_behavior_attribute("run", 1);
    self thread zm_towers::function_f1e7bc35(s_spot);
    self clientfield::set("" + #"hash_233e31d0c2b47b1b", 1);
    self clientfield::set("" + #"hash_12dfb8249f8212d2", 1);
    self clientfield::set("" + #"hash_17e3041649954b9f", 1);
    self thread function_31e86ccd("left");
    self thread function_31e86ccd("right");
    if (isdefined(s_spot.var_5b15e8cd)) {
        self waittill(#"hash_7ff69a201a93f099");
    }
    self flag::init(#"hash_3ab0ebb5b062fd22");
    self flag::init(#"hash_40d65b70bdbb5939");
    self thread function_cc31a1fb();
    self thread function_31c6c56d();
    self flag::wait_till_any(array(#"hash_3ab0ebb5b062fd22", #"hash_40d65b70bdbb5939"));
    self playsound(#"wpn_scorpion_zombie_impact");
    self playloopsound(#"wpn_scorpion_zombie_lp");
    self thread scene::play("aib_t8_zm_gladiator_dth_ra_puzzle", self);
    wait(5);
    level thread function_e453a550(self.origin);
    self playsound(#"wpn_scorpion_zombie_explode");
    self stoploopsound();
    self scene::stop("aib_t8_zm_gladiator_dth_ra_puzzle");
    self val::reset(#"hash_56df0defacc86bb7", "allowdeath");
    self clientfield::set("" + #"hash_233e31d0c2b47b1b", 0);
    self function_e4a7d89("left");
    self function_e4a7d89("right");
    gibserverutils::annihilate(self);
    if (isalive(self)) {
        self kill();
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x6061a471, Offset: 0x7ac0
// Size: 0x7c
function function_cc31a1fb() {
    self endon(#"death", #"hash_40d65b70bdbb5939");
    while (1) {
        self waittill(#"damage");
        if (self.health <= 1) {
            break;
        }
    }
    self flag::set(#"hash_3ab0ebb5b062fd22");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xacac248b, Offset: 0x7b48
// Size: 0x5c
function function_31c6c56d() {
    self endon(#"death", #"hash_3ab0ebb5b062fd22");
    self waittill(#"hash_63c1fbea5263c4f8");
    self flag::set(#"hash_40d65b70bdbb5939");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb695a703, Offset: 0x7bb0
// Size: 0x7c
function function_e4a7d89(var_c642b837) {
    if (var_c642b837 == "right") {
        str_clientfield = "" + #"hash_17e3041649954b9f";
    } else {
        str_clientfield = "" + #"hash_12dfb8249f8212d2";
    }
    self clientfield::set(str_clientfield, 0);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xaff06c87, Offset: 0x7c38
// Size: 0xa4
function function_31e86ccd(var_c642b837) {
    self endon(#"death");
    if (var_c642b837 == "right") {
        while (!isdefined(self.var_88d88318)) {
            waitframe(1);
        }
        while (self.var_88d88318) {
            waitframe(1);
        }
    } else {
        while (!isdefined(self.var_fe593357)) {
            waitframe(1);
        }
        while (self.var_fe593357) {
            waitframe(1);
        }
    }
    self function_e4a7d89(var_c642b837);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb96d18d9, Offset: 0x7ce8
// Size: 0x1ec
function function_e453a550(v_start) {
    var_f04c5eab = util::spawn_model("tag_origin", v_start + vectorscale((0, 0, 1), 58));
    var_bb6e466c = struct::get("s_ra_destroyer_soul_collect_end", "targetname");
    var_f04c5eab clientfield::set("" + #"chaos_ball", 1);
    var_f04c5eab playsound(#"zmb_sq_souls_release");
    var_f04c5eab playloopsound(#"zmb_sq_souls_lp");
    wait(1.25);
    level thread zm_audio::sndannouncerplayvox(#"hash_50cc6c9d88534d5c", undefined, undefined, level.var_c2374d4d);
    var_f04c5eab moveto(var_bb6e466c.origin, 8, 1, 0.5);
    var_f04c5eab waittill(#"movedone");
    var_f04c5eab stoploopsound();
    var_f04c5eab playsound(#"zmb_sq_souls_impact");
    var_f04c5eab clientfield::set("" + #"chaos_ball", 0);
    level notify(#"hash_6f1bcde6921bc480");
    var_f04c5eab delete();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x36cb7591, Offset: 0x7ee0
// Size: 0x214
function activate_bulls_cleanup(b_skipped, var_19e802fa) {
    level clientfield::set("" + #"hash_57c08e5f4792690c", 0);
    if (b_skipped || var_19e802fa) {
        foreach (var_95f17a69 in level.var_36116a82) {
            var_95f17a69 show();
            waitframe(1);
            playfx(level._effect[#"brazier_fire"], var_95f17a69.origin);
        }
        level flag::set(#"bull_heads_completed");
        level.var_b80418e2 clientfield::set("ra_eyes_beam_fire", 1);
        wait(4);
        level.var_82234300 show();
        level.var_8c8485cf = 1;
        level.var_82234300 playsound(#"hash_708d124fb1b2203e");
        level.var_b42c7aba = level.var_82234300 zm_unitrigger::create(&function_e59f6c8d, 64, &function_d3e4e438);
        wait(2);
        level.var_b80418e2 clientfield::set("ra_eyes_beam_fire", 0);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x68036219, Offset: 0x8100
// Size: 0x4c
function activate_puzzle_setup(b_skipped) {
    level endon(#"end_game");
    if (b_skipped) {
        return;
    }
    level flag::wait_till(#"hash_7f6689c71e55e8ab");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe81c8ce5, Offset: 0x8158
// Size: 0x7ec
function function_f0fd4ea3() {
    level endon(#"hash_15f894886f3d6ede");
    zm_bgb_anywhere_but_here::function_886fce8f(0);
    level flag::set(#"hash_36efad26d2c9c9cd");
    level flag::set(#"hash_4f293396150d2c00");
    level function_45ac4bb8(1, 1);
    level.var_82234300 hide();
    level.var_8c8485cf = 0;
    level.var_82234300 playsound(#"hash_5ded242bd1525a14");
    level flag::set(#"pause_round_timeout");
    pause_zombies(1);
    var_f548afba = getent("connect_ra_basement_to_danu_ra_tunnel", "script_flag");
    if (!(isdefined(var_f548afba.has_been_opened) && var_f548afba.has_been_opened)) {
        var_f548afba thread zm_blockers::door_opened();
    }
    var_af59fd85 = getentarray("connect_danu_ra_bridge", "script_flag");
    foreach (t_door in var_af59fd85) {
        if (!(isdefined(t_door.has_been_opened) && t_door.has_been_opened)) {
            t_door thread zm_blockers::door_opened();
        }
    }
    waitframe(1);
    playsoundatposition(#"hash_6f4dbc9a189140b9", (0, 0, 0));
    function_41c15ae9(array("connect_danu_ra_bridge", "connect_starting_area_to_ra_hallway", "connect_ra_basement_to_danu_ra_tunnel"));
    function_bfa25493();
    zm_blockers::function_6f01c3cf("zm_towers_puzzle_drop_boards", "script_label", 1);
    level.var_d1a9acf9 = function_718cc148(level.var_27e60fb6);
    for (i = 0; i < level.var_5e067d81.size; i++) {
        level.var_5e067d81[i] function_53f96a9e(level.var_d1a9acf9[i]);
    }
    level clientfield::set("" + #"hash_440f23773f551a48", 1);
    if (!level flag::exists(#"hash_2d534800e5276c41")) {
        level flag::init(#"hash_2d534800e5276c41");
        level flag::set(#"hash_2d534800e5276c41");
        level thread zm_audio::sndannouncerplayvox(#"hash_412f0a99d31887f");
    }
    wait(3);
    foreach (i, var_6eb21a54 in level.var_5e067d81) {
        /#
            function_df18663(level.var_d1a9acf9[i]);
        #/
        var_6eb21a54 show();
        var_6eb21a54 playsound(#"hash_3a68c26240abda9b");
        wait(1.75);
        var_6eb21a54 hide();
        var_6eb21a54 playsound(#"hash_63661f92ceba62ea");
    }
    level clientfield::set("" + #"hash_440f23773f551a48", 0);
    level.var_765eb0c3 = 0;
    level zm_spawner::register_zombie_death_event_callback(&function_ba68589a);
    a_s_spawns = struct::get_array("ra_puzzle_top_floor");
    level thread function_ee7d29f3(a_s_spawns);
    zm_transform::function_4da8230b(#"zm_towers_puzzle_event");
    level flag::wait_till(#"hash_e35ac19ee7b732c");
    level flag::clear(#"hash_36efad26d2c9c9cd");
    level flag::clear(#"hash_4f293396150d2c00");
    level notify(#"hash_5e0d8fb9b497a1f3");
    level zm_utility::function_9ad5aeb1(0, 1);
    function_1efe04ba(array("connect_danu_ra_bridge", "connect_starting_area_to_ra_hallway", "connect_ra_basement_to_danu_ra_tunnel"));
    level function_5904a8e1();
    function_1b49964();
    wait(1);
    level flag::clear(#"pause_round_timeout");
    pause_zombies(0);
    zm_bgb_anywhere_but_here::function_886fce8f(1);
    level zm_spawner::deregister_zombie_death_event_callback(&function_ba68589a);
    zm_transform::function_6b183c78(#"hash_58ab235fb7da37ab");
    level.var_b80418e2 clientfield::set("ra_eyes_beam_fire", 1);
    wait(4);
    level.var_82234300 show();
    level.var_8c8485cf = 1;
    level.var_82234300 playsound(#"hash_708d124fb1b2203e");
    wait(2);
    level.var_b80418e2 clientfield::set("ra_eyes_beam_fire", 0);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xffffad6, Offset: 0x8950
// Size: 0x714
function function_fac3622f() {
    level endon(#"hash_1381e879a94f5081");
    zm_bgb_anywhere_but_here::function_886fce8f(0);
    level flag::set(#"hash_768860cb3ad76c68");
    level flag::set(#"hash_4f293396150d2c00");
    level function_45ac4bb8(1, 1);
    level.var_82234300 hide();
    level.var_8c8485cf = 0;
    level.var_82234300 playsound(#"hash_5ded242bd1525a14");
    level flag::set(#"pause_round_timeout");
    zm_transform::function_4da8230b(#"hash_58ab235fb7da37ab");
    pause_zombies(1);
    function_41c15ae9(array("connect_danu_ra_bridge", "connect_starting_area_to_ra_hallway", "connect_ra_basement_to_danu_ra_tunnel"));
    function_bfa25493();
    zm_blockers::function_6f01c3cf("zm_towers_puzzle_drop_boards", "script_label", 1);
    if (!isdefined(level.var_27e60fb6)) {
        level.var_27e60fb6 = [];
    } else if (!isarray(level.var_27e60fb6)) {
        level.var_27e60fb6 = array(level.var_27e60fb6);
    }
    if (!isinarray(level.var_27e60fb6, #"spawner_zm_blight_father")) {
        level.var_27e60fb6[level.var_27e60fb6.size] = #"spawner_zm_blight_father";
    }
    level.var_41437b5 = function_718cc148(level.var_27e60fb6);
    for (i = 0; i < level.var_f099a2a5.size; i++) {
        level.var_f099a2a5[i] function_53f96a9e(level.var_41437b5[i]);
    }
    level clientfield::set("" + #"hash_440f23773f551a48", 1);
    playsoundatposition(#"hash_6f4dbc9a189140b9", (0, 0, 0));
    wait(3);
    foreach (i, var_6eb21a54 in level.var_f099a2a5) {
        /#
            function_df18663(level.var_41437b5[i]);
        #/
        var_6eb21a54 show();
        var_6eb21a54 playsound(#"hash_3a68c26240abda9b");
        wait(1.75);
        var_6eb21a54 hide();
        var_6eb21a54 playsound(#"hash_63661f92ceba62ea");
    }
    level clientfield::set("" + #"hash_440f23773f551a48", 0);
    level.var_765eb0c3 = 0;
    level zm_spawner::register_zombie_death_event_callback(&function_ba68589a);
    a_s_spawns = struct::get_array("ra_puzzle_top_floor");
    level thread function_ee7d29f3(a_s_spawns);
    level flag::wait_till(#"hash_77bd156a70de5aa3");
    level flag::clear(#"hash_768860cb3ad76c68");
    level flag::clear(#"hash_4f293396150d2c00");
    level notify(#"hash_5e0d8fb9b497a1f3");
    level zm_utility::function_9ad5aeb1(0);
    function_1efe04ba(array("connect_danu_ra_bridge", "connect_starting_area_to_ra_hallway", "connect_ra_basement_to_danu_ra_tunnel"));
    level function_5904a8e1();
    function_1b49964();
    wait(1);
    level thread function_d1007b59();
    level flag::clear(#"pause_round_timeout");
    pause_zombies(0);
    zm_bgb_anywhere_but_here::function_886fce8f(1);
    level zm_spawner::deregister_zombie_death_event_callback(&function_ba68589a);
    zm_transform::function_6b183c78(#"hash_58ab235fb7da37ab");
    level.var_491c9d clientfield::set("ra_rooftop_eyes_beam_fire", 1);
    wait(10);
    function_315666fb();
    wait(2);
    level.var_491c9d clientfield::set("ra_rooftop_eyes_beam_fire", 0);
    level flag::set(#"hash_7f6689c71e55e8ab");
    zm_unitrigger::unregister_unitrigger(level.var_b42c7aba);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xdd9749ef, Offset: 0x9070
// Size: 0x8c
function function_d1007b59() {
    level zm_audio::sndannouncerplayvox(#"hash_5719edb294612f4c");
    e_player = array::random(zm_vo::function_347f7d34());
    if (isdefined(e_player)) {
        e_player zm_vo::function_a2bd5a0c(#"hash_e36933881b70a00", 0, 0, 9999, 1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x4
// Checksum 0x3958e432, Offset: 0x9108
// Size: 0x164
function private function_df18663(str_key) {
    /#
        if (!getdvarint(#"zm_debug_ee", 0)) {
            return;
        }
        switch (str_key) {
        case #"spawner_zm_gladiator_marauder":
            str_ai = "tag_d_glow";
            break;
        case #"spawner_zm_gladiator_destroyer":
            str_ai = "tag_t_glyph";
            break;
        case #"spawner_zm_blight_father":
            str_ai = "zone_cursed_room";
            break;
        case #"spawner_zm_catalyst_plasma":
            str_ai = "shot 2";
            break;
        case #"spawner_zm_catalyst_corrosive":
            str_ai = "zone_starting_area_danu";
            break;
        case #"spawner_zm_catalyst_water":
            str_ai = "connect_starting_area_to_odin_hallway";
            break;
        case #"spawner_zm_catalyst_electric":
            str_ai = "tiger_location";
            break;
        case #"spawner_zm_tiger":
            str_ai = "exp_aqueduct_3";
            break;
        }
        iprintlnbold(str_ai);
    #/
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x4573fe42, Offset: 0x9278
// Size: 0x204
function function_e59f6c8d() {
    var_a10268d3 = getplayers();
    level.var_90e9a9bf = 0;
    var_7b32e288 = #"zone_ra_top_floor";
    if (zm_zonemgr::get_players_in_zone(var_7b32e288) == var_a10268d3.size && !level flag::get(#"hash_4f293396150d2c00") && isdefined(level.var_8c8485cf) && level.var_8c8485cf) {
        level.var_90e9a9bf = 1;
        return 1;
    } else if (zm_zonemgr::get_players_in_zone(var_7b32e288) < var_a10268d3.size && !level flag::get(#"hash_4f293396150d2c00") && isdefined(level.var_8c8485cf) && level.var_8c8485cf) {
        level.var_90e9a9bf = 0;
        return 1;
    } else if (level flag::get(#"hash_4f293396150d2c00") && level flag::get(#"hash_e35ac19ee7b732c") && !level flag::get(#"hash_768860cb3ad76c68") && !level flag::get(#"hash_77bd156a70de5aa3") && level.var_8c8485cf) {
        level.var_90e9a9bf = 1;
        return 1;
    } else {
        return 0;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xff11476e, Offset: 0x9488
// Size: 0x188
function function_d3e4e438() {
    self endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        if (level flag::get("special_round") || level flag::get(#"hash_4fd3d0c01f9b4c30")) {
            continue;
        }
        e_player = waitresult.activator;
        if (!zm_utility::can_use(e_player)) {
            continue;
        } else if (isdefined(level.var_90e9a9bf) && level.var_90e9a9bf && !level flag::get(#"hash_e35ac19ee7b732c")) {
            level thread function_f0fd4ea3();
        } else if (isdefined(level.var_90e9a9bf) && level.var_90e9a9bf && !level flag::get(#"hash_77bd156a70de5aa3")) {
            level thread function_fac3622f();
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xa9a2e056, Offset: 0x9618
// Size: 0x54
function function_954d42e2(e_player) {
    if (level flag::exists(#"hash_4f293396150d2c00")) {
        return level flag::get(#"hash_4f293396150d2c00");
    } else {
        return 0;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xe2156b1c, Offset: 0x9678
// Size: 0x186
function function_ee7d29f3(a_s_spawns) {
    level endon(#"end_game", #"hash_5e0d8fb9b497a1f3");
    var_e2f55613 = getspawnerarray("spawner_zm_zombie", "targetname")[0];
    level.var_404e4288 = 0;
    level function_40f7dcf0(a_s_spawns);
    while (1) {
        n_players = util::get_active_players().size;
        var_55924268 = max(7, n_players * 4);
        s_spawn = array::random(a_s_spawns);
        ai = undefined;
        while (!isdefined(ai)) {
            ai = zombie_utility::spawn_zombie(var_e2f55613, "ra_puzzle_add_zombies", s_spawn, level.round_number);
            if (isdefined(ai)) {
                ai.var_dd6fe31f = 1;
            }
            waitframe(1);
        }
        level.var_404e4288++;
        if (level.var_404e4288 < var_55924268) {
            wait(0.5);
        } else {
            wait(3);
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x11177fac, Offset: 0x9808
// Size: 0x190
function function_40f7dcf0(a_s_spawns) {
    if (level flag::exists(#"hash_36efad26d2c9c9cd") && level flag::get(#"hash_36efad26d2c9c9cd")) {
        foreach (str_spawner in level.var_d1a9acf9) {
            function_bf12114b(str_spawner, a_s_spawns);
        }
    } else if (level flag::exists(#"hash_768860cb3ad76c68") && level flag::get(#"hash_768860cb3ad76c68")) {
        foreach (str_spawner in level.var_41437b5) {
            function_bf12114b(str_spawner, a_s_spawns);
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x9157bff6, Offset: 0x99a0
// Size: 0x92a
function function_bf12114b(str_spawner, a_s_spawns) {
    var_56695016 = struct::get_array(#"hash_3b52c5d77ba61fd3", "targetname");
    var_acfc7a32 = array::random(var_56695016);
    s_spawn = array::random(a_s_spawns);
    switch (str_spawner) {
    case #"spawner_zm_gladiator_marauder":
        var_1c62893d = getspawnerarray("zombie_spawner_marauder", "targetname")[0];
        ai = undefined;
        while (!isdefined(ai)) {
            ai = zombie_utility::spawn_zombie(var_1c62893d, "ra_puzzle_answer_spawn", s_spawn, level.round_number);
            wait(0.5);
        }
        ai.var_126d7bef = 1;
        ai.ignore_round_spawn_failsafe = 1;
        ai.b_ignore_cleanup = 1;
        ai.ignore_enemy_count = 1;
        ai.var_dd6fe31f = 1;
        ai.no_powerups = 1;
        break;
    case #"spawner_zm_gladiator_destroyer":
        var_1c62893d = getspawnerarray("zombie_spawner_destroyer", "targetname")[0];
        ai = undefined;
        while (!isdefined(ai)) {
            ai = zombie_utility::spawn_zombie(var_1c62893d, "ra_puzzle_answer_spawn", s_spawn, level.round_number);
            wait(0.5);
        }
        ai.var_126d7bef = 1;
        ai.ignore_round_spawn_failsafe = 1;
        ai.b_ignore_cleanup = 1;
        ai.ignore_enemy_count = 1;
        ai.var_dd6fe31f = 1;
        ai.no_powerups = 1;
        break;
    case #"spawner_zm_tiger":
        var_1c62893d = getspawnerarray("zombie_spawner_tiger", "targetname")[0];
        ai = undefined;
        while (!isdefined(ai)) {
            ai = zombie_utility::spawn_zombie(var_1c62893d, "ra_puzzle_answer_spawn", s_spawn, level.round_number);
            wait(0.5);
        }
        ai.var_126d7bef = 1;
        ai.ignore_round_spawn_failsafe = 1;
        ai.b_ignore_cleanup = 1;
        ai.ignore_enemy_count = 1;
        ai.var_dd6fe31f = 1;
        ai.no_powerups = 1;
        break;
    case #"spawner_zm_blight_father":
        ai = undefined;
        while (!isdefined(ai)) {
            ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "ra_puzzle_answer_spawn", var_acfc7a32, level.round_number);
            wait(0.5);
        }
        ai.var_126d7bef = 1;
        ai.ignore_round_spawn_failsafe = 1;
        ai.b_ignore_cleanup = 1;
        ai.ignore_enemy_count = 1;
        ai.var_dd6fe31f = 1;
        ai.no_powerups = 1;
        while (zm_transform::function_abf1dcb4(#"blight_father")) {
            waitframe(1);
        }
        zm_transform::function_9acf76e6(ai, #"blight_father", &function_663fbdcd);
        break;
    case #"spawner_zm_catalyst_plasma":
        ai = undefined;
        while (!isdefined(ai)) {
            ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "ra_puzzle_answer_spawn", s_spawn, level.round_number);
            wait(0.5);
        }
        ai.var_126d7bef = 1;
        ai.ignore_round_spawn_failsafe = 1;
        ai.b_ignore_cleanup = 1;
        ai.ignore_enemy_count = 1;
        ai.var_dd6fe31f = 1;
        ai.no_powerups = 1;
        while (zm_transform::function_abf1dcb4(#"catalyst_plasma")) {
            waitframe(1);
        }
        zm_transform::function_9acf76e6(ai, #"catalyst_plasma", &function_663fbdcd);
        break;
    case #"spawner_zm_catalyst_corrosive":
        ai = undefined;
        while (!isdefined(ai)) {
            ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "ra_puzzle_answer_spawn", s_spawn, level.round_number);
            wait(0.5);
        }
        ai.var_126d7bef = 1;
        ai.ignore_round_spawn_failsafe = 1;
        ai.b_ignore_cleanup = 1;
        ai.ignore_enemy_count = 1;
        ai.var_dd6fe31f = 1;
        ai.no_powerups = 1;
        while (zm_transform::function_abf1dcb4(#"catalyst_corrosive")) {
            waitframe(1);
        }
        zm_transform::function_9acf76e6(ai, #"catalyst_corrosive", &function_663fbdcd);
        break;
    case #"spawner_zm_catalyst_water":
        ai = undefined;
        while (!isdefined(ai)) {
            ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "ra_puzzle_answer_spawn", var_acfc7a32, level.round_number);
            wait(0.5);
        }
        ai.var_126d7bef = 1;
        ai.ignore_round_spawn_failsafe = 1;
        ai.b_ignore_cleanup = 1;
        ai.ignore_enemy_count = 1;
        ai.var_dd6fe31f = 1;
        ai.no_powerups = 1;
        while (zm_transform::function_abf1dcb4(#"catalyst_water")) {
            waitframe(1);
        }
        zm_transform::function_9acf76e6(ai, #"catalyst_water", &function_663fbdcd);
        break;
    case #"spawner_zm_catalyst_electric":
        ai = undefined;
        while (!isdefined(ai)) {
            ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "ra_puzzle_answer_spawn", s_spawn, level.round_number);
            wait(0.5);
        }
        ai.var_126d7bef = 1;
        ai.ignore_round_spawn_failsafe = 1;
        ai.b_ignore_cleanup = 1;
        ai.ignore_enemy_count = 1;
        ai.var_dd6fe31f = 1;
        ai.no_powerups = 1;
        while (zm_transform::function_abf1dcb4(#"catalyst_electric")) {
            waitframe(1);
        }
        zm_transform::function_9acf76e6(ai, #"catalyst_electric", &function_663fbdcd);
        break;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x6b3ed5b9, Offset: 0xa2d8
// Size: 0x142
function function_663fbdcd(ai) {
    if (isdefined(ai.var_9fde8624) && ai.var_9fde8624 == #"catalyst_plasma") {
        ai callback::function_d8abfc3d(#"on_ai_killed", &function_d71f26d6);
    } else if (ai.archetype === #"blight_father") {
        var_f69ab3f2 = array(#"zone_ra_top_floor", #"zone_ra_ground_floor", #"zone_ra_basement");
        ai thread function_b540bcee(var_f69ab3f2);
    }
    ai.var_126d7bef = 1;
    ai.ignore_round_spawn_failsafe = 1;
    ai.b_ignore_cleanup = 1;
    ai.ignore_enemy_count = 1;
    ai.var_dd6fe31f = 1;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb7e21b95, Offset: 0xa428
// Size: 0x12c
function function_d71f26d6(params) {
    if (!isplayer(params.eattacker)) {
        if (level flag::exists(#"hash_36efad26d2c9c9cd") && level flag::get(#"hash_36efad26d2c9c9cd")) {
            level notify(#"hash_15f894886f3d6ede");
            level.var_765eb0c3 = 0;
            level function_67c2c9d0();
        } else if (level flag::exists(#"hash_768860cb3ad76c68") && level flag::get(#"hash_768860cb3ad76c68")) {
            level notify(#"hash_1381e879a94f5081");
            level.var_765eb0c3 = 0;
            level function_1e3536b6();
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x9c2cbd08, Offset: 0xa560
// Size: 0x2a0
function function_ba68589a(e_attacker) {
    if (!isplayer(e_attacker)) {
        return;
    }
    if (self.archetype == #"zombie") {
        level.var_404e4288--;
        return;
    }
    if (level flag::exists(#"hash_36efad26d2c9c9cd") && level flag::get(#"hash_36efad26d2c9c9cd")) {
        if (level.var_765eb0c3 <= 3) {
            if (self.aitype == level.var_d1a9acf9[level.var_765eb0c3]) {
                level.var_5e067d81[level.var_765eb0c3] show();
                if (level.var_765eb0c3 == 3) {
                    level flag::set(#"hash_e35ac19ee7b732c");
                }
            } else {
                level notify(#"hash_15f894886f3d6ede");
                level.var_765eb0c3 = 0;
                level function_67c2c9d0();
            }
        }
        level.var_765eb0c3++;
    } else if (level flag::exists(#"hash_768860cb3ad76c68") && level flag::get(#"hash_768860cb3ad76c68")) {
        if (level.var_765eb0c3 <= 3) {
            if (self.aitype == level.var_41437b5[level.var_765eb0c3]) {
                level.var_f099a2a5[level.var_765eb0c3] show();
                if (level.var_765eb0c3 == 3) {
                    level flag::set(#"hash_77bd156a70de5aa3");
                }
            } else {
                level notify(#"hash_1381e879a94f5081");
                level.var_765eb0c3 = 0;
                level function_1e3536b6();
            }
        }
        level.var_765eb0c3++;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x611af201, Offset: 0xa808
// Size: 0x32c
function function_67c2c9d0() {
    level endon(#"end_game");
    self notify("6d993e764239af2a");
    self endon("6d993e764239af2a");
    foreach (var_be1510fd in level.var_5e067d81) {
        var_be1510fd hide();
    }
    level notify(#"hash_5e0d8fb9b497a1f3");
    level zm_spawner::deregister_zombie_death_event_callback(&function_ba68589a);
    level zm_utility::function_9ad5aeb1(1);
    function_1efe04ba(array("connect_danu_ra_bridge", "connect_starting_area_to_ra_hallway", "connect_ra_basement_to_danu_ra_tunnel"));
    level flag::clear(#"pause_round_timeout");
    pause_zombies(0);
    if (level flag::exists(#"hash_36efad26d2c9c9cd") && level flag::get(#"hash_36efad26d2c9c9cd")) {
        level flag::clear(#"hash_36efad26d2c9c9cd");
        level flag::clear(#"hash_4f293396150d2c00");
    }
    function_1b49964();
    level function_5904a8e1();
    zm_transform::function_6b183c78(#"hash_58ab235fb7da37ab");
    function_5904a8e1();
    zm_bgb_anywhere_but_here::function_886fce8f(1);
    level waittill(#"start_of_round");
    level.var_b80418e2 clientfield::set("ra_eyes_beam_fire", 1);
    wait(4);
    level.var_82234300 show();
    level.var_8c8485cf = 1;
    level.var_82234300 playsound(#"hash_708d124fb1b2203e");
    wait(2);
    level.var_b80418e2 clientfield::set("ra_eyes_beam_fire", 0);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x897d5eab, Offset: 0xab40
// Size: 0x384
function function_1e3536b6() {
    level endon(#"end_game");
    self notify("3c8d575080875a22");
    self endon("3c8d575080875a22");
    foreach (var_be1510fd in level.var_f099a2a5) {
        var_be1510fd hide();
    }
    level notify(#"hash_5e0d8fb9b497a1f3");
    level zm_spawner::deregister_zombie_death_event_callback(&function_ba68589a);
    level zm_utility::function_9ad5aeb1(0);
    level function_5904a8e1();
    function_1efe04ba(array("connect_danu_ra_bridge", "connect_starting_area_to_ra_hallway", "connect_ra_basement_to_danu_ra_tunnel"));
    level flag::clear(#"pause_round_timeout");
    pause_zombies(0);
    if (level flag::exists(#"hash_768860cb3ad76c68") && level flag::get(#"hash_768860cb3ad76c68")) {
        level flag::clear(#"hash_768860cb3ad76c68");
        level flag::clear(#"hash_4f293396150d2c00");
    }
    function_1b49964();
    level function_5904a8e1();
    if (isdefined(level.zombie_powerups[#"nuke"])) {
        level.zombie_powerups[#"nuke"].func_should_drop_with_regular_powerups = &zm_powerups::func_should_always_drop;
    }
    zm_transform::function_6b183c78(#"hash_58ab235fb7da37ab");
    zm_bgb_anywhere_but_here::function_886fce8f(1);
    level waittill(#"start_of_round");
    level.var_b80418e2 clientfield::set("ra_eyes_beam_fire", 1);
    wait(4);
    level.var_82234300 show();
    level.var_8c8485cf = 1;
    level.var_82234300 playsound(#"hash_708d124fb1b2203e");
    wait(2);
    level.var_b80418e2 clientfield::set("ra_eyes_beam_fire", 0);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x6b223004, Offset: 0xaed0
// Size: 0x100
function function_bfa25493() {
    if (level flag::get(#"hash_7136198009a72989")) {
        return;
    }
    level flag::set(#"hash_7136198009a72989");
    level.no_board_repair = 1;
    level notify(#"stop_blocker_think");
    foreach (s_boards in level.exterior_goals) {
        if (isdefined(s_boards.unitrigger_stub)) {
            zm_unitrigger::unregister_unitrigger(s_boards.unitrigger_stub);
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x4f252712, Offset: 0xafd8
// Size: 0x7c
function function_1b49964() {
    if (!level flag::get(#"hash_7136198009a72989")) {
        return;
    }
    level flag::clear(#"hash_7136198009a72989");
    level.no_board_repair = undefined;
    array::thread_all(level.exterior_goals, &zm_blockers::blocker_think);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x67c21339, Offset: 0xb060
// Size: 0x9e
function function_718cc148(a_array) {
    a_array = array::randomize(a_array);
    var_cef2cacb = array();
    var_cef2cacb[0] = a_array[0];
    var_cef2cacb[1] = a_array[1];
    var_cef2cacb[2] = a_array[2];
    var_cef2cacb[3] = a_array[3];
    return var_cef2cacb;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x3d4f581d, Offset: 0xb108
// Size: 0x3aa
function function_53f96a9e(var_7ecdee63) {
    var_b9272bd9 = array("b", "c", "d", "m", "p", "r", "t", "w");
    foreach (var_9ffe8bc6 in var_b9272bd9) {
        self hidepart("tag_" + var_9ffe8bc6 + "_glyph");
        self hidepart("tag_" + var_9ffe8bc6 + "_glow");
    }
    switch (var_7ecdee63) {
    case #"spawner_zm_gladiator_marauder":
        self showpart("tag_m_glyph");
        self showpart("tag_m_glow");
        return self;
    case #"spawner_zm_gladiator_destroyer":
        self showpart("tag_d_glyph");
        self showpart("tag_d_glow");
        return self;
    case #"spawner_zm_blight_father":
        self showpart("tag_b_glyph");
        self showpart("tag_b_glow");
        return self;
    case #"spawner_zm_catalyst_plasma":
        self showpart("tag_p_glyph");
        self showpart("tag_p_glow");
        return self;
    case #"spawner_zm_catalyst_corrosive":
        self showpart("tag_c_glyph");
        self showpart("tag_c_glow");
        return self;
    case #"spawner_zm_catalyst_water":
        self showpart("tag_w_glyph");
        self showpart("tag_w_glow");
        return self;
    case #"spawner_zm_catalyst_electric":
        self showpart("tag_r_glyph");
        self showpart("tag_r_glow");
        return self;
    case #"spawner_zm_tiger":
        self showpart("tag_t_glyph");
        self showpart("tag_t_glow");
        return self;
        break;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x535e45db, Offset: 0xb4c0
// Size: 0x74
function activate_puzzle_cleanup(b_skipped, var_19e802fa) {
    exploder::exploder("exp_ra_eyes");
    level flag::set(#"hash_7f6689c71e55e8ab");
    playsoundatposition(#"hash_6bc2c75bdaed3787", (0, 0, 0));
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xbf738a7, Offset: 0xb540
// Size: 0x204
function function_391f28bc() {
    level.var_4c6ad23f = 0;
    level.var_5ae3589 = 0;
    level.var_244bfd6c = 0;
    level.var_bb194b17 = 0;
    function_c2185b42();
    var_92227047 = getentarray("mdl_maelstrom_emerge", "targetname");
    foreach (var_e8fb9338 in var_92227047) {
        var_e8fb9338 hide();
    }
    var_e762fa26 = getentarray("t_maelstrom_sponge", "targetname");
    foreach (var_6dba90bc in var_e762fa26) {
        var_49c750a8 = getent(var_6dba90bc.target, "targetname");
        var_49c750a8 hide();
    }
    a_mdl_spikes = getentarray("mdl_maelstrom_arc", "targetname");
    array::thread_all(a_mdl_spikes, &function_694b5d2e);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xf29a9490, Offset: 0xb750
// Size: 0x414
function function_5e35bafd(b_skipped) {
    level zm_ui_inventory::function_7df6bb60(#"zm_towers_objective_progress", 3);
    level flag::set("connect_danu_ra_tunnels");
    level flag::set("connect_odin_zeus_tunnels");
    zm_zonemgr::enable_zone("zone_danu_tunnel");
    zm_zonemgr::enable_zone("zone_ra_tunnel");
    zm_zonemgr::enable_zone("zone_odin_tunnel");
    zm_zonemgr::enable_zone("zone_zeus_tunnel");
    zm_zonemgr::enable_zone("zone_cursed_room");
    zm_zonemgr::enable_zone("zone_fallen_hero");
    zm_zonemgr::enable_zone("zone_danu_ra_tunnel");
    zm_zonemgr::enable_zone("zone_odin_zeus_tunnel");
    if (b_skipped) {
        return;
    }
    function_315666fb();
    s_loc = struct::get("s_maelstrom_initiate");
    e_player = s_loc zm_unitrigger::function_fac87205(&function_5b6cf963);
    if (isdefined(e_player)) {
        e_player clientfield::increment_to_player("" + #"maelstrom_initiate");
    }
    level clientfield::set("" + #"maelstrom_initiate_fx", 1);
    zm_bgb_anywhere_but_here::function_886fce8f(0);
    level flag::set(#"pause_round_timeout");
    pause_zombies(1, 0);
    wait(2);
    playsoundatposition(#"hash_5add6839874d997a", (0, 0, 0));
    wait(0.5);
    function_41c15ae9(array("connect_danu_basement_to_danu_ra_tunnel", "connect_ra_basement_to_danu_ra_tunnel", "connect_odin_basement_to_odin_zeus_tunnel", "connect_zeus_basement_to_odin_zeus_tunnel", "pap_room_danu_ra_entrance", "pap_room_odin_zeus_entrance", "pap_room_body_pit_entrance", "pap_room_flooded_crypt_entrance"));
    var_e762fa26 = getentarray("t_maelstrom_sponge", "targetname");
    array::thread_all(var_e762fa26, &function_d6a5d146);
    teleport::team("teleport_maelstrom", undefined, 1);
    wait(1);
    level clientfield::set("" + #"hash_4e5e2b411c997804", 0);
    array::thread_all(level.players, &function_2c1ae777);
    wait(3);
    level flag::clear(#"pause_round_timeout");
    pause_zombies(0);
    level flag::wait_till(#"hash_35bd62e100e54ab3");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x2db2618b, Offset: 0xbb70
// Size: 0x64
function function_2c1ae777() {
    self endon(#"death");
    if (zm_utility::is_player_valid(self, 0, 0)) {
        self thread zm_vo::function_a2bd5a0c(#"hash_3cfc741d08bb9eb3", 0, 0, 9999, 1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xa37e6590, Offset: 0xbbe0
// Size: 0xf4
function function_10cf7d43(b_skipped, var_19e802fa) {
    level flag::set(#"hash_35bd62e100e54ab3");
    zm_bgb_anywhere_but_here::function_886fce8f();
    function_1efe04ba(array("connect_danu_basement_to_danu_ra_tunnel", "connect_ra_basement_to_danu_ra_tunnel", "connect_odin_basement_to_odin_zeus_tunnel", "connect_zeus_basement_to_odin_zeus_tunnel", "pap_room_danu_ra_entrance", "pap_room_odin_zeus_entrance", "pap_room_body_pit_entrance", "pap_room_flooded_crypt_entrance"));
    if (b_skipped) {
        function_315666fb();
        level clientfield::set("" + #"maelstrom_initiate_fx", 1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x1af57857, Offset: 0xbce0
// Size: 0x6c
function function_c2185b42() {
    var_af417f12 = getent("mdl_maelstrom_initiate_on", "targetname");
    var_af417f12.origin = var_af417f12.origin - vectorscale((0, 0, 1), 2048);
    var_af417f12 stoploopsound();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x9fd43277, Offset: 0xbd58
// Size: 0x134
function function_315666fb() {
    if (level flag::get(#"hash_1d004da0a75202bc")) {
        return;
    }
    level clientfield::set("" + #"hash_4e5e2b411c997804", 1);
    level flag::set(#"hash_1d004da0a75202bc");
    var_1a698d0f = getent("mdl_maelstrom_initiate", "targetname");
    var_af417f12 = getent("mdl_maelstrom_initiate_on", "targetname");
    var_af417f12.origin = var_af417f12.origin + vectorscale((0, 0, 1), 2048);
    waitframe(1);
    var_af417f12 playloopsound(#"hash_62bd783a0737ec6a");
    var_1a698d0f delete();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x43ba545, Offset: 0xbe98
// Size: 0x17e
function function_5b6cf963(e_activator) {
    var_bf1569b1 = level flag::get("special_round") || level flag::get(#"hash_4fd3d0c01f9b4c30");
    var_39b20ef6 = e_activator zm_utility::is_player_looking_at(self.stub.related_parent.origin, 0.9, 0);
    var_9b8b2374 = 1;
    var_10280e3c = getent("e_challenge_center_stage", "targetname");
    foreach (e_player in util::get_active_players()) {
        if (!e_player istouching(var_10280e3c)) {
            var_9b8b2374 = 0;
            break;
        }
    }
    return !var_bf1569b1 && var_9b8b2374 && var_39b20ef6;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x29a7c6ea, Offset: 0xc020
// Size: 0x434
function function_d6a5d146() {
    level endon(#"hash_35bd62e100e54ab3");
    var_49c750a8 = getent(self.target, "targetname");
    str_scene = self.var_2cc8d490;
    var_49c750a8 thread function_44378822(str_scene);
    var_49c750a8 show();
    var_49c750a8 flag::init(#"hash_2fcd8f57a30258bd");
    var_49c750a8 flag::init(#"hash_2789af19411aa6bb");
    var_49c750a8.var_5c54264 = [];
    var_49c750a8 thread function_b0ada3cc();
    b_rotated = 0;
    n_health = 8500;
    var_e41dced6 = 1416.67;
    var_45ad4c92 = 0;
    while (!b_rotated) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"damage");
        if (!var_45ad4c92) {
            var_45ad4c92 = 1;
            self thread exploder::exploder(self.var_bdd7f930);
        }
        n_damage = s_waitresult.amount;
        var_49c750a8 thread spin_crank(n_damage);
        if (n_health - n_damage < 0) {
            n_damage = n_health;
            n_health = 0;
        } else {
            n_health = n_health - n_damage;
        }
        self thread function_99da1b77(n_damage);
        var_49c750a8 flag::set(#"hash_66eb0aa5f179e140");
        for (i = 1; i <= 6; i++) {
            n_threshold = 8500 - var_e41dced6 * i;
            switch (i) {
            case 1:
                str_flag = #"hash_66eb0da5f179e659";
                break;
            case 3:
                str_flag = #"hash_66eb0ca5f179e4a6";
                break;
            case 4:
                str_flag = #"hash_66eb0fa5f179e9bf";
                break;
            case 5:
                str_flag = #"hash_66eb0ea5f179e80c";
                break;
            case 6:
                str_flag = #"hash_66eb11a5f179ed25";
                break;
            }
            if (n_health <= n_threshold) {
                var_49c750a8 flag::set(str_flag);
            }
        }
        if (n_health <= 0) {
            b_rotated = 1;
            break;
        }
    }
    var_49c750a8 flag::set(#"hash_2789af19411aa6bb");
    var_49c750a8 playsound(#"hash_75a2099e8df5a448");
    self thread function_ab51f858();
    level.var_4c6ad23f++;
    if (level.var_4c6ad23f >= 4) {
        level flag::set(#"hash_35bd62e100e54ab3");
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x35189ed2, Offset: 0xc460
// Size: 0xca
function function_99da1b77(n_damage) {
    n_percent = n_damage / 8500;
    var_a9a7f568 = 32 * n_percent;
    var_49c750a8 = getent(self.target, "targetname");
    var_49c750a8 playsound(#"hash_6f34e8badf2c9a9");
    self.origin = self.origin + (0, 0, var_a9a7f568);
    var_49c750a8.origin = var_49c750a8.origin + (0, 0, var_a9a7f568);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xe431c86b, Offset: 0xc538
// Size: 0x116
function spin_crank(n_damage) {
    self endon(#"death");
    if (n_damage < 200) {
        n_turns = 1;
    } else if (n_damage < 400) {
        n_turns = 4;
    } else if (n_damage < 800) {
        n_turns = 8;
    } else {
        n_turns = 16;
    }
    if (!isdefined(self.var_5c54264)) {
        self.var_5c54264 = [];
    } else if (!isarray(self.var_5c54264)) {
        self.var_5c54264 = array(self.var_5c54264);
    }
    if (!isinarray(self.var_5c54264, n_turns)) {
        self.var_5c54264[self.var_5c54264.size] = n_turns;
    }
    self notify(#"spin_crank");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc5b418b9, Offset: 0xc658
// Size: 0xe4
function function_ab51f858() {
    var_49c750a8 = getent(self.target, "targetname");
    var_49c750a8 flag::wait_till_clear(#"hash_2fcd8f57a30258bd");
    wait(1);
    var_49c750a8 playsound(#"hash_35d56c3cf35df021");
    var_49c750a8 movez(160, 4);
    var_49c750a8 waittill(#"movedone");
    var_49c750a8 delete();
    self delete();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x2e1e33fa, Offset: 0xc748
// Size: 0x218
function function_b0ada3cc() {
    self endon(#"death");
    while (!self flag::get(#"hash_2789af19411aa6bb")) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"spin_crank", #"hash_2789af19411aa6bb");
        if (s_waitresult._notify == #"spin_crank") {
            self flag::set(#"hash_2fcd8f57a30258bd");
            self playsound(#"hash_56d7ef0008ae3f23");
            self playloopsound(#"hash_5f80ae9db16e36f5");
            while (self.var_5c54264.size > 0) {
                n_turns = self.var_5c54264[0];
                arrayremoveindex(self.var_5c54264, 0);
                for (i = 0; i < n_turns; i++) {
                    v_angles = self.angles + (0, 90, 0);
                    self rotateto(v_angles, 0.1);
                    self waittill(#"rotatedone");
                }
            }
            self stoploopsound();
            self playsound(#"hash_274dbd902f1fe451");
            self flag::clear(#"hash_2fcd8f57a30258bd");
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x4ca6a80b, Offset: 0xc968
// Size: 0x264
function function_44378822(str_scene) {
    self endon(#"death");
    self flag::init(#"hash_66eb0aa5f179e140");
    self flag::init(#"hash_66eb0da5f179e659");
    self flag::init(#"hash_66eb0ca5f179e4a6");
    self flag::init(#"hash_66eb0fa5f179e9bf");
    self flag::init(#"hash_66eb0ea5f179e80c");
    self flag::init(#"hash_66eb11a5f179ed25");
    self flag::wait_till(#"hash_66eb0aa5f179e140");
    level scene::play(str_scene, "shot 1");
    self flag::wait_till(#"hash_66eb0da5f179e659");
    level scene::play(str_scene, "shot 2");
    self flag::wait_till(#"hash_66eb0ca5f179e4a6");
    level scene::play(str_scene, "shot 3");
    self flag::wait_till(#"hash_66eb0fa5f179e9bf");
    level scene::play(str_scene, "shot 4");
    self flag::wait_till(#"hash_66eb0ea5f179e80c");
    level scene::play(str_scene, "shot 5");
    self flag::wait_till(#"hash_66eb11a5f179ed25");
    level scene::play(str_scene, "shot 6");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x400d5c95, Offset: 0xcbd8
// Size: 0x21c
function function_49a07fa0(b_skipped) {
    var_92227047 = getentarray("mdl_maelstrom_emerge", "targetname");
    foreach (var_e8fb9338 in var_92227047) {
        var_e8fb9338 show();
    }
    a_mdl_spikes = getentarray("mdl_maelstrom_arc", "targetname");
    foreach (mdl_spike in a_mdl_spikes) {
        mdl_spike solid();
        mdl_spike show();
        mdl_spike.var_57f2374d = 0;
        mdl_spike flag::init(#"hash_6865328fef54bb82");
        mdl_spike exploder::exploder(mdl_spike.var_c2eb414b);
    }
    if (b_skipped) {
        return;
    }
    level thread zm_audio::sndannouncerplayvox(#"hash_73183fb7534361f");
    callback::on_ai_killed(&function_af7564d9);
    level flag::wait_till(#"hash_4f15d2623e98015d");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xf53f98bd, Offset: 0xce00
// Size: 0x34
function function_99cfe16e(b_skipped, var_19e802fa) {
    level flag::set(#"hash_4f15d2623e98015d");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x5b03aedb, Offset: 0xce40
// Size: 0xa4
function function_694b5d2e() {
    self endon(#"death");
    self hide();
    self notsolid();
    var_a8dab6cb = struct::get(self.target);
    self.var_9d236056 = var_a8dab6cb.origin;
    self.var_6de67e10 = var_a8dab6cb.angles;
    var_a8dab6cb struct::delete();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xe91c9155, Offset: 0xcef0
// Size: 0x55c
function function_af7564d9(s_params) {
    v_origin = self.origin;
    v_fx_origin = self gettagorigin("J_SpineUpper");
    str_zone = self zm_utility::get_current_zone();
    str_archetype = self.archetype;
    var_1e137cec = self.var_9fde8624;
    var_7663fec2 = self.var_661d1e79;
    e_player = s_params.eattacker;
    w_weapon = s_params.weapon;
    if (!isplayer(e_player)) {
        return;
    }
    s_aat = e_player aat::getaatonweapon(w_weapon);
    var_80c3ca2 = "";
    if (isdefined(s_aat) && isdefined(s_aat.name)) {
        var_80c3ca2 = s_aat.name;
    }
    var_24f5d9f8 = array("zone_starting_area_center", "zone_starting_area_danu", "zone_starting_area_ra", "zone_starting_area_odin", "zone_starting_area_zeus");
    if (!isdefined(v_origin) || isdefined(str_zone) && !isinarray(var_24f5d9f8, str_zone)) {
        return;
    }
    a_mdl_spikes = getentarray("mdl_maelstrom_arc", "targetname");
    a_mdl_spikes = arraysortclosest(a_mdl_spikes, v_origin, undefined, 0, 300);
    if (a_mdl_spikes.size == 0) {
        return;
    }
    mdl_spike = a_mdl_spikes[0];
    if (mdl_spike flag::get(#"hash_6865328fef54bb82") || (str_archetype == #"blight_father" || str_archetype == #"gladiator") && var_80c3ca2 !== "zm_aat_kill_o_watt") {
        return;
    }
    var_d6241ccb = 0;
    b_charged = 0;
    n_charges = 1;
    switch (str_archetype) {
    case #"blight_father":
        var_d6241ccb = 1;
        v_fx_origin = v_origin;
        n_charges = 9;
        break;
    case #"gladiator":
        var_d6241ccb = 1;
        n_charges = 5;
        break;
    }
    if (!var_d6241ccb && !(isdefined(var_7663fec2) && var_7663fec2) && var_1e137cec !== #"catalyst_electric") {
        return;
    }
    n_total = mdl_spike.var_57f2374d + n_charges;
    if (n_total >= 9) {
        mdl_spike flag::set(#"hash_6865328fef54bb82");
        b_charged = 1;
        if (n_total > 9) {
            n_charges = 9 - mdl_spike.var_57f2374d;
        }
    }
    mdl_spike.var_57f2374d = mdl_spike.var_57f2374d + n_charges;
    for (i = 0; i < n_charges; i++) {
        level thread function_29a062fa(v_fx_origin, mdl_spike);
        if (i + 1 < n_charges) {
            wait(0.5);
        }
    }
    if (b_charged) {
        mdl_spike.var_e7918020 = util::spawn_model("tag_origin", mdl_spike.var_9d236056, mdl_spike.var_6de67e10);
        mdl_spike.var_e7918020 clientfield::set("" + #"hash_1814d4cc1867739c", 1);
        mdl_spike exploder::exploder_stop(mdl_spike.var_c2eb414b);
        mdl_spike thread function_57ad712();
        level.var_5ae3589++;
        if (level.var_5ae3589 >= 4) {
            level.var_613576ad = mdl_spike;
            level flag::set(#"hash_4f15d2623e98015d");
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xcb384207, Offset: 0xd458
// Size: 0x11c
function function_29a062fa(v_origin, mdl_spike) {
    params = level.var_7fe61e7a;
    v_destination = mdl_spike.var_9d236056;
    mdl_fx = util::spawn_model("tag_origin", v_origin);
    mdl_fx clientfield::set("" + #"maelstrom_conduct", 1);
    mdl_fx moveto(v_destination, params.arc_travel_time);
    mdl_fx waittill(#"movedone");
    mdl_fx clientfield::set("" + #"maelstrom_conduct", 0);
    mdl_fx delete();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x1bc05de6, Offset: 0xd580
// Size: 0x7c
function function_57ad712() {
    self endon(#"hash_67ca6bbad6cdefae");
    var_a2ad7ca3 = getent(self.var_d1262c5a, "script_maelstrom_arc_name");
    var_a2ad7ca3 flag::wait_till(#"hash_6865328fef54bb82");
    exploder::exploder(self.var_6212cd32);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x83fe49ac, Offset: 0xd608
// Size: 0x28c
function function_6c17207c(b_skipped) {
    if (b_skipped) {
        return;
    }
    disable_challenges();
    wait(2);
    mdl_spike = level.var_613576ad;
    if (!isdefined(mdl_spike)) {
        mdl_spike = getent("danu_ra", "script_maelstrom_arc_name");
    }
    for (i = 0; i < 4; i++) {
        mdl_spike notify(#"hash_67ca6bbad6cdefae");
        if (isdefined(mdl_spike.var_e7918020)) {
            mdl_spike.var_e7918020 clientfield::set("" + #"hash_1814d4cc1867739c", 0);
            mdl_spike.var_e7918020 delete();
            exploder::stop_exploder(mdl_spike.var_6212cd32);
        }
        mdl_spike thread function_2fd193ad();
        if (i + 1 < 4) {
            wait(1);
            mdl_spike = getent(mdl_spike.var_d1262c5a, "script_maelstrom_arc_name");
        }
    }
    level flag::wait_till(#"hash_5734e11875c30d69");
    a_s_balls = struct::get_array("s_maelstrom_float");
    foreach (s_ball in a_s_balls) {
        s_ball zm_unitrigger::create(&function_16e1f042);
        s_ball thread function_43bf2fcf();
    }
    level thread function_90b397fa();
    level flag::wait_till(#"hash_50e2bacfe0486f6a");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x4a26041f, Offset: 0xd8a0
// Size: 0xb8
function function_fd901116(b_skipped, var_19e802fa) {
    if (b_skipped) {
        return;
    }
    a_s_balls = struct::get_array("s_maelstrom_float");
    foreach (s_ball in a_s_balls) {
        zm_unitrigger::unregister_unitrigger(s_ball.s_unitrigger);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa847af64, Offset: 0xd960
// Size: 0x1d2
function disable_challenges() {
    level flag::set(#"hash_4f26632e308bd2e6");
    foreach (t_trigger in level.var_38935e23) {
        t_trigger.origin = t_trigger.origin - (0, 0, 2048);
    }
    a_str_structs = array("danu_brazier", "ra_brazier", "odin_brazier", "zeus_brazier");
    foreach (str_struct in a_str_structs) {
        s_struct = struct::get(str_struct);
        s_struct.origin = s_struct.origin - (0, 0, 2048);
        var_4d0b3b87 = s_struct.var_4d0b3b87;
        if (isdefined(var_4d0b3b87)) {
            var_4d0b3b87.origin = var_4d0b3b87.origin - (0, 0, 2048);
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x4ae28be8, Offset: 0xdb40
// Size: 0x1fa
function enable_challenges() {
    if (!level flag::get(#"hash_4f26632e308bd2e6")) {
        return;
    }
    level flag::clear(#"hash_4f26632e308bd2e6");
    foreach (t_trigger in level.var_38935e23) {
        t_trigger.origin = t_trigger.origin + (0, 0, 2048);
    }
    a_str_structs = array("danu_brazier", "ra_brazier", "odin_brazier", "zeus_brazier");
    foreach (str_struct in a_str_structs) {
        s_struct = struct::get(str_struct);
        s_struct.origin = s_struct.origin + (0, 0, 2048);
        var_4d0b3b87 = s_struct.var_4d0b3b87;
        if (isdefined(var_4d0b3b87)) {
            var_4d0b3b87.origin = var_4d0b3b87.origin + (0, 0, 2048);
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc2a7dfcd, Offset: 0xdd48
// Size: 0x124
function function_2fd193ad() {
    exploder::exploder(self.var_6002875f);
    s_ball = struct::get(self.var_296ea3fc, "script_maelstrom_float");
    mdl_fx = util::spawn_model("tag_origin", s_ball.origin, s_ball.angles);
    mdl_fx clientfield::set("" + #"hash_1814d4cc1867739c", 1);
    s_ball.var_683305b6 = mdl_fx;
    level.var_244bfd6c++;
    if (level.var_244bfd6c >= 4) {
        level flag::set(#"hash_5734e11875c30d69");
    }
    wait(0.25);
    exploder::stop_exploder(self.var_6002875f);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xc8c6114c, Offset: 0xde78
// Size: 0xa8
function function_16e1f042(e_player) {
    var_5168e40f = e_player zm_utility::is_player_looking_at(self.stub.related_parent.origin, 0.9, 0);
    var_bf1569b1 = level flag::get("special_round") || level flag::get(#"hash_4fd3d0c01f9b4c30");
    return !var_bf1569b1 && var_5168e40f;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x9ac728bb, Offset: 0xdf28
// Size: 0x58
function function_b99d9501() {
    level endon(#"hash_50e2bacfe0486f6a");
    self.var_683305b6 clientfield::set("" + #"hash_314d3a2e542805c0", 1);
    level.var_bb194b17++;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xcb2b851f, Offset: 0xdf88
// Size: 0x68
function function_f5f48814() {
    level endon(#"hash_50e2bacfe0486f6a");
    self.var_683305b6 clientfield::set("" + #"hash_314d3a2e542805c0", 0);
    if (level.var_bb194b17 > 0) {
        level.var_bb194b17--;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xb75c1062, Offset: 0xdff8
// Size: 0x64
function function_90b397fa() {
    level endon(#"end_game");
    while (level.var_bb194b17 < util::get_active_players().size) {
        waitframe(1);
    }
    level flag::set(#"hash_50e2bacfe0486f6a");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xb608af6f, Offset: 0xe068
// Size: 0x18c
function function_43bf2fcf() {
    level endon(#"hash_50e2bacfe0486f6a");
    self function_f5f48814();
    b_activated = 0;
    while (!b_activated) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"trigger_activated");
        e_player = s_waitresult.e_who;
        if (isdefined(e_player)) {
            if (!e_player flag::exists(#"hash_4bd231b62155d251")) {
                e_player flag::init(#"hash_4bd231b62155d251");
            }
            if (!e_player flag::get(#"hash_4bd231b62155d251")) {
                self function_b99d9501();
                e_player flag::set(#"hash_4bd231b62155d251");
                e_player thread function_c042cec(self);
                e_player thread function_ee1297e4(self);
                e_player clientfield::increment_to_player("" + #"maelstrom_initiate");
                b_activated = 1;
                break;
            }
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xdbe724f6, Offset: 0xe200
// Size: 0x8c
function function_c042cec(t_ball) {
    level endon(#"hash_50e2bacfe0486f6a");
    self endon(#"hash_352d2def925390c7");
    self waittill(#"death");
    if (isdefined(self)) {
        self flag::clear(#"hash_4bd231b62155d251");
    }
    t_ball thread function_43bf2fcf();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x1a95857f, Offset: 0xe298
// Size: 0xd4
function function_ee1297e4(t_ball) {
    level endon(#"hash_50e2bacfe0486f6a");
    self endon(#"death");
    vol_center = getent("e_challenge_center_stage", "targetname");
    while (self istouching(vol_center)) {
        waitframe(1);
    }
    self flag::clear(#"hash_4bd231b62155d251");
    self notify(#"hash_352d2def925390c7");
    t_ball thread function_43bf2fcf();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xa8956a7b, Offset: 0xe378
// Size: 0x29c
function gladiator_round_setup(b_skipped) {
    if (b_skipped) {
        return;
    }
    zm_bgb_anywhere_but_here::function_886fce8f(0);
    level flag::set(#"pause_round_timeout");
    pause_zombies(1, 0);
    var_c04c6087 = array("connect_starting_area_to_danu_hallway", "connect_starting_area_to_ra_hallway", "connect_starting_area_to_odin_hallway", "connect_starting_area_to_zeus_hallway");
    foreach (str_doors in var_c04c6087) {
        a_t_door = getentarray(str_doors, "script_flag");
        foreach (t_door in a_t_door) {
            if (!(isdefined(t_door.has_been_opened) && t_door.has_been_opened)) {
                t_door thread zm_blockers::door_opened();
            }
        }
    }
    waitframe(1);
    function_41c15ae9(var_c04c6087);
    level.var_e7ebfb68 = struct::get_array("s_maelstrom_spawn_east");
    level.var_9876e57d = struct::get_array("s_maelstrom_spawn_west");
    function_40f8980d();
    level.var_5fc3101b = 5;
    level.var_57e6338c = 15;
    level.var_78302409 = 25;
    level.var_35df8567 = 35;
    level.var_2959a011 = 0;
    callback::on_ai_killed(&function_7dba31c1);
    function_215e3431();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x20417e96, Offset: 0xe620
// Size: 0x234
function gladiator_round_cleanup(b_skipped, var_19e802fa) {
    level flag::set(#"hash_403b629f7e5829ee");
    zm_bgb_anywhere_but_here::function_886fce8f();
    function_1efe04ba(array("connect_starting_area_to_danu_hallway", "connect_starting_area_to_ra_hallway", "connect_starting_area_to_odin_hallway", "connect_starting_area_to_zeus_hallway"));
    exploder::exploder("exp_zeus_eyes");
    if (b_skipped) {
        return;
    }
    level thread function_f0e2f4b7();
    callback::remove_on_ai_killed(&function_7dba31c1);
    if (!level flag::get("special_round")) {
        level notify(#"hash_7b9245ff51f3d4f7");
        level thread zm_towers_special_rounds::function_417990b9(1);
    }
    callback::remove_on_spawned(&function_6b8497c);
    foreach (e_player in level.players) {
        e_player clientfield::set_to_player("" + #"maelstrom_storm", 0);
    }
    level thread zm_towers_special_rounds::function_39a9e7ce();
    wait(1);
    level flag::clear(#"pause_round_timeout");
    pause_zombies(0);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf22ba0bc, Offset: 0xe860
// Size: 0x234
function function_40f8980d() {
    function_d788d0e7();
    wait(1);
    enable_challenges();
    level zm_utility::function_9ad5aeb1(1);
    playsoundatposition(#"hash_5ff6ce0b3a2db603", (0, 0, 0));
    level thread function_af73010c();
    wait(1);
    util::set_lighting_state(1);
    wait(2);
    foreach (e_player in util::get_active_players()) {
        var_c7410412 = e_player.var_fd05e363;
        if (isdefined(var_c7410412)) {
            e_player ability_util::function_36a15b60(var_c7410412);
            if (!e_player gadgetisactive(level.var_a53a05b5) && !e_player function_36dfc05f(level.var_a53a05b5)) {
                e_player switchtoweaponimmediate(var_c7410412, 1);
            }
        }
    }
    callback::on_spawned(&function_6b8497c);
    array::thread_all(level.players, &function_6b8497c);
    level thread function_ca9986f7();
    wait(1);
    level thread zm_towers_special_rounds::function_93eab559(1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x425f0681, Offset: 0xeaa0
// Size: 0x8c
function function_ca9986f7() {
    level zm_audio::sndannouncerplayvox(#"hash_6211a32e1a9f23fa");
    e_player = array::random(zm_vo::function_347f7d34());
    if (isdefined(e_player)) {
        e_player zm_vo::function_a2bd5a0c(#"hash_51a59d04d4a7e8b1", 0, 0, 9999, 1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x2676eb91, Offset: 0xeb38
// Size: 0x8c
function function_f0e2f4b7() {
    level zm_audio::sndannouncerplayvox(#"hash_42bbe4989b9a4cbe");
    e_player = array::random(zm_vo::function_347f7d34());
    if (isdefined(e_player)) {
        e_player zm_vo::function_a2bd5a0c(#"hash_201c6d1fcf33bce8", 0, 0, 9999, 1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa3dc26d4, Offset: 0xebd0
// Size: 0x2b0
function function_d788d0e7() {
    a_s_balls = struct::get_array("s_maelstrom_float");
    foreach (s_ball in a_s_balls) {
        if (!isdefined(s_ball.var_683305b6)) {
            mdl_fx = util::spawn_model("tag_origin", s_ball.origin, s_ball.angles);
            s_ball.var_683305b6 = mdl_fx;
            mdl_fx clientfield::set("" + #"hash_1814d4cc1867739c", 1);
        }
        s_ball function_b99d9501();
    }
    wait(2);
    playsoundatposition(#"hash_32403acd6811484e", (0, 0, 0));
    foreach (s_ball in a_s_balls) {
        s_ball.var_683305b6 clientfield::increment("" + #"maelstrom_discharge");
    }
    wait(1);
    foreach (s_ball in a_s_balls) {
        s_ball.var_683305b6 clientfield::set("" + #"hash_1814d4cc1867739c", 0);
        s_ball.var_683305b6 clientfield::set("" + #"hash_314d3a2e542805c0", 0);
        s_ball.var_683305b6 delete();
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xf3b72500, Offset: 0xee88
// Size: 0xbc
function function_6b8497c(s_params) {
    self endon(#"death");
    if (self flag::exists(#"hash_47f07946ddff1f32")) {
        return;
    }
    self flag::init(#"hash_47f07946ddff1f32");
    self flag::set(#"hash_47f07946ddff1f32");
    self clientfield::set_to_player("" + #"maelstrom_storm", 1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xeed1fcb7, Offset: 0xef50
// Size: 0x16e
function function_af73010c() {
    for (i = 0; i < 4; i++) {
        e_trap = level.var_abf198ff[i];
        e_trap namespace_edfc2a97::function_47b3d2e2();
    }
    level flag::wait_till(#"hash_415c59c3573153ff");
    level.var_9b9742cb = 2;
    level.var_88434d59 = 2;
    level thread function_8ad041dc();
    level flag::wait_till(#"hash_2c274140cd602e60");
    level.var_9b9742cb = 1;
    level flag::wait_till(#"hash_5e49848f6ac0bc6b");
    level.var_9b9742cb = 0.5;
    level flag::wait_till(#"hash_403b629f7e5829ee");
    for (i = 0; i < 4; i++) {
        e_trap = level.var_abf198ff[i];
        e_trap namespace_edfc2a97::function_47b3d2e2();
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x86312926, Offset: 0xf0c8
// Size: 0x86
function function_8ad041dc() {
    level endon(#"hash_403b629f7e5829ee");
    while (1) {
        for (i = 0; i < 4; i++) {
            e_trap = level.var_abf198ff[i];
            e_trap thread function_5a81ab08();
            wait(level.var_9b9742cb);
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x6f6bd854, Offset: 0xf158
// Size: 0xfc
function function_5a81ab08() {
    level endon(#"hash_403b629f7e5829ee");
    if (!self flag::exists(#"hash_17d1c634991f8734")) {
        self flag::init(#"hash_17d1c634991f8734");
    }
    if (self flag::get(#"hash_17d1c634991f8734")) {
        return;
    }
    self flag::set(#"hash_17d1c634991f8734");
    self thread namespace_edfc2a97::function_b736b1a2(10);
    wait(level.var_88434d59);
    self namespace_edfc2a97::function_47b3d2e2();
    self flag::clear(#"hash_17d1c634991f8734");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x9e1e5509, Offset: 0xf260
// Size: 0x474
function function_215e3431() {
    level.var_4bd942f3 = [];
    level.var_cd709c6f = 8;
    level.var_e2a98864 = 8;
    level.var_1695adae = 8;
    level thread function_65a317ae("s_maelstrom_tunnel_spawn_east");
    level thread function_65a317ae("s_maelstrom_tunnel_spawn_west");
    level flag::wait_till(#"hash_415c59c3573153ff");
    n_random_wait = randomfloatrange(2, 3);
    wait(n_random_wait);
    level.var_cd709c6f = 4;
    level thread function_64afc2b6("s_maelstrom_hallway_spawn_danu_ra");
    level thread function_64afc2b6("s_maelstrom_hallway_spawn_odin_zeus");
    foreach (e_player in level.players) {
        e_player clientfield::increment_to_player("" + #"hash_182c03ff2a21c07c");
    }
    level flag::wait_till(#"hash_2c274140cd602e60");
    n_random_wait = randomfloatrange(2, 3);
    wait(n_random_wait);
    level.var_e2a98864 = 4;
    level thread function_4ffa3775();
    foreach (e_player in level.players) {
        e_player clientfield::increment_to_player("" + #"hash_182c03ff2a21c07c");
    }
    level flag::wait_till(#"hash_5e49848f6ac0bc6b");
    n_random_wait = randomfloatrange(2, 3);
    wait(n_random_wait);
    level.var_cd709c6f = 1;
    level.var_e2a98864 = 1;
    level.var_1695adae = 1;
    foreach (e_player in level.players) {
        e_player clientfield::increment_to_player("" + #"hash_182c03ff2a21c07c");
    }
    wait(30);
    level flag::wait_till(#"hash_4feaeb49c7362da7");
    level flag::set(#"hash_403b629f7e5829ee");
    wait(1);
    level zm_utility::function_9ad5aeb1(0);
    wait(1);
    util::set_lighting_state(0);
    while (level.var_4bd942f3.size > 0) {
        level.var_4bd942f3 = array::remove_dead(level.var_4bd942f3);
        waitframe(1);
    }
    wait(1);
    function_2bcefa9c();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x5a59a177, Offset: 0xf6e0
// Size: 0x26c
function function_65a317ae(str_spawn) {
    level endon(#"end_game", #"hash_403b629f7e5829ee");
    a_s_spawns = struct::get_array(str_spawn);
    var_c18ec884 = min(1 + level.players.size, 3);
    var_e482422a = array(#"destroyer", #"marauder", #"tiger");
    a_ai_spawned = [];
    while (1) {
        a_ai_spawned = array::remove_dead(a_ai_spawned);
        n_spawned = a_ai_spawned.size;
        if (getaiarray().size < 24 && a_ai_spawned.size < var_c18ec884) {
            n_to_spawn = var_c18ec884 - n_spawned;
            for (i = 0; i < n_to_spawn; i++) {
                if (getaiarray().size < 24) {
                    str_enemy = array::random(var_e482422a);
                    ai_enemy = function_ba568d37(str_enemy, a_s_spawns);
                    if (!isdefined(a_ai_spawned)) {
                        a_ai_spawned = [];
                    } else if (!isarray(a_ai_spawned)) {
                        a_ai_spawned = array(a_ai_spawned);
                    }
                    a_ai_spawned[a_ai_spawned.size] = ai_enemy;
                }
                if (i < n_to_spawn - 1) {
                    n_random_wait = randomfloatrange(2, 3);
                    wait(n_random_wait);
                }
            }
        }
        wait(level.var_cd709c6f);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x47dfb78f, Offset: 0xf958
// Size: 0x2d0
function function_64afc2b6(str_spawn) {
    level endon(#"end_game", #"hash_403b629f7e5829ee");
    a_s_spawns = struct::get_array(str_spawn);
    n_players = level.players.size;
    var_c18ec884 = min(2 + level.players.size, 4);
    var_e482422a = array(#"destroyer", #"marauder");
    a_ai_spawned = [];
    while (1) {
        a_ai_spawned = array::remove_dead(a_ai_spawned);
        n_spawned = a_ai_spawned.size;
        if (getaiarray().size < 24 && n_spawned < var_c18ec884) {
            n_available = var_c18ec884 - n_spawned;
            if (n_available - 2 >= 0) {
                n_to_spawn = 2;
            } else {
                for (i = 1; i <= n_available; i++) {
                    n_option = 2 - i;
                    if (n_available - n_option >= 0) {
                        n_to_spawn = n_option;
                        break;
                    }
                }
            }
            for (i = 0; i < n_to_spawn; i++) {
                if (getaiarray().size < 24) {
                    str_enemy = array::random(var_e482422a);
                    ai_enemy = function_ba568d37(str_enemy, a_s_spawns);
                    if (!isdefined(a_ai_spawned)) {
                        a_ai_spawned = [];
                    } else if (!isarray(a_ai_spawned)) {
                        a_ai_spawned = array(a_ai_spawned);
                    }
                    a_ai_spawned[a_ai_spawned.size] = ai_enemy;
                }
                if (i < n_to_spawn - 1) {
                    wait(1);
                }
            }
        }
        wait(level.var_e2a98864);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc23cfa56, Offset: 0xfc30
// Size: 0x310
function function_4ffa3775() {
    level endon(#"end_game", #"hash_403b629f7e5829ee");
    var_3bc84e2 = struct::get_array("starting_area_center_spawns");
    var_78db5c6a = [];
    foreach (s_spawn in var_3bc84e2) {
        if (s_spawn.script_noteworthy === "tiger_location") {
            if (!isdefined(var_78db5c6a)) {
                var_78db5c6a = [];
            } else if (!isarray(var_78db5c6a)) {
                var_78db5c6a = array(var_78db5c6a);
            }
            var_78db5c6a[var_78db5c6a.size] = s_spawn;
        }
    }
    a_s_remaining = array::randomize(var_78db5c6a);
    var_38b6dcc0 = 7 + level.players.size;
    a_ai_spawned = [];
    while (1) {
        a_ai_spawned = array::remove_dead(a_ai_spawned);
        n_spawned = a_ai_spawned.size;
        if (getaiarray().size < 24 && n_spawned < var_38b6dcc0) {
            n_to_spawn = var_38b6dcc0 - n_spawned;
            for (i = 0; i < n_to_spawn; i++) {
                if (getaiarray().size < 24) {
                    if (a_s_remaining.size == 0) {
                        a_s_remaining = array::randomize(var_78db5c6a);
                    }
                    s_spawn = a_s_remaining[0];
                    arrayremoveindex(a_s_remaining, 0);
                    ai_tiger = function_ba568d37(#"tiger", s_spawn);
                    if (!isdefined(a_ai_spawned)) {
                        a_ai_spawned = [];
                    } else if (!isarray(a_ai_spawned)) {
                        a_ai_spawned = array(a_ai_spawned);
                    }
                    a_ai_spawned[a_ai_spawned.size] = ai_tiger;
                }
                if (i < n_to_spawn - 1) {
                    wait(1);
                }
            }
        }
        wait(level.var_1695adae);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x30deeebc, Offset: 0xff48
// Size: 0x2a2
function function_ba568d37(str_enemy, a_s_spawns) {
    if (!isdefined(a_s_spawns)) {
        a_s_spawns = [];
    } else if (!isarray(a_s_spawns)) {
        a_s_spawns = array(a_s_spawns);
    }
    s_spawn = array::random(a_s_spawns);
    ai_enemy = undefined;
    while (!isdefined(ai_enemy)) {
        switch (str_enemy) {
        case #"marauder":
            ai_enemy = zombie_gladiator_util::function_bfa79e98(undefined, s_spawn, "melee");
            break;
        case #"destroyer":
            ai_enemy = zombie_gladiator_util::function_bfa79e98(undefined, s_spawn, "ranged");
            break;
        case #"tiger":
            ai_enemy = zombie_tiger_util::spawn_single(1, s_spawn);
            break;
        }
        if (isdefined(ai_enemy)) {
            ai_enemy.no_powerups = 1;
            ai_enemy.ignore_round_spawn_failsafe = 1;
            ai_enemy.b_ignore_cleanup = 1;
            ai_enemy.ignore_enemy_count = 1;
            ai_enemy.completed_emerging_into_playable_area = 1;
            ai_enemy notify(#"completed_emerging_into_playable_area");
            if (str_enemy == #"tiger") {
                ai_enemy ai::set_behavior_attribute("sprint", 1);
            } else {
                ai_enemy ai::set_behavior_attribute("run", 1);
            }
            if (!isdefined(level.var_4bd942f3)) {
                level.var_4bd942f3 = [];
            } else if (!isarray(level.var_4bd942f3)) {
                level.var_4bd942f3 = array(level.var_4bd942f3);
            }
            level.var_4bd942f3[level.var_4bd942f3.size] = ai_enemy;
            return ai_enemy;
        }
        waitframe(1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x310026cb, Offset: 0x101f8
// Size: 0x1ac
function function_7dba31c1(s_params) {
    e_attacker = s_params.eattacker;
    self clientfield::increment("" + #"maelstrom_death");
    if (isplayer(e_attacker)) {
        var_c7410412 = e_attacker.var_fd05e363;
        if (isdefined(var_c7410412)) {
            e_attacker ability_util::function_36a15b60(var_c7410412);
        }
    }
    arrayremovevalue(level.var_4bd942f3, self);
    level.var_2959a011++;
    if (level.var_2959a011 >= level.var_5fc3101b) {
        level flag::set(#"hash_415c59c3573153ff");
    }
    if (level.var_2959a011 >= level.var_57e6338c) {
        level flag::set(#"hash_2c274140cd602e60");
    }
    if (level.var_2959a011 >= level.var_78302409) {
        level flag::set(#"hash_5e49848f6ac0bc6b");
    }
    if (level.var_2959a011 >= level.var_35df8567) {
        level flag::set(#"hash_4feaeb49c7362da7");
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x533786e7, Offset: 0x103b0
// Size: 0x3f0
function function_2bcefa9c() {
    params = level.var_7fe61e7a;
    n_travel_time = params.arc_travel_time;
    var_c2a873f6 = [];
    v_start = vectorscale((0, 0, 1), 2048);
    v_end = vectorscale((0, 0, 1), 256);
    for (i = 0; i < 3; i++) {
        mdl_fx = util::spawn_model("tag_origin", v_start);
        mdl_fx clientfield::set("" + #"maelstrom_conduct", 1);
        mdl_fx moveto(v_end, n_travel_time);
        if (!isdefined(var_c2a873f6)) {
            var_c2a873f6 = [];
        } else if (!isarray(var_c2a873f6)) {
            var_c2a873f6 = array(var_c2a873f6);
        }
        var_c2a873f6[var_c2a873f6.size] = mdl_fx;
    }
    var_c2a873f6[0] waittilltimeout(n_travel_time, #"movedone");
    foreach (e_player in level.players) {
        e_player clientfield::set_to_player("" + #"maelstrom_ending", 1);
    }
    foreach (i, mdl_fx in var_c2a873f6) {
        n_x = 1024;
        n_y = 1024;
        switch (i) {
        case 1:
            n_x = n_x * -1;
            break;
        case 2:
            n_x = 0;
            n_y = n_y * -1;
            break;
        }
        v_end = (n_x, n_y, -256);
        mdl_fx moveto(v_end, n_travel_time);
    }
    var_c2a873f6[0] waittilltimeout(n_travel_time, #"movedone");
    foreach (mdl_fx in var_c2a873f6) {
        mdl_fx clientfield::set("" + #"maelstrom_conduct", 0);
        mdl_fx delete();
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x5d45dc39, Offset: 0x107a8
// Size: 0xc
function maelstrom_completed_setup(b_skipped) {
    
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x3aab611b, Offset: 0x107c0
// Size: 0x5c
function maelstrom_completed_cleanup(b_skipped, var_19e802fa) {
    level flag::set(#"hash_4866241882c534b7");
    playsoundatposition(#"hash_6bc2c45bdaed326e", (0, 0, 0));
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x9356e634, Offset: 0x10828
// Size: 0x164
function init_defend() {
    level.ee_hangar_digger_arm_lights = getentarray("skillshot_1", "targetname");
    level.ee_hangar_digger_arm_lights = arraycombine(level.ee_hangar_digger_arm_lights, getentarray("skillshot_2", "targetname"), 0, 0);
    level.ee_hangar_digger_arm_lights = arraycombine(level.ee_hangar_digger_arm_lights, getentarray("skillshot_3", "targetname"), 0, 0);
    var_eacb7781 = getent("defend_gate_l", "targetname");
    var_694d096 = getent("defend_gate_r", "targetname");
    var_eacb7781 hide();
    var_694d096 hide();
    array::thread_all(level.ee_hangar_digger_arm_lights, &init_rune);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x6b9ce2ca, Offset: 0x10998
// Size: 0xac
function light_runes_setup(b_skipped) {
    level endon(#"end_game");
    level zm_ui_inventory::function_7df6bb60(#"zm_towers_objective_progress", 4);
    array::thread_all(level.ee_hangar_digger_arm_lights, &function_1b37b8c4);
    level thread function_54922a21();
    if (!b_skipped) {
        level flag::wait_till(#"hash_20c92720a4602dc7");
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xfd3dca6e, Offset: 0x10a50
// Size: 0x4a
function light_runes_cleanup(b_skipped, var_19e802fa) {
    level flag::clear(#"hash_cad6742c753621");
    level.var_7ea0ed8c = undefined;
    level.ee_hangar_digger_arm_lights = undefined;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0xb6fc4fc5, Offset: 0x10aa8
// Size: 0x22a
function private init_rune() {
    self hide();
    self.t_trig = getent(self.target, "targetname");
    self.b_active = 1;
    a_s_parts = struct::get_array(self.target);
    foreach (s_part in a_s_parts) {
        switch (s_part.script_noteworthy) {
        case #"anchor":
            self.s_anchor = s_part;
            break;
        case #"fx":
            self.mdl_fx = util::spawn_model("tag_origin", s_part.origin, s_part.angles);
            s_part struct::delete();
            break;
        }
    }
    level.var_7ea0ed8c = 0;
    a_set = getentarray(self.targetname, "targetname");
    foreach (e_rune in a_set) {
        if (e_rune.script_int == self.script_int + 1) {
            self.e_next = e_rune;
            break;
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0xbe3b6222, Offset: 0x10ce0
// Size: 0x2e8
function private function_1b37b8c4() {
    level endon(#"end_game");
    self show();
    self hidepart("tag_glow");
    while (self.b_active) {
        waitresult = undefined;
        waitresult = self.t_trig waittill(#"charge_hit");
        if (self function_4c6f5906(waitresult.position, waitresult.direction, waitresult.attacker)) {
            e_rune = self;
            while (isdefined(e_rune)) {
                e_rune thread function_8970492e(1);
                e_rune = e_rune.e_next;
            }
            e_gate = getent("aqueduct_door", "targetname");
            level.var_7ea0ed8c++;
            level thread function_e961a998(level.var_7ea0ed8c);
            if (level.var_7ea0ed8c == 3) {
                e_gate playsound(#"hash_767698596aa0ea4a");
                level flag::set(#"hash_20c92720a4602dc7");
                /#
                    foreach (e_player in level.players) {
                        e_player.var_8f40324e = array();
                        e_player.var_7e8164a8 = array();
                    }
                #/
                e_player = waitresult.attacker;
                e_player thread zm_vo::function_a2bd5a0c(#"hash_3e1ae214416bcbca", 1, 0, 9999, 1);
            } else {
                e_gate playsound(#"hash_1521a3dab1ca39ae" + level.var_7ea0ed8c);
            }
        } else {
            self thread function_8970492e(0);
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x5 linked
// Checksum 0x8ea6e0f6, Offset: 0x10fd0
// Size: 0x164
function private function_8970492e(b_complete) {
    self showpart("tag_glow");
    self playsound(#"hash_771eed11598c2709");
    self playloopsound(#"hash_26a1845fa03cc84b");
    if (b_complete) {
        self.b_active = 0;
        level thread function_5f8e8f45();
        self playsound(#"hash_383ddbe2167b3532");
        self.mdl_fx clientfield::increment("" + #"hash_63e758aa5387132a");
        level flag::wait_till(#"hash_20c92720a4602dc7");
    } else {
        wait(2);
        self stoploopsound();
        self playsound(#"hash_13b84ed8d5eb2394");
        self hidepart("tag_glow");
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0x55f9199a, Offset: 0x11140
// Size: 0x64
function private function_5f8e8f45() {
    e_gate = getent("aqueduct_door", "targetname");
    e_gate moveto(e_gate.origin + vectorscale((0, 0, 1), 10), 3);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x5 linked
// Checksum 0x2e9fd7c0, Offset: 0x111b0
// Size: 0xda
function private function_e961a998(n_count) {
    switch (n_count) {
    case 1:
        exploder::exploder("exp_aqueduct_1");
        break;
    case 2:
        exploder::exploder("exp_aqueduct_2");
        exploder::kill_exploder("exp_aqueduct_1");
        break;
    case 3:
        exploder::exploder("exp_aqueduct_3");
        exploder::kill_exploder("exp_aqueduct_2");
        break;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 3, eflags: 0x5 linked
// Checksum 0x47473e72, Offset: 0x11298
// Size: 0x26e
function private function_4c6f5906(v_pos, v_dir, e_player) {
    s_line = spawnstruct();
    s_line.v_from = v_pos;
    s_line.v_to = s_line.v_from + v_dir * 3000;
    s_result = self function_fa986cd(s_line.v_from, s_line.v_to, v_dir);
    /#
        e_player.var_8f40324e = array();
        e_player.var_7e8164a8 = array();
        if (!isdefined(e_player.var_8f40324e)) {
            e_player.var_8f40324e = [];
        } else if (!isarray(e_player.var_8f40324e)) {
            e_player.var_8f40324e = array(e_player.var_8f40324e);
        }
        if (!isinarray(e_player.var_8f40324e, s_line)) {
            e_player.var_8f40324e[e_player.var_8f40324e.size] = s_line;
        }
        if (!(isdefined(e_player.b_drawing) && e_player.b_drawing)) {
            e_player thread function_f4bc8162();
            e_player.b_drawing = 1;
        }
        e_player.var_8f40324e = arraycombine(e_player.var_8f40324e, s_result.a_s_lines, 0, 0);
        e_player.var_7e8164a8 = arraycombine(e_player.var_7e8164a8, s_result.a_v_points, 0, 0);
        e_player notify(#"start_draw");
    #/
    if (s_result.a_v_points.size == 3) {
        return 1;
    }
    return 0;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 3, eflags: 0x5 linked
// Checksum 0x6f9bfdb2, Offset: 0x11510
// Size: 0x384
function private function_fa986cd(v_start, v_end, v_heading) {
    a_v_points = array();
    a_s_lines = array();
    t_walltrap_hazard_helmet = (0, 0, 0);
    if (!isdefined(a_v_points)) {
        a_v_points = [];
    } else if (!isarray(a_v_points)) {
        a_v_points = array(a_v_points);
    }
    if (!isinarray(a_v_points, v_start)) {
        a_v_points[a_v_points.size] = v_start;
    }
    if (isdefined(self.e_next)) {
        var_bc4b78ae = self.e_next;
        v_heading = function_e5778b63(v_heading, var_bc4b78ae);
        v_end = v_start + v_heading * 3000;
    }
    while (t_walltrap_hazard_helmet !== v_start) {
        t_walltrap_hazard_helmet = v_start;
        if (isdefined(var_bc4b78ae)) {
            var_358bb309 = bullettrace(v_start, v_end, 0, self);
            if (isdefined(var_358bb309[#"position"])) {
                v_start = var_358bb309[#"position"] + v_heading * 1;
                if (distancesquared(var_358bb309[#"position"], var_bc4b78ae.s_anchor.origin) < 1600) {
                    v_heading = function_e5778b63(v_heading, var_bc4b78ae);
                    v_end = v_start + v_heading * 3000;
                    var_bc4b78ae = var_bc4b78ae.e_next;
                    if (!isdefined(a_v_points)) {
                        a_v_points = [];
                    } else if (!isarray(a_v_points)) {
                        a_v_points = array(a_v_points);
                    }
                    if (!isinarray(a_v_points, v_start)) {
                        a_v_points[a_v_points.size] = v_start;
                    }
                }
            }
        }
    }
    for (i = 0; i < a_v_points.size - 1; i++) {
        s_line = {#v_to:a_v_points[i + 1], #v_from:a_v_points[i]};
        if (!isdefined(a_s_lines)) {
            a_s_lines = [];
        } else if (!isarray(a_s_lines)) {
            a_s_lines = array(a_s_lines);
        }
        if (!isinarray(a_s_lines, s_line)) {
            a_s_lines[a_s_lines.size] = s_line;
        }
    }
    return {#a_s_lines:a_s_lines, #a_v_points:a_v_points};
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x5 linked
// Checksum 0x59d8bdde, Offset: 0x118a0
// Size: 0xa2
function private function_e5778b63(v_dir, e_rune) {
    if (!isdefined(e_rune.e_next)) {
        return v_dir;
    }
    var_e3d36541 = vectornormalize(e_rune.e_next.s_anchor.origin - e_rune.s_anchor.origin);
    var_471b250f = vectorlerp(v_dir, var_e3d36541, 0.38);
    return var_471b250f;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0x1ddc4d02, Offset: 0x11950
// Size: 0x1e0
function private function_54922a21() {
    level endon(#"end_game");
    level flag::set(#"hash_cad6742c753621");
    while (level flag::get(#"hash_cad6742c753621")) {
        s_result = undefined;
        s_result = level waittill(#"xbow_hit");
        v_pos = s_result.position;
        e_player = s_result.player;
        foreach (e_rune in level.ee_hangar_digger_arm_lights) {
            v_dist = distancesquared(v_pos, e_rune.s_anchor.origin);
            if (v_dist < 1600) {
                v_dir = vectornormalize(v_pos - e_player geteye());
                e_rune.t_trig notify(#"charge_hit", {#direction:v_dir, #attacker:e_player, #position:v_pos});
            }
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x4
// Checksum 0x74c0915c, Offset: 0x11b38
// Size: 0x15a
function private function_f4bc8162() {
    /#
        self waittill(#"start_draw");
        while (!level flag::get(#"hash_20c92720a4602dc7")) {
            foreach (s_line in self.var_8f40324e) {
                line(s_line.v_from, s_line.v_to, (0, 0, 1));
            }
            foreach (v_sphere in self.var_7e8164a8) {
                sphere(v_sphere, 2, (1, 0, 0));
            }
            waitframe(1);
        }
    #/
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb0fd1e26, Offset: 0x11ca0
// Size: 0x15a
function pressure_plate_setup(b_skipped) {
    if (b_skipped) {
        return;
    }
    while (1) {
        var_89bffd7b = trigger::wait_till("defend_pplate_trig");
        e_player = var_89bffd7b.who;
        if (isplayer(e_player)) {
            var_89bffd7b playsound(#"hash_5ca0151a3b6fba43");
            function_61ab53d1();
            level thread function_2eb4a526();
            s_waitresult = undefined;
            s_waitresult = level waittilltimeout(6, #"hash_bd86f45a8e41ad7");
            if (!level flag::get("special_round") && !level flag::get(#"hash_4fd3d0c01f9b4c30") && s_waitresult._notify == #"timeout") {
                break;
            }
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x852cb4a0, Offset: 0x11e08
// Size: 0x14
function pressure_plate_cleanup(b_skipped, var_19e802fa) {
    
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x4c7fa0a7, Offset: 0x11e28
// Size: 0x162
function function_61ab53d1() {
    level endon(#"end_game");
    var_89bffd7b = getent("defend_pplate_trig", "targetname");
    while (1) {
        a_e_players = util::get_active_players();
        n_touching = 0;
        foreach (e_player in a_e_players) {
            if (e_player istouching(var_89bffd7b)) {
                n_touching++;
            }
        }
        if (!level flag::get("special_round") && !level flag::get(#"hash_4fd3d0c01f9b4c30") && n_touching >= a_e_players.size) {
            break;
        }
        waitframe(1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x74310b94, Offset: 0x11f98
// Size: 0x128
function function_2eb4a526() {
    level endon(#"end_game", #"special_round", #"hash_4fd3d0c01f9b4c30");
    var_89bffd7b = getent("defend_pplate_trig", "targetname");
    while (1) {
        a_e_players = util::get_active_players();
        foreach (e_player in a_e_players) {
            if (!e_player istouching(var_89bffd7b)) {
                level notify(#"hash_bd86f45a8e41ad7");
                return;
            }
        }
        waitframe(1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x4
// Checksum 0x101f4906, Offset: 0x120c8
// Size: 0x210
function private debug_spawns() {
    /#
        level endon(#"stop_debug_spawn");
        level flag::wait_till(#"hash_2bf040db75b1dac7");
        v_test = getent("defend_key_model", "boss_battle_tempo");
        while (1) {
            s_result = undefined;
            s_result = level waittill(#"trilane_debug");
            if (isdefined(s_result.ai) && isdefined(s_result.spawn.origin) && s_result.ai istouching(v_test)) {
                if (!isdefined(level.var_426849d0)) {
                    level.var_426849d0 = array();
                }
                if (!isdefined(level.var_426849d0)) {
                    level.var_426849d0 = [];
                } else if (!isarray(level.var_426849d0)) {
                    level.var_426849d0 = array(level.var_426849d0);
                }
                if (!isinarray(level.var_426849d0, s_result.spawn.origin)) {
                    level.var_426849d0[level.var_426849d0.size] = s_result.spawn.origin;
                }
                iprintlnbold("crowd_react_boss" + s_result.spawn.origin);
            }
        }
    #/
}

// Namespace zm_towers_main_quest/weapon_fired
// Params 1, eflags: 0x40
// Checksum 0x1b7ea65a, Offset: 0x122e0
// Size: 0x1b4
function event_handler[weapon_fired] debug_trilane(var_30d3139) {
    /#
        if (!getdvarint(#"zm_debug_ee", 0) || !getdvarint(#"zm_debug_trilane", 0) >= 1 || !self zm_zonemgr::entity_in_zone("mdl_turn_back", 0)) {
            return;
        }
        setdvar(#"zm_debug_trilane", 0);
        level thread debug_spawns();
        level trilane_defend_setup(1);
        level flag::clear(#"hash_20c92720a4602dc7");
        level flag::clear(#"hash_cad6742c753621");
        level flag::clear(#"hash_6b64093194524df3");
        level flag::clear(#"hash_2bf040db75b1dac7");
        level flag::clear(#"hash_277d03629ade12e8");
        level notify(#"stop_debug_spawn");
        setdvar(#"zm_debug_trilane", 1);
    #/
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x5304f03a, Offset: 0x124a0
// Size: 0x334
function trilane_defend_setup(b_skipped) {
    level endon(#"end_game");
    if (b_skipped) {
        return;
    }
    var_da6ea1aa = level.var_ff68dee;
    level.var_ff68dee = 0;
    level.var_ec9554ad = 0;
    level.var_34a4aede = array();
    level.var_e7f6d6dd = array();
    level.var_5021c818 = array();
    level flag::clear("zombie_drop_powerups");
    level flag::set(#"pause_round_timeout");
    level flag::set(#"hash_4f293396150d2c00");
    pause_zombies(1);
    zm_bgb_anywhere_but_here::function_886fce8f(0);
    playsoundatposition(#"hash_36740ef6a3261e07", (0, 0, 0));
    level function_7ed92b86();
    level thread zm_audio::sndannouncerplayvox(#"hash_24e22336a0d988d0");
    wait(2);
    level thread function_59e60f33();
    level thread defend_timer();
    level thread function_aa67baee();
    level thread function_faee09d2();
    level flag::wait_till(#"hash_6b64093194524df3");
    wait(1);
    playsoundatposition(#"hash_36740ef6a3261e07", (0, 0, 0));
    level flag::set("zombie_drop_powerups");
    level flag::clear(#"pause_round_timeout");
    pause_zombies(0);
    level thread function_865bdf22();
    level flag::clear(#"hash_4f293396150d2c00");
    wait(2);
    level.var_ff68dee = var_da6ea1aa;
    zm_bgb_anywhere_but_here::function_886fce8f(1);
    level flag::set(#"hash_34294ceb082c5d8f");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x6c727a59, Offset: 0x127e0
// Size: 0xc4
function trilane_defend_cleanup(b_skipped, var_19e802fa) {
    level.var_ec9554ad = undefined;
    level.var_34a4aede = undefined;
    level.var_e7f6d6dd = undefined;
    level.var_5021c818 = undefined;
    level.var_cc131a81 = undefined;
    level.var_abda60bd = undefined;
    level.var_ac1c3bba = undefined;
    level flag::set(#"hash_37071af70fe7a9f2");
    playsoundatposition(#"hash_6bc2c55bdaed3421", (0, 0, 0));
    exploder::exploder("exp_odin_eyes");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0xdd2ea289, Offset: 0x128b0
// Size: 0x244
function private function_7ed92b86() {
    a_t_doors = getentarray("connect_ra_tunnel_to_body_pit", "script_flag");
    foreach (t_door in a_t_doors) {
        if (!(isdefined(t_door.has_been_opened) && t_door.has_been_opened)) {
            t_door thread zm_blockers::door_opened();
        }
    }
    waitframe(1);
    function_41c15ae9(array("defend_trilane_door", "pap_room_body_pit_entrance", "connect_ra_tunnel_to_body_pit"));
    e_l_door = getent("zm_gate_l", "targetname");
    var_eacb7781 = getent("defend_gate_l", "targetname");
    e_l_door linkto(var_eacb7781);
    e_r_door = getent("zm_gate_r", "targetname");
    var_694d096 = getent("defend_gate_r", "targetname");
    e_r_door linkto(var_694d096);
    var_eacb7781 rotateto(var_eacb7781.angles + vectorscale((0, 1, 0), 85), 1);
    var_694d096 rotateto(var_694d096.angles - vectorscale((0, 1, 0), 70), 1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0x91f866b1, Offset: 0x12b00
// Size: 0xfc
function private function_865bdf22() {
    function_1efe04ba(array("defend_trilane_door", "pap_room_body_pit_entrance", "connect_ra_tunnel_to_body_pit"));
    var_eacb7781 = getent("defend_gate_l", "targetname");
    var_694d096 = getent("defend_gate_r", "targetname");
    var_eacb7781 rotateto(var_eacb7781.angles - vectorscale((0, 1, 0), 85), 1);
    var_694d096 rotateto(var_694d096.angles + vectorscale((0, 1, 0), 70), 1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0x70879332, Offset: 0x12c08
// Size: 0x1fc
function private defend_timer() {
    level endon(#"end_game");
    level flag::set(#"hash_2bf040db75b1dac7");
    n_total_time = 300;
    var_45fb490a = 0;
    var_fc655932 = 0;
    while (level.var_ec9554ad <= n_total_time) {
        wait(0.1);
        level.var_ec9554ad = level.var_ec9554ad + 0.1;
        if (isdefined(level.var_34a4aede[0]) && level.var_ec9554ad >= level.var_34a4aede[0].time) {
            level notify(#"hash_54e0394dae6dd7");
        }
        if (isdefined(level.var_e7f6d6dd[0]) && level.var_ec9554ad >= level.var_e7f6d6dd[0].time) {
            level notify(#"hash_68337916c80885b2");
        }
        if (!var_45fb490a && level.var_ec9554ad >= 90) {
            function_c12ff921();
            var_45fb490a = 1;
            wait(3);
        } else if (!var_fc655932 && level.var_ec9554ad >= 180) {
            function_c12ff921();
            var_fc655932 = 1;
            wait(3);
        }
    }
    function_c12ff921();
    level flag::set(#"hash_277d03629ade12e8");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa134fea3, Offset: 0x12e10
// Size: 0x94
function key_glint() {
    level endon(#"end_game");
    level flag::wait_till("all_players_spawned");
    mdl_key = getent("defend_key_model", "targetname");
    mdl_key clientfield::set("" + #"hash_23ba00d2f804acc2", 1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0x8ce8acbb, Offset: 0x12eb0
// Size: 0x1ac
function private function_59e60f33() {
    level endon(#"end_game");
    level flag::wait_till(#"hash_2bf040db75b1dac7");
    n_total_time = 300;
    mdl_key = getent("defend_key_model", "targetname");
    mdl_key movez(87, n_total_time);
    var_e94fb8f2 = getent("defend_key_water", "targetname");
    var_e94fb8f2 movez(87, n_total_time);
    var_e94fb8f2 playsound(#"hash_62134415f7cb98bf");
    var_e94fb8f2 playloopsound(#"hash_743459bdbedaa021");
    while (level.var_ec9554ad <= n_total_time) {
        wait(1);
    }
    var_e94fb8f2 stoploopsound();
    var_e94fb8f2 playsound(#"hash_7fe5636b1fde99aa");
    level flag::wait_till(#"hash_277d03629ade12e8");
    level thread function_b06cc4d9();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0xc37ec680, Offset: 0x13068
// Size: 0x1ac
function private function_b06cc4d9() {
    level endon(#"end_game");
    s_key = struct::get("defend_key_loc");
    s_key zm_unitrigger::create(&function_624297cc, (96, 180, 96));
    e_key = getent("defend_key_model", "targetname");
    s_waitresult = undefined;
    s_waitresult = s_key waittill(#"trigger_activated");
    e_key clientfield::set("" + #"hash_23ba00d2f804acc2", 0);
    e_key hide();
    level flag::set(#"hash_6b64093194524df3");
    e_player = s_waitresult.e_who;
    e_player playsound(#"hash_2a02753bc05ff3de");
    e_player zm_vo::function_a2bd5a0c(#"hash_671a04c9b101659c", 0, 0, 9999, 1);
    level thread registerpost_chem_lab_touching_();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc909bd0, Offset: 0x13220
// Size: 0x8c
function registerpost_chem_lab_touching_() {
    level zm_audio::sndannouncerplayvox(#"hash_41d25c641d7c8484");
    e_player = array::random(zm_vo::function_347f7d34());
    if (isdefined(e_player)) {
        e_player zm_vo::function_a2bd5a0c(#"hash_30b4404eefd745f5", 0, 0, 9999, 1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x5 linked
// Checksum 0x440f67c, Offset: 0x132b8
// Size: 0x36
function private function_624297cc(e_player) {
    if (!level flag::get(#"hash_6b64093194524df3")) {
        return 1;
    }
    return 0;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0xc6d684df, Offset: 0x132f8
// Size: 0x2d50
function private function_faee09d2() {
    level endon(#"end_game");
    level.var_cc131a81 = struct::get_array("defend_trilane_01");
    level.var_abda60bd = struct::get_array("defend_trilane_02");
    level.var_ac1c3bba = struct::get_array("defend_trilane_03");
    var_617c504e = 9;
    var_76ed7b30 = 9;
    var_3cb006b6 = 9.23077;
    level.var_34a4aede = array({#minplayers:1, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"normal", #time:0}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:var_617c504e}, {#minplayers:4, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:var_617c504e * 1.5}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:var_617c504e * 2}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"plasma", #time:var_617c504e * 3}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"plasma", #time:var_617c504e * 3}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:var_617c504e * 4}, {#minplayers:2, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:var_617c504e * 4}, {#minplayers:4, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:var_617c504e * 4}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:var_617c504e * 5}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"tiger", #time:var_617c504e * 5}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"tiger", #time:var_617c504e * 5}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:var_617c504e * 6}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:var_617c504e * 6}, {#minplayers:1, #lanes:array(1, 3), #quantity:1, #archetype:#"plasma", #time:var_617c504e * 7}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"plasma", #time:var_617c504e * 7}, {#minplayers:4, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"plasma", #time:var_617c504e * 7.5}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:var_617c504e * 7.5}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:var_617c504e * 8}, {#minplayers:1, #lanes:array(2), #quantity:3, #archetype:#"tiger", #time:var_617c504e * 8}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:var_617c504e * 8}, {#minplayers:4, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:var_617c504e * 8}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:var_617c504e * 9}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"tiger", #time:var_617c504e * 9}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"tiger", #time:var_617c504e * 9}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:90 + var_76ed7b30}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:90 + var_76ed7b30 * 2}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:90 + var_76ed7b30 * 3}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"corrosive", #time:90 + var_76ed7b30 * 4}, {#minplayers:4, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:90 + var_76ed7b30 * 4}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"plasma", #time:90 + var_76ed7b30 * 4}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:90 + var_76ed7b30 * 5}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"glad_m", #time:90 + var_76ed7b30 * 5}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"glad_m", #time:90 + var_76ed7b30 * 5}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:90 + var_76ed7b30 * 6}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:90 + var_76ed7b30 * 7}, {#minplayers:4, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:90 + var_76ed7b30 * 7}, {#minplayers:2, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"corrosive", #time:90 + var_76ed7b30 * 7}, {#minplayers:4, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"corrosive", #time:90 + var_76ed7b30 * 7}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:90 + var_76ed7b30 * 7}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"glad_m", #time:90 + var_76ed7b30 * 8}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:90 + var_76ed7b30 * 9}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"glad_r", #time:90 + var_76ed7b30 * 9}, {#minplayers:2, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"glad_r", #time:90 + var_76ed7b30 * 9}, {#minplayers:4, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"glad_r", #time:90 + var_76ed7b30 * 9}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"tiger", #time:180 + var_3cb006b6}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"tiger", #time:180 + var_3cb006b6 * 2}, {#minplayers:4, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:180 + var_3cb006b6 * 2.5}, {#minplayers:2, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:180 + var_3cb006b6 * 3}, {#minplayers:3, #lanes:array(1, 3), #quantity:2, #archetype:#"tiger", #time:180 + var_3cb006b6 * 3}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:180 + var_3cb006b6 * 4}, {#minplayers:2, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:180 + var_3cb006b6 * 4}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:180 + var_3cb006b6 * 5}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"glad_m", #time:180 + var_3cb006b6 * 5}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"glad_r", #time:180 + var_3cb006b6 * 5}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:180 + var_3cb006b6 * 6}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"plasma", #time:180 + var_3cb006b6 * 6}, {#minplayers:1, #lanes:array(1, 3), #quantity:2, #archetype:#"tiger", #time:180 + var_3cb006b6 * 7}, {#minplayers:4, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"normal", #time:180 + var_3cb006b6 * 7}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"tiger", #time:180 + var_3cb006b6 * 8}, {#minplayers:1, #lanes:array(2), #quantity:2, #archetype:#"tiger", #time:180 + var_3cb006b6 * 8.5}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:2, #archetype:#"glad_m", #time:180 + var_3cb006b6 * 9}, {#minplayers:4, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:180 + var_3cb006b6 * 9}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:1, #archetype:#"glad_m", #time:180 + var_3cb006b6 * 9}, {#minplayers:1, #lanes:array(2), #quantity:2, #archetype:#"glad_r", #time:180 + var_3cb006b6 * 9}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:3, #archetype:#"normal", #time:180 + var_3cb006b6 * 10}, {#minplayers:1, #lanes:array(1, 3), #quantity:1, #archetype:#"corrosive", #time:180 + var_3cb006b6 * 10}, {#minplayers:1, #lanes:array(2), #quantity:3, #archetype:#"tiger", #time:180 + var_3cb006b6 * 10}, {#minplayers:2, #lanes:array(2), #quantity:2, #archetype:#"glad_m", #time:180 + var_3cb006b6 * 10}, {#minplayers:4, #lanes:array(1, 3), #quantity:2, #archetype:#"glad_r", #time:180 + var_3cb006b6 * 10}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:4, #archetype:#"normal", #time:180 + var_3cb006b6 * 11}, {#minplayers:1, #lanes:array(1), #quantity:1, #archetype:#"blight", #time:180 + var_3cb006b6 * 11}, {#minplayers:2, #lanes:array(3), #quantity:1, #archetype:#"blight", #time:180 + var_3cb006b6 * 11}, {#minplayers:4, #lanes:array(3), #quantity:1, #archetype:#"blight", #time:180 + var_3cb006b6 * 11.5}, {#minplayers:1, #lanes:array(1, 2, 3), #quantity:4, #archetype:#"normal", #time:180 + var_3cb006b6 * 12}, {#minplayers:3, #lanes:array(1, 2, 3), #quantity:4, #archetype:#"normal", #time:180 + var_3cb006b6 * 12.5});
    while (!level flag::get(#"hash_277d03629ade12e8")) {
        level waittill(#"hash_54e0394dae6dd7");
        var_1e001170 = array::pop_front(level.var_34a4aede, 0);
        level thread defend_spawn(var_1e001170);
        if (!level.var_34a4aede.size) {
            level flag::wait_till(#"hash_277d03629ade12e8");
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x5 linked
// Checksum 0x392a1214, Offset: 0x16050
// Size: 0x60c
function private defend_spawn(var_4bf95f4c) {
    if (level.players.size < var_4bf95f4c.minplayers) {
        return;
    }
    foreach (n_lane in var_4bf95f4c.lanes) {
        switch (n_lane) {
        case 1:
            var_97f729b = level.var_cc131a81;
            break;
        case 2:
            var_97f729b = level.var_abda60bd;
            break;
        case 3:
            var_97f729b = level.var_ac1c3bba;
            break;
        default:
            return;
        }
        for (i = 0; i < var_4bf95f4c.quantity; i++) {
            while (level.ai[#"axis"].size >= 24) {
                level.var_ec9554ad = level.var_ec9554ad - 0.1;
                waitframe(1);
            }
            var_6454115e = array::random(var_97f729b);
            switch (var_4bf95f4c.archetype) {
            case #"normal":
                ai = undefined;
                while (!isdefined(ai)) {
                    wait(0.5);
                    ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "defend_trilane_fill", var_6454115e, function_92d8f779());
                }
                continue;
            case #"plasma":
                ai = undefined;
                while (!isdefined(ai)) {
                    ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "defend_trilane_spawn", var_6454115e, function_92d8f779());
                    wait(0.5);
                }
                while (zm_transform::function_abf1dcb4(#"catalyst_plasma")) {
                    waitframe(1);
                }
                if (isdefined(ai)) {
                    zm_transform::function_9acf76e6(ai, #"catalyst_plasma");
                }
                continue;
            case #"corrosive":
                ai = undefined;
                while (!isdefined(ai)) {
                    ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "defend_trilane_spawn", var_6454115e, function_92d8f779());
                    wait(0.5);
                }
                while (zm_transform::function_abf1dcb4(#"catalyst_corrosive")) {
                    waitframe(1);
                }
                if (isdefined(ai)) {
                    zm_transform::function_9acf76e6(ai, #"catalyst_corrosive");
                }
                continue;
            case #"glad_m":
                zombie_gladiator_util::function_69f309b(1, "melee", undefined, 1, var_6454115e);
                continue;
            case #"glad_r":
                zombie_gladiator_util::function_69f309b(1, "ranged", undefined, 1, var_6454115e);
                continue;
            case #"blight":
                ai = undefined;
                while (!isdefined(ai)) {
                    ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "defend_trilane_spawn", var_6454115e, level.round_number);
                    wait(0.5);
                }
                while (zm_transform::function_abf1dcb4(#"blight_father")) {
                    waitframe(1);
                }
                if (isdefined(ai)) {
                    zm_transform::function_9acf76e6(ai, #"blight_father", &function_915f8f46);
                }
                continue;
            case #"tiger":
                var_1c62893d = getspawnerarray("zombie_spawner_tiger", "targetname")[0];
                ai = undefined;
                while (!isdefined(ai)) {
                    ai = zombie_utility::spawn_zombie(var_1c62893d, "defend_trilane_spawn", var_6454115e, max(20, level.round_number));
                    wait(0.5);
                }
                continue;
            default:
                return;
            }
        }
        /#
            wait(1);
            if (isdefined(ai)) {
                level notify(#"trilane_debug", {#spawn:var_6454115e, #ai:ai});
            }
        #/
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0x9439871c, Offset: 0x16668
// Size: 0x1b8
function private function_aa67baee() {
    level endon(#"end_game");
    level.var_e7f6d6dd = array({#delay:&function_c12ff921, #powerup:"full_ammo", #time:95}, {#delay:&function_c12ff921, #powerup:"full_ammo", #time:185});
    s_loc = struct::get(#"hash_74b68c7b7af8e368");
    while (!level flag::get(#"hash_277d03629ade12e8")) {
        level waittill(#"hash_68337916c80885b2");
        var_1e001170 = array::pop_front(level.var_e7f6d6dd, 0);
        if (isdefined(var_1e001170.delay)) {
            level [[ var_1e001170.delay ]]();
        }
        level thread zm_powerups::specific_powerup_drop(var_1e001170.powerup, s_loc.origin, undefined, undefined, undefined, 1, 1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x5 linked
// Checksum 0x22fb3f93, Offset: 0x16828
// Size: 0x64
function private function_915f8f46(ai) {
    ai endon(#"death");
    ai function_b540bcee(array("zone_body_pit"), array("defend_notongue_vol"));
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0xa4afd39f, Offset: 0x16898
// Size: 0x150
function private function_c12ff921() {
    level endon(#"end_game");
    while (level.ai[#"axis"].size) {
        for (i = 0; i < level.ai[#"axis"].size; i++) {
            ai_enemy = level.ai[#"axis"][i];
            if (!ai_enemy zm_zonemgr::entity_in_zone("zone_body_pit")) {
                if (!isdefined(ai_enemy.var_77e280cb)) {
                    ai_enemy.var_77e280cb = 0;
                }
                ai_enemy.var_77e280cb = ai_enemy.var_77e280cb + 0.01;
                if (ai_enemy.var_77e280cb > 12 && isdefined(ai_enemy.allowdeath) && ai_enemy.allowdeath) {
                    ai_enemy kill();
                }
            }
        }
        waitframe(1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xdc0d6713, Offset: 0x169f0
// Size: 0x64
function function_92d8f779() {
    if (level.players.size == 4) {
        return max(20, level.round_number + 8);
    } else {
        return max(20, level.round_number);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xa1285dea, Offset: 0x16a60
// Size: 0x6c
function function_bd321d77(b_skipped) {
    level zm_ui_inventory::function_7df6bb60(#"zm_towers_objective_progress", 5);
    level waittill(#"boss_battle_done");
    /#
        iprintln("<unknown string>");
    #/
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x77199d63, Offset: 0x16ad8
// Size: 0xc4
function function_138874e8(b_skipped, var_19e802fa) {
    level thread scene::init_streamer(#"hash_18b88682c325ad3d", #"allies");
    function_76a7e2d3();
    level zm_towers::setup_end_igc(0);
    scene::function_d8a83a50(#"hash_18b88682c325ad3d", &end_game, "done");
    level thread scene::play(#"hash_18b88682c325ad3d");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x9a4758ae, Offset: 0x16ba8
// Size: 0x18
function end_game() {
    level notify(#"end_game");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xdaf092c0, Offset: 0x16bc8
// Size: 0x100
function function_9dad4c51() {
    setdvar(#"zombie_unlock_all", 1);
    level.var_5791d548 = 1;
    zombie_doors = getentarray("zombie_door", "targetname");
    level zm_blockers::function_5989dd12(zombie_doors);
    level.var_5791d548 = undefined;
    foreach (s_box in level.chests) {
        s_box thread zm_magicbox::hide_chest(0);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x815e4aa1, Offset: 0x16cd0
// Size: 0x1e4
function function_2f146aa0(e_trig) {
    level endon(#"end_game");
    if (getdvarint(#"zm_debug_boss", 0) >= 1 || getdvarint(#"zm_debug_ee", 0)) {
        level flag::set(#"hash_37071af70fe7a9f2");
    }
    level thread function_9959381();
    level flag::wait_till(#"hash_37071af70fe7a9f2");
    t_zm_towers_boss_teleport = getent("t_zm_towers_boss_teleport", "targetname");
    t_zm_towers_boss_teleport sethintstring(#"hash_196636b14fafbe56");
    foreach (player in getplayers()) {
        e_trig setvisibletoplayer(player);
    }
    level clientfield::set("" + #"hash_16b9e3d69cb7a017", 1);
    level function_6378f02b(e_trig);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xde321c36, Offset: 0x16ec0
// Size: 0x5c4
function function_6378f02b(e_trig) {
    level endon(#"end_game");
    setclearanceceiling(142);
    var_801d42e6 = 0;
    b_teleported = 0;
    level.boss_entry_tower_remains = getent("boss_entry_tower_remains", "targetname");
    level.boss_entry_tower_remains hide();
    entrance_tower_collision = getent("entrance_tower_collision", "targetname");
    entrance_tower_collision disconnectpaths();
    scene::init("p8_fxanim_zm_towers_boss_arena_gate_destroy_bundle");
    var_d2fb9acc = getdvar(#"hash_3065419bcba97739", 0);
    if (!var_d2fb9acc) {
        while (!b_teleported) {
            while (!var_801d42e6) {
                e_trig waittill(#"touch");
                var_a10268d3 = getplayers();
                var_66c0821c = 0;
                foreach (e_player in var_a10268d3) {
                    if (e_player istouching(e_trig)) {
                        var_66c0821c++;
                    }
                }
                if (var_66c0821c == var_a10268d3.size) {
                    var_801d42e6 = 1;
                } else {
                    var_801d42e6 = 0;
                }
            }
            e_trig waittill(#"trigger");
            level thread zm_audio::function_bca32e49(#"m_quest", #"open_gate", undefined, 1);
            var_a10268d3 = getplayers();
            var_66c0821c = 0;
            foreach (e_player in var_a10268d3) {
                if (e_player istouching(e_trig)) {
                    var_66c0821c++;
                }
            }
            if (var_66c0821c == var_a10268d3.size) {
                b_teleported = 1;
            }
        }
    }
    e_gate = getent("arena_gate_west", "targetname");
    v_amount = vectorscale(e_gate.script_vector, 1);
    e_gate moveto(e_gate.origin + v_amount, 3);
    e_gate playsound(#"hash_1259041350e5f60d");
    wait(1);
    level scene::init("boss_battle_tempo", "targetname");
    level thread zm_utility::function_9ad5aeb1(1);
    wait(1);
    var_ff91be3a = struct::get_array("s_zm_towers_port_to_boss", "targetname");
    var_a10268d3 = getplayers();
    for (i = 0; i < var_a10268d3.size; i++) {
        var_a10268d3[i] setorigin(var_ff91be3a[i].origin);
        var_a10268d3[i] setplayerangles(var_ff91be3a[i].angles);
    }
    callback::on_spawned(&function_d4e923e7);
    level notify(#"hash_4a06aa98c6c7b671");
    level thread function_9dad4c51();
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            ee = level._ee[#"main_quest"];
            ee.skip_to_step = 15;
            if (ee.started && level._ee[#"main_quest"].current_step != 15) {
                zm_sq::function_614612f(#"main_quest");
            }
        }
    #/
    level thread boss_fight();
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xd9c1662, Offset: 0x17490
// Size: 0x114
function function_d4e923e7() {
    self notify("6e814ef90f04adde");
    self endon("6e814ef90f04adde");
    self endon(#"disconnect");
    var_3de22b91 = struct::get_array("s_zm_towers_port_to_boss", "targetname");
    i = 0;
    s_loc = var_3de22b91[i];
    while (positionwouldtelefrag(s_loc.origin)) {
        i++;
        if (i >= var_3de22b91.size - 1) {
            i = 0;
            waitframe(1);
        }
        s_loc = var_3de22b91[i];
    }
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x3e7de6c, Offset: 0x175b0
// Size: 0xe4
function function_a407b7bc() {
    tower = struct::get("entrance_tower", "targetname");
    entrance_tower_collision = getent("entrance_tower_collision", "targetname");
    if (isdefined(entrance_tower_collision)) {
        entrance_tower_collision connectpaths();
        entrance_tower_collision delete();
    }
    if (isdefined(tower)) {
        tower thread scene::play();
        wait(scene::function_12479eba(#"p8_fxanim_zm_towers_boss_arena_tower_entrance_bundle"));
        level.boss_entry_tower_remains show();
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa745650d, Offset: 0x176a0
// Size: 0x48
function function_b2e7b40d() {
    t_tower = getent("gate_2_flesh_tower", "script_string");
    if (isdefined(t_tower)) {
        t_tower notify(#"tower_boss_scripted_trigger_tower");
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x2d59c7c0, Offset: 0x176f0
// Size: 0x12cc
function boss_fight() {
    level endon(#"end_game");
    level notify(#"hash_4a06aa98c6c7b671");
    zm_towers_crowd::function_5c1184e(0);
    zm_towers_crowd::function_aec5ec5a(1);
    level.var_9a992b09 = 1;
    array::thread_all(level.players, &zm_towers_crowd::function_51ea46f3, 0, 1);
    level.var_b2b15659 = 1;
    level.powerup_vo_available = &return_false;
    level zm_audio::function_6191af93(#"general", #"gib", "", "");
    level zm_audio::function_6191af93(#"elixir", #"drink", "", "");
    level zm_audio::function_6191af93(#"blight_father", #"weak_points", "", "");
    level zm_audio::function_6191af93(#"catalyst_transform", #"react", "", "");
    level zm_audio::function_6191af93(#"catalyst_water", #"react", "", "");
    level zm_audio::function_6191af93(#"catalyst_electric", #"react", "", "");
    level zm_audio::function_6191af93(#"catalyst_plasma", #"react", "", "");
    level zm_audio::function_6191af93(#"catalyst_corrosive", #"react", "", "");
    level zm_audio::function_6191af93(#"catalyst_corrosive", #"react", "", "");
    level zm_audio::function_6191af93(#"kill", #"gladiator_destroyer", "", "");
    level zm_audio::function_6191af93(#"kill", #"gladiator_marauder", "", "");
    level zm_audio::function_6191af93(#"kill", #"tiger", "", "");
    level zm_audio::function_6191af93(#"gladiator_marauder", #"react", "", "");
    level zm_audio::function_6191af93(#"gladiator_destroyer", #"react", "", "");
    level zm_audio::function_6191af93(#"tiger", #"react", "", "");
    level zm_audio::function_6191af93(#"tiger", #"react", "", "");
    level.zmannouncervox[#"hash_5f0f1e699aa7e761"] = "";
    switch (level.players.size) {
    case 1:
        level.var_ced6f061 = 12;
        break;
    case 2:
        level.var_ced6f061 = 15;
        break;
    case 3:
    case 4:
        level.var_ced6f061 = 18;
        break;
    }
    zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", 9);
    level flag::set(#"hash_4f293396150d2c00");
    level function_45ac4bb8(1, 0);
    var_3a6fab91 = zm_round_spawning::function_f6cd912d();
    if (isdefined(var_3a6fab91)) {
        zm_round_spawning::function_d36196b1(var_3a6fab91.n_round);
    }
    level thread function_3a3bf6e8();
    zm_bgb_anywhere_but_here::function_886fce8f(0);
    level flag::set("pause_round_timeout");
    pause_zombies(1);
    level flag::init("both_towers_bosses_killed");
    if (!getdvar(#"hash_2b64162aa40fe2bb", 0)) {
        function_2a9ec1e9();
        zm_round_spawning::function_c1571721(&function_81c5a136);
        zm_round_spawning::function_54fee373(&function_ef2a451c);
        level.var_153e9058 = 1;
        level.var_ff68dee = 0;
        level.var_1643d0d = arraycopy(level.var_3ecc60fc);
    }
    foreach (player in level.players) {
        player clientfield::set_to_player("snd_crowd_react", 11);
    }
    zm_zonemgr::enable_zone("zone_boss_battle");
    level thread function_13576d14();
    var_d2fb9acc = getdvar(#"hash_3065419bcba97739", 0);
    if (!var_d2fb9acc) {
        wait(8);
    }
    if (getdvar(#"hash_2b64162aa40fe2bb", 0)) {
        scene::play("p8_fxanim_zm_towers_boss_arena_gate_raise_bundle", "Shot 1");
        scene::play("p8_fxanim_zm_towers_boss_arena_gate_raise_bundle", "Shot 2");
        scene::play("p8_fxanim_zm_towers_boss_arena_gate_raise_bundle", "Shot 3");
    } else {
        level thread function_e9d463a0();
        level waittill(#"hash_12768f75609d32ca");
    }
    level clientfield::set("crowd_react_boss", 0);
    if (!var_d2fb9acc) {
        wait(6);
    }
    level.var_ff68dee = 15;
    var_47312393 = struct::get("towers_boss_location_1", "script_noteworthy");
    sp_spawner = getent("zombie_towers_boss_spawner", "script_noteworthy");
    trigger::wait_till("large_gate_l_trigger", "targetname");
    e_elephant = spawner::simple_spawn_single(sp_spawner, &function_f9da4403, var_47312393, #"hash_266f53fb994e6120");
    while (!isdefined(e_elephant.ai.riders) || e_elephant.ai.riders.size < 2) {
        wait(0.1);
    }
    e_elephant thread function_1a05e10c(#"towers_boss_ground_attack", #"m_quest", #"shockwave_warn");
    level util::delay(2, undefined, &clientfield::set, "crowd_react_boss", 1);
    level.var_3395fcab = 1;
    level thread function_ae1cbf2e();
    animation::add_global_notetrack_handler("tower_contact", &function_a407b7bc, 0);
    e_elephant.takedamage = 0;
    scene::play(#"hash_5e82fd01d9eb1519", array(e_elephant));
    e_elephant.takedamage = 1;
    e_elephant notify(#"entrace_done");
    level thread function_4d682898();
    level thread function_92e1954c();
    level thread function_1a05e10c(#"hash_5c38f322b9e6a58d", #"m_quest", #"missile_warn");
    level thread function_1a05e10c(#"hash_1a3fb5566689f319", #"m_quest", #"missile_track");
    level thread function_1a05e10c(#"hash_1580cd3b2c801f46", #"m_quest", #"charge_warn");
    level thread function_c64fc074();
    level thread function_95785950(45, level.var_49328379, #"armor_nag", #"hash_634700dd42db02d8");
    level thread function_95785950(90, level.var_8b66546e, #"basket_nag", #"hash_634700dd42db02d8");
    array::thread_all(level.players, &function_3d487e02);
    wait(2);
    function_14833fc2();
    if (!getdvar(#"hash_2b64162aa40fe2bb", 0)) {
        pause_zombies(0);
        level flag::set(#"infinite_round_spawning");
    }
    e_elephant waittill(#"death");
    pause_zombies(1, 0);
    foreach (player in level.players) {
        player clientfield::set_to_player("snd_crowd_react", 13);
    }
    wait(1);
    level thread function_e50623f();
    wait(15);
    function_14833fc2();
    trigger::wait_till("large_gate_r_trigger", "targetname");
    level notify(#"hash_5d826e11ebe4b6e7");
    level.var_a52a5487 = 1;
    var_19ef8f95 = struct::get("towers_boss_location_2", "script_noteworthy");
    sp_spawner = getent("zombie_towers_boss2_spawner", "script_noteworthy");
    e_elephant = spawner::simple_spawn_single(sp_spawner, &function_f9da4403, var_19ef8f95, #"hash_266f56fb994e6639");
    e_elephant thread function_1a05e10c(#"towers_boss_ground_attack", #"m_quest", #"shockwave_warn");
    while (!isdefined(e_elephant.ai.riders) || e_elephant.ai.riders.size < 4) {
        wait(0.1);
    }
    foreach (player in level.players) {
        player clientfield::set_to_player("snd_crowd_react", 12);
    }
    animation::add_global_notetrack_handler("tower_contact_2", &function_b2e7b40d, 0);
    level scene::play("p8_fxanim_zm_towers_boss_arena_gate_destroy_bundle", "shot 1");
    e_elephant notify(#"hash_6537a2364ba9dcb3");
    level thread scene::play("p8_fxanim_zm_towers_boss_arena_gate_destroy_bundle", "shot 2");
    e_elephant.takedamage = 0;
    scene::play(#"hash_5e82fc01d9eb1366", array(e_elephant));
    e_elephant.takedamage = 1;
    e_elephant notify(#"entrace_done");
    level.var_3395fcab = 2;
    level thread function_4550c346();
    wait(2);
    if (!getdvar(#"hash_2b64162aa40fe2bb", 0)) {
        pause_zombies(0);
        level flag::set(#"infinite_round_spawning");
        level.var_153e9058 = 0;
    }
    level flag::wait_till("both_towers_bosses_killed");
    level.var_2d744147 = gettime();
    pause_zombies(1, 0);
    level flag::clear(#"infinite_round_spawning");
    foreach (player in level.players) {
        player clientfield::set_to_player("snd_crowd_react", 13);
    }
    level notify(#"boss_battle_done");
    callback::remove_on_spawned(&function_d4e923e7);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x3b5edab5, Offset: 0x189c8
// Size: 0x1d4
function function_5a2db619(a_ents) {
    zm_towers_crowd::function_696a8df0(1);
    zm_towers_crowd::function_5c1184e(0);
    zm_towers_crowd::function_aec5ec5a(0);
    level notify(#"kill_special_round_fog");
    array::thread_all(getplayers(), &status_effect::function_6519f95f);
    array::thread_all(getplayers(), &zm_towers_crowd::function_51ea46f3, 0, 1);
    a_ai_zombies = getaiarray();
    foreach (ai in a_ai_zombies) {
        if (isalive(ai)) {
            util::stop_magic_bullet_shield(ai);
            ai.allowdeath = 1;
            ai kill();
        }
    }
    pause_zombies(1);
    level thread scene::play("special_round_drummers", "targetname");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xed93c16a, Offset: 0x18ba8
// Size: 0x3c
function function_fcff05cf(a_ents) {
    level clientfield::increment("" + #"hash_1f09a5290d31eb37");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xa9f42297, Offset: 0x18bf0
// Size: 0x94
function function_fc8b8d1d(a_ents) {
    level scene::function_cef06dcb();
    zm_towers_crowd::function_5c1184e(1);
    zm_towers_crowd::function_696a8df0(0);
    zm_towers_crowd::function_aec5ec5a(0);
    level scene::stop("special_round_drummers", "targetname");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0xd3d85e82, Offset: 0x18c90
// Size: 0x50
function private function_14833fc2() {
    target_round = zm_round_logic::get_round_number() + 1;
    zm_round_logic::set_round_number(target_round - 1);
    level notify(#"kill_round");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0xdebbb152, Offset: 0x18ce8
// Size: 0xa4
function private function_2a9ec1e9() {
    zm_round_spawning::function_376e51ef(#"blight_father");
    zm_round_spawning::function_376e51ef(#"catalyst");
    zm_round_spawning::function_376e51ef(#"gladiator_destroyer");
    zm_round_spawning::function_376e51ef(#"gladiator_marauder");
    zm_round_spawning::function_376e51ef(#"tiger");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x18be3f02, Offset: 0x18d98
// Size: 0x10
function function_81c5a136(n_points) {
    return 1600;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xfc65a36e, Offset: 0x18db0
// Size: 0x86
function function_ef2a451c(var_8997f0f2) {
    var_8997f0f2[#"blight_father"] = 1;
    var_8997f0f2[#"catalyst"] = 4;
    var_8997f0f2[#"gladiator_destroyer"] = 2;
    var_8997f0f2[#"gladiator_marauder"] = 6;
    var_8997f0f2[#"tiger"] = 5;
    return var_8997f0f2;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xaa244cd7, Offset: 0x18e40
// Size: 0x7e4
function function_e9d463a0() {
    level endon(#"hash_12768f75609d32ca");
    level.var_263754a7 = randomintrangeinclusive(9, 20);
    var_e4a16c04 = array();
    var_671dac98 = array();
    var_e4a16c04[0] = getent("hell_gate_1_l", "targetname");
    var_e4a16c04[1] = getent("hell_gate_1_m", "targetname");
    var_e4a16c04[2] = getent("hell_gate_1_h", "targetname");
    var_671dac98[0] = getent("hell_gate_2_l", "targetname");
    var_671dac98[1] = getent("hell_gate_2_m", "targetname");
    var_671dac98[2] = getent("hell_gate_2_h", "targetname");
    switch (level.players.size) {
    case 1:
    default:
        n_wait_amount = 2.5;
        break;
    case 2:
        n_wait_amount = 1.66667;
        break;
    case 3:
        n_wait_amount = 1.25;
        break;
    case 4:
        n_wait_amount = 0.833333;
        break;
    }
    level thread function_b3e0a008();
    wait(10);
    callback::on_ai_killed(&function_2e309b5c);
    level clientfield::set("crowd_react_boss", 1);
    foreach (player in level.players) {
        player clientfield::set_to_player("snd_crowd_react", 12);
        player zm_towers_challenges::function_fd8a137e();
    }
    level thread scene::play("boss_battle_tempo", "targetname");
    level thread function_432247a7();
    function_c84b435();
    a_s_spawners = struct::get_array("boss_battle_spawns");
    a_s_spawners = arraycombine(a_s_spawners, struct::get_array("boss_temp_gate_tele", "targetname"), 0, 0);
    var_bfa27650 = [];
    foreach (s_spawn in a_s_spawners) {
        if (s_spawn.script_noteworthy === "gladiator_location") {
            if (!isdefined(var_bfa27650)) {
                var_bfa27650 = [];
            } else if (!isarray(var_bfa27650)) {
                var_bfa27650 = array(var_bfa27650);
            }
            if (!isinarray(var_bfa27650, s_spawn)) {
                var_bfa27650[var_bfa27650.size] = s_spawn;
            }
        }
    }
    while (1) {
        if (level.ai[#"axis"].size < level.var_ced6f061) {
            if (level flag::get(#"hash_353dcb95f778ad73")) {
                n_toggle = randomintrangeinclusive(0, 2);
            } else {
                n_toggle = randomintrangeinclusive(0, 1);
            }
            switch (n_toggle) {
            case 0:
                var_6454115e = array::random(var_bfa27650);
                level thread zombie_gladiator_util::function_69f309b(1, "melee", &function_94f7ef12, 1, var_6454115e, max(25, level.round_number));
                break;
            case 1:
                var_6454115e = array::random(var_bfa27650);
                level thread zombie_gladiator_util::function_69f309b(1, "ranged", &function_94f7ef12, 1, var_6454115e, max(25, level.round_number));
                break;
            case 2:
                for (i = 0; i < 3; i++) {
                    var_6454115e = function_30868c0b(a_s_spawners, "tiger_location");
                    var_1c62893d = getspawnerarray("zombie_spawner_tiger", "targetname")[0];
                    ai = undefined;
                    while (!isdefined(ai)) {
                        ai = zombie_utility::spawn_zombie(var_1c62893d, "boss_filler", var_6454115e, max(25, level.round_number));
                        waitframe(1);
                    }
                    ai function_94f7ef12(var_6454115e);
                    wait(0.5);
                    s_teleport = array::random(struct::get_array("boss_temp_gate_tele", "targetname"));
                    ai forceteleport(s_teleport.origin);
                }
                break;
            default:
                break;
            }
        }
        wait(n_wait_amount);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xbf0ed021, Offset: 0x19630
// Size: 0x216
function function_c84b435() {
    a_s_spawners = struct::get_array("boss_battle_spawns");
    for (i = 0; i < level.var_ced6f061; i++) {
        if (level.ai[#"axis"].size < 24) {
            switch (math::cointoss(33)) {
            case 0:
                var_6454115e = function_30868c0b(a_s_spawners, "gladiator_location");
                var_6454115e = array::random(struct::get_array("boss_temp_gate_tele", "targetname"));
                level thread zombie_gladiator_util::function_69f309b(1, "melee", &function_94f7ef12, 1, var_6454115e, max(25, level.round_number));
                break;
            case 1:
                var_6454115e = array::random(struct::get_array("boss_temp_gate_tele", "targetname"));
                level thread zombie_gladiator_util::function_69f309b(1, "ranged", &function_94f7ef12, 1, var_6454115e, max(25, level.round_number));
                break;
            default:
                break;
            }
        }
        wait(0.5);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xfdebfff1, Offset: 0x19850
// Size: 0xc2
function function_2e309b5c(s_params) {
    e_attacker = s_params.eattacker;
    v_origin = self.origin;
    if (!isplayer(e_attacker)) {
        return;
    }
    if (!zm_powerups::zombie_can_drop_powerups(s_params.weapon)) {
        return;
    }
    level.var_263754a7--;
    if (level.var_263754a7 == 0) {
        zm_powerups::specific_powerup_drop("full_ammo", v_origin, undefined, undefined, undefined, 1);
        level.var_263754a7 = 20;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x5ed53867, Offset: 0x19920
// Size: 0xc
function function_94f7ef12(s_spawnloc) {
    
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x9a98205, Offset: 0x19938
// Size: 0xae
function function_30868c0b(a_s_spawners, str_noteworthy) {
    a_s_spawners = array::randomize(a_s_spawners);
    foreach (s_spawner in a_s_spawners) {
        if (s_spawner.script_noteworthy === str_noteworthy) {
            return s_spawner;
        }
    }
    return a_s_spawners[0];
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x4b39e396, Offset: 0x199f0
// Size: 0x1d0
function function_b3e0a008() {
    level endon(#"hash_12768f75609d32ca", #"end_game");
    exploder::exploder("fxexp_boss_arena_gas_gate_1");
    exploder::exploder("fxexp_boss_arena_gas_gate_2");
    var_4ad6b8c9 = struct::get_array("s_s_r_s_b_b");
    foreach (s_loc in var_4ad6b8c9) {
        s_loc.var_7c5f8ec1 = util::spawn_model("tag_origin", s_loc.origin);
        s_loc.var_7c5f8ec1 thread zm_towers_special_rounds::function_85324f75();
    }
    scene::play("p8_fxanim_zm_towers_boss_arena_gate_raise_bundle", "Shot 1");
    wait(50);
    scene::play("p8_fxanim_zm_towers_boss_arena_gate_raise_bundle", "Shot 2");
    level flag::set(#"hash_353dcb95f778ad73");
    wait(50);
    scene::play("p8_fxanim_zm_towers_boss_arena_gate_raise_bundle", "Shot 3");
    level notify(#"hash_12768f75609d32ca");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x0
// Checksum 0x61297e22, Offset: 0x19bc8
// Size: 0x1e
function function_427d73cb() {
    return level.ai[#"axis"].size;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x99e1e5c5, Offset: 0x19bf0
// Size: 0x8a
function function_f9da4403(s_spawn, phase) {
    self endon(#"death");
    self.ai.phase = phase;
    self forceteleport(s_spawn.origin, s_spawn.angles);
    level.e_elephant = self;
    self.instakill_func = &zm_powerups::function_16c2586a;
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0x2efc9aac, Offset: 0x19c88
// Size: 0x210
function private function_3a3bf6e8() {
    level endon(#"end_game");
    t_spawn = getent("tiger_obelisk_trig", "targetname");
    a_s_entrances = struct::get_array("tiger_boss_obelisk_scene", "targetname");
    while (1) {
        waitresult = undefined;
        waitresult = t_spawn waittill(#"trigger");
        if (!a_s_entrances.size) {
            a_s_entrances = struct::get_array("tiger_boss_obelisk_scene", "targetname");
        }
        array::randomize(a_s_entrances);
        if (isdefined(waitresult.activator) && isdefined(waitresult.activator.archetype) && waitresult.activator.archetype === #"tiger" && !(isdefined(waitresult.activator.b_entered) && waitresult.activator.b_entered)) {
            waitresult.activator.b_entered = 1;
            s_scene = array::pop(a_s_entrances);
            e_gate = getent(s_scene.target, "targetname");
            e_gate thread function_25d93f6e();
            s_scene thread scene::play(waitresult.activator);
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xb9baadfa, Offset: 0x19ea0
// Size: 0xc4
function function_25d93f6e() {
    v_amount = vectorscale(self.script_vector, 1);
    self moveto(self.origin + v_amount, 0.5);
    self playsound(#"hash_75a2099e8df5a448");
    wait(2.5);
    v_amount = vectorscale(self.script_vector, -1);
    self moveto(self.origin + v_amount, 0.5);
    self playsound(#"hash_40e8e3be1a559184");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0xad9b2fa4, Offset: 0x19f70
// Size: 0x136
function private function_13576d14() {
    var_bfd0a84a = getentarray("towers_boss_tower_trigger", "targetname");
    var_6848389e = 0;
    var_a406cb50 = 40;
    foreach (var_e220a902 in var_bfd0a84a) {
        if (!isdefined(var_e220a902.b_exploded) || !var_e220a902.b_exploded) {
            var_e220a902 thread function_33935d5f();
            e_clip = getent(var_e220a902.target, "targetname");
            e_clip disconnectpaths();
        }
        waitframe(1);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x23c8edf, Offset: 0x1a0b0
// Size: 0xc6
function function_9959381() {
    var_bfd0a84a = getentarray("towers_boss_tower_trigger", "targetname");
    foreach (var_e220a902 in var_bfd0a84a) {
        if (isdefined(var_e220a902.var_7475d82e) && var_e220a902.var_7475d82e) {
            var_e220a902 thread function_33935d5f();
            waitframe(1);
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x5 linked
// Checksum 0xa83052a, Offset: 0x1a180
// Size: 0x1cc
function private function_33935d5f() {
    self.b_exploded = 0;
    e_clip = getent(self.target, "targetname");
    while (!self.b_exploded) {
        if (isdefined(self.var_7475d82e) && self.var_7475d82e) {
            shouldexplode = 1;
        } else {
            waitresult = undefined;
            waitresult = self waittill(#"trigger", #"tower_boss_scripted_trigger_tower");
            shouldexplode = isdefined(waitresult.activator) && isdefined(waitresult.activator.archetype) && waitresult.activator.archetype === #"elephant";
        }
        if (shouldexplode || waitresult._notify == "tower_boss_scripted_trigger_tower") {
            e_clip connectpaths();
            waitframe(1);
            e_clip delete();
            fx_tower = struct::get(self.target, "targetname");
            fx_tower scene::play();
            self.b_exploded = 1;
            if (isdefined(self.badplace_name)) {
                badplace_delete(self.badplace_name);
            }
            break;
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x455846ea, Offset: 0x1a358
// Size: 0x192
function function_3d487e02() {
    level endon(#"end_game", #"boss_battle_done");
    self endon(#"disconnect");
    b_success = 0;
    params = getstatuseffect(#"hash_12a64221f4d27f9b");
    weapon = getweapon(#"eq_molotov");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"aoe_damage");
        if (waitresult.var_159100b7 == "zm_aoe_spear" || waitresult.var_159100b7 == "zm_aoe_spear_small" || waitresult.var_159100b7 == "zm_aoe_spear_big") {
            self status_effect::status_effect_apply(params, weapon, undefined, 0, 3000, undefined, waitresult.origin);
            if (!(isdefined(b_success) && b_success)) {
                b_success = self zm_audio::create_and_play_dialog(#"m_quest", #"spear_warn");
            }
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x227e234, Offset: 0x1a4f8
// Size: 0x5c
function function_432247a7() {
    zm_audio::sndannouncerplayvox(#"hash_43b0860b33146764");
    zm_audio::function_bca32e49(#"m_quest", #"fury_start", undefined, 1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xdc36a789, Offset: 0x1a560
// Size: 0x8c
function function_ae1cbf2e() {
    level zm_audio::sndannouncerplayvox(#"hash_c8182d04e7f43c9");
    wait(1);
    level zm_audio::function_bca32e49(#"m_quest", #"fury_arrive");
    wait(1);
    zm_vo::function_7e4562d7(#"hash_1a458ffc30e9306d", undefined, 1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x5a569eaa, Offset: 0x1a5f8
// Size: 0x74
function function_c64fc074() {
    level waittill(#"hash_634700dd42db02d8");
    zm_vo::function_7e4562d7(#"hash_6e1019732c1a9fc4", undefined, 1);
    level thread function_95785950(30, level.var_49328379, #"heart_nag");
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x4b527500, Offset: 0x1a678
// Size: 0x18c
function function_e50623f() {
    wait(1);
    level zm_audio::sndannouncerplayvox(#"hash_77080de04389f4df");
    wait(0.5);
    level zm_audio::function_bca32e49(#"m_quest", #"fury_kill", undefined, 1);
    wait(1);
    zm_vo::function_7e4562d7(#"hash_58fcefd43425141f", undefined, 1);
    wait(2);
    level zm_audio::sndannouncerplayvox(#"hash_1b8dd2e5977116cb", undefined, undefined, 4, 1);
    level notify(#"hash_26a91ce7b67d0e6d");
    level waittill(#"hash_5d826e11ebe4b6e7");
    wait(0.5);
    level zm_audio::sndannouncerplayvox(#"hash_436d318af3fd771f");
    wait(1);
    level zm_audio::function_bca32e49(#"m_quest", #"wrath_arrive", undefined, 1);
    wait(0.5);
    zm_vo::function_7e4562d7(#"hash_44e97ef312e11c41", undefined, 1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x97fb0a71, Offset: 0x1a810
// Size: 0x44
function function_4550c346() {
    level waittill(#"hash_634700dd42db02d8");
    zm_vo::function_7e4562d7(#"hash_256347ab90346d20", undefined, 1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x46de5ced, Offset: 0x1a860
// Size: 0x54
function function_76a7e2d3() {
    level zm_audio::sndannouncerplayvox(#"hash_62c7007e0bc4eab6", undefined, undefined, 0);
    level zm_audio::sndannouncerplayvox(#"hash_62c7007e0bc4eab6", undefined, undefined, 1);
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 4, eflags: 0x1 linked
// Checksum 0xe89355b0, Offset: 0x1a8c0
// Size: 0xc0
function function_95785950(var_c625106d, var_86163b89, var_5e1197bc, var_3ab46b9) {
    level endon(#"end_game", #"boss_battle_done", #"hash_9b33f522f6f1424");
    if (isdefined(var_3ab46b9)) {
        level endon(var_3ab46b9);
    }
    while (1) {
        wait(var_c625106d);
        if (isdefined(var_86163b89) && var_86163b89) {
            continue;
        } else {
            zm_audio::function_bca32e49(#"m_quest", var_5e1197bc);
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 3, eflags: 0x1 linked
// Checksum 0x94fdf90, Offset: 0x1a988
// Size: 0xa8
function function_1a05e10c(str_notify, var_f13787ad, var_ca8a3a53) {
    level endon(#"end_game", #"boss_battle_done");
    if (isai(self)) {
        self endon(#"death");
    }
    b_success = 0;
    while (1) {
        self waittill(str_notify);
        zm_audio::function_bca32e49(var_f13787ad, var_ca8a3a53);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x886c1032, Offset: 0x1aa38
// Size: 0x72
function function_92e1954c() {
    level endon(#"end_game", #"boss_battle_done");
    while (1) {
        level waittill(#"hash_3aa3137f1bf70773");
        level.var_49328379 = 1;
        wait(30);
        level.var_49328379 = 0;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa70d1184, Offset: 0x1aab8
// Size: 0x72
function function_4d682898() {
    level endon(#"end_game", #"boss_battle_done");
    while (1) {
        level waittill(#"basket_hit");
        level.var_8b66546e = 1;
        wait(30);
        level.var_8b66546e = 0;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x1bc91126, Offset: 0x1ab38
// Size: 0xb4
function pause_zombies(b_pause = 0, var_53458a86 = 1) {
    if (b_pause) {
        level.disable_nuke_delay_spawning = 1;
        level flag::clear("spawn_zombies");
        level zm_utility::function_9ad5aeb1(1, 1, 0, var_53458a86);
    } else {
        level.disable_nuke_delay_spawning = 0;
        level flag::set("spawn_zombies");
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xd7ad43f4, Offset: 0x1abf8
// Size: 0x634
function function_a2e1777c() {
    a_t_doors = getentarray("zombie_door", "targetname");
    var_743c00d6 = getentarray("mdl_turn_back", "targetname");
    a_e_doors = arraycombine(a_t_doors, var_743c00d6, 0, 0);
    foreach (e_door in a_e_doors) {
        e_door.var_bdb8b028 = [];
        e_door.var_d7553777 = [];
        a_e_symbols = [];
        a_e_parts = getentarray(e_door.target, "targetname");
        foreach (e_part in a_e_parts) {
            if (e_part.objectid === "symbol_front" || e_part.objectid === "symbol_front_power" || e_part.objectid === "symbol_back" || e_part.objectid === "symbol_back_power") {
                if (!isdefined(a_e_symbols)) {
                    a_e_symbols = [];
                } else if (!isarray(a_e_symbols)) {
                    a_e_symbols = array(a_e_symbols);
                }
                if (!isinarray(a_e_symbols, e_part)) {
                    a_e_symbols[a_e_symbols.size] = e_part;
                }
            }
        }
        a_s_symbols = struct::get_array(e_door.target);
        a_e_symbols = arraycombine(a_e_symbols, a_s_symbols, 0, 0);
        a_e_symbols = arraysortclosest(a_e_symbols, e_door.origin, 2);
        foreach (e_symbol in a_e_symbols) {
            switch (e_symbol.objectid) {
            case #"symbol_front_power":
            case #"symbol_front":
                var_ace72b0e = array(e_symbol.origin, e_symbol.angles);
                if (!isdefined(e_door.var_bdb8b028)) {
                    e_door.var_bdb8b028 = [];
                } else if (!isarray(e_door.var_bdb8b028)) {
                    e_door.var_bdb8b028 = array(e_door.var_bdb8b028);
                }
                e_door.var_bdb8b028[e_door.var_bdb8b028.size] = var_ace72b0e;
                break;
            case #"symbol_back":
            case #"symbol_back_power":
                var_ace72b0e = array(e_symbol.origin, e_symbol.angles);
                if (!isdefined(e_door.var_d7553777)) {
                    e_door.var_d7553777 = [];
                } else if (!isarray(e_door.var_d7553777)) {
                    e_door.var_d7553777 = array(e_door.var_d7553777);
                }
                e_door.var_d7553777[e_door.var_d7553777.size] = var_ace72b0e;
                break;
            }
        }
        var_db8426a8 = e_door.var_b1fb019a;
        if (isdefined(var_db8426a8)) {
            var_91380a90 = getent(var_db8426a8, "targetname");
            var_91380a90.origin = var_91380a90.origin - vectorscale((0, 0, 1), 2048);
            e_door.var_f81e73f7 = var_91380a90;
        } else {
            e_door.var_a7e81bb1 = 1;
            e_door.origin = e_door.origin - vectorscale((0, 0, 1), 2048);
            foreach (s_symbol in a_s_symbols) {
                s_symbol struct::delete();
            }
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x11472795, Offset: 0x1b238
// Size: 0x9c2
function function_41c15ae9(a_str_script_flags) {
    if (!isdefined(a_str_script_flags)) {
        a_str_script_flags = [];
    } else if (!isarray(a_str_script_flags)) {
        a_str_script_flags = array(a_str_script_flags);
    }
    foreach (str_script_flag in a_str_script_flags) {
        a_t_doors = getentarray(str_script_flag, "script_flag");
        foreach (t_door in a_t_doors) {
            if (isdefined(t_door.var_58586c26) && t_door.var_58586c26) {
                continue;
            }
            t_door.var_58586c26 = 1;
            if (isdefined(t_door.var_a7e81bb1) && t_door.var_a7e81bb1) {
                mdl_clip = t_door;
                mdl_clip.origin = mdl_clip.origin + vectorscale((0, 0, 1), 2048);
                mdl_clip.var_521a200d = [];
                var_f2d40d83 = mdl_clip.var_bdb8b028;
                var_5a4087b = mdl_clip.var_d7553777;
                foreach (var_8caa3666 in var_f2d40d83) {
                    v_origin = var_8caa3666[0];
                    v_angles = var_8caa3666[1];
                    var_9e7c3935 = util::spawn_model("p8_zm_power_door_symbol_01", v_origin, v_angles);
                    var_9e7c3935 clientfield::set("power_door_ambient_fx", 1);
                    if (!isdefined(mdl_clip.var_521a200d)) {
                        mdl_clip.var_521a200d = [];
                    } else if (!isarray(mdl_clip.var_521a200d)) {
                        mdl_clip.var_521a200d = array(mdl_clip.var_521a200d);
                    }
                    mdl_clip.var_521a200d[mdl_clip.var_521a200d.size] = var_9e7c3935;
                }
                foreach (var_8caa3666 in var_5a4087b) {
                    v_origin = var_8caa3666[0];
                    v_angles = var_8caa3666[1];
                    var_9e7c3935 = util::spawn_model("p8_zm_power_door_symbol_01", v_origin, v_angles);
                    var_9e7c3935 clientfield::set("power_door_ambient_fx", 1);
                    if (!isdefined(mdl_clip.var_521a200d)) {
                        mdl_clip.var_521a200d = [];
                    } else if (!isarray(mdl_clip.var_521a200d)) {
                        mdl_clip.var_521a200d = array(mdl_clip.var_521a200d);
                    }
                    mdl_clip.var_521a200d[mdl_clip.var_521a200d.size] = var_9e7c3935;
                }
            } else if (!(isdefined(t_door.has_been_opened) && t_door.has_been_opened)) {
                t_door.origin = t_door.origin - vectorscale((0, 0, 1), 2048);
                a_mdl_parts = getentarray(t_door.target, "targetname");
                var_d7c93da1 = [];
                foreach (mdl_part in a_mdl_parts) {
                    switch (mdl_part.objectid) {
                    case #"symbol_back":
                    case #"symbol_front":
                        if (!(isdefined(mdl_part.var_381e124d) && mdl_part.var_381e124d)) {
                            var_d12e791f = util::spawn_model("p8_zm_power_door_symbol_01", mdl_part.origin, mdl_part.angles);
                            var_d12e791f clientfield::set("power_door_ambient_fx", 1);
                            mdl_part clientfield::set("doorbuy_ambient_fx", 0);
                            mdl_part.origin = mdl_part.origin - vectorscale((0, 0, 1), 2048);
                            if (!isdefined(var_d7c93da1)) {
                                var_d7c93da1 = [];
                            } else if (!isarray(var_d7c93da1)) {
                                var_d7c93da1 = array(var_d7c93da1);
                            }
                            var_d7c93da1[var_d7c93da1.size] = var_d12e791f;
                            mdl_part.var_381e124d = 1;
                        }
                        break;
                    }
                }
                t_door.var_521a200d = var_d7c93da1;
            } else {
                t_door.var_f81e73f7.origin = t_door.var_f81e73f7.origin + vectorscale((0, 0, 1), 2048);
                t_door.var_521a200d = [];
                var_f2d40d83 = t_door.var_bdb8b028;
                var_5a4087b = t_door.var_d7553777;
                foreach (var_8caa3666 in var_f2d40d83) {
                    v_origin = var_8caa3666[0];
                    v_angles = var_8caa3666[1];
                    var_9e7c3935 = util::spawn_model("p8_zm_power_door_symbol_01", v_origin, v_angles);
                    var_9e7c3935 clientfield::set("power_door_ambient_fx", 1);
                    if (!isdefined(t_door.var_521a200d)) {
                        t_door.var_521a200d = [];
                    } else if (!isarray(t_door.var_521a200d)) {
                        t_door.var_521a200d = array(t_door.var_521a200d);
                    }
                    t_door.var_521a200d[t_door.var_521a200d.size] = var_9e7c3935;
                }
                foreach (var_8caa3666 in var_5a4087b) {
                    v_origin = var_8caa3666[0];
                    v_angles = var_8caa3666[1];
                    var_9e7c3935 = util::spawn_model("p8_zm_power_door_symbol_01", v_origin, v_angles);
                    var_9e7c3935 clientfield::set("power_door_ambient_fx", 1);
                    if (!isdefined(t_door.var_521a200d)) {
                        t_door.var_521a200d = [];
                    } else if (!isarray(t_door.var_521a200d)) {
                        t_door.var_521a200d = array(t_door.var_521a200d);
                    }
                    t_door.var_521a200d[t_door.var_521a200d.size] = var_9e7c3935;
                }
            }
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xe8f268, Offset: 0x1bc08
// Size: 0x578
function function_1efe04ba(a_str_script_flags) {
    if (!isdefined(a_str_script_flags)) {
        a_str_script_flags = [];
    } else if (!isarray(a_str_script_flags)) {
        a_str_script_flags = array(a_str_script_flags);
    }
    foreach (str_script_flag in a_str_script_flags) {
        a_t_doors = getentarray(str_script_flag, "script_flag");
        foreach (t_door in a_t_doors) {
            if (!(isdefined(t_door.var_58586c26) && t_door.var_58586c26)) {
                continue;
            }
            t_door.var_58586c26 = 0;
            if (isdefined(t_door.var_a7e81bb1) && t_door.var_a7e81bb1) {
                mdl_clip = t_door;
                mdl_clip.origin = mdl_clip.origin - vectorscale((0, 0, 1), 2048);
                var_d7c93da1 = mdl_clip.var_521a200d;
                foreach (var_595eaa96 in var_d7c93da1) {
                    var_595eaa96 clientfield::set("power_door_ambient_fx", 0);
                    var_595eaa96 delete();
                }
            } else if (!(isdefined(t_door.has_been_opened) && t_door.has_been_opened)) {
                t_door.origin = t_door.origin + vectorscale((0, 0, 1), 2048);
                var_d7c93da1 = t_door.var_521a200d;
                foreach (var_595eaa96 in var_d7c93da1) {
                    var_595eaa96 clientfield::set("power_door_ambient_fx", 0);
                    var_595eaa96 delete();
                }
                a_mdl_parts = getentarray(t_door.target, "targetname");
                foreach (mdl_part in a_mdl_parts) {
                    switch (mdl_part.objectid) {
                    case #"symbol_back":
                    case #"symbol_front":
                        if (isdefined(mdl_part.var_381e124d) && mdl_part.var_381e124d) {
                            mdl_part.origin = mdl_part.origin + vectorscale((0, 0, 1), 2048);
                            waitframe(1);
                            mdl_part clientfield::set("doorbuy_ambient_fx", 1);
                            mdl_part.var_381e124d = 0;
                        }
                        break;
                    }
                }
            } else {
                t_door.var_f81e73f7.origin = t_door.var_f81e73f7.origin - vectorscale((0, 0, 1), 2048);
                foreach (var_9e7c3935 in t_door.var_521a200d) {
                    var_9e7c3935 clientfield::set("power_door_ambient_fx", 0);
                    var_9e7c3935 delete();
                }
            }
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xb56424e8, Offset: 0x1c188
// Size: 0x210
function function_b540bcee(var_f69ab3f2, var_2a468a0e = array()) {
    level endon(#"end_game");
    self endon(#"death");
    if (!level flag::get(#"hash_4f293396150d2c00")) {
        return;
    }
    while (1) {
        b_enable = 1;
        foreach (str_zone in var_f69ab3f2) {
            if (self zm_zonemgr::entity_in_zone(str_zone, 0)) {
                foreach (v_exclusion in var_2a468a0e) {
                    e_vol = getent(v_exclusion, "targetname");
                    if (self istouching(e_vol)) {
                        b_enable = 0;
                    }
                }
            } else {
                b_enable = 0;
            }
        }
        if (b_enable) {
            self ai::set_behavior_attribute("tongue_grab_enabled", 1);
        } else {
            self ai::set_behavior_attribute("tongue_grab_enabled", 0);
        }
        wait(0.5);
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xda31f76a, Offset: 0x1c3a0
// Size: 0x136
function function_45ac4bb8(var_bd38f9ad = 1, var_8cb1f65a = 1) {
    if (var_bd38f9ad && isdefined(level.zombie_powerups[#"nuke"])) {
        level.zombie_powerups[#"nuke"].func_should_drop_with_regular_powerups = &function_ff89ee99;
    }
    if (var_8cb1f65a && isdefined(level.zombie_powerups[#"carpenter"])) {
        level.zombie_powerups[#"carpenter"].func_should_drop_with_regular_powerups = &function_ff89ee99;
    }
    if (isdefined(level.zombie_powerups[#"fire_sale"])) {
        level.zombie_powerups[#"fire_sale"].func_should_drop_with_regular_powerups = &function_ff89ee99;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x99bd2381, Offset: 0x1c4e0
// Size: 0x56
function function_ff89ee99() {
    if (level flag::exists(#"hash_4f293396150d2c00") && level flag::get(#"hash_4f293396150d2c00")) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xcce805c2, Offset: 0x1c540
// Size: 0xf6
function function_5904a8e1() {
    if (isdefined(level.zombie_powerups[#"nuke"])) {
        level.zombie_powerups[#"nuke"].func_should_drop_with_regular_powerups = &zm_powerups::func_should_always_drop;
    }
    if (isdefined(level.zombie_powerups[#"fire_sale"])) {
        level.zombie_powerups[#"fire_sale"].func_should_drop_with_regular_powerups = &zm_powerups::func_should_always_drop;
    }
    if (isdefined(level.zombie_powerups[#"carpenter"])) {
        level.zombie_powerups[#"carpenter"].func_should_drop_with_regular_powerups = &zm_powerups::func_should_always_drop;
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x713d391a, Offset: 0x1c640
// Size: 0x108
function function_4802e02e() {
    level endon(#"end_game");
    while (1) {
        level waittill(#"end_of_round");
        var_bf1569b1 = 0;
        var_3a6fab91 = zm_round_spawning::function_f6cd912d(1);
        if (isdefined(var_3a6fab91)) {
            var_f40360e8 = var_3a6fab91.n_round;
            if (isdefined(var_f40360e8) && level.round_number == var_f40360e8) {
                var_bf1569b1 = 1;
            }
        }
        if (var_bf1569b1) {
            level flag::set(#"hash_4fd3d0c01f9b4c30");
        } else {
            level flag::clear(#"hash_4fd3d0c01f9b4c30");
        }
    }
}

// Namespace zm_towers_main_quest/zm_towers_main_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x33fd7540, Offset: 0x1c750
// Size: 0x6
function return_false() {
    return 0;
}


// Atian COD Tools GSC decompiler test
#using script_387eab232fe22983;
#using scripts\zm\ai\zm_ai_nosferatu.gsc;
#using scripts\zm\ai\zm_ai_catalyst.gsc;
#using scripts\zm\zm_mansion.gsc;
#using scripts\zm\zm_mansion_util.gsc;
#using scripts\zm\zm_mansion_special_rounds.gsc;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\abilities\ability_util.gsc;

#namespace mansion_boss_ww;

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x2
// Checksum 0xcb7695cb, Offset: 0x798
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mansion_boss_ww", &__init__, undefined, undefined);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xdaf45cea, Offset: 0x7e0
// Size: 0x84
function __init__() {
    init_flags();
    init_clientfields();
    init_steps();
    function_8dec32e2();
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            level thread function_5d346946();
        }
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x39d84b10, Offset: 0x870
// Size: 0x104
function init_flags() {
    level flag::init(#"hash_493de5832f801947");
    level flag::init(#"boss_fight_started");
    level flag::init(#"hash_f4dfa99c5e22bc6");
    level flag::init(#"hash_67757a8cb27cb8aa");
    level flag::init(#"hash_eed1544f10c5bb3");
    level flag::init(#"hash_5f2b9a36a2c517af");
    level flag::init(#"hash_25d8c88ff3f91ee5");
    level flag::init(#"hash_480ab8b0d38942cc");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xefcaaeaa, Offset: 0x980
// Size: 0x224
function init_clientfields() {
    clientfield::register("world", "" + #"hash_2709d50a7b0a2b01", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_87483ed44cb2791", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_69c1868b7a8a7beb", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_1bf2c2f62ad1bf56", 8000, 1, "int");
    clientfield::register("scriptmover", "bs_sigil_fx", 8000, 3, "int");
    clientfield::register("scriptmover", "" + #"hash_5cca35fc43fa51e6", 8000, 3, "int");
    clientfield::register("scriptmover", "" + #"hash_6ad20bd0d84e8602", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_4ca506515aec02d3", 8000, 1, "int");
    clientfield::register("allplayers", "pstfx_zm_man_targeted_cf", 8000, 1, "int");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x5ba6de63, Offset: 0xbb0
// Size: 0x12c
function init_steps() {
    zm_sq::register(#"zm_mansion_ww", #"step_1", #"hash_5c5b3a59a850616e", &function_5c5680f5, &function_9eb08be3);
    zm_sq::register(#"zm_mansion_ww", #"step_2", #"hash_5c5b3959a8505fbb", &function_df7c8713, &function_1e450b1a);
    zm_sq::register(#"zm_mansion_ww", #"step_3", #"hash_5c5b3859a8505e08", &function_f242ac9f, &function_43f5567a, 1);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x120a53fb, Offset: 0xce8
// Size: 0x2cc
function init_traps() {
    level.var_60ce0a79 = [];
    for (i = 1; i <= 4; i++) {
        var_4ee50cee = struct::get("boss_sigil_" + i, "targetname");
        e_sigil = util::spawn_model(var_4ee50cee.model, var_4ee50cee.origin, var_4ee50cee.angles);
        e_sigil.targetname = var_4ee50cee.targetname;
        e_sigil.var_33fc862a = 0;
        level.var_60ce0a79[i] = e_sigil;
    }
    level.var_b5fff38b = [];
    for (i = 1; i <= 3; i++) {
        s_statue = struct::get("boss_statue_" + i, "targetname");
        e_statue = util::spawn_model(s_statue.model, s_statue.origin, s_statue.angles);
        e_statue.targetname = s_statue.targetname;
        e_statue.var_87fb192a = s_statue.var_87fb192a;
        e_statue.var_bbfcddc6 = i;
        e_statue.var_5f88b76a = 0;
        switch (i) {
        case 1:
            e_statue.var_d707e889 = array(0, 1, 3, 4, 2);
            break;
        case 2:
            e_statue.var_d707e889 = array(0, 2, 1, 3, 4);
            break;
        case 3:
            e_statue.var_d707e889 = array(0, 4, 2, 3, 1);
            break;
        }
        level.var_b5fff38b[i] = e_statue;
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xdd394e2e, Offset: 0xfc0
// Size: 0x87c
function init_boss() {
    level.var_923e8cb4 = struct::get_array("boss_plr_tele_in", "targetname");
    level.s_boss = spawnstruct();
    level.s_boss.var_dcaafc8e = [];
    for (i = 1; i <= 4; i++) {
        level.s_boss.var_dcaafc8e[i] = struct::get("tag_align_export_boss_arena_" + i, "targetname");
    }
    level.s_boss.var_4944ec8 = getent("boss_sp_mdl", "targetname");
    target_set(level.s_boss.var_4944ec8, (0, 0, 64));
    level.s_boss.var_4944ec8.health = 99999;
    level.s_boss.var_4944ec8.var_6f84b820 = #"boss";
    level.s_boss.var_b65df36 = getent("boss_stunned_blocker", "targetname");
    level.s_boss.var_f4aac79b = [];
    n_index = 0;
    str_targetname = "boss_atk_sp_pos_" + n_index;
    s_loc = struct::get(str_targetname, "targetname");
    do {
        s_loc.var_5d259c63 = [];
        var_d88b3814 = 0;
        s_loc_target = struct::get(str_targetname + "_targ_" + var_d88b3814, "targetname");
        do {
            if (!isdefined(s_loc.var_5d259c63)) {
                s_loc.var_5d259c63 = [];
            } else if (!isarray(s_loc.var_5d259c63)) {
                s_loc.var_5d259c63 = array(s_loc.var_5d259c63);
            }
            s_loc.var_5d259c63[s_loc.var_5d259c63.size] = s_loc_target;
            var_d88b3814++;
            s_loc_target = struct::get(str_targetname + "_targ_" + var_d88b3814, "targetname");
        } while (isdefined(s_loc_target));
        if (!isdefined(level.s_boss.var_f4aac79b)) {
            level.s_boss.var_f4aac79b = [];
        } else if (!isarray(level.s_boss.var_f4aac79b)) {
            level.s_boss.var_f4aac79b = array(level.s_boss.var_f4aac79b);
        }
        level.s_boss.var_f4aac79b[level.s_boss.var_f4aac79b.size] = s_loc;
        n_index++;
        str_targetname = "boss_atk_sp_pos_" + n_index;
        s_loc = struct::get(str_targetname, "targetname");
    } while (isdefined(s_loc));
    level.s_boss.var_da2d7834 = [];
    var_186c542d = getent("boss_atk_sp_pos_center", "targetname");
    s_area_def = spawnstruct();
    s_area_def.var_186c542d = var_186c542d;
    s_area_def.var_6f05a409 = array(0, 1, 2, 3);
    if (!isdefined(level.s_boss.var_da2d7834)) {
        level.s_boss.var_da2d7834 = [];
    } else if (!isarray(level.s_boss.var_da2d7834)) {
        level.s_boss.var_da2d7834 = array(level.s_boss.var_da2d7834);
    }
    level.s_boss.var_da2d7834[level.s_boss.var_da2d7834.size] = s_area_def;
    n_index = 0;
    var_186c542d = getent("boss_atk_sp_pos_quad_" + n_index, "targetname");
    do {
        s_area_def = spawnstruct();
        s_area_def.var_186c542d = var_186c542d;
        s_area_def.var_6f05a409 = [];
        if (!isdefined(level.s_boss.var_da2d7834)) {
            level.s_boss.var_da2d7834 = [];
        } else if (!isarray(level.s_boss.var_da2d7834)) {
            level.s_boss.var_da2d7834 = array(level.s_boss.var_da2d7834);
        }
        level.s_boss.var_da2d7834[level.s_boss.var_da2d7834.size] = s_area_def;
        n_index++;
        var_186c542d = getent("boss_atk_sp_pos_quad_" + n_index, "targetname");
    } while (isdefined(var_186c542d));
    n_index = 0;
    for (n_index = 0; n_index < level.s_boss.var_f4aac79b.size; n_index++) {
        var_f7d81ece = level.s_boss.var_f4aac79b[n_index];
        foreach (var_aa39009c in level.s_boss.var_da2d7834) {
            foreach (var_fce1bc14 in var_f7d81ece.var_5d259c63) {
                if (istouching(var_fce1bc14.origin, var_aa39009c.var_186c542d)) {
                    if (!isdefined(var_aa39009c.var_6f05a409)) {
                        var_aa39009c.var_6f05a409 = [];
                    } else if (!isarray(var_aa39009c.var_6f05a409)) {
                        var_aa39009c.var_6f05a409 = array(var_aa39009c.var_6f05a409);
                    }
                    var_aa39009c.var_6f05a409[var_aa39009c.var_6f05a409.size] = n_index;
                    break;
                }
            }
        }
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x1e244e53, Offset: 0x1848
// Size: 0x5e
function init_spawns() {
    var_67c45f02 = struct::get_array("arena_spawns");
    level.var_db1658d1 = array::filter(var_67c45f02, 0, &function_c41d732d, "werewolf_location");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x28fcbf4b, Offset: 0x18b0
// Size: 0x1a4
function function_8dec32e2() {
    zm_transform::function_cfca77a7(zm_ai_catalyst::function_bbb2bab5(1), #"hash_7c89b1397a38e3ad", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_corrosive_spawn_pre_split", "aib_vign_zm_zod_catalyst_corrosive_spawn_post_split");
    zm_transform::function_cfca77a7(zm_ai_catalyst::function_bbb2bab5(4), #"hash_7c89ae397a38de94", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_water_spawn_pre_split", "aib_vign_zm_zod_catalyst_water_spawn_post_split");
    zm_transform::function_cfca77a7(zm_ai_catalyst::function_bbb2bab5(3), #"hash_7c89af397a38e047", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_electric_spawn_pre_split", "aib_vign_zm_zod_catalyst_electric_spawn_post_split");
    zm_transform::function_cfca77a7(zm_ai_catalyst::function_bbb2bab5(2), #"hash_7c89ac397a38db2e", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_plasma_spawn_pre_split", "aib_vign_zm_zod_catalyst_plasma_spawn_post_split");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x5d32f3ed, Offset: 0x1a60
// Size: 0x3d4
function function_5c5680f5(var_5ea5c94d) {
    level endon(#"end_game", #"intermission");
    level flag::clear("spawn_zombies");
    level flag::clear("zombie_drop_powerups");
    level flag::set(#"disable_fast_travel");
    level flag::set("pause_round_timeout");
    level flag::set(#"boss_fight_started");
    zm_zonemgr::enable_zone("zone_arena");
    level zm_bgb_anywhere_but_here::function_886fce8f(0);
    if (!(isdefined(level.var_ef54ff59) && level.var_ef54ff59)) {
        level.var_ef54ff59 = 1;
        init_traps();
        init_boss();
        init_spawns();
    }
    callback::on_spawned(&function_92a12286);
    level.var_eeb98313 = &function_714f8756;
    level.custom_spawnplayer = &function_9bc4f8cb;
    level.disable_nuke_delay_spawning = 1;
    level notify(#"disable_nuke_delay_spawning");
    level.var_d6f059f7 = max(level.round_number, 20);
    zm_transform::function_e95ec8df();
    level.var_c9f5947d = 1;
    level notify(#"force_transformations");
    level function_ae76e58d();
    level thread function_482a7a01();
    level.var_b106cd7a = &function_de5e2c78;
    level.var_7e40409b = &function_83275bc3;
    clientfield::set("" + #"hash_2709d50a7b0a2b01", 1);
    level thread scene::init_streamer(#"aib_t8_zm_mnsn_hallion_intro", #"allies", 0, 0);
    level boss_teleport_players(1);
    a_players = util::get_active_players();
    foreach (player in a_players) {
        player thread function_92a12286();
    }
    if (!var_5ea5c94d) {
        boss_intro(1);
        level function_bb612e31(1, 16000);
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x1 linked
// Checksum 0xda7455c7, Offset: 0x1e40
// Size: 0x34
function function_9eb08be3(var_5ea5c94d, ended_early) {
    if (!var_5ea5c94d) {
        boss_outro(1);
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x9c5018bc, Offset: 0x1e80
// Size: 0x5c
function function_df7c8713(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level thread function_482a7a01();
        boss_intro(2);
        level function_bb612e31(2);
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x1 linked
// Checksum 0x1ae89bd, Offset: 0x1ee8
// Size: 0x34
function function_1e450b1a(var_5ea5c94d, ended_early) {
    if (!var_5ea5c94d) {
        boss_outro(2);
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x192062ba, Offset: 0x1f28
// Size: 0x64
function function_f242ac9f(var_5ea5c94d) {
    if (!var_5ea5c94d) {
        level thread function_482a7a01();
        boss_intro(3);
        level function_bb612e31(3, 20000);
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x1 linked
// Checksum 0x1eb3845f, Offset: 0x1f98
// Size: 0x19e
function function_43f5567a(var_5ea5c94d, ended_early) {
    level flag::set(#"hash_25d8c88ff3f91ee5");
    music::setmusicstate("none");
    level.musicsystemoverride = 0;
    if (!var_5ea5c94d) {
        boss_outro(3);
    }
    callback::remove_on_spawned(&function_92a12286);
    level function_50aa79cf();
    level flag::set("spawn_zombies");
    level flag::set("zombie_drop_powerups");
    level flag::clear(#"disable_fast_travel");
    level flag::clear("pause_round_timeout");
    level zm_bgb_anywhere_but_here::function_886fce8f(0);
    level.var_eeb98313 = undefined;
    level.custom_spawnplayer = undefined;
    level.disable_nuke_delay_spawning = 0;
    level.var_b106cd7a = &zm_mansion_special_rounds::function_50ec1ddf;
    level.var_7e40409b = &zombie_werewolf_util::function_774f6e70;
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x816d5b94, Offset: 0x2140
// Size: 0x1a8
function function_92a12286() {
    self notify("6d0604ca8ddb9571");
    self endon("6d0604ca8ddb9571");
    level endon(#"intermission", #"game_end");
    self endon(#"death");
    while (true) {
        var_4935908f = 0;
        foreach (s_area in level.s_boss.var_da2d7834) {
            if (self istouching(s_area.var_186c542d)) {
                var_4935908f = 1;
                break;
            }
        }
        if (!var_4935908f) {
            s_loc = level.var_923e8cb4[self.playernum];
            if (!isdefined(s_loc)) {
                s_loc = struct::get_array("boss_plr_tele_in", "targetname")[0];
            }
            self dontinterpolate();
            self setorigin(s_loc.origin);
        }
        util::wait_network_frame(10);
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xa8efb057, Offset: 0x22f0
// Size: 0x34
function function_9bc4f8cb() {
    self.spectator_respawn = level.var_923e8cb4[self.playernum];
    self zm_player::spectator_respawn();
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x9071d03a, Offset: 0x2330
// Size: 0x16
function function_714f8756(a_s_valid_respawn_points) {
    return level.var_923e8cb4;
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x9b9c484b, Offset: 0x2350
// Size: 0x74
function boss_intro(n_stage) {
    level.s_boss thread function_1e93034e();
    level function_732f7da0();
    /#
        iprintlnbold("pounce" + n_stage + "rocketlauncher");
    #/
    wait(2);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x71b848aa, Offset: 0x23d0
// Size: 0x224
function boss_outro(n_stage) {
    /#
        iprintlnbold("pounce" + n_stage + "<unknown string>");
    #/
    level thread function_e0b1cf29();
    switch (n_stage) {
    case 1:
        level thread function_4048d512();
        level waittill(#"hash_54f2e7b4cb8826a");
        break;
    case 2:
        var_45e1b44b = level.s_boss.var_dcaafc8e[3];
        var_45e1b44b thread scene::play(#"aib_t8_zm_mnsn_hallion_stage_trans_02");
        var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_visible");
        var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_invisible");
        var_45e1b44b.scene_ents[#"fakeactor 1"] function_d84758c();
        break;
    case 3:
        level.s_boss.var_4944ec8 animation::stop(0);
        level.s_boss.var_4944ec8 scene::play(#"aib_t8_zm_mnsn_hallion_death");
        break;
    }
    wait(5);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x9a4be6d2, Offset: 0x2600
// Size: 0x84
function function_4048d512() {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    wait(1);
    level thread mansion_util::function_2057ddc1(undefined, "werewolf", "invisible", undefined, #"werewolf_invisible", 10, 1);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x702776d1, Offset: 0x2690
// Size: 0x3c
function function_50aa79cf() {
    level flag::wait_till(#"hash_480ab8b0d38942cc");
    level zm_mansion::play_outro_igc();
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xf5277536, Offset: 0x26d8
// Size: 0x84
function function_482a7a01() {
    self notify("4881ce4ca6e3dea5");
    self endon("4881ce4ca6e3dea5");
    level waittill(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    zm_transform::function_e95ec8df();
    zm_utility::function_9ad5aeb1(0, 1, 0, 0);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x79f737b, Offset: 0x2768
// Size: 0x6e
function function_732f7da0() {
    if (!isdefined(level.var_f3c4bd00)) {
        level.var_f3c4bd00 = zm_utility::get_number_of_valid_players();
        return;
    }
    if (level.var_f3c4bd00 < zm_utility::get_number_of_valid_players()) {
        level.var_f3c4bd00 = zm_utility::get_number_of_valid_players();
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0xb7325225, Offset: 0x27e0
// Size: 0x3b0
function boss_teleport_players(var_a88dacea) {
    level endon(#"end_game", #"intermission");
    if (var_a88dacea) {
        str_loc = "boss_plr_tele_in";
        var_79bdd0d5 = 1;
    } else {
        str_loc = "boss_plr_tele_out";
        var_79bdd0d5 = 0;
    }
    a_s_locs = struct::get_array(str_loc, "targetname");
    a_s_locs = array::sort_by_script_int(a_s_locs, 1);
    a_players = util::get_active_players();
    foreach (player in a_players) {
        if (isdefined(player) && isdefined(player.playernum)) {
            s_loc = a_s_locs[player.playernum];
            if (!isdefined(s_loc)) {
                s_loc = a_s_locs[0];
            }
            player thread function_528abede(s_loc, var_79bdd0d5);
        }
    }
    zm_utility::function_9ad5aeb1(0, 1, 0, 0);
    if (var_a88dacea) {
        level zm_vo::function_3c173d37();
        level zm_audio::sndvoxoverride(1);
        wait(1.3);
        level util::delay(5.9, undefined, &function_ceb48615);
        var_45e1b44b = level.s_boss.var_dcaafc8e[3];
        var_45e1b44b thread scene::play(#"aib_t8_zm_mnsn_hallion_intro");
        level thread function_52818528();
        level notify(#"hash_4b195fabca6f5aaf");
        util::wait_network_frame();
        var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_visible");
        var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_invisible");
        var_45e1b44b.scene_ents[#"fakeactor 1"] function_d84758c();
        wait(0.2);
        level notify(#"hash_1b248026aeb05066");
        level.var_b88cf121 = 1;
        level zm_audio::sndvoxoverride(0);
        return;
    }
    wait(2.6);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x424a0974, Offset: 0x2b98
// Size: 0x2c
function function_ceb48615() {
    level.musicsystemoverride = 1;
    music::setmusicstate("boss");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xde52bfd1, Offset: 0x2bd0
// Size: 0x184
function function_52818528() {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    a_e_players = util::get_active_players();
    foreach (e_player in a_e_players) {
        e_player stopsounds();
    }
    n_wait = scene::function_12479eba(#"aib_t8_zm_mnsn_hallion_intro") + 0.5;
    wait(n_wait);
    mansion_util::function_2057ddc1(undefined, "werewolf", "intro", undefined, #"werewolf_intro", 10, 1, 0, 1);
    wait(1);
    mansion_util::function_2057ddc1(undefined, "druid_arena", "enter", undefined, #"hash_6ffba77e7b683b46", 10, 1);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x1 linked
// Checksum 0xd91fcf32, Offset: 0x2d60
// Size: 0x1f2
function function_528abede(s_loc, var_79bdd0d5) {
    level endon(#"intermission", #"end_game");
    self endon(#"disconnect", #"death");
    self.dontspeak = 1;
    self lui::screen_fade_out(1);
    if (zm_utility::is_player_valid(self, 0, 0) && isdefined(s_loc)) {
        self setorigin(s_loc.origin);
        self setplayerangles(s_loc.angles);
    }
    if (var_79bdd0d5) {
        self val::set("bossfight_intro", "freezecontrols", 1);
        self val::set("bossfight_intro", "disable_weapons", 1);
        level waittill(#"hash_4b195fabca6f5aaf");
        self thread lui::screen_fade_in(0.1);
        level waittill(#"hash_1b248026aeb05066");
        self val::reset("bossfight_intro", "freezecontrols");
        self val::reset("bossfight_intro", "disable_weapons");
    } else {
        wait(1.5);
    }
    self.dontspeak = 0;
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x1 linked
// Checksum 0xe4ffe420, Offset: 0x2f60
// Size: 0xe0
function function_f74b38da(str_rumble, var_b5291261 = 0) {
    if (var_b5291261) {
        a_e_players = util::get_active_players();
    } else {
        a_e_players = arraycopy(level.players);
    }
    foreach (e_player in a_e_players) {
        e_player playrumbleonentity(str_rumble);
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x1 linked
// Checksum 0x34a7a374, Offset: 0x3048
// Size: 0x24
function function_c41d732d(val, arg) {
    return val.script_noteworthy === arg;
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x76a59ba0, Offset: 0x3078
// Size: 0x1d6
function function_1e93034e() {
    if (!isdefined(self.var_29b322f2)) {
        self.var_29b322f2 = [];
    } else {
        self function_141c7d46();
    }
    var_43a9d923 = struct::get("bs_pup_fa", "targetname");
    var_906d3e2a = zm_powerups::specific_powerup_drop("full_ammo", var_43a9d923.origin, undefined, undefined, undefined, 1);
    if (!isdefined(self.var_29b322f2)) {
        self.var_29b322f2 = [];
    } else if (!isarray(self.var_29b322f2)) {
        self.var_29b322f2 = array(self.var_29b322f2);
    }
    self.var_29b322f2[self.var_29b322f2.size] = var_906d3e2a;
    var_78a8b445 = struct::get("bs_pup_crpn", "targetname");
    e_carpenter = zm_powerups::specific_powerup_drop("carpenter", var_78a8b445.origin, undefined, undefined, undefined, 1);
    if (!isdefined(self.var_29b322f2)) {
        self.var_29b322f2 = [];
    } else if (!isarray(self.var_29b322f2)) {
        self.var_29b322f2 = array(self.var_29b322f2);
    }
    self.var_29b322f2[self.var_29b322f2.size] = e_carpenter;
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xb2ed0c36, Offset: 0x3258
// Size: 0x80
function function_141c7d46() {
    foreach (e_powerup in self.var_29b322f2) {
        if (isdefined(e_powerup)) {
            e_powerup delete();
        }
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xe725c44b, Offset: 0x32e0
// Size: 0xc4
function function_a676dbd7() {
    level endon(#"end_game", #"intermission");
    if (zm_utility::is_player_valid(self, 1, 0, 0)) {
        return self;
    }
    do {
        util::wait_network_frame();
        a_e_players = util::get_active_players();
        e_target = array::random(a_e_players);
        if (zm_utility::is_player_valid(e_target, 1, 0, 0)) {
            return e_target;
        }
    } while (true);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x1 linked
// Checksum 0xbc744c8a, Offset: 0x33b0
// Size: 0x20c
function function_bb612e31(n_stage, var_c962047c) {
    level thread function_2b6b4a44();
    if (n_stage == 2) {
        var_82b2ec02 = 1;
    } else {
        var_82b2ec02 = 0;
    }
    level thread function_e0b1cf29(var_82b2ec02);
    var_2aaf6cdb = 0.5;
    a_players = util::get_active_players();
    foreach (player in a_players) {
        var_2aaf6cdb += 0.52;
    }
    if (isdefined(var_c962047c)) {
        var_2aaf6cdb = 0.5;
        a_players = util::get_active_players();
        foreach (player in a_players) {
            var_2aaf6cdb += 0.52;
        }
        if (var_c962047c > 0) {
            level.s_boss.var_c962047c = var_2aaf6cdb * var_c962047c;
        } else {
            level.s_boss.var_c962047c = -1;
        }
    }
    level thread function_542eeaa7(n_stage);
    level waittill(#"hash_38f29f9cb03586ea");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x7e6d316b, Offset: 0x35c8
// Size: 0x10a
function function_542eeaa7(n_stage) {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    level.s_boss.var_57badb98 = 0;
    level.s_boss.var_2d102ea7 = undefined;
    level.var_38fff406 = 0;
    level.var_1821f542 = 0;
    switch (n_stage) {
    case 1:
        self function_69c3faf8();
        break;
    case 2:
        self function_14c34456();
        break;
    case 3:
        self function_a2550f93();
        break;
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x8622a554, Offset: 0x36e0
// Size: 0x8c
function function_69c3faf8() {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    level thread function_de60e752();
    level flag::set(#"hash_eed1544f10c5bb3");
    level function_738f7574(1);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xc8fdff3c, Offset: 0x3778
// Size: 0xa4
function function_14c34456() {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    level thread function_677a2503(0);
    level thread function_de60e752();
    level thread function_e9cc6379(20, 1);
    level function_738f7574(2);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x8d076473, Offset: 0x3828
// Size: 0xcc
function function_a2550f93() {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    level flag::set(#"hash_eed1544f10c5bb3");
    level flag::clear(#"hash_493de5832f801947");
    level thread function_de60e752();
    level thread function_e9cc6379(40, 2);
    level function_738f7574(3);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x4cc20a24, Offset: 0x3900
// Size: 0x100
function function_d84758c() {
    self notify("6326a098e3388d96");
    self endon("6326a098e3388d96");
    level endon(#"intermission", #"game_end");
    self endon(#"death");
    if (isdefined(self.str_current_anim)) {
        n_anim_length = getanimlength(self.str_current_anim);
    } else if (isdefined(self._scene_object) && isdefined(self._scene_object._str_current_anim)) {
        n_anim_length = getanimlength(self._scene_object._str_current_anim);
    }
    if (!isdefined(n_anim_length)) {
        n_anim_length = 30;
    }
    level waittilltimeout(n_anim_length, #"hash_44a9443b3165c556");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x65c5be12, Offset: 0x3a08
// Size: 0x258
function function_738f7574(n_stage) {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    var_3b12bc77 = 1;
    var_de4b911c = 0;
    switch (n_stage) {
    case 2:
        var_3b12bc77 = 0;
        var_de4b911c = 1;
        n_cycles = 0;
        break;
    case 3:
        var_de4b911c = 1;
        break;
    }
    while (true) {
        if (var_3b12bc77) {
            level thread function_f433c7f5(n_stage);
            level waittill(#"hash_3d52ec26acedf741");
        }
        if (var_de4b911c) {
            if (level flag::get(#"hash_f4dfa99c5e22bc6")) {
                level thread function_fdd04f47(n_stage);
                level waittill(#"hash_3d52ec26acedf741");
            } else if (!var_3b12bc77) {
                level waittill(#"hash_f4dfa99c5e22bc6");
                level thread function_fdd04f47(n_stage);
                level waittill(#"hash_3d52ec26acedf741");
            }
        }
        if (isdefined(n_cycles)) {
            while (!level flag::get(#"hash_67757a8cb27cb8aa") || level.var_1821f542 > 0) {
                util::wait_network_frame(2);
            }
            n_cycles++;
            if (n_cycles >= 2) {
                level notify(#"hash_38f29f9cb03586ea");
            }
        }
        level flag::clear(#"hash_67757a8cb27cb8aa");
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x3361f814, Offset: 0x3c68
// Size: 0xd80
function function_f433c7f5(n_stage) {
    level endon(#"hash_4be216e72d412c40", #"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    switch (n_stage) {
    case 1:
        var_e83953b7 = 1;
        break;
    case 3:
        var_e83953b7 = 3;
        break;
    }
    if (level flag::get(#"hash_eed1544f10c5bb3")) {
        level function_e0b1cf29();
        level thread function_47e0a10b(n_stage);
    }
    a_players = util::get_active_players();
    e_target = array::random(a_players);
    var_6df65756 = 1;
    for (i = -1; i < var_e83953b7; i++) {
        wait(1);
        e_target = level function_a676dbd7();
        var_2f36c41d = array::randomize(level.s_boss.var_da2d7834);
        foreach (var_aa39009c in var_2f36c41d) {
            if (e_target istouching(var_aa39009c.var_186c542d)) {
                var_ec5e7149 = var_aa39009c;
                break;
            }
        }
        n_index = 0;
        var_52eca4bf = var_aa39009c.var_6f05a409[n_index];
        var_efc198c = var_aa39009c.var_6f05a409[n_index] + 1;
        var_f26f9e5a = level.s_boss.var_f4aac79b[var_52eca4bf];
        var_c43c78f9 = var_f26f9e5a.var_5d259c63[n_index];
        n_dist_sq = distance2dsquared(e_target.origin, var_c43c78f9.origin);
        for (n_index = 0; n_index < var_aa39009c.var_6f05a409.size; n_index++) {
            s_start_loc = level.s_boss.var_f4aac79b[var_aa39009c.var_6f05a409[n_index]];
            foreach (s_target_loc in s_start_loc.var_5d259c63) {
                var_b8613ef4 = distance2dsquared(e_target.origin, s_target_loc.origin);
                if (var_b8613ef4 < n_dist_sq) {
                    var_efc198c = var_aa39009c.var_6f05a409[n_index] + 1;
                    n_dist_sq = var_b8613ef4;
                    var_f26f9e5a = s_start_loc;
                    var_c43c78f9 = s_target_loc;
                }
            }
        }
        var_45e1b44b = level.s_boss.var_dcaafc8e[var_efc198c];
        e_target = e_target function_a676dbd7();
        e_target clientfield::set("pstfx_zm_man_targeted_cf", 1);
        e_target thread function_7bcf3048();
        if (var_6df65756) {
            var_6df65756 = 0;
            var_45e1b44b thread scene::play(#"hash_44e932e9dc79e15a" + var_efc198c);
            util::wait_network_frame();
            var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_visible");
            var_45e1b44b.scene_ents[#"fakeactor 1"] function_d84758c();
            var_45e1b44b thread scene::play(#"hash_94e18f7f5f5b927" + var_efc198c);
            util::wait_network_frame();
            var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_invisible");
            var_45e1b44b.scene_ents[#"fakeactor 1"] function_d84758c();
            wait(1);
            e_target = e_target function_a676dbd7();
            e_target clientfield::set("pstfx_zm_man_targeted_cf", 0);
            continue;
        } else {
            var_45e1b44b thread scene::play(#"hash_7650e56337eed7be" + var_efc198c);
            util::wait_network_frame();
            var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_visible");
            var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_invisible");
            var_45e1b44b.scene_ents[#"fakeactor 1"] function_d84758c();
            e_target = e_target function_a676dbd7();
            e_target clientfield::set("pstfx_zm_man_targeted_cf", 0);
        }
        foreach (s_target_loc in var_f26f9e5a.var_5d259c63) {
            e_target = e_target function_a676dbd7();
            var_b8613ef4 = distance2dsquared(e_target.origin, s_target_loc.origin);
            if (var_b8613ef4 < n_dist_sq) {
                n_dist_sq = var_b8613ef4;
                var_c43c78f9 = s_target_loc;
            }
        }
        var_2839690f = strtok(var_c43c78f9.targetname, "_");
        switch (var_efc198c) {
        case 1:
            var_51e58a97 = 2;
            var_6bbd958f = "2";
            if (int(var_2839690f[6]) < 4) {
                var_6bbd958f += "_l";
            }
            break;
        case 2:
            var_51e58a97 = 1;
            var_6bbd958f = "1";
            if (int(var_2839690f[6]) < 5) {
                var_6bbd958f += "_l";
            }
            break;
        case 3:
            var_51e58a97 = 4;
            var_6bbd958f = "4";
            if (int(var_2839690f[6]) < 5) {
                var_6bbd958f += "_l";
            }
            break;
        case 4:
            var_51e58a97 = 3;
            var_6bbd958f = "3";
            if (int(var_2839690f[6]) < 4) {
                var_6bbd958f += "_l";
            }
            break;
        }
        var_b3160934 = #"hash_44e932e9dc79e15a" + var_6bbd958f;
        var_23ee4083 = vectortoangles(var_c43c78f9.origin - var_f26f9e5a.origin);
        level.s_boss.var_4944ec8.origin = var_f26f9e5a.origin;
        level.s_boss.var_4944ec8.angles = var_23ee4083;
        level.s_boss.var_4944ec8 thread scene::play(#"aib_t8_zm_mnsn_hallion_quad_run", level.s_boss.var_4944ec8);
        level.s_boss.var_4944ec8 thread function_c1b6e914();
        level.s_boss.var_4944ec8 thread function_cc0b32f8(n_stage);
        wait(2.8);
        level.s_boss.var_4944ec8 animation::stop(0);
        level.s_boss.var_4944ec8.origin = (0, 0, 0);
        var_45e1b44b = level.s_boss.var_dcaafc8e[var_51e58a97];
        wait(0.3);
        var_45e1b44b thread scene::play(var_b3160934);
        util::wait_network_frame();
        var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_visible");
        var_45e1b44b.scene_ents[#"fakeactor 1"] function_d84758c();
        var_45e1b44b thread scene::play(#"hash_37e4811f1b6881d1" + var_6bbd958f);
        util::wait_network_frame();
        var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_invisible");
        var_45e1b44b.scene_ents[#"fakeactor 1"] function_d84758c();
        if (i < var_e83953b7) {
            wait(0.5);
        }
        if (level flag::get(#"hash_eed1544f10c5bb3")) {
            if (!level flag::get(#"hash_493de5832f801947") && n_stage == 3) {
                level thread function_aace34f9();
            }
            level function_e0b1cf29();
            level thread function_47e0a10b(n_stage);
        }
    }
    wait(2);
    level notify(#"hash_3d52ec26acedf741");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x289bafb2, Offset: 0x49f0
// Size: 0x94
function function_7bcf3048() {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    self endon(#"death");
    mansion_util::function_2057ddc1(self.origin, "werewolf", "pounce", undefined, #"hash_2dfc1e25d3d3c68b", 10, 1);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xf95ae58d, Offset: 0x4a90
// Size: 0x368
function function_c1b6e914() {
    level endon(#"hash_4be216e72d412c40", #"hash_3d52ec26acedf741", #"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    self endon(#"death");
    while (true) {
        zombies = getaiteamarray(level.zombie_team);
        a_players = util::get_active_players();
        ents = arraycombine(a_players, zombies, 0, 0);
        ents = arraysortclosest(ents, self.origin, undefined, 0, 100);
        foreach (ent in ents) {
            if (isplayer(ent) && distance2dsquared(ent.origin, self.origin) < 6400) {
                if (!zombie_utility::is_player_valid(ent, 0, 0) || isdefined(ent.var_b1663467) && ent.var_b1663467) {
                    continue;
                }
                ent thread function_367de434();
                if (!ent issliding()) {
                    ent thread function_8b4d2b91(self.origin);
                }
                ent dodamage(125, self.origin, self, self, "none");
                continue;
            }
            if (isai(ent) && isdefined(ent.var_6f84b820)) {
                if (ent.var_6f84b820 == #"basic") {
                    ent thread zombie_utility::setup_zombie_knockdown(self);
                    continue;
                }
                if (ent.var_6f84b820 == #"popcorn") {
                    ent dodamage(ent.health + 100, ent.origin);
                    continue;
                }
                ent thread ai::stun();
            }
        }
        util::wait_network_frame();
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0xe2163f06, Offset: 0x4e00
// Size: 0xac
function function_8b4d2b91(var_51f9283c) {
    v_dir = self.origin - var_51f9283c;
    v_dir = (v_dir[0], v_dir[1], 0.05);
    v_dir = vectornormalize(v_dir);
    n_push_strength = 750;
    v_player_velocity = self getvelocity();
    self setvelocity(v_player_velocity + v_dir * n_push_strength);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xda5c800e, Offset: 0x4eb8
// Size: 0x3a
function function_367de434() {
    self endon(#"death");
    self.var_b1663467 = 1;
    wait(2);
    self.var_b1663467 = 0;
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x73be93d3, Offset: 0x4f00
// Size: 0x2dc
function function_cc0b32f8(n_stage) {
    level endon(#"hash_3d52ec26acedf741", #"end_game", #"intermission");
    level waittill(#"boss_captured");
    level notify(#"hash_4be216e72d412c40");
    switch (n_stage) {
    case 1:
        level.s_boss.var_4944ec8 thread function_4f8d9d17();
        break;
    case 3:
        level.s_boss.var_4944ec8 thread function_13552544();
        break;
    }
    level thread function_3aa2bc7a(level.s_boss.var_4944ec8.origin);
    if (n_stage == 1) {
        var_bfa47c6b = 12;
    } else {
        var_bfa47c6b = 10;
    }
    level.s_boss.var_4944ec8 animation::stop(0);
    level.s_boss.var_4944ec8 thread function_8d29523e(#"boss_visible");
    util::wait_network_frame();
    level.s_boss.var_4944ec8 thread scene::play(#"aib_t8_zm_mnsn_hallion_stun", "init");
    level.s_boss.var_4944ec8 clientfield::set("" + #"hash_1bf2c2f62ad1bf56", 1);
    level.s_boss thread function_bb528a4b(n_stage);
    s_result = level waittilltimeout(var_bfa47c6b, #"hash_38f29f9cb03586ea");
    var_2100633b = 1;
    if (s_result._notify == #"timeout") {
        var_2100633b = 0;
    }
    level.s_boss.var_4944ec8 thread function_1a240284(n_stage, var_2100633b);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x570d8109, Offset: 0x51e8
// Size: 0x8c
function function_4f8d9d17() {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    self endon(#"death");
    mansion_util::function_2057ddc1(self.origin, "werewolf", "invisible_time_00", undefined, #"werewolf_visible");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xba4d3731, Offset: 0x5280
// Size: 0x7c
function function_13552544() {
    level endon(#"hash_38f29f9cb03586ea", #"intermission");
    self endon(#"death");
    mansion_util::function_2057ddc1(self.origin, "werewolf", "trapped", undefined, #"werewolf_trapped");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0xce72e5e6, Offset: 0x5308
// Size: 0x2fc
function function_3aa2bc7a(v_blast_origin) {
    level endon(#"hash_3d52ec26acedf741", #"end_game", #"intermission");
    a_players = util::get_active_players();
    a_players = arraysortclosest(a_players, v_blast_origin, undefined, 0, 200);
    foreach (player in a_players) {
        if (isdefined(player)) {
            player thread function_8b4d2b91(v_blast_origin);
        }
    }
    for (i = 0; i < 2; i++) {
        var_8444d37d = getaiteamarray(level.zombie_team);
        var_8444d37d = arraysortclosest(var_8444d37d, v_blast_origin, undefined, 0, 200);
        foreach (ai in var_8444d37d) {
            if (isalive(ai) && !(isdefined(ai.var_d45ca662) && ai.var_d45ca662) && !(isdefined(ai.marked_for_death) && ai.marked_for_death)) {
                if (zm_utility::is_magic_bullet_shield_enabled(ai)) {
                    ai util::stop_magic_bullet_shield();
                }
                ai.allowdeath = 1;
                ai.no_powerups = 1;
                ai.deathpoints_already_given = 1;
                ai.marked_for_death = 1;
                ai dodamage(ai.health + 666, ai.origin);
            }
        }
        util::wait_network_frame();
    }
    function_f25a51e4(1, v_blast_origin);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x1 linked
// Checksum 0x20421d57, Offset: 0x5610
// Size: 0xc6
function function_f25a51e4(b_captured, v_origin) {
    if (b_captured) {
        level.s_boss.var_b65df36.origin = v_origin;
        level.s_boss.var_b65df36 disconnectpaths();
        return;
    }
    level.s_boss.var_b65df36 connectpaths();
    level.s_boss.var_b65df36.origin -= (0, 0, 9999);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x1 linked
// Checksum 0xee02a667, Offset: 0x56e0
// Size: 0x238
function function_1a240284(n_stage, var_2100633b) {
    level notify(#"hash_4b8c10279da88562");
    self animation::stop(0);
    self playsound(#"hash_4aff74c5f6036730");
    self.scene_ents[#"boss_sp_mdl"] clientfield::set("" + #"hash_1bf2c2f62ad1bf56", 0);
    if (var_2100633b) {
        switch (n_stage) {
        case 1:
            str_scene = "stage1_trans";
            break;
        case 3:
            return;
        }
        self scene::play(#"aib_t8_zm_mnsn_hallion_stun", str_scene);
    } else {
        self scene::play(#"aib_t8_zm_mnsn_hallion_stun", "timeout");
    }
    self.scene_ents[#"boss_sp_mdl"] thread function_8d29523e(#"boss_invisible");
    self animation::stop(0);
    self scene::play(#"aib_t8_zm_mnsn_hallion_stun", "Shot 2");
    self animation::stop(0);
    util::wait_network_frame();
    self.origin = (0, 0, 0);
    function_f25a51e4(0);
    level notify(#"hash_3d52ec26acedf741");
    if (var_2100633b) {
        level notify(#"hash_54f2e7b4cb8826a");
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0xdfb34ab8, Offset: 0x5920
// Size: 0x6cc
function function_bb528a4b(n_stage) {
    level endon(#"hash_38f29f9cb03586ea", #"hash_4b8c10279da88562", #"end_game", #"intermission");
    self notify("4ed57c747ef9c835");
    self endon("4ed57c747ef9c835");
    e_damage = self.var_4944ec8;
    e_damage endon(#"death");
    e_damage val::set("boss", "takedamage", 1);
    e_damage.health = 99999;
    var_2721aeff = 0;
    self.var_18acfe18 = 0;
    self.var_35eb7b2a = gettime() + 1000;
    self.var_a58d72c0 = 0;
    while (true) {
        var_17c6835 = 0;
        s_notify = e_damage waittill(#"damage");
        n_damage = s_notify.amount;
        w_weapon = s_notify.weapon;
        e_inflictor = s_notify.inflictor;
        if (!isdefined(w_weapon) || !isdefined(e_inflictor)) {
            continue;
        }
        if (w_weapon.weapclass === "rocketlauncher") {
            n_damage *= 0.15;
            var_17c6835 = 1;
        }
        if (!var_17c6835) {
            if (ability_util::is_hero_weapon(w_weapon)) {
                n_damage *= 0.1;
                var_17c6835 = 1;
            }
        }
        if (!var_17c6835) {
            var_26943d66 = e_damage gettagorigin("tag_chest_ws");
            if (isdefined(var_26943d66)) {
                if (distancesquared(s_notify.position, var_26943d66) <= 324) {
                    var_17c6835 = 1;
                }
            }
        }
        if (!var_17c6835) {
            v_back = e_damage gettagorigin("tag_back_ws");
            if (isdefined(v_back)) {
                if (distancesquared(s_notify.position, v_back) <= 256) {
                    var_17c6835 = 1;
                }
            }
        }
        if (isdefined(w_weapon) && zm_weapons::is_wonder_weapon(w_weapon)) {
            n_damage *= 0.3;
            var_17c6835 = 1;
        }
        if (!var_17c6835) {
            continue;
        }
        if (isdefined(w_weapon) && (w_weapon.name === #"stake_knife" || w_weapon.name === #"bowie_knife")) {
            n_damage *= 0.1;
        }
        if (isplayer(e_inflictor) && isdefined(w_weapon) && isdefined(e_inflictor zm_utility::function_aa45670f(w_weapon, 0)) && e_inflictor zm_utility::function_aa45670f(w_weapon, 0)) {
            n_damage *= 1.05;
        }
        if (isdefined(w_weapon) && w_weapon.weapclass === "rocketlauncher") {
            var_6e859516 = 800;
        } else {
            var_6e859516 = 500;
        }
        if (isdefined(n_damage) && isdefined(var_6e859516) && n_damage > var_6e859516) {
            n_damage = var_6e859516;
        }
        if (isalive(s_notify.attacker) && isplayer(s_notify.attacker) && !(isdefined(self.var_a58d72c0) && self.var_a58d72c0)) {
            self.var_35eb7b2a = gettime() + 1000;
            s_notify.attacker playhitmarker(undefined, 5, undefined, 1, 0);
            s_notify.attacker thread zm_audio::sndplayerhitalert_playsound("zmb_hit_alert_hallion");
            if (s_notify.attacker hasperk(#"specialty_mod_awareness")) {
                n_damage = int(n_damage * 1.1);
            }
        } else if (isdefined(self.var_35eb7b2a) && gettime() < self.var_35eb7b2a) {
            self.var_a58d72c0 = 1;
        } else {
            self.var_a58d72c0 = 0;
        }
        self.var_18acfe18 += n_damage;
        self.var_57badb98 += n_damage;
        if (self.var_57badb98 >= self.var_c962047c) {
            var_2721aeff = 1;
        } else if (self.var_57badb98 >= self.var_c962047c * 0.75) {
            s_notify.attacker thread function_68af48a0();
        }
        if (var_2721aeff) {
            self.var_6a30a892 = undefined;
            if (n_stage == 3) {
                level.var_bd2ceeea = s_notify.attacker;
                level thread function_c11a9d59();
                waitframe(1);
            }
            level thread function_f74b38da("zm_power_on_rumble");
            level notify(#"hash_14400d2bff068132");
            level notify(#"hash_38f29f9cb03586ea");
        }
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x838c967b, Offset: 0x5ff8
// Size: 0x12c
function function_68af48a0() {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    self endon(#"death");
    if (isplayer(self) && !(isdefined(level.var_f1028094[#"hash_648770ea260c72e8"]) && level.var_f1028094[#"hash_648770ea260c72e8"])) {
        level.var_f1028094[#"hash_648770ea260c72e8"] = 1;
        n_character_index = self zm_characters::function_d35e4c92();
        str_vo = "vox_werewolf_health_25_plr_" + n_character_index + "_0";
        self zm_vo::vo_say(str_vo, 0, 1, 9999);
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x6ae2c2e8, Offset: 0x6130
// Size: 0x37c
function function_c11a9d59() {
    level endon(#"end_game", #"intermission");
    var_25f64af7 = undefined;
    if (isalive(level.var_bd2ceeea)) {
        var_25f64af7 = level.var_bd2ceeea;
    } else {
        a_e_players = util::get_active_players();
        a_e_players = array::randomize(a_e_players);
        foreach (e_player in a_e_players) {
            if (isalive(e_player)) {
                var_25f64af7 = e_player;
                break;
            }
        }
    }
    n_character_index = var_25f64af7 zm_characters::function_d35e4c92();
    str_vo = "vox_werewolf_health_00_plr_" + n_character_index + "_0";
    var_25f64af7 thread zm_vo::vo_say(str_vo, 0, 1, 9999);
    n_wait = float(soundgetplaybacktime(str_vo)) / 1000;
    if (n_wait >= 20) {
        n_wait = 20;
    }
    wait(n_wait);
    if (!zm_utility::is_player_valid(var_25f64af7)) {
        a_e_players = util::get_active_players();
        a_e_players = array::randomize(a_e_players);
        foreach (e_player in a_e_players) {
            if (zm_utility::is_player_valid(e_player) && e_player !== var_25f64af7) {
                var_25f64af7 = e_player;
                break;
            }
        }
    }
    n_character_index = var_25f64af7 zm_characters::function_d35e4c92();
    str_vo = "vox_werewolf_defeat_plr_" + n_character_index + "_0";
    var_25f64af7 thread zm_vo::vo_say(str_vo, 0, 1, 9999);
    n_wait = float(soundgetplaybacktime(str_vo)) / 1000;
    if (n_wait >= 20) {
        n_wait = 20;
    }
    wait(n_wait);
    level flag::set(#"hash_480ab8b0d38942cc");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x1 linked
// Checksum 0x6313ac6d, Offset: 0x64b8
// Size: 0xfc
function function_8d29523e(str_waittill, var_d4ecd0a0 = 0) {
    level endon(#"hash_44a9443b3165c556");
    self endon(#"death");
    if (var_d4ecd0a0) {
        str_clientfield = "" + #"hash_69c1868b7a8a7beb";
    } else {
        str_clientfield = "" + #"hash_87483ed44cb2791";
    }
    level waittill(str_waittill);
    if (str_waittill == #"boss_visible") {
        self clientfield::set(str_clientfield, 1);
        return;
    }
    self clientfield::set(str_clientfield, 0);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x45e7c484, Offset: 0x65c0
// Size: 0x240
function function_fdd04f47(n_stage) {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    wait(2);
    var_efc198c = randomintrange(1, 4);
    var_45e1b44b = level.s_boss.var_dcaafc8e[var_efc198c];
    var_45e1b44b thread scene::play(#"hash_44e932e9dc79e15a" + var_efc198c);
    var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_visible");
    var_45e1b44b.scene_ents[#"fakeactor 1"] function_d84758c();
    var_45e1b44b thread scene::play(#"hash_3aeb4ff93f2cbf0" + var_efc198c);
    var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_invisible");
    level waittill(#"hash_c7dc435140cc59");
    level thread function_29de7388();
    var_45e1b44b thread function_677a2503();
    var_45e1b44b.scene_ents[#"fakeactor 1"] function_d84758c();
    level flag::clear(#"hash_f4dfa99c5e22bc6");
    level notify(#"hash_3d52ec26acedf741");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x4375e63, Offset: 0x6808
// Size: 0xb4
function function_677a2503(var_754a5572 = 1) {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    wait(1.25);
    if (var_754a5572) {
        v_loc = self.origin;
    } else {
        v_loc = undefined;
    }
    mansion_util::function_2057ddc1(v_loc, "werewolf", "enemy_enter", undefined, #"hash_3738d07fc833937e");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x89db44e9, Offset: 0x68c8
// Size: 0xfc
function function_ae76e58d() {
    for (n_statue = 1; n_statue <= 3; n_statue++) {
        e_statue = level.var_b5fff38b[n_statue];
        s_trig = struct::get("boss_statue_trig_" + n_statue, "targetname");
        e_statue.unitrigger_stub = s_trig zm_unitrigger::create(&function_54b6886c, 128, &function_a430c55f, 1);
        e_statue.unitrigger_stub.var_235457fd = 0;
        e_statue.unitrigger_stub.e_statue = e_statue;
    }
    level thread function_e0b1cf29();
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x1f41430c, Offset: 0x69d0
// Size: 0x168
function function_a430c55f() {
    level endon(#"hash_25d8c88ff3f91ee5", #"end_game", #"intermission");
    while (true) {
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;
        if (isplayer(e_player)) {
            self.stub.var_235457fd = 0;
            if (self.stub.e_statue.var_ae187a59 == 4) {
                self.stub.e_statue.var_ae187a59 = 0;
            }
            var_ebbd3ea8 = self.stub.e_statue.var_ae187a59 + 1;
            level thread function_1025059f(self.stub.e_statue.var_d707e889[var_ebbd3ea8], self.stub.e_statue.var_bbfcddc6, level.s_boss.var_2d102ea7);
        }
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x568e0f85, Offset: 0x6b40
// Size: 0x128
function function_54b6886c(player) {
    if (level flag::get(#"hash_5f2b9a36a2c517af")) {
        self sethintstring("");
        return 0;
    }
    if (!(isdefined(self.stub.var_235457fd) && self.stub.var_235457fd)) {
        self sethintstring("");
        return 0;
    }
    if (zm_utility::can_use(player)) {
        str_prompt = zm_utility::function_d6046228(#"hash_5821a2758405c5ca", #"hash_f8daa20b2e5a2ce");
        self sethintstring(str_prompt);
        return 1;
    }
    self sethintstring("");
    return 0;
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x4b38386f, Offset: 0x6c70
// Size: 0x2c
function function_ccd8387e(n_state) {
    self clientfield::set("bs_sigil_fx", n_state);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0xe3336060, Offset: 0x6ca8
// Size: 0x44
function function_6045e0ac(n_state) {
    self.var_33fc862a = n_state;
    self clientfield::set("" + #"hash_5cca35fc43fa51e6", n_state);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x6458d761, Offset: 0x6cf8
// Size: 0x1dc
function function_e0b1cf29(var_82b2ec02 = 0) {
    level notify(#"hash_348a23891a681a5f");
    level flag::clear(#"hash_eed1544f10c5bb3");
    level flag::clear(#"hash_493de5832f801947");
    function_a3a00f3a(0);
    foreach (var_8b857f7b in level.var_60ce0a79) {
        var_8b857f7b thread function_ccd8387e(0);
        var_8b857f7b thread function_6045e0ac(0);
    }
    for (i = 1; i <= 3; i++) {
        level thread function_1025059f(undefined, i, undefined, 1);
        level.var_b5fff38b[i] thread function_d2367771(var_82b2ec02);
        level.var_b5fff38b[i].var_5f88b76a = 0;
    }
    wait(3);
    level flag::clear(#"hash_5f2b9a36a2c517af");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x240ebaa0, Offset: 0x6ee0
// Size: 0x54
function function_a3a00f3a(b_on) {
    for (i = 1; i <= 3; i++) {
        level.var_b5fff38b[i].unitrigger_stub.var_235457fd = b_on;
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x93fc4422, Offset: 0x6f40
// Size: 0xa4
function function_d2367771(var_82b2ec02 = 0) {
    if (var_82b2ec02) {
        self clientfield::set("" + #"hash_6ad20bd0d84e8602", 0);
    } else {
        self clientfield::set("" + #"hash_6ad20bd0d84e8602", 1);
    }
    self clientfield::set("" + #"hash_4ca506515aec02d3", 0);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x8f0ae891, Offset: 0x6ff0
// Size: 0x3f4
function function_47e0a10b(n_stage) {
    level endon(#"hash_38f29f9cb03586ea", #"hash_348a23891a681a5f", #"end_game", #"intermission");
    var_9bcf74c3 = [];
    for (i = 1; i <= 4; i++) {
        if (!isdefined(var_9bcf74c3)) {
            var_9bcf74c3 = [];
        } else if (!isarray(var_9bcf74c3)) {
            var_9bcf74c3 = array(var_9bcf74c3);
        }
        var_9bcf74c3[var_9bcf74c3.size] = i;
    }
    level.var_be8c6c41 = 0;
    switch (n_stage) {
    case 1:
        var_d103b26c = 2;
        if (!isdefined(level.s_boss.var_2d102ea7) || level.s_boss.var_2d102ea7 + 1 > 4) {
            level.s_boss.var_2d102ea7 = 1;
        } else {
            level.s_boss.var_2d102ea7++;
        }
        level thread function_1025059f(level.s_boss.var_2d102ea7, 1, level.s_boss.var_2d102ea7, 1);
        break;
    case 3:
        var_d103b26c = 1;
        if (!isdefined(level.s_boss.var_2d102ea7)) {
            level.s_boss.var_2d102ea7 = array::random(var_9bcf74c3);
        } else {
            arrayremovevalue(var_9bcf74c3, level.s_boss.var_2d102ea7);
            level.s_boss.var_2d102ea7 = array::random(var_9bcf74c3);
        }
        level thread function_52abb791();
        break;
    }
    arrayremovevalue(var_9bcf74c3, level.s_boss.var_2d102ea7);
    if (isdefined(level.s_boss)) {
        if (!isdefined(level.s_boss.var_2d102ea7)) {
            level.s_boss.var_2d102ea7 = 1;
        }
        var_c268c886 = getent("boss_sigil_" + level.s_boss.var_2d102ea7, "targetname");
        var_c268c886 thread function_ccd8387e(1);
    } else {
        assert(0, "<unknown string>");
    }
    for (n_statue = var_d103b26c; n_statue <= 3; n_statue++) {
        var_883035ad = array::random(var_9bcf74c3);
        level thread function_1025059f(var_883035ad, n_statue, level.s_boss.var_2d102ea7);
    }
    level thread function_64000eab();
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xf6bf46cf, Offset: 0x73f0
// Size: 0x11c
function function_64000eab() {
    level endon(#"hash_38f29f9cb03586ea", #"hash_348a23891a681a5f", #"end_game", #"intermission");
    switch (level.var_f3c4bd00) {
    case 1:
        var_32573a68 = 1.5;
        break;
    case 2:
        var_32573a68 = 2;
        break;
    case 3:
        var_32573a68 = 2.5;
        break;
    case 4:
        var_32573a68 = 3;
        break;
    }
    var_32573a68 += 0.1;
    wait(var_32573a68);
    function_a3a00f3a(1);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 4, eflags: 0x1 linked
// Checksum 0xb516a731, Offset: 0x7518
// Size: 0x554
function function_1025059f(var_2175ea54, n_statue, var_2d102ea7, var_b7daddf4 = 0) {
    level endon(#"hash_348a23891a681a5f", #"end_game", #"intermission");
    var_6e91cc7c = 0;
    var_953184dc = 0;
    if (var_b7daddf4 || !isdefined(level.var_f3c4bd00)) {
        var_916e8cfa = 1;
    } else {
        switch (level.var_f3c4bd00) {
        case 1:
            var_916e8cfa = 1.5;
            break;
        case 2:
            var_916e8cfa = 2;
            break;
        case 3:
            var_916e8cfa = 2.5;
            break;
        case 4:
            var_916e8cfa = 3;
            break;
        }
    }
    e_statue = level.var_b5fff38b[n_statue];
    if (isdefined(var_2175ea54)) {
        e_sigil = level.var_60ce0a79[var_2175ea54];
        var_8f6b69b0 = level.var_60ce0a79[var_2d102ea7];
        var_23ee4083 = vectortoangles(e_sigil.origin - e_statue.origin);
        var_23ee4083 = var_23ee4083;
    } else {
        var_23ee4083 = e_statue.var_87fb192a;
        e_statue.var_ae187a59 = 0;
    }
    if (isdefined(e_statue.var_5f88b76a) && e_statue.var_5f88b76a) {
        var_953184dc = 1;
    }
    e_statue function_d2367771();
    e_statue rotateto(var_23ee4083, var_916e8cfa);
    e_statue playsound(#"hash_7feed504dc9858aa");
    e_statue playloopsound(#"hash_4d7ead6890b3cdbe");
    wait(var_916e8cfa);
    e_statue stoploopsound();
    if (isdefined(var_2175ea54)) {
        for (i = 1; i < e_statue.var_d707e889.size; i++) {
            if (e_statue.var_d707e889[i] == var_2175ea54) {
                e_statue.var_ae187a59 = i;
                break;
            }
        }
        if (e_statue.var_d707e889[e_statue.var_ae187a59] == var_2d102ea7) {
            var_6286c268 = math::clamp(var_8f6b69b0.var_33fc862a + 1, 0, 3);
            e_sigil thread function_6045e0ac(var_6286c268);
            e_statue clientfield::set("" + #"hash_6ad20bd0d84e8602", 0);
            e_statue clientfield::set("" + #"hash_4ca506515aec02d3", 1);
            e_statue.var_5f88b76a = 1;
            var_6e91cc7c = function_a2fa8688();
        } else if (isdefined(e_statue.var_5f88b76a) && e_statue.var_5f88b76a && var_953184dc) {
            var_6286c268 = math::clamp(var_8f6b69b0.var_33fc862a - 1, 0, 3);
            var_8f6b69b0 thread function_6045e0ac(var_6286c268);
            e_statue.var_5f88b76a = 0;
        }
    }
    if (isdefined(e_statue.var_5f88b76a) && e_statue.var_5f88b76a) {
        e_statue playsound(#"hash_45e88efac471ec12");
    } else {
        e_statue playsound(#"hash_525f9082123a384a");
    }
    if (!var_b7daddf4 && !var_6e91cc7c) {
        e_statue.unitrigger_stub.var_235457fd = 1;
        return;
    }
    if (var_6e91cc7c) {
        level thread function_a70e02d3(var_2d102ea7);
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x824c3f07, Offset: 0x7a78
// Size: 0xc0
function function_a2fa8688() {
    foreach (var_1611cc08 in level.var_b5fff38b) {
        if (!var_1611cc08.var_5f88b76a) {
            return false;
        }
    }
    level flag::set(#"hash_5f2b9a36a2c517af");
    level flag::clear(#"hash_eed1544f10c5bb3");
    return true;
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xc0473af5, Offset: 0x7b40
// Size: 0x114
function function_52abb791() {
    level endon(#"hash_5f2b9a36a2c517af", #"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    switch (level.var_f3c4bd00) {
    case 1:
        var_3ee45e30 = 52;
        break;
    case 2:
        var_3ee45e30 = 48;
        break;
    case 3:
        var_3ee45e30 = 44;
        break;
    case 4:
        var_3ee45e30 = 40;
        break;
    }
    wait(var_3ee45e30);
    level flag::set(#"hash_eed1544f10c5bb3");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x81d51b14, Offset: 0x7c60
// Size: 0xec
function function_aace34f9() {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission");
    var_c4b8b9cd = array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
    mansion_util::function_2057ddc1(undefined, "generic", "responses_negative", var_c4b8b9cd, #"hash_50dc614c07736977", randomintrange(20, 20 * 3), 1, 1);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0xa269a737, Offset: 0x7d58
// Size: 0x104
function function_a70e02d3(var_b66cd272) {
    level endon(#"end_game", #"intermission");
    e_sigil = level.var_60ce0a79[var_b66cd272];
    e_sigil thread function_ccd8387e(2);
    e_sigil thread function_ec25f7c2();
    level waittilltimeout(32, #"boss_captured", #"hash_38f29f9cb03586ea");
    e_sigil playsound(#"hash_4aff74c5f6036730");
    e_sigil thread function_6045e0ac(0);
    level flag::set(#"hash_eed1544f10c5bb3");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x329ab639, Offset: 0x7e68
// Size: 0x19c
function function_ec25f7c2() {
    level endon(#"hash_eed1544f10c5bb3", #"end_game", #"intermission");
    while (true) {
        if (distance2dsquared(level.s_boss.var_4944ec8.origin, self.origin) < 25600) {
            self thread function_ccd8387e(3);
            level.s_boss.var_4944ec8 animation::stop(0);
            level.s_boss.var_4944ec8.origin = self.origin;
            level notify(#"boss_captured");
            level flag::set(#"hash_493de5832f801947");
            self playsound(#"hash_109cfe35ce0806f5");
            break;
        }
        util::wait_network_frame();
    }
    level waittill(#"hash_3d52ec26acedf741");
    self function_ccd8387e(0);
    level flag::set(#"hash_eed1544f10c5bb3");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x94702eb6, Offset: 0x8010
// Size: 0x158
function function_2b6b4a44() {
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"end_game", #"intermission");
    while (true) {
        level notify(#"hash_6986218d09dc1cb2");
        util::wait_network_frame(1);
        level function_e2f134ce();
        level notify(#"hash_3d161e7dd2d0df2d");
        util::wait_network_frame(1);
        level function_e2f134ce();
        level notify(#"hash_6986218d09dc1cb2");
        util::wait_network_frame(1);
        level function_e2f134ce();
        level notify(#"hash_71dbe2201553374b");
        util::wait_network_frame(1);
        level function_e2f134ce();
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x6a09387, Offset: 0x8170
// Size: 0x24
function function_e2f134ce() {
    level flag::wait_till_clear(#"hash_21921ed511559aa3");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x7597220, Offset: 0x81a0
// Size: 0x498
function function_de60e752() {
    level endon(#"hash_38f29f9cb03586ea", #"end_game", #"intermission", #"end_game");
    n_round = level.var_d6f059f7;
    var_e2f55613 = getspawnerarray("spawner_zm_zombie", "targetname")[0];
    a_s_spawnpoints = struct::get_array("boss_zombie_spawnpoint", "targetname");
    var_6d55be0e = 1.5;
    switch (level.var_f3c4bd00) {
    case 1:
        var_d166a3c6 = 1;
        var_6d55be0e = 1.5;
        break;
    case 2:
        var_d166a3c6 = 2;
        var_6d55be0e = 1;
        break;
    case 3:
        var_d166a3c6 = 3;
        var_6d55be0e = 0.5;
        break;
    case 4:
        var_d166a3c6 = 4;
        var_6d55be0e = 0.1;
        break;
    }
    var_d166a3c6 = level.var_f3c4bd00;
    n_max_active_ai = 16 + var_d166a3c6;
    level.var_9eaf1031 = 0;
    level.var_83c0592c = 0;
    level thread function_f5b2d086();
    s_zone = level.zones[#"zone_arena"];
    a_s_spawnpoints = struct::get_array(s_zone.name + "_spawns");
    a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(s_zone.name + "_spawner"), 0, 0);
    var_e6217dda = getarraykeys(s_zone.adjacent_zones);
    foreach (str_zone in var_e6217dda) {
        if (isdefined(s_zone.adjacent_zones[str_zone]) && s_zone.adjacent_zones[str_zone].is_connected) {
            a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawns"), 0, 0);
            a_s_spawnpoints = arraycombine(a_s_spawnpoints, struct::get_array(str_zone + "_spawner"), 0, 0);
        }
    }
    while (true) {
        while (getaiteamarray(level.zombie_team).size >= n_max_active_ai) {
            util::wait_network_frame();
        }
        spawner = array::random(level.zombie_spawners);
        var_b2a4b538 = level.var_83c0592c;
        level waittill(#"hash_6986218d09dc1cb2");
        e_zombie = zombie_utility::spawn_zombie(spawner, spawner.targetname, undefined, n_round);
        if (isdefined(e_zombie)) {
            level.var_83c0592c++;
        }
        wait(var_6d55be0e);
    }
    level notify(#"hash_71fd67248b9a37ca");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x0
// Checksum 0xe3027221, Offset: 0x8640
// Size: 0x68
function function_e9b8eaff(e_attacker) {
    if (self.archetype !== #"zombie") {
        return;
    }
    if (!isplayer(e_attacker)) {
        return;
    }
    if (isdefined(self.var_69a981e6) && self.var_69a981e6) {
        return;
    }
    level.var_9eaf1031++;
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x5f16cb90, Offset: 0x86b0
// Size: 0x15e
function boss_cleanup_zombie() {
    level endon(#"end_game", #"intermission");
    a_ai_zombies = getaiarchetypearray(#"zombie", level.zombie_team);
    foreach (ai in a_ai_zombies) {
        if (!isalive(ai) || zm_utility::is_magic_bullet_shield_enabled(ai) || isdefined(ai.var_69a981e6) && ai.var_69a981e6) {
            util::wait_network_frame();
            continue;
        }
        ai kill();
        ai hide();
        level.var_83c0592c--;
        return;
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xcc6045d1, Offset: 0x8818
// Size: 0x1cc
function function_f5b2d086() {
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"hash_71fd67248b9a37ca", #"end_game", #"intermission");
    wait(10);
    var_e8ebec1d = array(#"hash_7c89b1397a38e3ad", #"hash_7c89ae397a38de94", #"hash_7c89af397a38e047", #"hash_7c89ac397a38db2e");
    level.var_8a64ef3a = 0;
    var_ffd2fe87 = 4 + level.var_f3c4bd00;
    while (true) {
        if (getaiteamarray(level.zombie_team).size > 0 && level.var_8a64ef3a / getaiteamarray(level.zombie_team).size * 100 < var_ffd2fe87) {
            var_6c463143 = 1;
        } else {
            var_6c463143 = 0;
        }
        var_c0958d26 = array::random(var_e8ebec1d);
        if (var_6c463143 && !zm_transform::function_abf1dcb4(var_c0958d26)) {
            zm_transform::function_bdd8aba6(var_c0958d26);
            level.var_9eaf1031--;
        }
        wait(2);
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0xc02bcb00, Offset: 0x89f0
// Size: 0x84
function function_724b3e30(n_health) {
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"end_game", #"intermission");
    self.b_ignore_cleanup = 1;
    level.var_8a64ef3a++;
    level thread function_83ad8f65(self);
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0xad4aa8c9, Offset: 0x8a80
// Size: 0x88
function function_83ad8f65(ai) {
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"end_game", #"intermission");
    ai waittill(#"death");
    if (isdefined(level.var_8a64ef3a)) {
        level.var_8a64ef3a--;
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x1 linked
// Checksum 0xdffa96b0, Offset: 0x8b10
// Size: 0x410
function function_e9cc6379(var_4642da4d, var_732926d1 = 0) {
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"end_game", #"intermission");
    n_round = level.var_d6f059f7;
    var_574e94ee = struct::get_array(#"hash_49002dbb418e71a1");
    n_max_active_ai = 16 + level.var_f3c4bd00;
    switch (level.var_f3c4bd00) {
    case 1:
        var_91a2fd38 = 1;
        break;
    case 2:
        var_91a2fd38 = 2;
        break;
    case 3:
        var_91a2fd38 = 3;
        break;
    case 4:
        var_91a2fd38 = 4;
        break;
    }
    var_c441a64d = undefined;
    var_d9ca600e = 0;
    while (true) {
        wait(randomfloatrange(20, 25));
        var_50e016a7 = level.var_83c0592c + var_4642da4d;
        var_f67b2fc0 = 0;
        while (var_f67b2fc0 < var_91a2fd38) {
            while (getaiteamarray(level.zombie_team).size >= n_max_active_ai) {
                util::wait_network_frame();
                level boss_cleanup_zombie();
            }
            level waittill(#"hash_71dbe2201553374b");
            ai_nosferatu = zm_ai_nosferatu::function_74f25f8a(1, undefined, 1, n_round);
            if (isalive(ai_nosferatu)) {
                ai_nosferatu.var_85480576 = 1;
                var_f67b2fc0++;
                wait(randomfloatrange(3, 6));
            }
        }
        var_66677bf4 = getaiarchetypearray(#"nosferatu");
        var_59bff05d = var_66677bf4.size;
        while (var_59bff05d > 0) {
            foreach (var_c441a64d in var_66677bf4) {
                if (!isalive(var_c441a64d)) {
                    var_59bff05d--;
                }
            }
            util::wait_network_frame(2);
        }
        var_d9ca600e++;
        if (var_732926d1 > 0) {
            if (!level flag::get(#"hash_f4dfa99c5e22bc6") && var_d9ca600e >= var_732926d1) {
                level flag::set(#"hash_f4dfa99c5e22bc6");
            }
            var_d9ca600e = 0;
        }
        util::wait_network_frame();
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0xd36b4abd, Offset: 0x8f28
// Size: 0x224
function function_29de7388() {
    level endon(#"hash_38f29f9cb03586ea", #"spawn_zombies", #"end_game", #"intermission");
    n_max_active_ai = 16 + level.var_f3c4bd00;
    switch (level.var_f3c4bd00) {
    case 1:
        var_8f0a1ccb = 1;
        break;
    case 2:
        var_8f0a1ccb = 2;
        break;
    case 3:
        var_8f0a1ccb = 3;
        break;
    case 4:
        var_8f0a1ccb = 4;
        break;
    }
    var_60b5e280 = 0;
    do {
        while (getaiteamarray(level.zombie_team).size >= n_max_active_ai) {
            util::wait_network_frame();
            level boss_cleanup_zombie();
        }
        while (level.var_1821f542 >= 3) {
            util::wait_network_frame(2);
        }
        level waittill(#"hash_3d161e7dd2d0df2d");
        ai_werewolf = zombie_werewolf_util::function_47a88a0c(1, undefined, 1, undefined, level.var_d6f059f7);
        if (isdefined(ai_werewolf)) {
            level.var_1821f542++;
            var_60b5e280++;
        }
    } while (var_60b5e280 < var_8f0a1ccb);
    level flag::set(#"hash_67757a8cb27cb8aa");
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x1 linked
// Checksum 0x7a47767, Offset: 0x9158
// Size: 0x3c
function function_83275bc3(s_spawn_loc) {
    self waittill(#"death");
    level.var_38fff406++;
    level.var_1821f542--;
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x3c178325, Offset: 0x91a0
// Size: 0xc0
function function_de5e2c78() {
    level endon(#"end_game", #"intermission");
    s_spawnloc = array::random(level.var_db1658d1);
    while (true) {
        s_spawnloc = array::random(level.var_db1658d1);
        if (!(isdefined(self.var_ebae258d) && self.var_ebae258d)) {
            s_spawnloc thread function_8f28b521();
            return s_spawnloc;
        }
        util::wait_network_frame();
    }
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x1 linked
// Checksum 0x23304d72, Offset: 0x9268
// Size: 0x26
function function_8f28b521() {
    self.var_ebae258d = 1;
    wait(1.5);
    self.var_ebae258d = 0;
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x0
// Checksum 0xbcbc355a, Offset: 0x9298
// Size: 0x1d4
function function_5d346946() {
    /#
        if (!getdvarint(#"zm_debug_ee", 0)) {
            return;
        }
        level.var_80d31f80 = 0;
        level.var_870646c4 = 0;
        zm_devgui::add_custom_devgui_callback(&function_51d480c9);
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x0
// Checksum 0x4d8174bd, Offset: 0x9478
// Size: 0x2ea
function function_51d480c9(cmd) {
    /#
        switch (cmd) {
        case #"gear_up":
            level thread gear_up();
            return 1;
        case #"hash_1270cae114bc8c94":
            level thread function_e7520565();
            return 1;
        case #"hash_3426f6de3d18b749":
            level thread function_1ac7cc62();
            return 1;
        case #"hash_170242bf39c8ece5":
            level thread function_f3f10a38(1);
            return 1;
        case #"hash_170240bf39c8e97f":
            level thread function_f3f10a38(3);
            return 1;
        case #"hash_17d72dc427ff372c":
            level thread function_1ca1a249(1);
            return 1;
        case #"hash_b4e0e8767c9d1ae":
            level thread function_b7ed6bce();
            return 1;
        case #"hash_3572c57f52ea57e5":
            level thread function_aa31f6af();
            return 1;
        case #"boss_intro":
            level thread function_b9ca419b();
            return 1;
        case #"hash_56e2d0157b43c96e":
            level thread function_84f320f1(0);
            return 1;
        case #"hash_5b84f16a656b80c":
            level thread function_84f320f1(1);
            return 1;
        case #"hash_5b85216a656bd25":
            level thread function_84f320f1(2);
            return 1;
        case #"hash_5b85116a656bb72":
            level thread function_84f320f1(3);
            return 1;
        case #"hash_5dad3801740fa24a":
            level notify(#"hash_38f29f9cb03586ea");
            return 1;
        case #"hash_456d8c20be179a97":
            level thread function_abdd578e();
            return 1;
        }
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x0
// Checksum 0x7131abf2, Offset: 0x9770
// Size: 0x3c
function function_e7520565() {
    /#
        level.var_80d31f80 = 1;
        zm_sq::start(#"zm_mansion_ww", 1);
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x0
// Checksum 0x151868f9, Offset: 0x97b8
// Size: 0x328
function function_1ac7cc62() {
    /#
        clientfield::set("<unknown string>" + #"hash_2709d50a7b0a2b01", 1);
        /#
            iprintlnbold("<unknown string>");
        #/
        level flag::clear("<unknown string>");
        level flag::set(#"disable_fast_travel");
        level flag::set("<unknown string>");
        level flag::set(#"boss_fight_started");
        zm_zonemgr::enable_zone("<unknown string>");
        if (!(isdefined(level.var_ef54ff59) && level.var_ef54ff59)) {
            level.var_ef54ff59 = 1;
            init_traps();
            init_boss();
            init_spawns();
        }
        level.s_boss.var_2d102ea7 = undefined;
        level.var_38fff406 = 0;
        level.var_1821f542 = 0;
        level.var_df7e1ee2 = 0;
        level.var_4d950fdc = 0;
        level.var_b106cd7a = &function_de5e2c78;
        level.var_7e40409b = &function_83275bc3;
        level thread zm_transform::function_e95ec8df(1);
        level thread function_482a7a01();
        level function_ae76e58d();
        level thread function_e0b1cf29();
        level function_732f7da0();
        level thread function_2b6b4a44();
        level boss_teleport_players(1);
        level.var_870646c4 = 1;
        callback::on_spawned(&function_92a12286);
        a_players = util::get_active_players();
        foreach (player in a_players) {
            player thread function_92a12286();
        }
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x0
// Checksum 0x9b53ca24, Offset: 0x9ae8
// Size: 0x64
function function_f3f10a38(n_stage) {
    /#
        function_46d7a37();
        level function_f433c7f5(n_stage);
        level.var_80d31f80 = 0;
        /#
            iprintlnbold("<unknown string>");
        #/
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x0
// Checksum 0x70e1967c, Offset: 0x9b58
// Size: 0x94
function function_1ca1a249(n_stage) {
    /#
        level endon(#"hash_38f29f9cb03586ea");
        function_46d7a37();
        level flag::set(#"hash_eed1544f10c5bb3");
        level.s_boss.var_57badb98 = 0;
        level.s_boss.var_c962047c = 99999;
        level function_738f7574(n_stage);
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x0
// Checksum 0xa170a58a, Offset: 0x9bf8
// Size: 0x8c
function function_b7ed6bce() {
    /#
        if (!(isdefined(level.var_eae946a3) && level.var_eae946a3)) {
            /#
                iprintlnbold("<unknown string>");
            #/
            return;
        }
        level notify(#"hash_38f29f9cb03586ea");
        level.var_80d31f80 = 0;
        level.var_eae946a3 = 0;
        /#
            iprintlnbold("<unknown string>");
        #/
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x0
// Checksum 0x79d6620, Offset: 0x9c90
// Size: 0x5c
function function_aa31f6af() {
    /#
        function_46d7a37();
        level function_fdd04f47(0);
        level.var_80d31f80 = 0;
        /#
            iprintlnbold("<unknown string>");
        #/
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x0
// Checksum 0x40a4edc8, Offset: 0x9cf8
// Size: 0x1ec
function function_b9ca419b() {
    /#
        if (level.var_80d31f80) {
            /#
                iprintlnbold("<unknown string>");
            #/
            return;
        } else {
            /#
                iprintlnbold("<unknown string>");
            #/
            level.var_80d31f80 = 1;
        }
        level zm_vo::function_3c173d37();
        level zm_audio::sndvoxoverride(1);
        var_45e1b44b = level.s_boss.var_dcaafc8e[3];
        var_45e1b44b thread scene::play(#"aib_t8_zm_mnsn_hallion_intro");
        util::wait_network_frame();
        var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_visible");
        var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_invisible");
        var_45e1b44b.scene_ents[#"fakeactor 1"] function_d84758c();
        wait(0.2);
        level.var_80d31f80 = 0;
        level zm_audio::sndvoxoverride(0);
        /#
            iprintlnbold("<unknown string>");
        #/
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 1, eflags: 0x0
// Checksum 0x12bcceaa, Offset: 0x9ef0
// Size: 0x594
function function_84f320f1(n_stage) {
    /#
        function_46d7a37();
        if (n_stage == 2) {
            var_45e1b44b = level.s_boss.var_dcaafc8e[3];
            var_45e1b44b thread scene::play(#"aib_t8_zm_mnsn_hallion_stage_trans_02");
            var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_visible");
            var_45e1b44b.scene_ents[#"fakeactor 1"] thread function_8d29523e(#"boss_invisible");
            var_45e1b44b.scene_ents[#"fakeactor 1"] function_d84758c();
            level.var_80d31f80 = 0;
            /#
                iprintlnbold("<unknown string>");
            #/
            return;
        }
        level.s_boss.var_4944ec8.origin = level.s_boss.var_dcaafc8e[1].origin;
        level.s_boss.var_4944ec8 animation::stop(0);
        level.s_boss.var_4944ec8 thread scene::play(#"aib_t8_zm_mnsn_hallion_stun", "<unknown string>");
        level.s_boss.var_4944ec8 thread function_8d29523e(#"boss_visible");
        level.s_boss.var_4944ec8 function_d84758c();
        switch (n_stage) {
        case 0:
            level.s_boss.var_57badb98 = 0;
            level.s_boss.var_c962047c = 99999;
            level.s_boss thread function_bb528a4b(n_stage);
            level.s_boss.var_4944ec8 clientfield::set("<unknown string>" + #"hash_1bf2c2f62ad1bf56", 1);
            wait(12);
            level.s_boss.var_4944ec8 animation::stop(0);
            level.s_boss.var_4944ec8 scene::play(#"aib_t8_zm_mnsn_hallion_stun", "<unknown string>");
            level.s_boss.var_4944ec8 clientfield::set("<unknown string>" + #"hash_1bf2c2f62ad1bf56", 0);
            break;
        case 1:
            wait(3);
            level.s_boss.var_4944ec8 animation::stop(0);
            level.s_boss.var_4944ec8 scene::play(#"aib_t8_zm_mnsn_hallion_stun", "<unknown string>");
            break;
        case 3:
            wait(3);
            level.s_boss.var_4944ec8 animation::stop(0);
            level.s_boss.var_4944ec8 thread scene::play(#"aib_t8_zm_mnsn_hallion_death");
            level.s_boss.var_4944ec8 function_d84758c();
            wait(1);
            break;
        }
        if (n_stage != 3) {
            level.s_boss.var_4944ec8 animation::stop(0);
            level.s_boss.var_4944ec8 thread function_8d29523e(#"boss_invisible");
            level.s_boss.var_4944ec8 scene::play(#"aib_t8_zm_mnsn_hallion_stun", "<unknown string>");
            level.s_boss.var_4944ec8 animation::stop(0);
            level.s_boss.var_4944ec8.origin = (0, 0, 0);
        }
        level.var_80d31f80 = 0;
        /#
            iprintlnbold("<unknown string>");
        #/
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 2, eflags: 0x0
// Checksum 0xca1008ed, Offset: 0xa490
// Size: 0x564
function gear_up(b_packed, var_5b901c1) {
    /#
        if (!isdefined(b_packed)) {
            b_packed = 1;
        }
        if (!isdefined(var_5b901c1)) {
            var_5b901c1 = 1;
        }
        players = getplayers();
        var_2ebde1ac = array::randomize(array(#"ar_mg1909_t8", #"ar_accurate_t8", #"ar_damage_t8", #"ar_stealth_t8"));
        var_dd063e3e = array::randomize(array(#"lmg_spray_t8", #"shotgun_semiauto_t8", #"lmg_heavy_t8", #"lmg_double_t8"));
        foreach (player in players) {
            if (!player laststand::player_is_in_laststand()) {
                player giveweapon(getweapon(#"zhield_dw"));
                player zm_perks::function_869a50c0(4);
                if (!var_dd063e3e.size || !var_2ebde1ac.size) {
                    break;
                }
                foreach (w_primary in player getweaponslistprimaries()) {
                    player takeweapon(w_primary);
                }
                weapon1 = getweapon(var_dd063e3e[0]);
                weapon2 = getweapon(var_2ebde1ac[0]);
                arrayremovevalue(var_dd063e3e, var_dd063e3e[0], 0);
                arrayremovevalue(var_2ebde1ac, var_2ebde1ac[0], 0);
                if (b_packed) {
                    weapon1 = zm_devgui::get_upgrade(weapon1.rootweapon);
                    weapon2 = zm_devgui::get_upgrade(weapon2.rootweapon);
                }
                weapon1 = player zm_weapons::give_build_kit_weapon(weapon1);
                weapon2 = player zm_weapons::give_build_kit_weapon(weapon2);
                if (isdefined(level.aat_in_use) && level.aat_in_use && zm_weapons::weapon_supports_aat(weapon1)) {
                    player thread aat::acquire(weapon1);
                    player zm_pap_util::repack_weapon(weapon1, 4);
                }
                if (isdefined(level.aat_in_use) && level.aat_in_use && zm_weapons::weapon_supports_aat(weapon2)) {
                    player thread aat::acquire(weapon2);
                    player zm_pap_util::repack_weapon(weapon2, 4);
                }
                player zm_hero_weapon::function_1bb7f7b1(3);
            }
        }
        array::pop(players, randomint(players.size), 0) giveweapon(getweapon(#"homunculus"));
        if (players.size) {
            array::pop(players, randomint(players.size)) giveweapon(getweapon(#"homunculus"));
        }
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x0
// Checksum 0x24826594, Offset: 0xaa00
// Size: 0x4c
function function_abdd578e() {
    /#
        function_46d7a37();
        level thread function_c11a9d59();
        level function_50aa79cf();
    #/
}

// Namespace mansion_boss_ww/zm_mansion_boss_ww
// Params 0, eflags: 0x0
// Checksum 0xc8aa50cf, Offset: 0xaa58
// Size: 0x62
function function_46d7a37() {
    /#
        if (level.var_80d31f80) {
            /#
                iprintlnbold("<unknown string>");
            #/
            return;
        }
        /#
            iprintlnbold("<unknown string>");
        #/
        level.var_80d31f80 = 1;
    #/
}


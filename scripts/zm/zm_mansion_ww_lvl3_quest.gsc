// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_mansion_util.gsc;
#using scripts\zm\zm_mansion_special_rounds.gsc;
#using scripts\zm\ai\zm_ai_nosferatu.gsc;
#using scripts\zm\ai\zm_ai_bat.gsc;
#using script_1ef0852930d362dc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using script_3e5ec44cfab7a201;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_items.gsc;
#using scripts\zm_common\zm_crafting.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace mansion_ww_lvl3_quest;

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x2
// Checksum 0x6fe9146e, Offset: 0x4c0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"mansion_ww_lvl3_quest", &__init__, &__main__, undefined);
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x80fbbee0, Offset: 0x510
// Size: 0x404
function __init__() {
    if (zm_custom::function_901b751c(#"zmwonderweaponisenabled")) {
        clientfield::register("scriptmover", "" + #"hash_63ffcbb6c8f4bc11", 8000, 1, "int");
        clientfield::register("scriptmover", "" + #"hash_62ee80337662b3cd", 8000, 1, "int");
        clientfield::register("scriptmover", "" + #"hash_7ef82b98770c5c0d", 8000, 1, "int");
        clientfield::register("scriptmover", "" + #"hash_c0e8acbde8dbc06", 8000, 1, "int");
        clientfield::register("vehicle", "" + #"hash_6ded20ebb8e016ba", 8000, 1, "int");
        clientfield::register("scriptmover", "" + #"hash_48c6d058e9587c19", 8000, 1, "int");
        clientfield::register("world", "" + #"hash_19f5ea0e9b3d47f3", 8000, 1, "int");
        clientfield::register("scriptmover", "" + #"hash_486960f190957256", 8000, 1, "int");
        clientfield::register("scriptmover", "" + #"hash_12e4702a9346b3d9", 8000, 1, "int");
        clientfield::register("scriptmover", "" + #"ww_lvl3_crafting_table_fx", 8000, 1, "int");
        zm::register_vehicle_damage_callback(&function_e92f09d0);
        callback::on_vehicle_killed(&function_3da8da85);
        callback::on_actor_killed(&function_9a0471ab);
        level.var_27f4ef2f = &function_ee901070;
        level.var_8b14dbe3 = &function_1b4df249;
        level flag::init("bile_collected");
        level flag::init(#"hash_1d477cd627a495d9");
        level.n_bile = 0;
        var_a70a763b = getentarray("ww_lvl3_quest_piece_on_table", "targetname");
        array::run_all(var_a70a763b, &hide);
        array::run_all(var_a70a763b, &notsolid);
        hidemiscmodels("ww_lvl3_quest_piece_on_table");
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x72ac5737, Offset: 0x920
// Size: 0xec
function __main__() {
    if (zm_custom::function_901b751c(#"zmwonderweaponisenabled")) {
        level thread function_6e094214();
        level thread function_7b5a8c15();
        level thread function_bc8c390e();
        getweapon(#"zitem_chaos_lvl3_part_3").var_62a98b13 = #"hash_3b036955869eed34";
        zm_crafting::function_d1f16587(#"zblueprint_chaos_lvl3", &ww_lvl3_crafted);
        level thread function_25058256();
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params f, eflags: 0x1 linked
// Checksum 0x9972d4ef, Offset: 0xa18
// Size: 0x16c
function function_e92f09d0(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    if (isdefined(self.var_9cf26285) && self.var_9cf26285 && !level flag::get("flag_player_grabbed_catalyst_material")) {
        if (!isdefined(self.var_31fdb1f9)) {
            self.var_31fdb1f9 = 0;
        }
        if (smeansofdeath === "MOD_PROJECTILE") {
            if (weapon === level.var_6fe89212 || weapon === level.var_74cf08b1) {
                self.var_31fdb1f9++;
                if (self.var_31fdb1f9 >= 1 || weapon === level.var_74cf08b1) {
                    return (self.health + 666);
                } else {
                    self thread function_a8fd8406();
                }
            }
        }
        return 0;
    }
    return idamage;
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x8be2cfad, Offset: 0xb90
// Size: 0xdc
function function_3da8da85(params) {
    if ((params.weapon === level.var_6fe89212 || params.weapon === level.var_74cf08b1) && params.smeansofdeath === "MOD_PROJECTILE") {
        if (isdefined(self.var_9cf26285) && self.var_9cf26285 && !level flag::get("flag_player_grabbed_catalyst_material")) {
            v_velocity = self function_58439640();
            if (isdefined(v_velocity)) {
                function_e217ba73(self.origin, v_velocity);
            }
        }
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xf2b93f07, Offset: 0xc78
// Size: 0x32c
function function_e217ba73(v_pos, v_velocity) {
    var_26420508 = util::spawn_model(#"hash_6f97a0d9c769da03", v_pos);
    util::wait_network_frame();
    var_26420508 setscale(2);
    var_26420508 clientfield::set("" + #"hash_c0e8acbde8dbc06", 1);
    e_grenade = level.var_52d4b640 magicgrenadetype(getweapon(#"eq_frag_grenade"), v_pos + vectorscale((0, 0, 1), 16), v_velocity);
    e_grenade makegrenadedud();
    e_grenade ghost();
    e_grenade util::deleteaftertime(8);
    util::wait_network_frame();
    if (isdefined(e_grenade)) {
        var_26420508.origin = e_grenade.origin;
        var_26420508 linkto(e_grenade, "tag_fx");
        while (1) {
            s_waitresult = undefined;
            s_waitresult = e_grenade waittill(#"death", #"grenade_bounce", #"grenade_stuck");
            if (s_waitresult._notify == "death") {
                break;
            } else if (s_waitresult._notify == "grenade_bounce") {
                /#
                    iprintln("<unknown string>");
                #/
                var_1054c42f = function_68a875b(var_26420508.origin);
                if (isdefined(var_1054c42f) && distancesquared(var_1054c42f, var_26420508.origin) < 1024) {
                    level.var_5f2726dc = var_1054c42f;
                    break;
                }
            }
        }
    }
    if (!isdefined(level.var_5f2726dc)) {
        level.var_5f2726dc = function_68a875b(var_26420508.origin);
    }
    if (isdefined(e_grenade)) {
        e_grenade delete();
    }
    var_26420508 delete();
    level thread function_44a776ee();
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xf3e53b71, Offset: 0xfb0
// Size: 0x84
function function_9a0471ab(params) {
    if (self.archetype == #"nosferatu" && !level flag::get("bile_collected") && isdefined(self.var_bd48b030) && self.var_bd48b030) {
        if (isdefined(self)) {
            self thread function_cfffc455();
        }
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x2eef8dae, Offset: 0x1040
// Size: 0x56e
function function_6e094214() {
    level waittill(#"ww_lvl2_crafted");
    level.var_c40da3d5 = struct::get_array("bat_catalyst_starter", "targetname");
    level.var_b7a0ccb2 = [];
    foreach (var_74f1c6f6 in level.var_c40da3d5) {
        if (!isdefined(level.var_b7a0ccb2)) {
            level.var_b7a0ccb2 = [];
        } else if (!isarray(level.var_b7a0ccb2)) {
            level.var_b7a0ccb2 = array(level.var_b7a0ccb2);
        }
        level.var_b7a0ccb2[level.var_b7a0ccb2.size] = struct::get(var_74f1c6f6.target, "targetname");
    }
    level.var_52d4b640 = util::spawn_model("tag_origin");
    while (!level flag::get("flag_player_grabbed_catalyst_material")) {
        level.var_5f2726dc = undefined;
        level.var_52d4b640 clientfield::set("" + #"hash_7ef82b98770c5c0d", 0);
        b_success = function_fc4f1886();
        if (b_success) {
            s_spawn_loc = level.var_52d4b640.var_3bf1ec5a;
            level.var_52d4b640.origin = s_spawn_loc.origin;
            wait(0.2);
            level.var_52d4b640 clientfield::set("" + #"hash_7ef82b98770c5c0d", 1);
            wait(1);
            var_45acb524 = bat::function_2e37549f(1, s_spawn_loc);
            if (isdefined(var_45acb524)) {
                var_45acb524.var_126d7bef = 1;
                var_45acb524.ignore_round_spawn_failsafe = 1;
                var_45acb524.ignore_enemy_count = 1;
                var_45acb524.b_ignore_cleanup = 1;
                var_45acb524.no_powerups = 1;
                var_45acb524 zm_score::function_acaab828();
                /#
                    var_45acb524 thread function_fd7c6bd1();
                #/
                var_45acb524.ignore_nuke = 1;
                var_45acb524.var_9cf26285 = 1;
                var_ba8531b6 = struct::get_array(s_spawn_loc.script_noteworthy, "script_noteworthy");
                var_ba8531b6 = array::exclude(var_ba8531b6, level.var_b7a0ccb2);
                var_9427f9e7 = array::random(var_ba8531b6);
                var_45acb524 notify(#"change_state");
                var_45acb524 thread function_30210e26();
                var_45acb524 function_4999f099(var_9427f9e7);
                if (isalive(var_45acb524)) {
                    var_de7057ea = var_45acb524.origin + vectorscale((0, 0, 1), 640);
                    level.var_52d4b640 clientfield::set("" + #"hash_7ef82b98770c5c0d", 0);
                    var_45acb524 setspeed(var_45acb524.settings.defaultmovespeed);
                    var_45acb524 function_a57c34b7(var_de7057ea, 0, 0);
                    var_45acb524 vehlookat(var_de7057ea);
                    var_45acb524 waittill(#"near_goal", #"death");
                    level.var_52d4b640.origin = var_de7057ea;
                    wait(0.2);
                    level.var_52d4b640 clientfield::set("" + #"hash_7ef82b98770c5c0d", 1);
                    if (isdefined(var_45acb524)) {
                        var_45acb524 delete();
                    }
                }
            }
        }
        wait(90);
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x29ca38a6, Offset: 0x15b8
// Size: 0x2f6
function function_fc4f1886() {
    level.var_c40da3d5 = array::randomize(level.var_c40da3d5);
    var_1fc5672 = 0;
    level.var_12469d5 = undefined;
    while (var_1fc5672 < 4) {
        level.var_52d4b640 thread function_6730d7f4(level.var_c40da3d5[var_1fc5672], var_1fc5672);
        s_waitresult = undefined;
        s_waitresult = level.var_52d4b640 waittill(#"hash_5806ee636b7dafda", #"hash_52349a04253a83b2", #"hash_2b1cabe38e2ce84b");
        if (s_waitresult._notify == #"hash_5806ee636b7dafda") {
            if (s_waitresult.index == var_1fc5672) {
                level.var_c40da3d5[var_1fc5672].mdl_fx clientfield::set("" + #"hash_12e4702a9346b3d9", 0);
                level.var_c40da3d5[var_1fc5672].mdl_fx delete();
                level.var_c40da3d5[var_1fc5672].t_damage delete();
                level.var_52d4b640.var_672fad63 = level.var_c40da3d5[var_1fc5672];
                var_1fc5672++;
                level.var_52d4b640 notify(#"hash_4c246c05db5c64bc");
                if (var_1fc5672 < 4) {
                    level.var_52d4b640 thread function_927ac839();
                }
            } else {
                level.var_52d4b640 notify(#"hash_52349a04253a83b2");
                return 0;
            }
        } else {
            level.var_c40da3d5[var_1fc5672].mdl_fx clientfield::set("" + #"hash_12e4702a9346b3d9", 0);
            level.var_c40da3d5[var_1fc5672].mdl_fx delete();
            level.var_c40da3d5[var_1fc5672].t_damage delete();
            return 0;
        }
    }
    level.var_52d4b640.var_3bf1ec5a = struct::get(level.var_52d4b640.var_672fad63.target, "targetname");
    return 1;
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x9b80aa43, Offset: 0x18b8
// Size: 0xd4
function function_6730d7f4(var_74f1c6f6, var_1fc5672) {
    var_74f1c6f6.script_index = var_1fc5672;
    var_74f1c6f6.mdl_fx = util::spawn_model("tag_origin", var_74f1c6f6.origin);
    var_74f1c6f6.mdl_fx clientfield::set("" + #"hash_12e4702a9346b3d9", 1);
    var_74f1c6f6.t_damage = spawn("trigger_damage_new", var_74f1c6f6.origin, 0, 16, 16);
    self function_afb9c21c(var_74f1c6f6);
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x5777aabe, Offset: 0x1998
// Size: 0x192
function function_afb9c21c(var_74f1c6f6) {
    self endon(#"hash_52349a04253a83b2", #"hash_2b1cabe38e2ce84b");
    while (1) {
        s_waitresult = undefined;
        s_waitresult = var_74f1c6f6.t_damage waittill(#"damage");
        if (isdefined(s_waitresult.attacker) && (!isdefined(level.var_12469d5) || level.var_12469d5 == s_waitresult.attacker) && (s_waitresult.mod === "MOD_PROJECTILE" || s_waitresult.mod === "MOD_PROJECTILE_SPLASH") && (s_waitresult.weapon === level.var_6fe89212 || s_waitresult.weapon === level.var_74cf08b1)) {
            level.var_12469d5 = s_waitresult.attacker;
            self notify(#"hash_5806ee636b7dafda", {#index:var_74f1c6f6.script_index});
            break;
        } else if (level.var_12469d5 !== s_waitresult.attacker) {
            self notify(#"hash_52349a04253a83b2");
        }
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xbc972591, Offset: 0x1b38
// Size: 0x36
function function_927ac839() {
    self endon(#"hash_4c246c05db5c64bc");
    wait(8);
    self notify(#"hash_52349a04253a83b2");
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xadd258bb, Offset: 0x1b78
// Size: 0x18c
function function_30210e26() {
    self endon(#"death");
    b_seen = 0;
    while (!b_seen) {
        if (isdefined(self.var_5a1faad3) && self.var_5a1faad3) {
            foreach (e_active_player in util::get_active_players(#"allies")) {
                if (distance2dsquared(e_active_player.origin, self.origin) < 1638400 && !e_active_player function_80d68e4d(self, 0.9, 0)) {
                    b_seen = 1;
                    break;
                }
            }
        }
        wait(0.5);
    }
    self util::delay_notify(120, #"hash_b59af7576a97635");
    self thread function_7229d73c();
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x10249827, Offset: 0x1d10
// Size: 0x154
function function_7229d73c() {
    self endon(#"death", #"hash_b59af7576a97635");
    a_str_zones = array("zone_cemetery_entrance", "zone_cemetery_path_left", "zone_cemetery_path_right", "zone_cemetery_graveyard", "zone_cemetery_mausoleum", "zone_underground");
    b_continue = 1;
    while (b_continue) {
        b_continue = 0;
        foreach (e_player in util::get_active_players(#"allies")) {
            if (isinarray(a_str_zones, e_player.zone_name)) {
                b_continue = 1;
                break;
            }
        }
        wait(1);
    }
    self delete();
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x191ca6c6, Offset: 0x1e70
// Size: 0x410
function function_4999f099(var_9427f9e7) {
    self endon(#"death", #"hash_b59af7576a97635");
    var_57d9b9a5 = [];
    var_d17bd352 = 1;
    var_6219bef = (0, 0, 1.6 * 256);
    var_409d46fe = 0.5 + 1.6 * 0.1;
    var_daa7e03a = var_409d46fe * 4;
    while (1) {
        self setneargoalnotifydist(64);
        var_dbac44db = var_409d46fe;
        if (var_d17bd352) {
            var_dbac44db = var_daa7e03a;
            var_d17bd352 = 0;
        }
        self setspeed(self.settings.defaultmovespeed * var_dbac44db);
        var_6c9efff0 = var_9427f9e7.origin + var_6219bef + (0, 0, randomintrange(0, 84) * 1.6);
        self function_a57c34b7(var_6c9efff0, 0, 0);
        self vehlookat(var_6c9efff0);
        self.var_5e3ca234 = self.var_3c20808;
        self.var_3c20808 = var_9427f9e7;
        self waittill(#"near_goal");
        wait(randomfloatrange(5, 12));
        self.var_5a1faad3 = 1;
        var_57d9b9a5 = [];
        a_s_locs = struct::get_array(var_9427f9e7.target, "targetname");
        foreach (s_loc in a_s_locs) {
            if (!isdefined(var_57d9b9a5)) {
                var_57d9b9a5 = [];
            } else if (!isarray(var_57d9b9a5)) {
                var_57d9b9a5 = array(var_57d9b9a5);
            }
            var_57d9b9a5[var_57d9b9a5.size] = s_loc;
        }
        a_s_locs = struct::get_array(var_9427f9e7.targetname, "target");
        foreach (s_loc in a_s_locs) {
            if (!isdefined(var_57d9b9a5)) {
                var_57d9b9a5 = [];
            } else if (!isarray(var_57d9b9a5)) {
                var_57d9b9a5 = array(var_57d9b9a5);
            }
            var_57d9b9a5[var_57d9b9a5.size] = s_loc;
        }
        if (isdefined(self.var_5e3ca234)) {
            var_57d9b9a5 = array::exclude(var_57d9b9a5, self.var_5e3ca234);
        }
        var_2bab3af1 = array::random(var_57d9b9a5);
        var_9427f9e7 = var_2bab3af1;
        waitframe(1);
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x0
// Checksum 0x9de53cb9, Offset: 0x2288
// Size: 0x94
function function_fd7c6bd1() {
    /#
        self endon(#"death");
        level waittill(#"hash_348748d248801d6b");
        e_player = getplayers()[0];
        self dodamage(self.health, e_player.origin, e_player, e_player, undefined, "<unknown string>", 0, level.var_6fe89212);
    #/
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 2, eflags: 0x0
// Checksum 0x395d17fd, Offset: 0x2328
// Size: 0x210
function wander_reporter(var_9427f9e7, var_2bab3af1) {
    /#
        self endon(#"death", #"near_goal");
        while (1) {
            var_b2bd87c7 = groundtrace(var_9427f9e7.origin + vectorscale((0, 0, 1), 8), var_9427f9e7.origin + vectorscale((0, 0, -1), 100000), 0, undefined)[#"position"];
            var_e9683beb = groundtrace(var_2bab3af1.origin + vectorscale((0, 0, 1), 8), var_2bab3af1.origin + vectorscale((0, 0, -1), 100000), 0, undefined)[#"position"];
            sphere(groundtrace(self.origin + vectorscale((0, 0, 1), 8), self.origin + vectorscale((0, 0, -1), 100000), 0, self)[#"position"], 4, (1, 0, 0), 1, 1, 4, 12);
            sphere(var_b2bd87c7, 4, (1, 1, 0), 1, 1, 8, 12);
            sphere(var_e9683beb, 8, (0, 1, 0), 1, 1, 8, 12);
            line(var_b2bd87c7, var_e9683beb, (1, 1, 1), 1, 1, 12);
            wait(0.2);
        }
    #/
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xfc966dfa, Offset: 0x2540
// Size: 0x8c
function function_a8fd8406() {
    self notify("7a6f46837cf06d82");
    self endon("7a6f46837cf06d82");
    self endon(#"death");
    self clientfield::set("" + #"hash_6ded20ebb8e016ba", 1);
    wait(0.6);
    self clientfield::set("" + #"hash_6ded20ebb8e016ba", 0);
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x6e6883ff, Offset: 0x25d8
// Size: 0x138
function function_58439640() {
    var_44a24b57 = function_68a875b(self.origin);
    if (isdefined(var_44a24b57)) {
        /#
            sphere(var_44a24b57, 4, (1, 0, 0), 1, 1, 4, 480);
            sphere(self.origin, 16, (1, 1, 0), 1, 1, 4, 480);
            line(self.origin, var_44a24b57, (1, 1, 1), 1, 1, 480);
        #/
        var_e2d0a89 = vectornormalize(var_44a24b57 - self.origin);
        var_e2d0a89 = (var_e2d0a89[0], var_e2d0a89[1], 0);
        var_e2d0a89 = var_e2d0a89 * (self.origin[2] - var_44a24b57[2]) * 0.8;
        return var_e2d0a89;
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf1891ee5, Offset: 0x2718
// Size: 0x2ec
function function_44a776ee() {
    if (!isdefined(level.var_5f2726dc)) {
        return;
    }
    /#
        keys = getarraykeys(level.zones);
        for (i = 0; i < keys.size; i++) {
            zone = level.zones[keys[i]];
            node = function_52c1730(level.var_5f2726dc, zone.nodes, 500);
            if (isdefined(node)) {
                iprintln("<unknown string>" + function_9e72a96(keys[i]));
            }
        }
    #/
    if (isdefined(level.var_b434e769)) {
        level.var_b434e769 delete();
    }
    level.var_5f2726dc = groundtrace(level.var_5f2726dc + vectorscale((0, 0, 1), 8), level.var_5f2726dc + vectorscale((0, 0, -1), 100000), 0, undefined)[#"position"];
    var_b434e769 = util::spawn_model(#"hash_6f97a0d9c769da03", level.var_5f2726dc);
    util::wait_network_frame();
    s_loc = spawnstruct();
    s_loc.origin = level.var_5f2726dc + vectorscale((0, 0, 1), 8);
    if (isdefined(var_b434e769)) {
        level.var_b434e769 = var_b434e769;
        var_b434e769 clientfield::set("" + #"hash_63ffcbb6c8f4bc11", 1);
        var_47323b73 = s_loc zm_unitrigger::create(&function_c7c9f8d3, 96, &function_c73f430e);
        var_47323b73.var_b434e769 = var_b434e769;
        var_b434e769 waittill(#"death");
        zm_unitrigger::unregister_unitrigger(var_47323b73);
        if (isdefined(s_loc)) {
            s_loc struct::delete();
        }
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x6b46d728, Offset: 0x2a10
// Size: 0x144
function function_c73f430e() {
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!zm_utility::can_use(player)) {
            continue;
        }
        if (isdefined(self.stub.var_b434e769) & !level flag::get("flag_player_grabbed_catalyst_material")) {
            self.stub.var_b434e769 delete();
            level zm_ui_inventory::function_7df6bb60(#"ww_p2_2", 1);
            level flag::set("flag_player_grabbed_catalyst_material");
            level.var_52d4b640 notify(#"hash_2b1cabe38e2ce84b");
            level.var_b434e769 = undefined;
            break;
        }
    }
    zm_unitrigger::unregister_unitrigger(self.stub);
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x286a65c9, Offset: 0x2b60
// Size: 0x40c
function function_68a875b(v_pos) {
    if (!isdefined(v_pos)) {
        return;
    }
    v_drop_point = zm_utility::function_b0eeaada(v_pos, 3200);
    if (isdefined(v_drop_point)) {
        if (zm_zonemgr::function_66bf6a43(v_drop_point[#"point"])) {
            /#
                iprintln("<unknown string>");
            #/
            return v_drop_point[#"point"];
        }
        var_f6193a60 = getclosestpointonnavmesh(v_drop_point[#"point"], 256);
        if (isdefined(var_f6193a60)) {
            if (zm_zonemgr::function_66bf6a43(var_f6193a60)) {
                /#
                    iprintln("<unknown string>");
                #/
                return var_f6193a60;
            }
        }
    }
    for (i = 1; i <= 10; i++) {
        var_48dba99e = zm_utility::function_b0eeaada(v_pos + (64 * i * -1, 0, 0), 3200);
        if (isdefined(var_48dba99e)) {
            if (zm_zonemgr::function_66bf6a43(var_48dba99e[#"point"])) {
                /#
                    iprintln("<unknown string>" + 64 * i);
                #/
                return var_48dba99e[#"point"];
            }
        }
        var_dc4239c1 = zm_utility::function_b0eeaada(v_pos + (64 * i, 0, 0), 3200);
        if (isdefined(var_dc4239c1)) {
            if (zm_zonemgr::function_66bf6a43(var_dc4239c1[#"point"])) {
                /#
                    iprintln("<unknown string>" + 64 * i);
                #/
                return var_dc4239c1[#"point"];
            }
        }
        var_f21e9d9b = zm_utility::function_b0eeaada(v_pos + (0, 64 * i, 0), 3200);
        if (isdefined(var_f21e9d9b)) {
            if (zm_zonemgr::function_66bf6a43(var_f21e9d9b[#"point"])) {
                /#
                    iprintln("<unknown string>" + 64 * i);
                #/
                return var_f21e9d9b[#"point"];
            }
        }
        var_23fdc586 = zm_utility::function_b0eeaada(v_pos + (0, 64 * i * -1, 0), 3200);
        if (isdefined(var_23fdc586)) {
            if (zm_zonemgr::function_66bf6a43(var_23fdc586[#"point"])) {
                /#
                    iprintln("<unknown string>" + 64 * i);
                #/
                return var_23fdc586[#"point"];
            }
        }
    }
    /#
        iprintln("<unknown string>");
    #/
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x2b6a5afc, Offset: 0x2f78
// Size: 0x28c
function function_cfffc455() {
    v_loc = self.origin;
    v_angles = self.angles;
    if (!isdefined(v_angles)) {
        v_angles = (0, 0, 0);
    }
    if (isdefined(self.var_bd48b030) && self.var_bd48b030) {
        v_loc = function_68a875b(self.origin);
    }
    if (!isdefined(v_loc) || !isdefined(self)) {
        return;
    }
    v_loc = groundtrace(v_loc + vectorscale((0, 0, 1), 32) + vectorscale((0, 0, 1), 8), v_loc + vectorscale((0, 0, 1), 32) + vectorscale((0, 0, -1), 100000), 0, self)[#"position"];
    if (!isdefined(v_loc)) {
        return;
    }
    v_normal = getnavmeshfacenormal(v_loc, 32);
    if (!isdefined(v_normal)) {
        return;
    }
    var_d43d0ba1 = util::spawn_model(#"hash_36f02781e6db9e53", v_loc + (0, 0, 1));
    util::wait_network_frame();
    if (!isdefined(var_d43d0ba1)) {
        return;
    }
    var_d43d0ba1.angles = function_c1fa62a2(v_angles, v_normal);
    if (isdefined(var_d43d0ba1)) {
        var_d43d0ba1 clientfield::set("" + #"hash_48c6d058e9587c19", 1);
        var_47323b73 = var_d43d0ba1 zm_unitrigger::create(&function_21db5b62, 96);
        var_d43d0ba1 thread function_dca0343();
        s_waitresult = undefined;
        s_waitresult = var_d43d0ba1 waittilltimeout(90, #"bile_delete");
        zm_unitrigger::unregister_unitrigger(var_47323b73);
        if (isdefined(var_d43d0ba1)) {
            var_d43d0ba1 delete();
        }
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xaea9931d, Offset: 0x3210
// Size: 0xac
function function_dca0343() {
    self endon(#"death");
    self thread function_fb72da74();
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger_activated");
        player = waitresult.e_who;
        if (!zm_utility::can_use(player)) {
            continue;
        }
        self thread function_c60245c1(player);
        break;
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xd74fe1b0, Offset: 0x32c8
// Size: 0x46
function function_fb72da74() {
    self endon(#"death");
    level flag::wait_till("bile_collected");
    self notify(#"bile_delete");
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x8ec03588, Offset: 0x3318
// Size: 0xdc
function function_c60245c1(e_player) {
    if (!(isdefined(e_player.var_9b668949) && e_player.var_9b668949)) {
        e_player thread zm_vo::function_a2bd5a0c(#"hash_12fcbcf5f7dfcc6f", 1);
        e_player.var_9b668949 = 1;
    }
    self thread function_366a1f08();
    level.n_bile++;
    level zm_ui_inventory::function_7df6bb60(#"ww_p2_3", level.n_bile);
    if (level.n_bile > 2) {
        level flag::set("bile_collected");
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc343690f, Offset: 0x3400
// Size: 0x76
function function_366a1f08() {
    self endon(#"death");
    self clientfield::set("" + #"hash_48c6d058e9587c19", 0);
    wait(0.1);
    self ghost();
    self notify(#"bile_delete");
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x4fcbe28f, Offset: 0x3480
// Size: 0x68
function function_c7c9f8d3(player) {
    str_prompt = zm_utility::function_d6046228(#"hash_4adb4ee2a021cc5f", #"hash_390f9a902256dcbd");
    self sethintstringforplayer(player, str_prompt);
    return 1;
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x8a19ef43, Offset: 0x34f0
// Size: 0x68
function function_21db5b62(player) {
    str_prompt = zm_utility::function_d6046228(#"hash_1ad9cccccf49590a", #"hash_43ddac2161b2260e");
    self sethintstringforplayer(player, str_prompt);
    return 1;
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x487ed26a, Offset: 0x3560
// Size: 0xdc
function function_7b5a8c15() {
    level flag::wait_till("bile_collected");
    callback::remove_on_ai_killed(&function_9a0471ab);
    s_summon = struct::get("summon_crm_nos");
    exploder::exploder("fxexp_crypt_glow");
    var_47323b73 = s_summon zm_unitrigger::create(&function_13547ea4, 64);
    s_summon thread function_9d36c592();
    s_summon thread function_5ccad751();
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf38968a9, Offset: 0x3648
// Size: 0x116
function function_5ccad751() {
    self endoncallback(&function_5ce9ff7a, #"hash_3a35866d24190abf", #"death");
    while (1) {
        var_1445d063 = array::get_all_closest(self.origin, util::get_active_players(#"allies"), undefined, 4, 1024);
        if (var_1445d063.size) {
            level clientfield::set("" + #"hash_19f5ea0e9b3d47f3", 1);
        } else {
            level clientfield::set("" + #"hash_19f5ea0e9b3d47f3", 0);
        }
        wait(1);
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xdfeb3c04, Offset: 0x3768
// Size: 0x4c
function function_5ce9ff7a(s_notify) {
    level thread util::delay(10, undefined, &clientfield::set, "" + #"hash_19f5ea0e9b3d47f3", 0);
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xd0d107e0, Offset: 0x37c0
// Size: 0x68
function function_13547ea4(player) {
    str_prompt = zm_utility::function_d6046228(#"hash_1c45ec9f9414b664", #"hash_7d81ba22ba54bb08");
    self sethintstringforplayer(player, str_prompt);
    return 1;
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xac6cd5c, Offset: 0x3830
// Size: 0x130
function function_9d36c592() {
    self endon(#"hash_3a35866d24190abf");
    s_loc = struct::get("nosferatu_pos");
    s_bile = struct::get("s_bile");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger_activated");
        player = waitresult.e_who;
        if (player zm_utility::in_revive_trigger()) {
            continue;
        }
        if (player zm_utility::is_drinking()) {
            continue;
        }
        if (isdefined(player.var_564dec14) && player.var_564dec14) {
            continue;
        }
        if (!zm_utility::is_player_valid(player)) {
            continue;
        }
        self thread function_d8648a1e(player);
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xfda23c78, Offset: 0x3968
// Size: 0x1d4
function function_d8648a1e(e_player) {
    level flag::set("flag_crimson_nosferatu_set_intro");
    level zm_ui_inventory::function_7df6bb60(#"ww_p2_3", 0);
    s_loc = struct::get("nosferatu_pos");
    s_bile = struct::get("s_bile");
    self.var_76a23f3 = util::spawn_model(#"hash_36f02881e6dba006", s_bile.origin, s_bile.angles);
    ai_nosferatu = zm_ai_nosferatu::function_74f25f8a(1, s_loc, 1, 35);
    if (isalive(ai_nosferatu)) {
        ai_nosferatu.var_126d7bef = 1;
        ai_nosferatu.ignore_round_spawn_failsafe = 1;
        ai_nosferatu.ignore_enemy_count = 1;
        ai_nosferatu.b_ignore_cleanup = 1;
        ai_nosferatu.ignore_nuke = 1;
        callback::on_ai_killed(&function_be3fbc6f);
        ai_nosferatu thread function_42c889b7(e_player);
        e_player thread function_c1c2fc5b(6);
        self notify(#"hash_3a35866d24190abf");
        zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x5b18d526, Offset: 0x3b48
// Size: 0x134
function function_42c889b7(e_player) {
    level thread scene::init(#"aib_vign_cust_mnsn_crmsn_nfrtu_spawn_01", self);
    level thread scene::play(#"p8_fxanim_zm_man_grave_lid_break_bundle");
    level waittill(#"hash_771956e8f5a4a301");
    scene::add_scene_func(#"aib_vign_cust_mnsn_crmsn_nfrtu_spawn_01", &function_79b81681, "play");
    scene::add_scene_func(#"aib_vign_cust_mnsn_crmsn_nfrtu_spawn_01", &function_2c0edc3d, "done");
    level thread scene::play(#"aib_vign_cust_mnsn_crmsn_nfrtu_spawn_01", self);
    exploder::stop_exploder("fxexp_crypt_glow");
    self waittill(#"summon_minions");
    function_d2278936(e_player);
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x55a831b3, Offset: 0x3c88
// Size: 0x7a
function function_79b81681(a_ents) {
    if (isactor(a_ents[#"actor 1"])) {
        a_ents[#"actor 1"].var_7b0667d9 = 1;
        a_ents[#"actor 1"].blockingpain = 1;
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb398776d, Offset: 0x3d10
// Size: 0x7a
function function_2c0edc3d(a_ents) {
    waitframe(1);
    if (isalive(a_ents[#"actor 1"])) {
        a_ents[#"actor 1"].var_7b0667d9 = undefined;
        a_ents[#"actor 1"].blockingpain = 0;
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x44aaf57a, Offset: 0x3d98
// Size: 0x266
function function_d2278936(e_player) {
    a_players = getplayers();
    switch (a_players.size) {
    case 1:
        n_enemy_count = 8;
        n_wait_min = 2.25;
        n_wait_max = 2.75;
        break;
    case 2:
        n_enemy_count = 16;
        n_wait_min = 1.75;
        n_wait_max = 2.25;
        break;
    case 3:
        n_enemy_count = 24;
        n_wait_min = 1.25;
        n_wait_max = 1.75;
        break;
    case 4:
        n_enemy_count = 32;
        n_wait_min = 0.75;
        n_wait_max = 1.25;
        break;
    }
    for (i = 0; i < n_enemy_count; i++) {
        s_spawn_loc = zm_ai_nosferatu::function_6502a84d();
        if (isdefined(s_spawn_loc)) {
            ai_nosferatu = zm_ai_nosferatu::function_74f25f8a(1, s_spawn_loc, 0, level.round_number);
            if (isdefined(ai_nosferatu)) {
                ai_nosferatu.var_126d7bef = 1;
                ai_nosferatu.ignore_round_spawn_failsafe = 1;
                ai_nosferatu.ignore_enemy_count = 1;
                ai_nosferatu.b_ignore_cleanup = 1;
                ai_nosferatu.no_powerups = 1;
                if (isdefined(e_player)) {
                    ai_nosferatu.favoriteenemy = e_player;
                }
                ai_nosferatu zm_score::function_acaab828();
                ai_nosferatu forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
                s_spawn_loc = undefined;
                wait(randomfloatrange(n_wait_min, n_wait_max));
            }
        }
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x4a17c487, Offset: 0x4008
// Size: 0x1ec
function function_be3fbc6f(s_params) {
    if (self.var_9fde8624 === #"crimson_nosferatu" && isplayer(s_params.eattacker) && level flag::get("flag_crimson_nosferatu_set_intro") && !level flag::get("flag_player_grabbed_nosferatu_material")) {
        s_loc = spawnstruct();
        s_loc.origin = self.origin;
        s_loc.angles = self.angles;
        var_7162cf15 = function_68a875b(s_loc.origin);
        if (isdefined(var_7162cf15)) {
            s_loc.origin = var_7162cf15;
        } else {
            s_loc.origin = getclosestpointonnavmesh(struct::get("nosferatu_pos").origin, 256, 32);
        }
        s_loc.origin = groundtrace(s_loc.origin + vectorscale((0, 0, 1), 32) + vectorscale((0, 0, 1), 8), s_loc.origin + vectorscale((0, 0, 1), 32) + vectorscale((0, 0, -1), 100000), 0, self)[#"position"];
        level thread function_6f3f4e18(s_loc);
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x9f3951ef, Offset: 0x4200
// Size: 0x374
function function_6f3f4e18(s_loc) {
    if (!isdefined(level.var_8e7ee650)) {
        level.var_8e7ee650 = [];
    } else if (!isarray(level.var_8e7ee650)) {
        level.var_8e7ee650 = array(level.var_8e7ee650);
    }
    array::remove_undefined(level.var_8e7ee650, 0);
    if (level.var_8e7ee650.size >= 1) {
        return;
    }
    s_loc endoncallback(&function_7b8d385, #"hash_3cead30b0acc91c1");
    s_loc util::delay_notify(120, #"hash_3cead30b0acc91c1");
    s_loc.var_817342a7 = util::spawn_model(#"c_t8_zmb_dlc1_nosferatu_humanoid_chaos_drop", s_loc.origin, s_loc.angles);
    if (!isdefined(level.var_8e7ee650)) {
        level.var_8e7ee650 = [];
    } else if (!isarray(level.var_8e7ee650)) {
        level.var_8e7ee650 = array(level.var_8e7ee650);
    }
    level.var_8e7ee650[level.var_8e7ee650.size] = s_loc;
    util::wait_network_frame();
    s_loc.var_817342a7 clientfield::set("" + #"hash_62ee80337662b3cd", 1);
    playsoundatposition(#"zmb_sq_souls_release", s_loc.var_817342a7.origin);
    s_loc.origin = s_loc.origin + vectorscale((0, 0, 1), 8);
    e_holder = s_loc zm_unitrigger::function_fac87205(&function_fdc93dd2, 64);
    if (!level flag::get("flag_player_grabbed_nosferatu_material")) {
        e_holder thread zm_vo::function_a2bd5a0c(#"hash_31e2f2fbfc612834", 1);
        level zm_ui_inventory::function_7df6bb60(#"ww_p2_3", 4);
        s_loc.var_817342a7 delete();
        s_loc struct::delete();
        level.var_8e7ee650 = undefined;
        level flag::set("flag_player_grabbed_nosferatu_material");
        callback::remove_on_ai_killed(&function_be3fbc6f);
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x4d350f76, Offset: 0x4580
// Size: 0x94
function function_7b8d385(s_notify) {
    if (isdefined(self.var_817342a7)) {
        self.var_817342a7 delete();
    }
    if (isdefined(self.s_unitrigger)) {
        zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    }
    arrayremovevalue(level.var_8e7ee650, self);
    self struct::delete();
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x2311e7fb, Offset: 0x4620
// Size: 0xb0
function function_fdc93dd2(player) {
    if (!level flag::get("flag_player_grabbed_nosferatu_material")) {
        str_prompt = zm_utility::function_d6046228(#"hash_33e523e840caec34", #"hash_2bc1f0690d248b98");
        self sethintstringforplayer(player, str_prompt);
    } else {
        self sethintstringforplayer(player, "");
    }
    return 1;
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xc49da8b6, Offset: 0x46d8
// Size: 0x278
function function_c1c2fc5b(n_to_spawn) {
    n_spawned = 0;
    var_f1c4ec4f = self zm_utility::get_current_zone(1);
    if (!isdefined(var_f1c4ec4f)) {
        return;
    }
    var_8deb2034 = var_f1c4ec4f.a_loc_types[#"bat_location"];
    foreach (var_c92978fa in getarraykeys(var_f1c4ec4f.adjacent_zones)) {
        var_c714ccfe = level.zones[var_c92978fa];
        var_9387e4ab = var_c714ccfe.a_loc_types[#"bat_location"];
        if (isdefined(var_9387e4ab)) {
            foreach (s_spawner in var_9387e4ab) {
                if (!isdefined(var_8deb2034)) {
                    var_8deb2034 = [];
                } else if (!isarray(var_8deb2034)) {
                    var_8deb2034 = array(var_8deb2034);
                }
                var_8deb2034[var_8deb2034.size] = s_spawner;
            }
        }
    }
    while (n_spawned < n_to_spawn) {
        s_pos = array::random(var_8deb2034);
        if (isdefined(s_pos)) {
            ai = bat::function_2e37549f(1, s_pos, level.round_number);
            if (isdefined(ai)) {
                arrayremovevalue(var_8deb2034, s_pos);
                n_spawned++;
                zm_mansion_special_rounds::function_f46db405();
            }
        }
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xfe8f228, Offset: 0x4958
// Size: 0x234
function function_ee901070(e_attacker) {
    self endon(#"death");
    e_attacker endoncallback(&function_ff107ee6, #"death");
    if (isdefined(self.var_3ca04328) && self.var_3ca04328 && (!level flag::get(#"hash_1d477cd627a495d9") || !isdefined(e_attacker.var_cbdbce01)) && isdefined(self function_2e1a2c88()) && self function_2e1a2c88()) {
        if (!isdefined(level.var_105c6f35)) {
            level.var_105c6f35 = [];
        } else if (!isarray(level.var_105c6f35)) {
            level.var_105c6f35 = array(level.var_105c6f35);
        }
        level.var_105c6f35[level.var_105c6f35.size] = self;
        e_attacker.var_cbdbce01 = self;
        self.var_b8391660 = 0;
        level flag::set(#"hash_1d477cd627a495d9");
        self thread function_a167efd7();
        self thread namespace_82497b8a::function_b47bcfb0(e_attacker, 60);
        while (1) {
            if (!self.var_b8391660) {
                self.n_zombie_custom_goal_radius = 96;
                self.v_zombie_custom_goal_pos = e_attacker.origin;
            }
            wait(1);
        }
    } else if (isinarray(level.var_105c6f35, self)) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x4b1eab7d, Offset: 0x4b98
// Size: 0x34
function function_ff107ee6(str_notify) {
    if (isdefined(self.var_cbdbce01)) {
        self.var_cbdbce01 notify(#"hash_28e3235da53ba083");
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x40883a2a, Offset: 0x4bd8
// Size: 0x9e
function function_2e1a2c88() {
    a_str_zones = array("zone_forest_entrance", "zone_forest_s", "zone_forest_se", "zone_forest_center", "zone_forest_nw", "zone_forest_n");
    str_zone = zm_utility::get_current_zone();
    if (isdefined(str_zone) && isinarray(a_str_zones, str_zone)) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x13b84ec1, Offset: 0x4c80
// Size: 0x120
function function_bc8c390e() {
    level.var_105c6f35 = [];
    var_7846fbf = struct::get_array("ww_lvl3_part_3_pos");
    var_7846fbf = array::randomize(var_7846fbf);
    var_7846fbf[0].var_3dd3b66e = 1;
    foreach (var_bcc0d06a in var_7846fbf) {
        var_bcc0d06a.var_ac144521 = 0;
        var_bcc0d06a.var_b92834ee = util::spawn_model("tag_origin", var_bcc0d06a.origin + vectorscale((0, 0, -1), 16));
        var_bcc0d06a thread function_de394c52();
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xd0bb0a5a, Offset: 0x4da8
// Size: 0x68
function function_de394c52() {
    while (!self.var_ac144521) {
        level flag::wait_till(#"hash_1d477cd627a495d9");
        self thread function_4eca0031();
        level flag::wait_till_clear(#"hash_1d477cd627a495d9");
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x4147605a, Offset: 0x4e18
// Size: 0x11c
function function_4eca0031() {
    level endon(#"hash_5966d6342dbd6f82");
    var_f1935ec8 = getclosestpointonnavmesh(self.origin, 128);
    while (1) {
        foreach (var_f8a1403f in level.var_105c6f35) {
            if (isdefined(var_f8a1403f) && !var_f8a1403f.var_b8391660 && distance2dsquared(var_f1935ec8, var_f8a1403f.origin) < 10000) {
                var_f8a1403f thread function_a2256244(self, var_f1935ec8);
            }
        }
        wait(0.1);
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x0
// Checksum 0xeeb110a6, Offset: 0x4f40
// Size: 0x98
function function_75636add(var_f1935ec8) {
    /#
        self endon(#"death", #"goal");
        while (1) {
            sphere(var_f1935ec8, 8, (1, 0, 0), 1, 0, 4, 10);
            line(self.origin, var_f1935ec8, (1, 1, 1), 1, 0, 10);
            wait(0.2);
        }
    #/
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xc5e3bade, Offset: 0x4fe0
// Size: 0x1e6
function function_a2256244(var_f9105ee8, var_f1935ec8) {
    self endon(#"death");
    /#
        self thread function_75636add(var_f1935ec8);
    #/
    self.var_b8391660 = 1;
    self.n_zombie_custom_goal_radius = 16;
    self.v_zombie_custom_goal_pos = var_f1935ec8;
    self waittill(#"goal");
    var_f9105ee8.var_b92834ee thread function_6a21ff38();
    self scene::play(#"aib_vign_zm_mnsn_zombie_dig_up", self);
    var_f9105ee8.var_b92834ee clientfield::set("" + #"hash_486960f190957256", 0);
    var_f9105ee8.var_ac144521 = 1;
    hidemiscmodels(var_f9105ee8.script_noteworthy);
    if (isdefined(var_f9105ee8.var_3dd3b66e) && var_f9105ee8.var_3dd3b66e) {
        w_item = zm_crafting::get_component("zitem_chaos_lvl3_part_3");
        w_part = zm_items::spawn_item(w_item, var_f9105ee8.origin, var_f9105ee8.angles, 1);
        level.var_27f4ef2f = undefined;
        w_part clientfield::set("" + #"ww_pickup_part", 1);
    }
    wait(2);
    self notify(#"hash_28e3235da53ba083");
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x451de41, Offset: 0x51d0
// Size: 0x34
function function_6a21ff38() {
    wait(1);
    self clientfield::set("" + #"hash_486960f190957256", 1);
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x460cc32f, Offset: 0x5210
// Size: 0xb0
function function_a167efd7() {
    self waittill(#"death");
    if (isdefined(self)) {
        level.var_105c6f35 = array::exclude(level.var_105c6f35, self);
    }
    level.var_105c6f35 = array::remove_undefined(level.var_105c6f35);
    if (!level.var_105c6f35.size) {
        level flag::clear(#"hash_1d477cd627a495d9");
        level notify(#"hash_5966d6342dbd6f82");
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x409407b8, Offset: 0x52c8
// Size: 0x2e
function function_1b4df249() {
    if (isinarray(level.var_105c6f35, self)) {
        return 0;
    }
    return 1;
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc99d4271, Offset: 0x5300
// Size: 0xa2
function function_25058256() {
    level flagsys::wait_till(#"load_main_complete");
    foreach (s_stub in level.var_4fe2f84d[#"zblueprint_chaos_lvl3"]) {
        s_stub.var_c060d2c8 = 0;
    }
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x6a695da8, Offset: 0x53b0
// Size: 0x14e
function ww_lvl3_crafted(e_player) {
    var_a70a763b = getentarray("ww_lvl3_quest_piece_on_table", "targetname");
    array::run_all(var_a70a763b, &show);
    showmiscmodels("ww_lvl3_quest_piece_on_table");
    unitrigger_stub = self.stub;
    if (!isdefined(unitrigger_stub.var_1a95256)) {
        unitrigger_stub thread function_c834e06();
    }
    e_player zm_weapons::weapon_take(level.var_6fe89212);
    e_player thread zm_vo::function_a2bd5a0c(#"hash_1bee1f8c64cef00f", 1);
    e_player zm_weapons::weapon_give(unitrigger_stub.blueprint.var_54a97edd);
    wait(0.1);
    unitrigger_stub zm_crafting::reset_table();
    unitrigger_stub.prompt_and_visibility_func = &function_7aa50bb7;
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xb92a1500, Offset: 0x5508
// Size: 0xac
function function_c834e06() {
    s_fx_pos = struct::get("ww_lvl3_crafting_table_fx", "targetname");
    self.var_1a95256 = util::spawn_model("tag_origin", s_fx_pos.origin, s_fx_pos.angles);
    util::wait_network_frame();
    self.var_1a95256 clientfield::set("" + #"ww_lvl3_crafting_table_fx", 1);
}

// Namespace mansion_ww_lvl3_quest/zm_mansion_ww_lvl3_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x5184fc5, Offset: 0x55c0
// Size: 0xe8
function function_7aa50bb7(e_player) {
    can_use = self.stub zm_crafting::function_18f2be60(e_player);
    if (e_player zm_weapons::has_weapon_or_upgrade(level.var_7b9ca97a)) {
        self sethintstring("");
    } else if (e_player zm_weapons::has_weapon_or_upgrade(level.var_6fe89212)) {
        self sethintstring(self.stub.blueprint.var_4dbc4aee);
    } else {
        self sethintstring(#"hash_652c97821a6cf09d");
    }
    return can_use;
}


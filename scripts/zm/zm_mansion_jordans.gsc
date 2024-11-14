#using scripts\zm\zm_mansion_util;
#using scripts\zm\zm_mansion;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\values_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\struct;
#using scripts\core_common\scene_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\fx_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;

#namespace mansion_jordans;

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x87d0373d, Offset: 0x268
// Size: 0x174
function init() {
    clientfield::register("scriptmover", "" + #"hash_54cceab249a41cde", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_336942eaf5fcd809", 8000, 1, "int");
    /#
        clientfield::register("<dev string:x38>", "<dev string:x46>" + #"hash_3efe70d8ad68a07d", 8000, 4, "<dev string:x49>");
        clientfield::register("<dev string:x38>", "<dev string:x46>" + #"hash_4d30672cd0a2ef31", 8000, 1, "<dev string:x49>");
    #/
    register_steps();
    zm_sq::start(#"zm_jordans_painting");
    zm_sq::start(#"zm_jordans_reward");
    level thread function_da66169f();
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0xf7fa9513, Offset: 0x3e8
// Size: 0x244
function register_steps() {
    zm_sq::register(#"zm_jordans_painting", #"step_1", #"hash_21ed75bc8122939c", &function_f62d9f65, &function_6134319c);
    zm_sq::register(#"zm_jordans_reward", #"step_1", #"hash_af33b9072da5dc1", &function_653412f4, &function_f1611d1);
    zm_sq::register(#"zm_jordans_reward", #"step_2", #"hash_af3389072da58a8", &function_db5aff40, &function_4056f452);
    zm_sq::register(#"zm_jordans_reward", #"step_3", #"hash_af3399072da5a5b", &function_c7da583f, &function_2a93c8cc);
    zm_sq::register(#"zm_jordans_reward", #"step_4", #"hash_af33e9072da62da", &function_ae072499, &function_57e9237a);
    zm_sq::register(#"zm_jordans_reward", #"step_5", #"hash_af33f9072da648d", &function_9c3b8102, &function_4a0f87c7);
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x757032c1, Offset: 0x638
// Size: 0x44
function function_da66169f() {
    level flagsys::wait_till("start_zombie_round_logic");
    if (!isdefined(level.var_46169cd9)) {
        function_23da5626();
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0xf8b75dd2, Offset: 0x688
// Size: 0x2a4
function function_653412f4(var_a276c861) {
    level.var_46169cd9 = 0;
    level.w_homunculus = getweapon(#"homunculus");
    level.w_mini_turret = getweapon(#"mini_turret");
    level.w_claymore = getweapon(#"claymore");
    callback::on_connect(&function_dd162dbf);
    level flagsys::wait_till("start_zombie_round_logic");
    /#
        function_c9854faa();
    #/
    function_23da5626();
    level flag::init(#"hash_2311d328e336b7d");
    level.var_a690f86 = struct::get_array(#"jordans_reward_doa", "targetname");
    array::thread_all(level.var_a690f86, &function_9f6a9379);
    level.var_72b665d8 = 6;
    level.var_93aa61b1 = struct::get_array(#"jordans_reward_narcos", "targetname");
    function_21334921();
    level.var_403919f2 = array::sort_by_script_int(level.var_403919f2, 1);
    /#
        foreach (var_dc175e4d in level.var_403919f2) {
            if (isdefined(var_dc175e4d.mdl_vase)) {
                var_dc175e4d.mdl_vase thread function_95b6c945();
            }
        }
    #/
    if (!var_a276c861) {
        level waittill(#"hash_75e5d46ef453bd62");
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0x881a709b, Offset: 0x938
// Size: 0x1aa
function function_f1611d1(var_a276c861, ended_early) {
    callback::remove_on_connect(&function_dd162dbf);
    foreach (var_4ef73a79 in level.var_403919f2) {
        if (isdefined(var_4ef73a79.mdl_vase)) {
            var_4ef73a79.mdl_vase delete();
        }
        if (isdefined(var_4ef73a79.var_d7e8ee3e)) {
            var_4ef73a79.var_d7e8ee3e delete();
        }
    }
    if (var_a276c861 || ended_early) {
        var_4ef294d8 = int(6 / getplayers().size);
        foreach (e_player in getplayers()) {
            e_player.var_c859fa3a = var_4ef294d8;
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x115f3c1c, Offset: 0xaf0
// Size: 0x31e
function function_23da5626() {
    level.var_403919f2 = getentarray("jordans_reward_merciless", "targetname");
    level.var_22aacd56 = level.var_403919f2.size;
    foreach (var_4ef73a79 in level.var_403919f2) {
        s_vase = struct::get(var_4ef73a79.target, "targetname");
        mdl_vase = util::spawn_model(s_vase.model, s_vase.origin, s_vase.angles);
        mdl_vase setscale(s_vase.modelscale);
        var_4ef73a79.mdl_vase = mdl_vase;
        var_d7e8ee3e = getent(var_4ef73a79.target, "targetname");
        var_4ef73a79.var_d7e8ee3e = var_d7e8ee3e;
    }
    level.var_1c929a74 = struct::get_array(#"jordans_reward_randall", "targetname");
    foreach (var_c453fc76 in level.var_1c929a74) {
        mdl_candle = util::spawn_model(var_c453fc76.model, var_c453fc76.origin, var_c453fc76.angles);
        var_3a75e57c = struct::get(var_c453fc76.target, "targetname");
        var_a38bb9a8 = util::spawn_model(var_3a75e57c.model, var_3a75e57c.origin, var_3a75e57c.angles);
        var_c453fc76.mdl_candle = mdl_candle;
        var_c453fc76.var_a38bb9a8 = var_a38bb9a8;
        var_c453fc76.mdl_candle clientfield::set("" + #"hash_54cceab249a41cde", 1);
        var_c453fc76.b_lit = 1;
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x51ceb97f, Offset: 0xe18
// Size: 0x366
function function_21334921() {
    var_519cd38c = array(#"connect_main_hall_to_forest_entrance", #"connect_ground_floor_to_cellar", #"connect_main_hall_to_library", #"connect_main_hall_to_dining_room", #"connect_library_to_cemetery_entrance", #"connect_dining_room_to_greenhouse_entrance");
    n_count = 0;
    while (n_count < level.var_403919f2.size) {
        s_waitresult = level waittill(var_519cd38c);
        switch (s_waitresult._notify) {
        case #"connect_main_hall_to_forest_entrance":
            var_4ef73a79 = function_54765bde(0, 0);
            s_candle = function_54765bde(0, 1);
            break;
        case #"connect_ground_floor_to_cellar":
            var_4ef73a79 = function_54765bde(1, 0);
            s_candle = function_54765bde(1, 1);
            break;
        case #"connect_main_hall_to_library":
            var_4ef73a79 = function_54765bde(2, 0);
            s_candle = function_54765bde(2, 1);
            break;
        case #"connect_main_hall_to_dining_room":
            var_4ef73a79 = function_54765bde(3, 0);
            s_candle = function_54765bde(3, 1);
            break;
        case #"connect_library_to_cemetery_entrance":
            var_4ef73a79 = function_54765bde(4, 0);
            s_candle = function_54765bde(4, 1);
            break;
        case #"connect_dining_room_to_greenhouse_entrance":
            var_4ef73a79 = function_54765bde(5, 0);
            s_candle = function_54765bde(5, 1);
            break;
        default:
            assert("<dev string:x4f>");
            break;
        }
        if (isdefined(var_4ef73a79)) {
            var_4ef73a79.script_int = n_count;
            /#
                if (isdefined(var_4ef73a79.mdl_vase)) {
                    var_4ef73a79.mdl_vase.script_int = n_count;
                }
            #/
        }
        n_count++;
        if (isdefined(s_candle)) {
            s_candle.script_int = level.var_403919f2.size - n_count;
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0x1d98863f, Offset: 0x1188
// Size: 0xea
function function_54765bde(var_11a2d7c6, var_8750fd81) {
    switch (var_8750fd81) {
    case 0:
        var_2c5a2dcc = level.var_403919f2;
        break;
    case 1:
        var_2c5a2dcc = level.var_1c929a74;
        break;
    }
    foreach (e_thing in var_2c5a2dcc) {
        if (e_thing.script_index === var_11a2d7c6) {
            return e_thing;
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x70b365a7, Offset: 0x1280
// Size: 0xbc
function function_dd162dbf() {
    self notify("21a67d99777d1f78");
    self endon("21a67d99777d1f78");
    level endon(#"hash_75e5d46ef453bd62");
    self endon(#"disconnect");
    if (!isdefined(self.var_c859fa3a)) {
        self.var_c859fa3a = 0;
    }
    self thread grenade_throw_watcher();
    while (true) {
        s_waitresult = self waittill(#"hash_5bef9c261ba48023");
        if (isdefined(self)) {
            self.var_c859fa3a++;
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x914ba7be, Offset: 0x1348
// Size: 0xf8
function grenade_throw_watcher() {
    self notify("3cf135e64119b4db");
    self endon("3cf135e64119b4db");
    level endon(#"hash_75e5d46ef453bd62");
    self endon(#"disconnect");
    while (true) {
        s_waitresult = self waittill(#"grenade_fire");
        e_grenade = s_waitresult.projectile;
        if (e_grenade.weapon !== level.w_homunculus && e_grenade.weapon !== level.w_mini_turret && e_grenade.weapon !== level.w_claymore) {
            self thread function_fefbf8c2(e_grenade);
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0x3a62f5aa, Offset: 0x1448
// Size: 0x2fc
function function_fefbf8c2(e_grenade) {
    /#
        iprintln("<dev string:x67>" + self.playernum + "<dev string:x6b>");
    #/
    s_waitresult = e_grenade waittill(#"explode", #"death");
    if (s_waitresult._notify === #"explode") {
        if (isdefined(s_waitresult.position)) {
            v_gren_pos = s_waitresult.position;
            foreach (var_4ef73a79 in level.var_403919f2) {
                var_a878db9b = 0;
                s_vase = struct::get(var_4ef73a79.target, "targetname");
                if (isdefined(s_vase)) {
                    n_z_diff = v_gren_pos[2] - s_vase.origin[2];
                    if (n_z_diff >= 0 && n_z_diff <= 30 && distance2dsquared(v_gren_pos, s_vase.origin) < 121) {
                        var_a878db9b = 1;
                    }
                }
                if (var_a878db9b) {
                    playsoundatposition(#"hash_61a756bc7b27f7", v_gren_pos);
                    if (isdefined(var_4ef73a79.mdl_vase)) {
                        var_4ef73a79.mdl_vase delete();
                    }
                    if (isdefined(var_4ef73a79.var_d7e8ee3e)) {
                        var_4ef73a79.var_d7e8ee3e delete();
                    }
                    if (var_4ef73a79.script_int === level.var_46169cd9) {
                        level.var_46169cd9++;
                        level.var_403919f2[var_4ef73a79.script_int] notify(#"step_done");
                        if (isdefined(self)) {
                            self notify(#"hash_5bef9c261ba48023");
                        }
                        wait 0.1;
                        if (level.var_46169cd9 >= level.var_22aacd56) {
                            level notify(#"hash_75e5d46ef453bd62");
                        }
                    }
                }
            }
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0xf876e5e9, Offset: 0x1750
// Size: 0x264
function function_db5aff40(var_a276c861) {
    if (!var_a276c861) {
        level.var_d4854b67 = 0;
        level.var_1c929a74 = array::sort_by_script_int(level.var_1c929a74, 1);
        foreach (var_c453fc76 in level.var_1c929a74) {
            var_c453fc76 function_5a7f565a();
            var_c453fc76 thread function_8ead19be();
            /#
                var_c453fc76 thread function_95b6c945();
            #/
        }
        array::thread_all(util::get_active_players(#"allies"), &function_3a57d343);
        callback::on_spawned(&function_3a57d343);
        while (level.var_d4854b67 < level.var_1c929a74.size) {
            s_waitresult = level waittill(#"hash_13411a5231901c2e");
            if (s_waitresult.var_8ee6e347 === level.var_d4854b67) {
                level.var_d4854b67++;
                continue;
            }
            level.var_d4854b67 = -1;
            foreach (var_c453fc76 in level.var_1c929a74) {
                if (var_c453fc76.script_int != s_waitresult.var_8ee6e347) {
                    var_c453fc76 function_5a7f565a();
                }
            }
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0x40e5c0a0, Offset: 0x19c0
// Size: 0xb4
function function_4056f452(var_a276c861, ended_early) {
    foreach (var_c453fc76 in level.var_1c929a74) {
        var_c453fc76 function_b094be90(1);
    }
    callback::remove_on_spawned(&function_3a57d343);
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x28226dc9, Offset: 0x1a80
// Size: 0x154
function function_8ead19be() {
    level endon(#"game_ended");
    self endon(#"step_done");
    self thread function_84eca8f8();
    self.mdl_candle setcandamage(1);
    self.mdl_candle.health = 9999;
    while (true) {
        s_waitresult = self.mdl_candle waittill(#"damage");
        self.mdl_candle.health = 9999;
        if (!self.b_lit) {
            if (isplayer(s_waitresult.attacker) && (s_waitresult.mod === "MOD_BURNED" || s_waitresult.mod === "MOD_PROJECTILE_SPLASH" || s_waitresult.mod === "MOD_EXPLOSIVE")) {
                self function_b094be90();
                break;
            }
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0xba9988bb, Offset: 0x1be0
// Size: 0x2aa
function function_84eca8f8() {
    level endon(#"game_ended");
    self endon(#"step_done");
    var_4acd2b1 = self.origin + (0, 0, 8);
    while (true) {
        if (!self.b_lit) {
            var_6b43c32f = [];
            foreach (e_player in util::get_active_players(#"allies")) {
                if (isdefined(e_player.var_1de56cc8) && e_player.var_1de56cc8) {
                    if (!isdefined(var_6b43c32f)) {
                        var_6b43c32f = [];
                    } else if (!isarray(var_6b43c32f)) {
                        var_6b43c32f = array(var_6b43c32f);
                    }
                    var_6b43c32f[var_6b43c32f.size] = e_player;
                }
            }
            foreach (var_774bf522 in var_6b43c32f) {
                v_position = var_774bf522 getweaponmuzzlepoint();
                v_forward = v_position + var_774bf522 getweaponforwarddir() * 1600;
                var_b2171ef7 = pointonsegmentnearesttopoint(v_position, v_forward, var_4acd2b1);
                if (distancesquared(var_b2171ef7, var_4acd2b1) < 10 && beamtrace(v_position, var_4acd2b1, 1, var_774bf522, 0, 0, self.mdl_candle)[#"fraction"] == 1) {
                    self function_b094be90();
                }
            }
        }
        waitframe(1);
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0xa9171a2c, Offset: 0x1e98
// Size: 0x1b4
function function_3a57d343() {
    self notify("69c331ec544efd5c");
    self endon("69c331ec544efd5c");
    self endon(#"death");
    level endon(#"hash_33d9d5dbe3f1e8c2");
    w_wraith_fire = getweapon(#"eq_wraith_fire");
    while (true) {
        s_waitresult = self waittill(#"projectile_impact", #"projectile_impact_explode");
        if (s_waitresult.weapon === w_wraith_fire) {
            var_672c5523 = array::get_all_closest(s_waitresult.position, level.var_1c929a74, undefined, level.var_1c929a74.size, 96);
            foreach (var_c565a3b in var_672c5523) {
                if (!var_c565a3b.b_lit && bullettracepassed(var_c565a3b.origin, s_waitresult.position, 0, undefined)) {
                    var_c565a3b function_b094be90();
                }
            }
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0x381780dd, Offset: 0x2058
// Size: 0xfe
function function_b094be90(var_5cae7dc6 = 0) {
    if (!self.b_lit) {
        self.mdl_candle setmodel(self.model);
        self.mdl_candle clientfield::set("" + #"hash_54cceab249a41cde", 1);
        self.mdl_candle setcandamage(0);
        self.b_lit = 1;
        level notify(#"hash_13411a5231901c2e", {#var_8ee6e347:self.script_int});
        self notify(#"hash_4b152ceaa6708e09");
    }
    if (var_5cae7dc6) {
        self notify(#"step_done");
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0xdb86fa2d, Offset: 0x2160
// Size: 0x5e
function function_5a7f565a() {
    self.mdl_candle setmodel(self.script_string);
    self.mdl_candle clientfield::set("" + #"hash_54cceab249a41cde", 0);
    self.b_lit = 0;
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0xd5d27c20, Offset: 0x21c8
// Size: 0x556
function function_c7da583f(var_a276c861) {
    if (!var_a276c861) {
        level.var_352e1e6f = 0;
        var_1cb747b2 = struct::get(#"jordans_reward_ear", "targetname");
        var_1cb747b2.mdl_vinyl = util::spawn_model(var_1cb747b2.model, var_1cb747b2.origin, var_1cb747b2.angles);
        s_trigger_pos = struct::get(var_1cb747b2.target, "targetname");
        s_trigger_pos.var_1cb747b2 = var_1cb747b2;
        var_1cb747b2.s_unitrigger_stub = s_trigger_pos zm_unitrigger::create(undefined, 48, &function_88685116, 1, 1);
        level flag::wait_till(#"hash_2311d328e336b7d");
        for (i = 0; i < level.var_a690f86.size; i++) {
            if (!isdefined(level.var_a690f86[i].script_int)) {
                level.var_a690f86 = array::exclude(level.var_a690f86, level.var_a690f86[i]);
                break;
            }
        }
        level.var_a690f86 = array::sort_by_script_int(level.var_a690f86, 1);
        foreach (var_29c75f3 in level.var_a690f86) {
            if (isdefined(var_29c75f3.script_string)) {
                if (level.var_969e8ac2.var_c0ceb69c === #"hash_1184db7e6252576") {
                    level waittill(#"forever");
                }
                while (!isdefined(level.var_969e8ac2.var_c0ceb69c)) {
                    wait 1;
                }
                var_12d5912a = level.var_969e8ac2.var_c0ceb69c;
                if (var_12d5912a == #"hash_2b73105e32379a57") {
                    var_12d5912a = #"red";
                }
                if (var_12d5912a != hash(var_29c75f3.script_string)) {
                    var_c58e489b = var_29c75f3;
                    continue;
                }
            }
            n_radius = 48;
            if (isdefined(var_29c75f3.radius)) {
                n_radius = var_29c75f3.radius;
            }
            var_29c75f3.s_unitrigger_stub = var_29c75f3 zm_unitrigger::create(undefined, n_radius, &function_4c925e67, 1, 1);
            /#
                var_29c75f3 thread function_95b6c945();
            #/
        }
        level.var_a690f86 = array::exclude(level.var_a690f86, var_c58e489b);
        while (level.var_352e1e6f < level.var_a690f86.size) {
            s_waitresult = level waittill(#"hash_df5cf4747eb1cf1");
            if (s_waitresult.var_9ea53c54 === level.var_352e1e6f && s_waitresult.activator === level.var_a690f86[s_waitresult.var_9ea53c54].e_activator) {
                playsoundatposition(#"hash_ef68ee749dfd885" + level.var_352e1e6f, level.var_a690f86[s_waitresult.var_9ea53c54].origin);
                level.var_352e1e6f++;
                zm_unitrigger::unregister_unitrigger(level.var_a690f86[s_waitresult.var_9ea53c54].s_unitrigger_stub);
                level.var_a690f86[s_waitresult.var_9ea53c54] notify(#"step_done");
                continue;
            }
            if (isdefined(s_waitresult.var_9ea53c54)) {
                playsoundatposition(#"hash_4ec26fe871550c11", level.var_a690f86[s_waitresult.var_9ea53c54].origin);
            }
            level.var_352e1e6f = -1;
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0x23e02f09, Offset: 0x2728
// Size: 0x134
function function_2a93c8cc(var_a276c861, ended_early) {
    foreach (var_29c75f3 in level.var_a690f86) {
        zm_unitrigger::unregister_unitrigger(var_29c75f3.s_unitrigger_stub);
        if (isdefined(var_29c75f3.var_8656a4f1)) {
            var_29c75f3.var_8656a4f1 delete();
        }
    }
    var_1cb747b2 = struct::get(#"jordans_reward_ear", "targetname");
    zm_unitrigger::unregister_unitrigger(var_1cb747b2.s_unitrigger_stub);
    if (isdefined(var_1cb747b2.mdl_vinyl)) {
        var_1cb747b2.mdl_vinyl delete();
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0xfbda9d6f, Offset: 0x2868
// Size: 0x5c
function function_9f6a9379() {
    var_8656a4f1 = getent(self.target, "targetname");
    self.var_8656a4f1 = var_8656a4f1;
    var_8656a4f1 callback::on_trigger(&function_11a5f9cf);
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0x9d3297bc, Offset: 0x28d0
// Size: 0xd4
function function_11a5f9cf(s_waitresult) {
    if (isplayer(s_waitresult.activator)) {
        var_29c75f3 = struct::get(self.targetname, "target");
        level.var_72b665d8--;
        var_29c75f3.script_int = level.var_72b665d8;
        var_29c75f3.e_activator = s_waitresult.activator;
        if (!level.var_72b665d8) {
            level flag::set(#"hash_2311d328e336b7d");
        }
        self callback::remove_on_trigger(&function_11a5f9cf);
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x2b91fecb, Offset: 0x29b0
// Size: 0x100
function function_88685116() {
    self endon(#"death");
    while (true) {
        s_waitresult = self waittill(#"trigger");
        if (isplayer(s_waitresult.activator)) {
            level.var_3a4aa2ab = 1;
            s_waitresult.activator playsound(#"hash_7025b0d4a2011877");
            var_1cb747b2 = self.stub.related_parent.var_1cb747b2;
            if (isdefined(var_1cb747b2.mdl_vinyl)) {
                var_1cb747b2.mdl_vinyl delete();
            }
            zm_unitrigger::unregister_unitrigger(var_1cb747b2.s_unitrigger_stub);
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0xd227d889, Offset: 0x2ab8
// Size: 0xec
function function_4c925e67() {
    self endon(#"death");
    while (true) {
        s_waitresult = self waittill(#"trigger");
        if (isplayer(s_waitresult.activator) && isdefined(level.var_3a4aa2ab) && level.var_3a4aa2ab) {
            var_a690f86 = self.stub.related_parent;
            level notify(#"hash_df5cf4747eb1cf1", {#var_9ea53c54:var_a690f86.script_int, #activator:s_waitresult.activator});
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0x1553f664, Offset: 0x2bb0
// Size: 0x2c0
function function_ae072499(var_a276c861) {
    if (!var_a276c861) {
        level.var_93aa61b1 = array::sort_by_script_int(level.var_93aa61b1, 1);
        level thread function_8fb5f04c();
        foreach (var_10372151 in level.var_93aa61b1) {
            /#
                if (isdefined(level.var_a5c2a627) && level.var_a5c2a627) {
                    if (array::find(level.var_93aa61b1, var_10372151) < level.var_93aa61b1.size - 2) {
                        continue;
                    }
                }
                var_10372151 thread function_95b6c945();
            #/
            level.var_55a2003d.origin = var_10372151.origin;
            level.var_55a2003d.script_noteworthy = var_10372151.script_noteworthy;
            if (level.var_55a2003d.script_noteworthy === "last_spot") {
                level thread function_5579efc3(var_10372151);
            }
            n_trigger_radius = 64;
            if (isdefined(var_10372151.radius)) {
                n_trigger_radius = var_10372151.radius;
            }
            var_10372151.s_unitrigger_stub = var_10372151 zm_unitrigger::create(undefined, n_trigger_radius, &function_1d7382d0, 0, 1);
            var_10372151 waittill(#"hash_72fd666f6ed5a284");
            zm_unitrigger::unregister_unitrigger(var_10372151.s_unitrigger_stub);
            if (level.var_55a2003d.script_noteworthy !== "last_spot") {
                for (var_40388281 = var_10372151; isdefined(var_40388281); var_40388281 = function_5579efc3(var_40388281)) {
                }
            }
        }
        if (isdefined(level.var_55a2003d)) {
            level.var_55a2003d delete();
        }
        level notify(#"hash_60740a7ad79fbe01");
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0x8b49c017, Offset: 0x2e78
// Size: 0xfa
function function_57e9237a(var_a276c861, ended_early) {
    if (isdefined(level.var_93aa61b1)) {
        foreach (var_10372151 in level.var_93aa61b1) {
            zm_unitrigger::unregister_unitrigger(var_10372151.s_unitrigger_stub);
        }
    }
    if (isdefined(level.var_55a2003d)) {
        level.var_55a2003d delete();
    }
    /#
        if (var_a276c861 || ended_early) {
            level.var_7a27d2bc = level.players[0];
        }
    #/
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x870164ca, Offset: 0x2f80
// Size: 0x152
function function_1d7382d0() {
    self endon(#"death");
    while (true) {
        s_waitresult = self waittill(#"trigger");
        if (isplayer(s_waitresult.activator)) {
            var_10372151 = self.stub.related_parent;
            e_player = s_waitresult.activator;
            var_6e84d29e = e_player function_ffc00d17(var_10372151);
            if (var_6e84d29e) {
                b_result = e_player function_9215e9d(self, var_10372151);
                if (isdefined(b_result) && b_result) {
                    var_10372151 notify(#"hash_72fd666f6ed5a284");
                    level.var_55a2003d notify(#"hash_72fd666f6ed5a284");
                    var_10372151 notify(#"step_done");
                    level.var_7a27d2bc = e_player;
                }
            }
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0x9290cecb, Offset: 0x30e0
// Size: 0x182
function function_ffc00d17(var_10372151) {
    var_30cf8a0a = 1;
    b_lookat_check = 1;
    if (!isdefined(var_10372151)) {
        return false;
    }
    if (isdefined(var_10372151.script_string)) {
        if (self getstance() != var_10372151.script_string) {
            var_30cf8a0a = 0;
            /#
                iprintlnbold("<dev string:x7e>");
            #/
        }
    }
    if (isdefined(var_10372151.var_a556cf19)) {
        var_9da6b1b4 = var_10372151.origin;
        if (var_10372151.script_noteworthy === "last_spot") {
            if (!isdefined(var_10372151.s_lookat)) {
                var_10372151.s_lookat = struct::get(var_10372151.target, "targetname");
            }
            var_9da6b1b4 = var_10372151.s_lookat.origin;
        }
        if (!self util::is_looking_at(var_9da6b1b4, var_10372151.var_a556cf19)) {
            b_lookat_check = 0;
            /#
                iprintlnbold("<dev string:x95>");
            #/
        }
    }
    return var_30cf8a0a && b_lookat_check;
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0x38493e8, Offset: 0x3270
// Size: 0xb2
function function_9215e9d(var_1e99deea, var_711067a4) {
    self endon(#"left_trigger", #"death");
    var_1e99deea endon(#"death");
    self thread function_123c7022(var_1e99deea, var_711067a4);
    n_time = 1;
    if (isdefined(var_711067a4.script_float)) {
        n_time = var_711067a4.script_float;
    }
    wait n_time;
    self notify(#"hash_36de4efbe292709d");
    return true;
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0xa2dca37a, Offset: 0x3330
// Size: 0xae
function function_123c7022(var_1e99deea, var_711067a4) {
    self endon(#"hash_36de4efbe292709d", #"death");
    var_1e99deea endon(#"death");
    do {
        wait 0.2;
        var_6e84d29e = self function_ffc00d17(var_711067a4);
    } while (self istouching(var_1e99deea) && var_6e84d29e);
    self notify(#"left_trigger");
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x36cecfcf, Offset: 0x33e8
// Size: 0x190
function function_8fb5f04c() {
    level endon(#"hash_60740a7ad79fbe01");
    level.var_55a2003d = util::spawn_model(#"tag_origin", level.var_93aa61b1[0].origin);
    level.var_55a2003d endon(#"death");
    level.var_55a2003d thread function_220b84f3();
    level.var_55a2003d playloopsound(#"hash_7345cdff8fcc5925");
    while (true) {
        level.var_55a2003d waittill(#"hash_28c5f067b06417a5");
        level.var_55a2003d stoploopsound(1);
        level.var_55a2003d playsound(#"hash_7eb387cfa6f69c57");
        level.var_55a2003d waittill(#"hash_7914a5a6ac424312");
        level.var_55a2003d playsound(#"hash_46adaad86ee481a5");
        level.var_55a2003d playloopsound(#"hash_7345cdff8fcc5925");
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0xf8d274f1, Offset: 0x3580
// Size: 0x296
function function_5579efc3(var_40388281) {
    var_4ea39df9 = var_40388281;
    var_40388281 = struct::get(var_40388281.target, "targetname");
    if (isdefined(var_40388281)) {
        level.var_55a2003d.var_bf102318 = var_40388281;
        v_movement = var_40388281.origin - var_4ea39df9.origin;
        var_a3d9dcde = length(v_movement);
        var_5c0e76b9 = int(var_a3d9dcde / 14);
        var_cdf3b660 = vectornormalize(v_movement) * 14;
        var_a45dbb80 = var_4ea39df9.origin;
        if (isdefined(var_40388281.script_string) || isdefined(var_40388281.var_a556cf19)) {
            level.var_55a2003d.var_b7834a7b = 1;
            level.var_55a2003d.script_string = var_40388281.script_string;
            level.var_55a2003d.var_13dd099c = var_40388281.var_13dd099c;
            level.var_55a2003d.var_bbf205b1 = var_40388281.var_bbf205b1;
        }
        for (i = 0; i < var_5c0e76b9; i++) {
            while (!level.var_55a2003d.var_c3202114) {
                wait 0.1;
            }
            var_a45dbb80 += var_cdf3b660;
            var_c562c0b4 = 0.2;
            if (var_40388281.script_string === "prone") {
                var_c562c0b4 *= 2.5;
            }
            level.var_55a2003d moveto(var_a45dbb80, var_c562c0b4);
            wait var_c562c0b4;
        }
        level.var_55a2003d moveto(var_40388281.origin, var_c562c0b4);
        wait var_c562c0b4;
    }
    return var_40388281;
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x3a3ed266, Offset: 0x3820
// Size: 0x2dc
function function_220b84f3() {
    self endon(#"death");
    self.var_c3202114 = 0;
    self waittill(#"hash_72fd666f6ed5a284");
    while (true) {
        if (self.script_string === "prone") {
            var_2d01ed64 = 96;
            var_da117886 = 160;
        } else {
            var_2d01ed64 = 256;
            var_da117886 = 640;
        }
        if (isdefined(self.var_13dd099c)) {
            var_2d01ed64 = self.var_13dd099c;
        }
        if (isdefined(self.var_bbf205b1)) {
            var_da117886 = self.var_bbf205b1;
        }
        n_range = self.var_c3202114 ? var_da117886 : var_2d01ed64;
        if (self.script_noteworthy === "last_spot") {
            if (!self.var_c3202114) {
                self.var_c3202114 = 1;
                self notify(#"hash_7914a5a6ac424312");
                return;
            }
        } else {
            var_f5f25328 = array::get_all_closest(self.origin, util::get_active_players(#"allies"), undefined, 4, n_range);
            var_4821a237 = 1;
            if (isdefined(self.var_b7834a7b) && self.var_b7834a7b) {
                var_4821a237 = 0;
                foreach (e_player in var_f5f25328) {
                    var_fee39c4a = e_player function_ffc00d17(self.var_bf102318);
                    var_4821a237 |= var_fee39c4a;
                }
            }
            if (self.var_c3202114) {
                if (!var_f5f25328.size || !var_4821a237) {
                    self.var_c3202114 = 0;
                    self notify(#"hash_28c5f067b06417a5");
                }
            } else if (var_f5f25328.size && var_4821a237) {
                self.var_c3202114 = 1;
                self notify(#"hash_7914a5a6ac424312");
            }
        }
        wait 0.2;
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0xeb530b5, Offset: 0x3b08
// Size: 0x194
function function_9c3b8102(var_a276c861) {
    var_decc00a1 = level.var_93aa61b1[level.var_93aa61b1.size - 1];
    if (isalive(level.var_7a27d2bc)) {
        level.var_7a27d2bc playsoundtoplayer(#"hash_1a447e459e1a1744", level.var_7a27d2bc);
        level.var_7a27d2bc thread function_6366a177(var_decc00a1);
        level.var_7a27d2bc waittill(#"hash_5fa4964a839dbe6d");
    }
    var_872e2994 = var_decc00a1;
    if (isalive(level.var_7a27d2bc)) {
        level.var_7a27d2bc zm_vo::function_a2bd5a0c("vox_ghost_cath_jump_react", 2, 0, 9999, 1);
    }
    if (isdefined(var_872e2994.s_unitrigger_stub) && isdefined(var_872e2994.s_unitrigger_stub.registered) && var_872e2994.s_unitrigger_stub.registered) {
        zm_unitrigger::unregister_unitrigger(var_872e2994.s_unitrigger_stub);
    }
    wait 2;
    function_7e04b65f();
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0x7b28c97, Offset: 0x3ca8
// Size: 0x14
function function_4a0f87c7(var_a276c861, ended_early) {
    
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 3, eflags: 0x1 linked
// Checksum 0x42c693d4, Offset: 0x3cc8
// Size: 0x34
function function_f84421eb(var_2e6c012e, e_player_2, b_lowest_first) {
    return var_2e6c012e.var_c859fa3a > e_player_2.var_c859fa3a;
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0xf85acc58, Offset: 0x3d08
// Size: 0x1d8
function function_7e04b65f() {
    a_e_players = util::get_players(#"allies");
    level.var_32e85a16 = array::merge_sort(a_e_players, &function_f84421eb, 0);
    var_4162b7c9 = 0;
    foreach (e_player in level.var_32e85a16) {
        if (isdefined(e_player)) {
            e_player playsound(#"hash_41d764eca159410e");
            var_4162b7c9 = e_player.var_c859fa3a < var_4162b7c9 ? var_4162b7c9 : e_player.var_c859fa3a;
            if (e_player.var_c859fa3a >= var_4162b7c9) {
                /#
                    iprintlnbold("<dev string:x67>" + e_player getentnum() + "<dev string:xac>" + e_player.var_c859fa3a + "<dev string:xc6>");
                #/
                e_player thread zm_magicbox::give_offhand_weapon(level.w_homunculus);
                e_player thread function_1704df5e();
            }
            e_player thread function_70d155c5();
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x7f87c03c, Offset: 0x3ee8
// Size: 0xa6
function function_70d155c5() {
    self endon(#"death");
    self zm_perks::function_cc24f525();
    for (i = 0; i < 2; i++) {
        var_16c042b8 = self zm_perks::function_b2cba45a();
        /#
            if (isdefined(var_16c042b8)) {
                iprintlnbold("<dev string:xd7>" + function_9e72a96(var_16c042b8));
            }
        #/
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0xc8d32413, Offset: 0x3f98
// Size: 0x238
function function_1704df5e() {
    self endon(#"death");
    var_94899c49 = self getcurrentweapon();
    while (!isinarray(self getweaponslistprimaries(), var_94899c49)) {
        var_94899c49 = self getcurrentweapon();
        wait 0.1;
    }
    var_c2415b72 = zm_weapons::function_93cd8e76(var_94899c49);
    var_c2415b72 = zm_weapons::get_base_weapon(var_c2415b72);
    /#
        iprintlnbold("<dev string:x67>" + self getentnum() + "<dev string:xec>" + function_9e72a96(var_c2415b72.name));
    #/
    while (self function_1ec86044(var_c2415b72) || isdefined(level.pap_machine) && level.pap_machine.pack_player === self || self scene::function_c935c42()) {
        if (isdefined(level.pap_machine) && level.pap_machine.pack_player === self) {
            wait 2;
            continue;
        }
        if (self scene::function_c935c42()) {
            wait 1;
            continue;
        }
        var_2709c26f = self function_64b50b8c(var_c2415b72);
        if (isdefined(var_2709c26f)) {
            self givemaxammo(var_2709c26f);
        } else {
            assert(0, "<dev string:x107>");
        }
        wait 2;
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0xa8ae536, Offset: 0x41d8
// Size: 0xcc
function function_1ec86044(var_c2415b72) {
    self endon(#"death");
    if (var_c2415b72 == level.var_f086136b || var_c2415b72 == level.var_6fe89212) {
        return (self zm_weapons::has_weapon_or_upgrade(level.var_f086136b) || self zm_weapons::has_weapon_or_upgrade(level.var_6fe89212) || self zm_weapons::has_weapon_or_upgrade(level.var_7b9ca97a));
    }
    return self zm_weapons::has_weapon_or_upgrade(var_c2415b72);
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0x6414dc29, Offset: 0x42b0
// Size: 0x1ae
function function_64b50b8c(var_c2415b72) {
    self endon(#"death");
    a_w_list = self getweaponslistprimaries();
    if (var_c2415b72 == level.var_f086136b || var_c2415b72 == level.var_6fe89212 || var_c2415b72 == level.var_7b9ca97a) {
        foreach (w_list_weapon in a_w_list) {
            if (w_list_weapon === level.var_f086136b || w_list_weapon === level.var_6fe89212 || w_list_weapon === level.var_7b9ca97a) {
                return w_list_weapon;
            }
        }
        return;
    }
    foreach (w_list_weapon in a_w_list) {
        if (zm_weapons::get_base_weapon(zm_weapons::function_93cd8e76(w_list_weapon)) === var_c2415b72) {
            return w_list_weapon;
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 3, eflags: 0x1 linked
// Checksum 0xda1781f, Offset: 0x4468
// Size: 0x3be
function function_6366a177(s_lookat, var_3ac8690f, var_149b3205) {
    self val::set(#"hash_69fe6012338fa244", #"freezecontrols");
    self val::set(#"hash_69fe6012338fa244", "ignoreme", 1);
    self val::set(#"hash_69fe6012338fa244", "takedamage", 0);
    var_6c759f99 = util::spawn_model(#"hash_3ae1ad382a5ec0c8", s_lookat.origin + (0, 0, -62), s_lookat.angles);
    var_6c759f99 hide();
    var_6c759f99 showtoplayer(self);
    if (isdefined(var_149b3205)) {
        v_angles = var_149b3205;
    } else {
        v_angles = self getplayerangles();
    }
    var_4b540767 = (v_angles[0] * -1, v_angles[1] + 180, v_angles[2] * -1);
    if (isdefined(var_3ac8690f)) {
        var_6c9efff0 = var_3ac8690f + vectornormalize(anglestoforward(v_angles)) * 13 + vectornormalize(anglestoup(v_angles)) * -62;
    } else {
        var_6c9efff0 = self geteye() + vectornormalize(anglestoforward(v_angles)) * 13 + vectornormalize(anglestoup(v_angles)) * -62;
    }
    var_6c759f99 rotateto(var_4b540767, 0.3);
    var_6c759f99 moveto(var_6c9efff0, 0.3);
    wait 0.3;
    wait 0.5;
    var_6c759f99 clientfield::set("" + #"hash_336942eaf5fcd809", 1);
    wait 1;
    var_6c759f99 delete();
    if (isdefined(self)) {
        self val::reset(#"hash_69fe6012338fa244", #"freezecontrols");
        self val::reset(#"hash_69fe6012338fa244", "ignoreme");
        self val::reset(#"hash_69fe6012338fa244", "takedamage");
        self notify(#"hash_5fa4964a839dbe6d");
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0xf5af67c9, Offset: 0x4830
// Size: 0xbc
function function_f62d9f65(var_a276c861) {
    level flag::init(#"hash_11cbce4fcf9f3aec");
    s_painting = struct::get(#"gato_saltando_pos", "targetname");
    s_painting.s_unitrigger_stub = s_painting zm_unitrigger::create(undefined, s_painting.radius, &function_eb269563, 0, 1);
    zm_unitrigger::unitrigger_force_per_player_triggers(s_painting.s_unitrigger_stub, 1);
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0xb5e81dd9, Offset: 0x48f8
// Size: 0x14
function function_6134319c(var_a276c861, ended_early) {
    
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0xf0b13562, Offset: 0x4918
// Size: 0x138
function function_eb269563() {
    self endon(#"death");
    s_lookat = struct::get(#"gato_saltando_target", "targetname");
    var_1611e2c0 = s_lookat.origin;
    while (true) {
        s_waitresult = self waittill(#"trigger");
        e_player = s_waitresult.activator;
        if (isdefined(e_player.b_nosferatu_damage_fx) && e_player.b_nosferatu_damage_fx && !(isdefined(e_player.var_4522314f) && e_player.var_4522314f) && e_player util::is_looking_at(var_1611e2c0, 0.89)) {
            e_player thread function_e92918f6(self, s_lookat);
        }
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0x1bf213a3, Offset: 0x4a58
// Size: 0xdc
function function_e92918f6(var_1e99deea, s_lookat) {
    self endoncallback(&function_dc123817, #"left_trigger", #"death");
    self.var_4522314f = 1;
    self thread function_da604bc0(var_1e99deea, s_lookat.origin);
    wait 30;
    if (level flag::get(#"hash_11cbce4fcf9f3aec")) {
        level flag::wait_till_clear(#"hash_11cbce4fcf9f3aec");
    }
    self thread function_623b460a();
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 0, eflags: 0x1 linked
// Checksum 0x6f798cd5, Offset: 0x4b40
// Size: 0x244
function function_623b460a() {
    level flag::set(#"hash_11cbce4fcf9f3aec");
    var_97b7cff3 = scene::get_active_scenes(#"p8_fxanim_zm_man_pjs_bundle");
    var_70c77e28 = var_97b7cff3[0];
    var_35694f3f = var_70c77e28.scene_ents[#"prop 1"];
    assert(isdefined(var_35694f3f), "<dev string:x12d>");
    if (isdefined(var_35694f3f)) {
        var_35694f3f hide();
        var_35694f3f showtoplayer(self);
        self thread zm_vo::function_a2bd5a0c(#"hash_2f31e680acc67680", 4.5, 1, 9999);
        self playsoundtoplayer(#"hash_1a447f459e1a18f7", self);
        level thread scene::play(#"p8_fxanim_zm_man_pjs_bundle");
        wait 0.7;
        var_35694f3f clientfield::set("" + #"hash_336942eaf5fcd809", 1);
        wait 2;
        var_35694f3f hide();
        var_35694f3f clientfield::set("" + #"hash_336942eaf5fcd809", 0);
    }
    level scene::init(#"p8_fxanim_zm_man_pjs_bundle");
    self.var_4522314f = 0;
    wait 0.1;
    level flag::clear(#"hash_11cbce4fcf9f3aec");
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 1, eflags: 0x1 linked
// Checksum 0xd4711105, Offset: 0x4d90
// Size: 0x1e
function function_dc123817(str_notify) {
    if (isdefined(self)) {
        self.var_4522314f = 0;
    }
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0x81d4672d, Offset: 0x4db8
// Size: 0xbc
function function_da604bc0(var_1e99deea, var_1611e2c0) {
    self endon(#"hash_36de4efbe292709d", #"death");
    /#
        iprintlnbold("<dev string:x15f>" + self.playernum);
    #/
    do {
        wait 0.2;
    } while (function_533ca98d(var_1e99deea, var_1611e2c0));
    self notify(#"left_trigger");
    /#
        iprintlnbold("<dev string:x176>" + self.playernum);
    #/
}

// Namespace mansion_jordans/zm_mansion_jordans
// Params 2, eflags: 0x1 linked
// Checksum 0x2350fcb6, Offset: 0x4e80
// Size: 0x5c
function function_533ca98d(var_1e99deea, var_1611e2c0) {
    return isdefined(var_1e99deea) && self istouching(var_1e99deea) && self util::is_looking_at(var_1611e2c0, 0.89);
}

/#

    // Namespace mansion_jordans/zm_mansion_jordans
    // Params 0, eflags: 0x0
    // Checksum 0x55e008fc, Offset: 0x4ee8
    // Size: 0xfc
    function function_c9854faa() {
        setdvar(#"hash_7a278441046d0a08", 0);
        setdvar(#"hash_71faad0772a081c1", 0);
        setdvar(#"hash_6bedacfaaa354b3d", 0);
        adddebugcommand("<dev string:x189>");
        adddebugcommand("<dev string:x1eb>");
        adddebugcommand("<dev string:x24e>");
        adddebugcommand("<dev string:x2b7>");
        adddebugcommand("<dev string:x321>");
        level thread function_e6440e06();
    }

    // Namespace mansion_jordans/zm_mansion_jordans
    // Params 0, eflags: 0x0
    // Checksum 0xad4603a0, Offset: 0x4ff0
    // Size: 0x24e
    function function_e6440e06() {
        var_5245371c = 0;
        var_972ed7e7 = 0;
        while (true) {
            var_8a4bff6d = getdvarint(#"hash_7a278441046d0a08", 0);
            if (var_8a4bff6d != var_5245371c) {
                switch (var_8a4bff6d) {
                case 0:
                    if (isdefined(level.var_55a2003d)) {
                        level.var_55a2003d clientfield::set("<dev string:x46>" + #"hash_487e544e29aa8e45", 0);
                    }
                    break;
                case 1:
                    if (isdefined(level.var_55a2003d)) {
                        level.var_55a2003d clientfield::set("<dev string:x46>" + #"hash_487e544e29aa8e45", 1);
                    }
                    break;
                }
            }
            var_67247963 = getdvarint(#"hash_71faad0772a081c1", 0);
            if (var_67247963 != var_972ed7e7) {
                switch (var_67247963) {
                case 0:
                    level notify(#"hash_7d85bf9a5c90b6d9");
                    break;
                case 1:
                    level thread function_6e0ed3e();
                    break;
                }
            }
            var_9ec35d59 = getdvarint(#"hash_6bedacfaaa354b3d", 0);
            if (var_9ec35d59) {
                setdvar(#"hash_6bedacfaaa354b3d", 0);
                level thread function_3ddf07f4();
            }
            var_5245371c = var_8a4bff6d;
            var_972ed7e7 = var_67247963;
            wait 1;
        }
    }

    // Namespace mansion_jordans/zm_mansion_jordans
    // Params 0, eflags: 0x0
    // Checksum 0x2ab5bc10, Offset: 0x5248
    // Size: 0x182
    function function_6e0ed3e() {
        level endon(#"hash_7d85bf9a5c90b6d9");
        while (true) {
            foreach (n_index, e_player in getplayers()) {
                n_y_pos = 720 + 18.7 * n_index;
                debug2dtext((120, n_y_pos, 0), "<dev string:x388>" + n_index + "<dev string:x391>", (1, 1, 0), 1, (0, 0, 0), 0.4, 1, 2);
                debug2dtext((120 + 100, n_y_pos, 0), "<dev string:x395>" + e_player.var_c859fa3a, (1, 1, 1), 1, (0, 0, 0), 0.4, 1, 2);
            }
            waitframe(2);
        }
    }

    // Namespace mansion_jordans/zm_mansion_jordans
    // Params 0, eflags: 0x0
    // Checksum 0x90ac8c12, Offset: 0x53d8
    // Size: 0x23c
    function function_3ddf07f4() {
        if (!isdefined(level.var_ce277759)) {
            level.var_ce277759 = 0;
        }
        var_538ff835 = [];
        for (i = 0; i < 4; i++) {
            var_54887c6a = spawnstruct();
            var_54887c6a.var_21c1ba1 = i;
            if (!isdefined(var_538ff835)) {
                var_538ff835 = [];
            } else if (!isarray(var_538ff835)) {
                var_538ff835 = array(var_538ff835);
            }
            var_538ff835[var_538ff835.size] = var_54887c6a;
            if (i != level.var_ce277759 % 4) {
                var_54887c6a.var_c859fa3a = 2;
                continue;
            }
            var_54887c6a.var_c859fa3a = 0;
        }
        var_538ff835 = array::merge_sort(var_538ff835, &function_f84421eb, 0);
        var_4162b7c9 = 0;
        foreach (var_54887c6a in var_538ff835) {
            if (isdefined(var_54887c6a)) {
                var_4162b7c9 = var_54887c6a.var_c859fa3a < var_4162b7c9 ? var_4162b7c9 : var_54887c6a.var_c859fa3a;
                if (var_54887c6a.var_c859fa3a >= var_4162b7c9) {
                    /#
                        iprintlnbold("<dev string:x67>" + var_54887c6a.var_21c1ba1 + "<dev string:xac>" + var_54887c6a.var_c859fa3a + "<dev string:xc6>");
                    #/
                }
            }
        }
        level.var_ce277759++;
    }

    // Namespace mansion_jordans/zm_mansion_jordans
    // Params 0, eflags: 0x0
    // Checksum 0x921c9dda, Offset: 0x5620
    // Size: 0x12c
    function function_95b6c945() {
        if (!getdvarint(#"hash_7919e37cd5d57659", 0)) {
            return;
        }
        e_object = self;
        if (isstruct(self)) {
            e_object = util::spawn_model(#"tag_origin", self.origin);
            e_object.script_int = self.script_int;
        }
        e_object clientfield::set("<dev string:x46>" + #"hash_3efe70d8ad68a07d", e_object.script_int + 1);
        self waittill(#"step_done", #"death");
        if (isdefined(e_object) && !isstruct(e_object)) {
            e_object delete();
        }
    }

#/

// Atian COD Tools GSC decompiler test
#using scripts\wz_common\wz_ai_zonemgr.gsc;
#using scripts\wz_common\wz_ai_zombie.gsc;
#using scripts\wz_common\wz_ai_vehicle.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\mp_common\item_world.gsc;
#using script_cb32d07c95e5628;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\infection.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace wz_ai_utils;

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x2
// Checksum 0xa1d32baf, Offset: 0x268
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_ai_utils", &__init__, undefined, undefined);
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x5 linked
// Checksum 0x7ff8235, Offset: 0x2b0
// Size: 0x3ac
function private __init__() {
    level.var_91a15ec0 = #"world";
    level.zombie_team = level.var_91a15ec0;
    level.attackables = [];
    level.var_7fc48a1a = [];
    /#
        level.var_80bea5a6 = 0;
        level thread function_b4f41a02();
    #/
    level.var_8a3036cc = 0;
    level.var_57a77bb = 0;
    level.var_d5cd88c2 = 0;
    level.var_2510617f = 0;
    level.var_6eb6193a = 0;
    level.var_7dff87f1 = 0;
    level.item_gravity = getdvarint(#"bg_gravity", 0);
    if (isdefined(getgametypesetting(#"hash_3109a8794543000f")) && getgametypesetting(#"hash_3109a8794543000f")) {
        if (isdefined(getgametypesetting(#"hash_42471cb0cbc19544")) && getgametypesetting(#"hash_42471cb0cbc19544")) {
            level.zombie_itemlist = #"zombie_itemlist_ammo_close_quarters";
        } else {
            level.zombie_itemlist = #"zombie_itemlist_close_quarters";
        }
    } else if (isdefined(getgametypesetting(#"hash_42471cb0cbc19544")) && getgametypesetting(#"hash_42471cb0cbc19544")) {
        level.zombie_itemlist = #"zombie_itemlist_ammo";
    } else {
        level.zombie_itemlist = #"zombie_itemlist";
    }
    level.var_db43cbd7 = #"zombie_raygun_itemlist";
    level.var_1b7acd6d = #"cu12_list";
    level.var_72151997 = #"cu13_list";
    level.var_14364e26 = #"cu30_list";
    level.var_7d2bc89 = #"cu31_list";
    clientfield::register("scriptmover", "aizoneflag", -1, 2, "int");
    clientfield::register("scriptmover", "aizoneflag_tu14", 14000, 3, "int");
    clientfield::register("scriptmover", "magicboxflag", 1, 3, "int");
    clientfield::register("scriptmover", "soultransfer", 14000, 2, "int");
    clientfield::register("actor", "zombie_died", 17000, 1, "int");
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x0
// Checksum 0x8b2c7d5, Offset: 0x668
// Size: 0x430
function function_b4f41a02() {
    /#
        level endon(#"game_ended");
        aitypes = array(#"spawner_boct_zombie_wz", #"hash_618248fca82d83a6", #"spawner_wz_blight_father", #"spawner_boct_zombie_dog_wz", #"spawner_boct_brutus_special_wz", #"spawner_boct_brutus_wz", #"spawner_boct_avogadro");
        setdvar(#"hash_209287456d55fca1", "<unknown string>");
        foreach (type in aitypes) {
            if (function_e949cfd7(type)) {
                util::add_debug_command("<unknown string>" + function_9e72a96(type) + "<unknown string>" + function_9e72a96(type) + "<unknown string>");
            }
        }
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        while (1) {
            wait(0.1);
            cmd = getdvarstring(#"hash_209287456d55fca1", "<unknown string>");
            if (cmd == "<unknown string>") {
                continue;
            }
            cmd_tokens = strtok(cmd, "<unknown string>");
            switch (cmd_tokens[0]) {
            case #"hash_c0b89e8d4a71cff":
                player = level.players[0];
                direction = player getplayerangles();
                direction_vec = anglestoforward(direction);
                eye = player geteye();
                direction_vec = (direction_vec[0] * 8000, direction_vec[1] * 8000, direction_vec[2] * 8000);
                trace = bullettrace(eye, eye + direction_vec, 0, undefined);
                ai = spawnactor(cmd_tokens[1], trace[#"position"], (0, 0, 0), undefined, 1);
                closest_zone = arraygetclosest(trace[#"position"], level.var_5b357434);
                ai thread function_7adc1e46(closest_zone, 0);
                break;
            }
            setdvar(#"hash_209287456d55fca1", "<unknown string>");
        }
    #/
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x0
// Checksum 0x363b38ac, Offset: 0xaa0
// Size: 0xeae
function debug_ai() {
    /#
        level endon(#"game_ended");
        level.var_b4702614 = [];
        level.var_b4702614[0] = "<unknown string>";
        level.var_b4702614[1] = "<unknown string>";
        level.var_b4702614[2] = "<unknown string>";
        level.var_b4702614[3] = "<unknown string>";
        level.var_b4702614[4] = "<unknown string>";
        level.var_b4702614[5] = "<unknown string>";
        level.var_b4702614[6] = "<unknown string>";
        while (1) {
            if (isdefined(level.var_e066667d) && level.var_e066667d && isdefined(level.var_91a15ec0)) {
                axis = getaiteamarray(level.var_91a15ec0);
                foreach (entity in axis) {
                    if (!isalive(entity)) {
                        continue;
                    }
                    org = entity.origin + vectorscale((0, 0, 1), 100);
                    if (isdefined(entity.aistate)) {
                        org = entity.origin + vectorscale((0, 0, 1), 90);
                        if (getdvarint(#"recorder_enablerec", 0)) {
                            record3dtext((isdefined(level.var_b4702614[entity.aistate]) ? level.var_b4702614[entity.aistate] : "<unknown string>") + "<unknown string>" + entity.health, entity.origin, (1, 0.5, 0), "<unknown string>", entity);
                        } else {
                            print3d(org, (isdefined(level.var_b4702614[entity.aistate]) ? level.var_b4702614[entity.aistate] : "<unknown string>") + "<unknown string>" + entity.health, (1, 0.5, 0), 1, 0.2);
                        }
                    }
                    ai_cansee = 0;
                    if (isdefined(entity.enemy) && entity cansee(entity.enemy)) {
                        ai_cansee = 1;
                    }
                    if (isdefined(entity.var_5a8f690)) {
                        org = entity.origin + vectorscale((0, 0, 1), 85);
                        if (getdvarint(#"recorder_enablerec", 0)) {
                            record3dtext("<unknown string>" + entity.var_5a8f690 + "<unknown string>" + ai_cansee + "<unknown string>", entity.origin, (1, 0.5, 0), "<unknown string>", entity);
                        } else {
                            print3d(org, "<unknown string>" + entity.var_5a8f690 + "<unknown string>" + ai_cansee + "<unknown string>", (1, 0.5, 0), 1, 0.2);
                        }
                    }
                    if (isdefined(entity.allowoffnavmesh)) {
                        org = entity.origin + vectorscale((0, 0, 1), 80);
                        if (getdvarint(#"recorder_enablerec", 0)) {
                            record3dtext("<unknown string>" + entity.allowoffnavmesh, entity.origin, (1, 0.5, 0), "<unknown string>", entity);
                        } else {
                            print3d(org, "<unknown string>" + entity.allowoffnavmesh, (1, 0.5, 0), 1, 0.2);
                        }
                    }
                    if (isdefined(entity.var_6e3313ab)) {
                        org = entity.origin + vectorscale((0, 0, 1), 75);
                        if (getdvarint(#"recorder_enablerec", 0)) {
                            record3dtext("<unknown string>" + entity.var_6e3313ab, entity.origin, (1, 0.5, 0), "<unknown string>", entity);
                        } else {
                            print3d(org, "<unknown string>" + entity.var_6e3313ab, (1, 0.5, 0), 1, 0.2);
                        }
                    }
                    if (isdefined(entity.var_ad26639d)) {
                        org = entity.origin + vectorscale((0, 0, 1), 70);
                        if (getdvarint(#"recorder_enablerec", 0)) {
                            record3dtext("<unknown string>" + entity.var_ad26639d, entity.origin, (1, 0.5, 0), "<unknown string>", entity);
                        } else {
                            print3d(org, "<unknown string>" + entity.var_ad26639d, (1, 0.5, 0), 1, 0.2);
                        }
                    }
                    if (isdefined(entity.var_9a79d89d)) {
                        origin = entity.var_9a79d89d;
                        if (!isvec(entity.var_9a79d89d)) {
                            origin = entity.var_9a79d89d.origin;
                        }
                        if (getdvarint(#"recorder_enablerec", 0)) {
                            record3dtext("<unknown string>", entity.origin, (0, 0, 1), "<unknown string>", entity);
                        } else {
                            print3d(entity.var_9a79d89d + vectorscale((0, 0, 1), 10), "<unknown string>", (0, 0, 1), 1, 1);
                        }
                    }
                    if (isdefined(entity.var_db912cfe) && isdefined(entity.surfacetype)) {
                        org = entity.origin + vectorscale((0, 0, 1), 70);
                        if (getdvarint(#"recorder_enablerec", 0)) {
                            record3dtext("<unknown string>" + entity.surfacetype + "<unknown string>" + entity.var_db912cfe, entity.origin, (1, 0.5, 0), "<unknown string>", entity);
                        } else {
                            print3d(org, "<unknown string>" + entity.surfacetype + "<unknown string>" + entity.var_db912cfe, (1, 0.5, 0), 1, 0.2);
                        }
                    }
                    if (isdefined(entity.is_special)) {
                        org = entity.origin + vectorscale((0, 0, 1), 200);
                        if (getdvarint(#"recorder_enablerec", 0)) {
                            record3dtext("<unknown string>" + entity.is_special + "<unknown string>" + entity.is_special + "<unknown string>", entity.origin, (1, 0.5, 0), "<unknown string>", entity);
                        } else {
                            print3d(org, "<unknown string>" + entity.is_special + "<unknown string>" + entity.is_special + "<unknown string>", (1, 0.5, 0), 1, 2);
                        }
                    }
                    if (isdefined(entity.movetime) && getdvarint(#"hash_1aebd3ffed21a22a", 0)) {
                        org = entity.origin + vectorscale((0, 0, 1), 90);
                        if (getdvarint(#"recorder_enablerec", 0)) {
                            record3dtext("<unknown string>" + gettime() - entity.movetime, entity.origin, (1, 0.5, 0), "<unknown string>", entity);
                        } else {
                            print3d(org, "<unknown string>" + gettime() - entity.movetime, (1, 0.5, 0), 1, 0.2);
                        }
                    }
                    if (isdefined(entity.idletime) && getdvarint(#"hash_1aebd3ffed21a22a", 0)) {
                        org = entity.origin + vectorscale((0, 0, 1), 95);
                        if (getdvarint(#"recorder_enablerec", 0)) {
                            record3dtext("<unknown string>" + gettime() - entity.idletime, entity.origin, (1, 0.5, 0), "<unknown string>", entity);
                        } else {
                            print3d(org, "<unknown string>" + gettime() - entity.idletime, (1, 0.5, 0), 1, 0.2);
                        }
                    }
                    if (isdefined(entity.attackable) && getdvarint(#"hash_6e5b3c35cb223a9d", 0)) {
                        recordline(entity.origin, entity.attackable_slot.origin, (0, 1, 0));
                        recordstar(entity.attackable_slot.origin, (0, 0, 1));
                        org = entity.origin + vectorscale((0, 0, 1), 100);
                        if (getdvarint(#"recorder_enablerec", 0)) {
                            record3dtext("<unknown string>" + distance2dsquared(entity.origin, entity.attackable_slot.origin), entity.origin, (1, 0.5, 0), "<unknown string>", entity);
                        } else {
                            print3d(org, "<unknown string>" + distance2dsquared(entity.origin, entity.attackable_slot.origin), (1, 0.5, 0), 1, 0.2);
                        }
                    }
                    if (isdefined(entity.var_6c408220)) {
                        entity [[ entity.var_6c408220 ]]();
                    }
                }
            }
            waitframe(1);
        }
    #/
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x55d674dc, Offset: 0x1958
// Size: 0x92
function hide_pop(var_16dd87ad) {
    self endon(#"death");
    self ghost();
    wait(isdefined(var_16dd87ad) ? var_16dd87ad : 0.5);
    if (isdefined(self)) {
        self show();
        util::wait_network_frame();
        if (isdefined(self)) {
            self.create_eyes = 1;
        }
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 4, eflags: 0x1 linked
// Checksum 0x64f01ff9, Offset: 0x19f8
// Size: 0x26c
function function_55625f76(spot_origin, spot_angles, anim_name, var_16dd87ad) {
    self endon(#"death");
    self clientfield::set("zombie_riser_fx", 1);
    self.in_the_ground = 1;
    if (isdefined(self.anchor)) {
        self.anchor delete();
    }
    self.anchor = spawn("script_origin", self.origin);
    self.anchor.angles = self.angles;
    self linkto(self.anchor);
    if (!isdefined(spot_angles)) {
        spot_angles = (0, 0, 0);
    }
    anim_org = spot_origin;
    anim_ang = spot_angles;
    anim_org = anim_org + (0, 0, 0);
    self ghost();
    self.anchor moveto(anim_org, 0.05);
    self.anchor waittill(#"movedone");
    self unlink();
    if (isdefined(self.anchor)) {
        self.anchor delete();
    }
    self thread hide_pop(var_16dd87ad);
    self orientmode("face default");
    self animscripted("rise_anim", self.origin, spot_angles, anim_name, "normal");
    self notify(#"rise_anim_finished");
    self.in_the_ground = 0;
    self clientfield::set("zombie_riser_fx", 0);
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x4
// Checksum 0xa48569df, Offset: 0x1c70
// Size: 0xe
function private function_b793bca2() {
    self.allowoffnavmesh = 0;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 4, eflags: 0x0
// Checksum 0x19dea744, Offset: 0x1c88
// Size: 0x25c
function function_c9a1a3bd(spot_origin, spot_angles, anim_name, var_c2a69066) {
    self endon(#"death");
    if (!isdefined(anim_name)) {
        return;
    }
    self clientfield::set("zombie_riser_fx", 1);
    self.is_digging = 1;
    self animscripted("dig_anim", self.origin, self.angles, anim_name, "normal");
    self waittillmatch({#notetrack:"end"}, #"dig_anim");
    self ghost();
    self notsolid();
    self clientfield::set("zombie_riser_fx", 0);
    self pathmode("dont move", 1);
    spawn_point = self.ai_zone.spawn_points[randomint(self.ai_zone.spawn_points.size)];
    wait(2);
    self forceteleport(spawn_point.origin, spawn_point.angles);
    wait(2);
    self pathmode("move allowed");
    self solid();
    self function_55625f76(spawn_point.origin, spawn_point.angles, self.spawn_anim);
    self.is_digging = 0;
    if (isdefined(var_c2a69066)) {
        self [[ var_c2a69066 ]]();
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x5ef29a6f, Offset: 0x1ef0
// Size: 0x2fa
function function_92c7e9a9(ai_zone) {
    self endon(#"delete");
    ai_zone notify(#"wisp_reset");
    ai_zone endon(#"wisp_reset");
    wisp = ai_zone.var_484efd06;
    if (isdefined(self.ai_zone.var_78823914) && self.ai_zone.var_78823914) {
        wisp clientfield::set("soultransfer", 1);
        n_duration = 0.5;
        speed = 500;
        minrange = 100;
        wisp unlink();
        while (isalive(self) && isdefined(wisp)) {
            end_point = self.origin + vectorscale((0, 0, 1), 60);
            dist_sq = distancesquared(end_point, wisp.origin);
            if (dist_sq < minrange * minrange) {
                break;
            }
            n_duration = sqrt(dist_sq) / speed;
            if (n_duration > 0.2) {
                wisp moveto(end_point, n_duration, 0.1, 0.1);
            }
            wait(n_duration);
        }
        if (isalive(self) && isdefined(wisp)) {
            wisp linkto(self, "j_helmet", (0, 0, 0), (0, 0, 0));
            wisp clientfield::set("soultransfer", 0);
            self waittill(#"death");
            if (isdefined(wisp)) {
                wisp clientfield::set("soultransfer", 1);
                wisp unlink();
                end_point = wisp.origin + vectorscale((0, 0, 1), 60);
                n_duration = 1;
                wisp moveto(end_point, n_duration, 0.1, 0.1);
                wait(n_duration);
            }
        }
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 2, eflags: 0x1 linked
// Checksum 0x28817163, Offset: 0x21f8
// Size: 0x21c
function function_7adc1e46(ai_zone, is_special) {
    level endon(#"game_ended");
    self.ai_zone = ai_zone;
    self.disabletargetservice = 1;
    self.var_5a8f690 = undefined;
    self.var_ea34ab74 = undefined;
    self.aistate = 0;
    self.favoriteenemy = undefined;
    self.is_special = is_special;
    if (isdefined(is_special) && is_special) {
        ai_zone.special_ai = self;
        self thread function_92c7e9a9(ai_zone);
    }
    /#
        if (isdefined(level.var_76325c03) && level.var_76325c03) {
            level.var_80bea5a6++;
            if (level.var_80bea5a6 > 3) {
                level.var_80bea5a6 = 3;
            }
            self.ai_zone.var_80bea5a6 = level.var_80bea5a6;
        }
    #/
    var_80bea5a6 = 1;
    if (isdefined(self.ai_zone) && isdefined(self.ai_zone.var_80bea5a6)) {
        var_80bea5a6 = self.ai_zone.var_80bea5a6;
    }
    if (isdefined(level.var_7b5ba689) && level.var_7b5ba689 && isdefined(self.is_special) && self.is_special) {
        self thread wz_ai_zombie::delayed_zombie_eye_glow(3);
    } else if (isdefined(var_80bea5a6)) {
        self thread wz_ai_zombie::delayed_zombie_eye_glow(var_80bea5a6);
    }
    self.team = level.var_91a15ec0;
    self.var_b69c12bc = 1;
    self callback::function_d8abfc3d(#"on_ai_killed", &function_a679f9b);
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0xb1e5aeed, Offset: 0x2420
// Size: 0xac
function function_a679f9b(params) {
    if (isdefined(self.ai_zone)) {
        self.ai_zone.var_84b8298c--;
        wz_ai_zonemgr::function_37411c68(self.ai_zone, self);
        if (isdefined(params.eattacker) && isplayer(params.eattacker)) {
            if (self.archetype == #"zombie") {
                self.ai_zone.var_58ba2ab7++;
            } else {
                self.ai_zone.var_41e86d33++;
            }
        }
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0xa75b5f65, Offset: 0x24d8
// Size: 0x108
function is_player_valid(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isalive(player)) {
        return 0;
    }
    if (!isplayer(player)) {
        return 0;
    }
    if (player.sessionstate == "spectator") {
        return 0;
    }
    if (player.sessionstate == "intermission") {
        return 0;
    }
    if (isdefined(player.intermission) && player.intermission) {
        return 0;
    }
    if (player laststand::player_is_in_laststand()) {
        return 0;
    }
    if (player infection::is_infected()) {
        return 0;
    }
    if (player.ignoreme || player isnotarget()) {
        return 0;
    }
    return 1;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x2b583d5, Offset: 0x25e8
// Size: 0x11a
function function_f10600c(enemy) {
    if (!is_player_valid(enemy)) {
        return 0;
    }
    if (isdefined(self.var_5a8f690) && gettime() < self.var_ea34ab74) {
        return self.var_5a8f690;
    }
    targetpoint = isdefined(enemy.var_88f8feeb) ? enemy.var_88f8feeb : enemy getcentroid();
    if (bullettracepassed(self geteye(), targetpoint, 0, enemy)) {
        self clearentitytarget();
        self.var_5a8f690 = 1;
        self.var_ea34ab74 = gettime() + 2000;
    } else {
        self.var_5a8f690 = 0;
        self.var_ea34ab74 = gettime() + 500;
    }
    return self.var_5a8f690;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x1 linked
// Checksum 0x3e185f00, Offset: 0x2710
// Size: 0xfc
function function_5f460765() {
    if ((isdefined(getgametypesetting(#"hash_26f00de198472b81")) ? getgametypesetting(#"hash_26f00de198472b81") : 0) && (isdefined(getgametypesetting(#"hash_50c10372c80d0a6b")) ? getgametypesetting(#"hash_50c10372c80d0a6b") : 0) != 0) {
        return (isdefined(getgametypesetting(#"hash_50c10372c80d0a6b")) ? getgametypesetting(#"hash_50c10372c80d0a6b") : 0);
    }
    return undefined;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x1 linked
// Checksum 0xde87ceb3, Offset: 0x2818
// Size: 0x5e0
function ai_wz_can_see() {
    aiprofile_beginentry("ai_wz_can_see");
    /#
        if (getdvarint(#"wz_ai_on", 0) > 2) {
            aiprofile_endentry();
            return undefined;
        }
    #/
    players_in_zone = [];
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        if (isdefined(players[i].ai_zone) && isdefined(self.ai_zone) && players[i].ai_zone == self.ai_zone) {
            if (!isdefined(players_in_zone)) {
                players_in_zone = [];
            } else if (!isarray(players_in_zone)) {
                players_in_zone = array(players_in_zone);
            }
            players_in_zone[players_in_zone.size] = players[i];
        } else if (getdvarint(#"survival_prototype", 0) && !isdefined(players[i].ai_zone) && !isdefined(self.ai_zone)) {
            if (!isdefined(players_in_zone)) {
                players_in_zone = [];
            } else if (!isarray(players_in_zone)) {
                players_in_zone = array(players_in_zone);
            }
            players_in_zone[players_in_zone.size] = players[i];
        } else if (isdefined(self.ai_zone) && isdefined(self.ai_zone.is_global) && self.ai_zone.is_global) {
            if (!isdefined(players_in_zone)) {
                players_in_zone = [];
            } else if (!isarray(players_in_zone)) {
                players_in_zone = array(players_in_zone);
            }
            players_in_zone[players_in_zone.size] = players[i];
        }
    }
    n_max_dist = undefined;
    if ((isdefined(getgametypesetting(#"hash_26f00de198472b81")) ? getgametypesetting(#"hash_26f00de198472b81") : 0) && !(isdefined(getgametypesetting(#"hash_77af5743dec010ae")) ? getgametypesetting(#"hash_77af5743dec010ae") : 0)) {
        n_max_dist = getdvarint(#"hash_5a59019abe7dc15d", 5000);
    }
    if (getdvarint(#"survival_prototype", 0)) {
        n_max_dist = 1650;
    }
    var_13324143 = arraysortclosest(players_in_zone, self.origin, 4, undefined, n_max_dist);
    if (isdefined(self.var_ff3f3261) && self.var_ff3f3261 && isdefined(var_13324143[0])) {
        aiprofile_endentry();
        return var_13324143[0];
    }
    var_a5b66044 = [];
    var_1f79ce88 = [];
    foreach (player in var_13324143) {
        if (self function_f10600c(player)) {
            var_a5b66044[var_a5b66044.size] = player;
            var_1f79ce88[var_1f79ce88.size] = isdefined(player.last_valid_position) ? player.last_valid_position : player.origin;
        }
    }
    iteration_limit = function_5f460765();
    if (!isdefined(iteration_limit)) {
        pathdata = generatenavmeshpath(self.origin, var_1f79ce88, self);
    } else {
        pathdata = generatenavmeshpath(self.origin, var_1f79ce88, self, undefined, undefined, iteration_limit);
    }
    if (isdefined(pathdata) && pathdata.status == "succeeded") {
        var_4a71d96f = arraygetclosest(pathdata.pathpoints[pathdata.pathpoints.size - 1], var_a5b66044);
    }
    aiprofile_endentry();
    return var_4a71d96f;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 2, eflags: 0x1 linked
// Checksum 0x538fbdf6, Offset: 0x2e00
// Size: 0xfe
function get_closest_player(str_zone, v_origin) {
    n_closest_dist = 9999999;
    var_655f39be = undefined;
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        if (isdefined(players[i].ai_zone) && players[i].ai_zone == str_zone) {
            n_dist = distance(players[i].origin, v_origin);
            if (n_dist < n_closest_dist) {
                n_closest_dist = n_dist;
                var_655f39be = players[i];
            }
        }
    }
    return var_655f39be;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 2, eflags: 0x1 linked
// Checksum 0x41fa5d17, Offset: 0x2f08
// Size: 0x130
function fake_physicslaunch(target_pos, power) {
    dist = distance(self.origin, target_pos);
    time = float(function_60d95f53()) / 1000;
    if (dist > 0.01) {
        time = dist / power;
        drop = -0.5 * level.item_gravity * time * time;
        delta = target_pos - self.origin;
        velocity = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
        self movegravity(velocity, time);
    }
    return time;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 6, eflags: 0x1 linked
// Checksum 0x89ba6503, Offset: 0x3040
// Size: 0x1c6
function function_7a1e21a9(attacker, v_origin, min_radius = 50, max_radius = 70, var_4dd1cd8b = 100, var_8c20ac00 = 100) {
    self endon(#"delete");
    self.origin = v_origin + vectorscale((0, 0, 1), 10);
    if (isdefined(attacker) && isdefined(attacker.usingvehicle) && attacker.usingvehicle) {
        min_radius = var_4dd1cd8b;
        max_radius = var_8c20ac00;
    }
    dest_origin = function_e1cd5954(v_origin, min_radius, max_radius);
    n_power = 100;
    time = self fake_physicslaunch(dest_origin, n_power);
    if (self.item.name == #"ray_gun") {
        self playsound(#"mus_raygun_stinger");
    } else {
        self playsound(#"zmb_spawn_powerup");
    }
    wait(time);
    if (isdefined(self)) {
        self.origin = dest_origin;
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 3, eflags: 0x1 linked
// Checksum 0x34275d2f, Offset: 0x3210
// Size: 0x324
function function_d92e3c5a(attacker, ai_zone, itemlist) {
    if (!isdefined(self.var_6a7537d8)) {
        self.var_6a7537d8 = 1;
    }
    v_origin = self.origin;
    items = self namespace_65181344::function_fd87c780(itemlist, self.var_6a7537d8);
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.var_e575a1bb)) {
        min_radius = self.var_e575a1bb;
    } else {
        min_radius = undefined;
    }
    if (isdefined(self.var_40c895b9)) {
        max_radius = self.var_40c895b9;
    } else {
        max_radius = undefined;
    }
    if (isdefined(self.var_e154425f)) {
        var_ad797f55 = self.var_e154425f;
    } else {
        var_4dd1cd8b = undefined;
    }
    if (isdefined(self.var_4f53e075)) {
        var_8c20ac00 = self.var_4f53e075;
    } else {
        var_8c20ac00 = undefined;
    }
    for (i = 0; i < items.size; i++) {
        item = items[i];
        if (isdefined(item)) {
            if (isdefined(level.var_c64b3b46) && level.var_c64b3b46) {
                if (isdefined(item.var_a6762160) && isdefined(ai_zone) && isdefined(ai_zone.item_drops)) {
                    if (!isdefined(ai_zone.item_drops[self.archetype])) {
                        ai_zone.item_drops[self.archetype] = [];
                    }
                    if (!isdefined(ai_zone.item_drops[self.archetype][item.var_a6762160.name])) {
                        ai_zone.item_drops[self.archetype][item.var_a6762160.name] = {};
                    }
                    if (!isdefined(ai_zone.item_drops[self.archetype][item.var_a6762160.name].count)) {
                        ai_zone.item_drops[self.archetype][item.var_a6762160.name].count = 0;
                    }
                    ai_zone.item_drops[self.archetype][item.var_a6762160.name].count++;
                }
            }
            item thread function_7a1e21a9(attacker, v_origin, min_radius, max_radius, var_4dd1cd8b, var_8c20ac00);
        }
        waitframe(1);
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 3, eflags: 0x1 linked
// Checksum 0x6078db6, Offset: 0x3540
// Size: 0x146
function function_e1cd5954(v_origin, min_radius, max_radius) {
    var_9bd6c1ae = v_origin;
    queryresult = positionquery_source_navigation(var_9bd6c1ae, min_radius, max_radius, 500, 4);
    if (isdefined(queryresult.data[0])) {
        var_9bd6c1ae = queryresult.data[randomint(queryresult.data.size)].origin;
    } else {
        var_9bd6c1ae = v_origin;
    }
    trace = bullettrace(var_9bd6c1ae + vectorscale((0, 0, 1), 40), var_9bd6c1ae + vectorscale((0, 0, -1), 150), 0, undefined);
    if (trace[#"fraction"] < 1) {
        var_9bd6c1ae = trace[#"position"];
    }
    return var_9bd6c1ae + vectorscale((0, 0, 1), 3);
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x8cb0a3c5, Offset: 0x3690
// Size: 0x320
function function_9fa1c215(ai_zone) {
    if (isdefined(level.var_18bf5e98)) {
        return [[ level.var_18bf5e98 ]]();
    }
    itemlist = level.zombie_itemlist;
    var_1130690 = 0;
    if (isdefined(level.var_b4143320) && level.var_b4143320) {
        var_d0c1e811 = 0;
        if (isdefined(level.deathcircle) && isdefined(level.deathcircleindex)) {
            if (level.deathcircleindex < level.var_1a35832e) {
                var_d0c1e811 = 1;
            }
        } else {
            var_d0c1e811 = 1;
        }
        if (var_d0c1e811 && isdefined(ai_zone) && ai_zone.var_c573acdd == ai_zone.var_ce8df1c9) {
            if (level.var_d5cd88c2 < level.var_acfc1745 && randomfloat(1) <= 0.3) {
                itemlist = level.var_1b7acd6d;
                level.var_d5cd88c2++;
                var_1130690 = 1;
                level.var_57a77bb = 1;
            }
            if (!level.var_2510617f < level.var_1b2f5c9d && randomfloat(1) <= 0.3) {
                itemlist = level.var_72151997;
                level.var_2510617f++;
                var_1130690 = 1;
                level.var_57a77bb = 0;
            }
            if (!level.var_6eb6193a < level.var_ad2edeba && randomfloat(1) <= 0.3) {
                itemlist = level.var_14364e26;
                level.var_6eb6193a++;
                var_1130690 = 1;
                level.var_57a77bb = 0;
            }
            if (!level.var_7dff87f1 < level.var_a71296ac && randomfloat(1) <= 0.3) {
                itemlist = level.var_7d2bc89;
                level.var_7dff87f1++;
                var_1130690 = 1;
                level.var_57a77bb = 0;
            }
        }
    }
    if (!var_1130690) {
        if (randomint(100) <= 2) {
            if (!level.var_8a3036cc) {
                itemlist = level.var_db43cbd7;
                level.var_8a3036cc = 1;
            }
        }
    }
    if (isdefined(ai_zone)) {
        ai_zone.var_c573acdd++;
    }
    return itemlist;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0xa05dd88b, Offset: 0x39b8
// Size: 0x3e4
function function_f311bd4c(ai_zone) {
    self notify("54de30d16f7f89db");
    self endon("54de30d16f7f89db");
    waitresult = undefined;
    waitresult = self waittill(#"death");
    var_a98b31aa = isdefined(self.ai_zone) && isdefined(self.ai_zone.def);
    self.ai_zone = undefined;
    if (isdefined(self.fxent)) {
        self clientfield::set("zombie_has_microwave", 0);
        self.fxent delete();
    }
    if (isplayer(waitresult.attacker)) {
        if (isdefined(self.quacknarok) && self.quacknarok) {
            self.quacknarok = 0;
            self detach(#"p8_zm_red_floatie_duck", "j_spinelower");
            self clientfield::set("zombie_died", 1);
        }
        scoreevents::processscoreevent(#"zombie_kills", waitresult.attacker, undefined, undefined);
        var_b25650ab = spawnstruct();
        var_b25650ab.origin = self.origin;
        var_b25650ab.archetype = self.archetype;
        if (isdefined(self.var_e575a1bb)) {
            var_b25650ab.var_e575a1bb = self.var_e575a1bb;
        }
        if (isdefined(self.var_40c895b9)) {
            var_b25650ab.var_40c895b9 = self.var_40c895b9;
        }
        if (isdefined(self.var_e154425f)) {
            var_b25650ab.var_e154425f = self.var_e154425f;
        }
        if (isdefined(self.var_4f53e075)) {
            var_b25650ab.var_4f53e075 = self.var_4f53e075;
        }
        if (isdefined(var_a98b31aa) || isdefined(self.var_54f8158e) && self.var_54f8158e) {
            if (!level.inprematchperiod) {
                waitresult.attacker stats::function_d40764f3(#"kills_zombie", 1);
            }
            if (isdefined(self.var_2cee3556)) {
                var_b25650ab.var_2cee3556 = self.var_2cee3556;
                foreach (item_list, drop_count in var_b25650ab.var_2cee3556) {
                    var_b25650ab.var_6a7537d8 = drop_count;
                    var_b25650ab function_d92e3c5a(waitresult.attacker, ai_zone, item_list);
                }
            } else if (isdefined(self.var_ef46cd4)) {
                self function_d92e3c5a(waitresult.attacker, ai_zone, self.var_ef46cd4);
            } else {
                itemlist = function_9fa1c215(ai_zone);
                if (isdefined(itemlist)) {
                    self function_d92e3c5a(waitresult.attacker, ai_zone, itemlist);
                }
            }
        }
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x33f2404, Offset: 0x3da8
// Size: 0xb2
function function_9758722(speed) {
    if (self.zombie_move_speed === speed) {
        return;
    }
    self.zombie_move_speed = speed;
    if (!isdefined(self.zombie_arms_position)) {
        self.zombie_arms_position = math::cointoss() == 1 ? "up" : "down";
    }
    if (isdefined(level.var_9ee73630)) {
        self.variant_type = randomint(level.var_9ee73630[self.zombie_move_speed][self.zombie_arms_position]);
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x122e30c, Offset: 0x3e68
// Size: 0x16e
function get_pathnode_path(pathnode) {
    path_struct = {#loops:0, #path:array(pathnode)};
    var_592eaf7 = pathnode;
    while (isdefined(var_592eaf7.target)) {
        var_592eaf7 = getnode(var_592eaf7.target, "targetname");
        if (!isdefined(var_592eaf7)) {
            break;
        }
        if (isinarray(path_struct.path, var_592eaf7)) {
            path_struct.loops = 1;
            break;
        }
        if (!isdefined(path_struct.path)) {
            path_struct.path = [];
        } else if (!isarray(path_struct.path)) {
            path_struct.path = array(path_struct.path);
        }
        path_struct.path[path_struct.path.size] = var_592eaf7;
    }
    return path_struct;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 2, eflags: 0x1 linked
// Checksum 0x952d83e8, Offset: 0x3fe0
// Size: 0xae
function function_9a5f0c0(startpt, endpt) {
    self endon(#"delete");
    self.origin = startpt + vectorscale((0, 0, 1), 10);
    time = self fake_physicslaunch(endpt, 100);
    self playsound(#"zmb_spawn_powerup");
    wait(time);
    if (isdefined(self)) {
        self.origin = endpt;
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 2, eflags: 0x1 linked
// Checksum 0x3507f15a, Offset: 0x4098
// Size: 0x114
function function_bf357ddf(spawnpt, itemlist) {
    waitresult = undefined;
    waitresult = self waittill(#"death");
    if (isdefined(spawnpt.target)) {
        var_10508147 = struct::get(spawnpt.target, "targetname");
        items = self namespace_65181344::function_fd87c780(itemlist, 1);
        for (i = 0; i < items.size; i++) {
            item = items[i];
            if (isdefined(item)) {
                item thread function_9a5f0c0(self.origin, var_10508147.origin);
            }
            waitframe(1);
        }
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 3, eflags: 0x1 linked
// Checksum 0xb227ce91, Offset: 0x41b8
// Size: 0x174
function function_ac114e1f(spawnpt, aitype, zone_name) {
    players = getplayers();
    spawned = spawnactor(aitype, spawnpt.origin, spawnpt.angles, "wz_dyn_ai");
    if (isdefined(spawned)) {
        spawned thread function_7adc1e46(undefined, 0);
        spawned.spawn_anim = undefined;
        spawned.var_b8c61fc5 = 0;
        spawned.var_ef59b90 = 3;
        spawned wz_ai_zombie::function_d1e55248(#"hash_6e6d6ff06622efa4", 1);
        spawned.var_721a3dbd = 0;
        spawned.var_35eedf58 = 0;
        spawned.disable_movement = 1;
        spawned.var_ea7e9b57 = wz_ai_zonemgr::function_aacb2027(zone_name, aitype);
        if (isdefined(zone_name)) {
            itemlist = function_9fa1c215(zone_name);
            spawned thread function_bf357ddf(spawnpt, itemlist);
        }
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x8f159b79, Offset: 0x4338
// Size: 0xfe
function function_f656f22e(ai_zone) {
    all_ai = getaiteamarray(#"world");
    if (isdefined(all_ai) && all_ai.size > 0) {
        foreach (ai in all_ai) {
            if (isdefined(ai.var_ea7e9b57) && ai.var_ea7e9b57 == ai_zone) {
                ai kill(undefined, undefined, undefined, undefined, 0, 1);
                waitframe(1);
            }
        }
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 2, eflags: 0x1 linked
// Checksum 0xe6bd19ef, Offset: 0x4440
// Size: 0x1aa
function get_attackable(entity, var_83917763) {
    if (!(isdefined(var_83917763) && var_83917763) && !isinarray(level.var_8de0b84e, entity getentitynumber())) {
        return undefined;
    }
    if (isdefined(level.attackables)) {
        arrayremovevalue(level.attackables, undefined);
        foreach (attackable in level.attackables) {
            if (!isdefined(attackable.var_b79a8ac7) || !isdefined(attackable.var_b79a8ac7.var_f019ea1a)) {
                continue;
            }
            dist = distancesquared(entity.origin, attackable.origin);
            if (dist < attackable.var_b79a8ac7.var_f019ea1a * attackable.var_b79a8ac7.var_f019ea1a) {
                if (attackable get_attackable_slot(entity)) {
                    return attackable;
                }
            }
        }
    }
    return undefined;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0xf4e9c884, Offset: 0x45f8
// Size: 0x21e
function get_attackable_slot(entity) {
    if (!isdefined(self.var_b79a8ac7)) {
        return 0;
    }
    self clear_slots();
    var_4dbfc246 = [];
    var_34bcb139 = [];
    foreach (slot in self.var_b79a8ac7.slots) {
        if (!isdefined(slot.entity)) {
            var_34bcb139[var_34bcb139.size] = slot;
        }
    }
    if (var_34bcb139.size == 0) {
        return 0;
    }
    var_754df93c = entity.origin;
    strteleportst = arraygetclosest(var_754df93c, var_34bcb139);
    if (strteleportst.on_navmesh) {
        var_acdc8d71 = getclosestpointonnavmesh(strteleportst.origin, entity getpathfindingradius(), entity getpathfindingradius());
        if (isdefined(var_acdc8d71)) {
            strteleportst.entity = entity;
            entity.var_b238ef38 = {#position:var_acdc8d71, #slot:strteleportst};
            return 1;
        }
    } else {
        strteleportst.entity = entity;
        entity.var_b238ef38 = {#position:strteleportst.origin, #slot:strteleportst};
        return 1;
    }
    return 0;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x1 linked
// Checksum 0x80cfb7ac, Offset: 0x4820
// Size: 0xe6
function clear_slots() {
    if (!isdefined(self.var_b79a8ac7)) {
        return;
    }
    foreach (slot in self.var_b79a8ac7.slots) {
        if (!isalive(slot.entity)) {
            slot.entity = undefined;
        } else if (isdefined(slot.entity.missinglegs) && slot.entity.missinglegs) {
            slot.entity = undefined;
        }
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x1790aa06, Offset: 0x4910
// Size: 0x5e
function function_2b925fa5(entity) {
    if (isdefined(entity.attackable)) {
        entity.attackable = undefined;
    }
    if (isdefined(entity.var_b238ef38)) {
        entity.var_b238ef38.slot.entity = undefined;
        entity.var_b238ef38 = undefined;
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 6, eflags: 0x1 linked
// Checksum 0x94b39094, Offset: 0x4978
// Size: 0x3ba
function function_bdb2b85b(entity, origin, angles, radius, num_spots, var_7a2632b5) {
    level endon(#"game_ended");
    slots = [];
    mins = vectorscale((-1, -1, 0), 10);
    maxs = (10, 10, 48);
    /#
        record3dtext("<unknown string>", origin, (0, 0, 1));
    #/
    for (i = 0; i < num_spots; i++) {
        t = mapfloat(0, num_spots, 0, 360, i);
        x = radius * cos(t + angles[1]);
        y = radius * sin(t + angles[1]);
        pos = (x, y, 0) + origin;
        if (!bullettracepassed(origin + vectorscale((0, 0, 1), 5), pos + vectorscale((0, 0, 1), 5), 0, entity)) {
            if (i % 2 == 1) {
                waitframe(1);
            }
        } else {
            var_e07c7e8 = physicstrace(pos + vectorscale((0, 0, 1), 10), pos + vectorscale((0, 0, -1), 10), mins, maxs, self, 1);
            var_c060661b = var_e07c7e8[#"position"];
            var_3e98a413 = getclosestpointonnavmesh(var_c060661b, 64, 15);
            if (isdefined(var_3e98a413)) {
                /#
                    recordstar(var_3e98a413, (0, 1, 0));
                #/
                slots[slots.size] = {#on_navmesh:1, #origin:var_3e98a413};
            } else if (isdefined(var_c060661b)) {
                if (isdefined(var_7a2632b5)) {
                    var_acdc8d71 = getclosestpointonnavmesh(var_c060661b, var_7a2632b5, 15);
                }
                /#
                    if (isdefined(var_acdc8d71)) {
                        recordstar(var_acdc8d71, (1, 0, 1));
                    }
                #/
                /#
                    recordstar(var_c060661b, (1, 0.5, 0));
                #/
                slots[slots.size] = {#var_acdc8d71:var_acdc8d71, #on_navmesh:0, #origin:var_c060661b};
            }
            if (i % 2 == 1) {
                waitframe(1);
            }
        }
    }
    return slots;
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x447dd9bc, Offset: 0x4d40
// Size: 0x1fc
function function_16e2f075(params) {
    self.var_cd7665dd = gettime();
    if (isdefined(self.var_1b5e8136) && gettime() - self.var_1b5e8136 > 1000) {
        return;
    }
    if (!(isdefined(self.var_85c3882d) && self.var_85c3882d)) {
        self.var_1b5e8136 = gettime();
    }
    self.var_85c3882d = 1;
    if (!(isdefined(self.var_a9d9d11b) && self.var_a9d9d11b) || self.var_a9d9d11b < gettime()) {
        self.var_a9d9d11b = gettime() + 500;
        if (getdvarint(#"survival_prototype", 0)) {
            damageamount = randomintrange(20, 60);
            self notify(#"hash_1c3d0eb6bfd8461a");
        } else {
            damageamount = 30;
        }
        self dodamage(damageamount, self.origin, params.wire.owner, params.wire, undefined, "MOD_IMPACT", 0, level.var_87226c31.var_3e7344ee);
    }
    if (isdefined(level.var_f2e76de4)) {
        if (!isinarray(level.var_f2e76de4, self)) {
            level.var_f2e76de4[level.var_f2e76de4.size] = self;
        }
    } else {
        level.var_f2e76de4 = array(self);
        level thread function_7a87d2a7();
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 1, eflags: 0x1 linked
// Checksum 0x1e0eefa7, Offset: 0x4f48
// Size: 0x1ea
function function_7a87d2a7(damageduration) {
    level endon(#"game_ended");
    self endon(#"death");
    while (1) {
        var_202d087b = [];
        foreach (ai in level.var_f2e76de4) {
            if (!isdefined(ai) || !isalive(ai)) {
                var_202d087b[var_202d087b.size] = ai;
            } else {
                var_3a8a4c13 = gettime() - ai.var_1b5e8136;
                if (var_3a8a4c13 > 1000) {
                    ai.var_85c3882d = undefined;
                }
                timesincelast = gettime() - ai.var_cd7665dd;
                if (timesincelast > 250) {
                    ai.var_85c3882d = undefined;
                    ai.var_1b5e8136 = undefined;
                    var_202d087b[var_202d087b.size] = ai;
                }
            }
        }
        foreach (ai in var_202d087b) {
            arrayremovevalue(level.var_f2e76de4, ai);
        }
        waitframe(1);
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x0
// Checksum 0x806bd337, Offset: 0x5140
// Size: 0x24
function function_516ff8da() {
    self.var_54f8158e = 1;
    self thread function_f311bd4c();
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x1 linked
// Checksum 0xf9ff8b20, Offset: 0x5170
// Size: 0x84
function function_b7dc3ab4() {
    if (isdefined(getgametypesetting(#"hash_2ce00db5cd5003ff")) ? getgametypesetting(#"hash_2ce00db5cd5003ff") : 0) {
        level function_71578099();
    } else {
        level function_9caf8627();
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x1 linked
// Checksum 0xa8c3407c, Offset: 0x5200
// Size: 0x3b6
function function_71578099() {
    nodes = getallnodes();
    foreach (node in nodes) {
        if (node.type != #"begin") {
            continue;
        }
        if (isdefined(node.targetname)) {
            dynentarray = function_c79d31c4(node.targetname);
            if (isdefined(dynentarray) && dynentarray.size > 0) {
                var_a6131e58 = 0;
                foreach (dynent in dynentarray) {
                    if (dynent.var_15d44120 === #"p8_fxanim_wz_rollup_door_medium_mod") {
                        var_a6131e58 = 1;
                        break;
                    }
                }
                if (!var_a6131e58) {
                    foreach (ai_zone in level.var_5b357434) {
                        var_8d8a9cfc = istouching(node.origin, ai_zone.def);
                        if (!var_8d8a9cfc) {
                            var_c88f4455 = getothernodeinnegotiationpair(node);
                            if (isdefined(var_c88f4455)) {
                                var_8d8a9cfc = istouching(var_c88f4455.origin, ai_zone.def);
                            }
                        }
                        if (var_8d8a9cfc) {
                            ai_zone.var_336d2f53[ai_zone.var_336d2f53.size] = node;
                            node.ai_zone = ai_zone;
                            break;
                        }
                    }
                } else {
                    function_dc0a8e61(node, 1);
                    var_c88f4455 = getothernodeinnegotiationpair(node);
                    if (isdefined(var_c88f4455)) {
                        function_dc0a8e61(var_c88f4455, 1);
                    }
                }
                if (!isdefined(node.ai_zone) && !var_a6131e58) {
                    linktraversal(node);
                }
                foreach (dynent in dynentarray) {
                    dynent.var_993e9bb0 = 1;
                    dynent.var_a6131e58 = var_a6131e58;
                }
            }
        }
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x1 linked
// Checksum 0x291ce07b, Offset: 0x55c0
// Size: 0x22e
function function_9caf8627() {
    nodes = getallnodes();
    foreach (node in nodes) {
        if (node.type != #"begin" && node.type != #"end") {
            continue;
        }
        var_e209e8e0 = 0;
        if (isdefined(node.targetname)) {
            dynentarray = function_c79d31c4(node.targetname);
            var_e209e8e0 = isdefined(dynentarray) && dynentarray.size > 0;
        }
        if (!var_e209e8e0) {
            var_c88f4455 = getothernodeinnegotiationpair(node);
            if (!isdefined(var_c88f4455) || !isdefined(var_c88f4455.targetname)) {
                continue;
            }
            dynentarray = function_c79d31c4(var_c88f4455.targetname);
            var_e209e8e0 = isdefined(dynentarray) && dynentarray.size > 0;
        }
        if (var_e209e8e0) {
            function_dc0a8e61(node, 1);
            foreach (dynent in dynentarray) {
                dynent.var_993e9bb0 = 1;
            }
        }
    }
}


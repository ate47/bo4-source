// Atian COD Tools GSC decompiler test
#using scripts\core_common\scene_vehicle_shared.gsc;
#using scripts\core_common\scene_model_shared.gsc;
#using scripts\core_common\scene_actor_shared.gsc;
#using scripts\core_common\scene_player_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\teleport_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\bots\bot_util.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace scene;

// Namespace scene
// Method(s) 104 Total 104
class csceneobject {

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x9 linked
    // Checksum 0x7fdff29e, Offset: 0x878
    // Size: 0x26
    __constructor() {
        self._b_first_frame = 0;
        self._b_active_anim = 0;
        self._n_blend = 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x11 linked
    // Checksum 0x35082c65, Offset: 0x8a8
    // Size: 0x24
    __destructor() {
        /#
            log("sharedplayer");
        #/
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x41ce3f8e, Offset: 0x9098
    // Size: 0xc4
    function warning(condition, str_msg) {
        if (condition) {
            str_msg = "[ " + self._o_scene._str_name + " ] " + (isdefined("no name") ? "" + "no name" : isdefined(self._s.name) ? "" + self._s.name : "") + ": " + str_msg;
            /#
                scene::warning_on_screen(str_msg);
            #/
            return 1;
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa1207e7e, Offset: 0x8f18
    // Size: 0x178
    function error(condition, str_msg) {
        if (condition) {
            str_msg = "[ " + self._o_scene._str_name + " ][ " + (isdefined("unknown shot") ? "" + "unknown shot" : isdefined(self._str_shot) ? "" + self._str_shot : "") + " ] " + (isdefined("no name") ? "" + "no name" : isdefined(self._s.name) ? "" + self._s.name : "") + ": " + str_msg;
            if (isdefined(self._o_scene._b_testing) && self._o_scene._b_testing) {
                /#
                    scene::error_on_screen(str_msg);
                #/
            } else {
                /#
                    assertmsg(str_msg);
                #/
            }
            thread [[ self._o_scene ]]->on_error();
            return 1;
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x56fe1cb3, Offset: 0x8e38
    // Size: 0xd4
    function log(str_msg) {
        /#
            println(self._o_scene._s.type + "<unknown string>" + function_9e72a96(self._o_scene._str_name) + "<unknown string>" + (isdefined("<unknown string>") ? "<unknown string>" + "<unknown string>" : isdefined(self._s.name) ? "<unknown string>" + self._s.name : "<unknown string>") + "<unknown string>" + str_msg);
        #/
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x7295dd9a, Offset: 0x8e00
    // Size: 0x30
    function is_skipping_scene() {
        return isdefined([[ self._o_scene ]]->is_skipping_scene()) && [[ self._o_scene ]]->is_skipping_scene();
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x92b6a6b9, Offset: 0x8dc8
    // Size: 0x2c
    function skip_scene(b_wait_one_frame) {
        if (isdefined(b_wait_one_frame)) {
            waitframe(1);
        }
        skip_scene_shot_animations();
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x8aba385a, Offset: 0x8d58
    // Size: 0x66
    function skip_scene_shot_animations() {
        if (isdefined(self.current_playing_anim) && isdefined(self.current_playing_anim[self._n_ent_num])) {
            if (skip_animation_on_client()) {
                waitframe(1);
            }
            skip_animation_on_server();
        }
        self notify(#"skip_camera_anims");
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x2aab459, Offset: 0x8b58
    // Size: 0x1f4
    function skip_animation_on_server() {
        if (isdefined(self.current_playing_anim[self._n_ent_num])) {
            if (is_shared_player()) {
                foreach (player in [[ self._func_get ]](self._str_team)) {
                    /#
                        if (getdvarint(#"debug_scene_skip", 0) > 0) {
                            printtoprightln("<unknown string>" + self.current_playing_anim[player getentitynumber()] + "<unknown string>" + gettime(), vectorscale((1, 1, 1), 0.8));
                        }
                    #/
                    skip_anim_on_server(player, self.current_playing_anim[player getentitynumber()]);
                }
                return;
            }
            /#
                if (getdvarint(#"debug_scene_skip", 0) > 0) {
                    printtoprightln("<unknown string>" + self.current_playing_anim[self._n_ent_num] + "<unknown string>" + gettime(), vectorscale((1, 1, 1), 0.8));
                }
            #/
            skip_anim_on_server(self._e, self.current_playing_anim[self._n_ent_num]);
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x31c93f1e, Offset: 0x8950
    // Size: 0x1fc
    function skip_animation_on_client() {
        if (isdefined(self.current_playing_anim[self._n_ent_num])) {
            if (is_shared_player()) {
                foreach (player in [[ self._func_get ]](self._str_team)) {
                    /#
                        if (getdvarint(#"debug_scene_skip", 0) > 0) {
                            printtoprightln("<unknown string>" + self.current_playing_anim[player getentitynumber()] + "<unknown string>" + gettime(), vectorscale((1, 1, 1), 0.8));
                        }
                    #/
                    skip_anim_on_client(player, self.current_playing_anim[player getentitynumber()]);
                }
            } else {
                /#
                    if (getdvarint(#"debug_scene_skip", 0) > 0) {
                        printtoprightln("<unknown string>" + self.current_playing_anim[self._n_ent_num] + "<unknown string>" + gettime(), vectorscale((1, 1, 1), 0.8));
                    }
                #/
                skip_anim_on_client(self._e, self.current_playing_anim[self._n_ent_num]);
            }
            return 1;
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xbe132daa, Offset: 0x8888
    // Size: 0xbc
    function skip_anim_on_server(entity, anim_name) {
        if (!isdefined(anim_name)) {
            return;
        }
        if (!isdefined(entity)) {
            return;
        }
        if (!entity isplayinganimscripted() || self._str_current_anim !== anim_name) {
            return;
        }
        if (isanimlooping(anim_name)) {
            entity animation::stop();
        } else {
            entity setanimtimebyname(anim_name, 1);
        }
        entity stopsounds();
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xd7a94502, Offset: 0x8808
    // Size: 0x74
    function skip_anim_on_client(entity, anim_name) {
        if (!isdefined(anim_name)) {
            return;
        }
        if (!isdefined(entity)) {
            return;
        }
        if (!entity isplayinganimscripted()) {
            return;
        }
        if (isanimlooping(anim_name)) {
            return;
        }
        entity clientfield::increment("player_scene_animation_skip");
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x44479fac, Offset: 0x86f0
    // Size: 0x10a
    function _should_skip_anim(animation) {
        if (isdefined(self._s.deletewhenfinished) && self._s.deletewhenfinished && is_skipping_scene() && !is_player() && !(isdefined(self._s.keepwhileskipping) && self._s.keepwhileskipping)) {
            if (!animhasimportantnotifies(animation)) {
                if (!isspawner(self._e)) {
                    e = scene::get_existing_ent(self._str_name, undefined, undefined, self._o_scene._str_name);
                    if (isdefined(e)) {
                        return 0;
                    }
                }
                return 1;
            }
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xf488c428, Offset: 0x8698
    // Size: 0x4a
    function in_a_different_scene() {
        return isdefined(self._e) && isdefined(self._e.current_scene) && self._e.current_scene != self._o_scene._str_name;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2851d456, Offset: 0x8578
    // Size: 0x118
    function in_this_scene(ent) {
        foreach (obj in self._o_scene._a_objects) {
            if (isplayer(ent)) {
                if (is_shared_player()) {
                    return 0;
                }
                if (function_527113ae() && !function_71b7c9e3(ent)) {
                    return 0;
                }
                if (obj._e === ent) {
                    return 1;
                }
                continue;
            }
            if (obj._e === ent) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x948064ae, Offset: 0x8550
    // Size: 0x1c
    function is_vehicle() {
        return self._s.type === "vehicle";
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x5a146ed5, Offset: 0x8500
    // Size: 0x48
    function is_actor() {
        return self._s.type === "actor" && !(isdefined(self._s.var_615b1f16) && self._s.var_615b1f16);
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xed35f32c, Offset: 0x8450
    // Size: 0xa4
    function function_71b7c9e3(player) {
        foreach (obj in self._o_scene._a_objects) {
            if (obj._e === player && [[ obj ]]->function_527113ae()) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x34580015, Offset: 0x8418
    // Size: 0x2e
    function function_527113ae() {
        return is_player() && !is_shared_player();
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x1b7cb7e5, Offset: 0x83f0
    // Size: 0x1c
    function is_shared_player() {
        return self._s.type === "sharedplayer";
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xa278a76f, Offset: 0x83c8
    // Size: 0x1c
    function function_209522a0() {
        return self._s.type === "playeroutfit";
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x933b64b7, Offset: 0x83a0
    // Size: 0x1c
    function is_player_model() {
        return self._s.type === "fakeplayer";
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x7d93773b, Offset: 0x8338
    // Size: 0x5a
    function is_player() {
        return self._s.type === "player" || self._s.type === "sharedplayer" || self._s.type === "playeroutfit";
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xd69ad800, Offset: 0x82b0
    // Size: 0x7c
    function function_3919a776() {
        if (self._o_scene._str_mode === "init" && (isdefined(self._s.var_686939) && self._s.var_686939 || isdefined(self._s.var_f9a5853f) && self._s.var_f9a5853f)) {
            return 1;
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xf856ddce, Offset: 0x8228
    // Size: 0x7c
    function is_alive() {
        return isdefined(self._e) && (!isai(self._e) || isalive(self._e)) && !(isdefined(self._e.isdying) && self._e.isdying);
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x253c7342, Offset: 0x81f0
    // Size: 0x2c
    function function_3e22944e() {
        return self._o_scene._e_root.var_1505fed6[self._s.name];
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x57a72e52, Offset: 0x81c0
    // Size: 0x28
    function function_48382a1c() {
        return isdefined(self._s.var_50f52c5b) && self._s.var_50f52c5b;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x8dde89f8, Offset: 0x8100
    // Size: 0xb8
    function function_5c2a9efa() {
        if (isdefined(self._o_scene._e_root) && isdefined(self._o_scene._e_root.var_1505fed6)) {
            a_str_keys = getarraykeys(self._o_scene._e_root.var_1505fed6);
            if (isdefined(self._s.name) && isinarray(a_str_keys, hash(self._s.name))) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x71a91717, Offset: 0x80a0
    // Size: 0x58
    function get_camera_tween_out() {
        n_camera_tween_out = isdefined(self.var_55b4f21e.cameratween) ? self.var_55b4f21e.cameratween : self._s.cameratweenout;
        return isdefined(n_camera_tween_out) ? n_camera_tween_out : 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xd782878b, Offset: 0x8040
    // Size: 0x58
    function get_camera_tween() {
        n_camera_tween = isdefined(self.var_55b4f21e.cameratween) ? self.var_55b4f21e.cameratween : self._s.cameratween;
        return isdefined(n_camera_tween) ? n_camera_tween : 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x4371a9bf, Offset: 0x8008
    // Size: 0x2c
    function get_lerp_time() {
        return isdefined(self._s.lerptime) ? self._s.lerptime : 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xfb8a9920, Offset: 0x7f50
    // Size: 0xae
    function regroup_invulnerability(e_player) {
        e_player endon(#"disconnect");
        e_player val::set(#"regroup", "ignoreme", 1);
        e_player.b_teleport_invulnerability = 1;
        e_player util::streamer_wait(undefined, 0, 7);
        e_player val::reset(#"regroup", "ignoreme");
        e_player.b_teleport_invulnerability = undefined;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x49394b61, Offset: 0x7d88
    // Size: 0x1bc
    function play_regroup_fx_for_scene(e_player) {
        align = get_align_ent();
        v_origin = align.origin;
        v_angles = align.angles;
        tag = get_align_tag();
        if (isdefined(tag)) {
            v_origin = align gettagorigin(tag);
            v_angles = align gettagangles(tag);
        }
        v_start = getstartorigin(v_origin, v_angles, self._s.mainanim);
        n_dist_sq = distancesquared(e_player.origin, v_start);
        if ((n_dist_sq > 250000 || isdefined(e_player.hijacked_vehicle_entity)) && !(isdefined(e_player.force_short_scene_transition_effect) && e_player.force_short_scene_transition_effect)) {
            self thread regroup_invulnerability(e_player);
            e_player clientfield::increment_to_player("postfx_igc", 1);
        } else {
            e_player clientfield::increment_to_player("postfx_igc", 3);
        }
        util::wait_network_frame();
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x4ee4fe56, Offset: 0x7c30
    // Size: 0x14a
    function kill_ent() {
        if (isarray(level.heroes) && isinarray(level.heroes, self._e)) {
            arrayremovevalue(level.heroes, self._e, 1);
            self._e notify(#"unmake_hero");
        }
        self._e util::stop_magic_bullet_shield();
        self._e.var_7136e83 = 1;
        self._e.skipdeath = 1;
        self._e.allowdeath = 1;
        self._e.skipscenedeath = 1;
        self._e._scene_object = undefined;
        if (isplayer(self._e)) {
            self._e disableinvulnerability();
        }
        self._e kill();
        self._e.var_7136e83 = undefined;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x80f724d1, Offset: 0x7c20
    // Size: 0x4
    function _spawn_ent() {
        
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xf241674a, Offset: 0x79a0
    // Size: 0x274
    function spawn_ent() {
        flagsys::set(#"spawning");
        b_disable_throttle = isdefined(self._o_scene._s.dontthrottle) && self._o_scene._s.dontthrottle;
        if (!b_disable_throttle) {
            spawner::global_spawn_throttle();
        }
        if (isspawner(self._e) && (is_actor() || is_vehicle())) {
            /#
                if (self._o_scene._b_testing) {
                    self._e.count++;
                }
            #/
            if (!error(self._e.count < 1, "Trying to spawn AI for scene with spawner count < 1")) {
                self._e = self._e spawner::spawn(1);
            }
        } else {
            [[ self ]]->_spawn_ent();
        }
        if (!isdefined(self._e)) {
            if (isdefined(self._s.model) && isdefined(self._o_scene._e_root)) {
                if (is_player_model()) {
                    self._e = util::spawn_anim_player_model(self._s.model, function_d2039b28(), function_f9936b53());
                } else {
                    self._e = util::spawn_anim_model(self._s.model, function_d2039b28(), function_f9936b53());
                }
            }
        }
        function_a04fb5f4();
        flagsys::clear(#"spawning");
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x529d96b6, Offset: 0x7958
    // Size: 0x3e
    function function_f9936b53() {
        return isdefined(self._o_scene._e_root.angles) ? self._o_scene._e_root.angles : (0, 0, 0);
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xe1586a13, Offset: 0x7910
    // Size: 0x3e
    function function_d2039b28() {
        return isdefined(self._o_scene._e_root.origin) ? self._o_scene._e_root.origin : (0, 0, 0);
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x655c6af1, Offset: 0x78f8
    // Size: 0xc
    function on_play_anim(ent) {
        
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xae515d8f, Offset: 0x7880
    // Size: 0x6c
    function function_98561e95() {
        self endon(#"hash_456b12fb28128d17");
        var_9f5994d7 = self.var_acbd43ee;
        self waittill(#"death", #"scene_stop");
        if (isdefined(var_9f5994d7)) {
            var_9f5994d7 delete();
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x833b1548, Offset: 0x7578
    // Size: 0x2fc
    function function_5c082667() {
        s_start_spot = function_3e22944e();
        if (!isdefined(s_start_spot.target)) {
            self._e waittill(#"player_downed", #"death", #"scene_stop");
            return;
        }
        self._e endon(#"death", #"scene_stop");
        s_current_struct = struct::get(s_start_spot.target);
        n_move_time = isdefined(s_start_spot.script_float) ? s_start_spot.script_float : 1;
        while (isdefined(s_current_struct)) {
            if (!isdefined(self._e.var_645ab05a)) {
                self._e.var_acbd43ee = util::spawn_model("tag_origin", self._e.origin, self._e.angles);
                self._e linkto(self._e.var_acbd43ee);
                self._e thread function_98561e95();
            }
            self._e.var_acbd43ee moveto(s_current_struct.origin, n_move_time);
            self._e.var_acbd43ee rotateto(s_current_struct.angles, n_move_time);
            self._e.var_acbd43ee waittill(#"movedone");
            if (isdefined(s_current_struct.script_float)) {
                n_move_time = s_current_struct.script_float;
            } else {
                n_move_time = 1;
            }
            if (isdefined(s_current_struct.target)) {
                s_current_struct = struct::get(s_current_struct.target);
                continue;
            }
            s_current_struct = undefined;
        }
        if (isdefined(self._e.var_acbd43ee)) {
            self._e.var_acbd43ee delete();
        }
        self._e unlink();
        self._e animation::stop();
        self._e notify(#"hash_456b12fb28128d17");
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 6, eflags: 0x1 linked
    // Checksum 0xd08c21d2, Offset: 0x6cd8
    // Size: 0x894
    function _play_anim(animation, n_rate, n_blend, n_time, var_7d32b2c6, paused) {
        if (self._e.scene_spawned === self._o_scene._s.name || function_527113ae() || self._o_scene._s scene::is_igc()) {
            if (!isdefined(n_blend) || isdefined(n_blend) && n_blend == 0) {
                self._e dontinterpolate();
            }
            self._e flagsys::set(#"hash_7cddd51e45d3ff3e");
        }
        function_a04fb5f4();
        n_lerp = isdefined(var_7d32b2c6) ? var_7d32b2c6 : get_lerp_time();
        if (is_player() && ![[ self ]]->function_6c1c67c1()) {
            endcamanimscripted(self._e);
            n_camera_tween = get_camera_tween();
            if (n_camera_tween > 0) {
                self._e startcameratween(n_camera_tween);
            }
        }
        if (![[ self._o_scene ]]->has_next_shot()) {
            n_blend_out = isai(self._e) ? 0.2 : 0;
        } else {
            n_blend_out = 0;
        }
        if (isdefined(self._s.diewhenfinished) && self._s.diewhenfinished || isdefined(self.var_55b4f21e.diewhenfinished) && self.var_55b4f21e.diewhenfinished) {
            n_blend_out = 0;
        }
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                printtoprightln("<unknown string>" + (isdefined(self._s.name) ? self._s.name : self._s.model) + "<unknown string>" + animation);
            }
        #/
        /#
            if (getdvarint(#"debug_scene_skip", 0) > 0) {
                if (!isdefined(level.animation_played)) {
                    level.animation_played = [];
                    animation_played_name = (isdefined(self._s.name) ? self._s.name : self._s.model) + "<unknown string>" + animation;
                    if (!isdefined(level.animation_played)) {
                        level.animation_played = [];
                    } else if (!isarray(level.animation_played)) {
                        level.animation_played = array(level.animation_played);
                    }
                    level.animation_played[level.animation_played.size] = animation_played_name;
                }
            }
        #/
        self.current_playing_anim[self._n_ent_num] = animation;
        if (is_skipping_scene() && n_rate != 0) {
            thread skip_scene_shot_animations();
        }
        [[ self ]]->on_play_anim(self._e);
        if (isdefined(self._s.var_69aabff2) && self._s.var_69aabff2) {
            b_unlink_after_completed = 0;
        }
        if (function_5c2a9efa()) {
            if (isactor(self._e) && isassetloaded("xanim", "chicken_dance_placeholder_loop")) {
                self._e thread animation::play(animation, self._e, self.m_tag, n_rate, n_blend, n_blend_out, n_lerp, n_time, self._s.showweaponinfirstperson);
            }
            function_5c082667();
        } else if (isdefined(self._s.issiege) && self._s.issiege) {
            self._e animation::play_siege(animation, n_rate);
        } else {
            self._e animation::play(animation, self.m_align, self.m_tag, n_rate, n_blend, n_blend_out, n_lerp, n_time, self._s.showweaponinfirstperson, b_unlink_after_completed, undefined, paused);
        }
        if (isplayer(self._e)) {
            self._e flagsys::clear(#"hash_7cddd51e45d3ff3e");
        }
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                log(toupper(self._s.type) + "<unknown string>" + function_9e72a96(animation) + "<unknown string>");
            }
        #/
        if (!isdefined(self._e) || !self._e isplayinganimscripted()) {
            self.current_playing_anim[self._n_ent_num] = undefined;
        }
        /#
            if (getdvarint(#"debug_scene_skip", 0) > 0) {
                if (isdefined(level.animation_played)) {
                    for (i = 0; i < level.animation_played.size; i++) {
                        animation_played_name = (isdefined(self._s.name) ? self._s.name : self._s.model) + "<unknown string>" + animation;
                        if (level.animation_played[i] == animation_played_name) {
                            arrayremovevalue(level.animation_played, animation_played_name);
                            i--;
                        }
                    }
                }
            }
            if (getdvarint(#"debug_scene", 0) > 0) {
                printtoprightln("<unknown string>" + (isdefined(self._s.name) ? self._s.name : self._s.model) + "<unknown string>" + animation);
            }
        #/
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x8234f93e, Offset: 0x6b28
    // Size: 0x1a4
    function function_a04fb5f4() {
        if ((self._o_scene._s scene::is_igc() || [[ self._o_scene ]]->has_player()) && !(isdefined(self._o_scene._b_testing) && self._o_scene._b_testing)) {
            if (function_527113ae()) {
                self._e setvisibletoall();
                return;
            }
            if (!isplayer(self._e)) {
                self._e setinvisibletoall();
                if (self._o_scene._str_team === "any") {
                    self._e setvisibletoall();
                    return;
                }
                if (self._o_scene._str_team === "allies") {
                    self._e setvisibletoallexceptteam("axis");
                    return;
                }
                if (self._o_scene._str_team === "axis") {
                    self._e setvisibletoallexceptteam("allies");
                    return;
                }
                self._e setvisibletoall();
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xfcdba9ac, Offset: 0x6588
    // Size: 0x596
    function update_alignment() {
        self.m_align = get_align_ent();
        self.m_tag = get_align_tag();
        var_2dd2901f = (isdefined(self._o_scene._s.var_922b4fc5) ? self._o_scene._s.var_922b4fc5 : 0, isdefined(self._o_scene._s.var_3e692842) ? self._o_scene._s.var_3e692842 : 0, isdefined(self._o_scene._s.var_be60a82b) ? self._o_scene._s.var_be60a82b : 0);
        var_acf1be3a = (isdefined(self._o_scene._s.var_16999a5d) ? self._o_scene._s.var_16999a5d : 0, isdefined(self._o_scene._s.var_29563fd6) ? self._o_scene._s.var_29563fd6 : 0, isdefined(self._o_scene._s.var_eb00c330) ? self._o_scene._s.var_eb00c330 : 0);
        var_24a7cd13 = (isdefined(self._s.var_922b4fc5) ? self._s.var_922b4fc5 : 0, isdefined(self._s.var_3e692842) ? self._s.var_3e692842 : 0, isdefined(self._s.var_be60a82b) ? self._s.var_be60a82b : 0);
        var_75cdf4bd = (isdefined(self._s.var_16999a5d) ? self._s.var_16999a5d : 0, isdefined(self._s.var_29563fd6) ? self._s.var_29563fd6 : 0, isdefined(self._s.var_eb00c330) ? self._s.var_eb00c330 : 0);
        var_2a3b0294 = (isdefined(self.var_55b4f21e.var_922b4fc5) ? self.var_55b4f21e.var_922b4fc5 : 0, isdefined(self.var_55b4f21e.var_3e692842) ? self.var_55b4f21e.var_3e692842 : 0, isdefined(self.var_55b4f21e.var_be60a82b) ? self.var_55b4f21e.var_be60a82b : 0);
        var_f3bd6699 = (isdefined(self.var_55b4f21e.var_16999a5d) ? self.var_55b4f21e.var_16999a5d : 0, isdefined(self.var_55b4f21e.var_29563fd6) ? self.var_55b4f21e.var_29563fd6 : 0, isdefined(self.var_55b4f21e.var_eb00c330) ? self.var_55b4f21e.var_eb00c330 : 0);
        if (isdefined(self._o_scene._s.var_6a17a93d) && self._o_scene._s.var_6a17a93d) {
            var_d3c21d73 = var_2dd2901f + var_2a3b0294 + var_24a7cd13;
            v_ang_offset = var_acf1be3a + var_f3bd6699 + var_75cdf4bd;
        } else {
            if (var_2a3b0294 != (0, 0, 0)) {
                var_d3c21d73 = var_2a3b0294;
            } else if (var_24a7cd13 != (0, 0, 0)) {
                var_d3c21d73 = var_24a7cd13;
            } else {
                var_d3c21d73 = var_2dd2901f;
            }
            if (var_f3bd6699 != (0, 0, 0)) {
                v_ang_offset = var_f3bd6699;
            } else if (var_75cdf4bd != (0, 0, 0)) {
                v_ang_offset = var_75cdf4bd;
            } else {
                v_ang_offset = var_acf1be3a;
            }
        }
        if (self.m_align == level) {
            self.m_align = (0, 0, 0) + var_d3c21d73;
            self.m_tag = (0, 0, 0) + v_ang_offset;
            return;
        }
        if (!isentity(self.m_align) && (var_d3c21d73 != (0, 0, 0) || v_ang_offset != (0, 0, 0))) {
            v_pos = self.m_align.origin + var_d3c21d73;
            v_ang = self.m_align.angles + v_ang_offset;
            self.m_align = {#angles:v_ang, #origin:v_pos};
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 4, eflags: 0x1 linked
    // Checksum 0x76ad3621, Offset: 0x6020
    // Size: 0x55a
    function play_anim(animation, b_camera_anim = 0, var_e052b59a = 0, n_start_time = 0) {
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                if (isdefined(self._s.name)) {
                    printtoprightln("<unknown string>" + self._s.name);
                } else {
                    printtoprightln("<unknown string>" + self._s.model);
                }
            }
        #/
        if (!is_shared_player()) {
            animation = [[ self ]]->animation_lookup(animation, undefined, b_camera_anim);
        }
        self._str_current_anim = animation;
        if (_should_skip_anim(animation)) {
            return;
        }
        if (self._b_first_frame || var_e052b59a) {
            n_rate = 0;
        } else {
            n_rate = 1;
        }
        if (n_rate > 0) {
            self._o_scene flagsys::wait_till(self._str_shot + "go");
        }
        if (function_b52254e6() && !function_f12c5e67(self.var_55b4f21e) && self._o_scene._str_mode !== "init") {
            self._e notify(#"stop_tracking_damage_scene_ent");
        }
        if (is_alive()) {
            update_alignment();
            n_time = n_start_time;
            if (n_time != 0) {
                n_time = [[ self._o_scene ]]->get_anim_relative_start_time(animation, n_time, b_camera_anim);
            }
            if (scene::function_a63b9bca(self._o_scene._str_name)) {
                n_time = 0.99;
                self._o_scene.n_start_time = 0.99;
            }
            if (function_5c2a9efa()) {
                [[ self ]]->_play_anim(animation, n_rate, self._n_blend, n_time);
                self._b_active_anim = 0;
                _dynamic_paths();
            } else if (var_e052b59a) {
                flagsys::set(#"scene_interactive_shot_active");
                n_rate = 0;
                n_time = 0;
                thread [[ self ]]->_play_anim(animation, n_rate, self._n_blend, n_time);
                self._b_active_anim = 1;
            } else if (b_camera_anim) {
                thread [[ self ]]->play_camera(self._str_current_anim, n_time);
            } else if (self._b_first_frame) {
                thread [[ self ]]->_play_anim(animation, n_rate, self._n_blend, n_time);
                self._b_first_frame = 0;
                self._b_active_anim = 1;
            } else if (isanimlooping(animation)) {
                if (self._str_shot === "init") {
                    thread [[ self ]]->_play_anim(animation, n_rate, self._n_blend, n_time);
                    self._b_active_anim = 1;
                } else {
                    if (function_b260bdcc(self._str_shot)) {
                        if (isdefined(self._o_scene._e_root)) {
                            self._o_scene._e_root notify(#"scene_done", {#str_scenedef:self._o_scene._str_name});
                        }
                        self._e notify(#"scene_done", {#str_scenedef:self._o_scene._str_name});
                    }
                    [[ self ]]->_play_anim(animation, n_rate, self._n_blend, n_time);
                    self._b_active_anim = 0;
                }
            } else {
                [[ self ]]->_play_anim(animation, n_rate, self._n_blend, n_time);
                self._b_active_anim = 0;
                _dynamic_paths();
            }
            _blend = 0;
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0x33cd8632, Offset: 0x5fd8
    // Size: 0x40
    function animation_lookup(animation, ent = self._e, b_camera = 0) {
        return animation;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x7e67d346, Offset: 0x5f88
    // Size: 0x44
    function function_a808aac7() {
        if (isdefined(self.var_55b4f21e.var_33a3e73c) && self.var_efc540b6 === self.var_55b4f21e.var_33a3e73c) {
            return 1;
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0xe4b6d0c, Offset: 0x5e78
    // Size: 0x102
    function function_376c9d87(var_ec50a0d3, n_movement, player) {
        if (player adsbuttonpressed()) {
            return self._str_current_anim;
        }
        if (var_ec50a0d3.var_9532f6db == "move_up" || var_ec50a0d3.var_9532f6db == "move_right") {
            if (n_movement >= 0) {
                return self._str_current_anim;
            } else {
                return self.var_55b4f21e.var_33a3e73c;
            }
        } else if (var_ec50a0d3.var_9532f6db == "move_down" || var_ec50a0d3.var_9532f6db == "move_left") {
            if (n_movement <= 0) {
                return self._str_current_anim;
            } else {
                return self.var_55b4f21e.var_33a3e73c;
            }
        }
        return self._str_current_anim;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xabfb9af0, Offset: 0x5db0
    // Size: 0xba
    function set_objective() {
        if (!isdefined(self._e.script_objective)) {
            if (isdefined(self._o_scene._e_root) && isdefined(self._o_scene._e_root.script_objective)) {
                self._e.script_objective = self._o_scene._e_root.script_objective;
                return;
            }
            if (isdefined(self._o_scene._s.script_objective)) {
                self._e.script_objective = self._o_scene._s.script_objective;
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x5addd9bc, Offset: 0x5ce0
    // Size: 0xc6
    function restore_saved_ent() {
        if (isdefined(self._o_scene._e_root) && isdefined(self._o_scene._e_root.scene_ents) && !(isdefined(self._o_scene._e_root.script_ignore_active_scene_check) && self._o_scene._e_root.script_ignore_active_scene_check)) {
            if (isdefined(self._o_scene._e_root.scene_ents[self._str_name])) {
                self._e = self._o_scene._e_root.scene_ents[self._str_name];
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x8a2e080c, Offset: 0x5cc0
    // Size: 0x12
    function get_orig_name() {
        return self._s.name;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xdd3f4dcd, Offset: 0x5c48
    // Size: 0x6a
    function _assign_unique_name() {
        if (isdefined(self._s.name)) {
            self._str_name = self._s.name;
            return;
        }
        self._str_name = self._o_scene._str_name + "_noname" + [[ self._o_scene ]]->get_object_id();
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x3a593bac, Offset: 0x57a0
    // Size: 0x49c
    function function_128f0294(s_shot, var_37fa9b04) {
        str_mod = var_37fa9b04.mod;
        str_damage_types = (!isdefined(self._s.runsceneondmg0) || self._s.runsceneondmg0 == "none" ? "" : self._s.runsceneondmg0) + (!isdefined(self._s.runsceneondmg1) || self._s.runsceneondmg1 == "none" ? "" : self._s.runsceneondmg1) + (!isdefined(self._s.runsceneondmg2) || self._s.runsceneondmg2 == "none" ? "" : self._s.runsceneondmg2) + (!isdefined(self._s.runsceneondmg3) || self._s.runsceneondmg3 == "none" ? "" : self._s.runsceneondmg3) + (!isdefined(self._s.runsceneondmg4) || self._s.runsceneondmg4 == "none" ? "" : self._s.runsceneondmg4);
        switch (str_mod) {
        case #"mod_rifle_bullet":
        case #"mod_pistol_bullet":
            if (issubstr(str_damage_types, "bullet") || isdefined(s_shot.var_163ca9fa) && s_shot.var_163ca9fa || isdefined(s_shot.var_b3dddfd3) && s_shot.var_b3dddfd3) {
                return 1;
            }
            break;
        case #"mod_explosive":
        case #"mod_grenade":
        case #"mod_grenade_splash":
            if (issubstr(str_damage_types, "explosive") || isdefined(s_shot.var_dbd0fa6f) && s_shot.var_dbd0fa6f || isdefined(s_shot.var_b3dddfd3) && s_shot.var_b3dddfd3) {
                return 1;
            }
            break;
        case #"mod_projectile":
        case #"mod_projectile_splash":
            if (issubstr(str_damage_types, "projectile") || isdefined(s_shot.var_650063ca) && s_shot.var_650063ca || isdefined(s_shot.var_b3dddfd3) && s_shot.var_b3dddfd3) {
                return 1;
            }
            break;
        case #"mod_melee_weapon_butt":
        case #"mod_melee":
            if (issubstr(str_damage_types, "melee") || isdefined(s_shot.var_efd784b6) && s_shot.var_efd784b6 || isdefined(s_shot.var_b3dddfd3) && s_shot.var_b3dddfd3) {
                return 1;
            }
            break;
        default:
            if (issubstr(str_damage_types, "all") || isdefined(s_shot.var_b3dddfd3) && s_shot.var_b3dddfd3) {
                return 1;
            }
            break;
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xf5cc831c, Offset: 0x5658
    // Size: 0x13a
    function function_f12c5e67(s_shot) {
        if (isdefined(self._s.runsceneondmg0) || isdefined(self._s.runsceneondmg1) || isdefined(self._s.runsceneondmg2) || isdefined(self._s.runsceneondmg3) || isdefined(self._s.runsceneondmg4)) {
            return 1;
        }
        if (isdefined(s_shot.var_b3dddfd3) && s_shot.var_b3dddfd3 || isdefined(s_shot.var_163ca9fa) && s_shot.var_163ca9fa || isdefined(s_shot.var_dbd0fa6f) && s_shot.var_dbd0fa6f || isdefined(s_shot.var_650063ca) && s_shot.var_650063ca || isdefined(s_shot.var_efd784b6) && s_shot.var_efd784b6) {
            return 1;
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xc9620a8a, Offset: 0x5628
    // Size: 0x24
    function function_b52254e6() {
        if (isdefined(self.var_2a306f8a) && self.var_2a306f8a) {
            return 1;
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xc474ab5a, Offset: 0x53c0
    // Size: 0x25e
    function function_23575fad() {
        if (isdefined(self._s.var_873368a8)) {
            self._e.script_health = self._s.var_873368a8;
            if (isdefined(self._e.n_health)) {
                self._e.n_health = self._s.var_873368a8;
                self._e.var_f2ca854b = self._e.n_health;
                if (!isdefined(self._e.maxhealth)) {
                    self._e.maxhealth = self._e.n_health;
                }
            } else {
                self._e.health = self._s.var_873368a8;
                if (!isdefined(self._e.maxhealth)) {
                    self._e.maxhealth = self._e.health;
                }
            }
        }
        if (isdefined(self._o_scene._e_root) && isdefined(self._o_scene._e_root.script_health)) {
            self._e.script_health = self._o_scene._e_root.script_health;
            if (isdefined(self._e.n_health)) {
                self._e.n_health = self._e.script_health;
                self._e.var_f2ca854b = self._e.script_health;
                self._e.maxhealth = self._e.n_health;
            } else {
                self._e.health = self._e.script_health;
                self._e.maxhealth = self._e.health;
            }
        }
        if (!isdefined(self._e.maxhealth)) {
            self._e.maxhealth = self._e.health;
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xb443282e, Offset: 0x5120
    // Size: 0x298
    function function_b485ee21(s_shot, var_37fa9b04) {
        self._e notify(#"hash_b02076d93b34558");
        self._e endon(#"hash_b02076d93b34558", #"delete", #"scene_stop");
        var_5b7900ec = self._e.var_5b7900ec;
        foreach (var_74f5d118 in var_5b7900ec) {
            while (!var_74f5d118) {
                waitframe(1);
            }
        }
        self._e.var_4819ae76 = 1;
        thread function_ea176ba9();
        if (isdefined(self._e)) {
            self._e notify(#"hash_18be12558bc58fe", {#var_5cd2f3ce:self._str_name, #var_37fa9b04:var_37fa9b04, #str_scene:self._o_scene._str_name, #str_shot:s_shot.name});
            self._e.health = 0;
        }
        if (isdefined(self._o_scene._e_root)) {
            self._o_scene._e_root notify(#"hash_5bb6862842cacfe8", {#var_37fa9b04:var_37fa9b04, #str_shot:s_shot.name, #var_5cd2f3ce:self._str_name, #var_b551c535:self._e});
        }
        level notify(#"hash_4d265bbfcf0b6b4b", {#str_scene:self._o_scene._str_name, #str_shot:s_shot.name});
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x3b83dd39, Offset: 0x4f78
    // Size: 0x19c
    function function_ea176ba9() {
        var_d705d1a8 = 1;
        foreach (o_obj in self._o_scene._a_objects) {
            if (isdefined(o_obj._e) && !(isdefined(o_obj._e.var_4819ae76) && o_obj._e.var_4819ae76)) {
                var_d705d1a8 = 0;
                break;
            }
        }
        if (var_d705d1a8) {
            self._o_scene.var_d84cc502 = 1;
            foreach (o_obj in self._o_scene._a_objects) {
                o_obj flagsys::clear(#"waiting_for_damage");
            }
            if (isdefined(self._o_scene._e_root)) {
                self._o_scene._e_root notify(#"hash_18be12558bc58fe");
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x8f52b266, Offset: 0x4ea8
    // Size: 0xc2
    function function_1205d1f0() {
        if (isdefined(self._e.var_5b7900ec)) {
            var_50b24637 = 0;
            foreach (var_74f5d118 in self._e.var_5b7900ec) {
                if (var_74f5d118) {
                    var_50b24637++;
                    if (var_50b24637 == self._e.var_5b7900ec.size) {
                        return 1;
                    }
                }
            }
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xba5f1b4b, Offset: 0x49b8
    // Size: 0x4e4
    function function_72f549e0(s_shot, var_37fa9b04) {
        if (!isdefined(self._e)) {
            return 0;
        }
        if (isdefined(self._e.var_5b7900ec[s_shot.name]) && self._e.var_5b7900ec[s_shot.name]) {
            return 0;
        }
        if (!function_128f0294(s_shot, var_37fa9b04)) {
            return 0;
        }
        var_f506eca3 = 0;
        if (!isdefined(s_shot.damagethreshold) && !(isdefined(s_shot.var_132c9791) && s_shot.var_132c9791)) {
            var_f506eca3 = 1;
        }
        if (var_f506eca3) {
            var_f2059ab8 = 0;
            var_520e99b5 = 0;
        } else {
            if (isdefined(s_shot.var_132c9791) && s_shot.var_132c9791) {
                s_shot.damagethreshold = 0;
            }
            if (isdefined(self._e.n_health)) {
                n_current_health = self._e.n_health;
            } else {
                n_current_health = self._e.health;
            }
            if (n_current_health <= 0) {
                n_current_health = 0;
            }
            if (isdefined(self._e.var_f2ca854b)) {
                var_f2ca854b = self._e.var_f2ca854b;
            } else {
                var_f2ca854b = self._e.maxhealth;
            }
            var_f2059ab8 = n_current_health / var_f2ca854b;
            var_520e99b5 = s_shot.damagethreshold;
        }
        if (!(isdefined(self._s.var_a1c5c678) && self._s.var_a1c5c678)) {
            b_dead = var_f2059ab8 <= 0;
            var_37fa9b04.attacker util::show_hit_marker(b_dead);
        }
        if (var_f2059ab8 <= var_520e99b5) {
            self._e.var_68ade67d = 1;
            self._e notify(#"hash_4d265bbfcf0b6b4b", {#var_d2b5cb6a:var_520e99b5, #var_859dbb7c:var_f2059ab8, #var_37fa9b04:var_37fa9b04, #str_scene:self._o_scene._str_name, #str_shot:s_shot.name});
            level notify(#"hash_4d265bbfcf0b6b4b", {#var_d2b5cb6a:var_520e99b5, #var_859dbb7c:var_f2059ab8, #var_37fa9b04:var_37fa9b04, #str_scene:self._o_scene._str_name, #str_shot:s_shot.name, #var_f2dfc31f:self._e});
            if (isdefined(self._o_scene._e_root)) {
                self._o_scene._e_root notify(#"hash_4d265bbfcf0b6b4b", {#var_d2b5cb6a:var_520e99b5, #var_859dbb7c:var_f2059ab8, #var_37fa9b04:var_37fa9b04, #str_scene:self._o_scene._str_name, #str_shot:s_shot.name, #var_f2dfc31f:self._e});
            }
            self._e.var_5b7900ec[s_shot.name] = 1;
            thread [[ self._o_scene ]]->play(s_shot.name, undefined, undefined, "single");
            if (function_1205d1f0()) {
                self._e setcandamage(0);
                thread function_b485ee21(s_shot, var_37fa9b04);
            }
            return 1;
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x19f8aa50, Offset: 0x4940
    // Size: 0x6c
    function function_20f309bf(str_notify) {
        if (str_notify == "stop_tracking_damage_scene_ent" || str_notify == "delete") {
            if (isdefined(self._scene_object)) {
                self.var_4819ae76 = 1;
                self.health = 0;
                self._scene_object thread function_ea176ba9();
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x3cd45f6b, Offset: 0x4618
    // Size: 0x31e
    function function_14f96d6b() {
        self._e endoncallback(&function_20f309bf, #"delete", #"scene_stop", #"stop_tracking_damage_scene_ent");
        self._o_scene endon(#"scene_done", #"scene_stop", #"hash_42da41892ac54794");
        self._e setcandamage(1);
        function_23575fad();
        self._o_scene.var_2bc31f02 = 1;
        foreach (s_shot in self._s.shots) {
            if (s_shot.name === "init") {
                self._e.var_5b7900ec[s_shot.name] = 1;
                continue;
            }
            if (function_f12c5e67(s_shot)) {
                self._e.var_5b7900ec[s_shot.name] = 0;
            }
        }
        if (isdefined(self._s.var_2baad8fc) && self._s.var_2baad8fc) {
            self._e util::function_5d36c37a();
        }
        while (1) {
            flagsys::set(#"waiting_for_damage");
            var_37fa9b04 = undefined;
            var_37fa9b04 = self._e waittill(#"damage", #"death");
            if (!isdefined(self._e)) {
                return;
            }
            if (isdefined(self._e.n_health)) {
                waittillframeend();
            }
            foreach (s_shot in self._s.shots) {
                function_72f549e0(s_shot, var_37fa9b04);
            }
            if (isdefined(self._e.var_4819ae76) && self._e.var_4819ae76) {
                return;
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x580eeb9f, Offset: 0x4518
    // Size: 0xf4
    function get_align_tag() {
        n_shot = get_shot(self._str_shot);
        if (isdefined(n_shot) && isdefined(self._s.shots[n_shot].aligntargettag)) {
            return self._s.shots[n_shot].aligntargettag;
        }
        if (isdefined(self._s.aligntargettag)) {
            return self._s.aligntargettag;
        }
        if (isdefined(self._o_scene._e_root) && isdefined(self._o_scene._e_root.e_scene_link)) {
            return "tag_origin";
        }
        return self._o_scene._s.aligntargettag;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb897057, Offset: 0x42b8
    // Size: 0x256
    function get_align_ent() {
        e_align = undefined;
        if (isdefined(self.var_55b4f21e.aligntarget) && !(isdefined(self.var_55b4f21e.var_ab59a015) && self.var_55b4f21e.var_ab59a015)) {
            var_690ec5fb = self.var_55b4f21e.aligntarget;
        } else if (isdefined(self._s.aligntarget) && !(self._s.aligntarget === self._o_scene._s.aligntarget)) {
            var_690ec5fb = self._s.aligntarget;
        }
        if (isdefined(var_690ec5fb)) {
            a_scene_ents = [[ self._o_scene ]]->get_ents();
            if (isdefined(a_scene_ents[var_690ec5fb])) {
                e_align = a_scene_ents[var_690ec5fb];
            } else {
                e_align = scene::get_existing_ent(var_690ec5fb, 0, 1, self._o_scene._str_name);
            }
            if (!isdefined(e_align)) {
                str_msg = "Align target '" + (isdefined(var_690ec5fb) ? "" + var_690ec5fb : "") + "' doesn't exist for scene object " + (isdefined(self._str_name) ? "" + self._str_name : "") + " in shot named " + (isdefined(self._str_shot) ? "" + self._str_shot : "");
                if (!warning(self._o_scene._b_testing, str_msg)) {
                    error(getdvarint(#"scene_align_errors", 1), str_msg);
                }
            }
        }
        if (!isdefined(e_align)) {
            e_align = [[ self._o_scene ]]->get_align_ent();
        }
        return e_align;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x80f724d1, Offset: 0x42a8
    // Size: 0x4
    function _cleanup() {
        
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2bbddfaf, Offset: 0x41c8
    // Size: 0xd4
    function function_2035b6d6(_e) {
        _e notify(#"cleanupdelete");
        _e endon(#"death", #"preparedelete", #"cleanupdelete");
        s_waitresult = undefined;
        s_waitresult = self._o_scene waittilltimeout(0.15, #"hash_60adeaccbb565546", #"scene_stop", #"scene_done", #"scene_skip_completed");
        _e thread scene::synced_delete(self._o_scene._str_name);
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1553ae11, Offset: 0x40c0
    // Size: 0xfc
    function function_9960f8f0(_e) {
        _e notify(#"cleanuphide");
        _e endon(#"death", #"prepareshow", #"preparehide", #"cleanuphide");
        if (self._o_scene._str_mode !== "init") {
            self._o_scene waittilltimeout(0.15, #"hash_60adeaccbb565546", #"scene_stop", #"scene_done", #"scene_skip_completed");
        }
        _e val::set(#"scene", "hide", 2);
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x49f0834c, Offset: 0x3dc8
    // Size: 0x2ec
    function function_fda037ff() {
        if (!isdefined(self.var_55b4f21e)) {
            return;
        }
        if (isdefined(self.var_55b4f21e.var_39fd697b)) {
            a_ents = getentarray(self.var_55b4f21e.var_39fd697b, "targetname", 1);
            array::thread_all(a_ents, &val::set, #"script_hide", "hide", 1);
        } else if (isdefined(self.var_55b4f21e.var_4ceff7a6)) {
            a_ents = getentarray(self.var_55b4f21e.var_4ceff7a6, "targetname", 1);
            array::thread_all(a_ents, &val::reset, #"script_hide", "hide");
        }
        if (!isdefined(self._e)) {
            return;
        }
        if (isdefined(self.var_55b4f21e.cleanupdelete) && self.var_55b4f21e.cleanupdelete && !isplayer(self._e)) {
            thread function_2035b6d6(self._e);
            return;
        }
        if (isdefined(self.var_55b4f21e.var_3ea5d95f) && self.var_55b4f21e.var_3ea5d95f && self._str_shot != "init") {
            self._e connectpaths();
        } else if (isdefined(self.var_55b4f21e.var_8645db22) && self.var_55b4f21e.var_8645db22) {
            self._e disconnectpaths(2, 1);
        }
        if (isdefined(self.var_55b4f21e.cleanuphide) && self.var_55b4f21e.cleanuphide) {
            thread function_9960f8f0(self._e);
            return;
        }
        if (isdefined(self.var_55b4f21e.cleanupshow) && self.var_55b4f21e.cleanupshow) {
            self._e notify(#"cleanupshow");
            self._e val::reset(#"scene", "hide");
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x12668f3d, Offset: 0x3a98
    // Size: 0x324
    function cleanup() {
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                printtoprightln("<unknown string>" + (isdefined(self._s.name) ? self._s.name : self._s.model));
            }
        #/
        function_fda037ff();
        if (flagsys::get(self._str_shot + "active") && !flagsys::get(#"waiting_for_damage")) {
            b_finished = flagsys::get(self._str_shot + "finished");
            b_stopped = flagsys::get(self._str_shot + "stopped");
            if (isdefined(self._e) && !isplayer(self._e)) {
                self._e sethighdetail(0);
                function_638ad737(self._str_shot);
            }
            [[ self ]]->_cleanup();
            if (isdefined(self._e) && !isplayer(self._e)) {
                self._e._scene_object = undefined;
                self._e.current_scene = undefined;
                self._e.anim_debug_name = undefined;
                self._e flagsys::clear(#"scene");
            }
            if (is_alive()) {
                [[ self ]]->_reset_values();
            }
        }
        if (isdefined(self._e) && !isplayer(self._e)) {
            self._e flagsys::clear(#"hash_2f30b24ec0e23830");
            self._e flagsys::clear(#"hash_e2ce599b208682a");
            self._e flagsys::clear(#"hash_f21f320f68c0457");
        }
        flagsys::clear(self._str_shot + "active");
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x751ba5, Offset: 0x3a18
    // Size: 0x74
    function _stop(b_dont_clear_anim = 0) {
        if (isalive(self._e)) {
            self._e notify(#"scene_stop");
            if (!b_dont_clear_anim) {
                self._e animation::stop(0.2);
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x84cf24d9, Offset: 0x38f0
    // Size: 0x11c
    function stop(b_clear = 0, b_dont_clear_anim = 0) {
        self notify(#"new_shot");
        if (isdefined(self._str_shot)) {
            flagsys::set(self._str_shot + "stopped");
            if (b_clear) {
                if (isdefined(self._e)) {
                    self._e notify(#"scene_stop");
                    if (isplayer(self._e)) {
                        [[ self ]]->_stop(b_dont_clear_anim);
                    } else {
                        self._e delete();
                    }
                }
            } else {
                [[ self ]]->_stop(b_dont_clear_anim);
            }
            cleanup();
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xfa3c3e0d, Offset: 0x3820
    // Size: 0xc4
    function function_9e4b3920() {
        if (isdefined(self._e) && (isbot(self._e) || isai(self._e))) {
            if (isbot(self._e)) {
                self._e bot_util::function_23cbc6c1(self._e.origin, 1);
                return;
            }
            self._e setgoal(self._e.origin, 1);
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x87d3795, Offset: 0x3590
    // Size: 0x284
    function scene_reach() {
        if (!isactor(self._e) && !isbot(self._e)) {
            return;
        }
        b_do_reach = (isdefined(self._s.doreach) && self._s.doreach || isdefined(self.var_55b4f21e.var_a8e01b92) && self.var_55b4f21e.var_a8e01b92 || isdefined(self.var_55b4f21e.var_1956ecbb) && self.var_55b4f21e.var_1956ecbb) && (!(isdefined(self._o_scene._b_testing) && self._o_scene._b_testing) || getdvarint(#"scene_test_with_reach", 0));
        if (b_do_reach) {
            str_animation = get_animation_name(self._str_shot);
            self._e val::reset(#"scene", "hide");
            if (isdefined(self._s.disablearrivalinreach) && self._s.disablearrivalinreach || isdefined(self.var_55b4f21e.var_1956ecbb) && self.var_55b4f21e.var_1956ecbb) {
                self._e animation::reach(str_animation, get_align_ent(), get_align_tag(), 1);
            } else {
                self._e animation::reach(str_animation, get_align_ent(), get_align_tag());
            }
            function_9e4b3920();
        }
        flagsys::set(self._str_shot + "ready");
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x734a2f5d, Offset: 0x3500
    // Size: 0x84
    function run_wait(wait_time) {
        wait_start_time = 0;
        while (wait_start_time < wait_time && !is_skipping_scene()) {
            wait_start_time = wait_start_time + float(function_60d95f53()) / 1000;
            waitframe(1);
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x28d27c9c, Offset: 0x3460
    // Size: 0x94
    function _dynamic_paths() {
        if (isdefined(self._e) && isdefined(self._s.dynamicpaths) && self._s.dynamicpaths) {
            if (distance2dsquared(self._e.origin, self._e.scene_orig_origin) > 4) {
                self._e disconnectpaths(2, 0);
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xf94d9388, Offset: 0x33a0
    // Size: 0xb8
    function function_37c00617() {
        if (isdefined(self._o_scene._a_objects)) {
            foreach (obj in self._o_scene._a_objects) {
                if (isdefined(obj) && [[ obj ]]->is_player()) {
                    obj flagsys::wait_till_clear("camera_playing");
                }
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x17ceb1c3, Offset: 0x3278
    // Size: 0x11c
    function function_ebbbd00d() {
        if (self._b_first_frame) {
            return;
        }
        n_spacer_min = self.var_55b4f21e.spacermin;
        n_spacer_max = self.var_55b4f21e.spacermax;
        if ((isdefined(n_spacer_min) || isdefined(n_spacer_max)) && !is_skipping_scene()) {
            if (isdefined(n_spacer_min) && isdefined(n_spacer_max)) {
                if (!error(n_spacer_min >= n_spacer_max, "Spacer Min value must be less than Spacer Max value!")) {
                    run_wait(randomfloatrange(n_spacer_min, n_spacer_max));
                }
                return;
            }
            if (isdefined(n_spacer_min)) {
                run_wait(n_spacer_min);
                return;
            }
            if (isdefined(n_spacer_max)) {
                run_wait(n_spacer_max);
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xa906115e, Offset: 0x3238
    // Size: 0x36
    function function_587971b6() {
        self._n_blend = isdefined(self.var_55b4f21e.blend) ? self.var_55b4f21e.blend : 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x45d74d8b, Offset: 0x3188
    // Size: 0xa6
    function function_dd4f74e1() {
        if (isdefined(self._s.firstframe) && self._s.firstframe && self._o_scene._str_mode == "init" && isdefined(self._e) && !(isdefined(self._e.var_68ade67d) && self._e.var_68ade67d)) {
            self._b_first_frame = 1;
            return;
        }
        self._b_first_frame = 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xc1ce502a, Offset: 0x3148
    // Size: 0x34
    function function_ee94f77() {
        function_dd4f74e1();
        function_587971b6();
        function_ebbbd00d();
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xfe68d28b, Offset: 0x26d0
    // Size: 0xa6c
    function play(str_shot = "play", n_start_time) {
        n_shot = get_shot(str_shot);
        if (!isdefined(n_shot) && !has_streamer_hint()) {
            flagsys::set(str_shot + "ready");
            flagsys::set(str_shot + "finished");
            function_638ad737(str_shot);
            return;
        }
        self notify(#"new_shot");
        self endon(#"new_shot");
        flagsys::set(str_shot + "active");
        if (!isdefined(self._o_scene._a_active_shots)) {
            self._o_scene._a_active_shots = [];
        } else if (!isarray(self._o_scene._a_active_shots)) {
            self._o_scene._a_active_shots = array(self._o_scene._a_active_shots);
        }
        if (!isinarray(self._o_scene._a_active_shots, str_shot)) {
            self._o_scene._a_active_shots[self._o_scene._a_active_shots.size] = str_shot;
        }
        if (isdefined(self._str_shot)) {
            cleanup();
        }
        self._str_shot = str_shot;
        self.var_55b4f21e = self._s.shots[n_shot];
        flagsys::clear(self._str_shot + "stopped");
        flagsys::clear(self._str_shot + "finished");
        flagsys::clear(self._str_shot + "ready");
        flagsys::set(self._str_shot + "active");
        spawn();
        function_f0e3e344();
        if (isdefined(self.var_55b4f21e.var_51093f2d) && self.var_55b4f21e.var_51093f2d) {
            waitframe(1);
        } else if (function_5c2a9efa()) {
            function_ee94f77();
            play_anim("chicken_dance_placeholder_loop", 0, undefined, n_start_time);
        } else {
            var_e1c809d = self.var_55b4f21e.entry;
            function_ee94f77();
            if (is_player()) {
                var_3f83c458 = array("cameraswitcher", "anim");
            } else {
                var_3f83c458 = array("anim");
            }
            foreach (str_entry_type in var_3f83c458) {
                if (!is_alive() || function_3919a776() || !isarray(var_e1c809d)) {
                    break;
                }
                foreach (s_entry in var_e1c809d) {
                    entry = s_entry.(str_entry_type);
                    if (isdefined(entry)) {
                        switch (str_entry_type) {
                        case #"cameraswitcher":
                            /#
                                if (ishash(entry)) {
                                    error(!isassetloaded("'.", entry), "cScene::play : " + function_9e72a96(entry) + "_ready");
                                } else {
                                    error(!isassetloaded("'.", entry), "cScene::play : " + entry + "_ready");
                                }
                            #/
                            var_aa49b05f = 1;
                            play_anim(entry, 1, undefined, n_start_time);
                            continue;
                        case #"anim":
                            /#
                                if (isdefined(self._s.issiege) && self._s.issiege) {
                                    if (ishash(entry)) {
                                        error(!isassetloaded("<unknown string>", entry), "<unknown string>" + function_9e72a96(entry) + "<unknown string>");
                                    } else {
                                        error(!isassetloaded("<unknown string>", entry), "<unknown string>" + entry + "<unknown string>");
                                    }
                                } else if (ishash(entry)) {
                                    error(!isassetloaded("<unknown string>", entry), "<unknown string>" + function_9e72a96(entry) + "_ready");
                                } else {
                                    error(!isassetloaded("<unknown string>", entry), "<unknown string>" + entry + "_ready");
                                }
                            #/
                            var_aa49b05f = 1;
                            play_anim(entry, 0, isdefined(self.var_55b4f21e.interactiveshot) && self.var_55b4f21e.interactiveshot, n_start_time);
                            continue;
                        default:
                            /#
                                error(1, "<unknown string>" + str_entry_type + "<unknown string>");
                            #/
                            continue;
                        }
                    }
                }
            }
            if (!(isdefined(var_aa49b05f) && var_aa49b05f)) {
                waitframe(1);
                if (function_b260bdcc(self._str_shot)) {
                    self._b_active_anim = 0;
                }
            }
            var_aa49b05f = 0;
        }
        function_9ec459a2();
        if (is_player()) {
            function_37c00617();
        }
        flagsys::wait_till_clear("scene_interactive_shot_active");
        if (!self._o_scene._b_testing) {
            flagsys::wait_till_clear("waiting_for_damage");
        }
        if (isdefined(self._o_scene.var_2bc31f02) && self._o_scene.var_2bc31f02 && isdefined(self._o_scene.var_d84cc502) && self._o_scene.var_d84cc502) {
            self._o_scene flagsys::set(#"hash_42da41892ac54794");
        }
        if (is_alive()) {
            flagsys::set(self._str_shot + "finished");
            if (isdefined(self._s.diewhenfinished) && self._s.diewhenfinished && function_b260bdcc(self._str_shot) || isdefined(self.var_55b4f21e.diewhenfinished) && self.var_55b4f21e.diewhenfinished) {
                kill_ent();
            }
        } else {
            flagsys::set(self._str_shot + "stopped");
        }
        if (!self._b_active_anim) {
            cleanup();
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa4f205ca, Offset: 0x2540
    // Size: 0x184
    function function_638ad737(str_shot) {
        if (isdefined(self._e) && !isplayer(self._e) && !(isdefined(self._e.isdying) && self._e.isdying) && isdefined(self._s.deletewhenfinished) && self._s.deletewhenfinished) {
            if (str_shot != "init" && function_b260bdcc(str_shot) && !function_b52254e6()) {
                self._e thread scene::synced_delete(self._o_scene._str_name);
                return;
            }
            if (str_shot != "init" && function_b52254e6() && isdefined(self._o_scene.var_d84cc502) && self._o_scene.var_d84cc502) {
                self._e thread scene::synced_delete(self._o_scene._str_name);
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xfa52c2f9, Offset: 0x2238
    // Size: 0x2fc
    function function_1e19d813() {
        if (isdefined(self._o_scene._e_root)) {
            self._o_scene._e_root notify(#"hash_4e8860ad89fcf927", {#str_scene:self._o_scene._str_name, #var_fbd6d50c:self._e});
        }
        if (isdefined(self._o_scene._e_root) && isdefined(self._o_scene._e_root.target)) {
            var_c17a3b30 = getnode(self._o_scene._e_root.target, "targetname");
            if (isdefined(var_c17a3b30) && isdefined(var_c17a3b30.interact_node) && var_c17a3b30.interact_node) {
                var_c17a3b30.var_31c05612 = 1;
            }
        }
        if (isdefined(self._s.var_d318cc2c) && self._s.var_d318cc2c) {
            if (isdefined(self._o_scene._e_root) && isdefined(self._o_scene._e_root.scene_played)) {
                foreach (str_shot in self._o_scene.var_5a2219f0) {
                    self._o_scene._e_root.scene_played[str_shot] = 1;
                }
            }
            if (isdefined(self._o_scene._a_objects)) {
                foreach (obj in self._o_scene._a_objects) {
                    if (isdefined(obj._e) && obj._s.type === "prop") {
                        obj._e stopanimscripted();
                        obj._e physicslaunch();
                    }
                }
            }
            thread [[ self._o_scene ]]->stop();
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x9c3de6c, Offset: 0x21d8
    // Size: 0x58
    function has_streamer_hint() {
        if (is_player() && isdefined(self._o_scene._a_streamer_hint) && isdefined(self._o_scene._a_streamer_hint[self._str_team])) {
            return 1;
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x52f50404, Offset: 0x2170
    // Size: 0x5c
    function function_e91c94b9(n_shot) {
        if (isdefined(n_shot)) {
            if (isdefined(self._s.shots[n_shot].interactiveshot) && self._s.shots[n_shot].interactiveshot) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb5fe6898, Offset: 0x2118
    // Size: 0x4c
    function function_9ec459a2() {
        if (isdefined(self.var_55b4f21e.var_64c0ee5a) && isdefined(self._e)) {
            self._e setmodel(self.var_55b4f21e.var_64c0ee5a);
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xdd4027cc, Offset: 0x20c0
    // Size: 0x4c
    function function_f0e3e344() {
        if (isdefined(self.var_55b4f21e.var_1c7fbd6b) && isdefined(self._e)) {
            self._e setmodel(self.var_55b4f21e.var_1c7fbd6b);
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x5ea45d74, Offset: 0x2028
    // Size: 0x90
    function function_730a4c60(str_shot) {
        foreach (s_shot in self._s.shots) {
            if (str_shot === s_shot.name) {
                return s_shot;
            }
        }
        return undefined;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x85a27deb, Offset: 0x1f90
    // Size: 0x90
    function get_shot(str_shot) {
        foreach (n_shot, s_shot in self._s.shots) {
            if (str_shot === s_shot.name) {
                return n_shot;
            }
        }
        return undefined;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xbc225c9f, Offset: 0x1f48
    // Size: 0x3e
    function function_b260bdcc(str_shot) {
        return str_shot === self._o_scene.var_355308d8 && self._o_scene._str_mode !== "init";
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x27b28931, Offset: 0x1f00
    // Size: 0x3e
    function function_24f8cfb5(str_shot) {
        return str_shot === self._o_scene.var_232738b3 && self._o_scene._str_mode !== "init";
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xbeea71cd, Offset: 0x1df8
    // Size: 0xfe
    function function_e0df299e(_str_shot) {
        n_shot = get_shot(_str_shot);
        if (isdefined(n_shot) && isdefined(self._s.shots[n_shot].entry)) {
            foreach (s_entry in self._s.shots[n_shot].entry) {
                if (isdefined(s_entry.("anim")) || isdefined(s_entry.cameraswitcher)) {
                    return 1;
                }
            }
        }
        return 0;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4a239485, Offset: 0x1c98
    // Size: 0x154
    function get_animation_name(_str_shot) {
        n_shot = get_shot(_str_shot);
        if (isdefined(n_shot) && isdefined(self._s.shots[n_shot].entry)) {
            foreach (s_entry in self._s.shots[n_shot].entry) {
                if (isdefined(s_entry.animation)) {
                    str_animation = [[ self ]]->animation_lookup(s_entry.animation, undefined, 0);
                    return str_animation;
                }
                if (isdefined(s_entry.("anim"))) {
                    str_animation = [[ self ]]->animation_lookup(s_entry.("anim"), undefined, 0);
                    return str_animation;
                }
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x80f724d1, Offset: 0x1c88
    // Size: 0x4
    function function_d09b043() {
        
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xbce5f40e, Offset: 0x1ac8
    // Size: 0x1b4
    function _prepare() {
        if (issentient(self._e)) {
            if (isdefined(self._s.overrideaicharacter) && self._s.overrideaicharacter) {
                self._e detachall();
                self._e setmodel(self._s.model);
            }
        } else if (self._s.type === "actor") {
            if (!error(self._e.classname !== "script_model", "makeFakeAI must be applied to a script_model")) {
                self._e makefakeai();
            }
            if (!(isdefined(self._s.removeweapon) && self._s.removeweapon)) {
                self._e animation::attach_weapon(getweapon(#"ar_accurate_t8"));
            }
        }
        set_objective();
        if (isdefined(self._s.dynamicpaths) && self._s.dynamicpaths) {
            self._e disconnectpaths(2);
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x613a85de, Offset: 0x1708
    // Size: 0x3b4
    function function_4b3d4226() {
        if (!isdefined(self.var_55b4f21e)) {
            return;
        }
        if (isdefined(self.var_55b4f21e.var_3cd248f5)) {
            a_ents = getentarray(self.var_55b4f21e.var_3cd248f5, "targetname", 1);
            array::thread_all(a_ents, &val::set, #"script_hide", "hide", 1);
        } else if (isdefined(self.var_55b4f21e.var_b94164e)) {
            a_ents = getentarray(self.var_55b4f21e.var_b94164e, "targetname", 1);
            array::thread_all(a_ents, &val::reset, #"script_hide", "hide");
        }
        if (!isdefined(self._e)) {
            return;
        }
        if (isdefined(self.var_55b4f21e.preparedelete) && self.var_55b4f21e.preparedelete && !isplayer(self._e)) {
            self._e notify(#"preparedelete");
            self._e scene::synced_delete(self._o_scene._str_name);
            return;
        }
        if (isdefined(self.var_55b4f21e.var_7e4647c3) && self.var_55b4f21e.var_7e4647c3 && self._str_shot != "init") {
            self._e.scene_orig_origin = self._e.origin;
            self._e connectpaths();
        } else if (isdefined(self.var_55b4f21e.var_6d2f3193) && self.var_55b4f21e.var_6d2f3193) {
            self._e disconnectpaths(2, 1);
        }
        if (isdefined(self.var_55b4f21e.preparehide) && self.var_55b4f21e.preparehide) {
            self._e notify(#"preparehide");
            self._e val::set(#"scene", "hide", 2);
            return;
        }
        if (isdefined(self.var_55b4f21e.prepareshow) && self.var_55b4f21e.prepareshow || isdefined(self._o_scene._b_testing) && self._o_scene._b_testing && self._o_scene._str_mode === "single") {
            self._e notify(#"prepareshow");
            self._e val::reset(#"scene", "hide");
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x96a9d433, Offset: 0xf90
    // Size: 0x770
    function prepare() {
        self._e endon(#"death");
        if (isdefined(self._e._scene_object) && self._e._scene_object != self) {
            [[ self._e._scene_object ]]->cleanup();
        }
        if (!is_alive()) {
            return;
        }
        self._n_ent_num = self._e getentitynumber();
        if (self._e.health < 1) {
            self._e.health = 1;
        }
        /#
            log(self._str_shot);
        #/
        self._e._scene_object = self;
        self.var_55b4f21e = function_730a4c60(self._str_shot);
        if (isdefined(self._s.dynamicpaths) && self._s.dynamicpaths && self._str_shot != "init") {
            self._e.scene_orig_origin = self._e.origin;
            self._e connectpaths();
        }
        if (!isai(self._e) && !isplayer(self._e)) {
            if (!is_player()) {
                if (isdefined(self.var_55b4f21e)) {
                    self.var_55b4f21e.devstate = undefined;
                }
                if (is_player_model()) {
                    scene::prepare_player_model_anim(self._e);
                } else {
                    scene::prepare_generic_model_anim(self._e);
                }
            }
        }
        if (!is_player()) {
            [[ self ]]->_set_values();
            self._e.anim_debug_name = self._s.name;
            self._e.current_scene = self._o_scene._str_name;
            self._e flagsys::set(#"scene");
        }
        if (self._e.classname == "script_model") {
            if (isdefined(self._o_scene._e_root.modelscale)) {
                self._e setscale(self._o_scene._e_root.modelscale);
            }
        }
        if (isdefined(self._s.takedamage) && self._s.takedamage) {
            foreach (s_shot in self._s.shots) {
                if (function_f12c5e67(s_shot) && !function_b52254e6()) {
                    self.var_2a306f8a = 1;
                    self._e.var_2a306f8a = 1;
                    thread function_14f96d6b();
                    break;
                }
            }
        }
        if (self._o_scene._s scene::is_igc() || [[ self._o_scene ]]->has_player()) {
            if (!isplayer(self._e)) {
                self._e sethighdetail(1);
            }
        }
        [[ self ]]->_prepare();
        if (isdefined(self._s.allowdeath) && self._s.allowdeath) {
            thread [[ self ]]->function_d09b043();
        }
        if (function_5c2a9efa()) {
            s_start_spot = function_3e22944e();
            if (isplayer(self._e)) {
                self._e setorigin(s_start_spot.origin);
                self._e setplayerangles(s_start_spot.angles);
            } else if (isactor(self._e)) {
                self._e forceteleport(s_start_spot.origin, s_start_spot.angles);
            } else {
                self._e.origin = s_start_spot.origin;
                self._e.angles = s_start_spot.angles;
            }
        }
        function_4b3d4226();
        scene_reach();
        if (isdefined(self.var_55b4f21e.var_67f013e3) && self.var_55b4f21e.var_67f013e3) {
            self._e flagsys::set(#"hash_2f30b24ec0e23830");
        }
        if (isdefined(self.var_55b4f21e.var_1f99c1f2)) {
            if (self.var_55b4f21e.var_1f99c1f2 == "friendly") {
                self._e flagsys::set(#"hash_e2ce599b208682a");
            } else if (self.var_55b4f21e.var_1f99c1f2 == "enemy") {
                self._e flagsys::set(#"hash_f21f320f68c0457");
            }
        }
        flagsys::set(self._str_shot + "ready");
        flagsys::clear(self._str_shot + "finished");
        return 1;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x678635a2, Offset: 0xdd8
    // Size: 0x1aa
    function _spawn() {
        restore_saved_ent();
        if (!isdefined(self._e)) {
            if (isdefined(self._s.name)) {
                self._e = scene::get_existing_ent(self._s.name, undefined, undefined, self._o_scene._str_name);
            }
        }
        if (isdefined(self._e)) {
            if (isdefined(self._e.isdying) && self._e.isdying) {
                self._e delete();
            }
        }
        if (!isdefined(self._e) && (!(isdefined(self._s.nospawn) && self._s.nospawn) || isdefined(self._o_scene._b_testing) && self._o_scene._b_testing) || isspawner(self._e)) {
            spawn_ent();
            if (isdefined(self._e)) {
                self._e dontinterpolate();
                self._e.scene_spawned = self._o_scene._s.name;
            }
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x28f6730e, Offset: 0xb98
    // Size: 0x234
    function spawn() {
        self endon(#"new_shot");
        b_skip = !function_e0df299e(self._str_shot) && self._o_scene._str_mode !== "init" && !issubstr(self._o_scene._str_mode, "single") && self._str_shot !== "init" && !is_player() && !function_48382a1c();
        b_skip = b_skip || function_3919a776();
        b_skip = b_skip || isdefined(self.var_1f97724a) && self.var_1f97724a;
        if (!b_skip) {
            [[ self ]]->_spawn();
            error(!(isdefined(self._s.nospawn) && self._s.nospawn) && (!isdefined(self._e) || isspawner(self._e)), "Object failed to spawn or doesn't exist.");
            [[ self._o_scene ]]->assign_ent(self, self._e);
            if (isdefined(self._e)) {
                prepare();
            } else if (isdefined(self._s.nospawn) && self._s.nospawn) {
                flagsys::set(self._str_shot + "stopped");
            }
            return;
        }
        cleanup();
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x5cf5835f, Offset: 0xb08
    // Size: 0x84
    function first_init(s_objdef, o_scene) {
        self._s = s_objdef;
        self._o_scene = o_scene;
        _assign_unique_name();
        if (isdefined(self._s.team)) {
            self._str_team = util::get_team_mapping(self._s.team);
        }
        return self;
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x65e0d411, Offset: 0xa78
    // Size: 0x84
    function _reset_values(ent = self._e) {
        reset_ent_val("takedamage", ent);
        reset_ent_val("ignoreme", ent);
        reset_ent_val("allowdeath", ent);
        reset_ent_val("take_weapons", ent);
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x9d5e039e, Offset: 0x9d0
    // Size: 0x9c
    function _set_values(ent = self._e) {
        set_ent_val("takedamage", isdefined(self._s.takedamage) && self._s.takedamage, ent);
        set_ent_val("allowdeath", isdefined(self._s.allowdeath) && self._s.allowdeath, ent);
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6669143e, Offset: 0x958
    // Size: 0x6c
    function reset_ent_val(str_key, ent = self._e) {
        if (isdefined(ent)) {
            ent val::reset(self._o_scene._str_name + ":" + self._str_shot, str_key);
        }
    }

    // Namespace csceneobject/scene_objects_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0x630975ec, Offset: 0x8d8
    // Size: 0x74
    function set_ent_val(str_key, value, ent = self._e) {
        if (isdefined(ent)) {
            ent val::set(self._o_scene._str_name + ":" + self._str_shot, str_key, value);
        }
    }

}

// Namespace scene
// Method(s) 73 Total 73
class cscene {

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x9 linked
    // Checksum 0x611860f3, Offset: 0xa518
    // Size: 0x66
    __constructor() {
        self._a_objects = [];
        self._b_testing = 0;
        self._n_object_id = 0;
        self._str_mode = "";
        self._a_streamer_hint = [];
        self._a_active_shots = [];
        self._a_request_times = [];
        self._b_stopped = 0;
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x11 linked
    // Checksum 0x8fb0cde7, Offset: 0xa588
    // Size: 0x24
    __destructor() {
        /#
            log("<unknown string>");
        #/
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x27379345, Offset: 0x11980
    // Size: 0x64
    function warning(condition, str_msg) {
        if (condition) {
            if (self._b_testing) {
                /#
                    scene::warning_on_screen("<unknown string>" + self._str_name + "<unknown string>" + str_msg);
                #/
            }
            return 1;
        }
        return 0;
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x2c1c7bd8, Offset: 0x118c0
    // Size: 0xb4
    function error(condition, str_msg) {
        if (condition) {
            if (self._b_testing) {
                /#
                    scene::error_on_screen(str_msg);
                #/
            } else {
                /#
                    /#
                        assertmsg(self._s.type + "<unknown string>" + function_9e72a96(self._str_name) + "<unknown string>" + str_msg);
                    #/
                #/
            }
            thread [[ self ]]->on_error();
            return 1;
        }
        return 0;
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2a4a642a, Offset: 0x11850
    // Size: 0x64
    function log(str_msg) {
        /#
            println(self._s.type + "<unknown string>" + function_9e72a96(self._str_name) + "<unknown string>" + str_msg);
        #/
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xb29793a2, Offset: 0x11820
    // Size: 0x24
    function remove_object(o_object) {
        arrayremovevalue(self._a_objects, o_object);
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2c938e15, Offset: 0x117a0
    // Size: 0x76
    function add_object(o_object) {
        if (!isdefined(self._a_objects)) {
            self._a_objects = [];
        } else if (!isarray(self._a_objects)) {
            self._a_objects = array(self._a_objects);
        }
        self._a_objects[self._a_objects.size] = o_object;
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb8fb543a, Offset: 0x11708
    // Size: 0x8e
    function has_player() {
        if (!isdefined(self._a_objects)) {
            return 0;
        }
        foreach (obj in self._a_objects) {
            if ([[ obj ]]->is_player()) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xe404e8d7, Offset: 0x11650
    // Size: 0xae
    function _skip_scene() {
        self endon(#"stopped");
        if (isdefined(self._a_objects)) {
            foreach (o_scene_object in self._a_objects) {
                [[ o_scene_object ]]->skip_scene(1);
            }
        }
        self notify(#"skip_camera_anims");
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xee1d6fec, Offset: 0x112e0
    // Size: 0x366
    function finish_scene_skipping() {
        /#
            if (getdvarint(#"debug_scene_skip", 0) > 0) {
                printtoprightln("<unknown string>" + gettime(), (1, 0, 0));
            }
        #/
        if (is_skipping_scene()) {
            /#
                if (getdvarint(#"debug_scene_skip", 0) > 0) {
                    printtoprightln("<unknown string>" + gettime());
                }
            #/
            if (getdvarint(#"scene_skip_no_fade", 0) == 0) {
                b_skip_fading = 0;
            } else {
                b_skip_fading = 1;
            }
            function_f4b4e39f(0);
            level util::streamer_wait(undefined, undefined, 10);
            foreach (player in util::get_players(self._str_team)) {
                player clientfield::increment_to_player("player_scene_skip_completed");
                player val::reset(#"scene_skip", "freezecontrols");
                player val::reset(#"scene_skip", "takedamage");
                player val::reset(#"scene_skip", "ignoreme");
                player val::reset(#"scene_skip", "ignoreall");
                player stopsounds();
            }
            if (!(isdefined(b_skip_fading) && b_skip_fading)) {
                if (!(isdefined(level.level_ending) && level.level_ending) && is_skipping_player_scene()) {
                    foreach (player in util::get_players(self._str_team)) {
                        player thread lui::screen_fade_in(1, "black", "scene_system");
                    }
                }
            }
            self.b_player_scene = undefined;
            self.skipping_scene = undefined;
            self.scene_skip_completed = 1;
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x8fc52138, Offset: 0x10af0
    // Size: 0x7e8
    function skip_scene(var_11843b70, str_shot = self._a_active_shots[0]) {
        if (!(isdefined(var_11843b70) && var_11843b70) && isdefined(self._s.disablesceneskipping) && self._s.disablesceneskipping) {
            /#
                if (getdvarint(#"debug_scene_skip", 0) > 0) {
                    printtoprightln("<unknown string>" + self._s.name + "<unknown string>" + gettime(), (1, 0, 0));
                }
            #/
            finish_scene_skipping();
            return;
        }
        if (!(isdefined(self.var_486885a7) && self.var_486885a7)) {
            self.var_486885a7 = 1;
            _call_shot_funcs("skip_started");
        }
        /#
            if (getdvarint(#"debug_scene_skip", 0) > 0) {
                printtoprightln("<unknown string>" + self._s.name + "<unknown string>" + gettime(), (0, 1, 0));
            }
        #/
        if (!(isdefined(var_11843b70) && var_11843b70)) {
            if (is_skipping_player_scene()) {
                /#
                    if (getdvarint(#"debug_scene_skip", 0) > 0) {
                        printtoprightln("<unknown string>" + gettime());
                    }
                #/
                if (getdvarint(#"scene_skip_no_fade", 0) == 0) {
                    b_skip_fading = 0;
                } else {
                    b_skip_fading = 1;
                }
                foreach (player in util::get_players(self._str_team)) {
                    player val::set(#"scene_skip", "freezecontrols", 1);
                    player val::set(#"scene_skip", "takedamage", 0);
                    player val::set(#"scene_skip", "ignoreme", 1);
                    player val::set(#"scene_skip", "ignoreall", 1);
                    if (!(isdefined(b_skip_fading) && b_skip_fading)) {
                        player thread lui::screen_fade_out(0, "black", "scene_system");
                    }
                }
                setpauseworld(0);
            }
        }
        if (!function_b260bdcc(str_shot)) {
            var_f6688aea = 1;
        } else {
            var_f6688aea = 0;
        }
        flagsys::wait_till(str_shot + "go");
        /#
            if (getdvarint(#"debug_scene_skip", 0) > 0) {
                printtoprightln("<unknown string>" + self._s.name + "<unknown string>" + gettime(), (0, 0, 1));
            }
        #/
        thread _skip_scene();
        /#
            if (getdvarint(#"debug_scene_skip", 0) > 0) {
                printtoprightln("<unknown string>" + gettime(), (0, 1, 0));
            }
        #/
        /#
            if (getdvarint(#"debug_scene_skip", 0) > 0) {
                if (isdefined(level.animation_played)) {
                    for (i = 0; i < level.animation_played.size; i++) {
                        printtoprightln("<unknown string>" + level.animation_played[i], (1, 0, 0), -1);
                    }
                }
            }
        #/
        wait_till_shot_finished(str_shot);
        self flagsys::set(#"shot_skip_completed");
        if (!var_f6688aea) {
            if (is_skipping_scene()) {
                finish_scene_skipping();
            } else if (isdefined(self.skipping_scene) && self.skipping_scene) {
                self.skipping_scene = undefined;
            }
            /#
                if (getdvarint(#"debug_scene_skip", 0) > 0) {
                    printtoprightln("<unknown string>" + self._s.name + "<unknown string>" + gettime(), (1, 0.5, 0));
                }
            #/
            _call_shot_funcs("skip_completed");
            if (isdefined(self._s.var_e3b54868) && self._s.var_e3b54868 && !scene::function_46546b5c(self._str_name)) {
                self.var_753367d = 1;
                self notify(#"hash_63783193d9ac5bfc");
                thread play(self.var_355308d8, undefined, undefined, "single");
            } else {
                _call_shot_funcs("done");
                flagsys::set(#"scene_skip_completed");
            }
            return;
        }
        if (is_skipping_player_scene()) {
            if (self._s scene::is_igc()) {
                foreach (player in util::get_players(self._str_team)) {
                    player stopsounds();
                }
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x6f080fe7, Offset: 0x10ac0
    // Size: 0x26
    function is_scene_shared() {
        if (self._s scene::is_igc()) {
            return 1;
        }
        return 0;
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x8a6df063, Offset: 0x10aa0
    // Size: 0x14
    function on_error() {
        stop();
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xc4586996, Offset: 0x109b8
    // Size: 0xe0
    function get_valid_objects() {
        a_obj = [];
        foreach (obj in self._a_objects) {
            if ([[ obj ]]->is_alive()) {
                if (!isdefined(a_obj)) {
                    a_obj = [];
                } else if (!isarray(a_obj)) {
                    a_obj = array(a_obj);
                }
                a_obj[a_obj.size] = obj;
            }
        }
        return a_obj;
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x57e919d5, Offset: 0x10800
    // Size: 0x1ae
    function sync_with_other_scenes(str_shot) {
        if (!(isdefined(self._s.dontsync) && self._s.dontsync) && !is_skipping_scene()) {
            n_request_time = get_request_time(str_shot);
            if (isdefined(level.scene_sync_list) && isarray(level.scene_sync_list[n_request_time])) {
                a_scene_requests = level.scene_sync_list[n_request_time];
                for (i = 0; i < a_scene_requests.size; i++) {
                    a_scene_request = a_scene_requests[i];
                    o_scene = a_scene_request.o_scene;
                    str_flag = a_scene_request.str_shot + "ready";
                    if (isdefined(a_scene_request) && !(isdefined(o_scene._s.dontsync) && o_scene._s.dontsync) && !o_scene flagsys::get(str_flag)) {
                        o_scene flagsys::wait_till(str_flag);
                        i = -1;
                    }
                }
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x1066b3ff, Offset: 0x106e8
    // Size: 0x10c
    function wait_till_objects_finished(str_shot, &array) {
        for (i = 0; i < array.size; i++) {
            obj = array[i];
            if (isdefined(obj) && !obj flagsys::get(str_shot + "finished") && obj flagsys::get(str_shot + "active") && !obj flagsys::get(str_shot + "stopped")) {
                obj waittill(str_shot + "finished", str_shot + "active", str_shot + "stopped");
                i = -1;
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xda421c95, Offset: 0x106b0
    // Size: 0x2c
    function wait_till_shot_finished(str_shot) {
        wait_till_objects_finished(str_shot, self._a_objects);
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x32143448, Offset: 0x10598
    // Size: 0x10c
    function wait_till_objects_ready(str_shot, &array) {
        for (i = 0; i < array.size; i++) {
            obj = array[i];
            if (isdefined(obj) && !obj flagsys::get(str_shot + "ready") && obj flagsys::get(str_shot + "active") && !obj flagsys::get(str_shot + "stopped")) {
                obj waittill(str_shot + "ready", str_shot + "active", str_shot + "stopped");
                i = -1;
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x2c6464d7, Offset: 0x10448
    // Size: 0x148
    function function_9a5f92e7() {
        foreach (obj in self._a_objects) {
            if (isdefined(obj._e) && (isbot(obj._e) || isai(obj._e))) {
                if (isbot(obj._e)) {
                    obj._e bot_util::function_33834a13();
                    obj._e bottakemanualcontrol();
                    continue;
                }
                if (issentient(obj._e)) {
                    obj._e clearforcedgoal();
                }
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xc15a2e1a, Offset: 0x102d8
    // Size: 0x164
    function wait_till_shot_ready(str_shot, o_exclude) {
        a_objects = [];
        if (isdefined(o_exclude)) {
            a_objects = array::exclude(self._a_objects, o_exclude);
        } else {
            a_objects = self._a_objects;
        }
        if (isdefined(self._s.igc) && self._s.igc) {
            level flagsys::increment("waitting_for_igc_ready");
        }
        wait_till_objects_ready(str_shot, a_objects);
        flagsys::set(str_shot + "ready");
        sync_with_other_scenes(str_shot);
        flagsys::set(str_shot + "go");
        function_9a5f92e7();
        if (isdefined(self._s.igc) && self._s.igc) {
            level flagsys::decrement("waitting_for_igc_ready");
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xcc753eea, Offset: 0x102a8
    // Size: 0x28
    function is_looping() {
        return isdefined(self._s.looping) && self._s.looping;
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x1248134f, Offset: 0x10138
    // Size: 0x162
    function get_align_ent() {
        e_align = self._e_root;
        if (isdefined(self._s.aligntarget)) {
            e_gdt_align = scene::get_existing_ent(self._s.aligntarget, 0, 1, self._str_name);
            if (isdefined(e_gdt_align)) {
                e_align = e_gdt_align;
            }
            if (!isdefined(e_gdt_align)) {
                str_msg = "Align target '" + (isdefined(self._s.aligntarget) ? "" + self._s.aligntarget : "") + "' doesn't exist for scene.";
                if (!warning(self._b_testing, str_msg)) {
                    error(getdvarint(#"scene_align_errors", 1), str_msg);
                }
            }
        } else if (isdefined(self._e_root) && isdefined(self._e_root.e_scene_link)) {
            e_align = self._e_root.e_scene_link;
        }
        return e_align;
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xac93f0f4, Offset: 0x10120
    // Size: 0xa
    function get_root() {
        return self._e_root;
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xe99d0c64, Offset: 0xfff8
    // Size: 0x120
    function get_ents() {
        a_ents = [];
        if (isdefined(self._a_objects)) {
            foreach (o_obj in self._a_objects) {
                if (isdefined(o_obj._s.name)) {
                    a_ents[o_obj._s.name] = o_obj._e;
                    continue;
                }
                if (!isdefined(a_ents)) {
                    a_ents = [];
                } else if (!isarray(a_ents)) {
                    a_ents = array(a_ents);
                }
                a_ents[a_ents.size] = o_obj._e;
            }
        }
        return a_ents;
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xd8b8bf6b, Offset: 0xfc40
    // Size: 0x3b0
    function _call_shot_funcs(str_shot, b_waittill_go = 0) {
        self endon(str_shot);
        if (b_waittill_go) {
            flagsys::wait_till(str_shot + "go");
        }
        if (str_shot == "done") {
            level notify(self._str_notify_name + "_done");
            self notify(#"scene_done");
            function_3e22b6ac();
        }
        if (str_shot == "stop") {
            self notify(#"scene_stop");
            function_3e22b6ac();
        }
        level notify(self._str_notify_name + "_" + str_shot);
        if (str_shot == "sequence_done") {
            if (isdefined(level.scene_sequence_names[self._s.name])) {
                level notify(level.scene_sequence_names[self._s.name] + "_sequence_done");
            }
        }
        if (isdefined(level.scene_funcs) && isdefined(level.scene_funcs[self._str_notify_name]) && isdefined(level.scene_funcs[self._str_notify_name][str_shot])) {
            a_ents = get_ents();
            foreach (handler in level.scene_funcs[self._str_notify_name][str_shot]) {
                if (self._str_mode === "init" && handler.size > 2) {
                    continue;
                }
                func = handler[0];
                args = handler[1];
                util::function_50f54b6f(self._e_root, func, a_ents, args);
            }
        }
        if (isdefined(level.var_4247a0d6) && isdefined(level.var_4247a0d6[self._str_notify_name]) && isdefined(level.var_4247a0d6[self._str_notify_name][str_shot])) {
            foreach (handler in level.var_4247a0d6[self._str_notify_name][str_shot]) {
                if (self._str_mode === "init" && handler.size > 2) {
                    continue;
                }
                func = handler[0];
                args = handler[1];
                util::single_thread_argarray(self._e_root, func, args);
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x56dd2da3, Offset: 0xf9a8
    // Size: 0x28a
    function stop(b_clear = 0, b_finished = 0) {
        if (self._b_stopped || is_skipping_scene()) {
            return;
        }
        /#
        #/
        self thread sync_with_client_scene("stop", b_clear);
        thread _call_shot_funcs("stop");
        self.scene_stopping = 1;
        if (isdefined(self._a_objects) && !b_finished) {
            foreach (o_obj in self._a_objects) {
                if (isdefined(o_obj) && ![[ o_obj ]]->in_a_different_scene()) {
                    thread [[ o_obj ]]->stop(b_clear);
                }
            }
        }
        self thread _stop_camera_anims();
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                printtoprightln("<unknown string>" + self._s.name);
            }
            if (isdefined(self._e_root) && isdefined(self._e_root.last_scene_state_instance)) {
                if (!b_finished) {
                    level.last_scene_state[self._str_name] = level.last_scene_state[self._str_name] + "<unknown string>";
                    self._e_root.last_scene_state_instance[self._str_name] = self._e_root.last_scene_state_instance[self._str_name] + "<unknown string>";
                }
                if (!isdefined(self._e_root.scriptbundlename)) {
                    self._e_root notify(#"stop_debug_display");
                }
            }
        #/
        self._b_stopped = 1;
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb5fb9be2, Offset: 0xf980
    // Size: 0x1a
    function has_init_state() {
        return scene::has_init_state(self._str_name);
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xcd83c25d, Offset: 0xf580
    // Size: 0x3f4
    function run_next(str_current_shot) {
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                printtoprightln("<unknown string>" + gettime());
            }
        #/
        b_run_next_scene = 0;
        if (has_next_shot(str_current_shot)) {
            if (!self._b_stopped) {
                var_8b188654 = is_skipping_scene();
                if (var_8b188654) {
                    var_43cf9254 = 0;
                    while (!flagsys::get(#"shot_skip_completed") || var_43cf9254 > 5) {
                        var_43cf9254 = var_43cf9254 + float(function_60d95f53()) / 1000;
                        waitframe(1);
                    }
                    flagsys::clear(#"shot_skip_completed");
                }
                if (self._s.scenetype == "fxanim" && self._s.nextscenemode === "init") {
                    if (!error(!has_init_state(), "Scene can't init next scene '" + self._s.nextscenebundle + "' because it doesn't have an init state.")) {
                        self._e_root thread scene::init(self._s.nextscenebundle);
                    }
                } else {
                    if (var_8b188654) {
                        if (is_skipping_player_scene()) {
                            self._str_mode = "skip_scene_player";
                        } else {
                            self._str_mode = "skip_scene";
                        }
                    } else {
                        b_run_next_scene = 1;
                    }
                    if (has_next_shot(str_current_shot)) {
                        if (isdefined(self._s.nextscenebundle)) {
                            self._e_root thread scene::play(self._s.nextscenebundle, undefined, undefined, self._b_testing, self._str_mode);
                        } else {
                            var_1a15e649 = get_next_shot(str_current_shot);
                            /#
                                if (getdvarint(#"debug_scene_skip", 0) > 0 && is_skipping_scene()) {
                                    printtoprightln("<unknown string>" + str_current_shot + "<unknown string>" + gettime(), (1, 1, 0));
                                }
                            #/
                            switch (self._s.scenetype) {
                            case #"scene":
                                thread [[ self ]]->play(var_1a15e649, undefined, self._b_testing, self._str_mode);
                                break;
                            default:
                                thread [[ self ]]->play(var_1a15e649, undefined, self._b_testing, self._str_mode);
                                break;
                            }
                        }
                    }
                }
            }
            return;
        }
        _call_shot_funcs("sequence_done");
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x3503a512, Offset: 0xf498
    // Size: 0xda
    function get_next_shot(str_current_shot) {
        if (isdefined(self.var_2e9fdf35)) {
            var_1a15e649 = self.var_2e9fdf35;
            self.var_2e9fdf35 = undefined;
            return var_1a15e649;
        }
        foreach (i, str_shot in self.var_5a2219f0) {
            if (str_shot === str_current_shot && isdefined(self.var_5a2219f0[i + 1])) {
                return self.var_5a2219f0[i + 1];
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xf0f9781d, Offset: 0xf370
    // Size: 0x11a
    function has_next_shot(str_current_shot = self._a_active_shots[0]) {
        if (isdefined(self.var_2e9fdf35)) {
            return 1;
        }
        if (str_current_shot === "init") {
            return 0;
        }
        if (isdefined(self._s.nextscenebundle)) {
            return 1;
        }
        foreach (i, str_shot in self.var_5a2219f0) {
            if (str_shot === str_current_shot && isdefined(self.var_5a2219f0[i + 1]) && self.var_5a2219f0[i + 1] !== "init") {
                return 1;
            }
        }
        return 0;
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x86996438, Offset: 0xf350
    // Size: 0x18
    function scene_skip_completed() {
        return isdefined(self.scene_skip_completed) && self.scene_skip_completed;
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x672785b6, Offset: 0xf318
    // Size: 0x2e
    function is_skipping_player_scene() {
        return isdefined(self.b_player_scene) && self.b_player_scene || self._str_mode == "skip_scene_player";
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xbf4a5e16, Offset: 0xf298
    // Size: 0x74
    function is_skipping_scene() {
        return (isdefined(self.skipping_scene) && self.skipping_scene || self._str_mode == "skip_scene" || self._str_mode == "skip_scene_player") && !(isdefined(self._s.disablesceneskipping) && self._s.disablesceneskipping);
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xe810e667, Offset: 0xf1a0
    // Size: 0xec
    function _stop_camera_anim_on_player(player) {
        player endon(#"disconnect");
        if (isstring(self._s.cameraswitcher) || ishash(self._s.cameraswitcher)) {
            player endon(#"new_camera_switcher");
            player dontinterpolate();
            endcamanimscripted(player);
            player thread scene::scene_enable_player_stuff(self._s, undefined, self._e_root);
            callback::remove_on_loadout(&_play_camera_anim_on_player_callback, self);
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x2f737350, Offset: 0xf0e8
    // Size: 0xb0
    function _stop_camera_anims() {
        if (!(isdefined(self.played_camera_anims) && self.played_camera_anims)) {
            return;
        }
        level notify(#"stop_camera_anims");
        foreach (player in getplayers()) {
            self thread _stop_camera_anim_on_player(player);
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x7ea3522f, Offset: 0xf088
    // Size: 0x58
    function loop_camera_anim_to_set_up_for_capture() {
        level endon(#"stop_camera_anims");
        while (1) {
            _play_camera_anims();
            _wait_for_camera_animation(self._s.cameraswitcher);
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 4, eflags: 0x1 linked
    // Checksum 0xa69bf137, Offset: 0xef60
    // Size: 0x11c
    function _play_camera_anim_on_player(player, v_origin, v_angles, ignore_initial_notetracks) {
        player notify(#"new_camera_switcher");
        player dontinterpolate();
        player thread scene::scene_disable_player_stuff(self._s);
        self.played_camera_anims = 1;
        n_start_time = self.camera_start_time;
        if (!isdefined(self._s.cameraswitchergraphiccontents) || ismature(player)) {
            camanimscripted(player, self._s.cameraswitcher, n_start_time, v_origin, v_angles);
            return;
        }
        camanimscripted(player, self._s.cameraswitchergraphiccontents, n_start_time, v_origin, v_angles);
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x12b1f780, Offset: 0xef18
    // Size: 0x3c
    function _play_camera_anim_on_player_callback(player) {
        self thread _play_camera_anim_on_player(player, self.camera_v_origin, self.camera_v_angles, 1);
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xf914160f, Offset: 0xedb0
    // Size: 0x15c
    function _play_camera_anims() {
        level endon(#"stop_camera_anims");
        e_align = get_align_ent();
        if (!isdefined(e_align)) {
            return;
        }
        v_origin = isdefined(e_align.origin) ? e_align.origin : (0, 0, 0);
        v_angles = isdefined(e_align.angles) ? e_align.angles : (0, 0, 0);
        if (isstring(self._s.cameraswitcher) || ishash(self._s.cameraswitcher)) {
            callback::on_loadout(&_play_camera_anim_on_player_callback, self);
            self.camera_v_origin = v_origin;
            self.camera_v_angles = v_angles;
            self.camera_start_time = gettime();
            array::thread_all_ents(level.players, &_play_camera_anim_on_player, v_origin, v_angles, 0);
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xdcefe10e, Offset: 0xed08
    // Size: 0x9c
    function _wait_for_camera_animation(str_cam, n_start_time) {
        self endon(#"skip_camera_anims");
        if (iscamanimlooping(str_cam)) {
            level waittill(#"forever");
            return;
        }
        scene::wait_server_time(float(getcamanimtime(str_cam)) / 1000, n_start_time);
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xfda9d9b, Offset: 0xec48
    // Size: 0xb8
    function function_3e22b6ac() {
        if (isdefined(self._a_objects)) {
            foreach (obj in self._a_objects) {
                if (isdefined(obj._e) && isbot(obj._e)) {
                    obj._e botreleasemanualcontrol();
                }
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x803e07c8, Offset: 0xebe0
    // Size: 0x5e
    function function_ab0c6edb() {
        self endon(#"death", #"scene_stop", #"scene_done", #"scene_skip_completed");
        waitframe(1);
        self notify(#"hash_60adeaccbb565546");
    }

    // Namespace cscene/scene_objects_shared
    // Params 4, eflags: 0x1 linked
    // Checksum 0x924feb9, Offset: 0xd480
    // Size: 0x1756
    function play(str_shot = "play", a_ents, b_testing = 0, str_mode = "") {
        function_2ddeb362("cScene::play : " + self._s.name);
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                printtoprightln("<unknown string>" + self._s.name);
            }
        #/
        if (str_mode == "single_loop") {
            self notify(#"hash_27297a73bc597607");
        }
        self notify(str_shot + "start");
        self endon(str_shot + "start", #"hash_27297a73bc597607");
        if (self._s scene::is_igc()) {
            function_f4b4e39f(1);
        }
        if (isdefined(self._e_root) && isdefined(self._e_root.script_teleport_location)) {
            self._e_root teleport::function_ff8a7a3();
        }
        if (str_mode == "skip_scene") {
            thread skip_scene(1, str_shot);
        } else if (str_mode == "skip_scene_player") {
            self.b_player_scene = 1;
            thread skip_scene(1, str_shot);
        }
        self._b_testing = b_testing;
        self._str_mode = str_mode;
        if (function_b260bdcc(str_shot)) {
            self notify(#"hash_63783193d9ac5bfc");
        }
        if (isdefined(self._s.spectateonjoin) && self._s.spectateonjoin) {
            level.scene_should_spectate_on_hot_join = 1;
        }
        assign_ents(a_ents);
        self thread sync_with_client_scene(str_shot, b_testing);
        if (issubstr(self._str_mode, "play_from_time")) {
            args = strtok(self._str_mode, ":");
            if (isdefined(args[1])) {
                var_79584e08 = float(args[1]);
                self.var_a0c66830 = scene::function_8582657c(self._s, str_shot);
            }
            self.b_play_from_time = 1;
            self._str_mode = "";
            if (issubstr(args[0], "noai")) {
                self._str_mode = self._str_mode + "noai";
            }
            if (issubstr(args[0], "noplayers")) {
                self._str_mode = self._str_mode + "noplayers";
            }
        }
        if (!isdefined(level.active_scenes[self._str_name])) {
            level.active_scenes[self._str_name] = [];
        } else if (!isarray(level.active_scenes[self._str_name])) {
            level.active_scenes[self._str_name] = array(level.active_scenes[self._str_name]);
        }
        if (!isinarray(level.active_scenes[self._str_name], self._e_root)) {
            level.active_scenes[self._str_name][level.active_scenes[self._str_name].size] = self._e_root;
        }
        level.active_scenes[self._str_name] = array::remove_undefined(level.active_scenes[self._str_name]);
        if (!isdefined(self._a_active_shots)) {
            self._a_active_shots = [];
        } else if (!isarray(self._a_active_shots)) {
            self._a_active_shots = array(self._a_active_shots);
        }
        if (!isinarray(self._a_active_shots, str_shot)) {
            self._a_active_shots[self._a_active_shots.size] = str_shot;
        }
        if (isdefined(self._e_root)) {
            if (!isdefined(self._e_root.scenes)) {
                self._e_root.scenes = [];
            } else if (!isarray(self._e_root.scenes)) {
                self._e_root.scenes = array(self._e_root.scenes);
            }
            if (!isinarray(self._e_root.scenes, self)) {
                self._e_root.scenes[self._e_root.scenes.size] = self;
            }
        }
        flagsys::clear(str_shot + "ready");
        flagsys::clear(str_shot + "go");
        flagsys::clear(str_shot + "finished");
        set_request_time(str_shot);
        if (!(isdefined(self._s.dontsync) && self._s.dontsync) && !is_skipping_scene()) {
            add_to_sync_list(str_shot);
        }
        foreach (o_obj in self._a_objects) {
            thread [[ o_obj ]]->play(str_shot, var_79584e08);
        }
        /#
            thread function_4412dc65(str_shot);
            level.last_scene_state[self._str_name] = str_shot;
            if (isdefined(self._e_root) && isdefined(self._e_root.last_scene_state_instance)) {
                self._e_root.last_scene_state_instance[self._str_name] = str_shot;
                if (!isdefined(level.scene_roots)) {
                    level.scene_roots = [];
                } else if (!isarray(level.scene_roots)) {
                    level.scene_roots = array(level.scene_roots);
                }
                if (!isinarray(level.scene_roots, self._e_root)) {
                    level.scene_roots[level.scene_roots.size] = self._e_root;
                }
            }
        #/
        wait_till_shot_ready(str_shot);
        self thread function_ab0c6edb();
        remove_from_sync_list(str_shot);
        level flagsys::set(self._str_notify_name + "_ready");
        if (isdefined(self._e_root)) {
            self._e_root flagsys::set(#"scene_ents_ready");
        }
        if (strstartswith(self._str_mode, "capture") || self._s scene::is_igc() && scene::function_a4dedc63(1)) {
            /#
                depth = getdvarstring(#"hash_3018c0b9207d1c", "<unknown string>");
                fps = getdvarstring(#"hash_51617678bebb961a", "<unknown string>");
                fmt = getdvarstring(#"hash_4bf15ae7a6fbf73c", "<unknown string>");
                if (issubstr(self._str_mode, "<unknown string>") || getdvarint(#"hash_6a54249f0cc48945", 0) == 2 || scene::function_24f8cfb5(self._str_name, str_shot)) {
                    if (issubstr(self._str_mode, "<unknown string>") || getdvarint(#"hash_6a54249f0cc48945", 0) == 2) {
                        var_3a6bcf6e = self._str_name + "<unknown string>" + str_shot;
                    } else {
                        var_3a6bcf6e = self._str_name;
                    }
                    level flagsys::set(#"scene_menu_disable");
                    str_command = "<unknown string>" + depth + "<unknown string>" + fps + "<unknown string>" + fmt + "<unknown string>" + self._str_name + "<unknown string>" + var_3a6bcf6e;
                    adddebugcommand("<unknown string>");
                    adddebugcommand(str_command);
                }
            #/
        }
        if (var_79584e08 === 0) {
            self thread _play_camera_anims();
        }
        if (isdefined(self._s.var_e3b54868) && self._s.var_e3b54868 && function_b260bdcc(str_shot) && !scene::function_46546b5c(self._str_name)) {
            if (!is_skipping_scene()) {
                thread _call_shot_funcs(str_shot, 1);
                self.var_b0ff34ce = undefined;
            }
        } else {
            thread _call_shot_funcs(str_shot, 1);
        }
        if (self._s scene::is_igc()) {
            if (isstring(self._s.cameraswitcher) || ishash(self._s.cameraswitcher)) {
                _wait_for_camera_animation(self._s.cameraswitcher, var_79584e08);
            }
        }
        wait_till_shot_finished(str_shot);
        self.b_play_from_time = undefined;
        if (isdefined(self._s.spectateonjoin) && self._s.spectateonjoin) {
            level.scene_should_spectate_on_hot_join = undefined;
        }
        if (!(isdefined(self.var_b0ff34ce) && self.var_b0ff34ce) && (self._str_mode != "init" && !(isdefined(self.var_2bc31f02) && self.var_2bc31f02) && function_b260bdcc(str_shot) || isdefined(self.var_2bc31f02) && self.var_2bc31f02 && flagsys::get(#"hash_42da41892ac54794"))) {
            if (!is_skipping_scene()) {
                thread _call_shot_funcs("done");
            }
            self.var_b0ff34ce = 1;
            if (isdefined(self.var_753367d) && self.var_753367d) {
                self flagsys::set(#"scene_skip_completed");
            }
            if (isdefined(self._e_root)) {
                self._e_root notify(#"scene_done", {#scenedef:self._str_notify_name});
                self._e_root scene::function_6f9a9e07();
            }
        }
        self notify(str_shot);
        if (issubstr(self._str_mode, "single")) {
            self notify(#"hash_3168dab591a18b9b");
        }
        if (str_shot != "init" && self._str_mode != "init" && !self._b_stopped) {
            if ((is_looping() || self._str_mode === "loop") && isdefined(self.var_b0ff34ce) && self.var_b0ff34ce || self._str_mode === "single_loop") {
                self.var_b0ff34ce = undefined;
                if (has_init_state()) {
                    thread play("init", undefined, b_testing, str_mode);
                } else if (get_request_time(str_shot) < gettime()) {
                    if (self._str_mode === "single_loop") {
                        var_689ecfec = str_shot;
                    } else {
                        var_689ecfec = scene::function_de6a7579(self._str_name, str_mode);
                    }
                    thread play(var_689ecfec, undefined, b_testing, str_mode);
                }
            } else if (!issubstr(self._str_mode, "single")) {
                thread run_next(str_shot);
            }
        }
        if (isdefined(self._s.spectateonjoin) && self._s.spectateonjoin) {
            level.scene_should_spectate_on_hot_join = undefined;
        }
        array::flagsys_wait_clear(self._a_objects, str_shot + "active");
        if (!is_skipping_scene() || is_skipping_scene() && scene_skip_completed()) {
            arrayremovevalue(self._a_active_shots, str_shot);
        }
        if (!self._a_active_shots.size || is_skipping_scene() && scene_skip_completed()) {
            if (isdefined(level.active_scenes[self._str_name])) {
                arrayremovevalue(level.active_scenes[self._str_name], self._e_root);
                arrayremovevalue(level.active_scenes[self._str_name], undefined);
                if (level.active_scenes[self._str_name].size == 0) {
                    level.active_scenes[self._str_name] = undefined;
                }
                arrayremovevalue(level.active_scenes, undefined, 1);
            }
            if (!isdefined(level.inactive_scenes[self._str_name])) {
                level.inactive_scenes[self._str_name] = [];
            } else if (!isarray(level.inactive_scenes[self._str_name])) {
                level.inactive_scenes[self._str_name] = array(level.inactive_scenes[self._str_name]);
            }
            if (!isinarray(level.inactive_scenes[self._str_name], self._e_root)) {
                level.inactive_scenes[self._str_name][level.inactive_scenes[self._str_name].size] = self._e_root;
            }
            arrayremovevalue(level.inactive_scenes[self._str_name], undefined);
            arrayremovevalue(level.inactive_scenes, undefined, 1);
            if (isdefined(self._e_root)) {
                arrayremovevalue(self._e_root.scenes, self);
                if (self._e_root.scenes.size == 0) {
                    self._e_root.scenes = undefined;
                    /#
                        arrayremovevalue(level.scene_roots, self._e_root);
                    #/
                }
                if (isstruct(self._e_root) && !isdefined(self._e_root.scriptbundlename) && isarray(level.inactive_scenes[self._str_name])) {
                    arrayremovevalue(level.inactive_scenes[self._str_name], self._e_root);
                    if (level.inactive_scenes[self._str_name].size == 0) {
                        level.inactive_scenes[self._str_name] = undefined;
                    }
                }
            }
            /#
                level.scene_roots = array::remove_undefined(level.scene_roots);
            #/
            foreach (obj in self._a_objects) {
                obj notify(#"death");
            }
            self._a_objects = undefined;
            if (isdefined(self._s) && self._s scene::is_igc()) {
                function_f4b4e39f(0);
            }
        }
        /#
            if (strstartswith(self._str_mode, "<unknown string>") || self._s scene::is_igc() && scene::function_a4dedc63(1)) {
                conv = getdvarstring(#"hash_7b946c8966b56a8e", "<unknown string>");
                if (issubstr(self._str_mode, "<unknown string>") || function_b260bdcc(str_shot) || getdvarint(#"hash_6a54249f0cc48945", 0) == 2) {
                    level flagsys::clear(#"scene_menu_disable");
                    adddebugcommand("<unknown string>" + conv);
                }
            }
        #/
        self notify(#"remove_callbacks");
    }

    // Namespace cscene/scene_objects_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0xf8a2e612, Offset: 0xd340
    // Size: 0x136
    function get_anim_relative_start_time(animation, n_start_time, b_camera_anim = 0) {
        if (!isdefined(self.var_a0c66830)) {
            return n_start_time;
        }
        if (b_camera_anim) {
            n_anim_length = float(getcamanimtime(animation)) / 1000;
            var_e2483c7 = iscamanimlooping(animation);
        } else {
            n_anim_length = getanimlength(animation);
            var_e2483c7 = isanimlooping(animation);
        }
        var_68219fcf = self.var_a0c66830 / n_anim_length * n_start_time;
        if (var_e2483c7) {
            if (var_68219fcf > 0.95) {
                var_68219fcf = 0.95;
            }
        } else if (var_68219fcf > 0.99) {
            var_68219fcf = 0.99;
        }
        return var_68219fcf;
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x43cd70ec, Offset: 0xd160
    // Size: 0x1d8
    function get_objects(type, str_team) {
        a_ret = [];
        foreach (obj in self._a_objects) {
            if (isarray(type)) {
                if (isinarray(type, obj._s.type)) {
                    if (scene::check_team(obj._s.team, str_team)) {
                        if (!isdefined(a_ret)) {
                            a_ret = [];
                        } else if (!isarray(a_ret)) {
                            a_ret = array(a_ret);
                        }
                        a_ret[a_ret.size] = obj;
                    }
                }
                continue;
            }
            if (obj._s.type == type) {
                if (scene::check_team(obj._s.team, str_team)) {
                    if (!isdefined(a_ret)) {
                        a_ret = [];
                    } else if (!isarray(a_ret)) {
                        a_ret = array(a_ret);
                    }
                    a_ret[a_ret.size] = obj;
                }
            }
        }
        return a_ret;
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xf663a15b, Offset: 0xd110
    // Size: 0x44
    function _is_ent_vehicle(ent, str_team) {
        return isvehicle(ent) || isvehiclespawner(ent);
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x741bb90, Offset: 0xd0c0
    // Size: 0x44
    function _is_ent_actor(ent, str_team) {
        return isactor(ent) || isactorspawner(ent);
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x4738dcdc, Offset: 0xd040
    // Size: 0x78
    function _is_ent_companion(ent, str_team) {
        if (isarray(level.heroes) && isinarray(level.heroes, ent) && scene::check_team(ent.team, str_team)) {
            return 1;
        }
        return 0;
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa45eb2b6, Offset: 0xcfe8
    // Size: 0x4c
    function _is_ent_player(ent, str_team) {
        return isplayer(ent) && scene::check_team(ent.team, str_team);
    }

    // Namespace cscene/scene_objects_shared
    // Params 5, eflags: 0x1 linked
    // Checksum 0xa0427d37, Offset: 0xce70
    // Size: 0x16e
    function _assign_ents_by_type(&a_objects, &a_ents, str_type, func_test, str_team) {
        if (a_ents.size) {
            a_objects_of_type = get_objects(str_type, str_team);
            if (a_objects_of_type.size) {
                foreach (ent in arraycopy(a_ents)) {
                    if (isdefined(func_test) && [[ func_test ]](ent, str_team)) {
                        obj = array::pop_front(a_objects_of_type);
                        if (isdefined(obj)) {
                            assign_ent(obj, ent);
                            arrayremovevalue(a_ents, ent, 1);
                            arrayremovevalue(a_objects, obj);
                            continue;
                        }
                        break;
                    }
                }
            }
        }
        return a_ents.size;
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x39b81e86, Offset: 0xca90
    // Size: 0x3d6
    function _assign_ents_by_name(&a_objects, &a_ents) {
        if (a_ents.size) {
            foreach (str_name, e_ent in arraycopy(a_ents)) {
                foreach (i, o_obj in arraycopy(a_objects)) {
                    if (isdefined(o_obj._s.name)) {
                        if (isint(str_name) && (isdefined(o_obj._s.name) ? "" + o_obj._s.name : "") == (isdefined(str_name) ? "" + str_name : "") || !isint(str_name) && hash(o_obj._s.name) == str_name || e_ent.script_animname === (isdefined(o_obj._s.name) ? "" + o_obj._s.name : "") || e_ent.animname === (isdefined(o_obj._s.name) ? "" + o_obj._s.name : "") || e_ent.targetname === (isdefined(o_obj._s.name) ? "" + o_obj._s.name : "")) {
                            assign_ent(o_obj, e_ent);
                            arrayremovevalue(a_ents, e_ent, 1);
                            arrayremoveindex(a_objects, i);
                            break;
                        }
                    }
                }
            }
            /#
                foreach (i, ent in a_ents) {
                    error(isstring(i) || ishash(i), "<unknown string>" + i + "<unknown string>");
                }
            #/
        }
        return a_ents.size;
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xece41692, Offset: 0xca00
    // Size: 0x82
    function assign_ent(o_obj, ent) {
        o_obj._e = ent;
        if (isdefined(self._e_root)) {
            if (!isdefined(self._e_root.scene_ents)) {
                self._e_root.scene_ents = [];
            }
            self._e_root.scene_ents[o_obj._str_name] = o_obj._e;
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x47da61e6, Offset: 0xc590
    // Size: 0x468
    function assign_ents(a_ents) {
        if (!isdefined(a_ents)) {
            a_ents = [];
        } else if (!isarray(a_ents)) {
            a_ents = array(a_ents);
        }
        a_objects = arraycopy(self._a_objects);
        if (_assign_ents_by_name(a_objects, a_ents)) {
            if (_assign_ents_by_type(a_objects, a_ents, array("player", "sharedplayer"), &_is_ent_player, "teama")) {
                if (_assign_ents_by_type(a_objects, a_ents, array("player", "sharedplayer"), &_is_ent_player, "teamb")) {
                    if (_assign_ents_by_type(a_objects, a_ents, array("player", "sharedplayer"), &_is_ent_player, #"team3")) {
                        if (_assign_ents_by_type(a_objects, a_ents, array("player", "sharedplayer"), &_is_ent_player)) {
                            if (_assign_ents_by_type(a_objects, a_ents, array("companion", "sharedcompanion"), &_is_ent_companion, "teama")) {
                                if (_assign_ents_by_type(a_objects, a_ents, array("companion", "sharedcompanion"), &_is_ent_companion, "teamb")) {
                                    if (_assign_ents_by_type(a_objects, a_ents, array("companion", "sharedcompanion"), &_is_ent_companion, #"team3")) {
                                        if (_assign_ents_by_type(a_objects, a_ents, array("companion", "sharedcompanion"), &_is_ent_companion)) {
                                            if (_assign_ents_by_type(a_objects, a_ents, "actor", &_is_ent_actor)) {
                                                if (_assign_ents_by_type(a_objects, a_ents, "fakeactor", &_is_ent_actor)) {
                                                    if (_assign_ents_by_type(a_objects, a_ents, "vehicle", &_is_ent_vehicle)) {
                                                        if (_assign_ents_by_type(a_objects, a_ents, "model")) {
                                                            foreach (e_ent in a_ents) {
                                                                o_obj = array::pop(a_objects);
                                                                if (!error(!isdefined(o_obj), "No scene object to assign entity too.  You might have passed in more than the scene supports.")) {
                                                                    assign_ent(o_obj, e_ent);
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x36297bb9, Offset: 0xc3e0
    // Size: 0x1a4
    function sync_with_client_scene(str_shot, b_test_run = 0) {
        if (self._s.vmtype === "both" && !self._s scene::is_igc()) {
            self endon(str_shot + "finished");
            flagsys::wait_till(str_shot + "go");
            n_val = undefined;
            if (b_test_run) {
                switch (str_shot) {
                case #"stop":
                    n_val = 3;
                    break;
                case #"init":
                    n_val = 4;
                    break;
                default:
                    n_val = 5;
                    break;
                }
            } else {
                switch (str_shot) {
                case #"stop":
                    n_val = 0;
                    break;
                case #"init":
                    n_val = 1;
                    break;
                default:
                    n_val = 2;
                    break;
                }
            }
            level clientfield::set(self._s.name, n_val);
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x4a3b5722, Offset: 0xc3c0
    // Size: 0x16
    function get_object_id() {
        self._n_object_id++;
        return self._n_object_id;
    }

    // Namespace cscene/scene_objects_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x73d66b7c, Offset: 0xc218
    // Size: 0x1a0
    function get_valid_object_defs() {
        a_obj_defs = [];
        foreach (s_obj in self._s.objects) {
            if (self._s.vmtype !== "client" && s_obj.vmtype !== "client") {
                if (isdefined(s_obj.name) || isdefined(s_obj.model) || isdefined(s_obj.initanim) || isdefined(s_obj.mainanim)) {
                    if (!(isdefined(s_obj.disabled) && s_obj.disabled) && scene::function_6f382548(s_obj, self._s.name)) {
                        if (!isdefined(a_obj_defs)) {
                            a_obj_defs = [];
                        } else if (!isarray(a_obj_defs)) {
                            a_obj_defs = array(a_obj_defs);
                        }
                        a_obj_defs[a_obj_defs.size] = s_obj;
                    }
                }
            }
        }
        return a_obj_defs;
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x7dabb86a, Offset: 0xc000
    // Size: 0x20a
    function new_object(str_type) {
        switch (str_type) {
        case #"prop":
            return new cscenemodel();
        case #"model":
            return new cscenemodel();
        case #"vehicle":
            return new cscenevehicle();
        case #"actor":
            return new csceneactor();
        case #"fakeactor":
            return new cscenefakeactor();
        case #"playeroutfit":
            return new class_6572d7cd();
        case #"player":
            return new csceneplayer();
        case #"sharedplayer":
            return new cscenesharedplayer();
        case #"fakeplayer":
            return new cscenefakeplayer();
        case #"companion":
            return new cscenecompanion();
        case #"sharedcompanion":
            return new cscenesharedcompanion();
        default:
            error(0, "Unsupported object type '" + str_type + "'.");
            break;
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x24a9b299, Offset: 0xbed0
    // Size: 0x124
    function remove_from_sync_list(str_shot) {
        n_request_time = get_request_time(str_shot);
        if (isdefined(level.scene_sync_list) && isdefined(level.scene_sync_list[n_request_time])) {
            for (i = level.scene_sync_list[n_request_time].size - 1; i >= 0; i--) {
                s_scene_request = level.scene_sync_list[n_request_time][i];
                if (s_scene_request.o_scene == self && s_scene_request.str_shot == str_shot) {
                    arrayremoveindex(level.scene_sync_list[n_request_time], i);
                }
            }
            if (!level.scene_sync_list[n_request_time].size) {
                level.scene_sync_list[n_request_time] = undefined;
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xb752bb54, Offset: 0xbd40
    // Size: 0x186
    function add_to_sync_list(str_shot) {
        if (!isdefined(level.scene_sync_list)) {
            level.scene_sync_list = [];
        }
        remove_from_sync_list(str_shot);
        s_scene_request = spawnstruct();
        s_scene_request.o_scene = self;
        s_scene_request.str_shot = str_shot;
        if (!isdefined(level.scene_sync_list[get_request_time(str_shot)])) {
            level.scene_sync_list[get_request_time(str_shot)] = [];
        } else if (!isarray(level.scene_sync_list[get_request_time(str_shot)])) {
            level.scene_sync_list[get_request_time(str_shot)] = array(level.scene_sync_list[get_request_time(str_shot)]);
        }
        level.scene_sync_list[get_request_time(str_shot)][level.scene_sync_list[get_request_time(str_shot)].size] = s_scene_request;
        waittillframeend();
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x3ad533d1, Offset: 0xbd20
    // Size: 0x18
    function get_request_time(str_shot) {
        return self._a_request_times[str_shot];
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x7ad9aa8c, Offset: 0xbcf8
    // Size: 0x1e
    function set_request_time(str_shot) {
        self._a_request_times[str_shot] = gettime();
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6f4cd3fc, Offset: 0xbbc0
    // Size: 0x12c
    function function_558aaa66(s_instance, s_obj) {
        if (self._s.devstate === "placeholder" && isdefined(s_instance.target)) {
            var_1bdb1cc6 = struct::get_array(s_instance.target, "targetname");
            foreach (struct in var_1bdb1cc6) {
                if (isdefined(struct.script_animname) && tolower(struct.script_animname) === tolower(s_obj.name)) {
                    s_obj.var_50f52c5b = 1;
                    return struct;
                }
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xdcd12fc4, Offset: 0xbae8
    // Size: 0xca
    function function_85ed339(s_obj) {
        str_type = tolower(s_obj.type);
        switch (str_type) {
        case #"specialist":
            str_type = "companion";
            break;
        case #"sharedspecialist":
            str_type = "sharedcompanion";
            break;
        default:
            break;
        }
        if (isdefined(s_obj.var_615b1f16) && s_obj.var_615b1f16) {
            str_type = "fakeactor";
        }
        return str_type;
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x56c59a4c, Offset: 0xba98
    // Size: 0x46
    function is_player(s_obj) {
        if (s_obj.type === "player" || s_obj.type === "sharedplayer") {
            return 1;
        }
        return 0;
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x194e2d6d, Offset: 0xb8f0
    // Size: 0x1a0
    function function_4f12fd77(s_obj) {
        if (is_player(s_obj) || isdefined(s_obj.var_50f52c5b) && s_obj.var_50f52c5b) {
            return;
        }
        if (isdefined(s_obj.shots)) {
            foreach (s_shot in s_obj.shots) {
                if (s_shot.name === "init") {
                    continue;
                }
                if (!isdefined(s_shot.entry) && !isdefined(s_shot.var_1c7fbd6b) && !isdefined(s_shot.var_64c0ee5a) && !isdefined(s_shot.cleanuphide) && !isdefined(s_shot.cleanupshow) && !isdefined(s_shot.cleanupdelete) && !isdefined(s_shot.var_3ea5d95f) && !isdefined(s_shot.var_8645db22)) {
                    arrayremovevalue(s_obj.shots, s_shot, 1);
                }
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1930d641, Offset: 0xb8d0
    // Size: 0x18
    function function_b260bdcc(str_shot) {
        return str_shot === self.var_355308d8;
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xed853958, Offset: 0xb8b0
    // Size: 0x18
    function function_24f8cfb5(str_shot) {
        return str_shot === self.var_232738b3;
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x219e51b8, Offset: 0xb718
    // Size: 0x18a
    function function_f9ac3929(var_f4348b83, s_shot) {
        if (!isdefined(s_shot)) {
            return undefined;
        }
        if (isarray(s_shot.entry)) {
            foreach (s_entry in s_shot.entry) {
                if (isdefined(s_entry.cameraswitcher)) {
                    var_64a319f6 = s_entry.cameraswitcher;
                }
            }
        }
        if (isarray(var_f4348b83.entry)) {
            foreach (s_entry in var_f4348b83.entry) {
                if (isdefined(s_entry.cameraswitcher)) {
                    var_e6b1664b = s_entry.cameraswitcher;
                }
            }
        }
        if (isdefined(var_e6b1664b) && var_e6b1664b !== var_64a319f6) {
            return var_e6b1664b;
        }
        return undefined;
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xbcb8dda8, Offset: 0xb570
    // Size: 0x19a
    function function_eb2133a3(var_f4348b83, s_shot) {
        if (!isdefined(s_shot)) {
            return undefined;
        }
        if (isarray(s_shot.entry)) {
            foreach (s_entry in s_shot.entry) {
                if (isdefined(s_entry.("anim"))) {
                    var_3e5565ed = s_entry.("anim");
                }
            }
        }
        if (isarray(var_f4348b83.entry)) {
            foreach (s_entry in var_f4348b83.entry) {
                if (isdefined(s_entry.("anim"))) {
                    var_554345e4 = s_entry.("anim");
                }
            }
        }
        if (isdefined(var_554345e4) && var_554345e4 !== var_3e5565ed) {
            return var_554345e4;
        }
        return undefined;
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x3cf5436b, Offset: 0xb218
    // Size: 0x34a
    function function_ff8b808(obj, var_90acec35) {
        if (!isdefined(var_90acec35.specialistname)) {
            return;
        }
        var_4dc7222b = array("vehicle", "prop", "actor");
        if (!isinarray(var_4dc7222b, obj.type) && obj.type === var_90acec35.type || isinarray(var_4dc7222b, obj.type) && obj.name === var_90acec35.name) {
            foreach (n_shot, var_f4348b83 in var_90acec35.shots) {
                var_d57bf586 = var_90acec35.specialistname;
                if (!isdefined(obj.var_2df1a365)) {
                    obj.var_2df1a365 = [];
                }
                var_554345e4 = function_eb2133a3(var_f4348b83, obj.shots[n_shot]);
                if (var_90acec35.type == "sharedplayer" || var_90acec35.type == "player") {
                    var_e6b1664b = function_f9ac3929(var_f4348b83, obj.shots[n_shot]);
                }
                if (isdefined(var_554345e4)) {
                    if (!isdefined(obj.var_2df1a365[n_shot])) {
                        obj.var_2df1a365[n_shot] = [];
                    }
                    if (!isdefined(obj.var_2df1a365[n_shot][var_d57bf586])) {
                        obj.var_2df1a365[n_shot][var_d57bf586] = spawnstruct();
                    }
                    obj.var_2df1a365[n_shot][var_d57bf586].var_554345e4 = var_554345e4;
                }
                if (isdefined(var_e6b1664b)) {
                    if (!isdefined(obj.var_2df1a365[n_shot])) {
                        obj.var_2df1a365[n_shot] = [];
                    }
                    if (!isdefined(obj.var_2df1a365[n_shot][var_d57bf586])) {
                        obj.var_2df1a365[n_shot][var_d57bf586] = spawnstruct();
                    }
                    obj.var_2df1a365[n_shot][var_d57bf586].var_e6b1664b = var_e6b1664b;
                }
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x1504d521, Offset: 0xb0f8
    // Size: 0x114
    function function_73fcc32b(obj, var_87439bc3) {
        if (isarray(var_87439bc3) && var_87439bc3.size) {
            foreach (var_cdd7dee0 in var_87439bc3) {
                foreach (var_90acec35 in var_cdd7dee0.objects) {
                    function_ff8b808(obj, var_90acec35);
                }
            }
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 5, eflags: 0x1 linked
    // Checksum 0xbcf7b8aa, Offset: 0xab78
    // Size: 0x576
    function init(str_scenedef, s_scenedef, e_align, a_ents, b_test_run) {
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                printtoprightln("<unknown string>" + str_scenedef);
            }
        #/
        s_scenedef scene::function_585fb738();
        s_scenedef.var_418c40ac = scene::function_c9770402(str_scenedef);
        self.var_355308d8 = s_scenedef.var_418c40ac;
        self.var_232738b3 = scene::function_c3a1b36a(str_scenedef);
        self.var_5a2219f0 = scene::get_all_shot_names(str_scenedef);
        self._s = s_scenedef;
        self._str_name = str_scenedef;
        self._b_testing = b_test_run;
        self._str_team = util::get_team_mapping(self._s.team);
        self._a_streamer_hint[#"allies"] = isdefined(self._s.var_a6da2039) ? self._s.var_a6da2039 : self._s.streamerhintteama;
        self._a_streamer_hint[#"axis"] = isdefined(self._s.var_991a84ba) ? self._s.var_991a84ba : self._s.streamerhintteamb;
        self._str_notify_name = isstring(self._s.malebundle) || ishash(self._s.malebundle) ? self._s.malebundle : self._str_name;
        if (!isdefined(a_ents)) {
            a_ents = [];
        } else if (!isarray(a_ents)) {
            a_ents = array(a_ents);
        }
        var_87439bc3 = scene::function_c8fb67e5(self._s);
        if (!error(a_ents.size > self._s.objects.size, "Trying to use more entities than scene supports.")) {
            self._e_root = e_align;
            a_objs = get_valid_object_defs();
            foreach (s_obj in a_objs) {
                s_obj.type = function_85ed339(s_obj);
                if (isdefined(s_obj.name) && (self._e_root.classname === "scriptbundle_scene" || self._e_root.classname === "scriptbundle_fxanim") && isdefined(self._e_root.target)) {
                    if (!isdefined(self._e_root.var_1505fed6)) {
                        self._e_root.var_1505fed6 = [];
                    }
                    self._e_root.var_1505fed6[s_obj.name] = function_558aaa66(self._e_root, s_obj);
                }
                function_73fcc32b(s_obj, var_87439bc3);
                function_4f12fd77(s_obj);
                add_object([[ [[ self ]]->new_object(s_obj.type) ]]->first_init(s_obj, self));
            }
            /#
                if (!isdefined(level.last_scene_state)) {
                    level.last_scene_state = [];
                }
                if (!isdefined(self._e_root.last_scene_state_instance)) {
                    self._e_root.last_scene_state_instance = [];
                }
                if (!isdefined(level.last_scene_state[self._str_name])) {
                    level.last_scene_state[self._str_name] = "<unknown string>";
                }
                if (!isdefined(self._e_root.last_scene_state_instance[self._str_name])) {
                    self._e_root.last_scene_state_instance[self._str_name] = "<unknown string>";
                }
            #/
        }
    }

    // Namespace cscene/scene_objects_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xed512f22, Offset: 0xa5b8
    // Size: 0x5b4
    function function_4412dc65(str_shot) {
        /#
            self notify(#"hash_763a7354c3aaff58");
            self endon(#"scene_done", #"scene_stop", #"scene_skip_completed", #"hash_763a7354c3aaff58");
            if (self._b_testing) {
                var_82bbc872 = 0;
                var_9d90ef8b = scene::function_12479eba(self._str_name);
                a_shots = scene::get_all_shot_names(self._str_name, 1);
                foreach (str_shot_name in self._s.a_str_shot_names) {
                    if (str_shot_name != str_shot) {
                        var_82bbc872 = var_82bbc872 + ceil(scene::function_8582657c(self._s, str_shot_name) * 30);
                        continue;
                    }
                    break;
                }
                self.n_frame_counter = var_82bbc872;
                while (1) {
                    if (getdvarint(#"hash_67caa056eba27a53", 0) == 0 || !isdefined(self._a_objects)) {
                        waitframe(1);
                        continue;
                    }
                    v_pos = (1350, 195, 0);
                    var_204b44d3 = var_9d90ef8b * self.n_frame_counter / ceil(var_9d90ef8b * 30);
                    var_962ef8af = "<unknown string>" + self.n_frame_counter + "<unknown string>" + ceil(var_9d90ef8b * 30) + "<unknown string>" + var_204b44d3 + "<unknown string>" + var_9d90ef8b + "<unknown string>";
                    debug2dtext(v_pos, var_962ef8af, undefined, undefined, undefined, 1, 0.8);
                    v_pos = v_pos + vectorscale((0, 1, 0), 20) * 2;
                    foreach (obj in self._a_objects) {
                        if (!isdefined(obj._e) || !isdefined(obj._str_current_anim)) {
                            continue;
                        }
                        if (str_shot !== obj._str_shot) {
                            continue;
                        }
                        animation = obj._str_current_anim;
                        if (!isdefined(animation) || !isassetloaded("<unknown string>", animation)) {
                            continue;
                        }
                        var_13edeb1f = getanimframecount(animation);
                        var_7b160393 = ceil(obj._e getanimtime(animation) * var_13edeb1f);
                        var_958054e5 = getanimlength(animation);
                        var_f667af2f = obj._e getanimtime(animation) * var_958054e5;
                        var_2e63fccd = obj._str_name + "<unknown string>" + function_9e72a96(animation);
                        var_1cae5962 = "<unknown string>" + str_shot + "<unknown string>" + var_7b160393 + "<unknown string>" + var_13edeb1f + "<unknown string>" + var_f667af2f + "<unknown string>" + var_958054e5 + "<unknown string>";
                        debug2dtext(v_pos, var_2e63fccd, undefined, undefined, undefined, 1, 0.8);
                        v_pos = v_pos + vectorscale((0, 1, 0), 20);
                        debug2dtext(v_pos, var_1cae5962, undefined, undefined, undefined, 1, 0.8);
                        v_pos = v_pos + vectorscale((0, 1, 0), 20) * 1.25;
                        self.n_frame_counter = var_82bbc872 + var_7b160393;
                    }
                    waitframe(1);
                }
            }
        #/
    }

}

// Namespace scene/scene_objects_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x625d3f1, Offset: 0x7b8
// Size: 0x56
function prepare_player_model_anim(ent) {
    if (!(ent.animtree === "all_player")) {
        ent useanimtree("all_player");
        ent.animtree = "all_player";
    }
}

// Namespace scene/scene_objects_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x907fdfda, Offset: 0x818
// Size: 0x56
function prepare_generic_model_anim(ent) {
    if (!(ent.animtree === "generic")) {
        ent useanimtree("generic");
        ent.animtree = "generic";
    }
}


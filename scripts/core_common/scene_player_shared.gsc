// Atian COD Tools GSC decompiler test
#using scripts\core_common\scene_player_shared.gsc;
#using script_24c15fbbb838c794;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_objects_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace scene;

// Namespace scene
// Method(s) 2 Total 136
class class_6572d7cd : csceneplayer, csceneobject {

    // Namespace class_6572d7cd/scene_player_shared
    // Params 0, eflags: 0x89 linked class_linked
    // Checksum 0x749432b5, Offset: 0xc450
    // Size: 0x14
    __constructor() {
        csceneplayer::__constructor();
    }

    // Namespace class_6572d7cd/scene_player_shared
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0xdcabce1d, Offset: 0xc470
    // Size: 0x14
    __destructor() {
        csceneplayer::__destructor();
    }

}

// Namespace scene
// Method(s) 44 Total 136
class csceneplayer : csceneobject {

    // Namespace csceneplayer/scene_player_shared
    // Params 0, eflags: 0x9 linked
    // Checksum 0xec9dc3e3, Offset: 0x328
    // Size: 0x4e
    __constructor() {
        csceneobject::__constructor();
        self._func_get = &scene::function_3d35d3ca;
        self._func_get_active = &scene::function_e941ea66;
        self._n_streamer_req = -1;
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x72c337e5, Offset: 0x67e0
    // Size: 0x14
    __destructor() {
        csceneobject::__destructor();
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xac88d01c, Offset: 0x6750
    // Size: 0x84
    function destroy_dev_info() {
        /#
            if (isdefined(level.hud_scene_dev_info1)) {
                level.hud_scene_dev_info1 destroy();
            }
            if (isdefined(level.hud_scene_dev_info2)) {
                level.hud_scene_dev_info2 destroy();
            }
            if (isdefined(level.hud_scene_dev_info3)) {
                level.hud_scene_dev_info3 destroy();
            }
        #/
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x311e1151, Offset: 0x6360
    // Size: 0x3e4
    function display_dev_info() {
        /#
            if (isstring(self._o_scene._s.devstate) && getdvarint(#"scr_show_shot_info_for_igcs", 0)) {
                if (!isdefined(level.hud_scene_dev_info1)) {
                    level.hud_scene_dev_info1 = newdebughudelem();
                }
                level.hud_scene_dev_info1.alignx = "<unknown string>";
                level.hud_scene_dev_info1.aligny = "<unknown string>";
                level.hud_scene_dev_info1.horzalign = "<unknown string>";
                level.hud_scene_dev_info1.y = 400;
                level.hud_scene_dev_info1.fontscale = 1.3;
                level.hud_scene_dev_info1.color = (0.439216, 0.501961, 0.564706);
                level.hud_scene_dev_info1 settext("<unknown string>" + toupper(function_9e72a96(self._o_scene._str_name)));
                if (!isdefined(level.hud_scene_dev_info2)) {
                    level.hud_scene_dev_info2 = newdebughudelem();
                }
                level.hud_scene_dev_info2.alignx = "<unknown string>";
                level.hud_scene_dev_info2.aligny = "<unknown string>";
                level.hud_scene_dev_info2.horzalign = "<unknown string>";
                level.hud_scene_dev_info2.y = 420;
                level.hud_scene_dev_info2.fontscale = 1.3;
                level.hud_scene_dev_info2.color = (0.439216, 0.501961, 0.564706);
                level.hud_scene_dev_info2 settext("<unknown string>" + function_9e72a96(self._str_shot));
                if (!isdefined(level.hud_scene_dev_info3)) {
                    level.hud_scene_dev_info3 = newdebughudelem();
                }
                level.hud_scene_dev_info3.alignx = "<unknown string>";
                level.hud_scene_dev_info3.aligny = "<unknown string>";
                level.hud_scene_dev_info3.horzalign = "<unknown string>";
                level.hud_scene_dev_info3.y = 440;
                level.hud_scene_dev_info3.fontscale = 1.3;
                level.hud_scene_dev_info3.color = (0.439216, 0.501961, 0.564706);
                var_208dd9f0 = isdefined(self.var_55b4f21e.devstate) ? self.var_55b4f21e.devstate : self._o_scene._s.devstate;
                level.hud_scene_dev_info3 settext("<unknown string>" + function_9e72a96(var_208dd9f0));
            } else {
                destroy_dev_info();
            }
        #/
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0x7f2bfc7d, Offset: 0x6130
    // Size: 0x228
    function animation_lookup(animation, ent = self._e, b_camera = 0) {
        if (isdefined(self._s.var_2df1a365) && isdefined(level.heroes) && level.heroes.size) {
            n_shot = csceneobject::get_shot(self._str_shot);
            foreach (e_hero in level.heroes) {
                e_specialist = e_hero;
                break;
            }
            var_d57bf586 = e_specialist.animname;
            if (isdefined(n_shot) && isdefined(self._s.var_2df1a365[n_shot]) && isdefined(self._s.var_2df1a365[n_shot][var_d57bf586])) {
                if (b_camera && isdefined(self._s.var_2df1a365[n_shot][var_d57bf586].var_e6b1664b)) {
                    return self._s.var_2df1a365[n_shot][var_d57bf586].var_e6b1664b;
                } else if (!b_camera && isdefined(self._s.var_2df1a365[n_shot][var_d57bf586].var_554345e4)) {
                    return self._s.var_2df1a365[n_shot][var_d57bf586].var_554345e4;
                }
            }
        }
        return animation;
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xf64bb950, Offset: 0x6010
    // Size: 0x114
    function function_6c1c67c1() {
        if (csceneobject::is_shared_player()) {
            if (isdefined(self._str_camera)) {
                return 1;
            }
        } else if (csceneobject::function_527113ae()) {
            if (isdefined(self._str_camera)) {
                return 1;
            }
            if (isdefined(self._o_scene._a_objects)) {
                foreach (obj in self._o_scene._a_objects) {
                    if (obj._s.type === "sharedplayer" && [[ obj ]]->function_6c1c67c1()) {
                        return 1;
                    }
                }
            }
        }
        return 0;
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x48562cd1, Offset: 0x5fe0
    // Size: 0x24
    function stop_camera(player) {
        endcamanimscripted(player);
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x59fe3436, Offset: 0x5f58
    // Size: 0x80
    function get_extracam_index(player) {
        var_82e125b6 = isdefined(self.var_55b4f21e.extracamindex) ? self.var_55b4f21e.extracamindex : self._s.extracamindex;
        if (isdefined(var_82e125b6)) {
            var_e5489dff = int(var_82e125b6) - 1;
        }
        return var_e5489dff;
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 5, eflags: 0x1 linked
    // Checksum 0x17ffdd08, Offset: 0x5dd0
    // Size: 0x17c
    function _camanimscripted(player, str_camera, v_origin, v_angles, n_start_time = 0) {
        player notify(#"camanimscripted");
        player endon(#"camanimscripted", #"disconnect");
        if (self._o_scene._s scene::is_igc()) {
            player thread scene::scene_disable_player_stuff(self._o_scene._s, self._s);
        }
        var_57949b2d = getcamanimtime(str_camera) * n_start_time;
        var_41193b94 = int(gettime() - var_57949b2d);
        player dontinterpolate();
        camanimscripted(player, str_camera, var_41193b94, v_origin, v_angles);
        wait_for_camera(str_camera, n_start_time);
        player dontinterpolate();
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x849a0d7b, Offset: 0x5ca0
    // Size: 0x128
    function play_camera_on_player(player, n_start_time) {
        if (!scene::check_team(player.team, self._str_team)) {
            return;
        }
        e_align = csceneobject::get_align_ent();
        v_origin = isdefined(e_align.origin) ? e_align.origin : (0, 0, 0);
        v_angles = isdefined(e_align.angles) ? e_align.angles : (0, 0, 0);
        self thread _camanimscripted(player, isdefined(player.var_36fa161e) ? player.var_36fa161e : self._str_camera, v_origin, v_angles, n_start_time);
        player.var_36fa161e = undefined;
        [[ self ]]->on_play_anim(player);
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xf4229de6, Offset: 0x5a38
    // Size: 0x25e
    function play_camera(animation, n_start_time = 0) {
        flagsys::set(#"camera_playing");
        if (csceneobject::is_shared_player()) {
            a_players = [[ self._func_get ]](self._o_scene._str_team);
            foreach (player in a_players) {
                self._str_camera = [[ self ]]->animation_lookup(animation, player, 1);
                player.var_36fa161e = self._str_camera;
                thread play_camera_on_player(player, n_start_time);
            }
            wait_for_camera(self._str_camera, n_start_time);
        } else {
            self._str_camera = [[ self ]]->animation_lookup(animation, self._e, 1);
            self._e.var_36fa161e = self._str_camera;
            thread play_camera_on_player(self._e, n_start_time);
            wait_for_camera(self._str_camera, n_start_time);
        }
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                csceneobject::log(toupper(self._s.type) + "<unknown string>" + self._str_camera + "<unknown string>");
            }
        #/
        flagsys::clear(#"camera_playing");
        self._str_camera = undefined;
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x230452d9, Offset: 0x5970
    // Size: 0xbc
    function wait_for_camera(str_cam, n_start_time) {
        self endon(#"skip_camera_anims", self._str_shot + "active");
        if (iscamanimlooping(str_cam)) {
            level waittill(#"forever");
        } else {
            var_d4594f1 = float(getcamanimtime(str_cam)) / 1000;
            scene::wait_server_time(var_d4594f1, n_start_time);
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xdb58e635, Offset: 0x5898
    // Size: 0xce
    function function_6e4dc270(player) {
        player endon(#"new_shot", #"disconnect");
        self._o_scene waittilltimeout(0.1, #"scene_done", #"scene_stop", #"scene_skip_completed");
        if (self._n_streamer_req != -1) {
            player playerstreamerrequest("clear", player.var_231881b1[self._o_scene._str_name]);
        }
        player.streamer_hint_playing = undefined;
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x6105d395, Offset: 0x5780
    // Size: 0x10c
    function function_509b9f47(player) {
        player notify(#"hash_375ad02201949a8d");
        player endon(#"camanimscripted", #"hash_375ad02201949a8d", #"disconnect");
        self._o_scene waittilltimeout(0.1, #"scene_done", #"scene_stop", #"scene_skip_completed");
        stop_camera(player);
        /#
            if (isdefined(self._o_scene._b_testing) && self._o_scene._b_testing) {
                p_host = util::gethostplayer();
                stop_camera(p_host);
            }
        #/
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xb25b3173, Offset: 0x5638
    // Size: 0x13a
    function function_894716e2(player) {
        if (isbot(player)) {
            return;
        }
        if (isdefined(self.var_55b4f21e.var_6eb7f9a0)) {
            switch (self.var_55b4f21e.var_6eb7f9a0) {
            case #"bank1":
                player clientfield::set_to_player("player_pbg_bank_scene_system", 0);
                break;
            case #"bank2":
                player clientfield::set_to_player("player_pbg_bank_scene_system", 1);
                break;
            case #"bank3":
                player clientfield::set_to_player("player_pbg_bank_scene_system", 2);
                break;
            case #"bank4":
                player clientfield::set_to_player("player_pbg_bank_scene_system", 3);
                break;
            }
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4dd41a12, Offset: 0x5150
    // Size: 0x4dc
    function _cleanup_player(player) {
        if (!isdefined(player)) {
            return;
        }
        if (csceneobject::function_527113ae() && player flagsys::get(#"shared_igc")) {
            return;
        }
        if (csceneobject::is_shared_player() && player flagsys::get(#"hash_7cddd51e45d3ff3e")) {
            return;
        }
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                printtoprightln("<unknown string>");
            }
        #/
        player notify(#"hash_7ba9e3058f933eb");
        player.var_c3a79d20 = undefined;
        player.scene_set_visible_time = level.time;
        player setvisibletoall();
        player val::reset(#"scene", "hide");
        player flagsys::clear(#"shared_igc");
        player flagsys::clear(#"scene");
        player flagsys::clear(#"scene_interactive_shot");
        player flagsys::clear(#"hash_2f30b24ec0e23830");
        player flagsys::clear(#"hash_e2ce599b208682a");
        player flagsys::clear(#"hash_f21f320f68c0457");
        player util::delay(0.1, array("new_shot", "disconnect"), &scene::set_igc_active, 0, self._o_scene._str_name);
        player._scene_object = undefined;
        player.anim_debug_name = undefined;
        player.current_scene = undefined;
        player.scene_takedamage = undefined;
        player._scene_old_gun_removed = undefined;
        if (![[ self._o_scene ]]->has_next_shot(self._str_shot) || self._o_scene._str_mode === "single") {
            player thread scene::scene_enable_player_stuff(self._o_scene._s, self._s, self._o_scene._e_root);
            var_700fed0d = player getentitynumber() + 2;
            player util::delay_network_frames(var_700fed0d, "disconnect", &clientfield::set_to_player, "postfx_cateye", 0);
        }
        n_camera_tween_out = csceneobject::get_camera_tween_out();
        if (n_camera_tween_out > 0) {
            player startcameratween(n_camera_tween_out);
        }
        player allowstand(1);
        player allowcrouch(1);
        player allowprone(1);
        player sethighdetail(0);
        player util::function_7f49ffb7(-1);
        [[ self ]]->_reset_values(player);
        function_d3541c6f(player);
        thread function_6e4dc270(player);
        thread function_509b9f47(player);
        function_894716e2(player);
        /#
            if (player === level.host) {
                player util::delay(0.5, "<unknown string>", &destroy_dev_info);
            }
        #/
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x4962716, Offset: 0x5128
    // Size: 0x1c
    function _cleanup() {
        _cleanup_player(self._e);
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xaa85d6bf, Offset: 0x4ff0
    // Size: 0x12c
    function set_player_stance(player) {
        if (self._s.playerstance === "crouch") {
            player allowstand(0);
            player allowcrouch(1);
            player allowprone(0);
        } else if (self._s.playerstance === "prone") {
            player allowstand(0);
            player allowcrouch(0);
            player allowprone(1);
        } else {
            player allowstand(1);
            player allowcrouch(0);
            player allowprone(0);
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa82a1156, Offset: 0x4f70
    // Size: 0x78
    function revive_player(player) {
        if (level.gameended) {
            return;
        }
        if (player.sessionstate === "spectator") {
            player thread [[ level.spawnplayer ]]();
        } else if (player laststand::player_is_in_laststand()) {
            player notify(#"auto_revive");
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x72325974, Offset: 0x4ec0
    // Size: 0xa2
    function on_play_anim(player) {
        if (self._n_streamer_req != -1 && !csceneobject::is_skipping_scene() && !(isdefined(player.streamer_hint_playing) && player.streamer_hint_playing)) {
            player playerstreamerrequest("play", player.var_231881b1[self._o_scene._str_name]);
            player.streamer_hint_playing = 1;
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x175da82f, Offset: 0x4c98
    // Size: 0x220
    function function_9a7dd9f2(player) {
        player notify(#"hash_feb654ece8faa3d");
        thread function_31a89cb0(player, 0);
        thread function_d0cf938(player, 0);
        foreach (o_obj in self._o_scene._a_objects) {
            if (isdefined(o_obj)) {
                var_17c01da9 = o_obj._s.shots[csceneobject::get_shot(self._str_shot)];
                if (o_obj != self && isdefined(var_17c01da9.lvlstart_stomach_)) {
                    thread [[ o_obj ]]->_play_anim(var_17c01da9.lvlstart_stomach_, 1, 0.2, 0, 0);
                }
            }
        }
        var_609ac4c9 = self._s.shots[csceneobject::get_shot(self._str_shot)];
        if (isdefined(var_609ac4c9.lvlstart_stomach_)) {
            csceneobject::_play_anim(var_609ac4c9.lvlstart_stomach_, 1, 0.2, 0, 0);
        }
        _reset_values();
        player scene::set_igc_active(0, self._o_scene._str_name);
        player kill();
        [[ self._o_scene ]]->stop();
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x6414530e, Offset: 0x4ae8
    // Size: 0x1a4
    function function_ef1eb90b(player) {
        thread function_31a89cb0(player, 0);
        thread function_d0cf938(player, 0);
        foreach (o_obj in self._o_scene._a_objects) {
            if (isdefined(o_obj)) {
                var_17c01da9 = o_obj._s.shots[csceneobject::get_shot(self._str_shot)];
                if (o_obj != self && isdefined(var_17c01da9.var_c474be53)) {
                    thread [[ o_obj ]]->_play_anim(var_17c01da9.var_c474be53, 1, 0.2, 0, 0);
                }
            }
        }
        var_609ac4c9 = self._s.shots[csceneobject::get_shot(self._str_shot)];
        if (isdefined(var_609ac4c9.var_c474be53)) {
            csceneobject::_play_anim(var_609ac4c9.var_c474be53, 1, 0.2, 0, 0);
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x329dfbe5, Offset: 0x4920
    // Size: 0x1bc
    function function_a27af0ae(player) {
        player notify(#"hash_feb654ece8faa3d");
        thread function_31a89cb0(player, 0);
        thread function_d0cf938(player, 0);
        foreach (o_obj in self._o_scene._a_objects) {
            if (isdefined(o_obj)) {
                var_17c01da9 = o_obj._s.shots[csceneobject::get_shot(self._str_shot)];
                if (o_obj != self && isdefined(var_17c01da9.var_5bb36583)) {
                    thread [[ o_obj ]]->_play_anim(var_17c01da9.var_5bb36583, 1, 0.2, 0, 0);
                }
            }
        }
        var_609ac4c9 = self._s.shots[csceneobject::get_shot(self._str_shot)];
        if (isdefined(var_609ac4c9.var_5bb36583)) {
            csceneobject::_play_anim(var_609ac4c9.var_5bb36583, 1, 0.2, 0, 0);
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x54838516, Offset: 0x4848
    // Size: 0xd0
    function function_d0cf938(player, b_enable = 1) {
        player endon(#"hash_1aa7e630a34bee50");
        if (b_enable) {
            while (isalive(player)) {
                player playrumbleonentity("damage_heavy");
                wait(0.1);
            }
            player stoprumble("damage_heavy");
        } else {
            player stoprumble("damage_heavy");
            player notify(#"hash_1aa7e630a34bee50");
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x2be84b7b, Offset: 0x4770
    // Size: 0xd0
    function function_31a89cb0(player, b_enable = 1) {
        player endon(#"hash_3fdc27904c7ef691");
        if (b_enable) {
            while (isalive(player)) {
                player playrumbleonentity("damage_light");
                wait(0.3);
            }
            player stoprumble("damage_light");
        } else {
            player stoprumble("damage_light");
            player notify(#"hash_3fdc27904c7ef691");
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xf28938d, Offset: 0x4170
    // Size: 0x5f6
    function function_d4446494(player) {
        player endon(#"hash_7ba9e3058f933eb", #"hash_feb654ece8faa3d", #"death");
        while (1) {
            s_waitresult = undefined;
            s_waitresult = player waittill(#"hash_940a817baf9765e");
            if (!isdefined(s_waitresult.str_input)) {
                s_waitresult.str_input = "";
            }
            switch (s_waitresult.str_input) {
            case #"move_up":
            case #"move_down":
                if (s_waitresult.str_input == "move_up") {
                    if (player gamepadusedlast()) {
                        level.interactive_shot interactive_shot::set_text(player, #"hash_66ac13c66930481e");
                    } else {
                        level.interactive_shot interactive_shot::set_text(player, #"hash_2e61b9986055044e");
                    }
                } else if (player gamepadusedlast()) {
                    level.interactive_shot interactive_shot::set_text(player, #"hash_f7f3ef0446b4447");
                } else {
                    level.interactive_shot interactive_shot::set_text(player, #"hash_63aa233af2b054f1");
                }
                break;
            case #"move_right":
            case #"move_left":
                if (s_waitresult.str_input == "move_right") {
                    if (player gamepadusedlast()) {
                        level.interactive_shot interactive_shot::set_text(player, #"hash_b89e8fe23b5a6ff");
                    } else {
                        level.interactive_shot interactive_shot::set_text(player, #"hash_5cafbb3ef224b89");
                    }
                } else if (player gamepadusedlast()) {
                    level.interactive_shot interactive_shot::set_text(player, #"hash_43fe6cadb07b27b2");
                } else {
                    level.interactive_shot interactive_shot::set_text(player, #"hash_121d78dfceea3bf2");
                }
                break;
            case #"jump":
                level.interactive_shot interactive_shot::set_text(player, #"hash_5b57ca9476df902b");
                break;
            case #"stance":
                level.interactive_shot interactive_shot::set_text(player, #"hash_30214ec564c2c09b");
                break;
            case #"use":
                level.interactive_shot interactive_shot::set_text(player, #"hash_1c489083f5cdb3f6");
                break;
            case #"weapon_switch":
                level.interactive_shot interactive_shot::set_text(player, #"hash_5d8ce20bafb14fec");
                break;
            case #"sprint":
                if (player gamepadusedlast()) {
                    level.interactive_shot interactive_shot::set_text(player, #"hash_6b873520c198df93");
                } else {
                    level.interactive_shot interactive_shot::set_text(player, #"hash_7f72586820c8b86d");
                }
                break;
            case #"melee":
                level.interactive_shot interactive_shot::set_text(player, #"hash_6c4731677fa269b1");
                break;
            case #"attack":
                break;
            case #"dpad_up":
                level.interactive_shot interactive_shot::set_text(player, #"hash_327b92f099f4b62e");
                break;
            case #"dpad_down":
                level.interactive_shot interactive_shot::set_text(player, #"hash_51f4288480f483f7");
                break;
            case #"dpad_left":
                level.interactive_shot interactive_shot::set_text(player, #"hash_2f8bb64325eeac62");
                break;
            case #"dpad_right":
                level.interactive_shot interactive_shot::set_text(player, #"hash_2c841879f1d933ef");
                break;
            default:
                level.interactive_shot interactive_shot::set_text(player, #"");
                break;
            }
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x2554f987, Offset: 0x4018
    // Size: 0x150
    function function_bd3a7030(player, var_a0332034) {
        if (!level.interactive_shot interactive_shot::is_open(player)) {
            level.interactive_shot interactive_shot::open(player);
        }
        thread function_d4446494(player);
        player notify(#"hash_940a817baf9765e", {#str_input:var_a0332034});
        s_waitresult = undefined;
        s_waitresult = player waittill(#"hash_7ba9e3058f933eb", #"hash_feb654ece8faa3d", #"death");
        if (isdefined(player) && level.interactive_shot interactive_shot::is_open(player)) {
            level.interactive_shot interactive_shot::close(player);
        }
        if (s_waitresult._notify == "death") {
            [[ self._o_scene ]]->stop();
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0x8ebd13eb, Offset: 0x3a30
    // Size: 0x5da
    function check_input(player, var_ec50a0d3, var_966ea21d) {
        if (isbot(player) && function_c503dca9(player, var_ec50a0d3)) {
            if (player scene::function_268bfc72() && var_966ea21d) {
                if (player flagsys::get(#"hash_6ce14241f77af1e7")) {
                    return "combat";
                } else if (var_ec50a0d3.var_9532f6db == "move_up" || var_ec50a0d3.var_9532f6db == "move_right") {
                    if (player scene::function_6d361d2d()) {
                        return -1;
                    } else {
                        return 1;
                    }
                } else if (var_ec50a0d3.var_9532f6db == "move_down" || var_ec50a0d3.var_9532f6db == "move_left") {
                    if (player scene::function_6d361d2d()) {
                        return 1;
                    } else {
                        return -1;
                    }
                } else if (player scene::function_6d361d2d()) {
                    return 0;
                } else {
                    return 1;
                }
            } else if (var_ec50a0d3.var_9532f6db == "move_up" || var_ec50a0d3.var_9532f6db == "move_right" || var_ec50a0d3.var_9532f6db == "move_down" || var_ec50a0d3.var_9532f6db == "move_left") {
                return 0;
            } else {
                return 0;
            }
        }
        if (!level.interactive_shot interactive_shot::is_open(player)) {
            return 0;
        }
        if (player flagsys::get(#"hash_6ce14241f77af1e7") && !(isdefined(var_ec50a0d3.var_441cbab8) && var_ec50a0d3.var_441cbab8) && var_966ea21d) {
            return "combat";
        }
        switch (var_ec50a0d3.var_9532f6db) {
        case #"move_up":
        case #"move_down":
            v_movement = player getnormalizedmovement();
            return v_movement[0];
        case #"move_right":
        case #"move_left":
            v_movement = player getnormalizedmovement();
            return v_movement[1];
        case #"jump":
            return (player actionbuttonpressed() ? 1 : 0);
            break;
        case #"stance":
            return (player stancebuttonpressed() ? 1 : 0);
            break;
        case #"use":
            return (player usebuttonpressed() ? 1 : 0);
            break;
        case #"weapon_switch":
            return (player weaponswitchbuttonpressed() ? 1 : 0);
            break;
        case #"sprint":
            return (player sprintbuttonpressed() ? 1 : 0);
            break;
        case #"melee":
            return (player meleebuttonpressed() ? 1 : 0);
            break;
        case #"attack":
            return (!player flagsys::get(#"hash_6ce14241f77af1e7") && var_966ea21d ? 1 : 0);
            break;
        case #"dpad_up":
            return (player actionslotonebuttonpressed() ? 1 : 0);
            break;
        case #"dpad_down":
            return (player actionslottwobuttonpressed() ? 1 : 0);
            break;
        case #"dpad_left":
            return (player actionslotthreebuttonpressed() ? 1 : 0);
            break;
        case #"dpad_right":
            return (player actionslotfourbuttonpressed() ? 1 : 0);
            break;
        default:
            v_movement = player getnormalizedmovement();
            return v_movement[0];
            break;
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xc19ce402, Offset: 0x3770
    // Size: 0x2b2
    function function_c503dca9(player, var_ec50a0d3) {
        a_players = array::exclude(util::get_players(), player);
        foreach (player_other in a_players) {
            n_height_diff = abs(player_other.origin[2] - player.origin[2]);
            if (distancesquared(player.origin, player_other.origin) < 16384) {
                if (var_ec50a0d3.var_9532f6db == "move_up" && player.origin[2] < player_other.origin[2]) {
                    return 0;
                }
                if (var_ec50a0d3.var_9532f6db == "move_down" && player.origin[2] > player_other.origin[2]) {
                    return 0;
                }
                var_b52c361d = 0;
                var_55d77e67 = 0;
                var_9d0b2a04 = vectordot(anglestoright(player.angles), vectornormalize(player.origin - player_other.origin));
                if (var_9d0b2a04 > 0) {
                    var_b52c361d = 1;
                } else {
                    var_55d77e67 = 1;
                }
                if (var_ec50a0d3.var_9532f6db == "move_left" && var_b52c361d && n_height_diff < 32) {
                    return 0;
                }
                if (var_ec50a0d3.var_9532f6db == "move_right" && var_55d77e67 && n_height_diff < 32) {
                    return 0;
                }
            }
        }
        return 1;
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x3ed48067, Offset: 0x2278
    // Size: 0x14f0
    function function_7d761e79(player) {
        player notify(#"hash_7ba9e3058f933eb");
        player endon(#"hash_7ba9e3058f933eb", #"death");
        b_movement = 1;
        var_1c45c7f8 = 0;
        var_966ea21d = 0;
        var_a3cc5416 = isdefined(self.var_a3cc5416) ? self.var_a3cc5416 : 0.0001;
        self.var_a3cc5416 = undefined;
        var_ec50a0d3 = self._s.shots[csceneobject::get_shot(self._str_shot)];
        player flagsys::set(#"scene_interactive_shot");
        player.player_anim_look_enabled = 1;
        player.player_anim_clamp_right = isdefined(player.player_anim_clamp_right) ? player.player_anim_clamp_right : 75;
        player.player_anim_clamp_left = isdefined(player.player_anim_clamp_left) ? player.player_anim_clamp_left : 75;
        player.player_anim_clamp_top = isdefined(player.player_anim_clamp_top) ? player.player_anim_clamp_top : 180;
        player.player_anim_clamp_bottom = isdefined(player.player_anim_clamp_bottom) ? player.player_anim_clamp_bottom : 60;
        player.var_c3a79d20 = 1;
        thread function_bd3a7030(player, var_ec50a0d3.var_9532f6db);
        self._str_current_anim = csceneobject::get_animation_name(self._str_shot);
        while (1) {
            result = check_input(player, var_ec50a0d3, var_966ea21d);
            if (result === "combat") {
                n_movement = undefined;
                b_pressed = undefined;
            } else if (isfloat(result)) {
                n_movement = result;
                b_pressed = undefined;
                if (abs(n_movement) < 0.5) {
                    n_movement = 0;
                }
            } else {
                n_movement = undefined;
                b_pressed = result;
            }
            foreach (o_obj in self._o_scene._a_objects) {
                o_obj.var_efc540b6 = [[ o_obj ]]->function_376c9d87(var_ec50a0d3, n_movement, player);
                if (!isdefined(o_obj.var_efc540b6)) {
                    o_obj.var_efc540b6 = isdefined(o_obj._str_current_anim) ? o_obj._str_current_anim : csceneobject::get_animation_name(self._str_shot);
                    if (o_obj === self) {
                        var_f2b99dab = 1;
                    }
                }
            }
            /#
                assert(isdefined(self.var_efc540b6), "<unknown string>");
            #/
            if (isdefined(var_ec50a0d3.var_769fadce) && var_ec50a0d3.var_769fadce) {
                var_4a92a676 = getanimlength(self._str_current_anim);
                var_7a496fd5 = isdefined(var_ec50a0d3.var_3ee70278) ? var_ec50a0d3.var_3ee70278 : var_4a92a676 / 2;
                var_7a496fd5 = math::clamp(var_7a496fd5, 0, var_4a92a676);
                var_33d5f97d = var_4a92a676;
                b_pressed_button = 0;
                foreach (o_obj in self._o_scene._a_objects) {
                    thread [[ o_obj ]]->_play_anim(o_obj._str_current_anim, 1, 0.2, undefined, 0);
                }
                thread function_31a89cb0(player, 1);
                while (var_7a496fd5 > 0) {
                    var_7a496fd5 = var_7a496fd5 - float(function_60d95f53()) / 1000;
                    var_33d5f97d = var_33d5f97d - float(function_60d95f53()) / 1000;
                    b_result = check_input(player, var_ec50a0d3, var_966ea21d);
                    if (b_result) {
                        b_pressed_button = 1;
                        player notify(#"hash_feb654ece8faa3d");
                        while (var_7a496fd5 > 0) {
                            waitframe(1);
                            var_7a496fd5 = var_7a496fd5 - float(function_60d95f53()) / 1000;
                        }
                        function_a27af0ae(player);
                        var_a3cc5416 = 1;
                        break;
                    }
                    waitframe(1);
                }
                if (!b_pressed_button) {
                    thread function_31a89cb0(player, 0);
                    thread function_d0cf938(player, 1);
                    while (var_33d5f97d > 0) {
                        var_33d5f97d = var_33d5f97d - float(function_60d95f53()) / 1000;
                        b_result = check_input(player, var_ec50a0d3, var_966ea21d);
                        if (b_result) {
                            b_pressed_button = 1;
                            player notify(#"hash_feb654ece8faa3d");
                            while (var_33d5f97d > 0) {
                                waitframe(1);
                                var_33d5f97d = var_33d5f97d - float(function_60d95f53()) / 1000;
                            }
                            function_ef1eb90b(player);
                            var_a3cc5416 = 1;
                            break;
                        }
                        waitframe(1);
                    }
                }
                if (!b_pressed_button) {
                    thread function_9a7dd9f2(player);
                    return;
                }
            } else if (result === "combat" && !(isdefined(var_ec50a0d3.var_441cbab8) && var_ec50a0d3.var_441cbab8)) {
                if (isarray(player.var_8826a030) && player.var_8826a030.size) {
                    var_c09527fe = arraygetclosest(player.origin, player.var_8826a030);
                    v_to_target = var_c09527fe.origin - player.origin;
                    v_to_target = vectornormalize(v_to_target);
                    var_59c304d1 = vectortoangles(v_to_target);
                } else {
                    var_59c304d1 = player getplayerangles();
                }
                var_1cd52bd9 = player.origin;
                player animation::stop(0);
                util::wait_network_frame();
                var_208325df = 0;
                if (isdefined(self.var_55b4f21e.var_f251a00e)) {
                    /#
                        assert(isassetloaded("<unknown string>", self.var_55b4f21e.var_f251a00e), "<unknown string>" + self.var_55b4f21e.var_f251a00e + "<unknown string>");
                    #/
                    var_208325df = player gestures::play_gesture(self.var_55b4f21e.var_f251a00e, undefined, 0, 0);
                }
                e_player_link = util::spawn_model("tag_origin", var_1cd52bd9, var_59c304d1);
                player playerlinktodelta(e_player_link, undefined, 1, player.player_anim_clamp_right, player.player_anim_clamp_left, player.player_anim_clamp_top, player.player_anim_clamp_bottom);
                if (isanimlooping(self.var_efc540b6)) {
                    var_912e843b = util::spawn_player_clone(player, self.var_efc540b6, csceneobject::get_align_ent(), 1);
                    var_912e843b setinvisibletoplayer(player);
                    player setinvisibletoall();
                }
                player notify(#"hash_feb654ece8faa3d");
                while (player flagsys::get(#"hash_6ce14241f77af1e7")) {
                    waitframe(1);
                }
                if (var_208325df) {
                    player stopgestureviewmodel(self.var_55b4f21e.var_f251a00e, 1);
                }
                if (isdefined(e_player_link)) {
                    e_player_link delete();
                }
                if (isdefined(var_912e843b)) {
                    var_912e843b delete();
                }
                player setvisibletoall();
                foreach (o_obj in self._o_scene._a_objects) {
                    thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0.2, var_a3cc5416, 0, 1);
                }
            } else if (isdefined(b_pressed) && b_pressed && function_c503dca9(player, var_ec50a0d3)) {
                player notify(#"hash_feb654ece8faa3d");
                foreach (o_obj in self._o_scene._a_objects) {
                    if (isdefined(o_obj) && o_obj != self && isdefined(o_obj.var_efc540b6) && !var_1c45c7f8) {
                        thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0.2, var_a3cc5416);
                    }
                }
                if (!var_1c45c7f8) {
                    if (isanimlooping(self.var_efc540b6)) {
                        thread csceneobject::_play_anim(self.var_efc540b6, 1, 0.2, 0);
                    } else {
                        csceneobject::_play_anim(self.var_efc540b6, 1, 0.2, 0);
                    }
                }
                var_a3cc5416 = 1;
            } else if (isdefined(var_f2b99dab) && var_f2b99dab || n_movement === 0 && b_movement || !isdefined(n_movement) && !(isdefined(b_pressed) && b_pressed)) {
                b_movement = 0;
                var_f2b99dab = undefined;
                foreach (o_obj in self._o_scene._a_objects) {
                    if (isanimlooping(o_obj.var_efc540b6) && !var_1c45c7f8) {
                        var_1c45c7f8 = 1;
                        thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0.2);
                    } else if (!isanimlooping(o_obj.var_efc540b6)) {
                        thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0, var_a3cc5416, undefined, 1);
                    }
                }
                var_966ea21d = 1;
            } else if (isdefined(n_movement) && n_movement != 0) {
                b_movement = 1;
                n_anim_length = getanimlength(self._str_current_anim);
                var_5df5e79a = abs(n_movement);
                n_update_time = float(function_60d95f53()) / 1000 / n_anim_length;
                var_ea474464 = math::clamp(var_5df5e79a, 1, 1);
                if (csceneobject::function_a808aac7()) {
                    var_a3cc5416 = var_a3cc5416 - n_update_time * var_ea474464;
                    var_f667af2f = 1 - var_a3cc5416;
                } else {
                    var_a3cc5416 = var_a3cc5416 + n_update_time * var_ea474464;
                    var_f667af2f = var_a3cc5416;
                }
                var_f667af2f = math::clamp(var_f667af2f, 0, 1);
                if (var_a3cc5416 <= 0 && csceneobject::function_a808aac7()) {
                    var_f2b99dab = 1;
                } else {
                    if (animhasnotetrack(self.var_efc540b6, "interactive_shot_marker")) {
                        a_n_times = getnotetracktimes(self.var_efc540b6, "interactive_shot_marker");
                        foreach (n_time in a_n_times) {
                            if (n_time > var_f667af2f) {
                                var_b97b91e4 = n_time;
                                break;
                            }
                        }
                    }
                    if (isdefined(var_b97b91e4)) {
                        while (var_f667af2f <= var_b97b91e4) {
                            foreach (o_obj in self._o_scene._a_objects) {
                                thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0, var_f667af2f);
                            }
                            waitframe(1);
                            var_a3cc5416 = var_a3cc5416 + n_update_time * var_ea474464;
                            var_f667af2f = var_a3cc5416;
                        }
                        var_b97b91e4 = undefined;
                    } else {
                        foreach (o_obj in self._o_scene._a_objects) {
                            thread [[ o_obj ]]->_play_anim(o_obj.var_efc540b6, 1, 0, var_f667af2f);
                        }
                    }
                }
            }
            if (var_a3cc5416 >= 1 || var_a3cc5416 <= 0 && csceneobject::function_a808aac7()) {
                if (csceneobject::function_a808aac7()) {
                    var_778409ab = csceneobject::get_shot(self._str_shot);
                    if (var_778409ab > 0 && isdefined(self._s.shots[var_778409ab - 1]) && csceneobject::function_e91c94b9(var_778409ab - 1) && !(isdefined(self._s.shots[var_778409ab - 1].var_751fe16b) && self._s.shots[var_778409ab - 1].var_751fe16b)) {
                        self.var_a3cc5416 = 1;
                        self._o_scene.var_2e9fdf35 = self._s.shots[var_778409ab - 1].name;
                        waitframe(1);
                    } else {
                        var_a3cc5416 = math::clamp(var_a3cc5416, 0, 1);
                        waitframe(1);
                        continue;
                    }
                }
                foreach (o_obj in self._o_scene._a_objects) {
                    o_obj._b_active_anim = 0;
                    o_obj flagsys::clear(#"scene_interactive_shot_active");
                }
                return;
            }
            var_a3cc5416 = math::clamp(var_a3cc5416, 0, 1);
            waitframe(1);
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x300dad8a, Offset: 0x2130
    // Size: 0x13a
    function function_dd8a2de2(player) {
        if (isbot(player)) {
            return;
        }
        if (isdefined(self.var_55b4f21e.var_143deeac)) {
            switch (self.var_55b4f21e.var_143deeac) {
            case #"bank1":
                player clientfield::set_to_player("player_pbg_bank_scene_system", 0);
                break;
            case #"bank2":
                player clientfield::set_to_player("player_pbg_bank_scene_system", 1);
                break;
            case #"bank3":
                player clientfield::set_to_player("player_pbg_bank_scene_system", 2);
                break;
            case #"bank4":
                player clientfield::set_to_player("player_pbg_bank_scene_system", 3);
                break;
            }
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xdaf012d4, Offset: 0x1ed8
    // Size: 0x24e
    function function_7efadfe8(player) {
        player.player_anim_look_enabled = !(isdefined(self._s.lockview) && self._s.lockview);
        player.player_anim_clamp_right = isdefined(isdefined(self.var_55b4f21e.viewclampright) ? self.var_55b4f21e.viewclampright : self._s.viewclampright) ? isdefined(self.var_55b4f21e.viewclampright) ? self.var_55b4f21e.viewclampright : self._s.viewclampright : 0;
        player.player_anim_clamp_left = isdefined(isdefined(self.var_55b4f21e.viewclampleft) ? self.var_55b4f21e.viewclampleft : self._s.viewclampleft) ? isdefined(self.var_55b4f21e.viewclampleft) ? self.var_55b4f21e.viewclampleft : self._s.viewclampleft : 0;
        player.player_anim_clamp_top = isdefined(isdefined(self.var_55b4f21e.viewclamptop) ? self.var_55b4f21e.viewclamptop : self._s.viewclamptop) ? isdefined(self.var_55b4f21e.viewclamptop) ? self.var_55b4f21e.viewclamptop : self._s.viewclamptop : 0;
        player.player_anim_clamp_bottom = isdefined(isdefined(self.var_55b4f21e.viewclampbottom) ? self.var_55b4f21e.viewclampbottom : self._s.viewclampbottom) ? isdefined(self.var_55b4f21e.viewclampbottom) ? self.var_55b4f21e.viewclampbottom : self._s.viewclampbottom : 0;
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xfaf0bc42, Offset: 0x1e48
    // Size: 0x84
    function function_c26a4e8b(player, b_enable) {
        if (b_enable) {
            if (isdefined(player.var_313437ff) && player.var_313437ff) {
                player.var_313437ff = undefined;
                player weapons::force_stowed_weapon_update();
            }
        } else {
            player.var_313437ff = 1;
            player clearstowedweapon();
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xfe4b821b, Offset: 0x1d30
    // Size: 0x10c
    function function_d3541c6f(player) {
        if (isdefined(player.var_777951c)) {
            player takeweapon(player.var_777951c);
            player val::reset(#"hash_42d78b644f22da0b", "take_weapons");
            player player::switch_to_primary_weapon(1);
            player.var_777951c = undefined;
        }
        if (isdefined(self.var_55b4f21e.hidestowedweapon) && self.var_55b4f21e.hidestowedweapon) {
            function_c26a4e8b(player, 1);
        }
        if (!(isdefined(self._s.dontreloadammo) && self._s.dontreloadammo)) {
            player player::fill_current_clip();
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x213a5f25, Offset: 0x1c50
    // Size: 0xd2
    function function_c7246a4a(player, var_d4c489c0) {
        w_slot = player loadout::function_18a77b37(var_d4c489c0);
        var_e4b15461 = player getcurrentweapon();
        if (w_slot != var_e4b15461) {
            player val::set(#"hash_42d78b644f22da0b", "take_weapons", 1);
            player giveweapon(w_slot);
            player switchtoweaponimmediate(w_slot);
            player.var_777951c = w_slot;
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa7d9e7b0, Offset: 0x1760
    // Size: 0x4e4
    function function_d46ffe56(player) {
        if ((!(isdefined(self._s.removeweapon) && self._s.removeweapon) || isdefined(self._s.showweaponinfirstperson) && self._s.showweaponinfirstperson) && !(isdefined(self._s.disableprimaryweaponswitch) && self._s.disableprimaryweaponswitch)) {
            player player::switch_to_primary_weapon(1);
        }
        if (isdefined(self.var_55b4f21e.var_1a95895f) && self.var_55b4f21e.var_1a95895f) {
            w_primary = player loadout::function_18a77b37("primary");
            var_59cf3a45 = w_primary.rootweapon;
            w_secondary = player loadout::function_18a77b37("secondary");
            var_cae8b14d = w_secondary.rootweapon;
            var_a9fd0a0a = array(getweapon(#"ar_accurate_t8"), getweapon(#"ar_fastfire_t8"), getweapon(#"ar_stealth_t8"), getweapon(#"ar_damage_t8"), getweapon(#"ar_modular_t8"), getweapon(#"smg_handling_t8"), getweapon(#"smg_standard_t8"), getweapon(#"smg_accurate_t8"), getweapon(#"smg_fastfire_t8"), getweapon(#"smg_capacity_t8"), getweapon(#"lmg_heavy_t8"), getweapon(#"lmg_standard_t8"), getweapon(#"lmg_spray_t8"));
            arrayremovevalue(var_a9fd0a0a, level.weaponnone);
            if (isinarray(var_a9fd0a0a, var_59cf3a45)) {
                function_c7246a4a(player, "primary");
            } else if (isinarray(var_a9fd0a0a, var_cae8b14d)) {
                function_c7246a4a(player, "secondary");
            } else {
                a_weapon_options = player getweaponoptions(w_primary);
                player val::set(#"hash_42d78b644f22da0b", "take_weapons", 1);
                player giveweapon(getweapon(#"ar_accurate_t8"), a_weapon_options);
                player switchtoweaponimmediate(getweapon(#"ar_accurate_t8"), 1);
                player.var_777951c = getweapon(#"ar_accurate_t8");
            }
        }
        if (isdefined(self.var_55b4f21e.hidestowedweapon) && self.var_55b4f21e.hidestowedweapon) {
            function_c26a4e8b(player, 0);
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xe59914b, Offset: 0xa88
    // Size: 0xcd0
    function _prepare_player(player) {
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                printtoprightln("<unknown string>");
            }
        #/
        player endon(#"death");
        player notify(#"new_shot");
        var_2bb59a6a = csceneobject::function_24f8cfb5(self._str_shot) || isdefined(self._o_scene.b_play_from_time) && self._o_scene.b_play_from_time;
        function_dd8a2de2(player);
        if (player.current_scene === self._o_scene._str_name) {
            return 0;
        }
        /#
            if (player === level.host && scene::check_team(player.team, self._str_team)) {
                display_dev_info();
            }
        #/
        if (!(isdefined(self._s.showhud) && self._s.showhud) && !(isdefined(self._s.allowdeath) && self._s.allowdeath)) {
            player scene::set_igc_active(1, self._o_scene._str_name);
        }
        [[ self ]]->_set_values(player);
        player sethighdetail(1);
        str_streamer_hint = self._o_scene._a_streamer_hint[player.team];
        if (isdefined(str_streamer_hint)) {
            if (!isdefined(player.var_231881b1)) {
                player.var_231881b1 = [];
            }
            if (!isdefined(player.var_16672042)) {
                player.var_16672042 = [];
            }
            if (isdefined(player.var_16672042[self._o_scene._str_name]) && player.var_16672042[self._o_scene._str_name] != -1) {
                self._n_streamer_req = player.var_16672042[self._o_scene._str_name];
            } else if (self._n_streamer_req == -1) {
                self._n_streamer_req = player playerstreamerrequest("set", str_streamer_hint);
                player.var_231881b1[self._o_scene._str_name] = str_streamer_hint;
                player.var_16672042[self._o_scene._str_name] = self._n_streamer_req;
            }
            if (var_2bb59a6a && self._n_streamer_req != -1) {
                if (!(isdefined(level.scene_streamer_ignore[self._o_scene._s.name]) && level.scene_streamer_ignore[self._o_scene._s.name])) {
                    if (!(isdefined(self._o_scene._s.ignorestreamer) && self._o_scene._s.ignorestreamer) && !(isdefined(self._o_scene._b_testing) && self._o_scene._b_testing) && !scene::function_46546b5c(self._o_scene._s.name)) {
                        self endon(#"new_shot");
                        level util::streamer_wait(undefined, 0, getdvarint(#"hash_47b7504d8ac8d477", 30), player.team, self._o_scene._str_name);
                    }
                }
            }
        }
        if (player flagsys::get(#"mobile_armory_in_use")) {
            player flagsys::set(#"cancel_mobile_armory");
            player closemenu("mobile_armory_loadout");
            params = {#intpayload:0, #response:"cancel", #menu:"mobile_armory_loadout"};
            player notify(#"menuresponse", params);
            player callback::callback(#"menu_response", params);
        }
        if (player flagsys::get(#"mobile_armory_begin_use")) {
            player val::reset(#"mobile_armory_use", "disable_weapons");
            player flagsys::clear(#"mobile_armory_begin_use");
        }
        if (getdvarint(#"scene_hide_player", 0)) {
            player val::set(#"scene", "hide");
        }
        player._scene_object = self;
        player.current_scene = self._o_scene._str_name;
        player.var_e3d6d713 = player.current_scene;
        player.anim_debug_name = self._s.name;
        /#
            if (csceneobject::function_209522a0()) {
                if (isdefined(self._s.model)) {
                    var_be7bc546 = currentsessionmode();
                    var_123ebd30 = getallcharacterbodies(var_be7bc546);
                    var_ca47355c = 0;
                    foreach (var_2074c3ff in var_123ebd30) {
                        var_b744a7ed = function_d299ef16(var_2074c3ff, var_be7bc546);
                        for (var_6e0e2531 = 0; var_6e0e2531 < var_b744a7ed; var_6e0e2531++) {
                            var_322595c6 = function_d7c3cf6c(var_2074c3ff, var_6e0e2531, var_be7bc546);
                            if (var_322595c6.namehash === self._s.model) {
                                player setcharacterbodytype(var_2074c3ff);
                                player setcharacteroutfit(var_6e0e2531);
                                if (isdefined(self._s.var_a5617859) && isarray(var_322595c6.presets)) {
                                    var_a919ac81 = strtok(self._s.var_a5617859, "<unknown string>");
                                    foreach (var_a343b02b, s_preset in var_322595c6.presets) {
                                        if (!(isdefined(s_preset.isvalid) && s_preset.isvalid)) {
                                            continue;
                                        }
                                        if (isdefined(var_a919ac81[1]) && int(var_a919ac81[1]) === var_a343b02b) {
                                            player function_fbc5a093(var_a343b02b);
                                            break;
                                        }
                                    }
                                }
                                var_ca47355c = 1;
                                break;
                            }
                        }
                        if (var_ca47355c) {
                            break;
                        }
                    }
                }
            }
        #/
        if ([[ self._o_scene ]]->is_scene_shared() && (var_2bb59a6a || scene::function_46546b5c(self._o_scene._str_name)) && !csceneobject::is_skipping_scene()) {
            player thread scene::function_a4ad0308(self._o_scene);
            if (var_2bb59a6a && getdvarint(#"hash_44f3b54c25dfae3b", 0)) {
                player clientfield::set_to_player("postfx_cateye", 1);
            }
        }
        revive_player(player);
        player thread util::cleanup_fancycam();
        if (isdefined(player.hijacked_vehicle_entity)) {
            player.hijacked_vehicle_entity delete();
        } else if (isalive(player) && !(isdefined(self._s.var_5829ce6b) && self._s.var_5829ce6b) && player isinvehicle()) {
            vh_occupied = player getvehicleoccupied();
            n_seat = vh_occupied getoccupantseat(player);
            vh_occupied usevehicle(player, n_seat);
        }
        if (self._o_scene._s scene::is_igc()) {
            player thread scene::scene_disable_player_stuff(self._o_scene._s, self._s);
            player util::function_7f49ffb7(6);
        }
        function_7efadfe8(player);
        function_d46ffe56(player);
        set_player_stance(player);
        player flagsys::set(#"scene");
        waitframe(0);
        if (isdefined(self.var_55b4f21e.interactiveshot) && self.var_55b4f21e.interactiveshot) {
            thread function_7d761e79(player);
        }
        player notify(#"scene_ready");
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x66c25a53, Offset: 0xa60
    // Size: 0x1c
    function _prepare() {
        _prepare_player(self._e);
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x80e2f808, Offset: 0x938
    // Size: 0x11c
    function _reset_values(ent = self._e) {
        csceneobject::reset_ent_val("takedamage", ent);
        csceneobject::reset_ent_val("ignoreme", ent);
        csceneobject::reset_ent_val("allowdeath", ent);
        csceneobject::reset_ent_val("take_weapons", ent);
        if (isbot(ent) && (csceneobject::function_b260bdcc(self._str_shot) || self._o_scene._str_mode === "single" || isdefined(self._o_scene.scene_stopping) && self._o_scene.scene_stopping)) {
            ent botreleasemanualcontrol();
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xde0c182f, Offset: 0x788
    // Size: 0x1a4
    function _set_values(ent = self._e) {
        if (!(isdefined(self._s.takedamage) && self._s.takedamage)) {
            ent setnormalhealth(1);
        }
        if (isdefined(ent.takedamage) && ent.takedamage && !ent getinvulnerability()) {
            csceneobject::set_ent_val("takedamage", isdefined(self._s.takedamage) && self._s.takedamage, ent);
        }
        csceneobject::set_ent_val("ignoreme", !(isdefined(self._s.takedamage) && self._s.takedamage), ent);
        csceneobject::set_ent_val("allowdeath", isdefined(self._s.allowdeath) && self._s.allowdeath, ent);
        csceneobject::set_ent_val("take_weapons", isdefined(self._s.removeweapon) && self._s.removeweapon, ent);
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x29fdce9, Offset: 0x660
    // Size: 0x11c
    function function_d09b043() {
        if (isdefined(self.var_55b4f21e.interactiveshot) && self.var_55b4f21e.interactiveshot) {
            return;
        }
        self notify(#"hash_30095f69ee804b7e");
        self endon(#"hash_30095f69ee804b7e");
        self._o_scene endon(#"scene_done", #"scene_stop", #"scene_skip_completed", #"hash_3168dab591a18b9b");
        s_waitresult = undefined;
        s_waitresult = self._e waittill(#"death");
        self.var_1f97724a = 1;
        self._e notify(#"hash_6e7fd8207fd988c6", {#str_scene:self._o_scene._str_name});
        csceneobject::function_1e19d813();
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xe4c79758, Offset: 0x518
    // Size: 0x140
    function _spawn() {
        /#
            if (isdefined(self._o_scene._b_testing) && self._o_scene._b_testing && csceneobject::is_player()) {
                p_host = util::gethostplayer();
                if (!csceneobject::in_this_scene(p_host)) {
                    self._e = p_host;
                    return;
                }
            }
        #/
        csceneobject::restore_saved_ent();
        if (!isdefined(self._e)) {
            foreach (ent in [[ self._func_get ]](self._str_team)) {
                if (!csceneobject::in_this_scene(ent)) {
                    self._e = ent;
                    return;
                }
            }
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x586f4cdc, Offset: 0x3f0
    // Size: 0x11c
    function _stop(b_dont_clear_anim, b_finished) {
        if (isalive(self._e)) {
            self._e notify(#"scene_stop");
            stop_camera(self._e);
            self._e flagsys::clear(#"hash_7cddd51e45d3ff3e");
            if (!(isdefined(self._s.diewhenfinished) && self._s.diewhenfinished) || !b_finished) {
                self._e animation::stop(0.2);
            }
            self._e thread scene::scene_enable_player_stuff(self._o_scene._s, self._s, self._o_scene._e_root);
        }
    }

    // Namespace csceneplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xb5404e50, Offset: 0x380
    // Size: 0x62
    function first_init(s_objdef, o_scene) {
        if (isdefined(o_scene._str_team)) {
            s_objdef.team = o_scene._str_team;
        }
        s_objdef.nospawn = 1;
        return csceneobject::first_init(s_objdef, o_scene);
    }

}

// Namespace scene
// Method(s) 2 Total 104
class cscenefakeplayer : csceneobject {

    // Namespace cscenefakeplayer/scene_player_shared
    // Params 0, eflags: 0x89 linked class_linked
    // Checksum 0xcf30ae0c, Offset: 0xb000
    // Size: 0x14
    __constructor() {
        csceneobject::__constructor();
    }

    // Namespace cscenefakeplayer/scene_player_shared
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x5fda0571, Offset: 0xb020
    // Size: 0x14
    __destructor() {
        csceneobject::__destructor();
    }

}

// Namespace scene
// Method(s) 8 Total 138
class cscenesharedplayer : csceneplayer, csceneobject {

    // Namespace cscenesharedplayer/scene_player_shared
    // Params 0, eflags: 0x89 linked class_linked
    // Checksum 0xa5abb8df, Offset: 0x9250
    // Size: 0x14
    __constructor() {
        csceneplayer::__constructor();
    }

    // Namespace cscenesharedplayer/scene_player_shared
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0xc9fa5d63, Offset: 0x9270
    // Size: 0x14
    __destructor() {
        csceneplayer::__destructor();
    }

    // Namespace cscenesharedplayer/scene_player_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x13f26b9a, Offset: 0x91c0
    // Size: 0x88
    function _cleanup() {
        foreach (player in [[ self._func_get ]](self._str_team)) {
            csceneplayer::_cleanup_player(player);
        }
    }

    // Namespace cscenesharedplayer/scene_player_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xef268755, Offset: 0x90c8
    // Size: 0xf0
    function _stop(b_dont_clear_anim, b_finished) {
        foreach (player in [[ self._func_get ]](self._str_team)) {
            csceneplayer::stop_camera(player);
            player animation::stop();
            player thread scene::scene_enable_player_stuff(self._o_scene._s, self._s, self._o_scene._e_root);
        }
    }

    // Namespace cscenesharedplayer/scene_player_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xa9f706e7, Offset: 0x8ff0
    // Size: 0xd0
    function _set_visibility() {
        a_players = [[ self._func_get ]](self._str_team);
        foreach (player in a_players) {
            player show();
            if (!player flagsys::get(#"hash_7cddd51e45d3ff3e")) {
                player setinvisibletoall();
            }
        }
    }

    // Namespace cscenesharedplayer/scene_player_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xb01a2891, Offset: 0x88c0
    // Size: 0x724
    function _play_shared_player_anim_for_player(player) {
        player endon(#"death");
        if (!scene::check_team(player.team, self._str_team)) {
            return;
        }
        str_animation = self.player_animation;
        str_animation = [[ self ]]->animation_lookup(str_animation, player);
        csceneplayer::on_play_anim(player);
        /#
        #/
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                printtoprightln("<unknown string>" + self.player_animation);
            }
        #/
        player flagsys::set(#"shared_igc");
        if (player flagsys::get(self.player_animation_notify)) {
            player flagsys::set(self.player_animation_notify + "_skip_init_clear");
        }
        player flagsys::set(self.player_animation_notify);
        if (isdefined(player getlinkedent())) {
            player unlink();
        }
        if (!(isdefined(self._s.disabletransitionin) && self._s.disabletransitionin)) {
            if (player != self._e || getdvarint(#"scr_player1_postfx", 0)) {
                if (!isdefined(player.screen_fade_menus)) {
                    if (!(isdefined(level.chyron_text_active) && level.chyron_text_active)) {
                        if (!(isdefined(player.var_8a1a4ba) && player.var_8a1a4ba)) {
                            player.play_scene_transition_effect = 1;
                        }
                    }
                }
            }
        }
        csceneplayer::_prepare_player(player);
        n_time_passed = float(gettime() - self.player_start_time) / 1000;
        n_start_time = self.player_time_frac * self.player_animation_length;
        n_time_left = self.player_animation_length - n_time_passed - n_start_time;
        n_time_frac = 1 - n_time_left / self.player_animation_length;
        if (isdefined(self._e) && player != self._e) {
            player dontinterpolate();
            player setorigin(self._e.origin);
            if (!isbot(player)) {
                player setplayerangles(self._e getplayerangles());
            }
        }
        n_lerp = csceneobject::get_lerp_time();
        if (!csceneplayer::function_6c1c67c1()) {
            csceneplayer::stop_camera(player);
            n_camera_tween = csceneobject::get_camera_tween();
            if (n_camera_tween > 0) {
                player startcameratween(n_camera_tween);
            }
        }
        if (n_time_frac < 1) {
            /#
                if (getdvarint(#"scene_hide_player", 0) > 0) {
                    player val::set(#"scene", "<unknown string>");
                }
                if (getdvarint(#"debug_scene", 0) > 0) {
                    printtoprightln("<unknown string>" + self._s.name + "<unknown string>" + self.player_animation);
                }
            #/
            player_num = player getentitynumber();
            if (!isdefined(self.current_playing_anim)) {
                self.current_playing_anim[player_num] = [];
            }
            self.current_playing_anim[player_num] = str_animation;
            if (csceneobject::is_skipping_scene()) {
                thread csceneobject::skip_scene(1);
            }
            if (csceneobject::function_5c2a9efa()) {
                player val::set(#"scene_player", "freezecontrols", 1);
                csceneobject::function_5c082667();
                player val::reset(#"scene_player", "freezecontrols");
            } else {
                player animation::play(str_animation, self.player_align, self.player_tag, self.player_rate, 0, 0, n_lerp, n_time_frac, self._s.showweaponinfirstperson);
            }
            if (!player flagsys::get(self.player_animation_notify + "_skip_init_clear")) {
                player flagsys::clear(self.player_animation_notify);
            } else {
                player flagsys::clear(self.player_animation_notify + "_skip_init_clear");
            }
            if (!player isplayinganimscripted()) {
                self.current_playing_anim[player_num] = undefined;
            }
            /#
                if (getdvarint(#"debug_scene", 0) > 0) {
                    printtoprightln("<unknown string>" + self._s.name + "<unknown string>" + self.player_animation);
                }
            #/
        }
    }

    // Namespace cscenesharedplayer/scene_player_shared
    // Params 4, eflags: 0x1 linked
    // Checksum 0xdb665f21, Offset: 0x84d8
    // Size: 0x3e0
    function _play_anim(animation, n_rate, n_blend, n_time) {
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                printtoprightln("<unknown string>" + animation);
            }
        #/
        self._str_current_anim = animation;
        self.player_animation = animation;
        self.player_animation_notify = animation + "_notify";
        self.player_animation_length = getanimlength(animation);
        self.player_align = self.m_align;
        self.player_tag = self.m_tag;
        self.player_rate = n_rate;
        self.player_time_frac = n_time;
        self.player_start_time = gettime();
        a_players = [[ self._func_get ]](self._str_team);
        /#
            if (isdefined(self._e) && !isinarray(a_players, self._e)) {
                arrayinsert(a_players, self._e, 0);
            }
        #/
        foreach (player in a_players) {
            if (player flagsys::get(#"loadout_given") && player.sessionstate !== "spectator") {
                self thread _play_shared_player_anim_for_player(player);
            } else if (isdefined(player.initialloadoutgiven) && player.initialloadoutgiven) {
                csceneplayer::revive_player(player);
            }
        }
        [[ self ]]->_set_visibility();
        waittillframeend();
        do {
            b_playing = 0;
            foreach (player in [[ self._func_get_active ]](self._str_team)) {
                if (isdefined(player) && player flagsys::get(self.player_animation_notify)) {
                    b_playing = 1;
                    player flagsys::wait_till_clear(self.player_animation_notify);
                    break;
                }
            }
        } while(b_playing);
        /#
            if (getdvarint(#"debug_scene", 0) > 0) {
                csceneobject::log(toupper(self._s.type) + "<unknown string>" + self._str_current_anim + "<unknown string>");
            }
        #/
        thread [[ self._o_scene ]]->_call_shot_funcs("players_done");
    }

    // Namespace cscenesharedplayer/scene_player_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xf97d91cf, Offset: 0x83f0
    // Size: 0xdc
    function _prepare() {
        if (!csceneobject::function_e0df299e(self._str_shot)) {
            return;
        }
        a_players = [[ self._func_get ]](self._str_team);
        foreach (ent in a_players) {
            thread [[ self ]]->_prepare_player(ent);
        }
        [[ self ]]->_set_visibility();
        array::wait_till(a_players, "scene_ready");
    }

}


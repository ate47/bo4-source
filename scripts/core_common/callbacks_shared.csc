// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\activecamo_shared.csc;

#namespace callback;

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x8b1836, Offset: 0x120
// Size: 0x144
function callback(event, localclientnum, params) {
    if (isdefined(level._callbacks) && isdefined(level._callbacks[event])) {
        for (i = 0; i < level._callbacks[event].size; i++) {
            callback = level._callbacks[event][i][0];
            obj = level._callbacks[event][i][1];
            if (!isdefined(callback)) {
                continue;
            }
            if (isdefined(obj)) {
                if (isdefined(params)) {
                    obj thread [[ callback ]](localclientnum, self, params);
                } else {
                    obj thread [[ callback ]](localclientnum, self);
                }
            } else if (isdefined(params)) {
                self thread [[ callback ]](localclientnum, params);
            } else {
                self thread [[ callback ]](localclientnum);
            }
        }
    }
}

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x6339afd9, Offset: 0x270
// Size: 0x134
function entity_callback(event, localclientnum, params) {
    if (isdefined(self._callbacks) && isdefined(self._callbacks[event])) {
        for (i = 0; i < self._callbacks[event].size; i++) {
            callback = self._callbacks[event][i][0];
            obj = self._callbacks[event][i][1];
            if (!isdefined(callback)) {
                continue;
            }
            if (isdefined(obj)) {
                if (isdefined(params)) {
                    obj thread [[ callback ]](localclientnum, self, params);
                } else {
                    obj thread [[ callback ]](localclientnum, self);
                }
            } else if (isdefined(params)) {
                self thread [[ callback ]](localclientnum, params);
            } else {
                self thread [[ callback ]](localclientnum);
            }
        }
    }
}

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x8514fce4, Offset: 0x3b0
// Size: 0x17c
function add_callback(event, func, obj) {
    /#
        assert(isdefined(event), "<unknown string>");
    #/
    if (!isdefined(level._callbacks) || !isdefined(level._callbacks[event])) {
        level._callbacks[event] = [];
    }
    foreach (callback in level._callbacks[event]) {
        if (callback[0] == func) {
            if (!isdefined(obj) || callback[1] == obj) {
                return;
            }
        }
    }
    array::add(level._callbacks[event], array(func, obj), 0);
    if (isdefined(obj)) {
        obj thread remove_callback_on_death(event, func);
    }
}

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x210fc7f1, Offset: 0x538
// Size: 0x14c
function add_entity_callback(event, func, obj) {
    /#
        assert(isdefined(event), "<unknown string>");
    #/
    if (!isdefined(self._callbacks) || !isdefined(self._callbacks[event])) {
        self._callbacks[event] = [];
    }
    foreach (callback in self._callbacks[event]) {
        if (callback[0] == func) {
            if (!isdefined(obj) || callback[1] == obj) {
                return;
            }
        }
    }
    array::add(self._callbacks[event], array(func, obj), 0);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x8f33204c, Offset: 0x690
// Size: 0x44
function remove_callback_on_death(event, func) {
    self waittill(#"death");
    remove_callback(event, func, self);
}

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xa61d0707, Offset: 0x6e0
// Size: 0x11c
function function_52ac9652(event, func, obj) {
    /#
        assert(isdefined(event), "<unknown string>");
    #/
    if (!isdefined(self._callbacks) || !isdefined(self._callbacks[event])) {
        return;
    }
    foreach (index, func_group in self._callbacks[event]) {
        if (func_group[0] == func) {
            if (func_group[1] === obj) {
                arrayremoveindex(self._callbacks[event], index, 0);
                break;
            }
        }
    }
}

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x57b534d9, Offset: 0x808
// Size: 0x12c
function remove_callback(event, func, obj) {
    /#
        assert(isdefined(event), "<unknown string>");
    #/
    /#
        assert(isdefined(level._callbacks[event]), "<unknown string>");
    #/
    foreach (index, func_group in level._callbacks[event]) {
        if (func_group[0] == func) {
            if (func_group[1] === obj) {
                arrayremoveindex(level._callbacks[event], index, 0);
                break;
            }
        }
    }
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x76dbc21a, Offset: 0x940
// Size: 0x3c
function on_localclient_connect(func, obj) {
    add_callback(#"on_localclient_connect", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x1570b72e, Offset: 0x988
// Size: 0x3c
function on_localclient_shutdown(func, obj) {
    add_callback(#"on_localclient_shutdown", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x122637eb, Offset: 0x9d0
// Size: 0x3c
function on_finalize_initialization(func, obj) {
    add_callback(#"on_finalize_initialization", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf1f37c6a, Offset: 0xa18
// Size: 0x3c
function on_gameplay_started(func, obj) {
    add_callback(#"on_gameplay_started", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe9fc57d2, Offset: 0xa60
// Size: 0x3c
function on_localplayer_spawned(func, obj) {
    add_callback(#"on_localplayer_spawned", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x4c4d7b0a, Offset: 0xaa8
// Size: 0x3c
function remove_on_localplayer_spawned(func, obj) {
    remove_callback(#"on_localplayer_spawned", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x5a900cf2, Offset: 0xaf0
// Size: 0x3c
function on_spawned(func, obj) {
    add_callback(#"on_player_spawned", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x1c84620b, Offset: 0xb38
// Size: 0x3c
function remove_on_spawned(func, obj) {
    remove_callback(#"on_player_spawned", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe70a2f6c, Offset: 0xb80
// Size: 0x3c
function on_laststand(func, obj) {
    add_callback(#"on_player_laststand", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x9fd810f3, Offset: 0xbc8
// Size: 0x3c
function remove_on_laststand(func, obj) {
    remove_callback(#"on_player_laststand", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x5f8b0485, Offset: 0xc10
// Size: 0x3c
function on_player_corpse(func, obj) {
    add_callback(#"on_player_corpse", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf396167, Offset: 0xc58
// Size: 0x3c
function function_930e5d42(func, obj) {
    add_callback(#"hash_781399e15b138a4e", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb4149076, Offset: 0xca0
// Size: 0x3c
function on_weapon_change(func, obj) {
    self add_entity_callback(#"weapon_change", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3368201, Offset: 0xce8
// Size: 0x3c
function function_6231c19(func, obj) {
    add_callback(#"weapon_change", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xed3915ca, Offset: 0xd30
// Size: 0x3c
function function_17381fe(func, obj) {
    self add_entity_callback(#"hash_12ca6e8bf50f11f5", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x2a3fc3a0, Offset: 0xd78
// Size: 0x3c
function on_deleted(func, obj) {
    add_callback(#"on_entity_deleted", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0xd053f2a7, Offset: 0xdc0
// Size: 0x3c
function remove_on_deleted(func, obj) {
    remove_callback(#"on_entity_deleted", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb2a36636, Offset: 0xe08
// Size: 0x3c
function on_shutdown(func, obj) {
    add_entity_callback(#"on_entity_shutdown", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x54dd6396, Offset: 0xe50
// Size: 0x3c
function on_start_gametype(func, obj) {
    add_callback(#"on_start_gametype", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xba60719a, Offset: 0xe98
// Size: 0x3c
function on_end_game(func, obj) {
    add_callback(#"on_end_game", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x10a71a9, Offset: 0xee0
// Size: 0x3c
function remove_on_end_game(func, obj) {
    remove_callback(#"on_end_game", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc3bf41a0, Offset: 0xf28
// Size: 0x3c
function on_killcam_begin(func, obj) {
    add_callback(#"killcam_begin", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x4ac1d2b9, Offset: 0xf70
// Size: 0x3c
function on_killcam_end(func, obj) {
    add_callback(#"killcam_end", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x3f39f469, Offset: 0xfb8
// Size: 0x3c
function on_melee(func, obj) {
    add_callback(#"melee", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x9414e5c5, Offset: 0x1000
// Size: 0x3c
function on_trigger(func, obj) {
    add_entity_callback(#"on_trigger", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x9385b436, Offset: 0x1048
// Size: 0x3c
function remove_on_trigger(func, obj) {
    function_52ac9652(#"on_trigger", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x1f05e6fb, Offset: 0x1090
// Size: 0x3c
function on_trigger_once(func, obj) {
    add_entity_callback(#"on_trigger_once", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x54d46e4, Offset: 0x10d8
// Size: 0x3c
function remove_on_trigger_once(func, obj) {
    function_52ac9652(#"on_trigger_once", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x878f66c5, Offset: 0x1120
// Size: 0x3c
function on_death(func, obj) {
    add_callback(#"death", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x266e9880, Offset: 0x1168
// Size: 0x3c
function remove_on_death(func, obj) {
    remove_callback(#"death", func, obj);
}

// Namespace callback/level_preinit
// Params 1, eflags: 0x40
// Checksum 0x641d011a, Offset: 0x11b0
// Size: 0x3c
function event_handler[level_preinit] codecallback_preinitialization(eventstruct) {
    callback(#"on_pre_initialization");
    system::run_pre_systems();
}

// Namespace callback/level_finalizeinit
// Params 1, eflags: 0x40
// Checksum 0xf891bcd8, Offset: 0x11f8
// Size: 0x3c
function event_handler[level_finalizeinit] codecallback_finalizeinitialization(eventstruct) {
    system::run_post_systems();
    callback(#"on_finalize_initialization");
}

// Namespace callback/systemstatechange
// Params 1, eflags: 0x40
// Checksum 0x29169ed9, Offset: 0x1240
// Size: 0x134
function event_handler[systemstatechange] codecallback_statechange(eventstruct) {
    if (!isdefined(level._systemstates)) {
        level._systemstates = [];
    }
    if (!isdefined(level._systemstates[eventstruct.system])) {
        level._systemstates[eventstruct.system] = spawnstruct();
    }
    level._systemstates[eventstruct.system].state = eventstruct.state;
    if (isdefined(level._systemstates[eventstruct.system].callback)) {
        [[ level._systemstates[eventstruct.system].callback ]](eventstruct.localclientnum, eventstruct.state);
    } else {
        /#
            println("<unknown string>" + eventstruct.system + "<unknown string>");
        #/
    }
}

// Namespace callback/maprestart
// Params 1, eflags: 0x40
// Checksum 0x22e0ece7, Offset: 0x1380
// Size: 0x5c
function event_handler[maprestart] codecallback_maprestart(eventstruct) {
    /#
        println("<unknown string>");
    #/
    util::waitforclient(0);
    level thread util::init_utility();
}

// Namespace callback/localclient_connect
// Params 1, eflags: 0x40
// Checksum 0x5d885679, Offset: 0x13e8
// Size: 0x54
function event_handler[localclient_connect] codecallback_localclientconnect(eventstruct) {
    /#
        println("<unknown string>" + eventstruct.localclientnum);
    #/
    [[ level.callbacklocalclientconnect ]](eventstruct.localclientnum);
}

// Namespace callback/glass_smash
// Params 1, eflags: 0x40
// Checksum 0x570d0071, Offset: 0x1448
// Size: 0x2c
function event_handler[glass_smash] codecallback_glasssmash(eventstruct) {
    /#
        println("<unknown string>");
    #/
}

// Namespace callback/sound_setambientstate
// Params 1, eflags: 0x40
// Checksum 0x1d5c13e3, Offset: 0x1480
// Size: 0x54
function event_handler[sound_setambientstate] codecallback_soundsetambientstate(eventstruct) {
    audio::setcurrentambientstate(eventstruct.ambientroom, eventstruct.ambientpackage, eventstruct.roomcollider, eventstruct.packagecollider, eventstruct.is_defaultroom);
}

// Namespace callback/sound_setaiambientstate
// Params 1, eflags: 0x40
// Checksum 0x884f61e6, Offset: 0x14e0
// Size: 0xc
function event_handler[sound_setaiambientstate] codecallback_soundsetaiambientstate(eventstruct) {
    
}

// Namespace callback/event_10eed35b
// Params 1, eflags: 0x40
// Checksum 0x37e2d8fb, Offset: 0x14f8
// Size: 0x50
function event_handler[event_10eed35b] function_d3771684(eventstruct) {
    if (!isdefined(level.var_44e74ef4)) {
        return;
    }
    /#
        println("<unknown string>");
    #/
    thread [[ level.var_44e74ef4 ]](eventstruct);
}

// Namespace callback/sound_playuidecodeloop
// Params 1, eflags: 0x40
// Checksum 0x5baf923f, Offset: 0x1550
// Size: 0x34
function event_handler[sound_playuidecodeloop] codecallback_soundplayuidecodeloop(eventstruct) {
    self thread audio::soundplayuidecodeloop(eventstruct.decode_string, eventstruct.play_time_ms);
}

// Namespace callback/player_spawned
// Params 1, eflags: 0x40
// Checksum 0xd12bb53b, Offset: 0x1590
// Size: 0x24
function event_handler[player_spawned] codecallback_playerspawned(eventstruct) {
    [[ level.callbackplayerspawned ]](eventstruct.localclientnum);
}

// Namespace callback/player_laststand
// Params 1, eflags: 0x40
// Checksum 0x7640cc12, Offset: 0x15c0
// Size: 0x24
function event_handler[player_laststand] codecallback_playerlaststand(eventstruct) {
    [[ level.callbackplayerlaststand ]](eventstruct.localclientnum);
}

// Namespace callback/event_d6f9e6ad
// Params 1, eflags: 0x40
// Checksum 0xe5005f9e, Offset: 0x15f0
// Size: 0x54
function event_handler[event_d6f9e6ad] function_c1d1f779(eventstruct) {
    if (!isdefined(level.var_c3e66138)) {
        return;
    }
    /#
        println("<unknown string>");
    #/
    thread [[ level.var_c3e66138 ]](eventstruct.var_428d0be2);
}

// Namespace callback/event_e469e10d
// Params 1, eflags: 0x40
// Checksum 0x68ac9c32, Offset: 0x1650
// Size: 0x34
function event_handler[event_e469e10d] function_cfcbacb1(eventstruct) {
    if (isdefined(level.var_beec2b1)) {
        [[ level.var_beec2b1 ]](eventstruct.localclientnum);
    }
}

// Namespace callback/event_dd67c1a8
// Params 1, eflags: 0x40
// Checksum 0x1efc8668, Offset: 0x1690
// Size: 0x44
function event_handler[event_dd67c1a8] function_46c0443b(eventstruct) {
    if (isdefined(level.var_c442de72)) {
        [[ level.var_c442de72 ]](self, eventstruct.localclientnum, eventstruct.weapon);
    }
}

// Namespace callback/entity_gibevent
// Params 1, eflags: 0x40
// Checksum 0xa1b1b408, Offset: 0x16e0
// Size: 0x50
function event_handler[entity_gibevent] codecallback_gibevent(eventstruct) {
    if (isdefined(level._gibeventcbfunc)) {
        self thread [[ level._gibeventcbfunc ]](eventstruct.localclientnum, eventstruct.type, eventstruct.locations);
    }
}

// Namespace callback/gametype_precache
// Params 1, eflags: 0x40
// Checksum 0x94a9c0f8, Offset: 0x1738
// Size: 0x2c
function event_handler[gametype_precache] codecallback_precachegametype(eventstruct) {
    if (isdefined(level.callbackprecachegametype)) {
        [[ level.callbackprecachegametype ]]();
    }
}

// Namespace callback/gametype_start
// Params 1, eflags: 0x40
// Checksum 0x1cc5253f, Offset: 0x1770
// Size: 0x5e
function event_handler[gametype_start] codecallback_startgametype(eventstruct) {
    if (isdefined(level.callbackstartgametype) && (!isdefined(level.gametypestarted) || !level.gametypestarted)) {
        [[ level.callbackstartgametype ]]();
        level.gametypestarted = 1;
    }
}

// Namespace callback/entity_spawned
// Params 1, eflags: 0x40
// Checksum 0xcd7589d8, Offset: 0x17d8
// Size: 0x24
function event_handler[entity_spawned] codecallback_entityspawned(eventstruct) {
    [[ level.callbackentityspawned ]](eventstruct.localclientnum);
}

// Namespace callback/enter_vehicle
// Params 1, eflags: 0x40
// Checksum 0xb4f911af, Offset: 0x1808
// Size: 0xac
function event_handler[enter_vehicle] codecallback_entervehicle(eventstruct) {
    if (isplayer(self)) {
        if (isdefined(level.var_69b47c50)) {
            self [[ level.var_69b47c50 ]](eventstruct.localclientnum, eventstruct.vehicle);
        }
    } else if (self isvehicle()) {
        if (isdefined(level.var_93b40f07)) {
            self [[ level.var_93b40f07 ]](eventstruct.localclientnum, eventstruct.player);
        }
    }
}

// Namespace callback/exit_vehicle
// Params 1, eflags: 0x40
// Checksum 0x3fdc7614, Offset: 0x18c0
// Size: 0xac
function event_handler[exit_vehicle] codecallback_exitvehicle(eventstruct) {
    if (isplayer(self)) {
        if (isdefined(level.var_db2ec524)) {
            self [[ level.var_db2ec524 ]](eventstruct.localclientnum, eventstruct.vehicle);
        }
    } else if (self isvehicle()) {
        if (isdefined(level.var_d4d60480)) {
            self [[ level.var_d4d60480 ]](eventstruct.localclientnum, eventstruct.player);
        }
    }
}

// Namespace callback/sound_notify
// Params 1, eflags: 0x40
// Checksum 0xf79b1840, Offset: 0x1978
// Size: 0x92
function event_handler[sound_notify] codecallback_soundnotify(eventstruct) {
    switch (eventstruct.notetrack) {
    case #"scr_bomb_beep":
        if (getgametypesetting(#"silentplant") == 0) {
            self playsound(eventstruct.localclientnum, #"fly_bomb_buttons_npc");
        }
        break;
    }
}

// Namespace callback/entity_shutdown
// Params 1, eflags: 0x40
// Checksum 0x4f13a14d, Offset: 0x1a18
// Size: 0x74
function event_handler[entity_shutdown] codecallback_entityshutdown(eventstruct) {
    if (isdefined(level.callbackentityshutdown)) {
        [[ level.callbackentityshutdown ]](eventstruct.localclientnum, eventstruct.entity);
    }
    eventstruct.entity entity_callback(#"on_entity_shutdown", eventstruct.localclientnum);
}

// Namespace callback/localclient_shutdown
// Params 1, eflags: 0x40
// Checksum 0x2d656b8c, Offset: 0x1a98
// Size: 0x5c
function event_handler[localclient_shutdown] codecallback_localclientshutdown(eventstruct) {
    level.localplayers = getlocalplayers();
    eventstruct.entity callback(#"on_localclient_shutdown", eventstruct.localclientnum);
}

// Namespace callback/localclient_changed
// Params 1, eflags: 0x40
// Checksum 0x99099afe, Offset: 0x1b00
// Size: 0x26
function event_handler[localclient_changed] codecallback_localclientchanged(eventstruct) {
    level.localplayers = getlocalplayers();
}

// Namespace callback/player_airsupport
// Params 1, eflags: 0x40
// Checksum 0xfc6dc267, Offset: 0x1b30
// Size: 0xc4
function event_handler[player_airsupport] codecallback_airsupport(eventstruct) {
    if (isdefined(level.callbackairsupport)) {
        [[ level.callbackairsupport ]](eventstruct.localclientnum, eventstruct.location[0], eventstruct.location[1], eventstruct.location[2], eventstruct.type, eventstruct.yaw, eventstruct.team, eventstruct.team_faction, eventstruct.owner, eventstruct.exit_type, eventstruct.server_time, eventstruct.height);
    }
}

// Namespace callback/demosystem_jump
// Params 1, eflags: 0x40
// Checksum 0xf777d5b8, Offset: 0x1c00
// Size: 0x76
function event_handler[demosystem_jump] codecallback_demojump(eventstruct) {
    level notify(#"demo_jump", {#time:eventstruct.time});
    level notify("demo_jump" + eventstruct.localclientnum, {#time:eventstruct.time});
}

// Namespace callback/callbacks_shared
// Params 1, eflags: 0x0
// Checksum 0xc95bbf4c, Offset: 0x1c80
// Size: 0x36
function codecallback_demoplayerswitch(localclientnum) {
    level notify(#"demo_player_switch");
    level notify("demo_player_switch" + localclientnum);
}

// Namespace callback/player_switch
// Params 1, eflags: 0x40
// Checksum 0x35abbb32, Offset: 0x1cc0
// Size: 0x3e
function event_handler[player_switch] codecallback_playerswitch(eventstruct) {
    level notify(#"player_switch");
    level notify("player_switch" + eventstruct.localclientnum);
}

// Namespace callback/killcam_begin
// Params 1, eflags: 0x40
// Checksum 0x2df54b70, Offset: 0x1d08
// Size: 0x9c
function event_handler[killcam_begin] codecallback_killcambegin(eventstruct) {
    level notify(#"killcam_begin", {#time:eventstruct.time});
    level notify("killcam_begin" + eventstruct.localclientnum, {#time:eventstruct.time});
    level callback(#"killcam_begin", eventstruct);
}

// Namespace callback/killcam_end
// Params 1, eflags: 0x40
// Checksum 0x6d0ce8fd, Offset: 0x1db0
// Size: 0x9c
function event_handler[killcam_end] codecallback_killcamend(eventstruct) {
    level notify(#"killcam_end", {#time:eventstruct.time});
    level notify("killcam_end" + eventstruct.localclientnum, {#time:eventstruct.time});
    level callback(#"killcam_end", eventstruct);
}

// Namespace callback/player_corpse
// Params 1, eflags: 0x40
// Checksum 0x84cb2122, Offset: 0x1e58
// Size: 0x40
function event_handler[player_corpse] codecallback_creatingcorpse(eventstruct) {
    if (isdefined(level.callbackcreatingcorpse)) {
        [[ level.callbackcreatingcorpse ]](eventstruct.localclientnum, eventstruct.player);
    }
}

// Namespace callback/exploder_activate
// Params 1, eflags: 0x40
// Checksum 0xd13f394b, Offset: 0x1ea0
// Size: 0xcc
function event_handler[exploder_activate] codecallback_activateexploder(eventstruct) {
    if (!isdefined(level._exploder_ids)) {
        return;
    }
    exploder = undefined;
    foreach (k, v in level._exploder_ids) {
        if (v == eventstruct.exploder_id) {
            exploder = k;
            break;
        }
    }
    if (!isdefined(exploder)) {
        return;
    }
    exploder::activate_exploder(exploder);
}

// Namespace callback/exploder_deactivate
// Params 1, eflags: 0x40
// Checksum 0xf64245e1, Offset: 0x1f78
// Size: 0xcc
function event_handler[exploder_deactivate] codecallback_deactivateexploder(eventstruct) {
    if (!isdefined(level._exploder_ids)) {
        return;
    }
    exploder = undefined;
    foreach (k, v in level._exploder_ids) {
        if (v == eventstruct.exploder_id) {
            exploder = k;
            break;
        }
    }
    if (!isdefined(exploder)) {
        return;
    }
    exploder::stop_exploder(exploder);
}

// Namespace callback/sound_chargeshotweaponnotify
// Params 1, eflags: 0x40
// Checksum 0xa5174ea1, Offset: 0x2050
// Size: 0x50
function event_handler[sound_chargeshotweaponnotify] codecallback_chargeshotweaponsoundnotify(eventstruct) {
    if (isdefined(level.sndchargeshot_func)) {
        self [[ level.sndchargeshot_func ]](eventstruct.localclientnum, eventstruct.weapon, eventstruct.chargeshotlevel);
    }
}

// Namespace callback/hostmigration
// Params 1, eflags: 0x40
// Checksum 0x9d770ecf, Offset: 0x20a8
// Size: 0x54
function event_handler[hostmigration] codecallback_hostmigration(eventstruct) {
    /#
        println("<unknown string>");
    #/
    if (isdefined(level.callbackhostmigration)) {
        [[ level.callbackhostmigration ]](eventstruct.localclientnum);
    }
}

// Namespace callback/entity_footstep
// Params 1, eflags: 0x40
// Checksum 0x8cb22230, Offset: 0x2108
// Size: 0x54
function event_handler[entity_footstep] codecallback_playaifootstep(eventstruct) {
    [[ level.callbackplayaifootstep ]](eventstruct.localclientnum, eventstruct.location, eventstruct.surface, eventstruct.notetrack, eventstruct.bone);
}

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x0
// Checksum 0x466c70d7, Offset: 0x2168
// Size: 0x48
function codecallback_clientflag(localclientnum, flag, set) {
    if (isdefined(level.callbackclientflag)) {
        [[ level.callbackclientflag ]](localclientnum, flag, set);
    }
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x1cbf10a0, Offset: 0x21b8
// Size: 0x5e
function codecallback_clientflagasval(localclientnum, val) {
    if (isdefined(level._client_flagasval_callbacks) && isdefined(level._client_flagasval_callbacks[self.type])) {
        self thread [[ level._client_flagasval_callbacks[self.type] ]](localclientnum, val);
    }
}

// Namespace callback/extracam_currentheroheadshot
// Params 1, eflags: 0x40
// Checksum 0xaae8c806, Offset: 0x2220
// Size: 0x70
function event_handler[extracam_currentheroheadshot] codecallback_extracamrendercurrentheroheadshot(eventstruct) {
    if (isdefined(level.extra_cam_render_current_hero_headshot_func_callback)) {
        [[ level.extra_cam_render_current_hero_headshot_func_callback ]](eventstruct.localclientnum, eventstruct.job_index, eventstruct.extracam_index, eventstruct.session_mode, eventstruct.character_index, eventstruct.is_defaulthero);
    }
}

// Namespace callback/event_3cbeb
// Params 1, eflags: 0x40
// Checksum 0x2e5597c, Offset: 0x2298
// Size: 0x94
function event_handler[event_3cbeb] function_327732bf(eventstruct) {
    if (isdefined(level.var_dda8e1d8)) {
        [[ level.var_dda8e1d8 ]](eventstruct.localclientnum, eventstruct.job_index, eventstruct.extracam_index, eventstruct.session_mode, eventstruct.character_index, eventstruct.outfit_index, eventstruct.item_type, eventstruct.item_index, eventstruct.is_defaultrender);
    }
}

// Namespace callback/extracam_characterheaditem
// Params 1, eflags: 0x40
// Checksum 0x5480e059, Offset: 0x2338
// Size: 0x70
function event_handler[extracam_characterheaditem] codecallback_extracamrendercharacterheaditem(eventstruct) {
    if (isdefined(level.extra_cam_render_character_head_item_func_callback)) {
        [[ level.extra_cam_render_character_head_item_func_callback ]](eventstruct.localclientnum, eventstruct.job_index, eventstruct.extracam_index, eventstruct.session_mode, eventstruct.head_index, eventstruct.is_default_render);
    }
}

// Namespace callback/extracam_genderrender
// Params 1, eflags: 0x40
// Checksum 0x1605fead, Offset: 0x23b0
// Size: 0x64
function event_handler[extracam_genderrender] codecallback_extracamrendergender(eventstruct) {
    if (isdefined(level.extra_cam_render_gender_func_callback)) {
        [[ level.extra_cam_render_gender_func_callback ]](eventstruct.localclientnum, eventstruct.job_index, eventstruct.extracam_index, eventstruct.session_mode, eventstruct.gender);
    }
}

// Namespace callback/extracam_wcpaintjobicon
// Params 1, eflags: 0x40
// Checksum 0x565df3b7, Offset: 0x2420
// Size: 0x88
function event_handler[extracam_wcpaintjobicon] codecallback_extracamrenderwcpaintjobicon(eventstruct) {
    if (isdefined(level.extra_cam_render_wc_paintjobicon_func_callback)) {
        [[ level.extra_cam_render_wc_paintjobicon_func_callback ]](eventstruct.localclientnum, eventstruct.extracam_index, eventstruct.job_index, eventstruct.weapon_options, eventstruct.weapon, eventstruct.loadout_slot, eventstruct.paintjob_slot, eventstruct.is_fileshare_preview);
    }
}

// Namespace callback/extracam_wcvarianticon
// Params 1, eflags: 0x40
// Checksum 0xbdf8b650, Offset: 0x24b0
// Size: 0x88
function event_handler[extracam_wcvarianticon] codecallback_extracamrenderwcvarianticon(eventstruct) {
    if (isdefined(level.extra_cam_render_wc_varianticon_func_callback)) {
        [[ level.extra_cam_render_wc_varianticon_func_callback ]](eventstruct.localclientnum, eventstruct.extracam_index, eventstruct.job_index, eventstruct.weapon_options, eventstruct.weapon, eventstruct.loadout_slot, eventstruct.paintjob_slot, eventstruct.is_fileshare_preview);
    }
}

// Namespace callback/collectibles_changed
// Params 1, eflags: 0x40
// Checksum 0xb43d8329, Offset: 0x2540
// Size: 0x4c
function event_handler[collectibles_changed] codecallback_collectibleschanged(eventstruct) {
    if (isdefined(level.on_collectibles_change)) {
        [[ level.on_collectibles_change ]](eventstruct.clientnum, eventstruct.collectibles, eventstruct.localclientnum);
    }
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf2510d3, Offset: 0x2598
// Size: 0x5e
function add_weapon_type(weapontype, callback) {
    if (!isdefined(level.weapon_type_callback_array)) {
        level.weapon_type_callback_array = [];
    }
    weapontype = getweapon(weapontype);
    level.weapon_type_callback_array[weapontype] = callback;
}

// Namespace callback/callbacks_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc7e58c5f, Offset: 0x2600
// Size: 0x66
function spawned_weapon_type(localclientnum) {
    weapontype = self.weapon.rootweapon;
    if (isdefined(level.weapon_type_callback_array) && isdefined(level.weapon_type_callback_array[weapontype])) {
        self thread [[ level.weapon_type_callback_array[weapontype] ]](localclientnum);
    }
}

// Namespace callback/callbacks_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x3890395d, Offset: 0x2670
// Size: 0x24
function function_cbfd8fd6(localclientnum) {
    activecamo::function_cbfd8fd6(localclientnum);
}

// Namespace callback/notetrack_callclientscript
// Params 1, eflags: 0x40
// Checksum 0xcc78fc23, Offset: 0x26a0
// Size: 0xc6
function event_handler[notetrack_callclientscript] codecallback_callclientscript(eventstruct) {
    if (!isdefined(level._animnotifyfuncs)) {
        return;
    }
    if (isdefined(level._animnotifyfuncs[eventstruct.label])) {
        if (isdefined(eventstruct.param3) && eventstruct.param3 != "") {
            self [[ level._animnotifyfuncs[eventstruct.label] ]](eventstruct.param, eventstruct.param3);
        } else {
            self [[ level._animnotifyfuncs[eventstruct.label] ]](eventstruct.param);
        }
    }
}

// Namespace callback/notetrack_callclientscriptonlevel
// Params 1, eflags: 0x40
// Checksum 0xa9629c5c, Offset: 0x2770
// Size: 0xce
function event_handler[notetrack_callclientscriptonlevel] codecallback_callclientscriptonlevel(eventstruct) {
    if (!isdefined(level._animnotifyfuncs)) {
        return;
    }
    if (isdefined(level._animnotifyfuncs[eventstruct.label])) {
        if (isdefined(eventstruct.param3) && eventstruct.param3 != "") {
            level [[ level._animnotifyfuncs[eventstruct.label] ]](eventstruct.param, eventstruct.param3);
        } else {
            level [[ level._animnotifyfuncs[eventstruct.label] ]](eventstruct.param);
        }
    }
}

// Namespace callback/event_69572c01
// Params 1, eflags: 0x40
// Checksum 0x7a5ee7e0, Offset: 0x2848
// Size: 0x174
function event_handler[event_69572c01] function_2073f6dc(eventstruct) {
    origin = self.origin;
    magnitude = float(eventstruct.magnitude);
    innerradius = float(eventstruct.innerradius);
    outerradius = float(eventstruct.outerradius);
    innerdamage = isdefined(self.var_f501d778) ? self.var_f501d778 : 50;
    outerdamage = isdefined(self.var_e14c1b5c) ? self.var_e14c1b5c : 25;
    var_a62fd3ab = isdefined(self.var_abe3f153) ? self.var_abe3f153 : 1;
    var_c1cde02b = isdefined(self.var_bd0f9401) ? self.var_bd0f9401 : 1;
    physicsexplosionsphere(eventstruct.localclientnum, origin, outerradius, innerradius, magnitude, innerdamage, outerdamage, var_a62fd3ab, var_c1cde02b);
}

// Namespace callback/scene_init
// Params 1, eflags: 0x40
// Checksum 0x390f1631, Offset: 0x29c8
// Size: 0x44
function event_handler[scene_init] codecallback_serversceneinit(eventstruct) {
    if (isdefined(level.server_scenes[eventstruct.scene_name])) {
        level thread scene::init(eventstruct.scene_name);
    }
}

// Namespace callback/scene_play
// Params 1, eflags: 0x40
// Checksum 0x64d55dae, Offset: 0x2a18
// Size: 0x5c
function event_handler[scene_play] codecallback_serversceneplay(eventstruct) {
    level thread scene_black_screen();
    if (isdefined(level.server_scenes[eventstruct.scene_name])) {
        level thread scene::play(eventstruct.scene_name);
    }
}

// Namespace callback/scene_stop
// Params 1, eflags: 0x40
// Checksum 0xc9f4ba0a, Offset: 0x2a80
// Size: 0x6c
function event_handler[scene_stop] codecallback_serverscenestop(eventstruct) {
    level thread scene_black_screen();
    if (isdefined(level.server_scenes[eventstruct.scene_name])) {
        level thread scene::stop(eventstruct.scene_name, undefined, undefined, undefined, 1);
    }
}

// Namespace callback/callbacks_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x80ec343b, Offset: 0x2af8
// Size: 0x14a
function scene_black_screen() {
    foreach (i, player in level.localplayers) {
        if (!isdefined(player.lui_black)) {
            player.lui_black = createluimenu(i, "FullScreenBlack");
            openluimenu(i, player.lui_black);
        }
    }
    waitframe(1);
    foreach (i, player in level.localplayers) {
        if (isdefined(player.lui_black)) {
            closeluimenu(i, player.lui_black);
            player.lui_black = undefined;
        }
    }
}

// Namespace callback/gadget_visionpulsereveal
// Params 1, eflags: 0x40
// Checksum 0x5a8a1205, Offset: 0x2c50
// Size: 0x4c
function event_handler[gadget_visionpulsereveal] codecallback_gadgetvisionpulse_reveal(eventstruct) {
    if (isdefined(level.gadgetvisionpulse_reveal_func)) {
        eventstruct.entity [[ level.gadgetvisionpulse_reveal_func ]](eventstruct.localclientnum, eventstruct.enable);
    }
}

// Namespace callback/callbacks_shared
// Params 5, eflags: 0x5 linked
// Checksum 0x23795cd3, Offset: 0x2ca8
// Size: 0x8c
function private fade_to_black_for_x_sec(startwait, blackscreenwait, fadeintime, fadeouttime, shadername) {
    self endon(#"disconnect");
    wait(startwait);
    self lui::screen_fade_out(fadeintime, shadername);
    wait(blackscreenwait);
    if (isdefined(self)) {
        self lui::screen_fade_in(fadeouttime, shadername);
    }
}

// Namespace callback/ui_fadeblackscreen
// Params 1, eflags: 0x40
// Checksum 0xd04b833d, Offset: 0x2d40
// Size: 0x94
function event_handler[ui_fadeblackscreen] codecallback_fadeblackscreen(eventstruct) {
    if (isdefined(self) && isplayer(self) && !isbot(self) && self function_21c0fa55()) {
        self thread fade_to_black_for_x_sec(0, eventstruct.duration, eventstruct.blend, eventstruct.blend);
    }
}

// Namespace callback/event_40f83b44
// Params 1, eflags: 0x40
// Checksum 0xa1b5158f, Offset: 0x2de0
// Size: 0x94
function event_handler[event_40f83b44] function_4b5ab05f(eventstruct) {
    if (isdefined(self) && isplayer(self) && !isbot(self) && self function_21c0fa55()) {
        self thread fade_to_black_for_x_sec(0, eventstruct.duration, eventstruct.blend_out, eventstruct.blend_in);
    }
}

// Namespace callback/event_1f757215
// Params 1, eflags: 0x40
// Checksum 0xc8d8120f, Offset: 0x2e80
// Size: 0x4c
function event_handler[event_1f757215] function_5067ee2f(eventstruct) {
    self animation::play_siege(eventstruct.anim_name, eventstruct.shot_name, eventstruct.rate, eventstruct.loop);
}

// Namespace callback/forcestreambundle
// Params 1, eflags: 0x40
// Checksum 0x6e55cac1, Offset: 0x2ed8
// Size: 0x3c
function event_handler[forcestreambundle] codecallback_forcestreambundle(eventstruct) {
    forcestreambundle(eventstruct.name, eventstruct.var_3c542760, eventstruct.var_a0e51075);
}

// Namespace callback/event_bfc28859
// Params 1, eflags: 0x40
// Checksum 0x2efd2643, Offset: 0x2f20
// Size: 0x64
function event_handler[event_bfc28859] function_582e112f(eventstruct) {
    if (isdefined(level.var_45ca79e5)) {
        [[ level.var_45ca79e5 ]](eventstruct.localclientnum, eventstruct.eventtype, eventstruct.itemid, eventstruct.value, eventstruct.value2);
    }
}

// Namespace callback/event_a5e70678
// Params 1, eflags: 0x40
// Checksum 0x2e62f8e8, Offset: 0x2f90
// Size: 0x34
function event_handler[event_a5e70678] function_11988454(eventstruct) {
    if (isdefined(level.var_a6c75fcb)) {
        [[ level.var_a6c75fcb ]](eventstruct.var_85604f16);
    }
}

// Namespace callback/trigger
// Params 1, eflags: 0x40
// Checksum 0x8844cffe, Offset: 0x2fd0
// Size: 0x7c
function event_handler[trigger] codecallback_trigger(eventstruct) {
    if (isdefined(level.var_a6c75fcb)) {
        self callback(#"on_trigger", eventstruct);
        self callback(#"on_trigger_once", eventstruct);
        self remove_on_trigger_once("all");
    }
}

// Namespace callback/freefall
// Params 1, eflags: 0x40
// Checksum 0x5f625169, Offset: 0x3058
// Size: 0x5c
function event_handler[freefall] function_5019e563(eventstruct) {
    self callback(#"freefall", eventstruct);
    self entity_callback(#"freefall", eventstruct.localclientnum, eventstruct);
}

// Namespace callback/parachute
// Params 1, eflags: 0x40
// Checksum 0x9594aa6, Offset: 0x30c0
// Size: 0x5c
function event_handler[parachute] function_87b05fa3(eventstruct) {
    self callback(#"parachute", eventstruct);
    self entity_callback(#"parachute", eventstruct.localclientnum, eventstruct);
}

// Namespace callback/death
// Params 1, eflags: 0x40
// Checksum 0x9c04a217, Offset: 0x3128
// Size: 0x4c
function event_handler[death] codecallback_death(eventstruct) {
    self callback(#"death", eventstruct);
    self entity_callback(#"death", eventstruct);
}

// Namespace callback/melee
// Params 1, eflags: 0x40
// Checksum 0xc019ddac, Offset: 0x3180
// Size: 0x2c
function event_handler[melee] codecallback_melee(eventstruct) {
    self callback(#"melee", eventstruct);
}

// Namespace callback/culled
// Params 1, eflags: 0x40
// Checksum 0x65f51bc1, Offset: 0x31b8
// Size: 0x2c
function event_handler[culled] function_667f84de(eventstruct) {
    self entity_callback(#"culled", eventstruct);
}

// Namespace callback/weapon_change
// Params 1, eflags: 0x40
// Checksum 0xa60652a6, Offset: 0x31f0
// Size: 0x6c
function event_handler[weapon_change] function_6846a2b7(eventstruct) {
    if (self function_21c0fa55()) {
        level callback(#"weapon_change", eventstruct);
    }
    self callback(#"weapon_change", eventstruct);
}

// Namespace callback/event_41480c76
// Params 1, eflags: 0x40
// Checksum 0xad15e02c, Offset: 0x3268
// Size: 0x6c
function event_handler[event_41480c76] function_c33f3471(eventstruct) {
    if (self function_21c0fa55()) {
        level callback(#"hash_4152cf6a61494581", eventstruct);
    }
    self callback(#"hash_4152cf6a61494581", eventstruct);
}

// Namespace callback/event_6e84b1b1
// Params 1, eflags: 0x40
// Checksum 0x9ecc4447, Offset: 0x32e0
// Size: 0x2c
function event_handler[event_6e84b1b1] function_ff9acfac(eventstruct) {
    level callback(#"hash_2fc4cfecaed47583", eventstruct);
}

// Namespace callback/event_eae361ae
// Params 1, eflags: 0x40
// Checksum 0x703f9d6, Offset: 0x3318
// Size: 0x7c
function event_handler[event_eae361ae] function_a1ad9b51(eventstruct) {
    if (self function_21c0fa55()) {
        level callback(#"hash_12ca6e8bf50f11f5", eventstruct.localclientnum);
    }
    self callback(#"hash_12ca6e8bf50f11f5", eventstruct.localclientnum);
}

// Namespace callback/updateactivecamo
// Params 1, eflags: 0x40
// Checksum 0xe5cbc7b0, Offset: 0x33a0
// Size: 0x3c
function event_handler[updateactivecamo] codecallback_updateactivecamo(eventstruct) {
    self callback(#"updateactivecamo", eventstruct.localclientnum, eventstruct);
}

// Namespace callback/event_ab7a7fd3
// Params 1, eflags: 0x40
// Checksum 0x37cb44b0, Offset: 0x33e8
// Size: 0x2c
function event_handler[event_ab7a7fd3] function_bc70e1e4(eventstruct) {
    self callback(#"hash_6900f4ea0ff32c3e", eventstruct);
}


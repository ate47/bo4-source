// Atian COD Tools GSC decompiler test
#include scripts/core_common/voice/voice_events.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/trigger_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/simple_hostmigration.gsc;
#include scripts/core_common/hud_shared.gsc;
#include scripts/core_common/flagsys_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace callback;

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x84569fc2, Offset: 0x128
// Size: 0x5c
function callback(event, params) {
    mpl_heatwave_fx(level, event, params);
    if (self != level) {
        mpl_heatwave_fx(self, event, params);
    }
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf0f9e0d6, Offset: 0x190
// Size: 0xb0
function function_bea20a96(event, params) {
    ais = getaiarray();
    foreach (ai in ais) {
        ai mpl_heatwave_fx(ai, event, params);
    }
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x2b792a9a, Offset: 0x248
// Size: 0xd0
function function_daed27e8(event, params) {
    mpl_heatwave_fx(level, event, params);
    players = getplayers();
    foreach (player in players) {
        player mpl_heatwave_fx(player, event, params);
    }
}

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x5 linked
// Checksum 0xcce64424, Offset: 0x320
// Size: 0x274
function private mpl_heatwave_fx(ent, event, params) {
    if (isdefined(ent) && isdefined(ent._callbacks) && isdefined(ent._callbacks[event])) {
        for (i = 0; i < ent._callbacks[event].size; i++) {
            if (!isarray(ent._callbacks[event][i])) {
                continue;
            }
            callback = ent._callbacks[event][i][0];
            /#
                /#
                    assert(isfunctionptr(callback), "<unknown string>" + "<unknown string>");
                #/
            #/
            if (!isfunctionptr(callback)) {
                return;
            }
            obj = ent._callbacks[event][i][1];
            var_47e0b77b = isdefined(ent._callbacks[event][i][2]) ? ent._callbacks[event][i][2] : [];
            if (isdefined(obj)) {
                if (isdefined(params)) {
                    util::function_cf55c866(obj, callback, self, params, var_47e0b77b);
                } else {
                    util::function_50f54b6f(obj, callback, self, var_47e0b77b);
                }
            } else if (isdefined(params)) {
                util::function_50f54b6f(self, callback, params, var_47e0b77b);
            } else {
                util::single_thread_argarray(self, callback, var_47e0b77b);
            }
        }
        arrayremovevalue(ent._callbacks[event], 0, 0);
    }
}

// Namespace callback/callbacks_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x516b037d, Offset: 0x5a0
// Size: 0x4c
function add_callback(event, func, obj, a_params) {
    function_2b653c00(level, event, func, obj, a_params);
}

// Namespace callback/callbacks_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xc030b3d5, Offset: 0x5f8
// Size: 0x44
function function_d8abfc3d(event, func, obj, a_params) {
    function_2b653c00(self, event, func, obj, a_params);
}

// Namespace callback/callbacks_shared
// Params 5, eflags: 0x5 linked
// Checksum 0xcb86b010, Offset: 0x648
// Size: 0x21c
function private function_2b653c00(ent, event, func, obj, a_params) {
    if (!isdefined(ent)) {
        return;
    }
    /#
        /#
            assert(isfunctionptr(func), "<unknown string>" + "<unknown string>");
        #/
    #/
    if (!isfunctionptr(func)) {
        return;
    }
    /#
        assert(isdefined(event), "<unknown string>");
    #/
    if (!isdefined(ent._callbacks) || !isdefined(ent._callbacks[event])) {
        ent._callbacks[event] = [];
    }
    foreach (callback in ent._callbacks[event]) {
        if (isarray(callback) && callback[0] == func) {
            if (!isdefined(obj) || callback[1] == obj) {
                return;
            }
        }
    }
    array::add(ent._callbacks[event], array(func, obj, a_params), 0);
    if (isdefined(obj)) {
        obj thread remove_callback_on_death(event, func);
    }
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xee54b94f, Offset: 0x870
// Size: 0x3c
function private function_862146b3(event, func) {
    return string(event) + string(func);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x1d643576, Offset: 0x8b8
// Size: 0x8c
function remove_callback_on_death(event, func) {
    self notify(function_862146b3(event, func));
    self endon(function_862146b3(event, func));
    self util::waittill_either("death", "remove_callbacks");
    remove_callback(event, func, self);
}

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x9959e51c, Offset: 0x950
// Size: 0x3c
function remove_callback(event, func, obj) {
    function_3f5f097e(level, event, func, obj);
}

// Namespace callback/callbacks_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x7266be6f, Offset: 0x998
// Size: 0x44
function function_52ac9652(event, func, obj, instant) {
    function_3f5f097e(self, event, func, obj, instant);
}

// Namespace callback/callbacks_shared
// Params 5, eflags: 0x5 linked
// Checksum 0x3b83e856, Offset: 0x9e8
// Size: 0x1fc
function private function_3f5f097e(ent, event, func, obj, instant) {
    if (!isdefined(ent._callbacks)) {
        return;
    }
    /#
        assert(isdefined(event), "<unknown string>");
    #/
    if (func === "all") {
        ent._callbacks[event] = [];
        return;
    }
    /#
        assert(isdefined(ent._callbacks[event]), "<unknown string>");
    #/
    if (!isdefined(ent._callbacks[event])) {
        return;
    }
    if (isdefined(instant) && instant) {
        arrayremovevalue(ent._callbacks[event], 0, 0);
        return;
    }
    foreach (index, func_group in ent._callbacks[event]) {
        if (isarray(func_group) && func_group[0] == func) {
            if (func_group[1] === obj) {
                if (isdefined(obj)) {
                    obj notify(function_862146b3(event, func));
                }
                ent._callbacks[event][index] = 0;
                break;
            }
        }
    }
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa2b45217, Offset: 0xbf0
// Size: 0x3c
function on_finalize_initialization(func, obj) {
    add_callback(#"on_finalize_initialization", func, obj);
}

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x21 linked
// Checksum 0xf89be2a2, Offset: 0xc38
// Size: 0x44
function on_connect(func, obj, ...) {
    add_callback(#"on_player_connect", func, obj, vararg);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x202fdc0f, Offset: 0xc88
// Size: 0x3c
function remove_on_connect(func, obj) {
    remove_callback(#"on_player_connect", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x49ab0659, Offset: 0xcd0
// Size: 0x3c
function on_connecting(func, obj) {
    add_callback(#"on_player_connecting", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0xf9e11d0c, Offset: 0xd18
// Size: 0x3c
function remove_on_connecting(func, obj) {
    remove_callback(#"on_player_connecting", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x86fc821d, Offset: 0xd60
// Size: 0x3c
function on_disconnect(func, obj) {
    add_callback(#"on_player_disconnect", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x40c1c88e, Offset: 0xda8
// Size: 0x3c
function remove_on_disconnect(func, obj) {
    remove_callback(#"on_player_disconnect", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xdb107381, Offset: 0xdf0
// Size: 0x3c
function on_spawned(func, obj) {
    add_callback(#"on_player_spawned", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xd70d96ec, Offset: 0xe38
// Size: 0x3c
function remove_on_spawned(func, obj) {
    remove_callback(#"on_player_spawned", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x1c26a8a7, Offset: 0xe80
// Size: 0x3c
function remove_on_revived(func, obj) {
    remove_callback(#"on_player_revived", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x51026241, Offset: 0xec8
// Size: 0x3c
function on_deleted(func, obj) {
    add_callback(#"on_entity_deleted", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x67bdefc3, Offset: 0xf10
// Size: 0x3c
function remove_on_deleted(func, obj) {
    remove_callback(#"on_entity_deleted", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x63cd15d, Offset: 0xf58
// Size: 0x3c
function on_loadout(func, obj) {
    add_callback(#"on_loadout", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb96cc40d, Offset: 0xfa0
// Size: 0x3c
function remove_on_loadout(func, obj) {
    remove_callback(#"on_loadout", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xbc5f2011, Offset: 0xfe8
// Size: 0x3c
function on_player_damage(func, obj) {
    add_callback(#"on_player_damage", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb88346ca, Offset: 0x1030
// Size: 0x3c
function remove_on_player_damage(func, obj) {
    remove_callback(#"on_player_damage", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x2a988e1a, Offset: 0x1078
// Size: 0x3c
function on_start_gametype(func, obj) {
    add_callback(#"on_start_gametype", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xd6f4272, Offset: 0x10c0
// Size: 0x3c
function on_end_game(func, obj) {
    add_callback(#"on_end_game", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc6261666, Offset: 0x1108
// Size: 0x3c
function function_14dae612(func, obj) {
    add_callback(#"hash_1b5be9017cd4b5fa", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x43b76ad6, Offset: 0x1150
// Size: 0x3c
function on_game_playing(func, obj) {
    add_callback(#"on_game_playing", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa868744, Offset: 0x1198
// Size: 0x3c
function on_joined_team(func, obj) {
    add_callback(#"joined_team", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xdc8ac6d, Offset: 0x11e0
// Size: 0x3c
function on_joined_spectate(func, obj) {
    add_callback(#"on_joined_spectate", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x32350ef, Offset: 0x1228
// Size: 0x3c
function on_player_killed(func, obj) {
    add_callback(#"on_player_killed", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xbeb0e916, Offset: 0x1270
// Size: 0x3c
function on_player_killed_with_params(func, obj) {
    add_callback(#"on_player_killed_with_params", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xbc7328fc, Offset: 0x12b8
// Size: 0x3c
function on_player_corpse(func, obj) {
    add_callback(#"on_player_corpse", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0xf0bd5f6, Offset: 0x1300
// Size: 0x3c
function remove_on_player_killed(func, obj) {
    remove_callback(#"on_player_killed", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x601c160e, Offset: 0x1348
// Size: 0x3c
function remove_on_player_killed_with_params(func, obj) {
    remove_callback(#"on_player_killed_with_params", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x9ded72ff, Offset: 0x1390
// Size: 0x3c
function function_80270643(func, obj) {
    add_callback(#"on_team_eliminated", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0xfa9cd0f1, Offset: 0x13d8
// Size: 0x3c
function function_c53a8ab8(func, obj) {
    remove_callback(#"on_team_eliminated", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x17a981e7, Offset: 0x1420
// Size: 0x3c
function on_ai_killed(func, obj) {
    add_callback(#"on_ai_killed", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf5c52487, Offset: 0x1468
// Size: 0x3c
function remove_on_ai_killed(func, obj) {
    remove_callback(#"on_ai_killed", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x477bad34, Offset: 0x14b0
// Size: 0x3c
function on_actor_killed(func, obj) {
    add_callback(#"on_actor_killed", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x888fc6e1, Offset: 0x14f8
// Size: 0x3c
function remove_on_actor_killed(func, obj) {
    remove_callback(#"on_actor_killed", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb38d0b55, Offset: 0x1540
// Size: 0x3c
function on_vehicle_spawned(func, obj) {
    add_callback(#"on_vehicle_spawned", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x59eef38, Offset: 0x1588
// Size: 0x3c
function remove_on_vehicle_spawned(func, obj) {
    remove_callback(#"on_vehicle_spawned", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa5ae4be8, Offset: 0x15d0
// Size: 0x3c
function on_vehicle_killed(func, obj) {
    add_callback(#"on_vehicle_killed", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x5af19c5f, Offset: 0x1618
// Size: 0x3c
function on_vehicle_collision(func, obj) {
    function_d8abfc3d(#"veh_collision", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x2687d486, Offset: 0x1660
// Size: 0x3c
function remove_on_vehicle_killed(func, obj) {
    remove_callback(#"on_vehicle_killed", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa3674d7, Offset: 0x16a8
// Size: 0x3c
function on_ai_damage(func, obj) {
    add_callback(#"on_ai_damage", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x87e496af, Offset: 0x16f0
// Size: 0x3c
function remove_on_ai_damage(func, obj) {
    remove_callback(#"on_ai_damage", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xcb569f75, Offset: 0x1738
// Size: 0x3c
function on_ai_spawned(func, obj) {
    add_callback(#"on_ai_spawned", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x2cfa1cdc, Offset: 0x1780
// Size: 0x3c
function remove_on_ai_spawned(func, obj) {
    remove_callback(#"on_ai_spawned", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x86f92b65, Offset: 0x17c8
// Size: 0x3c
function on_actor_damage(func, obj) {
    add_callback(#"on_actor_damage", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x437b455c, Offset: 0x1810
// Size: 0x3c
function remove_on_actor_damage(func, obj) {
    remove_callback(#"on_actor_damage", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x3cdc138b, Offset: 0x1858
// Size: 0x3c
function function_9d78f548(func, obj) {
    add_callback(#"hash_2e68909d4e4ed889", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x6ac669df, Offset: 0x18a0
// Size: 0x3c
function function_f125b93a(func, obj) {
    remove_callback(#"hash_2e68909d4e4ed889", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xadf1f59a, Offset: 0x18e8
// Size: 0x3c
function on_vehicle_damage(func, obj) {
    add_callback(#"on_vehicle_damage", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x51a076cc, Offset: 0x1930
// Size: 0x3c
function remove_on_vehicle_damage(func, obj) {
    remove_callback(#"on_vehicle_damage", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x454ac3ad, Offset: 0x1978
// Size: 0x3c
function on_downed(func, obj) {
    add_callback(#"on_player_downed", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x4390435, Offset: 0x19c0
// Size: 0x3c
function remove_on_downed(func, obj) {
    remove_callback(#"on_player_downed", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe74c576d, Offset: 0x1a08
// Size: 0x3c
function on_laststand(func, obj) {
    add_callback(#"on_player_laststand", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3d1933d7, Offset: 0x1a50
// Size: 0x3c
function remove_on_laststand(func, obj) {
    remove_callback(#"on_player_laststand", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xd6a8a085, Offset: 0x1a98
// Size: 0x3c
function on_bleedout(func, obj) {
    add_callback(#"on_player_bleedout", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3ffbb095, Offset: 0x1ae0
// Size: 0x3c
function on_revived(func, obj) {
    add_callback(#"on_player_revived", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0xe314f14, Offset: 0x1b28
// Size: 0x3c
function on_mission_failed(func, obj) {
    add_callback(#"on_mission_failed", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf40d52c4, Offset: 0x1b70
// Size: 0x3c
function on_challenge_complete(func, obj) {
    add_callback(#"on_challenge_complete", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3ed583ea, Offset: 0x1bb8
// Size: 0x3c
function on_weapon_change(func, obj) {
    add_callback(#"weapon_change", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb325b099, Offset: 0x1c00
// Size: 0x3c
function remove_on_weapon_change(func, obj) {
    remove_callback(#"weapon_change", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xee4e1d97, Offset: 0x1c48
// Size: 0x3c
function on_weapon_fired(func, obj) {
    add_callback(#"weapon_fired", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x8e15fe5a, Offset: 0x1c90
// Size: 0x3c
function remove_on_weapon_fired(func, obj) {
    remove_callback(#"weapon_fired", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x8ea2a6d9, Offset: 0x1cd8
// Size: 0x3c
function on_grenade_fired(func, obj) {
    add_callback(#"grenade_fired", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x21318271, Offset: 0x1d20
// Size: 0x3c
function remove_on_grenade_fired(func, obj) {
    remove_callback(#"grenade_fired", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe4fef738, Offset: 0x1d68
// Size: 0x3c
function on_offhand_fire(func, obj) {
    add_callback(#"offhand_fire", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x44a90068, Offset: 0x1db0
// Size: 0x3c
function remove_on_offhand_fire(func, obj) {
    remove_callback(#"offhand_fire", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xfbf1a71a, Offset: 0x1df8
// Size: 0x3c
function function_4b7977fe(func, obj) {
    add_callback(#"hash_198a389d6b65f68d", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0xc315505c, Offset: 0x1e40
// Size: 0x3c
function function_61583a71(func, obj) {
    remove_callback(#"hash_198a389d6b65f68d", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb80c13e5, Offset: 0x1e88
// Size: 0x3c
function on_detonate(func, obj) {
    function_d8abfc3d(#"detonate", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0xbd40b1e5, Offset: 0x1ed0
// Size: 0x3c
function remove_on_detonate(func, obj) {
    function_52ac9652(#"detonate", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb772467a, Offset: 0x1f18
// Size: 0x3c
function on_double_tap_detonate(func, obj) {
    function_d8abfc3d(#"doubletap_detonate", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x2fc056b4, Offset: 0x1f60
// Size: 0x3c
function remove_on_double_tap_detonate(func, obj) {
    function_52ac9652(#"doubletap_detonate", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe537229b, Offset: 0x1fa8
// Size: 0x3c
function on_death(func, obj) {
    function_d8abfc3d(#"death", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x6be04e4d, Offset: 0x1ff0
// Size: 0x3c
function remove_on_death(func, obj) {
    function_52ac9652(#"death", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x2e2fb659, Offset: 0x2038
// Size: 0x3c
function function_27d9ab8(func, obj) {
    add_callback(#"hash_1e4a4ca774f4ce22", func, obj);
}

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x21 linked
// Checksum 0xad8ddd2f, Offset: 0x2080
// Size: 0x44
function on_trigger(func, obj, ...) {
    function_d8abfc3d(#"on_trigger", func, obj, vararg);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0xe0034cc6, Offset: 0x20d0
// Size: 0x3c
function remove_on_trigger(func, obj) {
    function_52ac9652(#"on_trigger", func, obj);
}

// Namespace callback/callbacks_shared
// Params 3, eflags: 0x21 linked
// Checksum 0xfaa7acc, Offset: 0x2118
// Size: 0x44
function on_trigger_once(func, obj, ...) {
    function_d8abfc3d(#"on_trigger_once", func, obj, vararg);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xacdac15, Offset: 0x2168
// Size: 0x3c
function remove_on_trigger_once(func, obj) {
    function_52ac9652(#"on_trigger_once", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x9229cd7b, Offset: 0x21b0
// Size: 0x3c
function function_33f0ddd3(func, obj) {
    add_callback(#"hash_39bf72fd97e248a0", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x995ace6c, Offset: 0x21f8
// Size: 0x3c
function function_824d206(func, obj) {
    remove_callback(#"hash_39bf72fd97e248a0", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x8f34252e, Offset: 0x2240
// Size: 0x3c
function on_boast(func, obj) {
    add_callback(#"on_boast", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0xfc4c89e7, Offset: 0x2288
// Size: 0x3c
function remove_on_boast(func, obj) {
    remove_callback(#"on_boast", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x22cae9ff, Offset: 0x22d0
// Size: 0x3c
function function_5753ac6e(func, obj) {
    add_callback(#"hash_4a9c56bba76da754", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x3772da9c, Offset: 0x2318
// Size: 0x3c
function function_16046baa(func, obj) {
    remove_callback(#"hash_4a9c56bba76da754", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x8576071b, Offset: 0x2360
// Size: 0x3c
function on_menu_response(func, obj) {
    add_callback(#"on_menu_response", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x1b6691d0, Offset: 0x23a8
// Size: 0x3c
function on_item_pickup(func, obj) {
    add_callback(#"on_item_pickup", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc70847ed, Offset: 0x23f0
// Size: 0x3c
function on_item_drop(func, obj) {
    add_callback(#"on_drop_item", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x475d4d10, Offset: 0x2438
// Size: 0x3c
function on_drop_inventory(func, obj) {
    add_callback(#"on_drop_inventory", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa80b4b56, Offset: 0x2480
// Size: 0x3c
function on_item_use(func, obj) {
    add_callback(#"on_item_use", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x4dfd68bb, Offset: 0x24c8
// Size: 0x3c
function on_stash_open(func, obj) {
    add_callback(#"on_stash_open", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3f88fe8e, Offset: 0x2510
// Size: 0x3c
function on_character_unlock(func, obj) {
    add_callback(#"on_character_unlock", func, obj);
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa84a0571, Offset: 0x2558
// Size: 0x3c
function on_contract_complete(func, obj) {
    add_callback(#"contract_complete", func, obj);
}

// Namespace callback/level_preinit
// Params 1, eflags: 0x40
// Checksum 0x1073802e, Offset: 0x25a0
// Size: 0x3c
function event_handler[level_preinit] codecallback_preinitialization(eventstruct) {
    callback(#"on_pre_initialization");
    system::run_pre_systems();
}

// Namespace callback/level_finalizeinit
// Params 1, eflags: 0x40
// Checksum 0xfa2ccc8a, Offset: 0x25e8
// Size: 0x3c
function event_handler[level_finalizeinit] codecallback_finalizeinitialization(eventstruct) {
    system::run_post_systems();
    callback(#"on_finalize_initialization");
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x8e7f1694, Offset: 0x2630
// Size: 0x4a
function add_weapon_damage(weapontype, callback) {
    if (!isdefined(level.weapon_damage_callback_array)) {
        level.weapon_damage_callback_array = [];
    }
    level.weapon_damage_callback_array[weapontype] = callback;
}

// Namespace callback/callbacks_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x90c9d5e0, Offset: 0x2688
// Size: 0xda
function callback_weapon_damage(eattacker, einflictor, weapon, meansofdeath, damage) {
    if (isdefined(level.weapon_damage_callback_array)) {
        if (isdefined(level.weapon_damage_callback_array[weapon])) {
            self thread [[ level.weapon_damage_callback_array[weapon] ]](eattacker, einflictor, weapon, meansofdeath, damage);
            return 1;
        } else if (isdefined(level.weapon_damage_callback_array[weapon.rootweapon])) {
            self thread [[ level.weapon_damage_callback_array[weapon.rootweapon] ]](eattacker, einflictor, weapon, meansofdeath, damage);
            return 1;
        }
    }
    return 0;
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x95a05da1, Offset: 0x2770
// Size: 0x4a
function add_weapon_fired(weapon, callback) {
    if (!isdefined(level.var_129c2069)) {
        level.var_129c2069 = [];
    }
    level.var_129c2069[weapon] = callback;
}

// Namespace callback/callbacks_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x3a6c7e69, Offset: 0x27c8
// Size: 0xa2
function callback_weapon_fired(weapon) {
    if (isdefined(weapon) && isdefined(level.var_129c2069)) {
        if (isdefined(level.var_129c2069[weapon])) {
            self thread [[ level.var_129c2069[weapon] ]](weapon);
            return 1;
        } else if (isdefined(level.var_129c2069[weapon.rootweapon])) {
            self thread [[ level.var_129c2069[weapon.rootweapon] ]](weapon);
            return 1;
        }
    }
    return 0;
}

// Namespace callback/gametype_start
// Params 1, eflags: 0x40
// Checksum 0xf0291f72, Offset: 0x2878
// Size: 0x4e
function event_handler[gametype_start] codecallback_startgametype(eventstruct) {
    if (!isdefined(level.gametypestarted) || !level.gametypestarted) {
        [[ level.callbackstartgametype ]]();
        level.gametypestarted = 1;
    }
}

// Namespace callback/player_connect
// Params 1, eflags: 0x40
// Checksum 0xbdcb6da4, Offset: 0x28d0
// Size: 0x30
function event_handler[player_connect] codecallback_playerconnect(eventstruct) {
    self endon(#"disconnect");
    [[ level.callbackplayerconnect ]]();
}

// Namespace callback/player_disconnect
// Params 1, eflags: 0x40
// Checksum 0x949ede02, Offset: 0x2908
// Size: 0x8c
function event_handler[player_disconnect] codecallback_playerdisconnect(eventstruct) {
    self notify(#"death");
    self.player_disconnected = 1;
    self notify(#"disconnect");
    level notify(#"disconnect", self);
    [[ level.callbackplayerdisconnect ]]();
    callback(#"on_player_disconnect");
}

// Namespace callback/hostmigration_setupgametype
// Params 0, eflags: 0x40
// Checksum 0xd1fa637f, Offset: 0x29a0
// Size: 0x34
function event_handler[hostmigration_setupgametype] codecallback_migration_setupgametype() {
    /#
        println("<unknown string>");
    #/
    simple_hostmigration::migration_setupgametype();
}

// Namespace callback/hostmigration
// Params 1, eflags: 0x40
// Checksum 0x79f45823, Offset: 0x29e0
// Size: 0x3c
function event_handler[hostmigration] codecallback_hostmigration(eventstruct) {
    /#
        println("<unknown string>");
    #/
    [[ level.callbackhostmigration ]]();
}

// Namespace callback/hostmigration_save
// Params 1, eflags: 0x40
// Checksum 0xe574ed37, Offset: 0x2a28
// Size: 0x3c
function event_handler[hostmigration_save] codecallback_hostmigrationsave(eventstruct) {
    /#
        println("<unknown string>");
    #/
    [[ level.callbackhostmigrationsave ]]();
}

// Namespace callback/hostmigration_premigrationsave
// Params 1, eflags: 0x40
// Checksum 0x96b466d8, Offset: 0x2a70
// Size: 0x3c
function event_handler[hostmigration_premigrationsave] codecallback_prehostmigrationsave(eventstruct) {
    /#
        println("<unknown string>");
    #/
    [[ level.callbackprehostmigrationsave ]]();
}

// Namespace callback/hostmigration_playermigrated
// Params 1, eflags: 0x40
// Checksum 0xa089ccb2, Offset: 0x2ab8
// Size: 0x3c
function event_handler[hostmigration_playermigrated] codecallback_playermigrated(eventstruct) {
    /#
        println("<unknown string>");
    #/
    [[ level.callbackplayermigrated ]]();
}

// Namespace callback/player_damage
// Params 1, eflags: 0x40
// Checksum 0x92e884bd, Offset: 0x2b00
// Size: 0xc8
function event_handler[player_damage] codecallback_playerdamage(eventstruct) {
    self endon(#"disconnect");
    [[ level.callbackplayerdamage ]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.flags, eventstruct.mod, eventstruct.weapon, eventstruct.position, eventstruct.direction, eventstruct.hit_location, eventstruct.damage_origin, eventstruct.time_offset, eventstruct.bone_index, eventstruct.normal);
}

// Namespace callback/player_killed
// Params 1, eflags: 0x40
// Checksum 0x7354f8ef, Offset: 0x2bd0
// Size: 0x98
function event_handler[player_killed] codecallback_playerkilled(eventstruct) {
    self endon(#"disconnect");
    [[ level.callbackplayerkilled ]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.mod, eventstruct.weapon, eventstruct.direction, eventstruct.hit_location, eventstruct.time_offset, eventstruct.death_anim_duration);
}

// Namespace callback/event_2958ea55
// Params 1, eflags: 0x40
// Checksum 0x6a44544a, Offset: 0x2c70
// Size: 0x78
function event_handler[event_2958ea55] function_73e8e3f9(eventstruct) {
    self endon(#"disconnect");
    if (isdefined(level.var_3a9881cb)) {
        [[ level.var_3a9881cb ]](eventstruct.attacker, eventstruct.effect_name, eventstruct.var_894859a2, eventstruct.var_ab5b905e, eventstruct.weapon);
    }
}

// Namespace callback/event_a98a54a7
// Params 1, eflags: 0x40
// Checksum 0x7cf95e65, Offset: 0x2cf0
// Size: 0x38
function event_handler[event_a98a54a7] function_323548ba(eventstruct) {
    self endon(#"disconnect");
    [[ level.callbackplayershielddamageblocked ]](eventstruct.damage);
}

// Namespace callback/player_laststand
// Params 1, eflags: 0x40
// Checksum 0xcc25887a, Offset: 0x2d30
// Size: 0xac
function event_handler[player_laststand] codecallback_playerlaststand(eventstruct) {
    self endon(#"disconnect");
    self stopanimscripted();
    [[ level.callbackplayerlaststand ]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.mod, eventstruct.weapon, eventstruct.direction, eventstruct.hit_location, eventstruct.time_offset, eventstruct.delay);
}

// Namespace callback/event_dd67c1a8
// Params 1, eflags: 0x40
// Checksum 0x199e784f, Offset: 0x2de8
// Size: 0x38
function event_handler[event_dd67c1a8] function_46c0443b(eventstruct) {
    self endon(#"disconnect");
    [[ level.var_69959686 ]](eventstruct.weapon);
}

// Namespace callback/event_1294e3a7
// Params 1, eflags: 0x40
// Checksum 0x6db8e9de, Offset: 0x2e28
// Size: 0x48
function event_handler[event_1294e3a7] function_9e4c68e2(eventstruct) {
    self endon(#"disconnect");
    if (isdefined(level.var_bb1ea3f1)) {
        [[ level.var_bb1ea3f1 ]](eventstruct.weapon);
    }
}

// Namespace callback/event_eb7e11e4
// Params 1, eflags: 0x40
// Checksum 0x9abded37, Offset: 0x2e78
// Size: 0x48
function event_handler[event_eb7e11e4] function_2f677e9d(eventstruct) {
    self endon(#"disconnect");
    if (isdefined(level.var_2f64d35)) {
        [[ level.var_2f64d35 ]](eventstruct.weapon);
    }
}

// Namespace callback/event_bf57d5bb
// Params 1, eflags: 0x40
// Checksum 0xb9a743f3, Offset: 0x2ec8
// Size: 0x48
function event_handler[event_bf57d5bb] function_d7eb3672(eventstruct) {
    self endon(#"disconnect");
    if (isdefined(level.var_a28be0a5)) {
        [[ level.var_a28be0a5 ]](eventstruct.weapon);
    }
}

// Namespace callback/event_e9b4bb47
// Params 1, eflags: 0x40
// Checksum 0x9a480b36, Offset: 0x2f18
// Size: 0x48
function event_handler[event_e9b4bb47] function_7dba9a1(eventstruct) {
    self endon(#"disconnect");
    if (isdefined(level.var_bd0b5fc1)) {
        [[ level.var_bd0b5fc1 ]](eventstruct.weapon);
    }
}

// Namespace callback/event_9a0e3f85
// Params 1, eflags: 0x40
// Checksum 0x261a9ab8, Offset: 0x2f68
// Size: 0x74
function event_handler[event_9a0e3f85] function_3b159f77(eventstruct) {
    self endon(#"disconnect");
    if (isdefined(level.var_4268159)) {
        [[ level.var_4268159 ]](eventstruct.gestureindex, eventstruct.animlength);
    }
    callback(#"on_boast", eventstruct);
}

// Namespace callback/event_8451509a
// Params 1, eflags: 0x40
// Checksum 0x21c0a6ea, Offset: 0x2fe8
// Size: 0x44
function event_handler[event_8451509a] function_e35aeddd(eventstruct) {
    self endon(#"disconnect");
    callback(#"hash_4a9c56bba76da754");
}

// Namespace callback/player_melee
// Params 1, eflags: 0x40
// Checksum 0xf17be2e6, Offset: 0x3038
// Size: 0x8c
function event_handler[player_melee] codecallback_playermelee(eventstruct) {
    self endon(#"disconnect");
    [[ level.callbackplayermelee ]](eventstruct.attacker, eventstruct.amount, eventstruct.weapon, eventstruct.position, eventstruct.direction, eventstruct.bone_index, eventstruct.is_shieldhit, eventstruct.is_frombehind);
}

// Namespace callback/actor_spawned
// Params 1, eflags: 0x40
// Checksum 0x130666f, Offset: 0x30d0
// Size: 0x28
function event_handler[actor_spawned] codecallback_actorspawned(eventstruct) {
    self [[ level.callbackactorspawned ]](eventstruct.entity);
}

// Namespace callback/actor_damage
// Params 1, eflags: 0x40
// Checksum 0xc6815f52, Offset: 0x3100
// Size: 0xcc
function event_handler[actor_damage] codecallback_actordamage(eventstruct) {
    [[ level.callbackactordamage ]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.flags, eventstruct.mod, eventstruct.weapon, eventstruct.position, eventstruct.direction, eventstruct.hit_location, eventstruct.damage_origin, eventstruct.time_offset, eventstruct.bone_index, eventstruct.model_index, eventstruct.surface_type, eventstruct.normal);
}

// Namespace callback/actor_killed
// Params 1, eflags: 0x40
// Checksum 0xd2b47ba8, Offset: 0x31d8
// Size: 0x78
function event_handler[actor_killed] codecallback_actorkilled(eventstruct) {
    [[ level.callbackactorkilled ]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.mod, eventstruct.weapon, eventstruct.direction, eventstruct.hit_location, eventstruct.time_offset);
}

// Namespace callback/actor_cloned
// Params 1, eflags: 0x40
// Checksum 0x93afc83c, Offset: 0x3258
// Size: 0x24
function event_handler[actor_cloned] codecallback_actorcloned(eventstruct) {
    [[ level.callbackactorcloned ]](eventstruct.clone);
}

// Namespace callback/event_1524de24
// Params 1, eflags: 0x40
// Checksum 0xd038fc8, Offset: 0x3288
// Size: 0xd8
function event_handler[event_1524de24] function_5b0a9275(eventstruct) {
    [[ level.var_6788bf11 ]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.flags, eventstruct.mod, eventstruct.weapon, eventstruct.position, eventstruct.direction, eventstruct.hit_location, eventstruct.damage_origin, eventstruct.time_offset, eventstruct.bone_index, eventstruct.model_index, eventstruct.part_name, eventstruct.surface_type, eventstruct.normal);
}

// Namespace callback/vehicle_spawned
// Params 1, eflags: 0x40
// Checksum 0xc74c14f1, Offset: 0x3368
// Size: 0x34
function event_handler[vehicle_spawned] codecallback_vehiclespawned(eventstruct) {
    if (isdefined(level.callbackvehiclespawned)) {
        [[ level.callbackvehiclespawned ]](eventstruct.spawner);
    }
}

// Namespace callback/vehicle_killed
// Params 1, eflags: 0x40
// Checksum 0x8e2a6e58, Offset: 0x33a8
// Size: 0x78
function event_handler[vehicle_killed] codecallback_vehiclekilled(eventstruct) {
    [[ level.callbackvehiclekilled ]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.mod, eventstruct.weapon, eventstruct.direction, eventstruct.hit_location, eventstruct.time_offset);
}

// Namespace callback/vehicle_damage
// Params 1, eflags: 0x40
// Checksum 0x18886c80, Offset: 0x3428
// Size: 0xcc
function event_handler[vehicle_damage] codecallback_vehicledamage(eventstruct) {
    [[ level.callbackvehicledamage ]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.flags, eventstruct.mod, eventstruct.weapon, eventstruct.position, eventstruct.direction, eventstruct.hit_location, eventstruct.damage_origin, eventstruct.time_offset, eventstruct.damage_from_underneath, eventstruct.model_index, eventstruct.part_name, eventstruct.normal);
}

// Namespace callback/vehicle_radiusdamage
// Params 1, eflags: 0x40
// Checksum 0x632b3a7, Offset: 0x3500
// Size: 0xb4
function event_handler[vehicle_radiusdamage] codecallback_vehicleradiusdamage(eventstruct) {
    [[ level.callbackvehicleradiusdamage ]](eventstruct.inflictor, eventstruct.attacker, eventstruct.amount, eventstruct.inner_damage, eventstruct.outer_damage, eventstruct.flags, eventstruct.mod, eventstruct.weapon, eventstruct.position, eventstruct.outer_radius, eventstruct.cone_angle, eventstruct.cone_direction, eventstruct.time_offset);
}

// Namespace callback/callbacks_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xf544437d, Offset: 0x35c0
// Size: 0xae
function finishcustomtraversallistener() {
    self endon(#"death");
    self waittillmatch({#notetrack:"end"}, #"custom_traversal_anim_finished");
    self finishtraversal();
    self unlink();
    self.usegoalanimweight = 0;
    self.blockingpain = 0;
    self.customtraverseendnode = undefined;
    self.customtraversestartnode = undefined;
    self notify(#"custom_traversal_cleanup");
}

// Namespace callback/callbacks_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x94aa7060, Offset: 0x3678
// Size: 0x74
function killedcustomtraversallistener() {
    self endon(#"custom_traversal_cleanup");
    self waittill(#"death");
    if (isdefined(self)) {
        self finishtraversal();
        self stopanimscripted();
        self unlink();
    }
}

// Namespace callback/entity_playcustomtraversal
// Params 1, eflags: 0x40
// Checksum 0x77a15d6b, Offset: 0x36f8
// Size: 0x1cc
function event_handler[entity_playcustomtraversal] codecallback_playcustomtraversal(eventstruct) {
    entity = eventstruct.entity;
    endparent = eventstruct.end_entity;
    entity.blockingpain = 1;
    entity.usegoalanimweight = 1;
    entity.customtraverseendnode = entity.traverseendnode;
    entity.customtraversestartnode = entity.traversestartnode;
    entity animmode("noclip", 0);
    entity orientmode("face angle", eventstruct.direction[1]);
    if (isdefined(endparent)) {
        offset = entity.origin - endparent.origin;
        entity linkto(endparent, "", offset);
    }
    entity animscripted("custom_traversal_anim_finished", eventstruct.location, eventstruct.direction, eventstruct.animation, eventstruct.anim_mode, undefined, eventstruct.playback_speed, eventstruct.goal_time, eventstruct.lerp_time);
    entity thread finishcustomtraversallistener();
    entity thread killedcustomtraversallistener();
}

// Namespace callback/callbacks_shared
// Params 2, eflags: 0x0
// Checksum 0x9324fce4, Offset: 0x38d0
// Size: 0x9c
function codecallback_faceeventnotify(notify_msg, ent) {
    if (isdefined(ent) && isdefined(ent.do_face_anims) && ent.do_face_anims) {
        if (isdefined(level.face_event_handler) && isdefined(level.face_event_handler.events[notify_msg])) {
            ent sendfaceevent(level.face_event_handler.events[notify_msg]);
        }
    }
}

// Namespace callback/ui_menuresponse
// Params 1, eflags: 0x40
// Checksum 0x7c1ca8a, Offset: 0x3978
// Size: 0xa8
function event_handler[ui_menuresponse] codecallback_menuresponse(eventstruct) {
    if (!isdefined(level.menuresponsequeue)) {
        level.menuresponsequeue = [];
        level thread menu_response_queue_pump();
    }
    index = level.menuresponsequeue.size;
    level.menuresponsequeue[index] = {#eventstruct:eventstruct, #ent:self};
    level notify(#"menuresponse_queue");
}

// Namespace callback/callbacks_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xd341ed76, Offset: 0x3a28
// Size: 0xf8
function menu_response_queue_pump() {
    while (1) {
        level waittill(#"menuresponse_queue");
        do {
            if (isdefined(level.menuresponsequeue[0].ent)) {
                level.menuresponsequeue[0].ent notify(#"menuresponse", level.menuresponsequeue[0].eventstruct);
                level.menuresponsequeue[0].ent callback(#"menu_response", level.menuresponsequeue[0].eventstruct);
            }
            arrayremoveindex(level.menuresponsequeue, 0, 0);
            waitframe(1);
        } while(level.menuresponsequeue.size > 0);
    }
}

// Namespace callback/notetrack_callserverscript
// Params 1, eflags: 0x40
// Checksum 0xa961aff4, Offset: 0x3b28
// Size: 0xde
function event_handler[notetrack_callserverscript] codecallback_callserverscript(eventstruct) {
    if (!isdefined(level._animnotifyfuncs)) {
        return;
    }
    if (isdefined(level._animnotifyfuncs[eventstruct.label])) {
        if (isdefined(eventstruct.param3) && eventstruct.param3 != "") {
            eventstruct.entity [[ level._animnotifyfuncs[eventstruct.label] ]](eventstruct.param, eventstruct.param3);
        } else {
            eventstruct.entity [[ level._animnotifyfuncs[eventstruct.label] ]](eventstruct.param);
        }
    }
}

// Namespace callback/notetrack_callserverscriptonlevel
// Params 1, eflags: 0x40
// Checksum 0x425ced8, Offset: 0x3c10
// Size: 0xce
function event_handler[notetrack_callserverscriptonlevel] codecallback_callserverscriptonlevel(eventstruct) {
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
// Checksum 0x662950e9, Offset: 0x3ce8
// Size: 0x10c
function event_handler[event_69572c01] function_2073f6dc(eventstruct) {
    origin = self.origin;
    magnitude = float(eventstruct.magnitude);
    innerradius = float(eventstruct.innerradius);
    outerradius = int(eventstruct.outerradius);
    innerdamage = isdefined(self.var_f501d778) ? self.var_f501d778 : 50;
    outerdamage = isdefined(self.var_e14c1b5c) ? self.var_e14c1b5c : 25;
    physicsexplosionsphere(origin, outerradius, innerradius, magnitude, outerdamage, innerdamage);
}

// Namespace callback/sidemission_launch
// Params 1, eflags: 0x40
// Checksum 0x1568d98c, Offset: 0x3e00
// Size: 0x9c
function event_handler[sidemission_launch] codecallback_launchsidemission(eventstruct) {
    switchmap_preload(eventstruct.name, eventstruct.game_type);
    luinotifyevent(#"open_side_mission_countdown", 1, eventstruct.list_index);
    wait(10);
    luinotifyevent(#"close_side_mission_countdown");
    switchmap_switch();
}

// Namespace callback/ui_fadeblackscreen
// Params 1, eflags: 0x40
// Checksum 0xe79a0065, Offset: 0x3ea8
// Size: 0x7c
function event_handler[ui_fadeblackscreen] codecallback_fadeblackscreen(eventstruct) {
    if (isplayer(self) && !isbot(self)) {
        self thread hud::fade_to_black_for_x_sec(0, eventstruct.duration, eventstruct.blend, eventstruct.blend);
    }
}

// Namespace callback/event_40f83b44
// Params 1, eflags: 0x40
// Checksum 0xd44578b2, Offset: 0x3f30
// Size: 0x7c
function event_handler[event_40f83b44] function_4b5ab05f(eventstruct) {
    if (isplayer(self) && !isbot(self)) {
        self thread hud::fade_to_black_for_x_sec(0, eventstruct.duration, eventstruct.blend_out, eventstruct.blend_in);
    }
}

// Namespace callback/callbacks_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe3bec634, Offset: 0x3fb8
// Size: 0x23c
function abort_level() {
    /#
        println("<unknown string>");
    #/
    level.callbackstartgametype = &callback_void;
    level.callbackplayerconnect = &callback_void;
    level.callbackplayerdisconnect = &callback_void;
    level.callbackplayerdamage = &callback_void;
    level.callbackplayerkilled = &callback_void;
    level.var_3a9881cb = &callback_void;
    level.callbackplayerlaststand = &callback_void;
    level.var_4268159 = &callback_void;
    level.var_69959686 = &callback_void;
    level.callbackplayermelee = &callback_void;
    level.callbackactordamage = &callback_void;
    level.callbackactorkilled = &callback_void;
    level.var_6788bf11 = &callback_void;
    level.callbackvehicledamage = &callback_void;
    level.callbackvehiclekilled = &callback_void;
    level.callbackactorspawned = &callback_void;
    level.callbackbotentereduseredge = &callback_void;
    level.callbackbotcreateplayerbot = &callback_void;
    level.callbackbotshutdown = &callback_void;
    if (isdefined(level._gametype_default)) {
        setdvar(#"g_gametype", level._gametype_default);
    }
    exitlevel(0);
}

// Namespace callback/glass_smash
// Params 1, eflags: 0x40
// Checksum 0x302837f3, Offset: 0x4200
// Size: 0x58
function event_handler[glass_smash] codecallback_glasssmash(eventstruct) {
    level notify(#"glass_smash", {#direction:eventstruct.direction, #position:eventstruct.position});
}

// Namespace callback/freefall
// Params 1, eflags: 0x40
// Checksum 0xbde21233, Offset: 0x4260
// Size: 0x2c
function event_handler[freefall] function_5019e563(eventstruct) {
    self callback(#"freefall", eventstruct);
}

// Namespace callback/parachute
// Params 1, eflags: 0x40
// Checksum 0xa8dcf8f4, Offset: 0x4298
// Size: 0x2c
function event_handler[parachute] function_87b05fa3(eventstruct) {
    self callback(#"parachute", eventstruct);
}

// Namespace callback/swimming
// Params 1, eflags: 0x40
// Checksum 0xbae084f6, Offset: 0x42d0
// Size: 0x2c
function event_handler[swimming] codecallback_swimming(eventstruct) {
    self callback(#"swimming", eventstruct);
}

// Namespace callback/underwater
// Params 1, eflags: 0x40
// Checksum 0x5f1ca4aa, Offset: 0x4308
// Size: 0x2c
function event_handler[underwater] codecallback_underwater(eventstruct) {
    self callback(#"underwater", eventstruct);
}

// Namespace callback/event_d6f9e6ad
// Params 1, eflags: 0x40
// Checksum 0xeb732e3c, Offset: 0x4340
// Size: 0x2c
function event_handler[event_d6f9e6ad] function_8877d89(eventstruct) {
    self callback(#"hash_42aa89b2a0951308", eventstruct);
}

// Namespace callback/debug_movement
// Params 1, eflags: 0x40
// Checksum 0x1ced91b2, Offset: 0x4378
// Size: 0x34
function event_handler[debug_movement] function_930ce3c3(eventstruct) {
    /#
        self callback(#"debug_movement", eventstruct);
    #/
}

// Namespace callback/event_31e1c5e9
// Params 1, eflags: 0x40
// Checksum 0x315da427, Offset: 0x43b8
// Size: 0x5c
function event_handler[event_31e1c5e9] function_7d45bff(eventstruct) {
    self endon(#"death");
    level flagsys::wait_till("system_init_complete");
    self callback(#"hash_1e4a4ca774f4ce22");
}

// Namespace callback/trigger
// Params 2, eflags: 0x41 linked
// Checksum 0x71da971f, Offset: 0x4420
// Size: 0xb4
function event_handler[trigger] codecallback_trigger(eventstruct, look_trigger = 0) {
    if (look_trigger || !trigger::is_look_trigger()) {
        self util::script_delay();
        self callback(#"on_trigger", eventstruct);
        self callback(#"on_trigger_once", eventstruct);
        self remove_on_trigger_once("all");
    }
}

// Namespace callback/entity_deleted
// Params 1, eflags: 0x40
// Checksum 0x1fec034a, Offset: 0x44e0
// Size: 0x2c
function event_handler[entity_deleted] codecallback_entitydeleted(eventstruct) {
    self callback(#"on_entity_deleted");
}

// Namespace callback/bot_enteruseredge
// Params 1, eflags: 0x40
// Checksum 0x775922fd, Offset: 0x4518
// Size: 0x64
function event_handler[bot_enteruseredge] codecallback_botentereduseredge(eventstruct) {
    self [[ level.callbackbotentereduseredge ]](eventstruct.start_node, eventstruct.end_node, eventstruct.mantle_node, eventstruct.start_position, eventstruct.end_position, eventstruct.var_a8cc518d);
}

// Namespace callback/bot_create_player_bot
// Params 1, eflags: 0x40
// Checksum 0x3a82429e, Offset: 0x4588
// Size: 0x20
function event_handler[bot_create_player_bot] codecallback_botcreateplayerbot(eventstruct) {
    self [[ level.callbackbotcreateplayerbot ]]();
}

// Namespace callback/bot_stop_update
// Params 1, eflags: 0x40
// Checksum 0x3dd61e80, Offset: 0x45b0
// Size: 0x20
function event_handler[bot_stop_update] codecallback_botstopupdate(eventstruct) {
    self [[ level.callbackbotshutdown ]]();
}

// Namespace callback/event_b100b913
// Params 1, eflags: 0x40
// Checksum 0x25fb09ce, Offset: 0x45d8
// Size: 0x34
function event_handler[event_b100b913] function_451258ba(eventstruct) {
    self voice_events::function_c710099c(eventstruct.event, eventstruct.params);
}

// Namespace callback/event_596b7bdc
// Params 1, eflags: 0x40
// Checksum 0x5bc6cc04, Offset: 0x4618
// Size: 0xa4
function event_handler[event_596b7bdc] function_f5026566(eventstruct) {
    if (!isdefined(level.var_abb3fd2)) {
        return;
    }
    /#
    #/
    eventdata = {};
    eventdata.tableindex = eventstruct.tableindex;
    eventdata.var_96db1aff = eventstruct.var_96db1aff;
    self [[ level.var_abb3fd2 ]](eventstruct.event_name, eventstruct.time, eventstruct.client, eventstruct.priority, eventdata);
}

// Namespace callback/player_decoration
// Params 1, eflags: 0x40
// Checksum 0x9e7dac33, Offset: 0x46c8
// Size: 0x70
function event_handler[player_decoration] codecallback_decoration(eventstruct) {
    a_decorations = self getdecorations(1);
    if (!isdefined(a_decorations)) {
        return;
    }
    if (a_decorations.size == 12) {
    }
    level notify(#"decoration_awarded");
    [[ level.callbackdecorationawarded ]]();
}

// Namespace callback/event_ba6fea54
// Params 1, eflags: 0x40
// Checksum 0x2cb8931b, Offset: 0x4740
// Size: 0x58
function event_handler[event_ba6fea54] function_f4449e63(eventstruct) {
    if (isdefined(level.var_17c7288a)) {
        [[ level.var_17c7288a ]](eventstruct.player, eventstruct.eventtype, eventstruct.eventdata, eventstruct.var_c5a66313);
    }
}

// Namespace callback/detonate
// Params 1, eflags: 0x40
// Checksum 0xe4b0da1c, Offset: 0x47a0
// Size: 0x2c
function event_handler[detonate] codecallback_detonate(eventstruct) {
    self callback(#"detonate", eventstruct);
}

// Namespace callback/doubletap_detonate
// Params 1, eflags: 0x40
// Checksum 0x13044a33, Offset: 0x47d8
// Size: 0x2c
function event_handler[doubletap_detonate] function_92aba4c4(eventstruct) {
    self callback(#"doubletap_detonate", eventstruct);
}

// Namespace callback/death
// Params 1, eflags: 0x40
// Checksum 0xe6ff4420, Offset: 0x4810
// Size: 0x2c
function event_handler[death] codecallback_death(eventstruct) {
    self callback(#"death", eventstruct);
}

// Namespace callback/callbacks_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x4848
// Size: 0x4
function callback_void() {
    
}


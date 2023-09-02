// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace mp_offshore_alt_player_rain;

// Namespace mp_offshore_alt_player_rain/mp_offshore_alt_player_rain
// Params 0, eflags: 0x2
// Checksum 0x823e32ea, Offset: 0xd8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"mp_offshore_alt_player_rain", &__init__, &__main__, undefined);
}

// Namespace mp_offshore_alt_player_rain/mp_offshore_alt_player_rain
// Params 0, eflags: 0x1 linked
// Checksum 0x4386c6cd, Offset: 0x128
// Size: 0x54
function __init__() {
    clientfield::register("toplayer", "toggle_player_rain", 1, 1, "counter");
    callback::on_game_playing(&on_game_playing);
}

// Namespace mp_offshore_alt_player_rain/mp_offshore_alt_player_rain
// Params 0, eflags: 0x1 linked
// Checksum 0x50245bfa, Offset: 0x188
// Size: 0x14
function __main__() {
    function_182d285c();
}

// Namespace mp_offshore_alt_player_rain/mp_offshore_alt_player_rain
// Params 0, eflags: 0x1 linked
// Checksum 0xdbd08e11, Offset: 0x1a8
// Size: 0x1c
function on_game_playing() {
    level thread function_5d400be9();
}

// Namespace mp_offshore_alt_player_rain/mp_offshore_alt_player_rain
// Params 0, eflags: 0x1 linked
// Checksum 0x12edd09, Offset: 0x1d0
// Size: 0x2e
function function_182d285c() {
    level.var_bd14ecc1 = getentarray("outdoor_rain_trig", "targetname");
}

// Namespace mp_offshore_alt_player_rain/mp_offshore_alt_player_rain
// Params 0, eflags: 0x1 linked
// Checksum 0x1af1fca5, Offset: 0x208
// Size: 0x14c
function function_5d400be9() {
    while (1) {
        waitframe(1);
        foreach (player in getplayers()) {
            if (isalive(player) && function_325b468a(player)) {
                if (!(isdefined(player.var_325b468a) && player.var_325b468a)) {
                    player.var_325b468a = 1;
                    player clientfield::increment_to_player("toggle_player_rain");
                }
            } else if (isdefined(player.var_325b468a) && player.var_325b468a) {
                player.var_325b468a = 0;
                player clientfield::increment_to_player("toggle_player_rain");
            }
        }
    }
}

// Namespace mp_offshore_alt_player_rain/mp_offshore_alt_player_rain
// Params 1, eflags: 0x1 linked
// Checksum 0xcc78596d, Offset: 0x360
// Size: 0x7c
function function_4235c686(player) {
    height = getwaterheight(player.origin);
    player_z = player.origin[2];
    depth = height - player_z;
    var_101b13f6 = depth > 50;
    return var_101b13f6;
}

// Namespace mp_offshore_alt_player_rain/mp_offshore_alt_player_rain
// Params 1, eflags: 0x1 linked
// Checksum 0x8902e8d7, Offset: 0x3e8
// Size: 0x10c
function function_325b468a(player) {
    if (!isalive(player) || function_4235c686(player)) {
        return 0;
    } else if (level.var_bd14ecc1.size == 0) {
        return 1;
    }
    foreach (var_c54eaae9 in level.var_bd14ecc1) {
        if (isalive(player) && isdefined(var_c54eaae9) && player istouching(var_c54eaae9)) {
            return 0;
        }
    }
    return 1;
}


// Atian COD Tools GSC decompiler test
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\player\player_stats.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace wz_snowball_fx;

// Namespace wz_snowball_fx/wz_snowball_fx
// Params 0, eflags: 0x2
// Checksum 0x6ff1c738, Offset: 0xe0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_snowball_fx", &__init__, undefined, undefined);
}

// Namespace wz_snowball_fx/wz_snowball_fx
// Params 0, eflags: 0x0
// Checksum 0x90968e05, Offset: 0x128
// Size: 0x94
function __init__() {
    clientfield::register("toplayer", "player_hit_freezing_snowball", 9000, 1, "int", undefined, 0, 0);
    clientfield::register("toplayer", "player_hit_snowball_direction", 9000, 4, "int", undefined, 0, 0);
    callback::on_localclient_connect(&on_localclient_connect);
}

// Namespace wz_snowball_fx/wz_snowball_fx
// Params 1, eflags: 0x0
// Checksum 0xe8f6516a, Offset: 0x1c8
// Size: 0x74
function on_localclient_connect(localclientnum) {
    if (isdefined(getgametypesetting(#"wzsnowballsenabled")) ? getgametypesetting(#"wzsnowballsenabled") : 0) {
        level thread function_b6992be(localclientnum);
    }
}

// Namespace wz_snowball_fx/wz_snowball_fx
// Params 1, eflags: 0x0
// Checksum 0xfd88480b, Offset: 0x248
// Size: 0x5bc
function function_b6992be(localclientnum) {
    var_d5823792 = 0;
    while (1) {
        local_player = function_5c10bd79(localclientnum);
        if (isdefined(local_player)) {
            var_965f0bef = local_player clientfield::get_to_player("player_hit_freezing_snowball");
            if (var_965f0bef === 1 && !var_d5823792) {
                var_d5823792 = 1;
                function_a837926b(localclientnum, #"pstfx_wz_snowball_hit");
                waitframe(1);
                if (!isdefined(local_player)) {
                    return;
                }
                var_494e2f9b = local_player clientfield::get_to_player("player_hit_snowball_direction");
                switch (var_494e2f9b) {
                case 1:
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position x", 0);
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position y", 0);
                    break;
                case 2:
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position x", -1);
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position y", 0);
                    break;
                case 3:
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position x", 1);
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position y", 0);
                    break;
                case 4:
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position x", 0);
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position y", -1);
                    break;
                case 5:
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position x", 0);
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position y", 1);
                    break;
                case 6:
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position x", -1);
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position y", -1);
                    break;
                case 8:
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position x", 1);
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position y", -1);
                    break;
                case 9:
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position x", -1);
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position y", 1);
                    break;
                case 10:
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position x", 1);
                    local_player postfx::function_c8b5f318(#"pstfx_wz_snowball_hit", #"screen position y", 1);
                    break;
                }
            } else if (var_965f0bef === 0 && var_d5823792) {
                var_d5823792 = 0;
                function_24cd4cfb(localclientnum, #"pstfx_wz_snowball_hit");
            }
        } else {
            return;
        }
        waitframe(1);
    }
}


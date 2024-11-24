#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;

#namespace wz_waterballoon_fx;

// Namespace wz_waterballoon_fx/wz_waterballoon_fx
// Params 0, eflags: 0x2
// Checksum 0xaac75f51, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_waterballoon_fx", &__init__, undefined, undefined);
}

// Namespace wz_waterballoon_fx/wz_waterballoon_fx
// Params 0, eflags: 0x0
// Checksum 0x5c9c10b2, Offset: 0x130
// Size: 0x94
function __init__() {
    clientfield::register("toplayer", "player_hit_water_balloon", 16000, 1, "int", undefined, 0, 0);
    clientfield::register("toplayer", "player_hit_water_balloon_direction", 16000, 4, "int", undefined, 0, 0);
    callback::on_localclient_connect(&on_localclient_connect);
}

// Namespace wz_waterballoon_fx/wz_waterballoon_fx
// Params 1, eflags: 0x0
// Checksum 0x92fdc813, Offset: 0x1d0
// Size: 0xc4
function on_localclient_connect(localclientnum) {
    if ((isdefined(getgametypesetting(#"wzwaterballoonsenabled")) ? getgametypesetting(#"wzwaterballoonsenabled") : 0) || (isdefined(getgametypesetting(#"hash_3e2d2cf6b1cc6c68")) ? getgametypesetting(#"hash_3e2d2cf6b1cc6c68") : 0)) {
        level thread function_4433b7ba(localclientnum);
    }
}

// Namespace wz_waterballoon_fx/wz_waterballoon_fx
// Params 1, eflags: 0x0
// Checksum 0x2d8687fa, Offset: 0x2a0
// Size: 0x5bc
function function_4433b7ba(localclientnum) {
    var_d5823792 = 0;
    while (true) {
        local_player = function_5c10bd79(localclientnum);
        if (isdefined(local_player)) {
            var_965f0bef = local_player clientfield::get_to_player("player_hit_water_balloon");
            if (var_965f0bef === 1 && !var_d5823792) {
                var_d5823792 = 1;
                function_a837926b(localclientnum, #"hash_7deaa6811d695aea");
                waitframe(1);
                if (!isdefined(local_player)) {
                    return;
                }
                var_494e2f9b = local_player clientfield::get_to_player("player_hit_water_balloon_direction");
                switch (var_494e2f9b) {
                case 1:
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position x", 0);
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position y", 0);
                    break;
                case 2:
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position x", -1);
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position y", 0);
                    break;
                case 3:
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position x", 1);
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position y", 0);
                    break;
                case 4:
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position x", 0);
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position y", -1);
                    break;
                case 5:
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position x", 0);
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position y", 1);
                    break;
                case 6:
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position x", -1);
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position y", -1);
                    break;
                case 8:
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position x", 1);
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position y", -1);
                    break;
                case 9:
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position x", -1);
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position y", 1);
                    break;
                case 10:
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position x", 1);
                    local_player postfx::function_c8b5f318(#"hash_7deaa6811d695aea", #"screen position y", 1);
                    break;
                }
            } else if (var_965f0bef === 0 && var_d5823792) {
                var_d5823792 = 0;
                function_24cd4cfb(localclientnum, #"hash_7deaa6811d695aea");
            }
        } else {
            return;
        }
        waitframe(1);
    }
}


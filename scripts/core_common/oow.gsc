// Atian COD Tools GSC decompiler test
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\map.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace oob;

// Namespace oob/oow
// Params 0, eflags: 0x2
// Checksum 0x617098bc, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_160d7214c7356e06", &__init__, undefined, undefined);
}

// Namespace oob/oow
// Params 0, eflags: 0x1 linked
// Checksum 0x11c620ed, Offset: 0x100
// Size: 0x5c
function __init__() {
    level.oow = {#height_max:2147483647, #height_min:2147483647};
    callback::on_game_playing(&on_game_playing);
}

// Namespace oob/oow
// Params 0, eflags: 0x1 linked
// Checksum 0x43b466d5, Offset: 0x168
// Size: 0x174
function on_game_playing() {
    var_65792f8b = map::get_script_bundle();
    if (isdefined(var_65792f8b)) {
        if (!isdefined(var_65792f8b.var_aa91547b)) {
            var_65792f8b.var_aa91547b = 0;
        }
        if (!isdefined(var_65792f8b.var_eac026ad)) {
            var_65792f8b.var_eac026ad = 0;
        }
        if (var_65792f8b.var_aa91547b != 0 || var_65792f8b.var_eac026ad != 0) {
            level.oow.height_min = isdefined(var_65792f8b.var_aa91547b) ? var_65792f8b.var_aa91547b : 0;
            level.oow.height_max = isdefined(var_65792f8b.var_eac026ad) ? var_65792f8b.var_eac026ad : 0;
            /#
                assert(level.oow.height_min <= level.oow.height_max);
            #/
            if (!(level.oow.height_min <= level.oow.height_max)) {
                return;
            }
        }
    }
    level thread function_e8f5803d();
}

// Namespace oob/oow
// Params 0, eflags: 0x1 linked
// Checksum 0xaab2194b, Offset: 0x2e8
// Size: 0x118
function function_e8f5803d() {
    while (1) {
        wait(5);
        foreach (team, _ in level.teams) {
            foreach (player in level.aliveplayers[team]) {
                if (!isdefined(player)) {
                    continue;
                }
                if (player function_eb7eb3d4()) {
                    kill_entity(player);
                }
            }
        }
    }
}

// Namespace oob/oow
// Params 0, eflags: 0x1 linked
// Checksum 0x98cb7091, Offset: 0x408
// Size: 0x9e
function function_eb7eb3d4() {
    if (!isdefined(self)) {
        return 0;
    }
    /#
        if (self isinmovemode("<unknown string>", "<unknown string>")) {
            return 0;
        }
    #/
    height = self.origin[2];
    if (level.oow.height_min > height || level.oow.height_max < height) {
        return 1;
    }
    return 0;
}

// Namespace oob/oow
// Params 1, eflags: 0x1 linked
// Checksum 0xdb9d8081, Offset: 0x4b0
// Size: 0x1dc
function kill_entity(entity) {
    if (isplayer(entity) && entity isinvehicle()) {
        vehicle = entity getvehicleoccupied();
        occupants = vehicle getvehoccupants();
        foreach (occupant in occupants) {
            occupant unlink();
        }
        if (!(isdefined(vehicle.allowdeath) && !vehicle.allowdeath)) {
            vehicle dodamage(vehicle.health + 10000, vehicle.origin, undefined, undefined, "none", "MOD_EXPLOSIVE", 8192);
        }
    }
    entity dodamage(entity.health + 10000, entity.origin, undefined, undefined, "none", "MOD_TRIGGER_HURT", 8192 | 16384);
    if (isplayer(entity)) {
        entity suicide();
    }
}


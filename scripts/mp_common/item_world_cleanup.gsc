// Atian COD Tools GSC decompiler test
#using scripts\weapons\weaponobjects.gsc;
#using scripts\mp_common\item_world.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\abilities\gadgets\gadget_homunculus.gsc;
#using scripts\abilities\gadgets\gadget_cymbal_monkey.gsc;
#using scripts\abilities\gadgets\gadget_tripwire.gsc;

#namespace item_world_cleanup;

// Namespace item_world_cleanup/item_world_cleanup
// Params 0, eflags: 0x2
// Checksum 0xca1290, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"item_world_cleanup", &__init__, undefined, undefined);
}

// Namespace item_world_cleanup/item_world_cleanup
// Params 0, eflags: 0x4
// Checksum 0x9bcbebba, Offset: 0x110
// Size: 0x1c
function private __init__() {
    level thread _cleanup();
}

// Namespace item_world_cleanup/item_world_cleanup
// Params 0, eflags: 0x4
// Checksum 0xd7c1c63, Offset: 0x138
// Size: 0x152
function private _cleanup() {
    level flagsys::wait_till(#"item_world_reset");
    var_314770d8 = array(&function_b465b436, &function_35e11623, &function_b7c5f376, &function_6ef5c287, &function_ada16428);
    while (true) {
        if (isdefined(level.deathcircle)) {
            foreach (func in var_314770d8) {
                util::wait_network_frame(1);
                [[ func ]](level.deathcircle, level.deathcircles[level.deathcircleindex - 1]);
            }
        }
        wait(1);
    }
}

// Namespace item_world_cleanup/item_world_cleanup
// Params 2, eflags: 0x4
// Checksum 0x87d26a27, Offset: 0x298
// Size: 0x114
function private function_b465b436(deathcircle, var_898879a6) {
    if (!isdefined(level.var_ace9fb52)) {
        return;
    }
    deathstashes = arraycopy(level.var_ace9fb52);
    foreach (deathstash in deathstashes) {
        if (!isdefined(deathstash)) {
            continue;
        }
        if (function_3703bc36(deathstash, var_898879a6, 1)) {
            deathstash delete();
            waitframe(1);
        }
    }
    arrayremovevalue(level.var_ace9fb52, undefined, 0);
}

// Namespace item_world_cleanup/item_world_cleanup
// Params 2, eflags: 0x4
// Checksum 0x60e2dc3d, Offset: 0x3b8
// Size: 0x676
function private function_35e11623(deathcircle, var_898879a6) {
    players = getplayers();
    excludelist = [#"eq_acid_bomb":1, #"eq_cluster_semtex_grenade":1, #"eq_molotov":1, #"eq_slow_grenade":1, #"eq_swat_grenade":1, #"eq_wraith_fire":1, #"frag_grenade":1, #"willy_pete":1];
    foreach (player in players) {
        if (!isplayer(player)) {
            continue;
        }
        if (!isarray(player.weaponobjectwatcherarray)) {
            continue;
        }
        foreach (watcherarray in player.weaponobjectwatcherarray) {
            if (!isdefined(watcherarray) || !isarray(watcherarray.objectarray)) {
                continue;
            }
            foreach (object in watcherarray.objectarray) {
                if (function_3703bc36(object, deathcircle)) {
                    if (isdefined(object.weapon)) {
                        weapon = object.weapon;
                        if (isdefined(excludelist[weapon.name])) {
                            continue;
                        }
                        if (weapon.name == #"hatchet" || weapon.name == #"tomahawk_t8") {
                            velocity = object getvelocity();
                            if (velocity[0] > 0 || velocity[1] > 0 || velocity[2]) {
                                continue;
                            }
                        }
                        watcherarray thread weaponobjects::waitanddetonate(object, 0);
                    }
                    if (isdefined(object)) {
                        object kill();
                        if (isdefined(object)) {
                            object delete();
                        }
                    }
                }
            }
            arrayremovevalue(watcherarray.objectarray, undefined, 0);
        }
        waitframe(1);
    }
    var_a5a016fc = [];
    foreach (tripwire in level.tripwires) {
        if (function_3703bc36(tripwire, deathcircle)) {
            var_a5a016fc[var_a5a016fc.size] = tripwire;
        }
    }
    for (index = 0; index < var_a5a016fc.size; index++) {
        var_a5a016fc[index] gadget_tripwire::function_9e546fb3();
    }
    var_90afc439 = [];
    foreach (monkey in level.var_7d95e1ed) {
        if (isdefined(monkey) && function_3703bc36(monkey, deathcircle)) {
            var_90afc439[var_90afc439.size] = monkey;
        }
    }
    for (index = 0; index < var_90afc439.size; index++) {
        var_90afc439[index] gadget_cymbal_monkey::function_4f90c4c2();
    }
    var_2e20127d = [];
    foreach (homunculus in level.var_2da60c10) {
        if (isdefined(homunculus) && function_3703bc36(homunculus, deathcircle)) {
            var_2e20127d[var_2e20127d.size] = homunculus;
        }
    }
    for (index = 0; index < var_2e20127d.size; index++) {
        var_2e20127d[index] gadget_homunculus::function_7bfc867f();
    }
}

// Namespace item_world_cleanup/item_world_cleanup
// Params 2, eflags: 0x4
// Checksum 0x7406a97f, Offset: 0xa38
// Size: 0x1f4
function private function_b7c5f376(deathcircle, var_898879a6) {
    if (!isdefined(level.item_spawn_drops)) {
        return;
    }
    itemspawndrops = arraycopy(level.item_spawn_drops);
    foreach (dropitem in itemspawndrops) {
        if (!isdefined(dropitem)) {
            continue;
        }
        if (isdefined(dropitem.spawning) && dropitem.spawning) {
            continue;
        }
        supplydrop = dropitem getlinkedent();
        if (isdefined(supplydrop)) {
            var_da05d0b2 = supplydrop getlinkedent();
            if (isdefined(var_da05d0b2) && isdefined(var_da05d0b2.var_5d0810d7) && var_da05d0b2.var_5d0810d7) {
                continue;
            }
        }
        if (function_3703bc36(dropitem, var_898879a6, 1)) {
            dropitem.hidetime = gettime();
            item_world::function_a54d07e6(dropitem, undefined);
            dropitem delete();
            waitframe(1);
        }
    }
    arrayremovevalue(level.item_spawn_drops, undefined, 1);
    arrayremovevalue(level.var_18dc9d17, undefined, 1);
}

// Namespace item_world_cleanup/item_world_cleanup
// Params 2, eflags: 0x4
// Checksum 0x844668b9, Offset: 0xc38
// Size: 0x15c
function private function_6ef5c287(deathcircle, var_898879a6) {
    if (!isdefined(level.item_supply_drops)) {
        return;
    }
    supplydrops = arraycopy(level.item_supply_drops);
    foreach (supplydrop in supplydrops) {
        if (!isdefined(supplydrop)) {
            continue;
        }
        if (isdefined(supplydrop.supplydropveh)) {
            continue;
        }
        if (function_3703bc36(supplydrop, var_898879a6, 1)) {
            supplydrop clientfield::set("supply_drop_fx", 0);
            util::wait_network_frame(1);
            supplydrop delete();
            waitframe(1);
        }
    }
    arrayremovevalue(level.item_supply_drops, undefined, 0);
}

// Namespace item_world_cleanup/item_world_cleanup
// Params 2, eflags: 0x4
// Checksum 0xec8a7563, Offset: 0xda0
// Size: 0x574
function private function_ada16428(deathcircle, var_898879a6) {
    time = gettime();
    if (time < level.var_63e0085) {
        return;
    }
    if (!isdefined(level.var_cd8f416a) || level.var_cd8f416a.size == 0) {
        return;
    }
    level.var_63e0085 = time + 10000;
    count = 0;
    var_3624d2c5 = 10;
    /#
        deleted = 0;
    #/
    time = gettime();
    foreach (vehicle in level.var_cd8f416a) {
        if (!isdefined(vehicle)) {
            continue;
        }
        if (isvehicle(vehicle) && vehicle function_213a12e4()) {
            continue;
        }
        if (function_3703bc36(vehicle, deathcircle, 1)) {
            if (!isdefined(vehicle.var_a6b3cbdc)) {
                delay = 60000;
                if (isdefined(vehicle.var_8e382c5f)) {
                    delay = delay + 300000;
                }
                vehicle.var_a6b3cbdc = time + delay;
            }
            if (vehicle.var_a6b3cbdc > time) {
                continue;
            }
            safedelete = 1;
            foreach (player in level.var_a8077fea) {
                if (!isdefined(player) || !isalive(player)) {
                    continue;
                }
                var_6287b00e = distance2dsquared(vehicle.origin, player.origin);
                if (var_6287b00e < 10000 * 10000) {
                    safedelete = 0;
                    break;
                }
                var_42beec1c = (deathcircle.origin[0] - player.origin[0], deathcircle.origin[1] - player.origin[1], 0);
                var_42beec1c = vectornormalize(var_42beec1c);
                var_838d27e = (vehicle.origin[0] - player.origin[0], vehicle.origin[1] - player.origin[1], 0);
                var_838d27e = vectornormalize(var_838d27e);
                if (vectordot(var_42beec1c, var_838d27e) >= 0.9396) {
                    var_c64c4a1f = distance2dsquared(vehicle.origin, player.origin);
                    var_f25c153c = distance2dsquared(player.origin, deathcircle.origin);
                    if (var_c64c4a1f < var_f25c153c) {
                        safedelete = 0;
                        break;
                    }
                }
            }
            if (safedelete) {
                /#
                    if (getdvarint(#"hash_55e8ad2b1d030870", 0)) {
                        iprintlnbold("<unknown string>" + vehicle.scriptvehicletype + "<unknown string>" + vehicle.origin);
                    }
                    deleted++;
                #/
                vehicle delete();
            }
        }
        count++;
        if (count % var_3624d2c5 == 0) {
            util::wait_network_frame(1);
        }
    }
    arrayremovevalue(level.var_cd8f416a, undefined, 0);
    /#
        if (getdvarint(#"hash_55e8ad2b1d030870", 0) && deleted > 0) {
            iprintlnbold("<unknown string>" + level.var_cd8f416a.size + "<unknown string>" + deleted);
        }
    #/
}

// Namespace item_world_cleanup/item_world_cleanup
// Params 0, eflags: 0x4
// Checksum 0x519fcfa7, Offset: 0x1320
// Size: 0x88
function private function_213a12e4() {
    b_occupied = 0;
    for (i = 0; i < 4; i++) {
        if (self function_dcef0ba1(i)) {
            if (self isvehicleseatoccupied(i)) {
                b_occupied = 1;
                break;
            }
            continue;
        }
        break;
    }
    return b_occupied;
}

// Namespace item_world_cleanup/item_world_cleanup
// Params 3, eflags: 0x4
// Checksum 0x1c93a41f, Offset: 0x13b0
// Size: 0xd0
function private function_3703bc36(entity, deathcircle, var_7e2f7f1f = 0) {
    if (!isdefined(entity) || !isdefined(deathcircle) || !isfloat(deathcircle.radius)) {
        return false;
    }
    var_be38b475 = var_7e2f7f1f ? 5000 : 0;
    return distance2dsquared(entity.origin, deathcircle.origin) >= (deathcircle.radius + var_be38b475) * (deathcircle.radius + var_be38b475);
}


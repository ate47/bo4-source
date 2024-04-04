// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_aoe;

// Namespace zm_aoe
// Method(s) 2 Total 2
class areaofeffect {

    var spawntime;
    var state;
    var var_be1913ae;

    // Namespace areaofeffect/zm_aoe
    // Params 0, eflags: 0x9 linked
    // Checksum 0xb9ae6375, Offset: 0x1c8
    // Size: 0x2a
    constructor() {
        spawntime = gettime();
        state = 0;
        var_be1913ae = gettime() + 100;
    }

}

// Namespace zm_aoe
// Method(s) 2 Total 2
class class_698343df {

    var var_9a08bb02;

    // Namespace class_698343df/zm_aoe
    // Params 0, eflags: 0x9 linked
    // Checksum 0xc9ddea3, Offset: 0x2a0
    // Size: 0xe
    constructor() {
        var_9a08bb02 = [];
    }

}

// Namespace zm_aoe/zm_aoe
// Params 0, eflags: 0x2
// Checksum 0xb0187ea4, Offset: 0x178
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_aoe", &__init__, &__main__, undefined);
}

// Namespace zm_aoe/zm_aoe
// Params 0, eflags: 0x1 linked
// Checksum 0x73727cb6, Offset: 0x358
// Size: 0x84
function __init__() {
    clientfield::register("scriptmover", "aoe_state", 1, getminbitcountfornum(4), "int");
    clientfield::register("scriptmover", "aoe_id", 1, getminbitcountfornum(8), "int");
}

// Namespace zm_aoe/zm_aoe
// Params 0, eflags: 0x5 linked
// Checksum 0xbf51508, Offset: 0x3e8
// Size: 0x18c
function private __main__() {
    function_15dea507(1, "zm_aoe_spear", 15, 60000, 2000, 5, 15, 40, 80);
    function_15dea507(2, "zm_aoe_spear_small", 15, 60000, 2000, 5, 15, 20, 80);
    function_15dea507(3, "zm_aoe_spear_big", 15, 60000, 2000, 5, 15, 60, 80);
    function_15dea507(4, "zm_aoe_strafe_storm", 15, 45000, 2000, 3, 5, 80, 80);
    function_15dea507(5, "zm_aoe_chaos_bolt", 10, 30000, 2000, 3, 5, 40, 80);
    function_15dea507(6, "zm_aoe_chaos_bolt_2", 10, 60000, 2000, 3, 5, 60, 80);
    function_15dea507(7, "zm_aoe_chaos_bolt_annihilate", 10, 5000, 2000, 3, 5, 20, 80);
}

// Namespace zm_aoe/zm_aoe
// Params 1, eflags: 0x5 linked
// Checksum 0x480fe14e, Offset: 0x580
// Size: 0x98
function private function_e969e75(type) {
    assert(isdefined(level.var_400ae143));
    arraykeys = getarraykeys(level.var_400ae143);
    if (isinarray(arraykeys, hash(type))) {
        return level.var_400ae143[hash(type)];
    }
    return undefined;
}

// Namespace zm_aoe/zm_aoe
// Params 9, eflags: 0x1 linked
// Checksum 0x903ec8fd, Offset: 0x620
// Size: 0x1ec
function function_15dea507(aoeid, type, var_3a11a165, lifetime, var_f2cd3aad, damagemin, damagemax, radius, height) {
    if (!isdefined(level.var_400ae143)) {
        level.var_400ae143 = [];
    }
    arraykeys = getarraykeys(level.var_400ae143);
    assert(!isinarray(arraykeys, hash(type)));
    var_508aaded = new class_698343df();
    level.var_400ae143[type] = var_508aaded;
    assert(damagemin <= damagemax, "<unknown string>");
    var_508aaded.type = type;
    var_508aaded.var_3a11a165 = var_3a11a165;
    var_508aaded.lifetime = lifetime;
    var_508aaded.damagemin = damagemin;
    var_508aaded.damagemax = damagemax;
    var_508aaded.var_f2cd3aad = var_f2cd3aad;
    var_508aaded.radius = radius;
    var_508aaded.height = height;
    var_508aaded.aoeid = aoeid;
    level thread function_60bb02f3(type);
    /#
        level thread function_e39c0be4(var_508aaded);
    #/
}

// Namespace zm_aoe/zm_aoe
// Params 4, eflags: 0x1 linked
// Checksum 0x9021b121, Offset: 0x818
// Size: 0x192
function function_371b4147(aoeid, type, position, userdata) {
    var_46f1b5eb = function_e969e75(type);
    assert(isdefined(var_46f1b5eb), "<unknown string>");
    if (var_46f1b5eb.var_9a08bb02.size >= var_46f1b5eb.var_3a11a165) {
        function_2c33d107(type);
    }
    assert(var_46f1b5eb.var_9a08bb02.size < var_46f1b5eb.var_3a11a165);
    aoe = new areaofeffect();
    aoe.position = position;
    aoe.endtime = gettime() + var_46f1b5eb.lifetime;
    aoe.entity = spawn("script_model", position);
    aoe.type = type;
    aoe.entity clientfield::set("aoe_id", aoeid);
    function_668a9b2d(aoe, type);
    if (isdefined(userdata)) {
        aoe.userdata = userdata;
    }
}

// Namespace zm_aoe/zm_aoe
// Params 2, eflags: 0x5 linked
// Checksum 0xcd6bee08, Offset: 0x9b8
// Size: 0xa4
function private function_668a9b2d(aoe, type) {
    var_46f1b5eb = function_e969e75(type);
    assert(isdefined(var_46f1b5eb), "<unknown string>");
    array::add(var_46f1b5eb.var_9a08bb02, aoe);
    assert(var_46f1b5eb.var_9a08bb02.size <= var_46f1b5eb.var_3a11a165);
}

// Namespace zm_aoe/zm_aoe
// Params 1, eflags: 0x5 linked
// Checksum 0x14bee4d, Offset: 0xa68
// Size: 0x104
function private function_87bbe4fc(type) {
    var_46f1b5eb = function_e969e75(type);
    assert(isdefined(var_46f1b5eb), "<unknown string>");
    if (var_46f1b5eb.var_9a08bb02.size) {
        oldest = var_46f1b5eb.var_9a08bb02[0];
        foreach (aoe in var_46f1b5eb.var_9a08bb02) {
            if (aoe.spawntime < oldest.spawntime) {
                oldest = aoe;
            }
        }
        return oldest;
    }
}

// Namespace zm_aoe/zm_aoe
// Params 2, eflags: 0x5 linked
// Checksum 0xf72f73cc, Offset: 0xb78
// Size: 0x104
function private function_fa03204a(aoe, type) {
    var_46f1b5eb = function_e969e75(type);
    assert(isinarray(var_46f1b5eb.var_9a08bb02, aoe));
    if (isdefined(aoe.userdata) && isdefined(level.var_6efc944c)) {
        [[ level.var_6efc944c ]](aoe);
    }
    arrayremovevalue(var_46f1b5eb.var_9a08bb02, aoe);
    assert(var_46f1b5eb.var_9a08bb02.size < var_46f1b5eb.var_3a11a165);
    thread function_4f0db8cf(aoe.entity);
}

// Namespace zm_aoe/zm_aoe
// Params 1, eflags: 0x5 linked
// Checksum 0xc6cd8ca6, Offset: 0xc88
// Size: 0x24
function private function_4f0db8cf(entity) {
    waitframe(2);
    entity delete();
}

// Namespace zm_aoe/zm_aoe
// Params 1, eflags: 0x5 linked
// Checksum 0xf7b8040a, Offset: 0xcb8
// Size: 0x84
function private function_2c33d107(type) {
    var_46f1b5eb = function_e969e75(type);
    var_528d5f55 = function_87bbe4fc(type);
    function_ccf8f659(var_528d5f55, 1);
    thread function_fa03204a(var_528d5f55, type);
}

// Namespace zm_aoe/zm_aoe
// Params 2, eflags: 0x5 linked
// Checksum 0xfe9a93ae, Offset: 0xd48
// Size: 0x23a
function private function_ccf8f659(aoe, forceend = 0) {
    var_46f1b5eb = function_e969e75(aoe.type);
    assert(isdefined(var_46f1b5eb));
    if (forceend) {
        aoe.entity clientfield::set("aoe_state", 4);
        aoe.state = 4;
        return;
    }
    if (gettime() < aoe.var_be1913ae) {
        return;
    }
    if (aoe.state == 0) {
        aoe.entity clientfield::set("aoe_state", 1);
        aoe.state = 1;
        aoe.var_be1913ae = gettime() + 100;
        return;
    }
    if (aoe.state == 1) {
        aoe.entity clientfield::set("aoe_state", 2);
        aoe.state = 2;
        aoe.var_be1913ae = aoe.endtime;
        return;
    }
    if (aoe.state == 2) {
        aoe.entity clientfield::set("aoe_state", 3);
        aoe.state = 3;
        aoe.var_be1913ae = gettime() + var_46f1b5eb.var_f2cd3aad;
        return;
    }
    if (aoe.state == 3) {
        aoe.entity clientfield::set("aoe_state", 4);
        aoe.state = 4;
    }
}

// Namespace zm_aoe/zm_aoe
// Params 0, eflags: 0x1 linked
// Checksum 0xf3631297, Offset: 0xf90
// Size: 0x144
function function_3690781e() {
    foreach (var_eb93f0b0 in level.var_400ae143) {
        if (isarray(var_eb93f0b0.var_9a08bb02)) {
            var_4df07587 = arraycopy(var_eb93f0b0.var_9a08bb02);
            foreach (var_3e8795ff in var_4df07587) {
                function_ccf8f659(var_3e8795ff, 1);
                level thread function_fa03204a(var_3e8795ff, var_3e8795ff.type);
            }
        }
    }
}

// Namespace zm_aoe/zm_aoe
// Params 1, eflags: 0x5 linked
// Checksum 0x5d678723, Offset: 0x10e0
// Size: 0x180
function private function_e5950b1e(type) {
    var_46f1b5eb = function_e969e75(type);
    assert(isdefined(var_46f1b5eb));
    var_2aad0cec = [];
    foreach (aoe in var_46f1b5eb.var_9a08bb02) {
        function_ccf8f659(aoe);
        if (aoe.state == 4) {
            array::add(var_2aad0cec, aoe, 0);
        }
    }
    foreach (aoe in var_2aad0cec) {
        function_fa03204a(aoe, aoe.type);
    }
}

// Namespace zm_aoe/zm_aoe
// Params 1, eflags: 0x5 linked
// Checksum 0xa5902905, Offset: 0x1268
// Size: 0x300
function private function_bea2e288(type) {
    var_46f1b5eb = function_e969e75(type);
    assert(isdefined(var_46f1b5eb));
    players = getplayers();
    foreach (aoe in var_46f1b5eb.var_9a08bb02) {
        foreach (player in players) {
            assert(isdefined(aoe.entity));
            dist = distance(aoe.entity.origin, player.origin);
            withinrange = dist <= var_46f1b5eb.radius;
            var_c0af03ae = 0;
            if (!withinrange) {
                continue;
            }
            heightdiff = abs(aoe.entity.origin[2] - player.origin[2]);
            if (heightdiff <= var_46f1b5eb.height) {
                var_c0af03ae = 1;
            }
            if (withinrange && var_c0af03ae) {
                damage = mapfloat(0, var_46f1b5eb.radius, var_46f1b5eb.damagemin, var_46f1b5eb.damagemax, dist);
                player dodamage(damage, aoe.entity.origin);
                player notify(#"aoe_damage", {#var_159100b7:aoe.type, #origin:aoe.entity.origin});
            }
        }
    }
}

// Namespace zm_aoe/zm_aoe
// Params 1, eflags: 0x5 linked
// Checksum 0x829ac84, Offset: 0x1570
// Size: 0xa6
function private function_60bb02f3(type) {
    var_46f1b5eb = function_e969e75(type);
    assert(isdefined(var_46f1b5eb));
    while (true) {
        if (!var_46f1b5eb.var_9a08bb02.size) {
            waitframe(1);
            continue;
        }
        function_e5950b1e(type);
        function_bea2e288(type);
        waitframe(1);
    }
}

// Namespace zm_aoe/zm_aoe
// Params 1, eflags: 0x4
// Checksum 0x6dea2cc0, Offset: 0x1620
// Size: 0x2d0
function private function_e39c0be4(var_46f1b5eb) {
    /#
        var_46f1b5eb endon(#"hash_343e166e4aa4288e");
        while (true) {
            if (getdvarint(#"zm_debug_aoe", 0)) {
                if (var_46f1b5eb.var_9a08bb02.size) {
                    var_87bbe4fc = function_87bbe4fc(var_46f1b5eb.type);
                    i = 0;
                    foreach (aoe in var_46f1b5eb.var_9a08bb02) {
                        circle(aoe.position, var_46f1b5eb.radius, (1, 0.5, 0), 1, 1);
                        circle(aoe.position + (0, 0, var_46f1b5eb.height), var_46f1b5eb.radius, (1, 0.5, 0), 1, 1);
                        line(aoe.position, aoe.position + (0, 0, var_46f1b5eb.height), (1, 0.5, 0));
                        if (aoe == var_87bbe4fc) {
                            print3d(aoe.position + (0, 0, var_46f1b5eb.height + 5), "<unknown string>" + var_46f1b5eb.type + "<unknown string>" + i + "<unknown string>", (1, 0, 0));
                        } else {
                            print3d(aoe.position + (0, 0, var_46f1b5eb.height + 5), "<unknown string>" + var_46f1b5eb.type + "<unknown string>" + i + "<unknown string>", (1, 0.5, 0));
                        }
                        i++;
                    }
                }
            }
            waitframe(1);
        }
    #/
}


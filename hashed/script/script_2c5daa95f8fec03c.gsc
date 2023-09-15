// Atian COD Tools GSC decompiler test
#using scripts\core_common\array_shared.gsc;

#namespace namespace_81245006;

// Namespace namespace_81245006/namespace_81245006
// Params 2, eflags: 0x0
// Checksum 0x2e8347fd, Offset: 0x70
// Size: 0x240
function initweakpoints(entity, var_97e1b97d) {
    var_5ace757d = getscriptbundle(var_97e1b97d);
    if (!isdefined(var_5ace757d) || !isdefined(var_5ace757d.weakpoints)) {
        return;
    }
    entity.var_5ace757d = [];
    foreach (var_dd54fdb1 in var_5ace757d.weakpoints) {
        var_7c4db75f = function_2e532eed(var_dd54fdb1);
        var_7c4db75f.var_292e2bf1 = 2;
        if (isdefined(var_dd54fdb1.activebydefault) && var_dd54fdb1.activebydefault) {
            var_7c4db75f.var_292e2bf1 = 1;
        }
        if (!(isdefined(var_dd54fdb1.var_5a93cd2e) && var_dd54fdb1.var_5a93cd2e)) {
            var_7c4db75f.health = var_dd54fdb1.health * entity.health;
        } else {
            var_7c4db75f.health = var_dd54fdb1.health;
        }
        var_7c4db75f.maxhealth = var_7c4db75f.health;
        var_7c4db75f.hittags = [];
        if (isdefined(var_dd54fdb1.var_51e8b151)) {
            array::add(var_7c4db75f.hittags, var_dd54fdb1.var_51e8b151);
        }
        if (isdefined(var_dd54fdb1.var_910e2f9b)) {
            array::add(var_7c4db75f.hittags, var_dd54fdb1.var_910e2f9b);
        }
        array::add(entity.var_5ace757d, var_7c4db75f);
    }
}

// Namespace namespace_81245006/namespace_81245006
// Params 3, eflags: 0x0
// Checksum 0xf981211d, Offset: 0x2b8
// Size: 0xda
function function_3131f5dd(entity, hitloc, weakpointstate) {
    if (!isdefined(hitloc)) {
        return undefined;
    }
    if (isdefined(entity.var_5ace757d)) {
        foreach (var_dd54fdb1 in entity.var_5ace757d) {
            if (isdefined(weakpointstate) && var_dd54fdb1.var_292e2bf1 !== weakpointstate) {
                continue;
            }
            if (var_dd54fdb1.hitloc === hitloc) {
                return var_dd54fdb1;
            }
        }
    }
}

// Namespace namespace_81245006/namespace_81245006
// Params 3, eflags: 0x0
// Checksum 0x45a97673, Offset: 0x3a0
// Size: 0x1e6
function function_73ab4754(entity, point, weakpointstate) {
    if (!isdefined(point)) {
        return undefined;
    }
    if (isdefined(entity.var_5ace757d)) {
        var_e2b4fa2b = undefined;
        var_833f593 = 2147483647;
        foreach (var_dd54fdb1 in entity.var_5ace757d) {
            if (isdefined(weakpointstate) && var_dd54fdb1.var_292e2bf1 !== weakpointstate) {
                continue;
            }
            if (isdefined(var_dd54fdb1.var_b7fbe51b)) {
                foreach (hittag in var_dd54fdb1.hittags) {
                    tagorigin = entity gettagorigin(hittag);
                    distsq = distancesquared(point, tagorigin);
                    if (distsq <= var_dd54fdb1.var_b7fbe51b * var_dd54fdb1.var_b7fbe51b && var_833f593 > distsq) {
                        var_e2b4fa2b = var_dd54fdb1;
                        var_833f593 = distsq;
                    }
                }
            }
        }
    }
    return var_e2b4fa2b;
}

// Namespace namespace_81245006/namespace_81245006
// Params 3, eflags: 0x0
// Checksum 0xd1c24b2c, Offset: 0x590
// Size: 0x1a0
function function_6bb685f0(entity, point, weakpointstate) {
    if (!isdefined(point)) {
        return undefined;
    }
    if (isdefined(entity.var_5ace757d)) {
        foreach (var_dd54fdb1 in entity.var_5ace757d) {
            if (isdefined(weakpointstate) && var_dd54fdb1.var_292e2bf1 !== weakpointstate) {
                continue;
            }
            if (isdefined(var_dd54fdb1.var_b7fbe51b)) {
                foreach (hittag in var_dd54fdb1.hittags) {
                    tagorigin = entity gettagorigin(hittag);
                    distsq = distancesquared(point, tagorigin);
                    if (distsq <= var_dd54fdb1.var_b7fbe51b * var_dd54fdb1.var_b7fbe51b) {
                        return var_dd54fdb1;
                    }
                }
            }
        }
    }
}

// Namespace namespace_81245006/namespace_81245006
// Params 3, eflags: 0x0
// Checksum 0xb9badea6, Offset: 0x738
// Size: 0x1f6
function function_37e3f011(entity, bone, weakpointstate) {
    if (!isdefined(entity)) {
        return undefined;
    }
    if (isdefined(bone) && !isstring(bone)) {
        bonename = getpartname(entity, bone);
    } else {
        bonename = bone;
    }
    if (isdefined(bonename) && isdefined(entity.var_5ace757d)) {
        /#
            if (getdvarint(#"scr_weakpoint_debug", 0) > 0) {
                if (!isstring(bone)) {
                    iprintlnbold("<unknown string>" + bonename);
                }
            }
        #/
        foreach (var_dd54fdb1 in entity.var_5ace757d) {
            if (isdefined(weakpointstate) && var_dd54fdb1.var_292e2bf1 !== weakpointstate) {
                continue;
            }
            foreach (hittag in var_dd54fdb1.hittags) {
                if (hittag == bonename) {
                    return var_dd54fdb1;
                }
            }
        }
    }
    return undefined;
}

// Namespace namespace_81245006/namespace_81245006
// Params 1, eflags: 0x0
// Checksum 0x76bf0a91, Offset: 0x938
// Size: 0x16
function function_fab3ee3e(entity) {
    return entity.var_5ace757d;
}

// Namespace namespace_81245006/namespace_81245006
// Params 2, eflags: 0x0
// Checksum 0x684ca33a, Offset: 0x958
// Size: 0x52
function function_ef87b7e8(var_dd54fdb1, damage) {
    var_dd54fdb1.health = var_dd54fdb1.health - damage;
    if (var_dd54fdb1.health <= 0) {
        var_dd54fdb1.var_292e2bf1 = 3;
    }
}

// Namespace namespace_81245006/namespace_81245006
// Params 2, eflags: 0x0
// Checksum 0xfb95d6ab, Offset: 0x9b8
// Size: 0x22
function function_6c64ebd3(var_dd54fdb1, state) {
    var_dd54fdb1.var_292e2bf1 = state;
}

// Namespace namespace_81245006/namespace_81245006
// Params 1, eflags: 0x0
// Checksum 0xa8c737bf, Offset: 0x9e8
// Size: 0x16
function function_f29756fe(var_dd54fdb1) {
    return var_dd54fdb1.var_292e2bf1;
}

// Namespace namespace_81245006/namespace_81245006
// Params 1, eflags: 0x0
// Checksum 0x3937527f, Offset: 0xa08
// Size: 0x62
function function_26901d33(var_dd54fdb1) {
    var_dd54fdb1.var_292e2bf1 = 2;
    if (isdefined(var_dd54fdb1.activebydefault) && var_dd54fdb1.activebydefault) {
        var_dd54fdb1.var_292e2bf1 = 1;
    }
    var_dd54fdb1.health = var_dd54fdb1.maxhealth;
}

// Namespace namespace_81245006/namespace_81245006
// Params 2, eflags: 0x0
// Checksum 0xac6d75a9, Offset: 0xa78
// Size: 0x44
function function_6742b846(entity, var_dd54fdb1) {
    if (isdefined(entity.var_5ace757d)) {
        arrayremovevalue(entity.var_5ace757d, var_dd54fdb1, 0);
    }
}


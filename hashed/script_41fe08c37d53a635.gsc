// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace destructserverutils;

// Namespace destructserverutils/destructible_character
// Params 0, eflags: 0x2
// Checksum 0xe670cd45, Offset: 0x230
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"destructible_character", &__init__, undefined, undefined);
}

// Namespace destructserverutils/destructible_character
// Params 0, eflags: 0x1 linked
// Checksum 0x53f80344, Offset: 0x278
// Size: 0x47e
function __init__() {
    clientfield::register("actor", "destructible_character_state", 1, 21, "int");
    destructibles = struct::get_script_bundles("destructiblecharacterdef");
    var_da3f3104 = [];
    foreach (destructible in destructibles) {
        var_353a193 = spawnstruct();
        var_353a193.piececount = destructible.piececount;
        var_353a193.pieces = [];
        var_353a193.name = destructible.name;
        for (index = 1; index <= var_353a193.piececount; index++) {
            var_4b7e0498 = spawnstruct();
            var_4b7e0498.var_6d43549d = destructible.("piece" + index + "_gibmodel");
            var_4b7e0498.var_d241141a = destructible.("piece" + index + "_gibtag");
            var_4b7e0498.var_f1af9a8e = destructible.("piece" + index + "_gibfx");
            var_4b7e0498.var_d147aa1c = destructible.("piece" + index + "_gibeffecttag");
            var_4b7e0498.var_d4be909b = destructible.("piece" + index + "_gibdynentfx");
            var_4b7e0498.var_28882334 = destructible.("piece" + index + "_gibsound");
            var_4b7e0498.hitlocation = destructible.("piece" + index + "_hitlocation");
            var_4b7e0498.hidetag = destructible.("piece" + index + "_hidetag");
            var_4b7e0498.var_677368f4 = destructible.("piece" + index + "_detachmodel");
            var_4b7e0498.detachtag = destructible.("piece" + index + "_detachtag");
            if (isdefined(destructible.("piece" + index + "_hittags"))) {
                var_4b7e0498.hittags = [];
                foreach (var_5440c126 in destructible.("piece" + index + "_hittags")) {
                    if (!isdefined(var_4b7e0498.hittags)) {
                        var_4b7e0498.hittags = [];
                    } else if (!isarray(var_4b7e0498.hittags)) {
                        var_4b7e0498.hittags = array(var_4b7e0498.hittags);
                    }
                    var_4b7e0498.hittags[var_4b7e0498.hittags.size] = var_5440c126.hittag;
                }
            }
            var_353a193.pieces[var_353a193.pieces.size] = var_4b7e0498;
        }
        var_da3f3104[destructible.name] = var_353a193;
    }
    level.var_4f117604 = var_da3f3104;
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x5 linked
// Checksum 0x6d8f085c, Offset: 0x700
// Size: 0x20
function private _getdestructibledef(entity) {
    return level.var_4f117604[entity.destructibledef];
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x1 linked
// Checksum 0x3ba6b459, Offset: 0x728
// Size: 0x2a
function function_b9568365(entity) {
    if (isdefined(entity.var_910f2cb)) {
        return entity.var_910f2cb;
    }
    return 0;
}

// Namespace destructserverutils/destructible_character
// Params 3, eflags: 0x0
// Checksum 0x7c52e446, Offset: 0x760
// Size: 0x5c
function function_f865501b(entity, var_e9807706, var_9cea16fe) {
    entity.var_910f2cb = var_e9807706;
    togglespawngibs(entity, var_9cea16fe);
    reapplydestructedpieces(entity);
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x5 linked
// Checksum 0xe66a4bc5, Offset: 0x7c8
// Size: 0x64
function private _setdestructed(entity, var_e5c530d5) {
    entity.var_910f2cb = function_b9568365(entity) | var_e5c530d5;
    entity clientfield::set("destructible_character_state", entity.var_910f2cb);
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x1 linked
// Checksum 0xb5f16d13, Offset: 0x838
// Size: 0x64
function copydestructstate(var_1ce9f6a3, var_db6edef1) {
    var_db6edef1.var_910f2cb = function_b9568365(var_1ce9f6a3);
    togglespawngibs(var_db6edef1, 0);
    reapplydestructedpieces(var_db6edef1);
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x1 linked
// Checksum 0x890b8d2f, Offset: 0x8a8
// Size: 0xd6
function destructhitlocpieces(entity, hitloc) {
    if (isdefined(entity.destructibledef)) {
        var_353a193 = _getdestructibledef(entity);
        for (index = 1; index <= var_353a193.pieces.size; index++) {
            piece = var_353a193.pieces[index - 1];
            if (isdefined(piece.hitlocation) && piece.hitlocation == hitloc) {
                destructpiece(entity, index);
            }
        }
    }
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x1 linked
// Checksum 0x4b190092, Offset: 0x988
// Size: 0xee
function function_629a8d54(entity, hittag) {
    if (isdefined(hittag) && isdefined(entity.destructibledef)) {
        var_353a193 = _getdestructibledef(entity);
        for (index = 1; index <= var_353a193.pieces.size; index++) {
            piece = var_353a193.pieces[index - 1];
            if (isdefined(piece.hittags) && isinarray(piece.hittags, hittag)) {
                destructpiece(entity, index);
            }
        }
    }
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x1 linked
// Checksum 0xe4b9a5c9, Offset: 0xa80
// Size: 0x6c
function destructleftarmpieces(entity) {
    destructhitlocpieces(entity, "left_arm_upper");
    destructhitlocpieces(entity, "left_arm_lower");
    destructhitlocpieces(entity, "left_hand");
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x1 linked
// Checksum 0xee083db2, Offset: 0xaf8
// Size: 0x6c
function destructleftlegpieces(entity) {
    destructhitlocpieces(entity, "left_leg_upper");
    destructhitlocpieces(entity, "left_leg_lower");
    destructhitlocpieces(entity, "left_foot");
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x1 linked
// Checksum 0xd399f97a, Offset: 0xb70
// Size: 0x1b4
function destructpiece(entity, var_eb89b058) {
    /#
        /#
            assert(1 <= var_eb89b058 && var_eb89b058 <= 20);
        #/
    #/
    if (isdestructed(entity, var_eb89b058)) {
        return;
    }
    _setdestructed(entity, 1 << var_eb89b058);
    if (!isdefined(entity.destructibledef)) {
        return;
    }
    var_353a193 = _getdestructibledef(entity);
    piece = var_353a193.pieces[var_eb89b058 - 1];
    if (isdefined(piece.hidetag) && entity haspart(piece.hidetag)) {
        entity hidepart(piece.hidetag);
    }
    if (isdefined(piece.var_677368f4) && entity isattached(piece.var_677368f4)) {
        detachtag = "";
        if (isdefined(piece.detachtag)) {
            detachtag = piece.detachtag;
        }
        entity detach(piece.var_677368f4, detachtag);
    }
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x0
// Checksum 0x2d31abb5, Offset: 0xd30
// Size: 0x15e
function destructnumberrandompieces(entity, var_f7ca8453 = 0) {
    var_d47ef58 = [];
    var_b826a574 = getpiececount(entity);
    if (var_f7ca8453 == 0) {
        var_f7ca8453 = var_b826a574;
    }
    for (i = 0; i < var_b826a574; i++) {
        var_d47ef58[i] = i + 1;
    }
    var_d47ef58 = array::randomize(var_d47ef58);
    foreach (piece in var_d47ef58) {
        if (!isdestructed(entity, piece)) {
            destructpiece(entity, piece);
            var_f7ca8453--;
            if (var_f7ca8453 == 0) {
                break;
            }
        }
    }
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x0
// Checksum 0x5d68415b, Offset: 0xe98
// Size: 0x86
function destructrandompieces(entity) {
    var_2518a3aa = getpiececount(entity);
    for (index = 0; index < var_2518a3aa; index++) {
        if (math::cointoss()) {
            destructpiece(entity, index + 1);
        }
    }
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x1 linked
// Checksum 0xdb362da0, Offset: 0xf28
// Size: 0x6c
function destructrightarmpieces(entity) {
    destructhitlocpieces(entity, "right_arm_upper");
    destructhitlocpieces(entity, "right_arm_lower");
    destructhitlocpieces(entity, "right_hand");
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x1 linked
// Checksum 0x1b82aff, Offset: 0xfa0
// Size: 0x6c
function destructrightlegpieces(entity) {
    destructhitlocpieces(entity, "right_leg_upper");
    destructhitlocpieces(entity, "right_leg_lower");
    destructhitlocpieces(entity, "right_foot");
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x1 linked
// Checksum 0xdaf05b87, Offset: 0x1018
// Size: 0x56
function getpiececount(entity) {
    if (isdefined(entity.destructibledef)) {
        var_353a193 = _getdestructibledef(entity);
        if (isdefined(var_353a193)) {
            return var_353a193.piececount;
        }
    }
    return 0;
}

// Namespace destructserverutils/destructible_character
// Params 12, eflags: 0x1 linked
// Checksum 0x56e629c8, Offset: 0x1078
// Size: 0x138
function handledamage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime, var_a9e3f040, modelindex) {
    entity = self;
    if (isdefined(entity.skipdeath) && entity.skipdeath) {
        return idamage;
    }
    togglespawngibs(entity, 1);
    destructhitlocpieces(entity, shitloc);
    if (isdefined(var_a9e3f040)) {
        bonename = var_a9e3f040;
        if (!isstring(var_a9e3f040)) {
            bonename = getpartname(entity, var_a9e3f040);
        }
        if (isdefined(bonename)) {
            function_629a8d54(entity, bonename);
        }
    }
    return idamage;
}

// Namespace destructserverutils/destructible_character
// Params 3, eflags: 0x1 linked
// Checksum 0xea502b01, Offset: 0x11b8
// Size: 0xb4
function function_9885f550(entity, hitloc, var_a9e3f040) {
    togglespawngibs(entity, 1);
    destructhitlocpieces(entity, hitloc);
    if (isdefined(var_a9e3f040)) {
        bonename = var_a9e3f040;
        if (!isstring(var_a9e3f040)) {
            bonename = getpartname(entity, var_a9e3f040);
        }
        if (isdefined(bonename)) {
            function_629a8d54(entity, bonename);
        }
    }
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x1 linked
// Checksum 0x517db03, Offset: 0x1278
// Size: 0x6e
function isdestructed(entity, var_eb89b058) {
    /#
        /#
            assert(1 <= var_eb89b058 && var_eb89b058 <= 20);
        #/
    #/
    return function_b9568365(entity) & 1 << var_eb89b058;
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x1 linked
// Checksum 0x48816865, Offset: 0x12f0
// Size: 0x18e
function reapplydestructedpieces(entity) {
    if (!isdefined(entity.destructibledef)) {
        return;
    }
    var_353a193 = _getdestructibledef(entity);
    for (index = 1; index <= var_353a193.pieces.size; index++) {
        if (!isdestructed(entity, index)) {
            continue;
        }
        piece = var_353a193.pieces[index - 1];
        if (isdefined(piece.hidetag) && entity haspart(piece.hidetag)) {
            entity hidepart(piece.hidetag);
        }
        if (isdefined(piece.var_677368f4)) {
            detachtag = "";
            if (isdefined(piece.detachtag)) {
                detachtag = piece.detachtag;
            }
            if (entity isattached(piece.var_677368f4, detachtag)) {
                entity detach(piece.var_677368f4, detachtag);
            }
        }
    }
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x1 linked
// Checksum 0x5ac18bf7, Offset: 0x1488
// Size: 0xde
function showdestructedpieces(entity) {
    if (!isdefined(entity.destructibledef)) {
        return;
    }
    var_353a193 = _getdestructibledef(entity);
    for (index = 1; index <= var_353a193.pieces.size; index++) {
        piece = var_353a193.pieces[index - 1];
        if (isdefined(piece.hidetag) && entity haspart(piece.hidetag)) {
            entity showpart(piece.hidetag);
        }
    }
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x1 linked
// Checksum 0xb2e9ab0b, Offset: 0x1570
// Size: 0x94
function togglespawngibs(entity, var_519d22bc) {
    if (var_519d22bc) {
        entity.var_910f2cb = function_b9568365(entity) | 1;
    } else {
        entity.var_910f2cb = function_b9568365(entity) & -2;
    }
    entity clientfield::set("destructible_character_state", entity.var_910f2cb);
}


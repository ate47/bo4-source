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
    processedbundles = [];
    foreach (destructible in destructibles) {
        destructbundle = spawnstruct();
        destructbundle.piececount = destructible.piececount;
        destructbundle.pieces = [];
        destructbundle.name = destructible.name;
        for (index = 1; index <= destructbundle.piececount; index++) {
            piecestruct = spawnstruct();
            piecestruct.gibmodel = destructible.("piece" + index + "_gibmodel");
            piecestruct.gibtag = destructible.("piece" + index + "_gibtag");
            piecestruct.gibfx = destructible.("piece" + index + "_gibfx");
            piecestruct.gibfxtag = destructible.("piece" + index + "_gibeffecttag");
            piecestruct.gibdynentfx = destructible.("piece" + index + "_gibdynentfx");
            piecestruct.gibsound = destructible.("piece" + index + "_gibsound");
            piecestruct.hitlocation = destructible.("piece" + index + "_hitlocation");
            piecestruct.hidetag = destructible.("piece" + index + "_hidetag");
            piecestruct.detachmodel = destructible.("piece" + index + "_detachmodel");
            piecestruct.detachtag = destructible.("piece" + index + "_detachtag");
            if (isdefined(destructible.("piece" + index + "_hittags"))) {
                piecestruct.hittags = [];
                foreach (var_5440c126 in destructible.("piece" + index + "_hittags")) {
                    if (!isdefined(piecestruct.hittags)) {
                        piecestruct.hittags = [];
                    } else if (!isarray(piecestruct.hittags)) {
                        piecestruct.hittags = array(piecestruct.hittags);
                    }
                    piecestruct.hittags[piecestruct.hittags.size] = var_5440c126.hittag;
                }
            }
            destructbundle.pieces[destructbundle.pieces.size] = piecestruct;
        }
        processedbundles[destructible.name] = destructbundle;
    }
    level.destructiblecharacterdefs = processedbundles;
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x5 linked
// Checksum 0x6d8f085c, Offset: 0x700
// Size: 0x20
function private _getdestructibledef(entity) {
    return level.destructiblecharacterdefs[entity.destructibledef];
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x1 linked
// Checksum 0x3ba6b459, Offset: 0x728
// Size: 0x2a
function function_b9568365(entity) {
    if (isdefined(entity._destruct_state)) {
        return entity._destruct_state;
    }
    return 0;
}

// Namespace destructserverutils/destructible_character
// Params 3, eflags: 0x0
// Checksum 0x7c52e446, Offset: 0x760
// Size: 0x5c
function function_f865501b(entity, var_e9807706, var_9cea16fe) {
    entity._destruct_state = var_e9807706;
    togglespawngibs(entity, var_9cea16fe);
    reapplydestructedpieces(entity);
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x5 linked
// Checksum 0xe66a4bc5, Offset: 0x7c8
// Size: 0x64
function private _setdestructed(entity, destructflag) {
    entity._destruct_state = function_b9568365(entity) | destructflag;
    entity clientfield::set("destructible_character_state", entity._destruct_state);
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x1 linked
// Checksum 0xb5f16d13, Offset: 0x838
// Size: 0x64
function copydestructstate(originalentity, newentity) {
    newentity._destruct_state = function_b9568365(originalentity);
    togglespawngibs(newentity, 0);
    reapplydestructedpieces(newentity);
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x1 linked
// Checksum 0x890b8d2f, Offset: 0x8a8
// Size: 0xd6
function destructhitlocpieces(entity, hitloc) {
    if (isdefined(entity.destructibledef)) {
        destructbundle = _getdestructibledef(entity);
        for (index = 1; index <= destructbundle.pieces.size; index++) {
            piece = destructbundle.pieces[index - 1];
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
        destructbundle = _getdestructibledef(entity);
        for (index = 1; index <= destructbundle.pieces.size; index++) {
            piece = destructbundle.pieces[index - 1];
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
function destructpiece(entity, piecenumber) {
    /#
        /#
            assert(1 <= piecenumber && piecenumber <= 20);
        #/
    #/
    if (isdestructed(entity, piecenumber)) {
        return;
    }
    _setdestructed(entity, 1 << piecenumber);
    if (!isdefined(entity.destructibledef)) {
        return;
    }
    destructbundle = _getdestructibledef(entity);
    piece = destructbundle.pieces[piecenumber - 1];
    if (isdefined(piece.hidetag) && entity haspart(piece.hidetag)) {
        entity hidepart(piece.hidetag);
    }
    if (isdefined(piece.detachmodel) && entity isattached(piece.detachmodel)) {
        detachtag = "";
        if (isdefined(piece.detachtag)) {
            detachtag = piece.detachtag;
        }
        entity detach(piece.detachmodel, detachtag);
    }
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x0
// Checksum 0x2d31abb5, Offset: 0xd30
// Size: 0x15e
function destructnumberrandompieces(entity, num_pieces_to_destruct = 0) {
    destructible_pieces_list = [];
    destructablepieces = getpiececount(entity);
    if (num_pieces_to_destruct == 0) {
        num_pieces_to_destruct = destructablepieces;
    }
    for (i = 0; i < destructablepieces; i++) {
        destructible_pieces_list[i] = i + 1;
    }
    destructible_pieces_list = array::randomize(destructible_pieces_list);
    foreach (piece in destructible_pieces_list) {
        if (!isdestructed(entity, piece)) {
            destructpiece(entity, piece);
            num_pieces_to_destruct--;
            if (num_pieces_to_destruct == 0) {
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
    destructpieces = getpiececount(entity);
    for (index = 0; index < destructpieces; index++) {
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
        destructbundle = _getdestructibledef(entity);
        if (isdefined(destructbundle)) {
            return destructbundle.piececount;
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
function isdestructed(entity, piecenumber) {
    /#
        /#
            assert(1 <= piecenumber && piecenumber <= 20);
        #/
    #/
    return function_b9568365(entity) & 1 << piecenumber;
}

// Namespace destructserverutils/destructible_character
// Params 1, eflags: 0x1 linked
// Checksum 0x48816865, Offset: 0x12f0
// Size: 0x18e
function reapplydestructedpieces(entity) {
    if (!isdefined(entity.destructibledef)) {
        return;
    }
    destructbundle = _getdestructibledef(entity);
    for (index = 1; index <= destructbundle.pieces.size; index++) {
        if (!isdestructed(entity, index)) {
            continue;
        }
        piece = destructbundle.pieces[index - 1];
        if (isdefined(piece.hidetag) && entity haspart(piece.hidetag)) {
            entity hidepart(piece.hidetag);
        }
        if (isdefined(piece.detachmodel)) {
            detachtag = "";
            if (isdefined(piece.detachtag)) {
                detachtag = piece.detachtag;
            }
            if (entity isattached(piece.detachmodel, detachtag)) {
                entity detach(piece.detachmodel, detachtag);
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
    destructbundle = _getdestructibledef(entity);
    for (index = 1; index <= destructbundle.pieces.size; index++) {
        piece = destructbundle.pieces[index - 1];
        if (isdefined(piece.hidetag) && entity haspart(piece.hidetag)) {
            entity showpart(piece.hidetag);
        }
    }
}

// Namespace destructserverutils/destructible_character
// Params 2, eflags: 0x1 linked
// Checksum 0xb2e9ab0b, Offset: 0x1570
// Size: 0x94
function togglespawngibs(entity, shouldspawngibs) {
    if (shouldspawngibs) {
        entity._destruct_state = function_b9568365(entity) | 1;
    } else {
        entity._destruct_state = function_b9568365(entity) & -2;
    }
    entity clientfield::set("destructible_character_state", entity._destruct_state);
}


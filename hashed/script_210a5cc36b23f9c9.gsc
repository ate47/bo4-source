// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include script_14d2d89964cae0b1;
#include scripts/core_common/struct.csc;

#namespace destructclientutils;

// Namespace destructclientutils/destructible_character
// Params 0, eflags: 0x2
// Checksum 0x7d958756, Offset: 0x190
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"destructible_character", &__init__, undefined, undefined);
}

// Namespace destructclientutils/destructible_character
// Params 0, eflags: 0x1 linked
// Checksum 0x7df6ee6, Offset: 0x1d8
// Size: 0x5e6
function __init__() {
    clientfield::register("actor", "destructible_character_state", 1, 21, "int", &_destructhandler, 0, 0);
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
            if (isdefined(destructible.("piece" + index + "_gibdirX")) || isdefined(destructible.("piece" + index + "_gibdirY")) || isdefined(destructible.("piece" + index + "_gibdirZ"))) {
                var_4b7e0498.var_f7ac0901 = (isdefined(destructible.("piece" + index + "_gibdirX")) ? destructible.("piece" + index + "_gibdirX") : 0, isdefined(destructible.("piece" + index + "_gibdirY")) ? destructible.("piece" + index + "_gibdirY") : 0, isdefined(destructible.("piece" + index + "_gibdirZ")) ? destructible.("piece" + index + "_gibdirZ") : 0);
            }
            var_4b7e0498.gibdirscale = destructible.("piece" + index + "_gibdirscale");
            var_4b7e0498.var_d4be909b = destructible.("piece" + index + "_gibdynentfx");
            var_4b7e0498.var_28882334 = destructible.("piece" + index + "_gibsound");
            var_4b7e0498.hitlocation = destructible.("piece" + index + "_hitlocation");
            var_4b7e0498.hidetag = destructible.("piece" + index + "_hidetag");
            var_4b7e0498.var_677368f4 = destructible.("piece" + index + "_detachmodel");
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

// Namespace destructclientutils/destructible_character
// Params 1, eflags: 0x5 linked
// Checksum 0xdfc01cd2, Offset: 0x7c8
// Size: 0x20
function private _getdestructibledef(entity) {
    return level.var_4f117604[entity.destructibledef];
}

// Namespace destructclientutils/destructible_character
// Params 7, eflags: 0x5 linked
// Checksum 0x34c99393, Offset: 0x7f0
// Size: 0x14a
function private _destructhandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (!util::is_mature() || util::is_gib_restricted_build()) {
        return;
    }
    entity = self;
    var_27d02d91 = oldvalue ^ newvalue;
    var_519d22bc = newvalue & 1;
    if (bnewent) {
        var_27d02d91 = 0 ^ newvalue;
    }
    if (!isdefined(entity.destructibledef)) {
        return;
    }
    var_76aaf053 = 2;
    for (var_eb89b058 = 1; var_27d02d91 >= var_76aaf053; var_eb89b058++) {
        if (var_27d02d91 & var_76aaf053) {
            _destructpiece(localclientnum, entity, var_eb89b058, var_519d22bc);
        }
        var_76aaf053 = var_76aaf053 << 1;
    }
    entity.var_910f2cb = newvalue;
}

// Namespace destructclientutils/destructible_character
// Params 4, eflags: 0x5 linked
// Checksum 0xc3560f21, Offset: 0x948
// Size: 0x1bc
function private _destructpiece(localclientnum, entity, var_eb89b058, var_519d22bc) {
    if (!isdefined(entity.destructibledef)) {
        return;
    }
    var_353a193 = _getdestructibledef(entity);
    piece = var_353a193.pieces[var_eb89b058 - 1];
    if (isdefined(piece)) {
        if (var_519d22bc) {
            gibclientutils::_playgibfx(localclientnum, entity, piece.var_f1af9a8e, piece.var_d147aa1c);
            entity thread gibclientutils::_gibpiece(localclientnum, entity, piece.var_6d43549d, piece.var_d241141a, piece.var_d4be909b, piece.var_f7ac0901, piece.gibdirscale, 1 | 2 | 4);
            gibclientutils::_playgibsound(localclientnum, entity, piece.var_28882334);
        } else if (isdefined(piece.var_f1af9a8e) && function_9229eb67(piece.var_f1af9a8e)) {
            gibclientutils::_playgibfx(localclientnum, entity, piece.var_f1af9a8e, piece.var_d147aa1c);
        }
        _handledestructcallbacks(localclientnum, entity, var_eb89b058);
    }
}

// Namespace destructclientutils/destructible_character
// Params 2, eflags: 0x5 linked
// Checksum 0x891330c4, Offset: 0xb10
// Size: 0x32
function private _getdestructstate(localclientnum, entity) {
    if (isdefined(entity.var_910f2cb)) {
        return entity.var_910f2cb;
    }
    return 0;
}

// Namespace destructclientutils/destructible_character
// Params 3, eflags: 0x5 linked
// Checksum 0x7ea628b8, Offset: 0xb50
// Size: 0xd8
function private _handledestructcallbacks(localclientnum, entity, var_eb89b058) {
    if (isdefined(entity.var_3789a5f0) && isdefined(entity.var_3789a5f0[var_eb89b058])) {
        foreach (callback in entity.var_3789a5f0[var_eb89b058]) {
            if (isfunctionptr(callback)) {
                [[ callback ]](localclientnum, entity, var_eb89b058);
            }
        }
    }
}

// Namespace destructclientutils/destructible_character
// Params 4, eflags: 0x1 linked
// Checksum 0x311f091f, Offset: 0xc30
// Size: 0xde
function adddestructpiececallback(localclientnum, entity, var_eb89b058, callbackfunction) {
    /#
        assert(isfunctionptr(callbackfunction));
    #/
    if (!isdefined(entity.var_3789a5f0)) {
        entity.var_3789a5f0 = [];
    }
    if (!isdefined(entity.var_3789a5f0[var_eb89b058])) {
        entity.var_3789a5f0[var_eb89b058] = [];
    }
    var_dbd41965 = entity.var_3789a5f0[var_eb89b058];
    var_dbd41965[var_dbd41965.size] = callbackfunction;
    entity.var_3789a5f0[var_eb89b058] = var_dbd41965;
}

// Namespace destructclientutils/destructible_character
// Params 3, eflags: 0x1 linked
// Checksum 0xa7c142ca, Offset: 0xd18
// Size: 0x3e
function ispiecedestructed(localclientnum, entity, var_eb89b058) {
    return _getdestructstate(localclientnum, entity) & 1 << var_eb89b058;
}


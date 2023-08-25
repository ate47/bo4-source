// Atian COD Tools GSC decompiler test
#include script_14d2d89964cae0b1;
#include script_210a5cc36b23f9c9;
#include scripts/core_common/struct.csc;

#namespace fx_character;

// Namespace fx_character/fx_character
// Params 0, eflags: 0x2
// Checksum 0xd2fae3c5, Offset: 0xd8
// Size: 0x262
function autoexec main() {
    fxbundles = struct::get_script_bundles("fxcharacterdef");
    processedfxbundles = [];
    foreach (fxbundle in fxbundles) {
        processedfxbundle = spawnstruct();
        processedfxbundle.var_225b8a64 = fxbundle.var_225b8a64;
        processedfxbundle.fx = [];
        processedfxbundle.name = fxbundle.name;
        for (index = 1; index <= fxbundle.var_225b8a64; index++) {
            fx = fxbundle.("effect" + index + "_fx");
            if (isdefined(fx)) {
                fxstruct = spawnstruct();
                fxstruct.attachtag = fxbundle.("effect" + index + "_attachtag");
                fxstruct.fx = fxbundle.("effect" + index + "_fx");
                fxstruct.var_ffe1aa63 = fxclientutils::_gibpartnametogibflag(fxbundle.("effect" + index + "_stopongib"));
                fxstruct.var_a48ef4f2 = fxbundle.("effect" + index + "_stoponpiecedestroyed");
                processedfxbundle.fx[processedfxbundle.fx.size] = fxstruct;
            }
        }
        processedfxbundles[fxbundle.name] = processedfxbundle;
    }
    level.var_49f00166 = processedfxbundles;
}

#namespace fxclientutils;

// Namespace fxclientutils/fx_character
// Params 1, eflags: 0x5 linked
// Checksum 0x6ceaacfd, Offset: 0x348
// Size: 0x1c
function private _getfxbundle(name) {
    return level.var_49f00166[name];
}

// Namespace fxclientutils/fx_character
// Params 2, eflags: 0x5 linked
// Checksum 0x984f35b3, Offset: 0x370
// Size: 0x13e
function private _configentity(localclientnum, entity) {
    if (!isdefined(entity.var_24996eec)) {
        entity.var_24996eec = [];
        handledgibs = array(8, 16, 32, 128, 256);
        foreach (gibflag in handledgibs) {
            gibclientutils::addgibcallback(localclientnum, entity, gibflag, &_gibhandler);
        }
        for (index = 1; index <= 20; index++) {
            destructclientutils::adddestructpiececallback(localclientnum, entity, index, &_destructhandler);
        }
    }
}

// Namespace fxclientutils/fx_character
// Params 3, eflags: 0x5 linked
// Checksum 0xc1286e00, Offset: 0x4b8
// Size: 0x13c
function private _destructhandler(localclientnum, entity, piecenumber) {
    if (!isdefined(entity.var_24996eec)) {
        return;
    }
    foreach (var_9a11879, fxbundleinst in entity.var_24996eec) {
        fxbundle = _getfxbundle(var_9a11879);
        for (index = 0; index < fxbundle.fx.size; index++) {
            if (isdefined(fxbundleinst[index]) && fxbundle.fx[index].var_a48ef4f2 === piecenumber) {
                stopfx(localclientnum, fxbundleinst[index]);
                index = [];
            }
        }
    }
}

// Namespace fxclientutils/fx_character
// Params 3, eflags: 0x5 linked
// Checksum 0x7e7bf27a, Offset: 0x600
// Size: 0x13c
function private _gibhandler(localclientnum, entity, gibflag) {
    if (!isdefined(entity.var_24996eec)) {
        return;
    }
    foreach (var_9a11879, fxbundleinst in entity.var_24996eec) {
        fxbundle = _getfxbundle(var_9a11879);
        for (index = 0; index < fxbundle.fx.size; index++) {
            if (isdefined(fxbundleinst[index]) && fxbundle.fx[index].var_ffe1aa63 === gibflag) {
                stopfx(localclientnum, fxbundleinst[index]);
                index = [];
            }
        }
    }
}

// Namespace fxclientutils/fx_character
// Params 1, eflags: 0x5 linked
// Checksum 0x8d4f59bb, Offset: 0x748
// Size: 0x92
function private _gibpartnametogibflag(var_56d1da4f) {
    if (isdefined(var_56d1da4f)) {
        switch (var_56d1da4f) {
        case #"head":
            return 8;
        case #"right arm":
            return 16;
        case #"left arm":
            return 32;
        case #"right leg":
            return 128;
        case #"left leg":
            return 256;
            break;
        }
    }
}

// Namespace fxclientutils/fx_character
// Params 3, eflags: 0x5 linked
// Checksum 0x8353b5db, Offset: 0x7e8
// Size: 0x42
function private _isgibbed(localclientnum, entity, var_f72ce8a6) {
    if (!isdefined(var_f72ce8a6)) {
        return 0;
    }
    return gibclientutils::isgibbed(localclientnum, entity, var_f72ce8a6);
}

// Namespace fxclientutils/fx_character
// Params 3, eflags: 0x5 linked
// Checksum 0x1d9b8899, Offset: 0x838
// Size: 0x42
function private _ispiecedestructed(localclientnum, entity, var_a48ef4f2) {
    if (!isdefined(var_a48ef4f2)) {
        return 0;
    }
    return destructclientutils::ispiecedestructed(localclientnum, entity, var_a48ef4f2);
}

// Namespace fxclientutils/fx_character
// Params 3, eflags: 0x5 linked
// Checksum 0xdc423e9c, Offset: 0x888
// Size: 0x6e
function private _shouldplayfx(localclientnum, entity, fxstruct) {
    if (_isgibbed(localclientnum, entity, fxstruct.var_ffe1aa63)) {
        return 0;
    }
    if (_ispiecedestructed(localclientnum, entity, fxstruct.var_a48ef4f2)) {
        return 0;
    }
    return 1;
}

// Namespace fxclientutils/fx_character
// Params 3, eflags: 0x1 linked
// Checksum 0x3c1d0ce1, Offset: 0x900
// Size: 0x162
function playfxbundle(localclientnum, entity, var_25e6d719) {
    if (!isdefined(var_25e6d719)) {
        return;
    }
    _configentity(localclientnum, entity);
    fxbundle = _getfxbundle(var_25e6d719);
    if (isdefined(entity.var_24996eec[fxbundle.name])) {
        return;
    }
    if (isdefined(fxbundle)) {
        playingfx = [];
        for (index = 0; index < fxbundle.fx.size; index++) {
            fxstruct = fxbundle.fx[index];
            if (_shouldplayfx(localclientnum, entity, fxstruct)) {
                playingfx[index] = gibclientutils::_playgibfx(localclientnum, entity, fxstruct.fx, fxstruct.attachtag);
            }
        }
        if (playingfx.size > 0) {
            entity.var_24996eec[fxbundle.name] = playingfx;
        }
    }
}

// Namespace fxclientutils/fx_character
// Params 2, eflags: 0x0
// Checksum 0xc73d9195, Offset: 0xa70
// Size: 0x128
function stopallfxbundles(localclientnum, entity) {
    _configentity(localclientnum, entity);
    fxbundlenames = [];
    foreach (var_9a11879, fxbundle in entity.var_24996eec) {
        fxbundlenames[fxbundlenames.size] = var_9a11879;
    }
    foreach (var_9a11879 in fxbundlenames) {
        stopfxbundle(localclientnum, entity, var_9a11879);
    }
}

// Namespace fxclientutils/fx_character
// Params 3, eflags: 0x1 linked
// Checksum 0x1bf37b19, Offset: 0xba0
// Size: 0x128
function stopfxbundle(localclientnum, entity, var_25e6d719) {
    if (!isdefined(var_25e6d719)) {
        return;
    }
    _configentity(localclientnum, entity);
    fxbundle = _getfxbundle(var_25e6d719);
    if (isdefined(entity.var_24996eec[fxbundle.name])) {
        foreach (fx in entity.var_24996eec[fxbundle.name]) {
            if (isdefined(fx)) {
                stopfx(localclientnum, fx);
            }
        }
        fxbundle.name = [];
    }
}

// Namespace fxclientutils/fx_character
// Params 3, eflags: 0x1 linked
// Checksum 0xa8ca9a66, Offset: 0xcd0
// Size: 0x128
function function_ae92446(localclientnum, entity, var_25e6d719) {
    if (!isdefined(var_25e6d719)) {
        return;
    }
    _configentity(localclientnum, entity);
    fxbundle = _getfxbundle(var_25e6d719);
    if (isdefined(entity.var_24996eec[fxbundle.name])) {
        foreach (fx in entity.var_24996eec[fxbundle.name]) {
            if (isdefined(fx)) {
                killfx(localclientnum, fx);
            }
        }
        fxbundle.name = [];
    }
}


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
    var_281824cf = struct::get_script_bundles("fxcharacterdef");
    var_a2b21804 = [];
    foreach (var_ff2bc026 in var_281824cf) {
        var_deb729a3 = spawnstruct();
        var_deb729a3.var_225b8a64 = var_ff2bc026.var_225b8a64;
        var_deb729a3.fx = [];
        var_deb729a3.name = var_ff2bc026.name;
        for (index = 1; index <= var_ff2bc026.var_225b8a64; index++) {
            fx = var_ff2bc026.("effect" + index + "_fx");
            if (isdefined(fx)) {
                var_59df668a = spawnstruct();
                var_59df668a.attachtag = var_ff2bc026.("effect" + index + "_attachtag");
                var_59df668a.fx = var_ff2bc026.("effect" + index + "_fx");
                var_59df668a.var_ffe1aa63 = fxclientutils::_gibpartnametogibflag(var_ff2bc026.("effect" + index + "_stopongib"));
                var_59df668a.var_a48ef4f2 = var_ff2bc026.("effect" + index + "_stoponpiecedestroyed");
                var_deb729a3.fx[var_deb729a3.fx.size] = var_59df668a;
            }
        }
        var_a2b21804[var_ff2bc026.name] = var_deb729a3;
    }
    level.var_49f00166 = var_a2b21804;
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
        var_ac3b1903 = array(8, 16, 32, 128, 256);
        foreach (gibflag in var_ac3b1903) {
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
function private _destructhandler(localclientnum, entity, var_eb89b058) {
    if (!isdefined(entity.var_24996eec)) {
        return;
    }
    foreach (var_9a11879, var_2759fed2 in entity.var_24996eec) {
        var_ff2bc026 = _getfxbundle(var_9a11879);
        for (index = 0; index < var_ff2bc026.fx.size; index++) {
            if (isdefined(var_2759fed2[index]) && var_ff2bc026.fx[index].var_a48ef4f2 === var_eb89b058) {
                stopfx(localclientnum, var_2759fed2[index]);
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
    foreach (var_9a11879, var_2759fed2 in entity.var_24996eec) {
        var_ff2bc026 = _getfxbundle(var_9a11879);
        for (index = 0; index < var_ff2bc026.fx.size; index++) {
            if (isdefined(var_2759fed2[index]) && var_ff2bc026.fx[index].var_ffe1aa63 === gibflag) {
                stopfx(localclientnum, var_2759fed2[index]);
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
function private _shouldplayfx(localclientnum, entity, var_59df668a) {
    if (_isgibbed(localclientnum, entity, var_59df668a.var_ffe1aa63)) {
        return 0;
    }
    if (_ispiecedestructed(localclientnum, entity, var_59df668a.var_a48ef4f2)) {
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
    var_ff2bc026 = _getfxbundle(var_25e6d719);
    if (isdefined(entity.var_24996eec[var_ff2bc026.name])) {
        return;
    }
    if (isdefined(var_ff2bc026)) {
        var_9e29217 = [];
        for (index = 0; index < var_ff2bc026.fx.size; index++) {
            var_59df668a = var_ff2bc026.fx[index];
            if (_shouldplayfx(localclientnum, entity, var_59df668a)) {
                var_9e29217[index] = gibclientutils::_playgibfx(localclientnum, entity, var_59df668a.fx, var_59df668a.attachtag);
            }
        }
        if (var_9e29217.size > 0) {
            entity.var_24996eec[var_ff2bc026.name] = var_9e29217;
        }
    }
}

// Namespace fxclientutils/fx_character
// Params 2, eflags: 0x0
// Checksum 0xc73d9195, Offset: 0xa70
// Size: 0x128
function stopallfxbundles(localclientnum, entity) {
    _configentity(localclientnum, entity);
    var_c0f7e0f2 = [];
    foreach (var_9a11879, var_ff2bc026 in entity.var_24996eec) {
        var_c0f7e0f2[var_c0f7e0f2.size] = var_9a11879;
    }
    foreach (var_9a11879 in var_c0f7e0f2) {
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
    var_ff2bc026 = _getfxbundle(var_25e6d719);
    if (isdefined(entity.var_24996eec[var_ff2bc026.name])) {
        foreach (fx in entity.var_24996eec[var_ff2bc026.name]) {
            if (isdefined(fx)) {
                stopfx(localclientnum, fx);
            }
        }
        var_ff2bc026.name = [];
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
    var_ff2bc026 = _getfxbundle(var_25e6d719);
    if (isdefined(entity.var_24996eec[var_ff2bc026.name])) {
        foreach (fx in entity.var_24996eec[var_ff2bc026.name]) {
            if (isdefined(fx)) {
                killfx(localclientnum, fx);
            }
        }
        var_ff2bc026.name = [];
    }
}


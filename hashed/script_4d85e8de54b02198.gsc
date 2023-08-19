// Atian COD Tools GSC decompiler test
#namespace animationstatenetwork;

// Namespace animationstatenetwork/namespace_be72ce55
// Params 0, eflags: 0x2
// Checksum 0x353c801f, Offset: 0x68
// Size: 0x12
function autoexec initnotetrackhandler() {
    level.var_995d938f = [];
}

// Namespace animationstatenetwork/runnotetrackhandler
// Params 1, eflags: 0x44
// Checksum 0x95594d17, Offset: 0x88
// Size: 0x96
function event<runnotetrackhandler> private runnotetrackhandler(eventstruct) {
    /#
        assert(isarray(eventstruct.notetracks));
    #/
    for (index = 0; index < eventstruct.notetracks.size; index++) {
        handlenotetrack(eventstruct.entity, eventstruct.notetracks[index]);
    }
}

// Namespace animationstatenetwork/namespace_be72ce55
// Params 2, eflags: 0x5 linked
// Checksum 0xc6ddb474, Offset: 0x128
// Size: 0x8c
function private handlenotetrack(entity, notetrack) {
    var_6b80b5f7 = level.var_995d938f[notetrack];
    if (!isdefined(var_6b80b5f7)) {
        return;
    }
    if (isfunctionptr(var_6b80b5f7)) {
        [[ var_6b80b5f7 ]](entity);
    } else {
        entity setblackboardattribute(var_6b80b5f7.var_71359b2a, var_6b80b5f7.var_63aa7f39);
    }
}

// Namespace animationstatenetwork/namespace_be72ce55
// Params 2, eflags: 0x1 linked
// Checksum 0x8abf809f, Offset: 0x1c0
// Size: 0xca
function registernotetrackhandlerfunction(var_455f12d0, var_f01620bd) {
    /#
        assert(isstring(var_455f12d0), "<unknown string>");
    #/
    /#
        assert(isfunctionptr(var_f01620bd), "<unknown string>");
    #/
    /#
        assert(!isdefined(level.var_995d938f[var_455f12d0]), "<unknown string>" + var_455f12d0 + "<unknown string>");
    #/
    level.var_995d938f[var_455f12d0] = var_f01620bd;
}

// Namespace animationstatenetwork/namespace_be72ce55
// Params 3, eflags: 0x1 linked
// Checksum 0x76200bf7, Offset: 0x298
// Size: 0x6e
function registerblackboardnotetrackhandler(var_455f12d0, var_71359b2a, var_63aa7f39) {
    var_6b80b5f7 = spawnstruct();
    var_6b80b5f7.var_71359b2a = var_71359b2a;
    var_6b80b5f7.var_63aa7f39 = var_63aa7f39;
    level.var_995d938f[var_455f12d0] = var_6b80b5f7;
}


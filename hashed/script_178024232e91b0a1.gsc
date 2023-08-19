// Atian COD Tools GSC decompiler test
#namespace behaviorstatemachine;

// Namespace behaviorstatemachine/namespace_3c8abf03
// Params 2, eflags: 0x1 linked
// Checksum 0x8a655ff4, Offset: 0x68
// Size: 0xa2
function registerbsmscriptapiinternal(functionname, var_c259d218) {
    if (!isdefined(level._bsmscriptfunctions)) {
        level._bsmscriptfunctions = [];
    }
    /#
        assert(isdefined(var_c259d218) && isdefined(var_c259d218), "<unknown string>");
    #/
    /#
        assert(!isdefined(level._bsmscriptfunctions[functionname]), "<unknown string>");
    #/
    level._bsmscriptfunctions[functionname] = var_c259d218;
}


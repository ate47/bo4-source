// Atian COD Tools GSC decompiler test
#namespace map;

// Namespace map/map
// Params 0, eflags: 0x1 linked
// Checksum 0x849ae33a, Offset: 0x68
// Size: 0x14
function init() {
    get_script_bundle();
}

// Namespace map/map
// Params 0, eflags: 0x1 linked
// Checksum 0x91f6b334, Offset: 0x88
// Size: 0x6e
function get_script_bundle() {
    if (!isdefined(level.var_427d6976)) {
        level.var_427d6976 = function_2717b55f();
    }
    if (!isdefined(level.var_427d6976)) {
        level.var_179eaba8 = 1;
        level.var_427d6976 = {};
    } else {
        level.var_179eaba8 = 0;
    }
    return level.var_427d6976;
}

// Namespace map/map
// Params 0, eflags: 0x0
// Checksum 0x2d270f97, Offset: 0x100
// Size: 0x2a
function is_default() {
    if (!isdefined(level.var_179eaba8)) {
        level.var_179eaba8 = 1;
    }
    return level.var_179eaba8;
}


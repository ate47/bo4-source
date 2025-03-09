#namespace namespace_eb06e24d;

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 0, eflags: 0x0
// Checksum 0x23cd3253, Offset: 0x68
// Size: 0x86
function get_jumpkits() {
    if (!isdefined(level.var_aadba305)) {
        level.var_aadba305 = isdefined(getscriptbundlelist(#"jumpkits")) ? getscriptbundlelist(#"jumpkits") : array();
    }
    return level.var_aadba305;
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 0, eflags: 0x0
// Checksum 0xd72943af, Offset: 0xf8
// Size: 0x14
function function_3045dd71() {
    return get_jumpkits().size;
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 1, eflags: 0x0
// Checksum 0xd1dbd111, Offset: 0x118
// Size: 0xb2
function function_550c6257(var_ff60755f) {
    jumpkits = get_jumpkits();
    assert(jumpkits.size > 0);
    assert(isdefined(jumpkits[0]));
    if (var_ff60755f < 0 || var_ff60755f >= jumpkits.size || !isdefined(jumpkits[var_ff60755f])) {
        var_ff60755f = 0;
    }
    return getscriptbundle(jumpkits[var_ff60755f]);
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 1, eflags: 0x0
// Checksum 0xdc44d8ee, Offset: 0x1d8
// Size: 0x4a
function function_83a2cad4(index) {
    kit = function_550c6257(index);
    return getscriptbundle(kit.parachute);
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 1, eflags: 0x0
// Checksum 0x3caf0c87, Offset: 0x230
// Size: 0x4a
function function_aa3a05b1(index) {
    kit = function_550c6257(index);
    return getscriptbundle(kit.wingsuit);
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 1, eflags: 0x0
// Checksum 0xc3dc3ad0, Offset: 0x288
// Size: 0x4a
function function_6452f9c5(index) {
    kit = function_550c6257(index);
    return getscriptbundle(kit.var_4fa85a25);
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 0, eflags: 0x4
// Checksum 0xdca470b8, Offset: 0x2e0
// Size: 0x9a
function private function_c72eb508() {
    if (isdefined(self.var_9f20891)) {
        return self.var_9f20891;
    }
    count = function_3045dd71();
    seed = self getentitynumber() + (isdefined(level.item_spawn_seed) ? level.item_spawn_seed : 0);
    self.var_9f20891 = function_d59c2d03(count, seed);
    return self.var_9f20891;
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 1, eflags: 0x4
// Checksum 0xe520b8a2, Offset: 0x388
// Size: 0x152
function private function_37ae175b(type) {
    /#
        if (getdvarint(#"hash_9003cbb3abd93b7", 0) != 0) {
            count = function_3045dd71();
            return int(max(0, min(count, getdvarint(#"hash_9003cbb3abd93b7", 0) - 1)));
        }
        if (getdvarint(#"hash_6c79f9280f28fabe", 0) != 0) {
            return self function_c72eb508();
        }
    #/
    if (isbot(self)) {
        return self function_c72eb508();
    }
    var_5c27e968 = self function_7d5a3c48(currentsessionmode(), type);
    return var_5c27e968;
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 0, eflags: 0x0
// Checksum 0xbc068a18, Offset: 0x4e8
// Size: 0x2a
function get_parachute() {
    return function_83a2cad4(self function_37ae175b(0));
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 0, eflags: 0x0
// Checksum 0xa2df4c5a, Offset: 0x520
// Size: 0x2a
function get_parachute_kit() {
    return function_550c6257(self function_37ae175b(0));
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 0, eflags: 0x0
// Checksum 0xad7fdae, Offset: 0x558
// Size: 0x2a
function get_wingsuit() {
    return function_aa3a05b1(self function_37ae175b(2));
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 0, eflags: 0x0
// Checksum 0x787faa39, Offset: 0x590
// Size: 0x2a
function get_wingsuit_kit() {
    return function_550c6257(self function_37ae175b(2));
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 0, eflags: 0x0
// Checksum 0x59e7f649, Offset: 0x5c8
// Size: 0x2a
function get_trailfx() {
    return function_6452f9c5(self function_37ae175b(1));
}

// Namespace namespace_eb06e24d/namespace_eb06e24d
// Params 0, eflags: 0x0
// Checksum 0x5d7fc7e8, Offset: 0x600
// Size: 0x2a
function function_4a39b434() {
    return function_550c6257(self function_37ae175b(1));
}


// Atian COD Tools GSC decompiler test
#using scripts\core_common\flagsys_shared.gsc;

#namespace item_world_fixup;

// Namespace item_world_fixup/item_world_fixup
// Params 0, eflags: 0x2
// Checksum 0xc666ad10, Offset: 0x78
// Size: 0x66
function autoexec __init__() {
    level.itemreplacement = [];
    level.var_ee46a98d = [];
    level.var_ee110db8 = [];
    level.var_db0e7b82 = [];
    level.var_93c59949 = [];
    level.var_1d777960 = [];
    level.var_bf9b06d3 = [];
    level.var_8d50adaa = [];
}

// Namespace item_world_fixup/item_world_fixup
// Params 3, eflags: 0x4
// Checksum 0x42de1ee3, Offset: 0xe8
// Size: 0xe4
function private function_59c1a869(&replacementarray, var_d1c21f6f, var_b06dd57e) {
    if (!function_bbc0b67f(0)) {
        return;
    }
    if (!ishash(var_d1c21f6f) || !ishash(var_b06dd57e)) {
        assert(0);
        return;
    }
    assert(!isdefined(replacementarray[var_d1c21f6f]));
    if (isdefined(replacementarray[var_d1c21f6f])) {
        return;
    }
    /#
        function_d50342ad(var_b06dd57e);
    #/
    replacementarray[var_d1c21f6f] = var_b06dd57e;
}

// Namespace item_world_fixup/item_world_fixup
// Params 3, eflags: 0x4
// Checksum 0x5a18efc2, Offset: 0x1d8
// Size: 0x10c
function private function_41015db1(&replacementarray, itemname, replacementitemname) {
    if (!function_bbc0b67f(0)) {
        return;
    }
    if (!ishash(itemname) || !ishash(replacementitemname)) {
        assert(0);
        return;
    }
    assert(!isdefined(replacementarray[itemname]));
    if (isdefined(replacementarray[itemname])) {
        return;
    }
    if (replacementitemname == #"") {
        replacementitemname = "";
    }
    /#
        function_cd5f2152(replacementitemname);
    #/
    replacementarray[itemname] = replacementitemname;
}

// Namespace item_world_fixup/item_world_fixup
// Params 1, eflags: 0x4
// Checksum 0x81663dae, Offset: 0x2f0
// Size: 0x94
function private function_bbc0b67f(prematch = 0) {
    if (prematch) {
        flag = #"hash_11c9cde7b522c5a9";
    } else {
        flag = #"hash_67b445a4b1d59922";
    }
    if (level flagsys::get(flag)) {
        assert(0, "<unknown string>");
        return false;
    }
    return true;
}

/#

    // Namespace item_world_fixup/item_world_fixup
    // Params 1, eflags: 0x4
    // Checksum 0x2badf7e7, Offset: 0x390
    // Size: 0x22
    function private function_cd5f2152(itemname) {
        if (itemname == "<unknown string>") {
            return;
        }
    }

    // Namespace item_world_fixup/item_world_fixup
    // Params 1, eflags: 0x4
    // Checksum 0x36be93cb, Offset: 0x3c0
    // Size: 0x22
    function private function_d50342ad(var_d1c21f6f) {
        if (var_d1c21f6f == "<unknown string>") {
            return;
        }
    }

#/

// Namespace item_world_fixup/item_world_fixup
// Params 2, eflags: 0x0
// Checksum 0x459646ee, Offset: 0x3f0
// Size: 0x34
function function_6991057(var_d1c21f6f, var_b06dd57e) {
    function_59c1a869(level.var_ee110db8, var_d1c21f6f, var_b06dd57e);
}

// Namespace item_world_fixup/item_world_fixup
// Params 2, eflags: 0x0
// Checksum 0x841f204, Offset: 0x430
// Size: 0x34
function function_19089c75(var_d1c21f6f, var_b06dd57e) {
    function_59c1a869(level.var_db0e7b82, var_d1c21f6f, var_b06dd57e);
}

// Namespace item_world_fixup/item_world_fixup
// Params 2, eflags: 0x0
// Checksum 0x7524245d, Offset: 0x470
// Size: 0x34
function add_item_replacement(itemname, replacementitemname) {
    function_41015db1(level.itemreplacement, itemname, replacementitemname);
}

// Namespace item_world_fixup/item_world_fixup
// Params 2, eflags: 0x0
// Checksum 0xe7a56c32, Offset: 0x4b0
// Size: 0x34
function function_261ab7f5(itemname, replacementitemname) {
    function_41015db1(level.var_ee46a98d, itemname, replacementitemname);
}

// Namespace item_world_fixup/item_world_fixup
// Params 3, eflags: 0x0
// Checksum 0x94f09cb9, Offset: 0x4f0
// Size: 0x13c
function add_spawn_point(origin, targetname, angles = (0, 0, 0)) {
    if (!function_bbc0b67f(1)) {
        return;
    }
    if (!isvec(origin) || !isvec(angles) || !ishash(targetname)) {
        assert(0);
        return;
    }
    if (!isdefined(level.var_1d777960[targetname])) {
        level.var_1d777960[targetname] = array();
    }
    var_3cc38ddd = level.var_1d777960[targetname].size;
    level.var_1d777960[targetname][var_3cc38ddd] = {#origin:origin, #angles:angles};
}

// Namespace item_world_fixup/item_world_fixup
// Params 3, eflags: 0x0
// Checksum 0x3ef61dbb, Offset: 0x638
// Size: 0x124
function function_e70fa91c(var_cf456610, var_2ab9d3bd, var_6647c284 = -1) {
    if (!function_bbc0b67f()) {
        return;
    }
    if (!ishash(var_cf456610) || !ishash(var_2ab9d3bd) || !isint(var_6647c284)) {
        assert(0);
        return;
    }
    if (!isdefined(level.var_93c59949[var_cf456610])) {
        level.var_93c59949[var_cf456610] = [];
    }
    replacementcount = level.var_93c59949[var_cf456610].size;
    level.var_93c59949[var_cf456610][replacementcount] = {#replacement:var_2ab9d3bd, #count:var_6647c284};
}

// Namespace item_world_fixup/item_world_fixup
// Params 4, eflags: 0x0
// Checksum 0x4dae4d93, Offset: 0x768
// Size: 0x13c
function function_2749fcc3(var_89b7987e, var_cf456610, var_2ab9d3bd, var_6647c284 = 1) {
    if (!function_bbc0b67f()) {
        return;
    }
    if (!ishash(var_cf456610) || !ishash(var_2ab9d3bd) || !isint(var_6647c284)) {
        assert(0);
        return;
    }
    if (!isdefined(level.var_93c59949[var_cf456610])) {
        level.var_93c59949[var_cf456610] = [];
    }
    replacementcount = level.var_93c59949[var_cf456610].size;
    level.var_93c59949[var_cf456610][replacementcount] = {#replacement:var_2ab9d3bd, #count:var_6647c284, #var_52a66db0:var_89b7987e};
}

// Namespace item_world_fixup/item_world_fixup
// Params 1, eflags: 0x0
// Checksum 0xb0192084, Offset: 0x8b0
// Size: 0x72
function function_96ff7b88(itemname) {
    if (!function_bbc0b67f(1)) {
        return;
    }
    if (!ishash(itemname)) {
        assert(0);
        return;
    }
    level.var_ee46a98d[itemname] = "";
}

// Namespace item_world_fixup/item_world_fixup
// Params 1, eflags: 0x0
// Checksum 0x4fbdf496, Offset: 0x930
// Size: 0x72
function remove_item(itemname) {
    if (!function_bbc0b67f(0)) {
        return;
    }
    if (!ishash(itemname)) {
        assert(0);
        return;
    }
    level.itemreplacement[itemname] = "";
}

// Namespace item_world_fixup/item_world_fixup
// Params 2, eflags: 0x0
// Checksum 0xc06f7da8, Offset: 0x9b0
// Size: 0xfc
function function_a997e342(origin, radius) {
    if (!function_bbc0b67f(1)) {
        return;
    }
    if (!isvec(origin) || !isfloat(radius) && !isint(radius)) {
        assert(0);
        return;
    }
    level.var_bf9b06d3[level.var_bf9b06d3.size] = origin;
    level.var_8d50adaa[level.var_8d50adaa.size] = radius;
    assert(level.var_bf9b06d3.size == level.var_8d50adaa.size);
}


// Atian COD Tools GSC decompiler test
#namespace activecamo;

// Namespace activecamo/namespace_bd884c6d
// Params 1, eflags: 0x1 linked
// Checksum 0x7e1b849a, Offset: 0x68
// Size: 0x6e
function function_385ef18d(camoweapon) {
    /#
        assert(isdefined(camoweapon));
    #/
    var_e69cf15d = function_3786d342(camoweapon);
    if (isdefined(var_e69cf15d) && var_e69cf15d != level.weaponnone) {
        camoweapon = var_e69cf15d;
    }
    return camoweapon;
}

// Namespace activecamo/namespace_bd884c6d
// Params 1, eflags: 0x1 linked
// Checksum 0xc3dfc3d6, Offset: 0xe0
// Size: 0x106
function function_c14cb514(weapon) {
    if (isdefined(level.var_f06de157)) {
        return [[ level.var_f06de157 ]](weapon);
    }
    if (isdefined(weapon)) {
        if (level.weaponnone != weapon) {
            var_7c3192e1 = function_385ef18d(weapon);
            if (var_7c3192e1.isaltmode) {
                if (isdefined(var_7c3192e1.altweapon) && level.weaponnone != var_7c3192e1.altweapon) {
                    var_7c3192e1 = var_7c3192e1.altweapon;
                }
            }
            if (isdefined(var_7c3192e1.rootweapon) && level.weaponnone != var_7c3192e1.rootweapon) {
                return var_7c3192e1.rootweapon;
            }
            return var_7c3192e1;
        }
    }
    return weapon;
}


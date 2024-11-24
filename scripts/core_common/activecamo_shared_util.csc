#namespace activecamo;

// Namespace activecamo/activecamo_shared_util
// Params 1, eflags: 0x1 linked
// Checksum 0x91557067, Offset: 0x68
// Size: 0x6e
function function_385ef18d(camoweapon) {
    assert(isdefined(camoweapon));
    var_e69cf15d = function_3786d342(camoweapon);
    if (isdefined(var_e69cf15d) && var_e69cf15d != level.weaponnone) {
        camoweapon = var_e69cf15d;
    }
    return camoweapon;
}

// Namespace activecamo/activecamo_shared_util
// Params 1, eflags: 0x1 linked
// Checksum 0xa92ec6c5, Offset: 0xe0
// Size: 0x106
function function_c14cb514(weapon) {
    if (isdefined(level.var_f06de157)) {
        return [[ level.var_f06de157 ]](weapon);
    }
    if (isdefined(weapon)) {
        if (level.weaponnone != weapon) {
            activecamoweapon = function_385ef18d(weapon);
            if (activecamoweapon.isaltmode) {
                if (isdefined(activecamoweapon.altweapon) && level.weaponnone != activecamoweapon.altweapon) {
                    activecamoweapon = activecamoweapon.altweapon;
                }
            }
            if (isdefined(activecamoweapon.rootweapon) && level.weaponnone != activecamoweapon.rootweapon) {
                return activecamoweapon.rootweapon;
            }
            return activecamoweapon;
        }
    }
    return weapon;
}


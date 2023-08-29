// Atian COD Tools GSC decompiler test
#namespace oic;

// Namespace oic/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xadfc2bb7, Offset: 0x88
// Size: 0x474
function event_handler[gametype_init] main(eventstruct) {
    level.var_8eef5741 = 1;
    var_1f99b9e8 = [];
    if (!isdefined(var_1f99b9e8)) {
        var_1f99b9e8 = [];
    } else if (!isarray(var_1f99b9e8)) {
        var_1f99b9e8 = array(var_1f99b9e8);
    }
    var_1f99b9e8[var_1f99b9e8.size] = getweapon(#"hero_annihilator" + "_oic", "");
    if (!isdefined(var_1f99b9e8)) {
        var_1f99b9e8 = [];
    } else if (!isarray(var_1f99b9e8)) {
        var_1f99b9e8 = array(var_1f99b9e8);
    }
    var_1f99b9e8[var_1f99b9e8.size] = getweapon(#"pistol_standard_t8" + "_oic", "");
    if (!isdefined(var_1f99b9e8)) {
        var_1f99b9e8 = [];
    } else if (!isarray(var_1f99b9e8)) {
        var_1f99b9e8 = array(var_1f99b9e8);
    }
    var_1f99b9e8[var_1f99b9e8.size] = getweapon(#"pistol_standard_t8" + "_oic", "uber");
    if (!isdefined(var_1f99b9e8)) {
        var_1f99b9e8 = [];
    } else if (!isarray(var_1f99b9e8)) {
        var_1f99b9e8 = array(var_1f99b9e8);
    }
    var_1f99b9e8[var_1f99b9e8.size] = getweapon(#"pistol_fullauto_t8" + "_oic", "");
    if (!isdefined(var_1f99b9e8)) {
        var_1f99b9e8 = [];
    } else if (!isarray(var_1f99b9e8)) {
        var_1f99b9e8 = array(var_1f99b9e8);
    }
    var_1f99b9e8[var_1f99b9e8.size] = getweapon(#"pistol_topbreak_t8" + "_oic", "");
    if (!isdefined(var_1f99b9e8)) {
        var_1f99b9e8 = [];
    } else if (!isarray(var_1f99b9e8)) {
        var_1f99b9e8 = array(var_1f99b9e8);
    }
    var_1f99b9e8[var_1f99b9e8.size] = getweapon(#"pistol_revolver_t8" + "_oic", "");
    if (!isdefined(var_1f99b9e8)) {
        var_1f99b9e8 = [];
    } else if (!isarray(var_1f99b9e8)) {
        var_1f99b9e8 = array(var_1f99b9e8);
    }
    var_1f99b9e8[var_1f99b9e8.size] = getweapon(#"pistol_revolver_t8" + "_oic", "pistolscope");
    if (!isdefined(var_1f99b9e8)) {
        var_1f99b9e8 = [];
    } else if (!isarray(var_1f99b9e8)) {
        var_1f99b9e8 = array(var_1f99b9e8);
    }
    var_1f99b9e8[var_1f99b9e8.size] = getweapon(#"pistol_revolver_t8" + "_oic", "uber");
    gunselection = getgametypesetting(#"gunselection");
    level.var_bf82f6b0 = var_1f99b9e8[gunselection];
    if (isdefined(level.var_bf82f6b0) && isdefined(level.var_bf82f6b0.worldmodel)) {
        forcestreamxmodel(level.var_bf82f6b0.worldmodel);
    }
}


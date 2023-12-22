// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace zm_custom;

// Namespace zm_custom/zm_customgame
// Params 0, eflags: 0x2
// Checksum 0x8dbd6478, Offset: 0x138
// Size: 0x14e
function autoexec function_d776b402() {
    clientfield::register("clientuimodel", "zmhud.damage_point_shake", 1, 1, "counter", undefined, 0, 0);
    if (util::get_game_type() == "zclassic") {
        clientfield::register("worlduimodel", "ZMHudGlobal.trials.gameStartTime", 1, 31, "int", undefined, 0, 0);
    }
    callback::on_localplayer_spawned(&function_772f66bd);
    level.var_629da31e = function_e49dbc72();
    if (isdemoplaying()) {
        return;
    }
    if (isdefined(getgametypesetting(#"zmhealthdrain")) ? getgametypesetting(#"zmhealthdrain") : 0) {
        level.var_7db2b064 = &function_ecc5a0b9;
    }
}

// Namespace zm_custom/zm_customgame
// Params 1, eflags: 0x1 linked
// Checksum 0xe0d14266, Offset: 0x290
// Size: 0x27e
function function_772f66bd(localclientnum) {
    localplayer = function_5c10bd79(localclientnum);
    switch (getgametypesetting(#"zmhealthstartingbars")) {
    case 3:
    default:
        var_d75008e3 = 0;
        break;
    case 4:
        var_d75008e3 = 1;
        break;
    case 5:
        var_d75008e3 = 2;
        break;
    case 6:
        var_d75008e3 = 3;
        break;
    case 2:
        var_d75008e3 = -1;
        break;
    case 1:
        var_d75008e3 = -2;
        break;
    case 0:
        var_d75008e3 = -3;
        break;
    }
    zmdifficultysettings = getscriptbundle("zm_base_difficulty");
    switch (level.gamedifficulty) {
    case 0:
        str_suffix = "_E";
        break;
    case 1:
    default:
        str_suffix = "_N";
        break;
    case 2:
        str_suffix = "_H";
        break;
    case 3:
        str_suffix = "_I";
        break;
    }
    n_base = zmdifficultysettings.("plyBaseHealth" + str_suffix);
    n_target = int(max(n_base + 50 * var_d75008e3, 1));
    localplayer.var_ee9b8af0 = n_target;
}

// Namespace zm_custom/zm_customgame
// Params 0, eflags: 0x1 linked
// Checksum 0x3ad4de21, Offset: 0x518
// Size: 0xd2
function function_e49dbc72() {
    var_97a0e767 = isdefined(getgametypesetting(#"zmlaststandduration")) ? getgametypesetting(#"zmlaststandduration") : 0;
    switch (var_97a0e767) {
    case 0:
        return undefined;
    case 1:
        return 20;
    case 3:
        return 60;
        break;
    }
    return getdvarfloat(#"player_laststandbleedouttime", 0);
}

// Namespace zm_custom/zm_customgame
// Params 3, eflags: 0x5 linked
// Checksum 0x6cceff6b, Offset: 0x5f8
// Size: 0x44
function private function_ecc5a0b9(local_client_num, player, damage) {
    if (int(damage) == 5) {
        return 1;
    }
    return 0;
}

// Namespace zm_custom/zm_customgame
// Params 1, eflags: 0x1 linked
// Checksum 0xdfa6b531, Offset: 0x648
// Size: 0x70
function function_901b751c(var_c9db62d5) {
    if (var_c9db62d5 === "") {
        return undefined;
    }
    setting = getgametypesetting(var_c9db62d5);
    /#
        assert(isdefined(setting), "<unknown string>" + var_c9db62d5 + "<unknown string>");
    #/
    return setting;
}


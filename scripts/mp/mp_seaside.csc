// Atian COD Tools GSC decompiler test
#include scripts/mp/mp_seaside_sound.csc;
#include scripts/mp/mp_seaside_fx.csc;
#include scripts/mp_common/load.csc;
#include scripts/core_common/scene_shared.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/struct.csc;

#namespace mp_seaside;

// Namespace mp_seaside/level_init
// Params 1, eflags: 0x40
// Checksum 0x47047330, Offset: 0x290
// Size: 0x1b6
function event<level_init> main(eventstruct) {
    level.var_bbb8810e = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
    callback::on_localplayer_spawned(&function_d8ca430a);
    clientfield::register("world", "remove_blood_decals", 1, 1, "int", &function_cfadee36, 1, 0);
    clientfield::register("vehicle", "hide_tank_rob", 1, 1, "int", &function_4c64b702, 1, 0);
    mp_seaside_fx::main();
    mp_seaside_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient(0);
    level.var_f5cd144f = "ui_cam_endgame_mp_common";
}

// Namespace mp_seaside/mp_seaside
// Params 2, eflags: 0x1 linked
// Checksum 0x408a25c4, Offset: 0x450
// Size: 0xc2
function dom_flag_base_fx_override(flag, team) {
    switch (flag.name) {
    case #"a":
        if (team == #"neutral") {
            return "ui/fx_dom_marker_neutral_r120";
        } else {
            return "ui/fx_dom_marker_team_r120";
        }
        break;
    case #"b":
        break;
    case #"c":
        if (team == #"neutral") {
            return "ui/fx_dom_marker_neutral_r90";
        } else {
            return "ui/fx_dom_marker_team_r90";
        }
        break;
    }
}

// Namespace mp_seaside/mp_seaside
// Params 2, eflags: 0x1 linked
// Checksum 0x2b5c7418, Offset: 0x520
// Size: 0xc2
function dom_flag_cap_fx_override(flag, team) {
    switch (flag.name) {
    case #"a":
        if (team == #"neutral") {
            return "ui/fx_dom_cap_indicator_neutral_r120";
        } else {
            return "ui/fx_dom_cap_indicator_team_r120";
        }
        break;
    case #"b":
        break;
    case #"c":
        if (team == #"neutral") {
            return "ui/fx_dom_cap_indicator_neutral_r90";
        } else {
            return "ui/fx_dom_cap_indicator_team_r90";
        }
        break;
    }
}

// Namespace mp_seaside/mp_seaside
// Params 1, eflags: 0x1 linked
// Checksum 0x738f9488, Offset: 0x5f0
// Size: 0x120
function on_localclient_connect(localclientnum) {
    waitresult = undefined;
    waitresult = level waittill(#"positiondraft_open", #"hash_7b06b53a1ed7cfc4", #"disconnect");
    if (waitresult._notify === "PositionDraft_Open") {
        setpbgactivebank(localclientnum, 8);
        var_6d963dbf = findstaticmodelindexarray("spawn_flavor_tank");
        foreach (n_index in var_6d963dbf) {
            hidestaticmodel(n_index);
        }
    }
}

// Namespace mp_seaside/mp_seaside
// Params 7, eflags: 0x1 linked
// Checksum 0x9c04b74a, Offset: 0x718
// Size: 0xe2
function function_4c64b702(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (!isdefined(level.var_f55e70b)) {
            level.var_f55e70b = [];
        }
        if (!isdefined(level.var_f55e70b)) {
            level.var_f55e70b = [];
        } else if (!isarray(level.var_f55e70b)) {
            level.var_f55e70b = array(level.var_f55e70b);
        }
        level.var_f55e70b[level.var_f55e70b.size] = self;
    }
}

// Namespace mp_seaside/mp_seaside
// Params 1, eflags: 0x1 linked
// Checksum 0x1370e18, Offset: 0x808
// Size: 0x1c
function function_d8ca430a(localclientnum) {
    thread function_88a882af();
}

// Namespace mp_seaside/mp_seaside
// Params 0, eflags: 0x1 linked
// Checksum 0x5127b8c7, Offset: 0x830
// Size: 0x110
function function_88a882af() {
    waitframe(1);
    if (!isdefined(level.var_f55e70b)) {
        return;
    }
    if (!isdefined(level.var_f55e70b[0])) {
        callback::remove_on_localplayer_spawned(&function_d8ca430a);
        return;
    }
    foreach (tank in level.var_f55e70b) {
        tank stoprenderoverridebundle("rob_sonar_set_enemyequip");
        tank stoprenderoverridebundle("rob_sonar_set_enemy");
        tank playrenderoverridebundle("rob_sonar_set_enemy_cold");
    }
}

// Namespace mp_seaside/mp_seaside
// Params 1, eflags: 0x1 linked
// Checksum 0x5cc4d660, Offset: 0x948
// Size: 0xdc
function on_gameplay_started(localclientnum) {
    level notify(#"hash_7b06b53a1ed7cfc4");
    var_6d963dbf = findstaticmodelindexarray("spawn_flavor_tank");
    foreach (n_index in var_6d963dbf) {
        unhidestaticmodel(n_index);
    }
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

// Namespace mp_seaside/mp_seaside
// Params 7, eflags: 0x1 linked
// Checksum 0xa7eb2239, Offset: 0xa30
// Size: 0xd8
function function_cfadee36(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        a_decals = findvolumedecalindexarray("recon_blood");
        foreach (decal in a_decals) {
            hidevolumedecal(decal);
        }
    }
}


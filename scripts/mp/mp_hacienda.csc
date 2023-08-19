// Atian COD Tools GSC decompiler test
#include scripts/mp/mp_hacienda_sound.csc;
#include scripts/mp/mp_hacienda_fx.csc;
#include scripts/mp_common/load.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/scene_shared.csc;
#include scripts/core_common/callbacks_shared.csc;

#namespace mp_hacienda;

// Namespace mp_hacienda/level_init
// Params 1, eflags: 0x40
// Checksum 0x1914a83c, Offset: 0x1a8
// Size: 0x114
function event<level_init> main(eventstruct) {
    level.var_bbb8810e = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
    mp_hacienda_fx::main();
    mp_hacienda_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    level thread scene::play(#"hash_489f1d5fb79b12ab");
    util::waitforclient(0);
}

// Namespace mp_hacienda/mp_hacienda
// Params 2, eflags: 0x1 linked
// Checksum 0x7fd7b691, Offset: 0x2c8
// Size: 0xf2
function dom_flag_base_fx_override(flag, team) {
    switch (flag.name) {
    case #"a":
        if (team == #"neutral") {
            return "ui/fx_dom_marker_neutral_r90";
        } else {
            return "ui/fx_dom_marker_team_r90";
        }
        break;
    case #"b":
        if (team == #"neutral") {
            return "ui/fx_dom_marker_neutral_r250";
        } else {
            return "ui/fx_dom_marker_team_r250";
        }
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

// Namespace mp_hacienda/mp_hacienda
// Params 2, eflags: 0x1 linked
// Checksum 0x2c03e388, Offset: 0x3c8
// Size: 0xf2
function dom_flag_cap_fx_override(flag, team) {
    switch (flag.name) {
    case #"a":
        if (team == #"neutral") {
            return "ui/fx_dom_cap_indicator_neutral_r90";
        } else {
            return "ui/fx_dom_cap_indicator_team_r90";
        }
        break;
    case #"b":
        if (team == #"neutral") {
            return "ui/fx_dom_cap_indicator_neutral_r250";
        } else {
            return "ui/fx_dom_cap_indicator_team_r250";
        }
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

// Namespace mp_hacienda/mp_hacienda
// Params 1, eflags: 0x1 linked
// Checksum 0xcfc39461, Offset: 0x4c8
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_hacienda/mp_hacienda
// Params 1, eflags: 0x1 linked
// Checksum 0xd38970d3, Offset: 0x500
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}


// Atian COD Tools GSC decompiler test
#include scripts/mp/mp_jungle2_scripted.csc;
#include scripts/mp/mp_jungle2_sound.csc;
#include scripts/mp/mp_jungle2_fx.csc;
#include scripts/mp_common/load.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/callbacks_shared.csc;

#namespace mp_jungle2;

// Namespace mp_jungle2/level_init
// Params 1, eflags: 0x40
// Checksum 0x2f202c00, Offset: 0x130
// Size: 0x17c
function event<level_init> main(eventstruct) {
    setsaveddvar(#"enable_global_wind", 1);
    setsaveddvar(#"wind_global_vector", "88 0 0");
    setsaveddvar(#"wind_global_low_altitude", 0);
    setsaveddvar(#"wind_global_hi_altitude", 10000);
    setsaveddvar(#"wind_global_low_strength_percent", 100);
    level.var_bbb8810e = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    mp_jungle2_fx::main();
    mp_jungle2_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient(0);
}

// Namespace mp_jungle2/mp_jungle2
// Params 2, eflags: 0x1 linked
// Checksum 0xd6c6d026, Offset: 0x2b8
// Size: 0xf2
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
        if (team == #"neutral") {
            return "ui/fx_dom_marker_neutral_r120";
        } else {
            return "ui/fx_dom_marker_team_r120";
        }
        break;
    case #"c":
        if (team == #"neutral") {
            return "ui/fx_dom_marker_neutral_r120";
        } else {
            return "ui/fx_dom_marker_team_r120";
        }
        break;
    }
}

// Namespace mp_jungle2/mp_jungle2
// Params 2, eflags: 0x1 linked
// Checksum 0xbb951b5f, Offset: 0x3b8
// Size: 0xf2
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
        if (team == #"neutral") {
            return "ui/fx_dom_cap_indicator_neutral_r120";
        } else {
            return "ui/fx_dom_cap_indicator_team_r120";
        }
        break;
    case #"c":
        if (team == #"neutral") {
            return "ui/fx_dom_cap_indicator_neutral_r120";
        } else {
            return "ui/fx_dom_cap_indicator_team_r120";
        }
        break;
    }
}


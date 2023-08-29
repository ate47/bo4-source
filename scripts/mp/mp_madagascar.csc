// Atian COD Tools GSC decompiler test
#include scripts/mp/mp_madagascar_sound.csc;
#include scripts/mp/mp_madagascar_fx.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/mp_common/util.csc;
#include scripts/mp_common/load.csc;
#include scripts/core_common/util_shared.csc;

#namespace mp_madagascar;

// Namespace mp_madagascar/level_init
// Params 1, eflags: 0x40
// Checksum 0x8b1da83c, Offset: 0x130
// Size: 0x1b4
function event_handler[level_init] main(eventstruct) {
    setsaveddvar(#"enable_global_wind", 1);
    setsaveddvar(#"wind_global_vector", "88 0 0");
    setsaveddvar(#"wind_global_low_altitude", 0);
    setsaveddvar(#"wind_global_hi_altitude", 10000);
    setsaveddvar(#"wind_global_low_strength_percent", 100);
    level.var_bbb8810e = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
    mp_madagascar_fx::main();
    mp_madagascar_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient(0);
}

// Namespace mp_madagascar/mp_madagascar
// Params 1, eflags: 0x1 linked
// Checksum 0x5f5a376e, Offset: 0x2f0
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_madagascar/mp_madagascar
// Params 1, eflags: 0x1 linked
// Checksum 0x28b92a33, Offset: 0x328
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

// Namespace mp_madagascar/mp_madagascar
// Params 2, eflags: 0x1 linked
// Checksum 0x2762fb9e, Offset: 0x360
// Size: 0x9a
function dom_flag_base_fx_override(flag, team) {
    switch (flag.name) {
    case #"a":
        break;
    case #"b":
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

// Namespace mp_madagascar/mp_madagascar
// Params 2, eflags: 0x1 linked
// Checksum 0x4fa0fdd3, Offset: 0x408
// Size: 0x9a
function dom_flag_cap_fx_override(flag, team) {
    switch (flag.name) {
    case #"a":
        break;
    case #"b":
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


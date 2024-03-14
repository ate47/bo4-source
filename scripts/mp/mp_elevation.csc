// Atian COD Tools GSC decompiler test
#using scripts\mp\mp_elevation_sound.csc;
#using scripts\mp\mp_elevation_fx.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\mp_common\util.csc;
#using scripts\mp_common\load.csc;
#using scripts\core_common\util_shared.csc;

#namespace mp_elevation;

// Namespace mp_elevation/level_init
// Params 1, eflags: 0x40
// Checksum 0x9760f88e, Offset: 0x1b0
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
    mp_elevation_fx::main();
    mp_elevation_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient(0);
}

// Namespace mp_elevation/mp_elevation
// Params 1, eflags: 0x1 linked
// Checksum 0x8e94f1a9, Offset: 0x370
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_elevation/mp_elevation
// Params 1, eflags: 0x1 linked
// Checksum 0xdcec3e53, Offset: 0x3a8
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

// Namespace mp_elevation/mp_elevation
// Params 2, eflags: 0x1 linked
// Checksum 0xbe38b1a6, Offset: 0x3e0
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
            return "ui/fx_dom_marker_neutral_r120";
        } else {
            return "ui/fx_dom_marker_team_r120";
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

// Namespace mp_elevation/mp_elevation
// Params 2, eflags: 0x1 linked
// Checksum 0x8cf15989, Offset: 0x4e0
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
            return "ui/fx_dom_cap_indicator_neutral_r120";
        } else {
            return "ui/fx_dom_cap_indicator_team_r120";
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


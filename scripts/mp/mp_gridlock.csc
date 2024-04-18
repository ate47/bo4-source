// Atian COD Tools GSC decompiler test
#using scripts\mp\mp_gridlock_sound.csc;
#using scripts\mp\mp_gridlock_fx.csc;
#using scripts\mp_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace mp_gridlock;

// Namespace mp_gridlock/level_init
// Params 1, eflags: 0x40
// Checksum 0x755ed7fe, Offset: 0x1a0
// Size: 0xf4
function event_handler[level_init] main(eventstruct) {
    level.draftxcam = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
    mp_gridlock_fx::main();
    mp_gridlock_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient(0);
}

// Namespace mp_gridlock/mp_gridlock
// Params 2, eflags: 0x1 linked
// Checksum 0x30f6822d, Offset: 0x2a0
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
            return "ui/fx_dom_marker_neutral_r200";
        } else {
            return "ui/fx_dom_marker_team_r200";
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

// Namespace mp_gridlock/mp_gridlock
// Params 2, eflags: 0x1 linked
// Checksum 0x9c0be739, Offset: 0x3a0
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
            return "ui/fx_dom_cap_indicator_neutral_r200";
        } else {
            return "ui/fx_dom_cap_indicator_team_r200";
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

// Namespace mp_gridlock/mp_gridlock
// Params 1, eflags: 0x1 linked
// Checksum 0x6ed059a8, Offset: 0x4a0
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_gridlock/mp_gridlock
// Params 1, eflags: 0x1 linked
// Checksum 0xdbded6fd, Offset: 0x4d8
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}


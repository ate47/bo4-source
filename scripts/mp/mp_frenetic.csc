// Atian COD Tools GSC decompiler test
#using scripts\mp\mp_frenetic_sound.csc;
#using scripts\mp\mp_frenetic_fx.csc;
#using scripts\mp_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace mp_frenetic;

// Namespace mp_frenetic/level_init
// Params 1, eflags: 0x40
// Checksum 0xcb1e8df7, Offset: 0x138
// Size: 0x106
function event_handler[level_init] main(eventstruct) {
    level.var_bbb8810e = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
    mp_frenetic_fx::main();
    mp_frenetic_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient(0);
    level.endgamexcamname = "ui_cam_endgame_mp_common";
}

// Namespace mp_frenetic/mp_frenetic
// Params 2, eflags: 0x1 linked
// Checksum 0x5afd3fc8, Offset: 0x248
// Size: 0xc2
function dom_flag_base_fx_override(flag, team) {
    switch (flag.name) {
    case #"a":
        if (team == #"neutral") {
            return "ui/fx_dom_marker_neutral_r120";
        } else {
            return "ui/fx_dom_marker_team_r120";
        }
        return;
    case #"b":
        return;
    case #"c":
        if (team == #"neutral") {
            return "ui/fx_dom_marker_neutral_r120";
        } else {
            return "ui/fx_dom_marker_team_r120";
        }
        return;
    }
}

// Namespace mp_frenetic/mp_frenetic
// Params 2, eflags: 0x1 linked
// Checksum 0x6784110a, Offset: 0x318
// Size: 0xc2
function dom_flag_cap_fx_override(flag, team) {
    switch (flag.name) {
    case #"a":
        if (team == #"neutral") {
            return "ui/fx_dom_cap_indicator_neutral_r120";
        } else {
            return "ui/fx_dom_cap_indicator_team_r120";
        }
        return;
    case #"b":
        return;
    case #"c":
        if (team == #"neutral") {
            return "ui/fx_dom_cap_indicator_neutral_r120";
        } else {
            return "ui/fx_dom_cap_indicator_team_r120";
        }
        return;
    }
}

// Namespace mp_frenetic/mp_frenetic
// Params 1, eflags: 0x1 linked
// Checksum 0x7c63727e, Offset: 0x3e8
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_frenetic/mp_frenetic
// Params 1, eflags: 0x1 linked
// Checksum 0x6205fd5e, Offset: 0x420
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}


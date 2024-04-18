// Atian COD Tools GSC decompiler test
#using scripts\mp\mp_silo_sound.csc;
#using scripts\mp\mp_silo_fx.csc;
#using scripts\mp_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace mp_silo;

// Namespace mp_silo/level_init
// Params 1, eflags: 0x40
// Checksum 0x7b6fb3d8, Offset: 0x208
// Size: 0x14e
function event_handler[level_init] main(eventstruct) {
    clientfield::register("scriptmover", "helo_spawn_flavor_rope_pulse", 1, 1, "counter", &helo_spawn_flavor_rope_pulse, 0, 0);
    level.draftxcam = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
    mp_silo_fx::main();
    mp_silo_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient(0);
    level.endgamexcamname = "ui_cam_endgame_mp_common";
}

// Namespace mp_silo/mp_silo
// Params 2, eflags: 0x1 linked
// Checksum 0xeef66a63, Offset: 0x360
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
            return "ui/fx_dom_marker_neutral_r120";
        } else {
            return "ui/fx_dom_marker_team_r120";
        }
        break;
    }
}

// Namespace mp_silo/mp_silo
// Params 2, eflags: 0x1 linked
// Checksum 0xc36bbf44, Offset: 0x460
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
            return "ui/fx_dom_cap_indicator_neutral_r120";
        } else {
            return "ui/fx_dom_cap_indicator_team_r120";
        }
        break;
    }
}

// Namespace mp_silo/mp_silo
// Params 1, eflags: 0x1 linked
// Checksum 0x772dd0ba, Offset: 0x560
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_silo/mp_silo
// Params 1, eflags: 0x1 linked
// Checksum 0x3e11ec86, Offset: 0x598
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

// Namespace mp_silo/mp_silo
// Params 7, eflags: 0x1 linked
// Checksum 0xaaa55240, Offset: 0x5d0
// Size: 0xf8
function helo_spawn_flavor_rope_pulse(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    while (isdefined(self)) {
        pos = self gettagorigin("tag_ground");
        if (!isdefined(pos)) {
            break;
        }
        ropepulse(pos, 1, 1024, 5, 60);
        wait(randomfloatrange(0.12, 0.25));
    }
}


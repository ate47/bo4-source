// Atian COD Tools GSC decompiler test
#using scripts\mp\mp_geothermal_sound.csc;
#using scripts\mp\mp_geothermal_fx.csc;
#using scripts\mp_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace mp_geothermal;

// Namespace mp_geothermal/level_init
// Params 1, eflags: 0x40
// Checksum 0x2c70aad7, Offset: 0x180
// Size: 0x13c
function event_handler[level_init] main(eventstruct) {
    clientfield::register("toplayer", "toggle_player_steam", 1, 1, "int", &function_37488be, 0, 0);
    level.var_bbb8810e = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
    mp_geothermal_fx::main();
    mp_geothermal_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient(0);
}

// Namespace mp_geothermal/mp_geothermal
// Params 2, eflags: 0x1 linked
// Checksum 0x80ec18eb, Offset: 0x2c8
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

// Namespace mp_geothermal/mp_geothermal
// Params 2, eflags: 0x1 linked
// Checksum 0x3bea3f64, Offset: 0x3c8
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

// Namespace mp_geothermal/mp_geothermal
// Params 1, eflags: 0x1 linked
// Checksum 0x905bbec9, Offset: 0x4c8
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_geothermal/mp_geothermal
// Params 1, eflags: 0x1 linked
// Checksum 0x130ad926, Offset: 0x500
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

// Namespace mp_geothermal/mp_geothermal
// Params 7, eflags: 0x1 linked
// Checksum 0xfa47f16d, Offset: 0x538
// Size: 0xfc
function function_37488be(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (self !== function_5c10bd79(localclientnum)) {
        return;
    }
    if (newval) {
        if (!self postfx::function_556665f2("pstfx_sprite_rain_loop_sparse")) {
            self postfx::playpostfxbundle("pstfx_sprite_rain_loop_sparse");
            self playrumblelooponentity(localclientnum, "tank_rumble");
        }
        return;
    }
    self postfx::stoppostfxbundle("pstfx_sprite_rain_loop_sparse");
    self stoprumble(localclientnum, "tank_rumble");
}


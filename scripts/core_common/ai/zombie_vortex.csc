// Atian COD Tools GSC decompiler test
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace zombie_vortex;

// Namespace zombie_vortex/zombie_vortex
// Params 0, eflags: 0x2
// Checksum 0xb36f33fa, Offset: 0x1e0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"vortex", &__init__, undefined, undefined);
}

// Namespace zombie_vortex/zombie_vortex
// Params 0, eflags: 0x1 linked
// Checksum 0x8824c816, Offset: 0x228
// Size: 0x114
function __init__() {
    visionset_mgr::register_visionset_info("zm_idgun_vortex" + "_visionset", 1, 30, undefined, "zm_idgun_vortex");
    visionset_mgr::register_overlay_info_style_speed_blur("zm_idgun_vortex" + "_blur", 1, 1, 0.08, 0.75, 0.9);
    clientfield::register("scriptmover", "vortex_start", 1, 2, "counter", &start_vortex, 0, 0);
    clientfield::register("allplayers", "vision_blur", 1, 1, "int", &vision_blur, 0, 0);
}

// Namespace zombie_vortex/zombie_vortex
// Params 7, eflags: 0x1 linked
// Checksum 0x138595f9, Offset: 0x348
// Size: 0x1dc
function start_vortex(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    self endon(#"disconnect");
    if (!isdefined(newval) || newval == 0) {
        return;
    }
    e_player = function_5c10bd79(localclientnum);
    vposition = self.origin;
    newval = newval - oldval;
    if (newval == 2) {
        registerplayer_lift_clipbamfupdate = "zombie/fx_idgun_vortex_ug_zod_zmb";
        fx_vortex_explosion = "zombie/fx_idgun_vortex_explo_ug_zod_zmb";
        n_vortex_time = 10;
    } else {
        registerplayer_lift_clipbamfupdate = "zombie/fx_idgun_vortex_zod_zmb";
        fx_vortex_explosion = "zombie/fx_idgun_vortex_explo_zod_zmb";
        n_vortex_time = 5;
    }
    vortex_fx_handle = playfx(localclientnum, registerplayer_lift_clipbamfupdate, vposition);
    setfxignorepause(localclientnum, vortex_fx_handle, 1);
    playsound(0, #"wpn_idgun_portal_start", vposition);
    audio::playloopat("wpn_idgun_portal_loop", vposition);
    self thread vortex_shake_and_rumble(localclientnum, vposition);
    self thread function_2dd3c5bc(localclientnum, vortex_fx_handle, vposition, fx_vortex_explosion, n_vortex_time);
}

// Namespace zombie_vortex/zombie_vortex
// Params 2, eflags: 0x1 linked
// Checksum 0x6b4a5b90, Offset: 0x530
// Size: 0x60
function vortex_shake_and_rumble(localclientnum, v_vortex_origin) {
    self endon(#"vortex_stop");
    while (true) {
        self playrumbleonentity(localclientnum, "zod_idgun_vortex_interior");
        wait(0.075);
    }
}

// Namespace zombie_vortex/zombie_vortex
// Params 7, eflags: 0x1 linked
// Checksum 0xbaad6b57, Offset: 0x598
// Size: 0x8c
function vision_blur(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        enablespeedblur(localclientnum, 0.1, 0.5, 0.75);
        return;
    }
    disablespeedblur(localclientnum);
}

// Namespace zombie_vortex/zombie_vortex
// Params 5, eflags: 0x1 linked
// Checksum 0x8dba4a53, Offset: 0x630
// Size: 0x224
function function_2dd3c5bc(localclientnum, vortex_fx_handle, vposition, fx_vortex_explosion, n_vortex_time) {
    e_player = function_5c10bd79(localclientnum);
    n_starttime = e_player getclienttime();
    n_currtime = e_player getclienttime() - n_starttime;
    n_vortex_time = int(n_vortex_time * 1000);
    while (n_currtime < n_vortex_time) {
        waitframe(1);
        n_currtime = e_player getclienttime() - n_starttime;
    }
    stopfx(localclientnum, vortex_fx_handle);
    audio::stoploopat("wpn_idgun_portal_loop", vposition);
    playsound(0, #"wpn_idgun_portal_stop", vposition);
    wait(0.15);
    self notify(#"vortex_stop");
    var_ad8208a9 = playfx(localclientnum, fx_vortex_explosion, vposition);
    setfxignorepause(localclientnum, var_ad8208a9, 1);
    playsound(0, #"wpn_idgun_portal_explode", vposition);
    waitframe(1);
    self playrumbleonentity(localclientnum, "zod_idgun_vortex_shockwave");
    vision_blur(localclientnum, undefined, 1);
    wait(0.1);
    vision_blur(localclientnum, undefined, 0);
}


#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;
#using scripts\mp_common\load;

#namespace mp_embassy;

// Namespace mp_embassy/level_init
// Params 1, eflags: 0x40
// Checksum 0x71d20d8d, Offset: 0x110
// Size: 0x1bc
function event_handler[level_init] main(eventstruct) {
    clientfield::register("scriptmover", "spawn_flavor_apc_explosion", 1, 1, "counter", &spawn_flavor_apc_explosion, 0, 0);
    setsaveddvar(#"enable_global_wind", 1);
    setsaveddvar(#"wind_global_vector", "88 0 0");
    setsaveddvar(#"wind_global_low_altitude", 0);
    setsaveddvar(#"wind_global_hi_altitude", 10000);
    setsaveddvar(#"wind_global_low_strength_percent", 100);
    level.draftxcam = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    level.var_4970b0af = 1;
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_gameplay_started(&on_gameplay_started);
    load::main();
    util::waitforclient(0);
}

// Namespace mp_embassy/mp_embassy
// Params 1, eflags: 0x0
// Checksum 0x10964dac, Offset: 0x2d8
// Size: 0x2c
function on_localclient_connect(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 8);
}

// Namespace mp_embassy/mp_embassy
// Params 1, eflags: 0x0
// Checksum 0xe0916b10, Offset: 0x310
// Size: 0x2c
function on_gameplay_started(localclientnum) {
    waitframe(1);
    setpbgactivebank(localclientnum, 1);
}

// Namespace mp_embassy/mp_embassy
// Params 7, eflags: 0x0
// Checksum 0x6e83c51e, Offset: 0x348
// Size: 0x104
function spawn_flavor_apc_explosion(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    model = self.model;
    forcestreamxmodel(model);
    playfx(localclientnum, "explosions/fx8_vexp_fav_buggy", self gettagorigin("tag_body_d0"), anglestoforward(self gettagangles("tag_body_d0")));
    playrumbleonposition(localclientnum, "mp_embassy_apc_explosion", self.origin);
    wait 2;
    stopforcestreamingxmodel(model);
}


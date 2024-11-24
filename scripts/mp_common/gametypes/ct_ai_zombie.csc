#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace mp_ai_zombie;

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x2
// Checksum 0xb3f2924c, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_ai_zombie", &__init__, undefined, undefined);
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x3b54f216, Offset: 0x140
// Size: 0x122
function __init__() {
    clientfield::register("actor", "zombie_riser_fx", 1, 1, "int", &handle_zombie_risers, 1, 1);
    clientfield::register("actor", "zombie_has_eyes", 1, 1, "int", &zombie_eyes_clientfield_cb, 0, 0);
    level._effect[#"rise_burst"] = #"zombie/fx_spawn_dirt_hand_burst_zmb";
    level._effect[#"rise_billow"] = #"zombie/fx_spawn_dirt_body_billowing_zmb";
    level._effect[#"eye_glow"] = #"zm_ai/fx8_zombie_eye_glow_orange";
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 7, eflags: 0x0
// Checksum 0xa95bf96a, Offset: 0x270
// Size: 0x11e
function handle_zombie_risers(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval) {
        localplayers = level.localplayers;
        playsound(0, #"zmb_zombie_spawn", self.origin);
        burst_fx = level._effect[#"rise_burst"];
        billow_fx = level._effect[#"rise_billow"];
        for (i = 0; i < localplayers.size; i++) {
            self thread rise_dust_fx(localclientnum, billow_fx, burst_fx);
        }
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 3, eflags: 0x0
// Checksum 0x2f06c5e1, Offset: 0x398
// Size: 0x10c
function rise_dust_fx(clientnum, billow_fx, burst_fx) {
    self endon(#"death");
    dust_tag = "J_SpineUpper";
    if (isdefined(burst_fx)) {
        playfx(clientnum, burst_fx, self.origin + (0, 0, randomintrange(5, 10)));
    }
    wait 0.25;
    if (isdefined(billow_fx)) {
        playfx(clientnum, billow_fx, self.origin + (randomintrange(-10, 10), randomintrange(-10, 10), randomintrange(5, 10)));
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 7, eflags: 0x0
// Checksum 0xdbb1f0fb, Offset: 0x4b0
// Size: 0x134
function zombie_eyes_clientfield_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_ea20345f)) {
        self stoprenderoverridebundle(self.var_ea20345f, "j_head");
    }
    if (isdefined(self.var_3231a850)) {
        stopfx(localclientnum, self.var_3231a850);
        self.var_3231a850 = undefined;
    }
    if (newval) {
        self.var_ea20345f = "rob_zm_eyes_red";
        var_d40cd873 = "eye_glow";
        self playrenderoverridebundle(self.var_ea20345f, "j_head");
        self.var_3231a850 = util::playfxontag(localclientnum, level._effect[var_d40cd873], self, "j_eyeball_le");
        self enableonradar();
    }
}


#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\clientfield_shared;

#namespace wz_ai_zombie;

// Namespace wz_ai_zombie/wz_ai_zombie
// Params 0, eflags: 0x2
// Checksum 0x710ac486, Offset: 0x198
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_ai_zombie", &__init__, undefined, undefined);
}

// Namespace wz_ai_zombie/wz_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0xe8e356b3, Offset: 0x1e0
// Size: 0x242
function __init__() {
    clientfield::register("actor", "zombie_riser_fx", 1, 1, "int", &handle_zombie_risers, 1, 1);
    clientfield::register("actor", "zombie_has_eyes_col", 13000, 2, "int", &zombie_eyes_clientfield_cb, 0, 0);
    clientfield::register("actor", "zombie_has_microwave", 1, 1, "int", &function_bee29da4, 0, 0);
    clientfield::register("toplayer", "zombie_vehicle_shake", 19000, 1, "counter", &function_3acc8ce4, 0, 0);
    level._effect[#"rise_burst"] = #"zombie/fx_spawn_dirt_hand_burst_zmb";
    level._effect[#"rise_billow"] = #"zombie/fx_spawn_dirt_body_billowing_zmb";
    level._effect[#"eye_glow"] = #"zm_ai/fx8_zombie_eye_glow_orange";
    level._effect[#"eye_glow_blue"] = #"wz/fx8_zombie_eye_glow_blue_wz";
    level._effect[#"eye_glow_green"] = #"wz/fx8_zombie_eye_glow_green_wz";
    level._effect[#"microwave_attack"] = #"hash_6b67cc3e876119c1";
}

// Namespace wz_ai_zombie/wz_ai_zombie
// Params 7, eflags: 0x0
// Checksum 0x76a326f3, Offset: 0x430
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

// Namespace wz_ai_zombie/wz_ai_zombie
// Params 3, eflags: 0x0
// Checksum 0x7f35cc64, Offset: 0x558
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

// Namespace wz_ai_zombie/wz_ai_zombie
// Params 7, eflags: 0x0
// Checksum 0xc8815eb2, Offset: 0x670
// Size: 0x194
function zombie_eyes_clientfield_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_ea20345f)) {
        self stoprenderoverridebundle(self.var_ea20345f, "j_head");
    }
    if (isdefined(self.var_3231a850)) {
        stopfx(localclientnum, self.var_3231a850);
        self.var_3231a850 = undefined;
    }
    if (newval > 0) {
        if (newval == 2) {
            self.var_ea20345f = "rob_zm_eyes_blue";
            var_d40cd873 = "eye_glow_blue";
        } else if (newval == 3) {
            self.var_ea20345f = "rob_zm_eyes_green";
            var_d40cd873 = "eye_glow_green";
        } else {
            self.var_ea20345f = "rob_zm_eyes_red";
            var_d40cd873 = "eye_glow";
            self playrenderoverridebundle(self.var_ea20345f, "j_head");
        }
        self.var_3231a850 = util::playfxontag(localclientnum, level._effect[var_d40cd873], self, "j_eyeball_le");
        self enableonradar();
    }
}

// Namespace wz_ai_zombie/wz_ai_zombie
// Params 7, eflags: 0x0
// Checksum 0x64c98ad8, Offset: 0x810
// Size: 0xb2
function function_bee29da4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.var_165c58d7)) {
        stopfx(localclientnum, self.var_165c58d7);
        self.var_165c58d7 = undefined;
    }
    if (newval) {
        self.var_165c58d7 = util::playfxontag(localclientnum, level._effect[#"microwave_attack"], self, "j_head");
    }
}

// Namespace wz_ai_zombie/wz_ai_zombie
// Params 7, eflags: 0x0
// Checksum 0x6f994d0, Offset: 0x8d0
// Size: 0xb4
function function_3acc8ce4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    id = earthquake(localclientnum, 0.3, 1, self.origin, 1000);
    playrumbleonposition(localclientnum, "grenade_rumble", self.origin);
}


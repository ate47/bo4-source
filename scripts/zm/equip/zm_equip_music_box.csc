#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;

#namespace music_box;

// Namespace music_box/zm_equip_music_box
// Params 0, eflags: 0x2
// Checksum 0x5fe15137, Offset: 0x190
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"music_box", &__init__, undefined, undefined);
}

// Namespace music_box/zm_equip_music_box
// Params 0, eflags: 0x1 linked
// Checksum 0x56ab8783, Offset: 0x1d8
// Size: 0x10c
function __init__() {
    clientfield::register("scriptmover", "" + #"hash_136e9d44e7e2e888", 24000, 1, "int", &function_67fa988c, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_77a1a7cd8eb3e86c", 1, 1, "int", &function_9c964ccc, 0, 0);
    clientfield::register("actor", "" + #"hash_4881cb6bc59fdc49", 24000, 1, "int", &function_e722a4fd, 0, 0);
}

// Namespace music_box/zm_equip_music_box
// Params 7, eflags: 0x0
// Checksum 0xb66b7fb4, Offset: 0x2f0
// Size: 0x17e
function function_3224694(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self)) {
        if (newval == 1) {
            self.fx_handle = playfx(localclientnum, "maps/zm_orange/fx8_samantha_ground_portal", self.origin);
            if (!isdefined(self.var_30b8668)) {
                self playsound(localclientnum, #"hash_1780eaf4c052b271");
                self.var_30b8668 = self playloopsound(#"hash_13b5daba3191a299");
            }
            return;
        }
        if (newval == 0) {
            if (isdefined(self.fx_handle)) {
                deletefx(localclientnum, self.fx_handle);
                self.fx_handle = undefined;
            }
            if (isdefined(self.var_30b8668)) {
                self playsound(localclientnum, #"hash_63bbef4e60ff503b");
                self stoploopsound(self.var_30b8668);
                self.var_30b8668 = undefined;
            }
        }
    }
}

// Namespace music_box/zm_equip_music_box
// Params 7, eflags: 0x0
// Checksum 0x122cbfc5, Offset: 0x478
// Size: 0x6c
function function_7ee98254(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self)) {
        playfx(localclientnum, "maps/zm_orange/fx8_samantha_ground_portal_blast", self.origin);
    }
}

// Namespace music_box/zm_equip_music_box
// Params 7, eflags: 0x1 linked
// Checksum 0x55884b70, Offset: 0x4f0
// Size: 0xbe
function function_67fa988c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self)) {
        if (newval == 1) {
            self.fx_handle = util::playfxontag(localclientnum, "zm_weapons/fx8_music_box_open_world", self, "tag_origin");
            return;
        }
        if (newval == 0) {
            if (isdefined(self.fx_handle)) {
                deletefx(localclientnum, self.fx_handle);
                self.fx_handle = undefined;
            }
        }
    }
}

// Namespace music_box/zm_equip_music_box
// Params 7, eflags: 0x1 linked
// Checksum 0x8ca37175, Offset: 0x5b8
// Size: 0xd4
function function_9c964ccc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        waitframe(1);
        v_up = (360, 0, 0);
        v_forward = (0, 0, 360);
        if (isdefined(self)) {
            playfx(localclientnum, "maps/zm_white/fx8_monkey_bomb_reveal", self.origin, v_forward, v_up);
            self playsound(localclientnum, #"hash_21206f1b7fb27f81");
        }
    }
}

// Namespace music_box/zm_equip_music_box
// Params 7, eflags: 0x1 linked
// Checksum 0xe1c370d, Offset: 0x698
// Size: 0xbe
function function_e722a4fd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self)) {
        if (newval == 1) {
            self.fx_id = util::playfxontag(localclientnum, "zm_weapons/fx8_music_box_zombie_flame_trail", self, "j_spine4");
            return;
        }
        if (newval == 0) {
            if (isdefined(self.fx_id)) {
                deletefx(localclientnum, self.fx_id);
                self.fx_id = undefined;
            }
        }
    }
}


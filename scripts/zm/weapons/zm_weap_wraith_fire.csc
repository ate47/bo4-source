#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace zm_weap_wraith_fire;

// Namespace zm_weap_wraith_fire/zm_weap_wraith_fire
// Params 0, eflags: 0x2
// Checksum 0x5486ebfb, Offset: 0x1a0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wraith_fire_zm", &__init__, undefined, undefined);
}

// Namespace zm_weap_wraith_fire/zm_weap_wraith_fire
// Params 0, eflags: 0x0
// Checksum 0x723df54f, Offset: 0x1e8
// Size: 0xb4
function __init__() {
    clientfield::register("actor", "" + #"hash_682f9312e30af478", 1, 1, "int", &function_87bfd935, 0, 0);
    clientfield::register("actor", "" + #"hash_7fcff4f8340f11f7", 1, 1, "int", &function_f144789c, 0, 0);
}

// Namespace zm_weap_wraith_fire/zm_weap_wraith_fire
// Params 7, eflags: 0x0
// Checksum 0xaaa85f44, Offset: 0x2a8
// Size: 0x1d2
function function_87bfd935(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        str_tag = "j_spinelower";
        if (!isdefined(self gettagorigin(str_tag))) {
            str_tag = "j_spine4";
            if (!isdefined(self gettagorigin(str_tag))) {
                str_tag = "tag_origin";
            }
        }
        self.var_cd4ce49e = util::playfxontag(localclientnum, "zm_weapons/fx8_equip_mltv_fire_human_torso_loop_zm", self, str_tag);
        self thread function_8847b8aa(localclientnum);
        self.var_2be01485 = level._effect[#"hash_5dfe974bf370a5f4"];
        return;
    }
    if (isdefined(self.var_cd4ce49e)) {
        stopfx(localclientnum, self.var_cd4ce49e);
        self.var_cd4ce49e = undefined;
    }
    if (isdefined(self.var_803e161e)) {
        foreach (n_fx_id in self.var_803e161e) {
            stopfx(localclientnum, n_fx_id);
        }
        self.var_803e161e = undefined;
    }
}

// Namespace zm_weap_wraith_fire/zm_weap_wraith_fire
// Params 7, eflags: 0x0
// Checksum 0xed04a299, Offset: 0x488
// Size: 0x1a2
function function_f144789c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (isdefined(self.var_71a7fc1c)) {
            stopfx(localclientnum, self.var_71a7fc1c);
        }
        str_tag = "j_spineupper";
        if (!isdefined(self gettagorigin(str_tag))) {
            str_tag = "tag_origin";
        }
        self.var_71a7fc1c = util::playfxontag(localclientnum, "zm_weapons/fx8_equip_mltv_fire_human_torso_loop_zm", self, str_tag);
        return;
    }
    if (isdefined(self.var_71a7fc1c)) {
        stopfx(localclientnum, self.var_71a7fc1c);
        self.var_71a7fc1c = undefined;
    }
    if (isdefined(self.var_803e161e)) {
        foreach (n_fx_id in self.var_803e161e) {
            stopfx(localclientnum, n_fx_id);
        }
        self.var_803e161e = undefined;
    }
}

// Namespace zm_weap_wraith_fire/zm_weap_wraith_fire
// Params 1, eflags: 0x4
// Checksum 0x302d2ff1, Offset: 0x638
// Size: 0x1d2
function private function_8847b8aa(localclientnum) {
    self endon(#"death", #"hash_395dfda1274cd506");
    wait 1;
    a_str_tags = [];
    a_str_tags[0] = "j_elbow_le";
    a_str_tags[1] = "j_elbow_ri";
    a_str_tags[2] = "j_knee_ri";
    a_str_tags[3] = "j_knee_le";
    a_str_tags = array::randomize(a_str_tags);
    self.var_803e161e = [];
    self.var_803e161e[0] = util::playfxontag(localclientnum, "zm_weapons/fx8_equip_mltv_fire_human_head_loop_zm", self, a_str_tags[0]);
    wait 1;
    a_str_tags[0] = "j_wrist_ri";
    a_str_tags[1] = "j_wrist_le";
    if (!(isdefined(self.missinglegs) && self.missinglegs)) {
        a_str_tags[2] = "j_ankle_ri";
        a_str_tags[3] = "j_ankle_le";
    }
    a_str_tags = array::randomize(a_str_tags);
    self.var_803e161e[1] = util::playfxontag(localclientnum, "zm_weapons/fx8_equip_mltv_fire_human_head_loop_zm", self, a_str_tags[0]);
    self.var_803e161e[2] = util::playfxontag(localclientnum, "zm_weapons/fx8_equip_mltv_fire_human_head_loop_zm", self, a_str_tags[1]);
}


#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace namespace_9ff9f642;

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 0, eflags: 0x2
// Checksum 0xf924fc1e, Offset: 0x120
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_308dff40d53a7287", &__init__, undefined, undefined);
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 0, eflags: 0x0
// Checksum 0x3f70200a, Offset: 0x168
// Size: 0x5c
function __init__() {
    clientfield::register("actor", "" + #"hash_419c1c8da4dc53a9", 1, 1, "int", &function_f4515ba8, 0, 0);
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 7, eflags: 0x0
// Checksum 0x55f4b52, Offset: 0x1d0
// Size: 0x1ea
function function_f4515ba8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        str_tag = "j_spinelower";
        if (!isdefined(self gettagorigin(str_tag))) {
            str_tag = "tag_origin";
        }
        if (isdefined(level._effect) && isdefined(level._effect[#"character_fire_death_torso"])) {
            self.var_62f2a054 = util::playfxontag(localclientnum, level._effect[#"character_fire_death_torso"], self, str_tag);
        }
        self thread function_8847b8aa(localclientnum);
        self.var_2be01485 = undefined;
        return;
    }
    self notify(#"hash_395dfda1274cd506");
    if (isdefined(self.var_62f2a054)) {
        stopfx(localclientnum, self.var_62f2a054);
        self.var_62f2a054 = undefined;
    }
    if (isdefined(self.var_803e161e)) {
        foreach (n_fx_id in self.var_803e161e) {
            stopfx(localclientnum, n_fx_id);
        }
        self.var_803e161e = undefined;
    }
}

// Namespace namespace_9ff9f642/namespace_9ff9f642
// Params 1, eflags: 0x4
// Checksum 0x8c75eecd, Offset: 0x3c8
// Size: 0x20a
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
    self.var_803e161e[0] = util::playfxontag(localclientnum, level._effect[#"character_fire_death_sm"], self, a_str_tags[0]);
    wait 1;
    a_str_tags[0] = "j_wrist_ri";
    a_str_tags[1] = "j_wrist_le";
    if (!(isdefined(self.missinglegs) && self.missinglegs)) {
        a_str_tags[2] = "j_ankle_ri";
        a_str_tags[3] = "j_ankle_le";
    }
    a_str_tags = array::randomize(a_str_tags);
    self.var_803e161e[1] = util::playfxontag(localclientnum, level._effect[#"character_fire_death_sm"], self, a_str_tags[0]);
    self.var_803e161e[2] = util::playfxontag(localclientnum, level._effect[#"character_fire_death_sm"], self, a_str_tags[1]);
}


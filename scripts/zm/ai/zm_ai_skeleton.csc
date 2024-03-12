// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai\systems\fx_character.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace zm_ai_skeleton;

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x2
// Checksum 0x34693aae, Offset: 0x130
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_skeleton", &__init__, undefined, undefined);
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x5 linked
// Checksum 0xace552fc, Offset: 0x178
// Size: 0x114
function private __init__() {
    clientfield::register("scriptmover", "" + #"spartoi_reassemble_clientfield", 16000, 1, "int", &function_d83c0144, 0, 0);
    clientfield::register("actor", "" + #"hash_3a6a3e4ef0a1a999", 16000, 1, "counter", &function_9e6319c8, 0, 0);
    ai::add_archetype_spawn_function(#"skeleton", &skeletonspawnsetup);
    ai::add_archetype_spawn_function(#"skeleton", &function_3b8e5273);
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x5 linked
// Checksum 0x85a52469, Offset: 0x298
// Size: 0x4c
function private skeletonspawnsetup(localclientnum) {
    self util::waittill_dobj(localclientnum);
    if (isdefined(self)) {
        fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
    }
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x5 linked
// Checksum 0x86190406, Offset: 0x2f0
// Size: 0xc2
function private function_3b8e5273(localclientnum) {
    if (self.var_9fde8624 === #"hash_342763a42d8fbca" || self.var_9fde8624 === #"hash_fd7b9665529dd42") {
        if (!(isdefined(level.shield_streaming) && level.shield_streaming)) {
            level.shield_streaming = 1;
            forcestreamxmodel(#"c_t8_zmb_dlc2_skeleton_shield");
            wait(3);
            stopforcestreamingxmodel(#"c_t8_zmb_dlc2_skeleton_shield");
            level.shield_streaming = 0;
        }
    }
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 7, eflags: 0x5 linked
// Checksum 0xf13b46e5, Offset: 0x3c0
// Size: 0x146
function private function_d83c0144(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (newval == 1) {
        self.fx = function_239993de(localclientnum, "zm_ai/fx8_spartoi_reassemble_displace_trail", self, "tag_origin");
        if (!isdefined(self.var_45dc5e53)) {
            self playsound(0, #"hash_6804d485c5a3300a");
            self.var_45dc5e53 = self playloopsound(#"hash_2ee9559ba02d2e9e");
        }
        return;
    }
    stopfx(localclientnum, self.fx);
    if (isdefined(self.var_45dc5e53)) {
        self stoploopsound(self.var_45dc5e53);
        self.var_45dc5e53 = undefined;
    }
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 7, eflags: 0x5 linked
// Checksum 0xe2cb92dd, Offset: 0x510
// Size: 0x12c
function private function_9e6319c8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::waittill_dobj(localclientnum);
    if (newval == 1) {
        point = self gettagorigin("j_skeleton_shield");
        if (!isdefined(point)) {
            return;
        }
        angles = self.angles;
        forward = anglestoforward(angles);
        up = anglestoup(angles);
        playsound(localclientnum, #"hash_72db6f3f0e602a33", point);
        playfx(localclientnum, "impacts/fx8_bul_impact_metal_sm", point, forward, up);
    }
}


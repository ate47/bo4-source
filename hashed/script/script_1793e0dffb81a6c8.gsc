// Atian COD Tools GSC decompiler test
#using scripts\zm_common\util.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_trial_util.csc;
#using scripts\zm_common\zm_trial.csc;
#using scripts\zm_common\zm_pack_a_punch.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_841de7df;

// Namespace namespace_841de7df/namespace_841de7df
// Params 0, eflags: 0x2
// Checksum 0xdce5876c, Offset: 0x108
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_4ef9c479ac8da304", &__init__, undefined, undefined);
}

// Namespace namespace_841de7df/namespace_841de7df
// Params 0, eflags: 0x0
// Checksum 0xfae2a981, Offset: 0x150
// Size: 0xfc
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    clientfield::register("zbarrier", "" + #"hash_100f180bf5d2a517", 14000, 1, "int", &function_b245db69, 0, 0);
    level._effect[#"hash_1d15a2dad558ac8c"] = "zombie/fx8_packapunch_zmb_red_gauntlet";
    level._effect[#"hash_1d15a5dad558b1a5"] = "zombie/fx8_packapunch_zmb_red_gauntlet";
    zm_trial::register_challenge(#"hash_28d1b9857e2ca681", &on_begin, &on_end);
}

// Namespace namespace_841de7df/namespace_841de7df
// Params 2, eflags: 0x4
// Checksum 0x4fb3e590, Offset: 0x258
// Size: 0x14
function private on_begin(localclientnum, a_params) {
    
}

// Namespace namespace_841de7df/namespace_841de7df
// Params 1, eflags: 0x4
// Checksum 0x90276d0f, Offset: 0x278
// Size: 0xc
function private on_end(localclientnum) {
    
}

// Namespace namespace_841de7df/namespace_841de7df
// Params 0, eflags: 0x0
// Checksum 0x3bfd374d, Offset: 0x290
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"hash_28d1b9857e2ca681");
    return isdefined(challenge);
}

// Namespace namespace_841de7df/namespace_841de7df
// Params 7, eflags: 0x4
// Checksum 0x20f9042f, Offset: 0x2d0
// Size: 0x224
function private function_b245db69(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        if (isdefined(self.var_18f8b30b)) {
            self.var_18f8b30b delete();
        }
        if (isdefined(self.var_3b071bba)) {
            deletefx(localclientnum, self.var_3b071bba);
            self.var_3b071bba = undefined;
        }
        if (zm_utility::get_story() == 1) {
            self.var_18f8b30b = util::spawn_model(localclientnum, "tag_origin", self.origin, self.angles);
            self.var_3b071bba = util::playfxontag(localclientnum, level._effect[#"hash_1d15a2dad558ac8c"], self.var_18f8b30b, "tag_origin");
        } else {
            self.var_18f8b30b = util::spawn_model(localclientnum, "tag_origin", self.origin, self.angles);
            self.var_3b071bba = util::playfxontag(localclientnum, level._effect[#"hash_1d15a5dad558b1a5"], self.var_18f8b30b, "tag_origin");
        }
        return;
    }
    if (isdefined(self.var_3b071bba)) {
        deletefx(localclientnum, self.var_3b071bba);
        self.var_3b071bba = undefined;
    }
    if (isdefined(self.var_18f8b30b)) {
        self.var_18f8b30b delete();
    }
}


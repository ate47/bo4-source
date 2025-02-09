#using scripts\core_common\ai\systems\fx_character;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_utility;

#namespace zm_ai_tiger;

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x2
// Checksum 0x21b73a15, Offset: 0x168
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_tiger", &__init__, undefined, undefined);
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 0, eflags: 0x1 linked
// Checksum 0x8ca4c4ef, Offset: 0x1b0
// Size: 0x8c
function __init__() {
    clientfield::register("toplayer", "" + #"hash_14c746e550d9f3ca", 1, 2, "counter", &function_76110e92, 0, 0);
    ai::add_archetype_spawn_function(#"tiger", &function_6d7e1f79);
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xf8d6db05, Offset: 0x248
// Size: 0x74
function function_6d7e1f79(localclientnum) {
    self zm_utility::function_3a020b0f(localclientnum, "rob_zm_eyes_red", #"zm_ai/fx8_zombie_tiger_eye_glow_red");
    self.var_4703d488 = &function_3be6531a;
    self callback::on_shutdown(&on_entity_shutdown);
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 7, eflags: 0x1 linked
// Checksum 0xdae7dda4, Offset: 0x2c8
// Size: 0xc4
function function_76110e92(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (abs(newval - oldval) == 1) {
        self postfx::playpostfxbundle("pstfx_tiger_slash");
    } else {
        self postfx::playpostfxbundle("pstfx_tiger_slash_r_to_l");
    }
    self playsound(localclientnum, #"hash_53d906ab01cb30a1");
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 2, eflags: 0x1 linked
// Checksum 0xe6224459, Offset: 0x398
// Size: 0x84
function function_3be6531a(localclientnum, turned) {
    if (turned) {
        self zm_utility::function_3a020b0f(localclientnum, "rob_zm_eyes_green", #"zm_ai/fx8_zombie_tiger_eye_glow_green");
        return;
    }
    self zm_utility::function_3a020b0f(localclientnum, "rob_zm_eyes_red", #"zm_ai/fx8_zombie_tiger_eye_glow_red");
}

// Namespace zm_ai_tiger/zm_ai_tiger
// Params 1, eflags: 0x1 linked
// Checksum 0xf78bee22, Offset: 0x428
// Size: 0x104
function on_entity_shutdown(localclientnum) {
    if (isdefined(self)) {
        self zm_utility::good_barricade_damaged(localclientnum);
        origin = self gettagorigin("j_spine2");
        angles = self gettagangles("j_spine2");
        if (!isdefined(origin)) {
            origin = self.origin;
        }
        if (!isdefined(angles)) {
            angles = self.angles;
        }
        playfx(localclientnum, "zm_ai/fx8_zombie_tiger_death_exp", origin, anglestoforward(angles));
        playsound(0, #"hash_5f574d847a1ca1f0", self.origin);
    }
}


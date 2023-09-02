// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace zm_transform;

// Namespace zm_transform/zm_transformation
// Params 0, eflags: 0x2
// Checksum 0xf5131257, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_transform", &__init__, undefined, undefined);
}

// Namespace zm_transform/zm_transformation
// Params 0, eflags: 0x1 linked
// Checksum 0xdc142a64, Offset: 0x118
// Size: 0x94
function __init__() {
    clientfield::register("actor", "transformation_spawn", 1, 1, "int", &function_201c2cb7, 0, 0);
    clientfield::register("actor", "transformation_stream_split", 1, 1, "int", &function_341e5a97, 0, 0);
}

// Namespace zm_transform/zm_transformation
// Params 7, eflags: 0x1 linked
// Checksum 0x7043fd0a, Offset: 0x1b8
// Size: 0x74
function function_201c2cb7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self playrenderoverridebundle(isdefined(self.var_fab3cf78) ? self.var_fab3cf78 : #"hash_435832b390f73dff");
}

// Namespace zm_transform/zm_transformation
// Params 7, eflags: 0x1 linked
// Checksum 0x225d298c, Offset: 0x238
// Size: 0x156
function function_341e5a97(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        settingsbundle = self ai::function_9139c839();
        if (isdefined(settingsbundle) && isdefined(settingsbundle.var_d354164e)) {
            foreach (var_127d3a7a in settingsbundle.var_d354164e) {
                if (self.model === var_127d3a7a.var_a3c9023c) {
                    util::lock_model(var_127d3a7a.var_cdf1f53d);
                    self thread function_8a817bd6(var_127d3a7a.var_cdf1f53d);
                    break;
                }
            }
        }
    } else {
        self notify(#"unlock_model");
    }
}

// Namespace zm_transform/zm_transformation
// Params 1, eflags: 0x1 linked
// Checksum 0xc5c64c4c, Offset: 0x398
// Size: 0x4c
function function_8a817bd6(model) {
    self waittilltimeout(60, #"death", #"unlock_model");
    util::unlock_model(model);
}


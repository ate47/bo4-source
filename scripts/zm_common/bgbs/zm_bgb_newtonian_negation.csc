#using scripts\zm_common\zm_bgb;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\array_shared;

#namespace zm_bgb_newtonian_negation;

// Namespace zm_bgb_newtonian_negation/zm_bgb_newtonian_negation
// Params 0, eflags: 0x2
// Checksum 0x30fc0894, Offset: 0xb8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_newtonian_negation", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_newtonian_negation/zm_bgb_newtonian_negation
// Params 0, eflags: 0x1 linked
// Checksum 0x56d6119c, Offset: 0x108
// Size: 0x94
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    clientfield::register("world", "newtonian_negation", 1, 1, "int", &function_8622e664, 0, 0);
    bgb::register(#"zm_bgb_newtonian_negation", "time");
}

// Namespace zm_bgb_newtonian_negation/zm_bgb_newtonian_negation
// Params 7, eflags: 0x1 linked
// Checksum 0xdfafc148, Offset: 0x1a8
// Size: 0xbc
function function_8622e664(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        setdvar(#"phys_gravity_dir", (0, 0, -1));
        self notify(#"end_dynent_touching");
        return;
    }
    setdvar(#"phys_gravity_dir", (0, 0, 1));
    self thread function_e752a980(localclientnum);
}

// Namespace zm_bgb_newtonian_negation/zm_bgb_newtonian_negation
// Params 1, eflags: 0x1 linked
// Checksum 0x518281d8, Offset: 0x270
// Size: 0x190
function function_e752a980(localclientnum) {
    self endon(#"end_dynent_touching", #"disconnect");
    var_f42481ac = 0;
    a_dynents = getdynentarray();
    a_corpses = getentarraybytype(localclientnum, 17);
    var_f74f1323 = arraycombine(a_dynents, a_corpses, 1, 0);
    var_f74f1323 = array::randomize(var_f74f1323);
    foreach (var_863ce745 in var_f74f1323) {
        if (!isdefined(var_863ce745)) {
            continue;
        }
        physicsexplosionsphere(localclientnum, var_863ce745.origin, 2, 0, 5, undefined, undefined, 1, 1, 1);
        var_f42481ac++;
        if (var_f42481ac >= 5) {
            waitframe(1);
            var_f42481ac = 0;
        }
    }
}


// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace zm_items;

// Namespace zm_items/zm_items
// Params 0, eflags: 0x2
// Checksum 0x4a38b31e, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_items", &__init__, undefined, undefined);
}

// Namespace zm_items/zm_items
// Params 0, eflags: 0x1 linked
// Checksum 0x390e7327, Offset: 0x110
// Size: 0x4c
function __init__() {
    clientfield::register("item", "highlight_item", 1, 2, "int", &function_39e7c9dd, 0, 0);
}

// Namespace zm_items/zm_items
// Params 7, eflags: 0x1 linked
// Checksum 0xe212f465, Offset: 0x168
// Size: 0x84
function function_39e7c9dd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle("rob_sonar_set_friendly");
        return;
    }
    self stoprenderoverridebundle("rob_sonar_set_friendly");
}


#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_3417f8d2;

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x2
// Checksum 0xdb1799e7, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_684e9a488b07947", &init, undefined, undefined);
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x1 linked
// Checksum 0x2ccea48e, Offset: 0xf0
// Size: 0x24
function init() {
    init_fx();
    init_clientfields();
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x1 linked
// Checksum 0xcfaf2d85, Offset: 0x120
// Size: 0x32
function init_fx() {
    level._effect[#"hash_5cd079f7090da957"] = #"hash_468f18455c9e9e0f";
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 0, eflags: 0x1 linked
// Checksum 0xb44615a9, Offset: 0x160
// Size: 0x5c
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"hash_671ee63741834a25", 1, 1, "int", &function_c95aa114, 0, 0);
}

// Namespace namespace_3417f8d2/namespace_3417f8d2
// Params 7, eflags: 0x1 linked
// Checksum 0x49582040, Offset: 0x1c8
// Size: 0xbc
function function_c95aa114(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.blinking_fx = util::playfxontag(localclientnum, level._effect[#"hash_5cd079f7090da957"], self, "tag_light");
        return;
    }
    if (isdefined(self.blinking_fx)) {
        deletefx(localclientnum, self.blinking_fx);
    }
}


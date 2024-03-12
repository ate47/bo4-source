// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace wz_buoy_stash;

// Namespace wz_buoy_stash/wz_buoy_stash
// Params 0, eflags: 0x2
// Checksum 0xc555c9d6, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_buoy_stash", &__init__, undefined, undefined);
}

// Namespace wz_buoy_stash/wz_buoy_stash
// Params 0, eflags: 0x1 linked
// Checksum 0x916e8feb, Offset: 0x110
// Size: 0x4c
function __init__() {
    clientfield::register("scriptmover", "buoy_light_fx_changed", 1, 2, "int", &function_a99ec0bc, 0, 0);
}

// Namespace wz_buoy_stash/wz_buoy_stash
// Params 7, eflags: 0x1 linked
// Checksum 0x2e72125f, Offset: 0x168
// Size: 0xfa
function function_a99ec0bc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.fx_id)) {
        stopfx(0, self.fx_id);
    }
    switch (newval) {
    case 1:
        self.fx_id = util::playfxontag(localclientnum, #"hash_212c7fc08851dc9", self, "tag_light_buoy03_jnt");
        return;
    case 2:
        self.fx_id = util::playfxontag(localclientnum, #"hash_77d0b79144a0734d", self, "tag_light_buoy03_jnt");
        return;
    }
}


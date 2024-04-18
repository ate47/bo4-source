// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace destructible;

// Namespace destructible/destructible
// Params 0, eflags: 0x2
// Checksum 0xa806c1c9, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"destructible", &__init__, undefined, undefined);
}

// Namespace destructible/destructible
// Params 0, eflags: 0x0
// Checksum 0x8e179698, Offset: 0x108
// Size: 0x4c
function __init__() {
    clientfield::register("scriptmover", "start_destructible_explosion", 1, 10, "int", &doexplosion, 0, 0);
}

// Namespace destructible/destructible
// Params 7, eflags: 0x0
// Checksum 0x8dde642e, Offset: 0x160
// Size: 0x94
function playgrenaderumble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    playrumbleonposition(localclientnum, "grenade_rumble", self.origin);
    earthquake(localclientnum, 0.5, 0.5, self.origin, 800);
}

// Namespace destructible/destructible
// Params 7, eflags: 0x0
// Checksum 0xdbfc8e1, Offset: 0x200
// Size: 0x104
function doexplosion(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        return;
    }
    physics_explosion = 0;
    if (newval & 1 << 9) {
        physics_explosion = 1;
        newval -= 1 << 9;
    }
    physics_force = 0.3;
    if (physics_explosion && newval > 0) {
        physicsexplosionsphere(localclientnum, self.origin, newval, newval - 1, physics_force, 25, 400);
    }
    playgrenaderumble(localclientnum, self.origin);
}


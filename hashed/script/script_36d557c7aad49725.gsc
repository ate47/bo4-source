#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_87f097c4;

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 0, eflags: 0x2
// Checksum 0x2cea4751, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_7551e984c9a42af9", &__init__, undefined, undefined);
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 0, eflags: 0x1 linked
// Checksum 0x1f543c83, Offset: 0x120
// Size: 0x144
function __init__() {
    level.var_6e0c26c7 = (isdefined(getgametypesetting(#"hash_30b11d064f146fcc")) ? getgametypesetting(#"hash_30b11d064f146fcc") : 0) || (isdefined(getgametypesetting(#"hash_697d65a68cc6c6f1")) ? getgametypesetting(#"hash_697d65a68cc6c6f1") : 0);
    if (level.var_6e0c26c7) {
        clientfield::register("world", "zombie_arm_blood_splash", 20000, 1, "counter", &zombie_arm_blood_splash, 0, 0);
        clientfield::register("world", "bathtub_fake_soul_sfx", 20000, 1, "counter", &bathtub_fake_soul_sfx, 0, 0);
    }
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 7, eflags: 0x1 linked
// Checksum 0x1cf0c20b, Offset: 0x270
// Size: 0xa4
function zombie_arm_blood_splash(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    bathtub = struct::get(#"zombie_bathub", "targetname");
    if (isdefined(bathtub)) {
        playfx(localclientnum, #"hash_6e2b2bcea07134d1", bathtub.origin, (0, 0, 1));
    }
}

// Namespace namespace_87f097c4/namespace_9d765bae
// Params 7, eflags: 0x1 linked
// Checksum 0x7dd77ea, Offset: 0x320
// Size: 0xac
function bathtub_fake_soul_sfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    wait 0.2;
    bathtub = struct::get(#"zombie_bathub", "targetname");
    if (isdefined(bathtub)) {
        playsound(localclientnum, #"zmb_sq_souls_impact", bathtub.origin);
    }
}


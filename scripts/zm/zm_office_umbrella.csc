#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;

#namespace zm_office_umbrella;

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 0, eflags: 0x2
// Checksum 0x56d2ac35, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_office_umbrella", &__init__, undefined, undefined);
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 0, eflags: 0x0
// Checksum 0x4fa0d220, Offset: 0x100
// Size: 0xb4
function __init__() {
    clientfield::register("toplayer", "" + #"hash_f2d0b920043dbbd", 1, 1, "counter", &function_87d68f99, 0, 0);
    clientfield::register("world", "" + #"narrative_room", 1, 1, "int", &narrative_room, 0, 0);
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 7, eflags: 0x0
// Checksum 0x6962c8d7, Offset: 0x1c0
// Size: 0x8c
function function_87d68f99(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval) {
        self thread postfx::playpostfxbundle(#"hash_5e9232163a119c6b");
        playsound(localclientnum, #"hash_50a56f17fc412b92", (0, 0, 0));
    }
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 7, eflags: 0x0
// Checksum 0xf8a11820, Offset: 0x258
// Size: 0x84
function narrative_room(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        function_a5777754(localclientnum, "lab_supply");
        return;
    }
    function_73b1f242(localclientnum, "lab_supply");
}


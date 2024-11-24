#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace killcam;

// Namespace killcam/killcam_shared
// Params 0, eflags: 0x2
// Checksum 0x8501ff0e, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"killcam", &__init__, undefined, undefined);
}

// Namespace killcam/killcam_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xc0
// Size: 0x4
function __init__() {
    
}


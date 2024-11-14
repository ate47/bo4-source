#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\filter_shared;
#using scripts\core_common\callbacks_shared;

#namespace demo;

// Namespace demo/demo_shared
// Params 0, eflags: 0x2
// Checksum 0x2f979049, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"demo", &__init__, undefined, undefined);
}

// Namespace demo/demo_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x83f25adf, Offset: 0xe0
// Size: 0x18
function __init__() {
    if (!isdemoplaying()) {
        return;
    }
}


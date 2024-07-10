#using scripts\zm_common\zm_utility.csc;
#using script_4990d85086acf096;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace zm_hud;

// Namespace zm_hud/zm_hud
// Params 0, eflags: 0x2
// Checksum 0xe1c2eaa8, Offset: 0xa8
// Size: 0x54
function autoexec __init__system__() {
    system::register(#"zm_hud", &__init__, &__main__, #"zm_crafting");
}

// Namespace zm_hud/zm_hud
// Params 0, eflags: 0x1 linked
// Checksum 0xbe41d796, Offset: 0x108
// Size: 0x1c
function __init__() {
    zm_location::register("zm_location");
}

// Namespace zm_hud/zm_hud
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x130
// Size: 0x4
function __main__() {
    
}


#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_insta_kill;

// Namespace zm_powerup_insta_kill/zm_powerup_insta_kill
// Params 0, eflags: 0x2
// Checksum 0x3ae6d5db, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_insta_kill", &__init__, undefined, undefined);
}

// Namespace zm_powerup_insta_kill/zm_powerup_insta_kill
// Params 0, eflags: 0x1 linked
// Checksum 0x906af0e9, Offset: 0xf0
// Size: 0x4c
function __init__() {
    zm_powerups::include_zombie_powerup("insta_kill");
    if (zm_powerups::function_cc33adc8()) {
        zm_powerups::add_zombie_powerup("insta_kill", "powerup_instant_kill");
    }
}


#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_utility;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\struct;

#namespace zm_weap_cymbal_monkey;

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x2
// Checksum 0xcbc24b2c, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_cymbal_monkey", &__init__, undefined, undefined);
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x1 linked
// Checksum 0x54971771, Offset: 0x158
// Size: 0xe0
function __init__() {
    clientfield::register("scriptmover", "" + #"hash_60a7e5b79e8064a5", 1, 1, "int", &monkey_spawns, 0, 0);
    if (isdefined(level.legacy_cymbal_monkey) && level.legacy_cymbal_monkey) {
        level.cymbal_monkey_model = "weapon_zombie_monkey_bomb";
    } else {
        level.cymbal_monkey_model = "wpn_t7_zmb_monkey_bomb_world";
    }
    if (!zm_weapons::is_weapon_included(getweapon(#"cymbal_monkey"))) {
        return;
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 7, eflags: 0x1 linked
// Checksum 0x1903746a, Offset: 0x240
// Size: 0xd4
function monkey_spawns(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        waitframe(1);
        v_up = (360, 0, 0);
        v_forward = (0, 0, 360);
        if (isdefined(self)) {
            playfx(localclientnum, "maps/zm_white/fx8_monkey_bomb_reveal", self.origin, v_forward, v_up);
            self playsound(localclientnum, #"hash_21206f1b7fb27f81");
        }
    }
}


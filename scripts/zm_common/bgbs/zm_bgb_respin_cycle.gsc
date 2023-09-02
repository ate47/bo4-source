// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_bgb_respin_cycle;

// Namespace zm_bgb_respin_cycle/zm_bgb_respin_cycle
// Params 0, eflags: 0x2
// Checksum 0x722cd7a9, Offset: 0xf0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_respin_cycle", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_respin_cycle/zm_bgb_respin_cycle
// Params 0, eflags: 0x1 linked
// Checksum 0x3a3e8854, Offset: 0x140
// Size: 0xa4
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_respin_cycle", "activated", 1, undefined, undefined, &validation, &activation);
    clientfield::register("zbarrier", "zm_bgb_respin_cycle", 1, 1, "counter");
}

// Namespace zm_bgb_respin_cycle/zm_bgb_respin_cycle
// Params 0, eflags: 0x1 linked
// Checksum 0x1d9f15d1, Offset: 0x1f0
// Size: 0x90
function validation() {
    for (i = 0; i < level.chests.size; i++) {
        chest = level.chests[i];
        if (isdefined(chest.zbarrier.weapon_model) && isdefined(chest.chest_user) && self == chest.chest_user) {
            return 1;
        }
    }
    return 0;
}

// Namespace zm_bgb_respin_cycle/zm_bgb_respin_cycle
// Params 0, eflags: 0x1 linked
// Checksum 0x26cd6295, Offset: 0x288
// Size: 0xb6
function activation() {
    self endon(#"disconnect");
    for (i = 0; i < level.chests.size; i++) {
        chest = level.chests[i];
        if (isdefined(chest.zbarrier.weapon_model) && isdefined(chest.chest_user) && self == chest.chest_user) {
            chest thread function_80b33681(self);
        }
    }
}

// Namespace zm_bgb_respin_cycle/zm_bgb_respin_cycle
// Params 1, eflags: 0x1 linked
// Checksum 0xf452bb1e, Offset: 0x348
// Size: 0x19c
function function_80b33681(player) {
    self.zbarrier clientfield::increment("zm_bgb_respin_cycle");
    if (isdefined(self.zbarrier.weapon_model)) {
        self.zbarrier.weapon_model notify(#"kill_respin_think_thread");
    }
    self.no_fly_away = 1;
    self.zbarrier notify(#"box_hacked_respin");
    self.zbarrier playsound(#"zmb_bgb_powerup_respin");
    self thread zm_unitrigger::unregister_unitrigger(self.unitrigger_stub);
    self.zbarrier thread zm_magicbox::treasure_chest_weapon_spawn(self, player);
    self.zbarrier waittill(#"randomization_done");
    self.no_fly_away = undefined;
    if (!level flag::get("moving_chest_now")) {
        self.grab_weapon_hint = 1;
        self.grab_weapon = self.zbarrier.weapon;
        self thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &zm_magicbox::magicbox_unitrigger_think);
        self thread zm_magicbox::treasure_chest_timeout();
    }
}


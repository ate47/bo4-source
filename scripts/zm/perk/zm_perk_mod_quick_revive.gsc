#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_perk_mod_quick_revive;

// Namespace zm_perk_mod_quick_revive/zm_perk_mod_quick_revive
// Params 0, eflags: 0x2
// Checksum 0x45087633, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_quick_revive", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_quick_revive/zm_perk_mod_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x25ae13bd, Offset: 0x100
// Size: 0x14
function __init__() {
    enable_quick_revive_perk_for_level();
}

// Namespace zm_perk_mod_quick_revive/zm_perk_mod_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x86245dc3, Offset: 0x120
// Size: 0xb4
function enable_quick_revive_perk_for_level() {
    zm_perks::register_perk_mod_basic_info(#"specialty_mod_quickrevive", "mod_revive", #"perk_quick_revive", #"specialty_quickrevive", 2500);
    zm_perks::register_perk_threads(#"specialty_mod_quickrevive", &give_perk, &take_perk);
    callback::on_revived(&on_revived);
}

// Namespace zm_perk_mod_quick_revive/zm_perk_mod_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0x2cb2ca71, Offset: 0x1e0
// Size: 0x1c
function give_perk() {
    self thread monitor_health_regen();
}

// Namespace zm_perk_mod_quick_revive/zm_perk_mod_quick_revive
// Params 4, eflags: 0x1 linked
// Checksum 0x7c91d7e6, Offset: 0x208
// Size: 0x74
function take_perk(b_pause, str_perk, str_result, n_slot) {
    self notify(#"hash_478eed143ecc82fc");
    if (self hasperk(#"specialty_sprintspeed")) {
        self perks::perk_unsetperk(#"specialty_sprintspeed");
    }
}

// Namespace zm_perk_mod_quick_revive/zm_perk_mod_quick_revive
// Params 1, eflags: 0x1 linked
// Checksum 0x5deaa7f9, Offset: 0x288
// Size: 0xc4
function on_revived(s_params) {
    if (isplayer(s_params.e_reviver) && s_params.e_reviver hasperk(#"specialty_mod_quickrevive")) {
        s_params.e_reviver zm_utility::set_max_health();
        s_params.e_reviver thread function_118be9d8();
    } else {
        return;
    }
    if (isplayer(s_params.e_revivee)) {
        s_params.e_revivee thread function_118be9d8();
    }
}

// Namespace zm_perk_mod_quick_revive/zm_perk_mod_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0xc5e1739f, Offset: 0x358
// Size: 0x8e
function monitor_health_regen() {
    self endon(#"hash_478eed143ecc82fc", #"disconnect");
    while (true) {
        self waittill(#"snd_breathing_better");
        if (!(isdefined(self.heal.enabled) && self.heal.enabled)) {
            continue;
        }
        self thread function_118be9d8();
        wait 3;
    }
}

// Namespace zm_perk_mod_quick_revive/zm_perk_mod_quick_revive
// Params 0, eflags: 0x1 linked
// Checksum 0xc59cae18, Offset: 0x3f0
// Size: 0xcc
function function_118be9d8() {
    self notify("16d61e93859b61b7");
    self endon("16d61e93859b61b7");
    self endon(#"hash_478eed143ecc82fc", #"disconnect");
    if (!self hasperk(#"specialty_sprintspeed")) {
        self perks::perk_setperk(#"specialty_sprintspeed");
    }
    wait 3;
    if (self hasperk(#"specialty_sprintspeed")) {
        self perks::perk_unsetperk(#"specialty_sprintspeed");
    }
}


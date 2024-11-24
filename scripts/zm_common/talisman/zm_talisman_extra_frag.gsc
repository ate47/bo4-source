#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_talisman;
#using scripts\zm_common\zm_utility;

#namespace zm_talisman_extra_frag;

// Namespace zm_talisman_extra_frag/zm_talisman_extra_frag
// Params 0, eflags: 0x2
// Checksum 0x6c019f92, Offset: 0xe0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_extra_frag", &__init__, undefined, undefined);
}

// Namespace zm_talisman_extra_frag/zm_talisman_extra_frag
// Params 0, eflags: 0x1 linked
// Checksum 0x10d63840, Offset: 0x128
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_extra_frag", &activate_talisman);
}

// Namespace zm_talisman_extra_frag/zm_talisman_extra_frag
// Params 0, eflags: 0x1 linked
// Checksum 0x6c375951, Offset: 0x160
// Size: 0x54
function activate_talisman() {
    callback::on_spawned(&function_fbcc1e50);
    self.b_talisman_extra_frag = 1;
    zm_loadout::register_lethal_grenade_for_level(#"eq_frag_grenade_extra");
}

// Namespace zm_talisman_extra_frag/zm_talisman_extra_frag
// Params 0, eflags: 0x1 linked
// Checksum 0x37faf9ae, Offset: 0x1c0
// Size: 0x124
function function_fbcc1e50() {
    self endon(#"disconnect");
    if (!(isdefined(self.b_talisman_extra_frag) && self.b_talisman_extra_frag)) {
        return;
    }
    level flagsys::wait_till(#"all_players_spawned");
    if (self.slot_weapons[#"lethal_grenade"] === getweapon(#"eq_frag_grenade")) {
        self takeweapon(getweapon(#"eq_frag_grenade"));
        self giveweapon(getweapon(#"eq_frag_grenade_extra"));
        self zm_loadout::set_player_lethal_grenade(getweapon(#"eq_frag_grenade_extra"));
    }
}


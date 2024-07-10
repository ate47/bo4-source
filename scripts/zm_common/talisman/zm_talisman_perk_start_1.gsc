#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_talisman.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_talisman_perk_start_1;

// Namespace zm_talisman_perk_start_1/zm_talisman_perk_start_1
// Params 0, eflags: 0x2
// Checksum 0x442b3502, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_perk_start_1", &__init__, undefined, undefined);
}

// Namespace zm_talisman_perk_start_1/zm_talisman_perk_start_1
// Params 0, eflags: 0x1 linked
// Checksum 0xb0cbc9a6, Offset: 0x118
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_perk_start_1", &activate_talisman);
}

// Namespace zm_talisman_perk_start_1/zm_talisman_perk_start_1
// Params 0, eflags: 0x1 linked
// Checksum 0x5a4f5694, Offset: 0x150
// Size: 0x3e
function activate_talisman() {
    if (isdefined(self.var_c27f1e90) && zm_custom::function_d9f0defb(self.var_c27f1e90[0])) {
        self.talisman_perk_start_1 = 1;
    }
}


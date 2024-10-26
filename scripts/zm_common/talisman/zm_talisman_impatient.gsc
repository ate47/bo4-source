#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_talisman.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_talisman_impatient;

// Namespace zm_talisman_impatient/zm_talisman_impatient
// Params 0, eflags: 0x2
// Checksum 0x24be7b42, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_impatient", &__init__, undefined, undefined);
}

// Namespace zm_talisman_impatient/zm_talisman_impatient
// Params 0, eflags: 0x1 linked
// Checksum 0xae2a2284, Offset: 0x130
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_impatient", &activate_talisman);
}

// Namespace zm_talisman_impatient/zm_talisman_impatient
// Params 0, eflags: 0x1 linked
// Checksum 0x815dcdc6, Offset: 0x168
// Size: 0x58
function activate_talisman() {
    self endon(#"disconnect");
    self.var_135a4148 = 0;
    while (true) {
        self waittill(#"bled_out");
        self thread special_revive();
    }
}

// Namespace zm_talisman_impatient/zm_talisman_impatient
// Params 0, eflags: 0x1 linked
// Checksum 0x3cc0adb8, Offset: 0x1c8
// Size: 0x134
function special_revive() {
    self endon(#"disconnect", #"end_of_round");
    if (self.var_135a4148 == zm_round_logic::get_round_number()) {
        return;
    }
    if (level.zombie_total <= 3) {
        wait 1;
    }
    n_target_kills = level.zombie_player_killed_count + 100;
    while (level.zombie_player_killed_count < n_target_kills && level.zombie_total >= 3) {
        waitframe(1);
    }
    self.var_135a4148 = zm_round_logic::get_round_number();
    self zm_player::spectator_respawn_player();
    self val::set(#"talisman_impatient", "ignoreme");
    wait 5;
    self val::reset(#"talisman_impatient", "ignoreme");
}


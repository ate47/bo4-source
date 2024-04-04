// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_bgb_burned_out;

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 0, eflags: 0x2
// Checksum 0xaf93a916, Offset: 0x148
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_burned_out", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 0, eflags: 0x1 linked
// Checksum 0x4c1dbf2b, Offset: 0x198
// Size: 0x164
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_burned_out", "event", &event, undefined, undefined, undefined);
    clientfield::register("toplayer", "zm_bgb_burned_out" + "_1p" + "toplayer", 1, 1, "counter");
    clientfield::register("allplayers", "zm_bgb_burned_out" + "_3p" + "_allplayers", 1, 1, "counter");
    clientfield::register("actor", "zm_bgb_burned_out" + "_fire_torso" + "_actor", 1, 1, "counter");
    clientfield::register("vehicle", "zm_bgb_burned_out" + "_fire_torso" + "_vehicle", 1, 1, "counter");
}

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 0, eflags: 0x1 linked
// Checksum 0xf73b4fc2, Offset: 0x308
// Size: 0x180
function event() {
    self endon(#"disconnect", #"bgb_update");
    var_3c24cb96 = 0;
    self thread bgb::set_timer(3, 3);
    for (;;) {
        waitresult = self waittill(#"damage", #"damage_armor");
        type = waitresult.mod;
        attacker = waitresult.attacker;
        if ("MOD_MELEE" != type || !isai(attacker)) {
            continue;
        }
        self thread result();
        self playsound(#"zmb_bgb_powerup_burnedout");
        var_3c24cb96++;
        self thread bgb::set_timer(3 - var_3c24cb96, 3);
        self bgb::do_one_shot_use();
        if (3 <= var_3c24cb96) {
            return;
        }
        wait(1.5);
    }
}

// Namespace zm_bgb_burned_out/zm_bgb_burned_out
// Params 0, eflags: 0x1 linked
// Checksum 0x22f8524d, Offset: 0x490
// Size: 0x3c6
function result() {
    self clientfield::increment_to_player("zm_bgb_burned_out" + "_1p" + "toplayer");
    self clientfield::increment("zm_bgb_burned_out" + "_3p" + "_allplayers");
    zombies = array::get_all_closest(self.origin, getaiteamarray(level.zombie_team), undefined, undefined, 128);
    if (!isdefined(zombies)) {
        return;
    }
    dist_sq = 128 * 128;
    var_7694ea6b = [];
    for (i = 0; i < zombies.size; i++) {
        if (zombies[i].var_6f84b820 !== #"basic" && zombies[i].var_6f84b820 !== #"popcorn" && zombies[i].var_6f84b820 !== #"enhanced") {
            continue;
        }
        if (isdefined(zombies[i].ignore_nuke) && zombies[i].ignore_nuke) {
            continue;
        }
        if (isdefined(zombies[i].marked_for_death) && zombies[i].marked_for_death) {
            continue;
        }
        if (zm_utility::is_magic_bullet_shield_enabled(zombies[i])) {
            continue;
        }
        zombies[i].marked_for_death = 1;
        if (!isalive(zombies[i])) {
            continue;
        }
        if (isvehicle(zombies[i])) {
            zombies[i] clientfield::increment("zm_bgb_burned_out" + "_fire_torso" + "_vehicle");
        } else {
            zombies[i] clientfield::increment("zm_bgb_burned_out" + "_fire_torso" + "_actor");
        }
        var_7694ea6b[var_7694ea6b.size] = zombies[i];
    }
    for (i = 0; i < var_7694ea6b.size; i++) {
        util::wait_network_frame();
        if (!isdefined(var_7694ea6b[i])) {
            continue;
        }
        if (zm_utility::is_magic_bullet_shield_enabled(var_7694ea6b[i])) {
            continue;
        }
        var_7694ea6b[i] dodamage(var_7694ea6b[i].health + 666, var_7694ea6b[i].origin, self, undefined, undefined, "MOD_BURNED", 0, level.weapondefault);
        if (isdefined(self)) {
            self zm_stats::increment_challenge_stat(#"gum_gobbler_burned_out");
        }
    }
}


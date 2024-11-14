#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_laststand;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\perks;
#using scripts\core_common\flag_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\aat_shared;

#namespace namespace_e38c57c1;

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 0, eflags: 0x2
// Checksum 0xea0f2566, Offset: 0xf8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"hash_7576c66086ab62aa", &__init__, &__main__, undefined);
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 0, eflags: 0x1 linked
// Checksum 0xefec6934, Offset: 0x148
// Size: 0x4c
function __init__() {
    /#
        if (getdvarint(#"hash_4894e3a42dd84dfa", 0)) {
            callback::on_connect(&on_player_connect);
        }
    #/
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 0, eflags: 0x1 linked
// Checksum 0x78bfbbd, Offset: 0x1a0
// Size: 0x44
function __main__() {
    /#
        if (getdvarint(#"hash_4894e3a42dd84dfa", 0)) {
            level thread devgui();
        }
    #/
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 1, eflags: 0x0
// Checksum 0xde50a6c9, Offset: 0x1f0
// Size: 0x21a
function function_9af806be(var_c5b25bc5) {
    /#
        if (isdefined(self.var_2fe40b9d)) {
            self function_2a94cd59();
        }
    #/
    self.var_2fe40b9d = var_c5b25bc5;
    switch (var_c5b25bc5) {
    case 1:
        self player::function_2a67df65(#"fl1", -50);
        self zm_utility::set_max_health();
        break;
    case 2:
        self perks::perk_setperk(#"hash_53010725c65a98a5");
        break;
    case 3:
        self player::function_2a67df65(#"db1", 50);
        self zm_utility::set_max_health();
        break;
    case 4:
        self perks::perk_setperk(#"hash_130074ec6de7a431");
        break;
    case 5:
        self perks::perk_setperk(#"hash_1bc7d0ea42d1d0a8");
        break;
    case 6:
        self zm_laststand::function_3a00302e(1);
        if (!isdefined(self.n_regen_delay)) {
            self.n_regen_delay = zombie_utility::get_zombie_var("player_health_regen_delay");
        }
        self.n_regen_delay += 1;
        break;
    }
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 0, eflags: 0x0
// Checksum 0xaaae11d7, Offset: 0x418
// Size: 0x19a
function function_2a94cd59() {
    /#
        var_c5b25bc5 = self.var_2fe40b9d;
    #/
    self.var_2fe40b9d = undefined;
    /#
        switch (var_c5b25bc5) {
        case 1:
            self player::function_b933de24(#"fl1");
            break;
        case 2:
            self perks::perk_unsetperk(#"hash_53010725c65a98a5");
            break;
        case 3:
            self player::function_b933de24(#"db1");
            break;
        case 4:
            self perks::perk_unsetperk(#"hash_130074ec6de7a431");
            break;
        case 5:
            self perks::perk_unsetperk(#"hash_1bc7d0ea42d1d0a8");
            break;
        case 6:
            self zm_laststand::function_409dc98e(1, 0);
            self.n_regen_delay -= 1;
            break;
        }
    #/
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 1, eflags: 0x1 linked
// Checksum 0x378cdf31, Offset: 0x5c0
// Size: 0x18
function function_6a7a1533(var_c5b25bc5) {
    return self.var_2fe40b9d === var_c5b25bc5;
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 12, eflags: 0x1 linked
// Checksum 0x3c4ac181, Offset: 0x5e0
// Size: 0x1ba
function actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (!isplayer(attacker) || !isdefined(attacker.var_2fe40b9d)) {
        return damage;
    }
    switch (attacker.var_2fe40b9d) {
    case 1:
        if (attacker zm_weapons::function_f5a0899d(weapon, 0)) {
            damage *= 1.15;
        }
        break;
    case 3:
        if (attacker zm_weapons::function_f5a0899d(weapon, 0)) {
            damage *= 0.85;
        }
        break;
    case 6:
        if (meansofdeath == "MOD_MELEE" && isdefined(weapon) && !weapon.isriotshield && !zm_loadout::is_hero_weapon(weapon)) {
            damage += 200;
        }
        break;
    }
    return int(damage);
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 0, eflags: 0x1 linked
// Checksum 0x6db0b200, Offset: 0x7a8
// Size: 0x24
function function_183814d3() {
    self thread function_68992377(1, 1000);
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 0, eflags: 0x1 linked
// Checksum 0x8517a486, Offset: 0x7d8
// Size: 0x24
function function_c3f3716() {
    self thread function_68992377(3, 500);
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 1, eflags: 0x1 linked
// Checksum 0x3d4912ce, Offset: 0x808
// Size: 0x60
function function_863dc0ef(n_cost) {
    if (self function_6a7a1533(-1000)) {
        n_cost += -1000;
        return int(max(n_cost, 0));
    }
    return n_cost;
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 0, eflags: 0x1 linked
// Checksum 0xbc5dabd5, Offset: 0x870
// Size: 0x5c
function function_cbf286b0() {
    if (!isdefined(self.var_2fe40b9d)) {
        return 0;
    }
    switch (self.var_2fe40b9d) {
    case 2:
        return 0.25;
    case 4:
        return -0.25;
    }
    return 0;
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 1, eflags: 0x1 linked
// Checksum 0x9387cb24, Offset: 0x8d8
// Size: 0x46
function function_3da195ec(weapon) {
    if (!self function_6a7a1533(5)) {
        return false;
    }
    if (aat::is_exempt_weapon(weapon)) {
        return false;
    }
    return true;
}

// Namespace namespace_e38c57c1/namespace_e38c57c1
// Params 2, eflags: 0x5 linked
// Checksum 0x6ea1535c, Offset: 0x928
// Size: 0x5c
function private function_68992377(var_c5b25bc5, var_97f3fbb7) {
    self endon(#"disconnect");
    if (self function_6a7a1533(var_c5b25bc5)) {
        wait 1;
        self zm_score::add_to_player_score(var_97f3fbb7);
    }
}

/#

    // Namespace namespace_e38c57c1/namespace_e38c57c1
    // Params 0, eflags: 0x0
    // Checksum 0x20fcdfd8, Offset: 0x990
    // Size: 0x650
    function devgui() {
        adddebugcommand("<dev string:x38>");
        adddebugcommand("<dev string:x9d>");
        adddebugcommand("<dev string:x101>");
        adddebugcommand("<dev string:x162>");
        adddebugcommand("<dev string:x1c5>");
        adddebugcommand("<dev string:x22a>");
        adddebugcommand("<dev string:x28d>");
        level.var_8e9d88b6 = [];
        level.var_8e9d88b6[#"fl1"] = 1;
        level.var_8e9d88b6[#"tn1"] = 2;
        level.var_8e9d88b6[#"db1"] = 3;
        level.var_8e9d88b6[#"bf1"] = 4;
        level.var_8e9d88b6[#"helmets1"] = 5;
        level.var_8e9d88b6[#"season1"] = 6;
        while (true) {
            waitframe(1);
            str_command = getdvarstring(#"hash_443a451d4b2f9de2", "<dev string:x2e0>");
            switch (str_command) {
            case #"bf1":
            case #"fl1":
            case #"season1":
            case #"helmets1":
            case #"tn1":
            case #"db1":
                foreach (e_player in getplayers()) {
                    e_player function_9af806be(level.var_8e9d88b6[str_command]);
                }
                break;
            case #"clear":
                foreach (e_player in getplayers()) {
                    e_player function_2a94cd59();
                }
                break;
            case #"player_4_tn1":
            case #"hash_114b0d4db1699d85":
            case #"hash_138c6bb93906947e":
            case #"hash_15ba4b3713a7633c":
            case #"hash_34fa2d4dc5eb050f":
            case #"hash_361dd9611538c0df":
            case #"player_2_tn1":
            case #"hash_410061a21976fb0d":
            case #"hash_41af396a9a424584":
            case #"hash_41e44f4b44ea8a50":
            case #"hash_42e797318220640c":
            case #"player_1_tn1":
            case #"hash_478329f218767aab":
            case #"hash_481abb611f991c37":
            case #"player_3_tn1":
            case #"hash_4ebf4bdbdeca4671":
            case #"hash_53c07f6aa4b3f3d2":
            case #"hash_544ef1318c01b458":
            case #"hash_546d41eb20e9ed47":
            case #"hash_5642f90448974736":
            case #"hash_5a4711612a21ad6d":
            case #"hash_6601596aaf4e0e5e":
            case #"hash_66603731967362a6":
            case #"hash_7f4e4b4da709788d":
                n_player = int(strtok(str_command, "<dev string:x2e3>")[1]);
                var_afaaaae2 = strtok(str_command, "<dev string:x2e3>")[2];
                function_c1ccd7f3(&function_9af806be, n_player, level.var_8e9d88b6[var_afaaaae2]);
                break;
            case #"hash_39098b3e5f02ee30":
            case #"hash_3b6473dd2b0c56c7":
            case #"hash_10e7f44f002ed3c6":
            case #"hash_33d0946a156bc141":
                n_player = int(strtok(str_command, "<dev string:x2e3>")[1]);
                function_c1ccd7f3(&function_2a94cd59, n_player);
                break;
            default:
                break;
            }
            setdvar(#"hash_443a451d4b2f9de2", "<dev string:x2e0>");
        }
    }

    // Namespace namespace_e38c57c1/namespace_e38c57c1
    // Params 0, eflags: 0x0
    // Checksum 0x21e04e7c, Offset: 0xfe8
    // Size: 0x4c
    function on_player_connect() {
        self endon(#"disconnect");
        level flag::wait_till("<dev string:x2e7>");
        self devgui_player_menu();
    }

    // Namespace namespace_e38c57c1/namespace_e38c57c1
    // Params 3, eflags: 0x20 variadic
    // Checksum 0x42959f1a, Offset: 0x1040
    // Size: 0x74
    function function_c1ccd7f3(var_fc09f1a3, n_player, ...) {
        a_e_players = getplayers();
        if (a_e_players.size >= n_player) {
            util::single_func_argarray(a_e_players[n_player - 1], var_fc09f1a3, vararg);
        }
    }

    // Namespace namespace_e38c57c1/namespace_e38c57c1
    // Params 0, eflags: 0x0
    // Checksum 0xf5799266, Offset: 0x10c0
    // Size: 0x274
    function devgui_player_menu() {
        self function_1c3ffffd();
        var_21c1ba1 = self getentitynumber() + 1;
        adddebugcommand("<dev string:x302>" + self.name + "<dev string:x322>" + var_21c1ba1 + "<dev string:x328>" + var_21c1ba1 + "<dev string:x372>");
        adddebugcommand("<dev string:x302>" + self.name + "<dev string:x322>" + var_21c1ba1 + "<dev string:x37c>" + var_21c1ba1 + "<dev string:x3c5>");
        adddebugcommand("<dev string:x302>" + self.name + "<dev string:x322>" + var_21c1ba1 + "<dev string:x3cf>" + var_21c1ba1 + "<dev string:x415>");
        adddebugcommand("<dev string:x302>" + self.name + "<dev string:x322>" + var_21c1ba1 + "<dev string:x41f>" + var_21c1ba1 + "<dev string:x468>");
        adddebugcommand("<dev string:x302>" + self.name + "<dev string:x322>" + var_21c1ba1 + "<dev string:x472>" + var_21c1ba1 + "<dev string:x4b7>");
        adddebugcommand("<dev string:x302>" + self.name + "<dev string:x322>" + var_21c1ba1 + "<dev string:x4c6>" + var_21c1ba1 + "<dev string:x50a>");
        adddebugcommand("<dev string:x302>" + self.name + "<dev string:x322>" + var_21c1ba1 + "<dev string:x518>" + var_21c1ba1 + "<dev string:x54a>");
    }

    // Namespace namespace_e38c57c1/namespace_e38c57c1
    // Params 0, eflags: 0x0
    // Checksum 0x3ff5e3f9, Offset: 0x1340
    // Size: 0x34
    function function_1c3ffffd() {
        adddebugcommand("<dev string:x556>" + self.name + "<dev string:x579>");
    }

#/

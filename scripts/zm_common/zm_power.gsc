// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_power;

// Namespace zm_power/zm_power
// Params 0, eflags: 0x2
// Checksum 0x6678a63c, Offset: 0x210
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_power", &__init__, &__main__, undefined);
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x1 linked
// Checksum 0xa945dfe0, Offset: 0x260
// Size: 0x1e
function __init__() {
    level.powered_items = [];
    level.local_power = [];
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x1 linked
// Checksum 0x938f0128, Offset: 0x288
// Size: 0x44
function __main__() {
    thread standard_powered_items();
    level thread electric_switch_init();
    /#
        thread debug_powered_items();
    #/
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x0
// Checksum 0x585175d7, Offset: 0x2d8
// Size: 0xea
function debug_powered_items() {
    /#
        while (1) {
            if (getdvarint(#"zombie_equipment_health", 0)) {
                if (isdefined(level.local_power)) {
                    foreach (localpower in level.local_power) {
                        circle(localpower.origin, localpower.radius, (1, 0, 0), 0, 1, 1);
                    }
                }
            }
            waitframe(1);
        }
    #/
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x1 linked
// Checksum 0x21db757b, Offset: 0x3d0
// Size: 0x84
function electric_switch_init() {
    trigs = getentarray("use_elec_switch", "targetname");
    if (isdefined(level.temporary_power_switch_logic)) {
        array::thread_all(trigs, level.temporary_power_switch_logic, trigs);
    } else {
        array::thread_all(trigs, &electric_switch);
    }
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x1 linked
// Checksum 0x8015001c, Offset: 0x460
// Size: 0x810
function electric_switch() {
    self endon(#"hash_21e36726a7f30458");
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.target)) {
        ent_parts = getentarray(self.target, "targetname");
        struct_parts = struct::get_array(self.target, "targetname");
        foreach (ent in ent_parts) {
            if (isdefined(ent.script_noteworthy)) {
                master_switch = ent;
                switch (ent.script_noteworthy) {
                case #"elec_switch":
                    break;
                case #"hash_47bde376753a03c9":
                    break;
                case #"artifact_mind":
                    break;
                }
            }
        }
        foreach (struct in struct_parts) {
            if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "elec_switch_fx") {
                fx_pos = struct;
            }
        }
    }
    while (isdefined(self)) {
        if (isdefined(master_switch) && isdefined(master_switch.script_noteworthy) && !(isdefined(self.var_1d2fecd6) && self.var_1d2fecd6)) {
            switch (master_switch.script_noteworthy) {
            case #"elec_switch":
                if (function_8b1a219a()) {
                    self sethintstring(#"hash_5c4125d53451e888");
                } else {
                    self sethintstring(#"hash_5d8ba3059b5e82e4");
                }
                break;
            case #"hash_47bde376753a03c9":
                if (function_8b1a219a()) {
                    self sethintstring(#"hash_5c4125d53451e888");
                } else {
                    self sethintstring(#"hash_5d8ba3059b5e82e4");
                }
                break;
            case #"artifact_mind":
                level waittill(#"player_spawned");
                if (function_8b1a219a()) {
                    self sethintstring(#"hash_10cc78ab5ba5a7f2");
                } else {
                    self sethintstring(#"hash_60e4802baafefe56");
                }
                break;
            }
        }
        self setvisibletoall();
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        user = waitresult.activator;
        if (isdefined(self.var_b9eb2dbb) && self.var_b9eb2dbb) {
            self.var_1d2fecd6 = 1;
            waitframe(1);
            continue;
        }
        self setinvisibletoall();
        power_zone = undefined;
        if (isdefined(self.script_int)) {
            power_zone = self.script_int;
        }
        level thread zm_perks::perk_unpause_all_perks(power_zone);
        if (isdefined(master_switch) && isdefined(master_switch.script_noteworthy)) {
            switch (master_switch.script_noteworthy) {
            case #"elec_switch":
                elec_switch_on(master_switch, fx_pos);
                break;
            case #"hash_47bde376753a03c9":
                function_9d9892d2(master_switch);
                break;
            case #"artifact_mind":
                artifact_mind_on(master_switch, fx_pos, user);
                break;
            }
        }
        level turn_power_on_and_open_doors(power_zone);
        switchentnum = self getentitynumber();
        if (isdefined(switchentnum) && isdefined(user)) {
            user recordmapevent(17, gettime(), user.origin, level.round_number, switchentnum);
        }
        if (isplayer(user)) {
            user util::delay(1, "death", &zm_audio::create_and_play_dialog, #"power_switch", #"activate", undefined, 2);
        }
        if (!isdefined(self.script_noteworthy) || self.script_noteworthy != "allow_power_off") {
            self delete();
            return;
        }
        if (isdefined(master_switch) && isdefined(master_switch.script_noteworthy)) {
            switch (master_switch.script_noteworthy) {
            case #"elec_switch":
                self sethintstring(#"hash_3071a199ee6ad7a6");
                break;
            }
        }
        self setvisibletoall();
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        user = waitresult.activator;
        self setinvisibletoall();
        level thread zm_perks::perk_pause_all_perks(power_zone);
        if (isdefined(master_switch) && isdefined(master_switch.script_noteworthy)) {
            switch (master_switch.script_noteworthy) {
            case #"elec_switch":
                elec_switch_off(master_switch);
                break;
            }
        }
        if (isdefined(switchentnum) && isdefined(user)) {
            user recordmapevent(18, gettime(), user.origin, level.round_number, switchentnum);
        }
        level turn_power_off_and_close_doors(power_zone);
    }
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x1 linked
// Checksum 0x870d4386, Offset: 0xc78
// Size: 0xc4
function elec_switch_on(master_switch, fx_pos) {
    master_switch rotateroll(-90, 0.3);
    master_switch playsound(#"zmb_switch_flip");
    master_switch waittill(#"rotatedone");
    master_switch playsound(#"zmb_turn_on");
    if (isdefined(fx_pos)) {
        playfx(level._effect[#"switch_sparks"], fx_pos.origin);
    }
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x1 linked
// Checksum 0xf94a7eec, Offset: 0xd48
// Size: 0x44
function elec_switch_off(master_switch) {
    master_switch rotateroll(90, 0.3);
    master_switch waittill(#"rotatedone");
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x1 linked
// Checksum 0x99da707f, Offset: 0xd98
// Size: 0x74
function function_9d9892d2(master_switch) {
    if (isdefined(master_switch.model_on)) {
        master_switch setmodel(master_switch.model_on);
    }
    if (isdefined(master_switch.bundle)) {
        master_switch thread scene::play(master_switch.bundle, "ON", master_switch);
    }
}

// Namespace zm_power/zm_power
// Params 3, eflags: 0x1 linked
// Checksum 0xeac5b61c, Offset: 0xe18
// Size: 0x48
function artifact_mind_on(master_switch, fx_pos, user) {
    level notify(#"hash_3e80d503318a5674", {#player:user});
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x1 linked
// Checksum 0xdfbc211d, Offset: 0xe68
// Size: 0x80
function watch_global_power() {
    while (1) {
        level flag::wait_till("power_on");
        level thread set_global_power(1);
        level flag::wait_till_clear("power_on");
        level thread set_global_power(0);
    }
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x1 linked
// Checksum 0x2442ffbe, Offset: 0xef0
// Size: 0x374
function standard_powered_items() {
    level flag::wait_till("start_zombie_round_logic");
    vending_machines = zm_perks::get_perk_machines();
    foreach (trigger in vending_machines) {
        powered_on = zm_perks::get_perk_machine_start_state(trigger.script_noteworthy);
        powered_perk = add_powered_item(&perk_power_on, &perk_power_off, &perk_range, &cost_low_if_local, 0, powered_on, trigger);
        if (isdefined(trigger.script_int)) {
            powered_perk thread zone_controlled_perk(trigger.script_int);
        }
    }
    if (zm_custom::function_901b751c(#"zmpowerdoorstate") != 0) {
        zombie_doors = getentarray("zombie_door", "targetname");
        foreach (door in zombie_doors) {
            if (isdefined(door.script_noteworthy) && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door")) {
                add_powered_item(&door_power_on, &door_power_off, &door_range, &cost_door, 0, 0, door);
            } else if (isdefined(door.script_noteworthy) && door.script_noteworthy == "local_electric_door") {
                power_sources = 0;
                if (!(isdefined(level.power_local_doors_globally) && level.power_local_doors_globally)) {
                    power_sources = 1;
                }
                add_powered_item(&door_local_power_on, &door_local_power_off, &door_range, &cost_door, power_sources, 0, door);
            }
        }
    }
    thread watch_global_power();
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x1 linked
// Checksum 0xacf6f1a7, Offset: 0x1270
// Size: 0x90
function zone_controlled_perk(zone) {
    while (1) {
        power_flag = "power_on" + zone;
        level flag::wait_till(power_flag);
        self thread perk_power_on();
        level flag::wait_till_clear(power_flag);
        self thread perk_power_off();
    }
}

// Namespace zm_power/zm_power
// Params 7, eflags: 0x1 linked
// Checksum 0x443a899c, Offset: 0x1308
// Size: 0x112
function add_powered_item(power_on_func, power_off_func, range_func, cost_func, power_sources, self_powered, target) {
    powered = spawnstruct();
    powered.power_on_func = power_on_func;
    powered.power_off_func = power_off_func;
    powered.range_func = range_func;
    powered.power_sources = power_sources;
    powered.self_powered = self_powered;
    powered.target = target;
    powered.cost_func = cost_func;
    powered.power = self_powered;
    powered.powered_count = self_powered;
    powered.depowered_count = 0;
    level.powered_items[level.powered_items.size] = powered;
    return powered;
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x1 linked
// Checksum 0xd78e0434, Offset: 0x1428
// Size: 0x2c
function remove_powered_item(powered) {
    arrayremovevalue(level.powered_items, powered, 0);
}

// Namespace zm_power/zm_power
// Params 7, eflags: 0x0
// Checksum 0x29ca3d74, Offset: 0x1460
// Size: 0x1a0
function add_temp_powered_item(power_on_func, power_off_func, range_func, cost_func, power_sources, self_powered, target) {
    powered = add_powered_item(power_on_func, power_off_func, range_func, cost_func, power_sources, self_powered, target);
    if (isdefined(level.local_power)) {
        foreach (localpower in level.local_power) {
            if (powered [[ powered.range_func ]](1, localpower.origin, localpower.radius)) {
                powered change_power(1, localpower.origin, localpower.radius);
                if (!isdefined(localpower.added_list)) {
                    localpower.added_list = [];
                }
                localpower.added_list[localpower.added_list.size] = powered;
            }
        }
    }
    thread watch_temp_powered_item(powered);
    return powered;
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x1 linked
// Checksum 0x897eed5, Offset: 0x1608
// Size: 0x118
function watch_temp_powered_item(powered) {
    powered.target waittill(#"death");
    remove_powered_item(powered);
    if (isdefined(level.local_power)) {
        foreach (localpower in level.local_power) {
            if (isdefined(localpower.added_list)) {
                arrayremovevalue(localpower.added_list, powered, 0);
            }
            if (isdefined(localpower.enabled_list)) {
                arrayremovevalue(localpower.enabled_list, powered, 0);
            }
        }
    }
}

// Namespace zm_power/zm_power
// Params 3, eflags: 0x1 linked
// Checksum 0x8c8dfa0c, Offset: 0x1728
// Size: 0xe4
function change_power_in_radius(delta, origin, radius) {
    changed_list = [];
    for (i = 0; i < level.powered_items.size; i++) {
        powered = level.powered_items[i];
        if (powered.power_sources != 2 && powered [[ powered.range_func ]](delta, origin, radius)) {
            powered change_power(delta, origin, radius);
            changed_list[changed_list.size] = powered;
        }
    }
    return changed_list;
}

// Namespace zm_power/zm_power
// Params 3, eflags: 0x1 linked
// Checksum 0xed919a77, Offset: 0x1818
// Size: 0xa8
function change_power(delta, origin, radius) {
    if (delta > 0) {
        if (!self.power) {
            self.power = 1;
            self [[ self.power_on_func ]](origin, radius);
        }
        self.powered_count++;
    } else if (delta < 0) {
        if (self.power) {
            self.power = 0;
            self [[ self.power_off_func ]](origin, radius);
        }
        self.depowered_count++;
    }
}

// Namespace zm_power/zm_power
// Params 4, eflags: 0x1 linked
// Checksum 0x3947d501, Offset: 0x18c8
// Size: 0x7e
function revert_power_to_list(delta, origin, radius, powered_list) {
    for (i = 0; i < powered_list.size; i++) {
        powered = powered_list[i];
        powered revert_power(delta, origin, radius);
    }
}

// Namespace zm_power/zm_power
// Params 4, eflags: 0x1 linked
// Checksum 0xe1f5b681, Offset: 0x1950
// Size: 0x130
function revert_power(delta, origin, radius, powered_list) {
    if (delta > 0) {
        self.depowered_count--;
        /#
            assert(self.depowered_count >= 0, "<unknown string>");
        #/
        if (self.depowered_count == 0 && self.powered_count > 0 && !self.power) {
            self.power = 1;
            self [[ self.power_on_func ]](origin, radius);
        }
    } else if (delta < 0) {
        self.powered_count--;
        /#
            assert(self.powered_count >= 0, "<unknown string>");
        #/
        if (self.powered_count == 0 && self.power) {
            self.power = 0;
            self [[ self.power_off_func ]](origin, radius);
        }
    }
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x0
// Checksum 0x698cf27f, Offset: 0x1a88
// Size: 0xce
function add_local_power(origin, radius) {
    localpower = spawnstruct();
    /#
        println("<unknown string>" + origin + "<unknown string>" + radius + "<unknown string>");
    #/
    localpower.origin = origin;
    localpower.radius = radius;
    localpower.enabled_list = change_power_in_radius(1, origin, radius);
    level.local_power[level.local_power.size] = localpower;
    return localpower;
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x0
// Checksum 0xe3257b0e, Offset: 0x1b60
// Size: 0x1ba
function move_local_power(localpower, origin) {
    changed_list = [];
    for (i = 0; i < level.powered_items.size; i++) {
        powered = level.powered_items[i];
        if (powered.power_sources == 2) {
            continue;
        }
        waspowered = isinarray(localpower.enabled_list, powered);
        ispowered = powered [[ powered.range_func ]](1, origin, localpower.radius);
        if (ispowered && !waspowered) {
            powered change_power(1, origin, localpower.radius);
            localpower.enabled_list[localpower.enabled_list.size] = powered;
        } else if (!ispowered && waspowered) {
            powered revert_power(-1, localpower.origin, localpower.radius, localpower.enabled_list);
            arrayremovevalue(localpower.enabled_list, powered, 0);
        }
    }
    localpower.origin = origin;
    return localpower;
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x0
// Checksum 0x6bad8bdb, Offset: 0x1d28
// Size: 0x114
function end_local_power(localpower) {
    /#
        println("<unknown string>" + localpower.origin + "<unknown string>" + localpower.radius + "<unknown string>");
    #/
    if (isdefined(localpower.enabled_list)) {
        revert_power_to_list(-1, localpower.origin, localpower.radius, localpower.enabled_list);
    }
    localpower.enabled_list = undefined;
    if (isdefined(localpower.added_list)) {
        revert_power_to_list(-1, localpower.origin, localpower.radius, localpower.added_list);
    }
    localpower.added_list = undefined;
    arrayremovevalue(level.local_power, localpower, 0);
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x0
// Checksum 0xcc728773, Offset: 0x1e48
// Size: 0xc4
function has_local_power(origin) {
    if (isdefined(level.local_power)) {
        foreach (localpower in level.local_power) {
            if (distancesquared(localpower.origin, origin) < localpower.radius * localpower.radius) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x1 linked
// Checksum 0x593c7543, Offset: 0x1f18
// Size: 0xa4
function get_powered_item_cost() {
    if (!(isdefined(self.power) && self.power)) {
        return 0;
    }
    if (isdefined(level._power_global) && level._power_global && !(self.power_sources == 1)) {
        return 0;
    }
    cost = [[ self.cost_func ]]();
    power_sources = self.powered_count;
    if (power_sources < 1) {
        power_sources = 1;
    }
    return cost / power_sources;
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x0
// Checksum 0x599fa8a9, Offset: 0x1fc8
// Size: 0x158
function get_local_power_cost(localpower) {
    cost = 0;
    if (isdefined(localpower) && isdefined(localpower.enabled_list)) {
        foreach (powered in localpower.enabled_list) {
            cost = cost + powered get_powered_item_cost();
        }
    }
    if (isdefined(localpower) && isdefined(localpower.added_list)) {
        foreach (powered in localpower.added_list) {
            cost = cost + powered get_powered_item_cost();
        }
    }
    return cost;
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x1 linked
// Checksum 0x81e59605, Offset: 0x2128
// Size: 0xfe
function set_global_power(on_off) {
    demo::bookmark(#"zm_power", gettime(), undefined, undefined, 1);
    potm::bookmark(#"zm_power", gettime(), undefined, undefined, 1);
    level._power_global = on_off;
    for (i = 0; i < level.powered_items.size; i++) {
        powered = level.powered_items[i];
        if (isdefined(powered.target) && powered.power_sources != 1) {
            powered global_power(on_off);
            util::wait_network_frame();
        }
    }
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x1 linked
// Checksum 0xacecf3e6, Offset: 0x2230
// Size: 0xfc
function global_power(on_off) {
    if (on_off) {
        /#
            println("<unknown string>");
        #/
        if (!self.power) {
            self.power = 1;
            self [[ self.power_on_func ]]();
        }
        self.powered_count++;
    } else {
        /#
            println("<unknown string>");
        #/
        self.powered_count--;
        /#
            assert(self.powered_count >= 0, "<unknown string>");
        #/
        if (self.powered_count == 0 && self.power) {
            self.power = 0;
            self [[ self.power_off_func ]]();
        }
    }
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x0
// Checksum 0x64e085ef, Offset: 0x2338
// Size: 0x14
function never_power_on(origin, radius) {
    
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x0
// Checksum 0xf9921e77, Offset: 0x2358
// Size: 0x14
function never_power_off(origin, radius) {
    
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x0
// Checksum 0x5d154d0d, Offset: 0x2378
// Size: 0x32
function cost_negligible() {
    if (isdefined(self.one_time_cost)) {
        cost = self.one_time_cost;
        self.one_time_cost = undefined;
        return cost;
    }
    return 0;
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x1 linked
// Checksum 0x3c34940, Offset: 0x23b8
// Size: 0x72
function cost_low_if_local() {
    if (isdefined(self.one_time_cost)) {
        cost = self.one_time_cost;
        self.one_time_cost = undefined;
        return cost;
    }
    if (isdefined(level._power_global) && level._power_global || isdefined(self.self_powered) && self.self_powered) {
        return 0;
    }
    return 1;
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x0
// Checksum 0x5a455f38, Offset: 0x2438
// Size: 0x34
function cost_high() {
    if (isdefined(self.one_time_cost)) {
        cost = self.one_time_cost;
        self.one_time_cost = undefined;
        return cost;
    }
    return 10;
}

// Namespace zm_power/zm_power
// Params 3, eflags: 0x1 linked
// Checksum 0x7927b78d, Offset: 0x2478
// Size: 0x60
function door_range(delta, origin, radius) {
    if (delta < 0) {
        return 0;
    }
    if (distancesquared(self.target.origin, origin) < radius * radius) {
        return 1;
    }
    return 0;
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x1 linked
// Checksum 0x55cd01ff, Offset: 0x24e0
// Size: 0x5c
function door_power_on(origin, radius) {
    /#
        println("<unknown string>");
    #/
    self.target.power_on = 1;
    self.target notify(#"power_on");
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x1 linked
// Checksum 0x9378a182, Offset: 0x2548
// Size: 0x5e
function door_power_off(origin, radius) {
    /#
        println("<unknown string>");
    #/
    self.target notify(#"power_off");
    self.target.power_on = 0;
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x1 linked
// Checksum 0x9d625eab, Offset: 0x25b0
// Size: 0x5c
function door_local_power_on(origin, radius) {
    /#
        println("<unknown string>");
    #/
    self.target.local_power_on = 1;
    self.target notify(#"local_power_on");
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x1 linked
// Checksum 0x8217f5aa, Offset: 0x2618
// Size: 0x5e
function door_local_power_off(origin, radius) {
    /#
        println("<unknown string>");
    #/
    self.target notify(#"local_power_off");
    self.target.local_power_on = 0;
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x1 linked
// Checksum 0x15d6c7ec, Offset: 0x2680
// Size: 0x92
function cost_door() {
    if (isdefined(self.target.power_cost)) {
        if (!isdefined(self.one_time_cost)) {
            self.one_time_cost = 0;
        }
        self.one_time_cost = self.one_time_cost + self.target.power_cost;
        self.target.power_cost = 0;
    }
    if (isdefined(self.one_time_cost)) {
        cost = self.one_time_cost;
        self.one_time_cost = undefined;
        return cost;
    }
    return 0;
}

// Namespace zm_power/zm_power
// Params 3, eflags: 0x0
// Checksum 0x6455a1ce, Offset: 0x2720
// Size: 0x7e
function zombie_range(delta, origin, radius) {
    if (delta > 0) {
        return 0;
    }
    self.zombies = array::get_all_closest(origin, zombie_utility::get_round_enemy_array(), undefined, undefined, radius);
    if (!isdefined(self.zombies)) {
        return 0;
    }
    self.power = 1;
    return 1;
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x0
// Checksum 0x1c185d0f, Offset: 0x27a8
// Size: 0x84
function zombie_power_off(origin, radius) {
    /#
        println("<unknown string>");
    #/
    for (i = 0; i < self.zombies.size; i++) {
        self.zombies[i] thread stun_zombie();
        waitframe(1);
    }
}

// Namespace zm_power/zm_power
// Params 0, eflags: 0x1 linked
// Checksum 0x6521147e, Offset: 0x2838
// Size: 0xa2
function stun_zombie() {
    self notify(#"stun_zombie");
    self endon(#"death", #"stun_zombie");
    if (self.health <= 0) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    if (isdefined(self.ignore_inert) && self.ignore_inert) {
        return;
    }
    if (isdefined(self.stun_zombie)) {
        self thread [[ self.stun_zombie ]]();
        return;
    }
}

// Namespace zm_power/zm_power
// Params 3, eflags: 0x1 linked
// Checksum 0xb56a24c6, Offset: 0x28e8
// Size: 0xf0
function perk_range(delta, origin, radius) {
    if (isdefined(self.target)) {
        perkorigin = self.target.origin;
        if (isdefined(self.target.trigger_off) && self.target.trigger_off) {
            perkorigin = self.target.realorigin;
        } else if (isdefined(self.target.disabled) && self.target.disabled) {
            perkorigin = perkorigin + vectorscale((0, 0, 1), 10000);
        }
        if (distancesquared(perkorigin, origin) < radius * radius) {
            return 1;
        }
    }
    return 0;
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x1 linked
// Checksum 0x57a7f3b6, Offset: 0x29e0
// Size: 0x9c
function perk_power_on(origin, radius) {
    /#
        println("<unknown string>" + self.target zm_perks::getvendingmachinenotify() + "<unknown string>");
    #/
    level notify(self.target zm_perks::getvendingmachinenotify() + "_on");
    zm_perks::perk_unpause(self.target.script_noteworthy);
}

// Namespace zm_power/zm_power
// Params 2, eflags: 0x1 linked
// Checksum 0x6d07343, Offset: 0x2a88
// Size: 0x17a
function perk_power_off(origin, radius) {
    notify_name = self.target zm_perks::getvendingmachinenotify();
    if (isdefined(notify_name) && notify_name == "revive") {
        if (level flag::exists("solo_game") && level flag::get("solo_game")) {
            return;
        }
    }
    /#
        println("<unknown string>" + self.target.script_noteworthy + "<unknown string>");
    #/
    self.target notify(#"death");
    self.target thread zm_perks::vending_trigger_think();
    if (isdefined(self.target.perk_hum)) {
        self.target.perk_hum delete();
    }
    zm_perks::perk_pause(self.target.script_noteworthy);
    level notify(self.target zm_perks::getvendingmachinenotify() + "_off");
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x1 linked
// Checksum 0x46cbce4e, Offset: 0x2c10
// Size: 0x34c
function turn_power_on_and_open_doors(power_zone) {
    level.local_doors_stay_open = 1;
    level.power_local_doors_globally = 1;
    if (!isdefined(power_zone)) {
        level flag::set("power_on");
        level clientfield::set("zombie_power_on", 1);
    } else {
        level flag::set("power_on" + power_zone);
        level clientfield::set("zombie_power_on", power_zone + 1);
    }
    foreach (player in level.players) {
        player zm_stats::function_8f10788e("boas_power_turnedon");
    }
    if (zm_custom::function_901b751c(#"zmpowerdoorstate") != 0) {
        zombie_doors = getentarray("zombie_door", "targetname");
        foreach (door in zombie_doors) {
            if (!isdefined(door.script_noteworthy)) {
                continue;
            }
            if (!isdefined(power_zone) && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door")) {
                door notify(#"power_on");
            } else if (isdefined(door.script_int) && door.script_int == power_zone && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door")) {
                door notify(#"power_on");
                if (isdefined(level.temporary_power_switch_logic)) {
                    door.power_on = 1;
                }
            } else if (isdefined(door.script_int) && door.script_int == power_zone && door.script_noteworthy === "local_electric_door") {
                door notify(#"local_power_on");
            }
        }
    }
}

// Namespace zm_power/zm_power
// Params 1, eflags: 0x1 linked
// Checksum 0xcc60e11a, Offset: 0x2f68
// Size: 0x2ec
function turn_power_off_and_close_doors(power_zone) {
    level.local_doors_stay_open = 0;
    level.power_local_doors_globally = 0;
    if (!isdefined(power_zone)) {
        level flag::clear("power_on");
        level clientfield::set("zombie_power_off", 0);
    } else {
        level flag::clear("power_on" + power_zone);
        level clientfield::set("zombie_power_off", power_zone);
    }
    if (zm_custom::function_901b751c(#"zmpowerdoorstate") != 0) {
        zombie_doors = getentarray("zombie_door", "targetname");
        foreach (door in zombie_doors) {
            if (!isdefined(door.script_noteworthy)) {
                continue;
            }
            if (!isdefined(power_zone) && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door")) {
                door notify(#"power_on");
            } else if (isdefined(door.script_int) && door.script_int == power_zone && (door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door")) {
                door notify(#"power_on");
                if (isdefined(level.temporary_power_switch_logic)) {
                    door.power_on = 0;
                    door sethintstring(#"hash_71158766520dc432");
                    door notify(#"kill_door_think");
                    door thread zm_blockers::door_think();
                }
            } else if (isdefined(door.script_noteworthy) && door.script_noteworthy == "local_electric_door") {
                door notify(#"local_power_on");
            }
        }
    }
}


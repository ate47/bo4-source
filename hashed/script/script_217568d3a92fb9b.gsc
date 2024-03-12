// Atian COD Tools GSC decompiler test
#using scripts\core_common\player\player_stats.gsc;
#using scripts\mp_common\item_world.gsc;
#using scripts\mp_common\item_drop.gsc;

#namespace namespace_10277d51;

// Namespace namespace_10277d51/level_init
// Params 1, eflags: 0x40
// Checksum 0x87b1d9cf, Offset: 0xd0
// Size: 0xbc
function event_handler[level_init] main(eventstruct) {
    var_c1ffc425 = getdynentarray("blastdoor_button");
    foreach (blast_door_button in var_c1ffc425) {
        blast_door_button.onuse = &function_ed401dbd;
    }
    level thread function_a2279366();
}

// Namespace namespace_10277d51/namespace_10277d51
// Params 0, eflags: 0x1 linked
// Checksum 0xac584acb, Offset: 0x198
// Size: 0x5b0
function function_a2279366() {
    level.var_3f2c54f = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_50aa80a9bcb3b127")) ? getgametypesetting(#"hash_50aa80a9bcb3b127") : 0);
    if (!level.var_3f2c54f) {
        blastdoorbuttons = getdynentarray("blastdoor_button");
        foreach (button in blastdoorbuttons) {
            function_e2a06860(button, 1);
        }
        item_world::function_1b11e73c();
        specialitems = function_91b29d2a("blast_doors_special_weapon");
        foreach (specialitem in specialitems) {
            item_world::consume_item(specialitem);
        }
        item_world::function_4de3ca98();
        blastdoorbuttons = getdynentarray("blastdoor_button");
        foreach (button in blastdoorbuttons) {
            function_e2a06860(button, 1);
        }
        supplystashes = getdynentarray("blast_doors_supply_stash");
        foreach (supplystash in supplystashes) {
            if (function_8a8a409b(supplystash)) {
                item_world::function_160294c7(supplystash);
            }
        }
        specialitems = function_91b29d2a("blast_doors_special_weapon");
        foreach (specialitem in specialitems) {
            item_world::consume_item(specialitem);
        }
        return;
    }
    item_world::function_1b11e73c();
    specialitems = function_91b29d2a("blast_doors_special_weapon");
    foreach (specialitem in specialitems) {
        item_world::consume_item(specialitem);
    }
    item_world::function_4de3ca98();
    var_cb10151b = 0;
    supplystashes = getdynentarray("blast_doors_supply_stash");
    foreach (supplystash in supplystashes) {
        if (function_8a8a409b(supplystash)) {
            var_cb10151b = 1;
            break;
        }
    }
    if (var_cb10151b) {
        specialitems = function_91b29d2a("blast_doors_special_weapon");
        foreach (specialitem in specialitems) {
            item_world::consume_item(specialitem);
        }
    }
}

// Namespace namespace_10277d51/namespace_10277d51
// Params 1, eflags: 0x1 linked
// Checksum 0x88c81d28, Offset: 0x750
// Size: 0x1d0
function function_cd4de84f(doors) {
    var_2197df70 = (0, 0, 0);
    foreach (door in doors) {
        var_2197df70 = var_2197df70 + door.origin;
    }
    var_2197df70 = var_2197df70 / doors.size;
    /#
        sphere(var_2197df70, 12, (1, 0, 0), 1, 0, 12, 100);
    #/
    vehicles = getentitiesinradius(var_2197df70, 32, 12);
    var_7344b4ac = 0;
    foreach (vehicle in vehicles) {
        if (isdefined(vehicle.scriptvehicletype) && vehicle.scriptvehicletype == #"cargo_truck_wz") {
            var_7344b4ac = 1;
            playsoundatposition(#"hash_694b6b5d665c7a5e", var_2197df70);
            break;
        }
    }
    return var_7344b4ac;
}

// Namespace namespace_10277d51/namespace_10277d51
// Params 3, eflags: 0x1 linked
// Checksum 0xcd66b5a, Offset: 0x928
// Size: 0x2dc
function function_ed401dbd(activator, laststate, state) {
    if (isdefined(self.target)) {
        var_fe1d375b = getdynentarray(self.target);
        if (function_cd4de84f(var_fe1d375b)) {
            currentstate = function_ffdbe8c2(self);
            waitframe(1);
            playsoundatposition(#"hash_3559ba9c4c9b08f", self.origin);
            function_e2a06860(self, currentstate);
            return;
        }
        foreach (dynent in var_fe1d375b) {
            level thread item_drop::function_4da960f6(dynent.origin, 256, 3);
        }
        waitframe(1);
        foreach (dynent in var_fe1d375b) {
            currentstate = function_ffdbe8c2(dynent);
            if (currentstate != state) {
                function_e2a06860(dynent, state);
            }
        }
        var_c1ffc425 = getdynentarray("blastdoor_button");
        foreach (blast_door_button in var_c1ffc425) {
            var_73141fdc = function_ffdbe8c2(blast_door_button);
            if (var_73141fdc != state) {
                function_e2a06860(blast_door_button, state);
            }
        }
        activator stats::function_d40764f3(#"fracking_blast_doors_opened", 1);
    }
}


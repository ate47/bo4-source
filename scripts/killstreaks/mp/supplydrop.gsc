// Atian COD Tools GSC decompiler test
#using script_52d2de9b438adc78;
#using scripts\killstreaks\mp\killstreak_weapons.gsc;
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\weapons\weapons.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\tacticalinsertion.gsc;
#using scripts\weapons\smokegrenade.gsc;
#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\weapons\hacker_tool.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using scripts\killstreaks\helicopter_shared.gsc;
#using scripts\killstreaks\emp_shared.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\killstreaks\ai_tank_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\entityheadicons_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace supplydrop;

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x2
// Checksum 0x749ece1a, Offset: 0x798
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"supplydrop", &__init__, undefined, #"killstreaks");
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0xe480eea9, Offset: 0x7e8
// Size: 0x5bc
function __init__() {
    level.cratemodelfriendly = #"p8_care_package_01_a";
    level.cratemodelenemy = #"p8_care_package_02_a";
    level.cratemodeltank = #"wpn_t7_drop_box";
    level.cratemodelboobytrapped = #"p8_care_package_03_a";
    level.vtoldrophelicoptervehicleinfo = "vehicle_t8_mil_helicopter_transport_mp";
    ir_strobe::init_shared();
    level.crateownerusetime = 500;
    level.cratenonownerusetime = int(getgametypesetting(#"cratecapturetime") * 1000);
    level.supplydropdisarmcrate = #"hash_20071ab3686e8d58";
    clientfield::register("vehicle", "supplydrop_care_package_state", 1, 1, "int");
    clientfield::register("vehicle", "supplydrop_ai_tank_state", 1, 1, "int");
    clientfield::register("scriptmover", "supplydrop_thrusters_state", 1, 1, "int");
    clientfield::register("scriptmover", "aitank_thrusters_state", 1, 1, "int");
    level._supply_drop_smoke_fx = "_t7/killstreaks/fx_supply_drop_smoke";
    level._supply_drop_explosion_fx = "explosions/fx_exp_grenade_default";
    killstreaks::register_killstreak("killstreak_supply_drop", &usekillstreaksupplydrop);
    killstreaks::allow_assists("supply_drop", 1);
    killstreak_bundles::register_killstreak_bundle("supply_drop_ai_tank");
    killstreak_bundles::register_killstreak_bundle("supply_drop_combat_robot");
    level.cratetypes = [];
    level.categorytypeweight = [];
    ir_strobe::function_8806675d(#"supplydrop_marker", &function_200081db);
    function_d51de8cf("uav", 150, 95);
    function_d51de8cf("recon_car", 150, 75);
    function_d51de8cf("counteruav", 100, 85);
    function_d51de8cf("remote_missile", 90, 100);
    function_d51de8cf("planemortar", 105, 80);
    function_d51de8cf("ultimate_turret", 95, 100);
    function_d51de8cf("helicopter_comlink", 30, 45);
    function_d51de8cf("straferun", 35, 35);
    function_d51de8cf("dart", 125, 75);
    function_d51de8cf("swat_team", 20, 35);
    function_d51de8cf("ac130", 10, 10);
    function_d51de8cf("tank_robot", 30, 40);
    function_d51de8cf("drone_squadron", 30, 40);
    function_d51de8cf("overwatch_helicopter", 30, 40);
    function_e611181f("inventory_tank_robot", "killstreak", "tank_robot", 75, #"hash_6f13430dac318d3b", undefined, undefined, &ai_tank::crateland);
    function_e611181f("tank_robot", "killstreak", "tank_robot", 75, #"hash_6f13430dac318d3b", undefined, undefined, &ai_tank::crateland);
    level.cratecategoryweights = [];
    level.cratecategorytypeweights = [];
    foreach (categorykey, category in level.cratetypes) {
        finalizecratecategory(categorykey);
    }
    /#
        level thread supply_drop_dev_gui();
    #/
    callback::on_finalize_initialization(&function_1c601b99);
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x54873abf, Offset: 0xdb0
// Size: 0x50
function function_1c601b99() {
    if (isdefined(level.var_1b900c1d)) {
        [[ level.var_1b900c1d ]](getweapon(#"supplydrop"), &function_bff5c062);
    }
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xf1e1fd02, Offset: 0xe08
// Size: 0x14c
function function_bff5c062(supplydrop, attackingplayer) {
    supplydrop.owner = attackingplayer;
    supplydrop setowner(attackingplayer);
    supplydrop.team = attackingplayer.team;
    supplydrop setteam(attackingplayer.team);
    supplydrop killstreaks::configure_team_internal(attackingplayer, 1);
    supplydrop notify(#"hacked");
    supplydrop thread deleteonownerleave();
    if (isdefined(level.var_f1edf93f)) {
        supplydrop notify(#"cancel_timeout");
        var_eb79e7c3 = int([[ level.var_f1edf93f ]]() * 1000);
        supplydrop thread killstreaks::waitfortimeout("inventory_supply_drop", var_eb79e7c3, &cratedelete, "death");
    }
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x68d482f8, Offset: 0xf60
// Size: 0x124
function finalizecratecategory(category) {
    level.cratecategoryweights[category] = 0;
    cratetypekeys = getarraykeys(level.cratetypes[category]);
    for (cratetype = 0; cratetype < cratetypekeys.size; cratetype++) {
        typekey = cratetypekeys[cratetype];
        level.cratetypes[category][typekey].previousweight = level.cratecategoryweights[category];
        level.cratecategoryweights[category] = level.cratecategoryweights[category] + level.cratetypes[category][typekey].weight;
        level.cratetypes[category][typekey].weight = level.cratecategoryweights[category];
    }
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0x140cae70, Offset: 0x1090
// Size: 0x26a
function setcategorytypeweight(category, type, weight) {
    if (!isdefined(level.categorytypeweight[category])) {
        level.categorytypeweight[category] = [];
    }
    level.categorytypeweight[category][type] = spawnstruct();
    level.categorytypeweight[category][type].weight = weight;
    count = 0;
    totalweight = 0;
    startindex = undefined;
    finalindex = undefined;
    cratenamekeys = getarraykeys(level.cratetypes[category]);
    for (cratename = 0; cratename < cratenamekeys.size; cratename++) {
        namekey = cratenamekeys[cratename];
        if (level.cratetypes[category][namekey].type == type) {
            count++;
            totalweight += level.cratetypes[category][namekey].weight;
            if (!isdefined(startindex)) {
                startindex = cratename;
            }
            if (isdefined(finalindex) && finalindex + 1 != cratename) {
                /#
                    util::error("headicon_dead");
                #/
                callback::abort_level();
                return;
            }
            finalindex = cratename;
        }
    }
    level.categorytypeweight[category][type].totalcrateweight = totalweight;
    level.categorytypeweight[category][type].cratecount = count;
    level.categorytypeweight[category][type].startindex = startindex;
    level.categorytypeweight[category][type].finalindex = finalindex;
}

// Namespace supplydrop/supplydrop
// Params 5, eflags: 0x0
// Checksum 0x5723f3b3, Offset: 0x1308
// Size: 0xec
function function_d51de8cf(name, weight, var_16a49f, hint, hint_gambler) {
    function_e611181f("supplydrop", "killstreak", name, weight, hint, hint_gambler, &givecratekillstreak);
    function_e611181f("inventory_supplydrop", "killstreak", name, weight, hint, hint_gambler, &givecratekillstreak);
    function_e611181f("gambler", "killstreak", name, var_16a49f, hint, hint_gambler, &givecratekillstreak);
}

// Namespace supplydrop/supplydrop
// Params 8, eflags: 0x0
// Checksum 0x330340da, Offset: 0x1400
// Size: 0x1aa
function function_e611181f(category, type, name, weight, hint, hint_gambler, givefunction, landfunctionoverride) {
    if (!isdefined(level.cratetypes[category])) {
        level.cratetypes[category] = [];
    }
    if (isitemrestricted(name)) {
        return;
    }
    if (isdefined(level.killstreaks[name])) {
        bundle = level.killstreakbundle[name];
        hint = bundle.var_1d2a2ca4;
        hint_gambler = bundle.var_8c4d7906;
    }
    cratetype = spawnstruct();
    cratetype.type = type;
    cratetype.name = name;
    cratetype.weight = weight;
    cratetype.hint = hint;
    cratetype.hint_gambler = hint_gambler;
    cratetype.givefunction = givefunction;
    if (isdefined(landfunctionoverride)) {
        cratetype.landfunctionoverride = landfunctionoverride;
    }
    level.cratetypes[category][name] = cratetype;
    game.strings[name + "_hint"] = hint;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xf70f79b8, Offset: 0x15b8
// Size: 0x3c2
function getrandomcratetype(category, gambler_crate_name) {
    if (!isdefined(level.cratetypes) || !isdefined(level.cratetypes[category])) {
        return;
    }
    assert(isdefined(level.cratetypes));
    assert(isdefined(level.cratetypes[category]));
    assert(isdefined(level.cratecategoryweights[category]));
    typekey = undefined;
    cratetypestart = 0;
    randomweightend = randomintrange(1, level.cratecategoryweights[category] + 1);
    find_another = 0;
    cratenamekeys = getarraykeys(level.cratetypes[category]);
    if (isdefined(level.categorytypeweight[category])) {
        randomweightend = randomint(level.cratecategorytypeweights[category]) + 1;
        cratetypekeys = getarraykeys(level.categorytypeweight[category]);
        for (cratetype = 0; cratetype < cratetypekeys.size; cratetype++) {
            typekey = cratetypekeys[cratetype];
            if (level.categorytypeweight[category][typekey].weight < randomweightend) {
                continue;
            }
            cratetypestart = level.categorytypeweight[category][typekey].startindex;
            randomweightend = randomint(level.categorytypeweight[category][typekey].totalcrateweight) + 1;
            randomweightend += level.cratetypes[category][cratenamekeys[cratetypestart]].previousweight;
            break;
        }
    }
    for (cratetype = cratetypestart; cratetype < cratenamekeys.size; cratetype++) {
        typekey = cratenamekeys[cratetype];
        if (level.cratetypes[category][typekey].weight < randomweightend) {
            continue;
        }
        if (isdefined(gambler_crate_name) && level.cratetypes[category][typekey].name == gambler_crate_name) {
            find_another = 1;
        }
        if (find_another) {
            if (cratetype < cratenamekeys.size - 1) {
                cratetype++;
            } else if (cratetype > 0) {
                cratetype--;
            }
            typekey = cratenamekeys[cratetype];
        }
        break;
    }
    /#
        if (isdefined(level.dev_gui_supply_drop) && level.dev_gui_supply_drop != "<unknown string>" && level.dev_gui_supply_drop != "<unknown string>") {
            typekey = level.dev_gui_supply_drop;
        }
    #/
    return level.cratetypes[category][typekey];
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x46fbc3c4, Offset: 0x1988
// Size: 0xba
function givecrateitem(crate) {
    if (!isalive(self) || !isdefined(crate.cratetype)) {
        return;
    }
    assert(isdefined(crate.cratetype.givefunction), "<unknown string>" + crate.cratetype.name);
    return [[ crate.cratetype.givefunction ]]("inventory_" + crate.cratetype.name);
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0x7b18a891, Offset: 0x1a50
// Size: 0x76
function givecratekillstreakwaiter(event, removecrate, extraendon) {
    self endon(#"give_crate_killstreak_done");
    if (isdefined(extraendon)) {
        self endon(extraendon);
    }
    self waittill(event);
    self notify(#"give_crate_killstreak_done", {#is_remove:removecrate});
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xb28c689d, Offset: 0x1ad0
// Size: 0x24
function givecratekillstreak(killstreak) {
    self killstreaks::give(killstreak);
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x38207e4, Offset: 0x1b00
// Size: 0x19a
function givespecializedcrateweapon(weapon) {
    switch (weapon.name) {
    case #"minigun":
        level thread popups::displayteammessagetoall(#"hash_3b566d06e5a482e1", self);
        level weapons::add_limited_weapon(weapon, self, 3);
        break;
    case #"m32":
        level thread popups::displayteammessagetoall(#"hash_25ae9096a4ce050c", self);
        level weapons::add_limited_weapon(weapon, self, 3);
        break;
    case #"m220_tow":
        level thread popups::displayteammessagetoall(#"hash_51751eb890739762", self);
        level weapons::add_limited_weapon(weapon, self, 3);
        break;
    case #"mp40_blinged":
        level thread popups::displayteammessagetoall(#"killstreak_mp40_inbound", self);
        level weapons::add_limited_weapon(weapon, self, 3);
        break;
    default:
        break;
    }
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x5fe7a603, Offset: 0x1ca8
// Size: 0x1d8
function givecrateweapon(weapon_name) {
    weapon = getweapon(weapon_name);
    if (weapon == level.weaponnone) {
        return;
    }
    currentweapon = self getcurrentweapon();
    if (currentweapon == weapon || self hasweapon(weapon)) {
        self givemaxammo(weapon);
        return 1;
    }
    if (currentweapon.issupplydropweapon || isdefined(level.grenade_array[currentweapon]) || isdefined(level.inventory_array[currentweapon])) {
        self takeweapon(self.lastdroppableweapon);
        self giveweapon(weapon);
        self switchtoweapon(weapon);
        return 1;
    }
    self stats::function_e24eec31(weapon, #"used", 1);
    givespecializedcrateweapon(weapon);
    self giveweapon(weapon);
    self switchtoweapon(weapon);
    self waittill(#"weapon_change");
    self killstreak_weapons::usekillstreakweaponfromcrate(weapon);
    return 1;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0x1e1bf697, Offset: 0x1e88
// Size: 0x23c
function usesupplydropmarker(package_contents_id, context) {
    player = self;
    self endon(#"disconnect", #"spawned_player");
    supplydropweapon = level.weaponnone;
    currentweapon = self getcurrentweapon();
    prevweapon = currentweapon;
    if (currentweapon.issupplydropweapon) {
        supplydropweapon = currentweapon;
    }
    if (supplydropweapon.isgrenadeweapon) {
        trigger_event = "grenade_fire";
    } else {
        trigger_event = "weapon_fired";
    }
    trigger_event = "none";
    self thread supplydropwatcher(package_contents_id, trigger_event, supplydropweapon, context);
    self.supplygrenadedeathdrop = 0;
    while (true) {
        player allowmelee(0);
        notifystring = self waittill(#"weapon_change", trigger_event, #"disconnect", #"spawned_player");
        player allowmelee(1);
        if (trigger_event != "none") {
            if (notifystring._notify != trigger_event) {
                cleanup(context, player);
                return false;
            }
        }
        if (isdefined(player.markerposition)) {
            break;
        }
    }
    self notify(#"trigger_weapon_shutdown");
    if (supplydropweapon == level.weaponnone) {
        cleanup(context, player);
        return false;
    }
    return true;
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xf72590e4, Offset: 0x20d0
// Size: 0x54
function issupplydropgrenadeallowed(killstreak) {
    if (!self killstreakrules::iskillstreakallowed(killstreak, self.team, 1)) {
        self killstreaks::switch_to_last_non_killstreak_weapon();
        return false;
    }
    return true;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0x48ddfcca, Offset: 0x2130
// Size: 0x2a
function adddroplocation(killstreak_id, location) {
    level.droplocations[killstreak_id] = location;
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x3ea14231, Offset: 0x2168
// Size: 0x1c
function deldroplocation(killstreak_id) {
    level.droplocations[killstreak_id] = undefined;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xc7429105, Offset: 0x2190
// Size: 0x2e8
function function_4c0ed253(location, context) {
    foreach (droplocation in level.droplocations) {
        if (distance2dsquared(droplocation, location) < 3600) {
            return false;
        }
    }
    if (context.perform_physics_trace === 1) {
        mask = 1;
        if (isdefined(context.tracemask)) {
            mask = context.tracemask;
        }
        radius = context.radius;
        trace = physicstrace(location + (0, 0, 5000), location + (0, 0, 30), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), undefined, mask);
        /#
            if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
                sphere(location, 8, (1, 1, 0), 1, 1, 10, 1);
            }
        #/
        if (trace[#"fraction"] < 1) {
            if (!(isdefined(level.var_66da9c3c) && level.var_66da9c3c)) {
                if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
                    util::drawcylinder(trace[#"position"], context.radius, 8000, 0.0166667, undefined, (1, 0, 0), 0.7);
                }
                return false;
            }
        }
    }
    if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
        util::drawcylinder(trace[#"position"], context.radius, 8000, 0.0166667, undefined, (0, 1, 0), 0.7);
    }
    return true;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0x6897a380, Offset: 0x2480
// Size: 0x4a0
function islocationgood(location, context) {
    if (getdvarint(#"hash_458cd0a10d30cedb", 1)) {
        return function_4c0ed253(location, context);
    }
    foreach (droplocation in level.droplocations) {
        if (distance2dsquared(droplocation, location) < 3600) {
            return 0;
        }
    }
    if (context.perform_physics_trace === 1) {
        mask = 1;
        if (isdefined(context.tracemask)) {
            mask = context.tracemask;
        }
        radius = context.radius;
        trace = physicstrace(location + (0, 0, 5000), location + (0, 0, 10), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), undefined, mask);
        if (trace[#"fraction"] < 1) {
            /#
                if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
                    sphere(location, radius, (1, 0, 0), 1, 1, 10, 1);
                }
            #/
            return 0;
        } else {
            /#
                if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
                    sphere(location, radius, (0, 0, 1), 1, 1, 10, 1);
                }
            #/
        }
    }
    closestpoint = getclosestpointonnavmesh(location, max(context.max_dist_from_location, 24), context.dist_from_boundary);
    isvalidpoint = isdefined(closestpoint);
    if (isvalidpoint && context.check_same_floor === 1 && abs(location[2] - closestpoint[2]) > 96) {
        isvalidpoint = 0;
    }
    if (isvalidpoint && distance2dsquared(location, closestpoint) > context.max_dist_from_location * context.max_dist_from_location) {
        isvalidpoint = 0;
    }
    /#
        if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
            if (!isvalidpoint) {
                otherclosestpoint = getclosestpointonnavmesh(location, getdvarfloat(#"scr_supply_drop_valid_location_radius_debug", 96), context.dist_from_boundary);
                if (isdefined(otherclosestpoint)) {
                    sphere(otherclosestpoint, context.max_dist_from_location, (1, 0, 0), 0.8, 0, 20, 1);
                }
            } else {
                sphere(closestpoint, context.max_dist_from_location, (0, 1, 0), 0.8, 0, 20, 1);
                util::drawcylinder(closestpoint, context.radius, 8000, 0.0166667, undefined, (0, 0.9, 0), 0.7);
            }
        }
    #/
    return isvalidpoint;
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x67b884d3, Offset: 0x2928
// Size: 0x152
function usekillstreaksupplydrop(killstreak) {
    player = self;
    if (!player issupplydropgrenadeallowed(killstreak)) {
        return 0;
    }
    context = spawnstruct();
    context.radius = level.killstreakcorebundle.ksairdropaitankradius;
    context.dist_from_boundary = 50;
    context.max_dist_from_location = 16;
    context.perform_physics_trace = 1;
    context.islocationgood = &islocationgood;
    context.killstreakref = killstreak;
    context.validlocationsound = level.killstreakcorebundle.ksvalidcarepackagelocationsound;
    context.tracemask = 1 | 4;
    context.droptag = "tag_cargo_attach";
    context.var_9fc6cfe9 = 1;
    context.killstreaktype = #"supplydrop_marker";
    return self ir_strobe::function_f625256f(undefined, context);
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0x57b79adf, Offset: 0x2a88
// Size: 0x8c
function spawn_supplydrop(owner, context, origin) {
    location = spawnstruct();
    location.origin = origin;
    owner clientfield::set_player_uimodel("hudItems.tankState", 1);
    owner airsupport::function_83904681(location, &supplydropwatcher);
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xae2b87fc, Offset: 0x2b20
// Size: 0x1e8
function use_killstreak_death_machine(killstreak) {
    if (!self killstreakrules::iskillstreakallowed(killstreak, self.team, 1)) {
        return false;
    }
    weapon = getweapon(#"minigun");
    currentweapon = self getcurrentweapon();
    if (currentweapon.issupplydropweapon || isdefined(level.grenade_array[currentweapon]) || isdefined(level.inventory_array[currentweapon])) {
        self takeweapon(self.lastdroppableweapon);
        self giveweapon(weapon);
        self switchtoweapon(weapon);
        self setblockweaponpickup(weapon, 1);
        return true;
    }
    level thread popups::displayteammessagetoall(#"hash_3b566d06e5a482e1", self);
    level weapons::add_limited_weapon(weapon, self, 3);
    self takeweapon(currentweapon);
    self giveweapon(weapon);
    self switchtoweapon(weapon);
    self setblockweaponpickup(weapon, 1);
    return true;
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x17776300, Offset: 0x2d10
// Size: 0x1c8
function use_killstreak_grim_reaper(killstreak) {
    if (!self killstreakrules::iskillstreakallowed(killstreak, self.team, 1)) {
        return false;
    }
    weapon = getweapon(#"m202_flash");
    currentweapon = self getcurrentweapon();
    if (currentweapon.issupplydropweapon || isdefined(level.grenade_array[currentweapon]) || isdefined(level.inventory_array[currentweapon])) {
        self takeweapon(self.lastdroppableweapon);
        self giveweapon(weapon);
        self switchtoweapon(weapon);
        self setblockweaponpickup(weapon, 1);
        return true;
    }
    level weapons::add_limited_weapon(weapon, self, 3);
    self takeweapon(currentweapon);
    self giveweapon(weapon);
    self switchtoweapon(weapon);
    self setblockweaponpickup(weapon, 1);
    return true;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xa5e0d578, Offset: 0x2ee0
// Size: 0xde
function cleanupwatcherondeath(team, killstreak_id) {
    player = self;
    self endon(#"disconnect", #"supplydropwatcher", #"trigger_weapon_shutdown", #"spawned_player", #"weapon_change");
    self waittill(#"death", #"joined_team", #"joined_spectators");
    killstreakrules::killstreakstop("supply_drop", team, killstreak_id);
    self notify(#"cleanup_marker");
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xdcd3f667, Offset: 0x2fc8
// Size: 0xdc
function cleanup(context, player) {
    if (isdefined(context) && isdefined(context.marker)) {
        context.marker delete();
        context.marker = undefined;
        if (isdefined(context.markerfxhandle)) {
            context.markerfxhandle delete();
            context.markerfxhandle = undefined;
        }
        if (isdefined(player)) {
            player clientfield::set_to_player("marker_state", 0);
        }
    }
    if (isdefined(context.killstreak_id)) {
        deldroplocation(context.killstreak_id);
    }
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xace021b2, Offset: 0x30b0
// Size: 0x33e
function markerupdatethread(context) {
    player = self;
    player endon(#"supplydropwatcher", #"spawned_player", #"disconnect", #"weapon_change", #"death");
    markermodel = spawn("script_model", (0, 0, 0));
    context.marker = markermodel;
    player thread markercleanupthread(context);
    while (true) {
        if (player flagsys::get(#"marking_done")) {
            break;
        }
        minrange = level.killstreakcorebundle.ksminairdroptargetrange;
        maxrange = level.killstreakcorebundle.ksmaxairdroptargetrange;
        forwardvector = vectorscale(anglestoforward(player getplayerangles()), maxrange);
        mask = 1;
        if (isdefined(context.tracemask)) {
            mask = context.tracemask;
        }
        radius = 2;
        results = physicstrace(player geteye(), player geteye() + forwardvector, (radius * -1, radius * -1, 0), (radius, radius, 0), player, mask);
        markermodel.origin = results[#"position"];
        tooclose = distancesquared(markermodel.origin, player.origin) < minrange * minrange;
        if (results[#"normal"][2] > 0.7 && !tooclose && isdefined(context.islocationgood) && [[ context.islocationgood ]](markermodel.origin, context)) {
            player.markerposition = markermodel.origin;
            player clientfield::set_to_player("marker_state", 1);
        } else {
            player.markerposition = undefined;
            player clientfield::set_to_player("marker_state", 2);
        }
        waitframe(1);
    }
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0xe001612, Offset: 0x33f8
// Size: 0x15c
function function_200081db(owner, context, location) {
    team = self.team;
    killstreak_id = self killstreakrules::killstreakstart("supply_drop", team, 0, 1);
    if (killstreak_id == -1) {
        return 0;
    }
    bundle = struct::get_script_bundle("killstreak", "killstreak_supply_drop");
    killstreak = killstreaks::get_killstreak_for_weapon(bundle.ksweapon);
    context.selectedlocation = location;
    context.killstreak_id = killstreak_id;
    self thread helidelivercrate(context.selectedlocation, bundle.ksweapon, self, team, killstreak_id, killstreak_id, context);
    self addweaponstat(bundle.ksweapon, #"used", 1);
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0xaa20fd25, Offset: 0x3560
// Size: 0x88
function function_36573ef(killstreak_id, context, team) {
    result = self usesupplydropmarker(killstreak_id, context);
    self notify(#"supply_drop_marker_done");
    if (!(isdefined(result) && result)) {
        return false;
    }
    self killstreaks::play_killstreak_start_dialog("supply_drop", team, killstreak_id);
    return true;
}

// Namespace supplydrop/supplydrop
// Params 4, eflags: 0x0
// Checksum 0xd75d5ea0, Offset: 0x35f0
// Size: 0x49c
function supplydropwatcher(package_contents_id, trigger_event, supplydropweapon, context) {
    player = self;
    self notify(#"supplydropwatcher");
    self endon(#"supplydropwatcher", #"spawned_player", #"disconnect", #"weapon_change");
    team = self.team;
    if (isdefined(context.killstreak_id)) {
        killstreak_id = context.killstreak_id;
    } else {
        killstreak_id = killstreakrules::killstreakstart("supply_drop", team, 0, 0);
        if (killstreak_id == -1) {
            return;
        }
        context.killstreak_id = killstreak_id;
    }
    player flagsys::clear(#"marking_done");
    self thread checkforemp();
    if (trigger_event != "none") {
        if (!supplydropweapon.isgrenadeweapon) {
            self thread markerupdatethread(context);
        }
        self thread checkweaponchange(team, killstreak_id);
    }
    self thread cleanupwatcherondeath(team, killstreak_id);
    while (true) {
        if (trigger_event == "none") {
            weapon = supplydropweapon;
            weapon_instance = weapon;
        } else {
            waitresult = self waittill(trigger_event);
            weapon = waitresult.weapon;
            weapon_instance = waitresult.projectile;
        }
        issupplydropweapon = 1;
        if (trigger_event == "grenade_fire") {
            issupplydropweapon = weapon.issupplydropweapon;
        }
        if (isdefined(self) && issupplydropweapon) {
            if (isdefined(context)) {
                if (!isdefined(player.markerposition) || !(isdefined(context.islocationgood) && [[ context.islocationgood ]](player.markerposition, context))) {
                    if (isdefined(level.killstreakcorebundle.ksinvalidlocationsound)) {
                        player playsoundtoplayer(level.killstreakcorebundle.ksinvalidlocationsound, player);
                    }
                    if (isdefined(level.killstreakcorebundle.ksinvalidlocationstring)) {
                        player iprintlnbold(level.killstreakcorebundle.ksinvalidlocationstring);
                    }
                    continue;
                }
                if (isdefined(context.validlocationsound)) {
                    player playsoundtoplayer(context.validlocationsound, player);
                }
                self thread helidelivercrate(context.selectedlocation, weapon, self, team, killstreak_id, package_contents_id, context);
            } else {
                self thread dosupplydrop(weapon_instance, weapon, self, killstreak_id, package_contents_id);
                weapon_instance thread do_supply_drop_detonation(weapon, self);
                weapon_instance thread supplydropgrenadetimeout(team, killstreak_id, weapon);
            }
            self killstreaks::switch_to_last_non_killstreak_weapon();
        } else {
            killstreakrules::killstreakstop("supply_drop", team, killstreak_id);
            self notify(#"cleanup_marker");
        }
        break;
    }
    player flagsys::set(#"marking_done");
    player clientfield::set_to_player("marker_state", 0);
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x551796, Offset: 0x3a98
// Size: 0x8c
function checkforemp() {
    self endon(#"supplydropwatcher", #"spawned_player", #"hash_5fa67b447400c1a5", #"weapon_change", #"death", #"trigger_weapon_shutdown");
    self waittill(#"emp_jammed");
    self killstreaks::switch_to_last_non_killstreak_weapon();
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0x53334153, Offset: 0x3b30
// Size: 0x1e4
function supplydropgrenadetimeout(team, killstreak_id, weapon) {
    self endon(#"death", #"stationary");
    grenade_lifetime = 10;
    wait(grenade_lifetime);
    if (!isdefined(self)) {
        return;
    }
    self notify(#"grenade_timeout");
    killstreakrules::killstreakstop("supply_drop", team, killstreak_id);
    if (weapon.name == #"tank_robot") {
        killstreakrules::killstreakstop("tank_robot", team, killstreak_id);
        self notify(#"cleanup_marker");
    } else if (weapon.name == #"inventory_tank_robot") {
        killstreakrules::killstreakstop("inventory_tank_robot", team, killstreak_id);
        self notify(#"cleanup_marker");
    } else if (weapon.name == #"combat_robot_drop") {
        killstreakrules::killstreakstop("combat_robot_drop", team, killstreak_id);
        self notify(#"cleanup_marker");
    } else if (weapon.name == #"inventory_combat_robot_drop") {
        killstreakrules::killstreakstop("inventory_combat_robot_drop", team, killstreak_id);
        self notify(#"cleanup_marker");
    }
    self delete();
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0x41d5e21c, Offset: 0x3d20
// Size: 0xae
function checkweaponchange(team, killstreak_id) {
    self endon(#"supplydropwatcher", #"spawned_player", #"disconnect", #"trigger_weapon_shutdown", #"death");
    self waittill(#"weapon_change");
    killstreakrules::killstreakstop("supply_drop", team, killstreak_id);
    self notify(#"cleanup_marker");
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0xf75dc66d, Offset: 0x3dd8
// Size: 0xd6
function geticonforcrate() {
    if (isdefined(self.cratetype.objective)) {
        return self.cratetype.objective;
    }
    if (self.cratetype.type == "killstreak") {
        assert(isdefined(self.cratetype.name));
        crateweapon = killstreaks::get_killstreak_weapon(self.cratetype.name);
        if (isdefined(crateweapon)) {
            self.cratetype.objective = getcrateheadobjective(crateweapon);
            return self.cratetype.objective;
        }
    }
    return undefined;
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xa41855ec, Offset: 0x3eb8
// Size: 0x5e4
function crateactivate(hacker) {
    self makeusable();
    self setcursorhint("HINT_NOICON");
    if (!isdefined(self.cratetype)) {
        return;
    }
    self sethintstring(self.cratetype.hint);
    if (isdefined(self.cratetype.hint_gambler)) {
        self sethintstringforperk(#"specialty_showenemyequipment", self.cratetype.hint_gambler);
    }
    crateobjid = gameobjects::get_next_obj_id();
    objective_add(crateobjid, "invisible", self.origin);
    objective_setstate(crateobjid, "active");
    self.friendlyobjid = crateobjid;
    self.enemyobjid = [];
    icon = self geticonforcrate();
    if (isdefined(hacker)) {
    }
    if (level.teambased) {
        objective_setteam(crateobjid, self.team);
        foreach (team, _ in level.teams) {
            if (self.team == team) {
                continue;
            }
            crateobjid = gameobjects::get_next_obj_id();
            objective_add(crateobjid, "invisible", self.origin);
            objective_setteam(crateobjid, team);
            objective_setstate(crateobjid, "active");
            self.enemyobjid[self.enemyobjid.size] = crateobjid;
        }
    } else {
        if (!self.visibletoall) {
            objective_setinvisibletoall(crateobjid);
            enemycrateobjid = gameobjects::get_next_obj_id();
            objective_add(enemycrateobjid, "invisible", self.origin);
            objective_setstate(enemycrateobjid, "active");
            if (isplayer(self.owner)) {
                objective_setinvisibletoplayer(enemycrateobjid, self.owner);
            }
            self.enemyobjid[self.enemyobjid.size] = enemycrateobjid;
        }
        if (isplayer(self.owner)) {
            objective_setvisibletoplayer(crateobjid, self.owner);
        }
        if (isdefined(self.hacker)) {
            objective_setinvisibletoplayer(crateobjid, self.hacker);
            crateobjid = gameobjects::get_next_obj_id();
            objective_add(crateobjid, "invisible", self.origin);
            objective_setstate(crateobjid, "active");
            objective_setinvisibletoall(crateobjid);
            objective_setvisibletoplayer(crateobjid, self.hacker);
            self.hackerobjid = crateobjid;
        }
    }
    if (!self.visibletoall && isdefined(icon)) {
        self entityheadicons::setentityheadicon(self.team, self, icon);
        if (self.entityheadobjectives.size > 0) {
            objectiveid = self.entityheadobjectives[self.entityheadobjectives.size - 1];
            if (isdefined(objectiveid)) {
                objective_setinvisibletoall(objectiveid);
                if (isdefined(self.owner)) {
                    objective_setvisibletoplayer(objectiveid, self.owner);
                }
            }
        }
    }
    if (isdefined(self.owner) && isplayer(self.owner) && isbot(self.owner)) {
        self.owner notify(#"bot_crate_landed", {#crate:self});
    }
    if (isdefined(self.owner)) {
        self.owner notify(#"crate_landed", {#crate:self});
        setricochetprotectionendtime("supply_drop", self.killstreak_id, self.owner);
    }
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0xcf0658d, Offset: 0x44a8
// Size: 0xbc
function setricochetprotectionendtime(killstreak, killstreak_id, owner) {
    ksbundle = level.killstreakbundle[killstreak];
    if (isdefined(ksbundle) && isdefined(ksbundle.ksricochetpostlandduration) && ksbundle.ksricochetpostlandduration > 0) {
        endtime = gettime() + int(ksbundle.ksricochetpostlandduration * 1000);
        killstreaks::set_ricochet_protection_endtime(killstreak_id, owner, endtime);
    }
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0xb5b794eb, Offset: 0x4570
// Size: 0x156
function cratedeactivate() {
    self makeunusable();
    if (isdefined(self.friendlyobjid)) {
        objective_delete(self.friendlyobjid);
        gameobjects::release_obj_id(self.friendlyobjid);
        self.friendlyobjid = undefined;
    }
    if (isdefined(self.enemyobjid)) {
        foreach (objid in self.enemyobjid) {
            objective_delete(objid);
            gameobjects::release_obj_id(objid);
        }
        self.enemyobjid = [];
    }
    if (isdefined(self.hackerobjid)) {
        objective_delete(self.hackerobjid);
        gameobjects::release_obj_id(self.hackerobjid);
        self.hackerobjid = undefined;
    }
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0xb0c32a5, Offset: 0x46d0
// Size: 0xb0
function dropalltoground(origin, radius, stickyobjectradius) {
    physicsexplosionsphere(origin, radius, radius, 0);
    waitframe(1);
    weapons::drop_all_to_ground(origin, radius);
    dropcratestoground(origin, radius);
    level notify(#"drop_objects_to_ground", {#position:origin, #radius:stickyobjectradius});
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x5daffbba, Offset: 0x4788
// Size: 0x2c
function dropeverythingtouchingcrate(origin) {
    dropalltoground(origin, 70, 70);
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0x4e78249b, Offset: 0x47c0
// Size: 0x4c
function dropalltogroundaftercratedelete(crate, crate_origin) {
    crate waittill(#"death");
    wait(0.1);
    crate dropeverythingtouchingcrate(crate_origin);
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0x56c6f214, Offset: 0x4818
// Size: 0xbe
function dropcratestoground(origin, radius) {
    crate_ents = getentarray("care_package", "script_noteworthy");
    radius_sq = radius * radius;
    for (i = 0; i < crate_ents.size; i++) {
        if (distancesquared(origin, crate_ents[i].origin) < radius_sq) {
            crate_ents[i] thread dropcratetoground();
        }
    }
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x19e68d9e, Offset: 0x48e0
// Size: 0xb6
function dropcratetoground() {
    self endon(#"death");
    if (isdefined(self.droppingtoground)) {
        return;
    }
    self.droppingtoground = 1;
    dropeverythingtouchingcrate(self.origin);
    self cratedeactivate();
    self thread cratedroptogroundkill();
    self crateredophysics();
    self crateactivate();
    self.droppingtoground = undefined;
}

// Namespace supplydrop/supplydrop
// Params 8, eflags: 0x0
// Checksum 0xaf02fee0, Offset: 0x49a0
// Size: 0x43e
function cratespawn(killstreak, killstreakid, owner, team, drop_origin, drop_angle, _crate, context) {
    if (isdefined(_crate)) {
        crate = _crate;
    } else {
        crate = spawn("script_model", drop_origin, 1);
    }
    crate killstreaks::configure_team(killstreak, killstreakid, owner);
    crate.angles = drop_angle;
    crate.visibletoall = 0;
    crate.script_noteworthy = "care_package";
    crate.weapon = getweapon(#"supplydrop");
    crate setweapon(crate.weapon);
    if (!isdefined(context) || !isdefined(context.vehicle)) {
        crate clientfield::set("enemyequip", 1);
    }
    if (!isdefined(_crate)) {
        if (killstreak === "tank_robot" || killstreak === "inventory_tank_robot") {
            crate setmodel(level.cratemodeltank);
            crate setenemymodel(level.cratemodeltank);
        } else {
            crate setmodel(level.cratemodelfriendly);
            crate setenemymodel(level.cratemodelenemy);
        }
    }
    if (isdefined(context) && !(isdefined(context.dontdisconnectpaths) && context.dontdisconnectpaths)) {
        crate disconnectpaths();
    }
    switch (killstreak) {
    case #"turret_drop":
        crate.cratetype = level.cratetypes[killstreak][#"autoturret"];
        break;
    case #"tow_turret_drop":
        crate.cratetype = level.cratetypes[killstreak][#"auto_tow"];
        break;
    case #"m220_tow_drop":
        crate.cratetype = level.cratetypes[killstreak][#"m220_tow"];
        break;
    case #"tank_robot":
    case #"inventory_tank_robot":
        crate.cratetype = level.cratetypes[killstreak][#"tank_robot"];
        break;
    case #"inventory_minigun_drop":
    case #"minigun_drop":
        crate.cratetype = level.cratetypes[killstreak][#"minigun"];
        break;
    case #"m32_drop":
    case #"inventory_m32_drop":
        crate.cratetype = level.cratetypes[killstreak][#"m32"];
        break;
    default:
        crate.cratetype = getrandomcratetype("supplydrop");
        break;
    }
    return crate;
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x3bdd87e5, Offset: 0x4de8
// Size: 0x1e4
function cratedelete(drop_all_to_ground) {
    if (!isdefined(self)) {
        return;
    }
    killstreaks::remove_ricochet_protection(self.killstreak_id, self.originalowner);
    if (!isdefined(drop_all_to_ground)) {
        drop_all_to_ground = 1;
    }
    if (isdefined(self.friendlyobjid)) {
        objective_delete(self.friendlyobjid);
        gameobjects::release_obj_id(self.friendlyobjid);
        self.friendlyobjid = undefined;
    }
    if (isdefined(self.enemyobjid)) {
        foreach (objid in self.enemyobjid) {
            objective_delete(objid);
            gameobjects::release_obj_id(objid);
        }
        self.enemyobjid = undefined;
    }
    if (isdefined(self.hackerobjid)) {
        objective_delete(self.hackerobjid);
        gameobjects::release_obj_id(self.hackerobjid);
        self.hackerobjid = undefined;
    }
    if (drop_all_to_ground) {
        level thread dropalltogroundaftercratedelete(self, self.origin);
    }
    if (isdefined(self.killcament)) {
        self.killcament thread util::deleteaftertime(5);
    }
    self delete();
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x69edce4a, Offset: 0x4fd8
// Size: 0x5e
function stationarycrateoverride() {
    self endon(#"death", #"stationary");
    wait(4);
    self.angles = self.angles;
    self.origin = self.origin;
    self notify(#"stationary");
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x5fe15f39, Offset: 0x5040
// Size: 0x44
function timeoutcratewaiter() {
    self endon(#"death", #"stationary");
    wait(20);
    self cratedelete(1);
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x993f83c0, Offset: 0x5090
// Size: 0x17c
function cratephysics() {
    forcepointvariance = 200;
    vertvelocitymin = -100;
    vertvelocitymax = 100;
    forcepointx = randomfloatrange(0 - forcepointvariance, forcepointvariance);
    forcepointy = randomfloatrange(0 - forcepointvariance, forcepointvariance);
    forcepoint = (forcepointx, forcepointy, 0);
    forcepoint += self.origin;
    initialvelocityz = randomfloatrange(vertvelocitymin, vertvelocitymax);
    initialvelocity = (0, 0, initialvelocityz);
    self physicslaunch(forcepoint, initialvelocity);
    self thread timeoutcratewaiter();
    self thread update_crate_velocity();
    self thread play_impact_sound();
    self waittill(#"stationary");
    self disconnectpaths();
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x39248ab9, Offset: 0x5218
// Size: 0x6e
function function_1f686c3b(v_target_location) {
    endtime = gettime() + 7000;
    while (endtime > gettime()) {
        if (self.origin[2] - 20 < v_target_location[2]) {
            break;
        }
        waitframe(1);
    }
    self notify(#"stationary");
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xfa82ce34, Offset: 0x5290
// Size: 0x204
function cratecontrolleddrop(killstreak, v_target_location) {
    crate = self;
    supplydrop = 1;
    if (killstreak == "tank_robot") {
        supplydrop = 0;
    }
    if (supplydrop) {
        params = level.killstreakbundle[#"supply_drop"];
    } else {
        params = level.killstreakbundle[#"tank_robot"];
    }
    var_ae4c0bf9 = 0;
    if (!isdefined(params.kstotaldroptime)) {
        params.kstotaldroptime = 4;
    }
    var_cc6645da = 1;
    acceltime = params.kstotaldroptime * var_cc6645da;
    deceltime = params.kstotaldroptime - acceltime;
    target = (v_target_location[0], v_target_location[1], v_target_location[2] + var_ae4c0bf9);
    hostmigration::waittillhostmigrationdone();
    crate moveto(target, params.kstotaldroptime, acceltime, deceltime);
    crate thread watchforcratekill(v_target_location[2] + (isdefined(params.ksstartcratekillheightfromground) ? params.ksstartcratekillheightfromground : 200));
    crate waittill(#"movedone");
    hostmigration::waittillhostmigrationdone();
    crate cratephysics();
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0xc39e69b9, Offset: 0x54a0
// Size: 0x24
function play_impact_sound() {
    self playsound(#"phy_impact_supply");
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x6eb78d19, Offset: 0x54d0
// Size: 0x84
function update_crate_velocity() {
    self endon(#"death", #"stationary");
    self.velocity = (0, 0, 0);
    self.old_origin = self.origin;
    while (isdefined(self)) {
        self.velocity = self.origin - self.old_origin;
        self.old_origin = self.origin;
        waitframe(1);
    }
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x3a13fc20, Offset: 0x5560
// Size: 0x8a
function crateredophysics() {
    forcepoint = self.origin;
    initialvelocity = (0, 0, 0);
    self physicslaunch(forcepoint, initialvelocity);
    self thread timeoutcratewaiter();
    self thread stationarycrateoverride();
    self waittill(#"stationary");
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0x4d02a824, Offset: 0x55f8
// Size: 0x1ac
function do_supply_drop_detonation(weapon, owner) {
    self notify(#"supplydropwatcher");
    self endon(#"supplydropwatcher", #"spawned_player", #"disconnect", #"death", #"grenade_timeout");
    self util::waittillnotmoving();
    self.angles = (0, self.angles[1], 90);
    fuse_time = float(weapon.fusetime) / 1000;
    wait(fuse_time);
    if (!isdefined(owner) || !owner emp::enemyempactive()) {
        thread smokegrenade::playsmokesound(self.origin, 6, level.sound_smoke_start, level.sound_smoke_stop, level.sound_smoke_loop);
        playfxontag(level._supply_drop_smoke_fx, self, "tag_fx");
        proj_explosion_sound = weapon.projexplosionsound;
        sound::play_in_space(proj_explosion_sound, self.origin);
    }
    wait(3);
    self delete();
}

// Namespace supplydrop/supplydrop
// Params 6, eflags: 0x0
// Checksum 0xdd62be34, Offset: 0x57b0
// Size: 0x10c
function dosupplydrop(weapon_instance, weapon, owner, killstreak_id, package_contents_id, context) {
    weapon endon(#"explode", #"grenade_timeout");
    self endon(#"disconnect");
    team = owner.team;
    weapon_instance thread watchexplode(weapon, owner, killstreak_id, package_contents_id);
    weapon_instance util::waittillnotmoving();
    weapon_instance notify(#"stoppedmoving");
    self thread helidelivercrate(weapon_instance.origin, weapon, owner, team, killstreak_id, package_contents_id, context);
}

// Namespace supplydrop/supplydrop
// Params 4, eflags: 0x0
// Checksum 0x21a968f0, Offset: 0x58c8
// Size: 0xa4
function watchexplode(weapon, owner, killstreak_id, package_contents_id) {
    self endon(#"stoppedmoving");
    team = owner.team;
    waitresult = self waittill(#"explode");
    owner thread helidelivercrate(waitresult.position, weapon, owner, team, killstreak_id, package_contents_id);
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x90dfce62, Offset: 0x5978
// Size: 0x44
function cratetimeoutthreader() {
    crate = self;
    cratetimeout(90);
    crate thread deleteonownerleave();
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x16949b4e, Offset: 0x59c8
// Size: 0x6c
function cratetimeout(time) {
    crate = self;
    self thread killstreaks::waitfortimeout("inventory_supply_drop", int(90 * 1000), &cratedelete, "death");
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x5d07f3f9, Offset: 0x5a40
// Size: 0x94
function deleteonownerleave() {
    crate = self;
    crate endon(#"death", #"hacked");
    crate.owner waittill(#"joined_team", #"joined_spectators", #"disconnect");
    crate cratedelete(1);
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x8e47aad9, Offset: 0x5ae0
// Size: 0x3c
function waitanddelete(time) {
    self endon(#"death");
    wait(time);
    self delete();
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xfd7e219e, Offset: 0x5b28
// Size: 0x128
function function_703ed715(trace) {
    if (isdefined(trace[#"entity"]) && isvehicle(trace[#"entity"]) && trace[#"entity"].vehicleclass === "helicopter") {
        mask = 1;
        radius = 30;
        origin = trace[#"position"];
        trace = physicstrace(origin + (0, 0, -100), origin + (0, 0, -10000), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), undefined, mask);
        return trace;
    }
    return trace;
}

// Namespace supplydrop/supplydrop
// Params 11, eflags: 0x0
// Checksum 0x44862e7c, Offset: 0x5c58
// Size: 0x684
function dropcrate(origin, angle, killstreak, owner, team, killcament, killstreak_id, package_contents_id, crate_, context, var_83f3c388) {
    angles = (angle[0] * 0.5, angle[1] * 0.5, angle[2] * 0.5);
    if (isdefined(crate_)) {
        origin = crate_.origin;
        angles = crate_.angles;
        crate_ thread waitanddelete(0.1);
    }
    if (isdefined(context.vehicledrop) && context.vehicledrop) {
        context.vehicle = spawnvehicle(#"archetype_mini_quadtank_mp", origin, angles, "talon", undefined, 1, self);
    }
    crate = cratespawn(killstreak, killstreak_id, owner, team, origin, angles);
    killcament unlink();
    killcament linkto(crate);
    crate.killcament = killcament;
    crate.killstreak_id = killstreak_id;
    crate.package_contents_id = package_contents_id;
    killcament thread util::deleteaftertime(15);
    killcament thread unlinkonrotation(crate);
    if (killstreak == "tank_robot" && isdefined(level.var_14151f16)) {
        [[ level.var_14151f16 ]](crate, 0);
    }
    crate endon(#"death");
    if (!(isdefined(context.vehicledrop) && context.vehicledrop)) {
        crate cratetimeoutthreader();
    }
    mask = 1;
    radius = 30;
    trace = physicstrace(crate.origin + (0, 0, -100), crate.origin + (0, 0, -10000), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), undefined, mask);
    trace = function_703ed715(trace);
    v_target_location = trace[#"position"];
    /#
        if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
            util::drawcylinder(v_target_location, context.radius, 8000, 99999999, "<unknown string>", (0, 0, 0.9), 0.8);
        }
    #/
    if (isdefined(context.vehicle)) {
        crate function_1f686c3b(v_target_location);
    } else if (!getdvarint(#"hash_763d6ee8f054423f", 0) && isdefined(v_target_location)) {
        crate cratecontrolleddrop(killstreak, (v_target_location[0], v_target_location[1], v_target_location[2] + 10));
    } else if (isdefined(var_83f3c388)) {
        crate cratecontrolleddrop(killstreak, (var_83f3c388[0], var_83f3c388[1], var_83f3c388[2] + 10));
    } else if (isdefined(owner.markerposition)) {
        crate cratecontrolleddrop(killstreak, (owner.markerposition[0], owner.markerposition[1], owner.markerposition[2] + 10));
    } else {
        crate cratecontrolleddrop(killstreak, v_target_location);
    }
    crate thread hacker_tool::registerwithhackertool(level.carepackagehackertoolradius, level.carepackagehackertooltimems);
    cleanup(context, owner);
    if (isdefined(crate.cratetype) && isdefined(crate.cratetype.landfunctionoverride)) {
        [[ crate.cratetype.landfunctionoverride ]](crate, killstreak, owner, team, context);
        return;
    }
    crate crateactivate();
    crate thread crateusethink();
    crate thread crateusethinkowner();
    if (isdefined(crate.cratetype) && isdefined(crate.cratetype.hint_gambler)) {
        crate thread crategamblerthink();
    }
    default_land_function(crate, killstreak, owner, team);
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x8d76c020, Offset: 0x62e8
// Size: 0x17c
function unlinkonrotation(crate) {
    self endon(#"delete");
    crate endon(#"death", #"stationary");
    waitbeforerotationcheck = getdvarfloat(#"scr_supplydrop_killcam_rot_wait", 0.5);
    wait(waitbeforerotationcheck);
    mincos = getdvarfloat(#"scr_supplydrop_killcam_max_rot", 0.999);
    cosine = 1;
    currentdirection = vectornormalize(anglestoforward(crate.angles));
    while (cosine > mincos) {
        olddirection = currentdirection;
        waitframe(1);
        currentdirection = vectornormalize(anglestoforward(crate.angles));
        cosine = vectordot(olddirection, currentdirection);
    }
    if (isdefined(self)) {
        self unlink();
    }
}

// Namespace supplydrop/supplydrop
// Params 4, eflags: 0x0
// Checksum 0x58a1a268, Offset: 0x6470
// Size: 0x252
function default_land_function(crate, category, owner, team) {
    while (true) {
        waitresult = crate waittill(#"captured");
        player = waitresult.player;
        remote_hack = waitresult.is_remote_hack;
        if (owner != crate.owner) {
            owner = crate.owner;
        }
        if (team != owner.team) {
            team = owner.team;
        }
        player challenges::capturedcrate(owner);
        deletecrate = player givecrateitem(crate);
        if (isdefined(deletecrate) && !deletecrate) {
            continue;
        }
        playerhasengineerperk = player hasperk(#"specialty_showenemyequipment");
        if ((playerhasengineerperk || remote_hack == 1) && owner != player && (level.teambased && util::function_fbce7263(team, player.team) || !level.teambased)) {
            spawn_explosive_crate(crate.origin, crate.angles, category, owner, team, player, playerhasengineerperk);
            crate makeunusable();
            util::wait_network_frame();
            crate cratedelete(0);
            return;
        }
        crate cratedelete(1);
        return;
    }
}

// Namespace supplydrop/supplydrop
// Params 7, eflags: 0x0
// Checksum 0x46d990e7, Offset: 0x66d0
// Size: 0x1ca
function spawn_explosive_crate(origin, angle, killstreak, owner, team, hacker, playerhasengineerperk) {
    crate = cratespawn(killstreak, undefined, owner, team, origin, angle);
    crate setowner(owner);
    crate setteam(team);
    if (level.teambased) {
        crate setenemymodel(level.cratemodelboobytrapped);
        crate makeusable(team);
    } else {
        crate setenemymodel(level.cratemodelenemy);
    }
    crate.hacker = hacker;
    crate.visibletoall = 0;
    crate crateactivate(hacker);
    crate sethintstringforperk("specialty_showenemyequipment", level.supplydropdisarmcrate);
    crate thread crateusethink();
    crate thread crateusethinkowner();
    crate thread watch_explosive_crate();
    crate cratetimeoutthreader();
    crate.playerhasengineerperk = playerhasengineerperk;
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x7a3160ca, Offset: 0x68a8
// Size: 0x2ac
function watch_explosive_crate() {
    killcament = spawn("script_model", self.origin + (0, 0, 60));
    self.killcament = killcament;
    waitresult = self waittill(#"captured", #"death");
    remote_hack = waitresult.is_remote_hack;
    player = waitresult.player;
    if (isdefined(self)) {
        if (!player hasperk(#"specialty_showenemyequipment") && !remote_hack) {
            self thread entityheadicons::setentityheadicon(player.team, player, "headicon_dead");
            self loop_sound("wpn_semtex_alert", 0.15);
            if (isdefined(self)) {
                if (!isdefined(self.hacker)) {
                    self.hacker = self;
                }
                self radiusdamage(self.origin, 256, 500, 300, self.hacker, "MOD_EXPLOSIVE", getweapon(#"supplydrop"));
                playfx(level._supply_drop_explosion_fx, self.origin);
                playsoundatposition(#"wpn_grenade_explode", self.origin);
            }
        } else {
            playsoundatposition(#"mpl_turret_alert", self.origin);
            scoreevents::processscoreevent(#"disarm_hacked_care_package", player, undefined, undefined);
            player challenges::disarmedhackedcarepackage();
        }
    }
    wait(0.1);
    if (isdefined(self)) {
        self cratedelete();
    }
    killcament thread util::deleteaftertime(5);
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0x44fbc7b7, Offset: 0x6b60
// Size: 0x7a
function loop_sound(alias, interval) {
    self endon(#"death");
    while (true) {
        playsoundatposition(alias, self.origin);
        wait(interval);
        interval /= 1.2;
        if (interval < 0.08) {
            break;
        }
    }
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xe8dcc6a, Offset: 0x6be8
// Size: 0x15c
function watchforcratekill(start_kill_watch_z_threshold) {
    crate = self;
    crate endon(#"death", #"stationary");
    while (crate.origin[2] > start_kill_watch_z_threshold) {
        waitframe(1);
    }
    stationarythreshold = 1;
    killthreshold = 0.2;
    maxframestillstationary = 10;
    numframesstationary = 0;
    while (true) {
        vel = 0;
        if (isdefined(self.velocity)) {
            vel = abs(self.velocity[2]);
        }
        if (vel > killthreshold) {
            crate is_touching_crate();
            crate is_clone_touching_crate();
        }
        if (vel < stationarythreshold) {
            numframesstationary++;
        } else {
            numframesstationary = 0;
        }
        if (numframesstationary >= maxframestillstationary) {
            break;
        }
        waitframe(1);
    }
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0xbc1f15d2, Offset: 0x6d50
// Size: 0x110
function cratekill() {
    self endon(#"death");
    stationarythreshold = 2;
    killthreshold = 15;
    maxframestillstationary = 20;
    numframesstationary = 0;
    while (true) {
        vel = 0;
        if (isdefined(self.velocity)) {
            vel = abs(self.velocity[2]);
        }
        if (vel > killthreshold) {
            self is_touching_crate();
            self is_clone_touching_crate();
        }
        if (vel < stationarythreshold) {
            numframesstationary++;
        } else {
            numframesstationary = 0;
        }
        if (numframesstationary >= maxframestillstationary) {
            break;
        }
        wait(0.01);
    }
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x388e796a, Offset: 0x6e68
// Size: 0x41c
function cratedroptogroundkill() {
    self endon(#"death", #"stationary");
    for (;;) {
        players = getplayers();
        dotrace = 0;
        for (i = 0; i < players.size; i++) {
            if (players[i].sessionstate != "playing") {
                continue;
            }
            if (players[i].team == #"spectator") {
                continue;
            }
            self is_equipment_touching_crate(players[i]);
            if (!isalive(players[i])) {
                continue;
            }
            flattenedselforigin = (self.origin[0], self.origin[1], 0);
            flattenedplayerorigin = (players[i].origin[0], players[i].origin[1], 0);
            if (distancesquared(flattenedselforigin, flattenedplayerorigin) > 4096) {
                continue;
            }
            dotrace = 1;
            break;
        }
        if (dotrace) {
            start = self.origin;
            cratedroptogroundtrace(start);
            start = self getpointinbounds(1, 0, 0);
            cratedroptogroundtrace(start);
            start = self getpointinbounds(-1, 0, 0);
            cratedroptogroundtrace(start);
            start = self getpointinbounds(0, -1, 0);
            cratedroptogroundtrace(start);
            start = self getpointinbounds(0, 1, 0);
            cratedroptogroundtrace(start);
            start = self getpointinbounds(1, 1, 0);
            cratedroptogroundtrace(start);
            start = self getpointinbounds(-1, 1, 0);
            cratedroptogroundtrace(start);
            start = self getpointinbounds(1, -1, 0);
            cratedroptogroundtrace(start);
            start = self getpointinbounds(-1, -1, 0);
            cratedroptogroundtrace(start);
            wait(0.2);
            continue;
        }
        wait(0.5);
    }
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xbfc261e1, Offset: 0x7290
// Size: 0x224
function cratedroptogroundtrace(start) {
    end = start + (0, 0, -8000);
    trace = bullettrace(start, end, 1, self, 0, 1);
    if (isdefined(trace[#"entity"]) && isplayer(trace[#"entity"]) && isalive(trace[#"entity"])) {
        player = trace[#"entity"];
        if (player.sessionstate != "playing") {
            return;
        }
        if (player.team == #"spectator") {
            return;
        }
        if (distancesquared(start, trace[#"position"]) < 144 || self istouching(player)) {
            player dodamage(player.health + 1, player.origin, self.owner, self, "none", "MOD_HIT_BY_OBJECT", 0, getweapon(#"supplydrop"));
            player playsound(#"mpl_supply_crush");
            player playsound(#"phy_impact_supply");
        }
    }
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0xc6b040dd, Offset: 0x74c0
// Size: 0x3c4
function is_touching_crate() {
    if (!isdefined(self)) {
        return;
    }
    crate = self;
    extraboundary = (10, 10, 10);
    players = getplayers();
    crate_bottom_point = self.origin;
    foreach (player in level.players) {
        if (isdefined(player) && isalive(player)) {
            stance = player getstance();
            stance_z_offset = stance == "crouch" ? 55 : stance == "stand" ? 75 : 15;
            player_test_point = player.origin + (0, 0, stance_z_offset);
            var_f6f95bb5 = distance2dsquared(player_test_point, self.origin);
            zvel = self.velocity[2];
            if (var_f6f95bb5 < 2500 && player_test_point[2] > crate_bottom_point[2]) {
                attacker = isdefined(self.owner) ? self.owner : self;
                player dodamage(player.health + 1, player.origin, attacker, self, "none", "MOD_HIT_BY_OBJECT", 0, getweapon(#"supplydrop"));
                player playsound(#"mpl_supply_crush");
                player playsound(#"phy_impact_supply");
            }
        }
        self is_equipment_touching_crate(player);
    }
    vehicles = getentarray("script_vehicle", "classname");
    foreach (vehicle in vehicles) {
        if (isvehicle(vehicle)) {
            if (isdefined(vehicle.archetype) && vehicle.archetype == "wasp") {
                if (crate istouching(vehicle, (2, 2, 2))) {
                    vehicle notify(#"sentinel_shutdown");
                }
            }
        }
    }
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x5d10ac8d, Offset: 0x7890
// Size: 0x1ee
function is_clone_touching_crate() {
    if (!isdefined(self)) {
        return;
    }
    extraboundary = (10, 10, 10);
    actors = getactorarray();
    for (i = 0; i < actors.size; i++) {
        if (isdefined(actors[i]) && isdefined(actors[i].isaiclone) && isalive(actors[i]) && actors[i].origin[2] < self.origin[2] && self istouching(actors[i], extraboundary)) {
            attacker = isdefined(self.owner) ? self.owner : self;
            actors[i] dodamage(actors[i].health + 1, actors[i].origin, attacker, self, "none", "MOD_HIT_BY_OBJECT", 0, getweapon(#"supplydrop"));
            actors[i] playsound(#"mpl_supply_crush");
            actors[i] playsound(#"phy_impact_supply");
        }
    }
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xe10ebb8, Offset: 0x7a88
// Size: 0x1bc
function is_equipment_touching_crate(player) {
    extraboundary = (10, 10, 10);
    if (isdefined(player) && isdefined(player.weaponobjectwatcherarray)) {
        for (watcher = 0; watcher < player.weaponobjectwatcherarray.size; watcher++) {
            objectwatcher = player.weaponobjectwatcherarray[watcher];
            objectarray = objectwatcher.objectarray;
            if (isdefined(objectarray)) {
                for (weaponobject = 0; weaponobject < objectarray.size; weaponobject++) {
                    if (isdefined(objectarray[weaponobject]) && self istouching(objectarray[weaponobject], extraboundary)) {
                        if (isdefined(objectwatcher.ondetonatecallback)) {
                            objectwatcher thread weaponobjects::waitanddetonate(objectarray[weaponobject], 0);
                            continue;
                        }
                        weaponobjects::removeweaponobject(objectwatcher, objectarray[weaponobject]);
                    }
                }
            }
        }
    }
    extraboundary = (15, 15, 15);
    if (isdefined(player) && isdefined(player.tacticalinsertion) && self istouching(player.tacticalinsertion, extraboundary)) {
        player.tacticalinsertion thread tacticalinsertion::fizzle();
    }
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x1422f973, Offset: 0x7c50
// Size: 0xa0
function spawnuseent(player) {
    useent = spawn("script_origin", self.origin);
    useent.curprogress = 0;
    useent.inuse = 0;
    useent.userate = 0;
    useent.usetime = 0;
    useent.owner = self;
    useent.capturingplayer = player;
    useent thread useentownerdeathwaiter(self);
    return useent;
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xd95ae8f7, Offset: 0x7cf8
// Size: 0x4c
function useentownerdeathwaiter(owner) {
    self endon(#"death");
    owner waittill(#"death");
    self delete();
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0xb0b99b52, Offset: 0x7d50
// Size: 0x1c2
function crateusethink() {
    while (isdefined(self)) {
        waitresult = self waittill(#"trigger", #"death");
        player = waitresult.activator;
        if (!isdefined(self)) {
            break;
        }
        if (!isalive(player)) {
            continue;
        }
        if (!player isonground()) {
            continue;
        }
        if (isdefined(self.owner) && self.owner == player) {
            continue;
        }
        useent = self spawnuseent(player);
        result = 0;
        if (isdefined(self.hacker)) {
            useent.hacker = self.hacker;
        }
        self.useent = useent;
        result = useent useholdthink(player, level.cratenonownerusetime);
        if (isdefined(useent)) {
            useent delete();
        } else {
            break;
        }
        if (result) {
            scoreevents::givecratecapturemedal(self, player);
            self notify(#"captured", {#player:player, #is_remote_hack:0});
        }
    }
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0xf3b963ba, Offset: 0x7f20
// Size: 0x142
function crateusethinkowner() {
    while (isdefined(self)) {
        waitresult = self waittill(#"trigger", #"death");
        if (waitresult._notify == "death") {
            return;
        }
        player = waitresult.activator;
        if (!isalive(player)) {
            continue;
        }
        if (!isdefined(self.owner)) {
            continue;
        }
        if (self.owner != player) {
            continue;
        }
        result = self useholdthink(player, level.crateownerusetime);
        if (!isdefined(self)) {
            break;
        }
        if (result && isdefined(player)) {
            self notify(#"captured", {#player:player, #is_remote_hack:0});
        }
    }
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xe18e5b8d, Offset: 0x8070
// Size: 0x1d0
function useholdthink(player, usetime) {
    player notify(#"use_hold");
    player val::set(#"supplydrop", "freezecontrols");
    player val::set(#"supplydrop", "disable_weapons");
    player val::set(#"supplydrop", "disable_offhand_weapons");
    self.curprogress = 0;
    self.inuse = 1;
    self.userate = 0;
    self.usetime = usetime;
    player thread personalusebar(self);
    result = useholdthinkloop(player);
    if (isdefined(player)) {
        player notify(#"done_using");
        player val::reset(#"supplydrop", "freezecontrols");
        player val::reset(#"supplydrop", "disable_weapons");
        player val::reset(#"supplydrop", "disable_offhand_weapons");
    }
    if (isdefined(self)) {
        self.inuse = 0;
    }
    if (isdefined(result) && result) {
        return true;
    }
    return false;
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x4d7a359e, Offset: 0x8248
// Size: 0xde
function continueholdthinkloop(player) {
    if (!isdefined(self)) {
        return false;
    }
    if (self.curprogress >= self.usetime) {
        return false;
    }
    if (!isalive(player)) {
        return false;
    }
    if (player.throwinggrenade) {
        return false;
    }
    if (!player usebuttonpressed()) {
        return false;
    }
    if (player meleebuttonpressed()) {
        return false;
    }
    if (player isinvehicle()) {
        return false;
    }
    if (player isweaponviewonlylinked()) {
        return false;
    }
    if (player isremotecontrolling()) {
        return false;
    }
    return true;
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x4512bffe, Offset: 0x8330
// Size: 0x112
function useholdthinkloop(player) {
    level endon(#"game_ended");
    self endon(#"disabled");
    self.owner endon(#"crate_use_interrupt");
    timedout = 0;
    while (self continueholdthinkloop(player)) {
        timedout += 0.05;
        self.curprogress += level.var_9fee970c * self.userate;
        self.userate = 1;
        if (self.curprogress >= self.usetime) {
            self.inuse = 0;
            waitframe(1);
            return isalive(player);
        }
        waitframe(1);
        hostmigration::waittillhostmigrationdone();
    }
    return 0;
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x7d595695, Offset: 0x8450
// Size: 0x1c6
function crategamblerthink() {
    self endon(#"death");
    for (;;) {
        waitresult = self waittill(#"trigger_use_doubletap");
        player = waitresult.player;
        if (!player hasperk(#"specialty_showenemyequipment")) {
            continue;
        }
        if (isdefined(self.useent) && self.useent.inuse) {
            if (isdefined(self.owner) && self.owner != player && isdefined(self.useent.capturingplayer) && self.useent.capturingplayer != player) {
                continue;
            }
        }
        player playlocalsound(#"uin_gamble_perk");
        self.cratetype = getrandomcratetype("gambler", self.cratetype.name);
        self cratereactivate();
        self sethintstringforperk("specialty_showenemyequipment", self.cratetype.hint);
        self notify(#"crate_use_interrupt");
        level notify(#"use_interrupt", {#target:self});
        return;
    }
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x7fb162fc, Offset: 0x8620
// Size: 0x6c
function cratereactivate() {
    self sethintstring(self.cratetype.hint);
    icon = self geticonforcrate();
    self thread entityheadicons::setentityheadicon(self.team, self, icon);
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x624d3897, Offset: 0x8698
// Size: 0x404
function personalusebar(object) {
    self endon(#"disconnect");
    capturecratestate = 0;
    if (self hasperk(#"specialty_showenemyequipment") && object.owner != self && !isdefined(object.hacker) && (level.teambased && util::function_fbce7263(object.owner.team, self.team) || !level.teambased)) {
        capturecratestate = 2;
        self playlocalsound(#"evt_hacker_hacking");
    } else if (self hasperk(#"specialty_showenemyequipment") && isdefined(object.hacker) && (object.owner == self || level.teambased && object.owner.team == self.team)) {
        capturecratestate = 3;
        self playlocalsound(#"evt_hacker_hacking");
    } else {
        capturecratestate = 1;
        self.is_capturing_own_supply_drop = object.owner === self && (!isdefined(object.originalowner) || object.originalowner == self);
    }
    lastrate = -1;
    while (isalive(self) && isdefined(object) && object.inuse && !level.gameended) {
        if (lastrate != object.userate) {
            if (object.curprogress > object.usetime) {
                object.curprogress = object.usetime;
            }
            if (!object.userate) {
                self clientfield::set_player_uimodel("hudItems.captureCrateTotalTime", 0);
                self clientfield::set_player_uimodel("hudItems.captureCrateState", 0);
            } else {
                barfrac = object.curprogress / object.usetime;
                rateofchange = object.userate / object.usetime;
                capturecratetotaltime = 0;
                if (rateofchange > 0) {
                    capturecratetotaltime = (1 - barfrac) / rateofchange;
                }
                self clientfield::set_player_uimodel("hudItems.captureCrateTotalTime", int(capturecratetotaltime));
                self clientfield::set_player_uimodel("hudItems.captureCrateState", capturecratestate);
            }
        }
        lastrate = object.userate;
        waitframe(1);
    }
    self.is_capturing_own_supply_drop = 0;
    self clientfield::set_player_uimodel("hudItems.captureCrateTotalTime", 0);
    self clientfield::set_player_uimodel("hudItems.captureCrateState", 0);
}

// Namespace supplydrop/supplydrop
// Params 8, eflags: 0x0
// Checksum 0x5526c82b, Offset: 0x8aa8
// Size: 0x430
function spawn_helicopter(owner, team, origin, angles, vehicledef, targetname, killstreak_id, context) {
    chopper = spawnvehicle(vehicledef, origin, angles, targetname);
    chopper setowner(owner);
    if (!isdefined(chopper)) {
        if (isplayer(owner)) {
            killstreakrules::killstreakstop("supply_drop", team, killstreak_id);
            self iprintlnbold(#"hash_7a1ca44da026f58c");
            self notify(#"cleanup_marker");
        }
        return undefined;
    }
    chopper.destroyfunc = &destroyhelicopter;
    chopper.script_nocorpse = 1;
    chopper killstreaks::configure_team("supply_drop", killstreak_id, owner);
    chopper.maxhealth = level.heli_maxhealth;
    chopper.rocketdamageoneshot = chopper.maxhealth + 1;
    chopper.damagetaken = 0;
    chopper.targetname = "chopper";
    hardpointtypefordamage = "supply_drop";
    if (context.killstreakref === "inventory_tank_robot" || context.killstreakref === "tank_robot") {
        hardpointtypefordamage = "supply_drop_ai_tank";
    } else if (context.killstreakref === "inventory_combat_robot" || context.killstreakref === "combat_robot") {
        hardpointtypefordamage = "supply_drop_combat_robot";
    }
    chopper thread helicopter::heli_damage_monitor(hardpointtypefordamage);
    chopper thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile("crashing", "death");
    chopper.spawntime = gettime();
    chopper clientfield::set("enemyvehicle", 1);
    if (isdefined(level.var_14151f16)) {
        [[ level.var_14151f16 ]](chopper, 0);
    }
    /#
        chopper util::debug_slow_heli_speed();
    #/
    maxpitch = getdvarint(#"scr_supplydropmaxpitch", 25);
    maxroll = getdvarint(#"scr_supplydropmaxroll", 45);
    chopper setmaxpitchroll(0, maxroll);
    chopper setdrawinfrared(1);
    chopper setneargoalnotifydist(40);
    target_set(chopper, (0, 0, -25));
    if (isplayer(owner)) {
        chopper thread refcountdecchopper(team, killstreak_id);
    }
    chopper thread helidestroyed();
    chopper setrotorspeed(1);
    return chopper;
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x9da7a13e, Offset: 0x8ee0
// Size: 0x1b4
function destroyhelicopter(var_fec7078b) {
    team = self.originalteam;
    if (target_istarget(self)) {
        target_remove(self);
    }
    self influencers::remove_influencers();
    if (isdefined(self.interior_model)) {
        self.interior_model delete();
        self.interior_model = undefined;
    }
    if (isdefined(self.minigun_snd_ent)) {
        self.minigun_snd_ent stoploopsound();
        self.minigun_snd_ent delete();
        self.minigun_snd_ent = undefined;
    }
    if (isdefined(self.alarm_snd_ent)) {
        self.alarm_snd_ent delete();
        self.alarm_snd_ent = undefined;
    }
    if (isdefined(self.flare_ent)) {
        self.flare_ent delete();
        self.flare_ent = undefined;
    }
    self notify(#"hash_525537be2de4c159", {#position:self.origin, #direction:self.angles, #owner:self.owner});
    lbexplode();
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xb7364a5, Offset: 0x90a0
// Size: 0x1a
function getdropheight(origin) {
    return airsupport::getminimumflyheight();
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x27177885, Offset: 0x90c8
// Size: 0x1e
function getdropdirection() {
    return (0, randomint(360), 0);
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0x148cf9ba, Offset: 0x90f0
// Size: 0x60
function getnextdropdirection(drop_direction, degrees) {
    drop_direction = (0, drop_direction[1] + degrees, 0);
    if (drop_direction[1] >= 360) {
        drop_direction = (0, drop_direction[1] - 360, 0);
    }
    return drop_direction;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0x608384a3, Offset: 0x9158
// Size: 0x1fe
function gethelistart(drop_origin, drop_direction) {
    dist = -1 * getdvarint(#"scr_supplydropincomingdistance", 15000);
    pathrandomness = 100;
    direction = drop_direction + (0, randomintrange(-2, 3), 0);
    start_origin = drop_origin + anglestoforward(direction) * dist;
    start_origin += ((randomfloat(2) - 1) * pathrandomness, (randomfloat(2) - 1) * pathrandomness, 0);
    /#
        if (getdvarint(#"scr_noflyzones_debug", 0)) {
            if (level.noflyzones.size) {
                index = randomintrange(0, level.noflyzones.size);
                delta = drop_origin - level.noflyzones[index].origin;
                delta = (delta[0] + randomint(10), delta[1] + randomint(10), 0);
                delta = vectornormalize(delta);
                start_origin = drop_origin + delta * dist;
            }
        }
    #/
    return start_origin;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xdf98a011, Offset: 0x9360
// Size: 0x162
function getheliend(drop_origin, drop_direction) {
    pathrandomness = 150;
    dist = -1 * getdvarint(#"scr_supplydropoutgoingdistance", 15000);
    if (randomintrange(0, 2) == 0) {
        turn = randomintrange(60, 121);
    } else {
        turn = -1 * randomintrange(60, 121);
    }
    direction = drop_direction + (0, turn, 0);
    end_origin = drop_origin + anglestoforward(direction) * dist;
    end_origin += ((randomfloat(2) - 1) * pathrandomness, (randomfloat(2) - 1) * pathrandomness, 0);
    return end_origin;
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0x33b78b68, Offset: 0x94d0
// Size: 0x78
function addoffsetontopoint(point, direction, offset) {
    angles = vectortoangles((direction[0], direction[1], 0));
    offset_world = rotatepoint(offset, angles);
    return point + offset_world;
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0xff5d15ae, Offset: 0x9550
// Size: 0x62
function supplydrophelistartpath_v2_setup(goal, goal_offset, var_aea79ccc) {
    goalpath = spawnstruct();
    goalpath.start = helicopter::getvalidrandomstartnode(goal, var_aea79ccc).origin;
    return goalpath;
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0x3ad477f1, Offset: 0x95c0
// Size: 0x72
function supplydrophelistartpath_v2_part2_local(goal, goalpath, goal_local_offset) {
    direction = goal - goalpath.start;
    goalpath.path = [];
    goalpath.path[0] = addoffsetontopoint(goal, direction, goal_local_offset);
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0xc1143ec7, Offset: 0x9640
// Size: 0x46
function supplydrophelistartpath_v2_part2(goal, goalpath, goal_world_offset) {
    goalpath.path = [];
    goalpath.path[0] = goal + goal_world_offset;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xda8d60f4, Offset: 0x9690
// Size: 0x306
function supplydrophelistartpath(goal, goal_offset) {
    total_tries = 12;
    tries = 0;
    goalpath = spawnstruct();
    drop_direction = getdropdirection();
    while (tries < total_tries) {
        goalpath.start = gethelistart(goal, drop_direction);
        goalpath.path = airsupport::gethelipath(goalpath.start, goal);
        startnoflyzones = airsupport::insidenoflyzones(goalpath.start, 0);
        if (isdefined(goalpath.path) && startnoflyzones.size == 0) {
            if (goalpath.path.size > 1) {
                direction = goalpath.path[goalpath.path.size - 1] - goalpath.path[goalpath.path.size - 2];
            } else {
                direction = goalpath.path[goalpath.path.size - 1] - goalpath.start;
            }
            goalpath.path[goalpath.path.size - 1] = addoffsetontopoint(goalpath.path[goalpath.path.size - 1], direction, goal_offset);
            /#
                sphere(goalpath.path[goalpath.path.size - 1], 10, (0, 0, 1), 1, 1, 10, 1000);
            #/
            return goalpath;
        }
        drop_direction = getnextdropdirection(drop_direction, 30);
        tries++;
    }
    drop_direction = getdropdirection();
    goalpath.start = gethelistart(goal, drop_direction);
    direction = goal - goalpath.start;
    goalpath.path = [];
    goalpath.path[0] = addoffsetontopoint(goal, direction, goal_offset);
    return goalpath;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xd3fe07d4, Offset: 0x99a0
// Size: 0x8a
function supplydropheliendpath_v2(start, var_aea79ccc) {
    goalpath = spawnstruct();
    goalpath.start = start;
    goal = helicopter::getvalidrandomleavenode(start, var_aea79ccc).origin;
    goalpath.path = [];
    goalpath.path[0] = goal;
    return goalpath;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0x7eb86020, Offset: 0x9a38
// Size: 0x1be
function supplydropheliendpath(origin, drop_direction) {
    total_tries = 5;
    tries = 0;
    goalpath = spawnstruct();
    while (tries < total_tries) {
        goal = getheliend(origin, drop_direction);
        goalpath.path = airsupport::gethelipath(origin, goal);
        if (isdefined(goalpath.path)) {
            return goalpath;
        }
        tries++;
    }
    leave_nodes = getentarray("heli_leave", "targetname");
    foreach (node in leave_nodes) {
        goalpath.path = airsupport::gethelipath(origin, node.origin);
        if (isdefined(goalpath.path)) {
            return goalpath;
        }
    }
    goalpath.path = [];
    goalpath.path[0] = getheliend(origin, drop_direction);
    return goalpath;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xe186b460, Offset: 0x9c00
// Size: 0x352
function inccratekillstreakusagestat(weapon, killstreak_id) {
    if (weapon == level.weaponnone) {
        return;
    }
    switch (weapon.name) {
    case #"turret_drop":
        self killstreaks::play_killstreak_start_dialog("turret_drop", self.pers[#"team"], killstreak_id);
        break;
    case #"tow_turret_drop":
        self killstreaks::play_killstreak_start_dialog("tow_turret_drop", self.pers[#"team"], killstreak_id);
        break;
    case #"supplydrop_marker":
    case #"inventory_supplydrop_marker":
        self killstreaks::play_killstreak_start_dialog("supply_drop", self.pers[#"team"], killstreak_id);
        level thread popups::displaykillstreakteammessagetoall("supply_drop", self);
        self challenges::calledincarepackage();
        self stats::function_e24eec31(getweapon(#"supplydrop"), #"used", 1);
        break;
    case #"tank_robot":
    case #"inventory_tank_robot":
        self killstreaks::play_killstreak_start_dialog("tank_robot", self.pers[#"team"], killstreak_id);
        level thread popups::displaykillstreakteammessagetoall("tank_robot", self);
        self stats::function_e24eec31(getweapon(#"tank_robot"), #"used", 1);
        break;
    case #"inventory_minigun_drop":
    case #"minigun_drop":
        self killstreaks::play_killstreak_start_dialog("minigun", self.pers[#"team"], killstreak_id);
        break;
    case #"m32_drop":
    case #"inventory_m32_drop":
        self killstreaks::play_killstreak_start_dialog("m32", self.pers[#"team"], killstreak_id);
        break;
    case #"combat_robot_drop":
        level thread popups::displaykillstreakteammessagetoall("combat_robot", self);
        break;
    }
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x4e7212bf, Offset: 0x9f60
// Size: 0x8c
function markercleanupthread(context) {
    player = self;
    player waittill(#"death", #"disconnect", #"joined_team", #"joined_spectators", #"cleanup_marker");
    cleanup(context, player);
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xf1c4ae88, Offset: 0x9ff8
// Size: 0x9a
function getchopperdroppoint(context) {
    chopper = self;
    return isdefined(context.droptag) ? chopper gettagorigin(context.droptag) + rotatepoint(isdefined(context.droptagoffset) ? context.droptagoffset : (0, 0, 0), chopper.angles) : chopper.origin;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x4
// Checksum 0xca1f713b, Offset: 0xa0a0
// Size: 0xae
function private function_7d90f954(drop_origin, context) {
    if (ispointonnavmesh(drop_origin, context.dist_from_boundary)) {
        /#
            recordsphere(drop_origin + (0, 0, 10), 2, (0, 1, 0), "<unknown string>");
        #/
        return true;
    }
    /#
        recordsphere(drop_origin + (0, 0, 10), 2, (1, 0, 0), "<unknown string>");
    #/
    return false;
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x4
// Checksum 0x60920edf, Offset: 0xa158
// Size: 0xa6
function private function_75277c27(tacpoint, context) {
    if (isdefined(tacpoint.ceilingheight) && tacpoint.ceilingheight >= 4000) {
        /#
            recordsphere(tacpoint.origin, 2, (0, 1, 0), "<unknown string>");
        #/
        return true;
    }
    /#
        recordsphere(tacpoint.origin, 2, (1, 0, 0), "<unknown string>");
    #/
    return false;
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x4
// Checksum 0x9ad37f10, Offset: 0xa208
// Size: 0x11c
function private function_9153c267(drop_origin, context, drop_height) {
    if (isdefined(level.var_e071ed64) && level.var_e071ed64) {
        heli_drop_goal = (drop_origin[0], drop_origin[1], drop_origin[2] + drop_height);
        var_baa92af9 = ispointinnavvolume(heli_drop_goal, "navvolume_big");
        if (var_baa92af9) {
            /#
                recordsphere(drop_origin + (0, 0, 20), 2, (0, 1, 0), "<unknown string>");
            #/
            return true;
        }
        /#
            recordsphere(drop_origin + (0, 0, 20), 2, (1, 0, 0), "<unknown string>");
        #/
        return false;
    }
    return true;
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x4
// Checksum 0xca7c7908, Offset: 0xa330
// Size: 0x168
function private function_accec5c5(drop_origin, context, drop_height) {
    mask = 1;
    radius = 30;
    heli_drop_goal = (drop_origin[0], drop_origin[1], drop_origin[2] + drop_height);
    trace = physicstrace(heli_drop_goal, drop_origin + (0, 0, 10), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), undefined, mask);
    if (trace[#"fraction"] < 1) {
        /#
            recordsphere(drop_origin + (0, 0, 20), 2, (1, 0, 0), "<unknown string>");
        #/
        return false;
    }
    /#
        recordsphere(drop_origin + (0, 0, 20), 2, (0, 1, 0), "<unknown string>");
    #/
    return true;
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x4
// Checksum 0x3bd73518, Offset: 0xa4a0
// Size: 0x130
function private function_fc826e6(tacpoints, context, drop_height) {
    assert(isdefined(tacpoints) && tacpoints.size);
    filteredpoints = [];
    foreach (tacpoint in tacpoints) {
        if (function_75277c27(tacpoint, context) && function_7d90f954(tacpoint.origin, context) && function_9153c267(tacpoint.origin, context, drop_height)) {
            filteredpoints[filteredpoints.size] = tacpoint.origin;
        }
    }
    return filteredpoints;
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0xeb638856, Offset: 0xa5d8
// Size: 0xf2
function function_6dc6bc6b(origins, context, drop_height) {
    assert(isdefined(origins) && origins.size);
    filteredpoints = [];
    foreach (origin in origins) {
        if (function_accec5c5(origin, context, drop_height)) {
            filteredpoints[filteredpoints.size] = origin;
            break;
        }
        waitframe(1);
    }
    return filteredpoints;
}

// Namespace supplydrop/supplydrop
// Params 3, eflags: 0x0
// Checksum 0x3c1bb667, Offset: 0xa6d8
// Size: 0x2d6
function function_263d3e9e(drop_origin, drop_height, context) {
    if (getdvarint(#"hash_458cd0a10d30cedb", 1)) {
        if (function_7d90f954(drop_origin, context) && function_9153c267(drop_origin, context, drop_height)) {
            if (function_accec5c5(drop_origin, context, drop_height)) {
                return drop_origin;
            }
        }
        cylinder = ai::t_cylinder(drop_origin, 1000, 30);
        var_629f4ae1 = tacticalquery("supply_drop_deploy", drop_origin, cylinder);
        waitframe(1);
        cylinder = ai::t_cylinder(drop_origin, 2000, 30);
        var_3b8d7cbe = tacticalquery("supply_drop_deploy", drop_origin, cylinder);
        if (isdefined(var_3b8d7cbe) && var_3b8d7cbe.size) {
            tacpoints = arraycombine(var_629f4ae1, var_3b8d7cbe, 0, 0);
        }
        if (isdefined(tacpoints) && tacpoints.size) {
            tacpoints = function_fc826e6(tacpoints, context, drop_height);
            waitframe(1);
            if (tacpoints.size) {
                tacpoints = arraysortclosest(tacpoints, drop_origin);
                filteredpoints = function_6dc6bc6b(tacpoints, context, drop_height);
                if (isdefined(filteredpoints[0])) {
                    /#
                        recordsphere(filteredpoints[0] + (0, 0, 70), 4, (1, 0.5, 0), "<unknown string>");
                    #/
                    return filteredpoints[0];
                } else {
                    var_c71b63fa = arraygetclosest(drop_origin, tacpoints);
                    /#
                        recordsphere(var_c71b63fa + (0, 0, 70), 4, (0, 1, 1), "<unknown string>");
                    #/
                    return var_c71b63fa;
                }
            }
        }
    }
    return drop_origin;
}

// Namespace supplydrop/supplydrop
// Params 4, eflags: 0x0
// Checksum 0xb0cf5820, Offset: 0xa9b8
// Size: 0x156
function function_fe13a227(chopper, heli_drop_goal, drop_height, original_drop_origin) {
    chopper endon(#"death", #"drop_goal");
    if (getdvarint(#"hash_458cd0a10d30cedb", 1)) {
        drop_origin = (heli_drop_goal[0], heli_drop_goal[1], heli_drop_goal[2] - drop_height);
        while (true) {
            /#
                recordsphere(original_drop_origin, 4, (1, 0, 0), "<unknown string>");
                recordsphere(drop_origin, 4, (1, 0.5, 0), "<unknown string>");
                recordsphere(heli_drop_goal, 4, (0, 0, 1), "<unknown string>");
                recordline(drop_origin, heli_drop_goal, (0, 0, 1), "<unknown string>");
            #/
            waitframe(1);
        }
    }
}

// Namespace supplydrop/supplydrop
// Params 7, eflags: 0x0
// Checksum 0x74ea013c, Offset: 0xab18
// Size: 0x13dc
function helidelivercrate(origin, weapon, owner, team, killstreak_id, package_contents_id, context) {
    if (owner emp::enemyempactive() && !owner hasperk(#"specialty_immuneemp")) {
        killstreakrules::killstreakstop(context.killstreakref, team, killstreak_id);
        self notify(#"cleanup_marker");
        return;
    }
    /#
        if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
            level notify(#"stop_heli_drop_valid_location_marked_cylinder");
            level notify(#"stop_heli_drop_valid_location_arrived_at_goal_cylinder");
            level notify(#"stop_heli_drop_valid_location_dropped_cylinder");
            util::drawcylinder(origin, context.radius, 8000, 99999999, "<unknown string>", (0.4, 0, 0.4), 0.8);
        }
    #/
    origin = self.markerposition;
    if (isdefined(context.marker)) {
        origin = context.marker.origin;
    }
    if (!isdefined(context.var_9fc6cfe9) || !context.var_9fc6cfe9) {
        context.markerfxhandle = spawnfx(level.killstreakcorebundle.fxmarkedlocation, origin + (0, 0, 5), (0, 0, 1), (1, 0, 0));
        context.markerfxhandle.team = owner.team;
        triggerfx(context.markerfxhandle);
    }
    bundle = struct::get_script_bundle("killstreak", "killstreak_supply_drop");
    ricochetdistance = isdefined(bundle) ? bundle.ksricochetdistance : undefined;
    killstreaks::add_ricochet_protection(killstreak_id, owner, origin, ricochetdistance);
    if (isdefined(context.marker)) {
        context.marker.team = owner.team;
        context.marker entityheadicons::destroyentityheadicons();
        context.marker entityheadicons::setentityheadicon(owner.pers[#"team"], owner, context.objective);
    }
    if (isdefined(weapon)) {
        inccratekillstreakusagestat(weapon, killstreak_id);
    }
    rear_hatch_offset_local = getdvarint(#"scr_supplydropoffset", 0);
    drop_origin = origin;
    if (getdvarint(#"hash_458cd0a10d30cedb", 1)) {
        drop_height = 1600;
    } else {
        drop_height = getdropheight(drop_origin);
    }
    drop_height += level.zoffsetcounter * 350;
    level.zoffsetcounter++;
    if (level.zoffsetcounter >= 5) {
        level.zoffsetcounter = 0;
    }
    original_drop_origin = drop_origin;
    if (!getdvarint(#"hash_7ccc40e85206e0a5", 1)) {
        drop_origin = function_263d3e9e(drop_origin, drop_height, context);
    } else if (!function_9153c267(drop_origin, context, drop_height)) {
        drop_origin = function_263d3e9e(drop_origin, drop_height, context);
    }
    adddroplocation(killstreak_id, drop_origin);
    if (getdvarint(#"hash_458cd0a10d30cedb", 1)) {
        if (!isvec(drop_origin)) {
            drop_origin = original_drop_origin;
        }
        heli_drop_goal = (drop_origin[0], drop_origin[1], drop_origin[2] + drop_height);
    } else {
        heli_drop_goal = (drop_origin[0], drop_origin[1], drop_height);
    }
    goalpath = undefined;
    if (level.var_e071ed64) {
        if (isdefined(context.dropoffset)) {
            goalpath = supplydrophelistartpath_v2_setup(heli_drop_goal, context.dropoffset, 0);
            supplydrophelistartpath_v2_part2_local(heli_drop_goal, goalpath, context.dropoffset);
        } else {
            goalpath = supplydrophelistartpath_v2_setup(heli_drop_goal, (rear_hatch_offset_local, 0, 0), 0);
            goal_path_setup_needs_finishing = 1;
        }
    } else if (isdefined(context.dropoffset)) {
        goalpath = supplydrophelistartpath_v2_setup(heli_drop_goal, context.dropoffset, 1);
        supplydrophelistartpath_v2_part2_local(heli_drop_goal, goalpath, context.dropoffset);
    } else {
        goalpath = supplydrophelistartpath_v2_setup(heli_drop_goal, (rear_hatch_offset_local, 0, 0), 1);
        goal_path_setup_needs_finishing = 1;
    }
    spawn_angles = vectortoangles((heli_drop_goal[0], heli_drop_goal[1], 0) - (goalpath.start[0], goalpath.start[1], 0));
    if (isdefined(context.vehiclename)) {
        helicoptervehicleinfo = context.vehiclename;
    } else {
        helicoptervehicleinfo = level.vtoldrophelicoptervehicleinfo;
    }
    chopper = spawn_helicopter(owner, team, goalpath.start, spawn_angles, helicoptervehicleinfo, "", killstreak_id, context);
    chopper thread function_fe13a227(chopper, heli_drop_goal, drop_height, original_drop_origin);
    if (isdefined(level.var_14151f16)) {
        [[ level.var_14151f16 ]](chopper, 0);
    }
    if (level.var_e071ed64) {
        chopper makesentient();
        chopper makepathfinder();
        chopper.ignoreme = 1;
        chopper.ignoreall = 1;
        chopper setneargoalnotifydist(40);
        chopper.goalradius = 40;
        if (goal_path_setup_needs_finishing === 1) {
            goal_world_offset = chopper.origin - chopper getchopperdroppoint(context);
            supplydrophelistartpath_v2_part2(heli_drop_goal, goalpath, goal_world_offset);
            goal_path_setup_needs_finishing = 0;
        }
    } else if (goal_path_setup_needs_finishing === 1) {
        goal_world_offset = chopper.origin - chopper getchopperdroppoint(context);
        supplydrophelistartpath_v2_part2(heli_drop_goal, goalpath, goal_world_offset);
        goal_path_setup_needs_finishing = 0;
    }
    waitforonlyonedroplocation = 0;
    while (level.droplocations.size > 1 && waitforonlyonedroplocation) {
        arrayremovevalue(level.droplocations, undefined);
        wait_for_drop = 0;
        foreach (id, droplocation in level.droplocations) {
            if (id < killstreak_id) {
                wait_for_drop = 1;
                break;
            }
        }
        if (wait_for_drop) {
            wait(0.5);
            continue;
        }
        break;
    }
    chopper.killstreakweaponname = weapon.name;
    if (isdefined(context) && isdefined(context.hasflares)) {
        chopper.numflares = 3;
        chopper.flareoffset = (0, 0, 0);
        chopper thread helicopter::create_flare_ent((0, 0, -50));
    } else {
        chopper.numflares = 0;
    }
    killcament = spawn("script_model", chopper.origin + (0, 0, 800));
    killcament.angles = (100, chopper.angles[1], chopper.angles[2]);
    killcament.starttime = gettime();
    killcament linkto(chopper);
    if (!isdefined(chopper)) {
        return;
    }
    if (isdefined(context) && isdefined(context.prolog)) {
        chopper [[ context.prolog ]](context);
    } else if (isdefined(level.killstreakweapons[weapon])) {
        if (getdvarint(#"hash_458cd0a10d30cedb", 1)) {
            chopper thread helidropcrate(level.killstreakweapons[weapon], owner, rear_hatch_offset_local, killcament, killstreak_id, package_contents_id, context, drop_origin);
        } else {
            chopper thread helidropcrate(level.killstreakweapons[weapon], owner, rear_hatch_offset_local, killcament, killstreak_id, package_contents_id, context);
        }
    }
    chopper endon(#"death");
    if (level.var_e071ed64) {
        chopper.var_f766e12d = 15;
        chopper thread airsupport::function_f1b7b432(goalpath.path, "drop_goal", 1, 1, 1);
    } else {
        chopper thread airsupport::followpath(goalpath.path, "drop_goal", 1);
    }
    chopper thread speedregulator(heli_drop_goal);
    target_set(chopper, (0, 0, 50));
    chopper waittill(#"drop_goal");
    chopper.var_f766e12d = undefined;
    chopper thread function_e16ff9df(15);
    if (isdefined(owner)) {
        owner notify(#"payload_delivered");
    }
    if (isdefined(context) && isdefined(context.epilog)) {
        chopper [[ context.epilog ]](context);
    }
    /#
        println("<unknown string>" + gettime() - chopper.spawntime);
        if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
            if (isdefined(context.dropoffset)) {
                chopper_drop_point = chopper.origin - rotatepoint(context.dropoffset, chopper.angles);
            } else {
                chopper_drop_point = chopper getchopperdroppoint(context);
            }
            trace = groundtrace(chopper_drop_point + (0, 0, -100), chopper_drop_point + (0, 0, -10000), 0, undefined, 0);
            debug_drop_location = trace[#"position"];
            util::drawcylinder(debug_drop_location, context.radius, 8000, 99999999, "<unknown string>", (1, 0.6, 0), 0.9);
            iprintln("<unknown string>" + distance2d(chopper_drop_point, heli_drop_goal));
        }
    #/
    on_target = 0;
    last_distance_from_goal_squared = 1e+07 * 1e+07;
    continue_waiting = 1;
    for (remaining_tries = 30; continue_waiting && remaining_tries > 0; remaining_tries--) {
        if (isdefined(context.dropoffset)) {
            chopper_drop_point = chopper.origin - rotatepoint(context.dropoffset, chopper.angles);
        } else {
            chopper_drop_point = chopper getchopperdroppoint(context);
        }
        current_distance_from_goal_squared = distance2dsquared(chopper_drop_point, heli_drop_goal);
        continue_waiting = current_distance_from_goal_squared < last_distance_from_goal_squared && current_distance_from_goal_squared > 3.7 * 3.7;
        last_distance_from_goal_squared = current_distance_from_goal_squared;
        /#
            if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
                sphere(chopper_drop_point, 8, (1, 0, 0), 0.9, 0, 20, 1);
            }
        #/
        if (continue_waiting) {
            /#
                if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
                    iprintln("<unknown string>" + distance2d(chopper_drop_point, heli_drop_goal));
                }
            #/
            waitframe(1);
        }
    }
    /#
        if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
            iprintln("<unknown string>" + distance2d(chopper_drop_point, heli_drop_goal));
        }
    #/
    chopper notify(#"drop_crate", {#position:chopper.origin, #direction:chopper.angles, #owner:chopper.owner});
    chopper.droptime = gettime();
    chopper playsound(#"veh_supply_drop");
    wait(0.7);
    if (isdefined(level.killstreakweapons[weapon])) {
        chopper killstreaks::play_pilot_dialog_on_owner("waveStartFinal", level.killstreakweapons[weapon], chopper.killstreak_id);
    }
    /#
        chopper util::debug_slow_heli_speed();
    #/
    if (level.var_e071ed64) {
        chopper util::make_sentient();
        if (!ispathfinder(chopper)) {
            chopper makepathfinder();
        }
        chopper.ignoreme = 1;
        chopper.ignoreall = 1;
        goalpath = supplydropheliendpath_v2(chopper.origin, 0);
        chopper airsupport::function_f1b7b432(goalpath.path, undefined, 1, 1);
    } else {
        goalpath = supplydropheliendpath_v2(chopper.origin, 1);
        chopper airsupport::followpath(goalpath.path, undefined, 0);
    }
    println("<unknown string>" + gettime() - chopper.droptime);
    chopper notify(#"leaving");
    chopper delete();
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x20958bd7, Offset: 0xbf00
// Size: 0x4c
function function_e16ff9df(delay) {
    wait(delay);
    if (!isdefined(self)) {
        return;
    }
    if (target_istarget(self)) {
        target_remove(self);
    }
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0xccb3640b, Offset: 0xbf58
// Size: 0xcc
function speedregulator(goal) {
    self endon(#"drop_goal", #"death");
    /#
        self util::debug_slow_heli_speed();
    #/
    maxpitch = getdvarint(#"scr_supplydropmaxpitch", 25);
    maxroll = getdvarint(#"scr_supplydropmaxroll", 35);
    self setmaxpitchroll(maxpitch, maxroll);
}

// Namespace supplydrop/supplydrop
// Params 8, eflags: 0x0
// Checksum 0xdcef2d7e, Offset: 0xc030
// Size: 0x4dc
function helidropcrate(killstreak, originalowner, offset, killcament, killstreak_id, package_contents_id, context, var_83f3c388) {
    helicopter = self;
    originalowner endon(#"disconnect");
    crate = cratespawn(killstreak, killstreak_id, originalowner, self.team, self.origin, self.angles, undefined, context);
    if (killstreak == "inventory_supply_drop" || killstreak == "supply_drop") {
        crate linkto(helicopter, isdefined(context.droptag) ? context.droptag : "tag_origin", isdefined(context.droptagoffset) ? context.droptagoffset : (0, 0, 0));
        helicopter clientfield::set("supplydrop_care_package_state", 1);
    } else if (killstreak == "inventory_tank_robot" || killstreak == "tank_robot" || killstreak == "ai_tank_marker") {
        crate linkto(helicopter, isdefined(context.droptag) ? context.droptag : "tag_origin", isdefined(context.droptagoffset) ? context.droptagoffset : (0, 0, 0));
        helicopter clientfield::set("supplydrop_ai_tank_state", 1);
        if (isdefined(level.var_14151f16)) {
            [[ level.var_14151f16 ]](crate, 0);
        }
    }
    team = self.team;
    waitresult = helicopter waittill(#"drop_crate", #"hash_525537be2de4c159");
    chopperowner = waitresult.owner;
    origin = waitresult.position;
    angles = waitresult.direction;
    if (waitresult._notify == #"hash_525537be2de4c159") {
        crate cratedelete(0);
        return;
    }
    if (isdefined(chopperowner)) {
        owner = chopperowner;
        if (owner != originalowner) {
            crate killstreaks::configure_team(killstreak, owner);
            killstreaks::remove_ricochet_protection(killstreak_id, owner);
        }
    } else {
        owner = originalowner;
    }
    if (isdefined(self)) {
        team = self.team;
        if (killstreak == "inventory_supply_drop" || killstreak == "supply_drop") {
            helicopter clientfield::set("supplydrop_care_package_state", 0);
        } else if (killstreak == "inventory_tank_robot" || killstreak == "tank_robot") {
            helicopter clientfield::set("supplydrop_ai_tank_state", 0);
        }
    }
    if (team == owner.team) {
        rear_hatch_offset_height = getdvarint(#"scr_supplydropoffsetheight", 200);
        rear_hatch_offset_world = rotatepoint((offset, 0, 0), angles);
        drop_origin = origin - (0, 0, rear_hatch_offset_height) - rear_hatch_offset_world;
        thread dropcrate(drop_origin, angles, killstreak, owner, team, killcament, killstreak_id, package_contents_id, crate, context, var_83f3c388);
    }
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x68bf4c15, Offset: 0xc518
// Size: 0x144
function helidestroyed() {
    self endon(#"leaving", #"helicopter_gone", #"death");
    while (true) {
        if (self.damagetaken > self.maxhealth) {
            break;
        }
        waitframe(1);
    }
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.owner)) {
        self.owner notify(#"payload_fail");
    }
    self setspeed(25, 5);
    wait(randomfloatrange(0.5, 1.5));
    self notify(#"hash_525537be2de4c159", {#position:self.origin, #direction:self.angles, #owner:self.owner});
    lbexplode();
}

// Namespace supplydrop/supplydrop
// Params 0, eflags: 0x0
// Checksum 0x308e85b3, Offset: 0xc668
// Size: 0x11c
function lbexplode() {
    forward = self.origin + (0, 0, 1) - self.origin;
    fxpos = self gettagorigin("tag_deathfx");
    if (!isdefined(fxpos)) {
        fxpos = self.origin;
    }
    playfx("destruct/fx8_trans_heli_exp_lg", fxpos, forward);
    self playsound(level.heli_sound[#"crash"]);
    self notify(#"explode");
    if (isdefined(self.delete_after_destruction_wait_time)) {
        self hide();
        self waitanddelete(self.delete_after_destruction_wait_time);
        return;
    }
    self delete();
}

// Namespace supplydrop/supplydrop
// Params 1, eflags: 0x0
// Checksum 0x3b6c7ddc, Offset: 0xc790
// Size: 0x11e
function lbspin(speed) {
    self endon(#"explode");
    playfxontag(level.chopper_fx[#"explode"][#"large"], self, "tail_rotor_jnt");
    playfxontag(level.chopper_fx[#"fire"][#"trail"][#"large"], self, "tail_rotor_jnt");
    self setyawspeed(speed, speed, speed);
    while (isdefined(self)) {
        self settargetyaw(self.angles[1] + speed * 0.9);
        wait(1);
    }
}

// Namespace supplydrop/supplydrop
// Params 2, eflags: 0x0
// Checksum 0xb2692474, Offset: 0xc8b8
// Size: 0x5e
function refcountdecchopper(team, killstreak_id) {
    self waittill(#"death");
    killstreakrules::killstreakstop("supply_drop", team, killstreak_id);
    self notify(#"cleanup_marker");
}

/#

    // Namespace supplydrop/supplydrop
    // Params 0, eflags: 0x0
    // Checksum 0xe40ac231, Offset: 0xc920
    // Size: 0x82
    function supply_drop_dev_gui() {
        setdvar(#"scr_supply_drop_gui", "<unknown string>");
        while (true) {
            wait(0.5);
            devgui_string = getdvarstring(#"scr_supply_drop_gui");
            level.dev_gui_supply_drop = devgui_string;
        }
    }

#/

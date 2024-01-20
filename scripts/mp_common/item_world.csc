// Atian COD Tools GSC decompiler test
#using scripts\core_common\vehicle_shared.csc;
#using scripts\mp_common\item_world_util.csc;
#using script_68c78107b4aa059c;
#using script_5e5ac8c591dedeed;
#using script_c1eebdc8cad5d78;
#using scripts\mp_common\item_inventory.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flagsys_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using script_474309807eb94f34;
#using scripts\core_common\activecamo_shared.csc;

#namespace item_world;

// Namespace item_world/item_world
// Params 0, eflags: 0x2
// Checksum 0xb708dbfd, Offset: 0x2e0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"item_world", &__init__, undefined, undefined);
}

// Namespace item_world/item_world
// Params 0, eflags: 0x5 linked
// Checksum 0xfcd6c84a, Offset: 0x328
// Size: 0xdb4
function private __init__() {
    if (getgametypesetting(#"useitemspawns") == 0) {
        return;
    }
    level.showpickuphintmodel = [];
    level.var_89f832ca = [];
    level.var_62c91473 = [];
    level.var_ce95aace = [];
    level.var_7e2f5883 = [];
    level.var_19cf0be9 = [];
    level.var_418d51ad = array(#"ammo_type_556_item", #"ammo_type_762_item", #"ammo_type_12ga_item", #"ammo_type_9mm_item", #"ammo_type_45_item", #"ammo_type_338_item", #"ammo_type_50cal_item", #"ammo_type_rocket_item");
    level.var_69ee9282 = array(#"armor_item_large", #"armor_item_medium", #"armor_item_small");
    level.var_6cb314b1 = array(#"sniperscope_wz_item", #"acog_plus_wz_item", #"reddot_wz_item", #"acog_wz_item", #"dualoptic_wz_item", #"holo_wz_item", #"reflex_wz_item", #"tritium_wz_item", #"suppressor_wz_item", #"extbarrel_wz_item", #"advmag_wz_item", #"extmag_wz_item", #"fastmag_wz_item", #"foregrip_wz_item", #"laser_sight_wz_item", #"pistol_grip_wz_item", #"stock_wz_item");
    level.var_3fd5d8f0 = array(#"frag_grenade_wz_item", #"cluster_semtex_wz_item", #"acid_bomb_wz_item", #"molotov_wz_item", #"wraithfire_wz_item", #"hatchet_wz_item", #"tomahawk_t8_wz_item", #"seeker_mine_wz_item", #"dart_wz_item", #"hawk_wz_item", #"ultimate_turret_wz_item", #"swat_grenade_wz_item", #"concussion_wz_item", #"smoke_grenade_wz_item", #"smoke_grenade_wz_item_spring_holiday", #"emp_grenade_wz_item", #"spectre_grenade_wz_item", #"grapple_wz_item", #"unlimited_grapple_wz_item", #"barricade_wz_item", #"spiked_barrier_wz_item", #"trophy_system_wz_item", #"concertina_wire_wz_item", #"sensor_dart_wz_item", #"supply_pod_wz_item", #"trip_wire_wz_item", #"cymbal_monkey_wz_item", #"homunculus_wz_item", #"vision_pulse_wz_item", #"flare_gun_wz_item", #"flare_gun_veh_wz_item", #"wz_snowball", #"wz_waterballoon");
    level.var_9bc8c1bc = array(#"health_item_small", #"health_item_medium", #"health_item_large", #"health_item_squad");
    level.var_683c7e30 = array(#"perk_item_stimulant", #"perk_item_awareness", #"perk_item_deadsilence", #"perk_item_lightweight", #"perk_item_drifter", #"perk_item_engineer", #"perk_item_medic", #"perk_item_reinforced", #"perk_item_looter", #"perk_item_outlander", #"perk_item_paranoia", #"perk_item_ironlungs", #"perk_item_squadlink", #"perk_item_consumer", #"perk_item_brawler");
    level.var_e93e16b = array(#"annihilator_wz_item", #"warmachine_wz_item", #"flamethrower_wz_item", #"sniper_fastrechamber_t8_gold_item", #"sniper_powerbolt_t8_gold_item", #"sniper_powersemi_t8_gold_item", #"sniper_quickscope_t8_gold_item", #"tr_longburst_t8_gold_item", #"tr_midburst_t8_gold_item", #"tr_powersemi_t8_gold_item", #"ar_accurate_t8_gold_item", #"ar_damage_t8_gold_item", #"ar_fastfire_t8_gold_item", #"ar_modular_t8_gold_item", #"ar_stealth_t8_gold_item", #"lmg_heavy_t8_gold_item", #"lmg_spray_t8_gold_item", #"lmg_standard_t8_gold_item", #"smg_accurate_t8_gold_item", #"smg_capacity_t8_gold_item", #"smg_fastfire_t8_gold_item", #"smg_handling_t8_gold_item", #"smg_standard_t8_gold_item", #"shotgun_semiauto_t8_gold_item", #"shotgun_pump_t8_gold_item", #"pistol_burst_t8_gold_item", #"pistol_revolver_t8_gold_item", #"pistol_standard_t8_gold_item");
    level.var_b9917a92 = array(#"annihilator_wz_item", #"warmachine_wz_item", #"flamethrower_wz_item", #"ray_gun_t8_item", #"launcher_standard_t8_item", #"sniper_fastrechamber_t8_item", #"sniper_powerbolt_t8_item", #"sniper_powersemi_t8_item", #"sniper_quickscope_t8_item", #"tr_leveraction_t8_item", #"tr_longburst_t8_item", #"tr_midburst_t8_item", #"tr_powersemi_t8_item", #"ar_accurate_t8_item", #"ar_damage_t8_item", #"ar_fastfire_t8_item", #"ar_galil_t8_item", #"ar_mg1909_t8_item", #"ar_modular_t8_item", #"ar_stealth_t8_item", #"lmg_double_t8_item", #"lmg_heavy_t8_item", #"lmg_spray_t8_item", #"lmg_standard_t8_item", #"smg_accurate_t8_item", #"smg_capacity_t8_item", #"smg_drum_pistol_t8_item", #"smg_fastfire_t8_item", #"smg_handling_t8_item", #"smg_mp40_t8_item", #"smg_standard_t8_item", #"smg_thompson_t8_item", #"pistol_burst_t8_item", #"pistol_revolver_t8_item", #"pistol_standard_t8_item", #"pistol_topbreak_t8_item", #"shotgun_pump_t8_item", #"shotgun_semiauto_t8_item", #"shotgun_trenchgun_t8_item", #"melee_bowie_t8_item");
    level.weaponbasemeleeheld = getweapon(#"bare_hands");
    level.var_c49f422c = 125;
    level.var_927fd418 = 75;
    level.var_c102677c = 64;
    if (issplitscreen()) {
        level.var_c49f422c = int(level.var_c49f422c * 0.7);
        level.var_927fd418 = int(level.var_927fd418 * 0.7);
        level.var_c102677c = int(level.var_c102677c * 0.7);
    }
    callback::on_localclient_connect(&_on_localclient_connect);
    callback::on_localplayer_spawned(&_on_localplayer_spawned);
    callback::function_930e5d42(&function_192b39cd);
    clientfield::register("world", "item_world_seed", 1, 31, "int", &function_4e9220ab, 1, 0);
    clientfield::register("world", "item_world_disable", 1, 1, "int", &function_60386766, 0, 0);
    clientfield::register("clientuimodel", "hudItems.pickupHintGold", 1, 1, "int", undefined, 0, 0);
    clientfield::register("scriptmover", "item_world_attachments", 10000, 1, "int", undefined, 0, 0);
    clientfield::register("toplayer", "disableItemPickup", 18000, 1, "int", undefined, 0, 0);
    level.var_45ca79e5 = &function_9160538;
    level.var_a6c75fcb = &function_9e4552fe;
    level.var_d342a3fd = [];
    if (!isdefined(level.item_spawn_stashes)) {
        level.item_spawn_stashes = [];
    }
    if (!isdefined(level.item_spawn_drops)) {
        level.item_spawn_drops = [];
    }
    if (!isdefined(level.var_624588d5)) {
        level.var_624588d5 = [];
    }
    level thread namespace_65181344::init_spawn_system();
}

// Namespace item_world/item_world
// Params 2, eflags: 0x5 linked
// Checksum 0x68adff91, Offset: 0x10e8
// Size: 0xf8
function private function_3d7c12a6(localclientnum, poolsize) {
    modellist = [];
    for (i = 1; i <= poolsize; i++) {
        model = spawn(localclientnum, vectorscale((0, 0, -1), 10000), "script_model");
        model function_e082e650(localclientnum, undefined, #"tag_origin", 1);
        model hide();
        model notsolid();
        modellist[i * -1] = model;
    }
    return modellist;
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xd24d9da9, Offset: 0x11e8
// Size: 0x150
function private function_37175e73(var_fee74908) {
    level endon(#"game_ended");
    if (var_fee74908.size <= 0) {
        return;
    }
    level flagsys::wait_till_clear(#"hash_2d3b2a4d082ba5ee");
    if (var_fee74908[var_fee74908.size - 1] == 1) {
        level flagsys::wait_till(#"item_world_reset");
    }
    level flagsys::wait_till(#"item_world_initialized");
    for (wordindex = 0; wordindex < var_fee74908.size - 1; wordindex++) {
        for (bitindex = 0; bitindex < 32; bitindex++) {
            if (var_fee74908[wordindex] & 1 << bitindex) {
                itemindex = wordindex * 32 + bitindex;
                hide_item(-1, itemindex);
            }
        }
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xd613ac8c, Offset: 0x1340
// Size: 0x2ce
function private function_952d97dc(localclientnum) {
    data = spawnstruct();
    data.modellist = function_3d7c12a6(localclientnum, level.var_c49f422c);
    data.var_d58b471d = 0;
    data.var_79b15dd1 = 0;
    data.var_ffc1c0e1 = [];
    data.var_baf65690 = [];
    level.var_d342a3fd[localclientnum] = data;
    item_inventory::inventory_init(localclientnum);
    level.var_d9beffb9 = util::getnextobjid(localclientnum);
    objective_add(localclientnum, level.var_d9beffb9, "invisible", #"weapon_pickup");
    level.var_383edf80 = util::getnextobjid(localclientnum);
    objective_add(localclientnum, level.var_383edf80, "invisible", #"multi_item_pickup");
    level.showpickuphintmodel[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.showPickupHint");
    level.var_89f832ca[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.pickupHintText");
    level.var_62c91473[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.pickupHintTextOverride");
    level.var_ce95aace[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.weapon3dHintState");
    level.var_7e2f5883[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.weapon3dForcedHintItem");
    level.var_19cf0be9[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.pickupHintImage");
}

// Namespace item_world/item_world
// Params 0, eflags: 0x4
// Checksum 0x7d39b985, Offset: 0x1618
// Size: 0x174
function private function_cdd9b388() {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        self endon(#"shutdown");
        while (1) {
            waitframe(1);
            if (getdvarint(#"hash_3fdd3b60f349d462", 0)) {
                if (isdefined(self)) {
                    origin = self.origin;
                    var_f4b807cb = function_2e3efdda(origin, undefined, 128, 2000);
                    foreach (item in var_f4b807cb) {
                        print3d(item.origin, "<unknown string>" + item.networkid + "<unknown string>" + item.var_a6762160.name, (0, 0, 1), 1, 0.4);
                    }
                }
            }
        }
    #/
}

// Namespace item_world/item_world
// Params 2, eflags: 0x5 linked
// Checksum 0x443971e0, Offset: 0x1798
// Size: 0x6c
function private function_3ee12d25(localclientnum, model) {
    if (!isdefined(model)) {
        return;
    }
    if (isdefined(model.var_2584a90d)) {
        model function_f6e99a8d(model.var_2584a90d);
    }
    model.var_2584a90d = undefined;
    function_2990e5f(localclientnum, model);
}

// Namespace item_world/item_world
// Params 2, eflags: 0x1 linked
// Checksum 0xeda7f9f6, Offset: 0x1810
// Size: 0x56
function function_2990e5f(localclientnum, model) {
    if (!isdefined(model)) {
        return;
    }
    if (isdefined(model.modelfx)) {
        stopfx(localclientnum, model.modelfx);
        model.modelfx = undefined;
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xc4686dd1, Offset: 0x1870
// Size: 0x28c
function private function_48b8fc19(localclientnum) {
    var_7d8899cd = function_d634ed59();
    for (index = 0; index < var_7d8899cd; index++) {
        point = function_b1702735(index);
        if (!isdefined(point) || !isdefined(point.var_a6762160)) {
            break;
        }
        xmodel = function_78a9fd5f(point);
        if (isdefined(xmodel)) {
            forcestreamxmodel(xmodel, 1, 1);
        }
        if ((index + 1) % 50 == 0) {
            waitframe(1);
        }
    }
    player = function_5c10bd79(localclientnum);
    while (!isdefined(player) || !isplayer(player) || !isdefined(player.type) || player.type != #"player" || player ishidden() || player isinfreefall() || player function_9a0edd92()) {
        waitframe(1);
        player = function_5c10bd79(localclientnum);
    }
    wait(15);
    for (index = 0; index < var_7d8899cd; index++) {
        point = function_b1702735(index);
        if (!isdefined(point) || !isdefined(point.var_a6762160)) {
            break;
        }
        xmodel = function_78a9fd5f(point);
        if (isdefined(xmodel)) {
            stopforcestreamingxmodel(xmodel);
        }
        if ((index + 1) % 50 == 0) {
            waitframe(1);
        }
    }
}

// Namespace item_world/item_world
// Params 3, eflags: 0x5 linked
// Checksum 0xc6986d24, Offset: 0x1b08
// Size: 0x15c
function private function_c17fe536(localclientnum, clientdata, networkid) {
    model = function_839d4c20(localclientnum, clientdata, networkid);
    if (!isdefined(model) && isdefined(networkid) && item_world_util::function_2c7fc531(networkid)) {
        model = function_b1702735(networkid);
        if (model.hidetime !== -1) {
            model = undefined;
        }
    }
    if (!isdefined(model)) {
        return;
    }
    var_1ba7b9c8 = arraysortclosest(level.item_spawn_stashes, model.origin, 1, 0, 12);
    if (var_1ba7b9c8.size > 0) {
        return var_1ba7b9c8[0];
    }
    var_6594679a = arraysortclosest(level.var_624588d5, model.origin, 1, 0, 12);
    if (var_6594679a.size > 0) {
        return var_6594679a[0];
    }
}

// Namespace item_world/item_world
// Params 3, eflags: 0x5 linked
// Checksum 0xdcee7efe, Offset: 0x1c70
// Size: 0x8c
function private function_839d4c20(localclientnum, clientdata, networkid) {
    if (!isdefined(networkid)) {
        return;
    }
    if (isdefined(clientdata.modellist[networkid])) {
        model = clientdata.modellist[networkid];
    } else if (isdefined(level.item_spawn_drops[networkid])) {
        model = level.item_spawn_drops[networkid];
    }
    return model;
}

// Namespace item_world/item_world
// Params 3, eflags: 0x5 linked
// Checksum 0x216ca5c, Offset: 0x1d08
// Size: 0x9e
function private function_61f5d33a(localclientnum, clientdata, networkid) {
    model = function_839d4c20(localclientnum, clientdata, networkid);
    if (!isdefined(model) && item_world_util::function_2c7fc531(networkid)) {
        model = function_b1702735(networkid);
        if (model.hidetime !== -1) {
            model = undefined;
        }
    }
    return model;
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0x60104a93, Offset: 0x1db0
// Size: 0x6e
function private function_237888bb(localclientnum) {
    /#
        if (getdvarint(#"scr_looter", 0)) {
            return 1;
        }
    #/
    if (self hasperk(localclientnum, #"specialty_looter")) {
        return 1;
    }
    return 0;
}

// Namespace item_world/item_world
// Params 5, eflags: 0x5 linked
// Checksum 0x2d6ee921, Offset: 0x1e28
// Size: 0x746
function private function_78bf134c(localclientnum, clientdata, networkid, model, var_a6762160) {
    if (!isdefined(model)) {
        return;
    }
    player = function_5c10bd79(localclientnum);
    var_8ad7f92f = #"hash_29dbf9ddda64fc5a";
    if (isdefined(var_a6762160)) {
        switch (var_a6762160.rarity) {
        case #"none":
            jumpiffalse(isdefined(var_a6762160.unlockableitemref) && var_a6762160.itemtype != #"weapon") LOC_000000f8;
            var_8ad7f92f = #"hash_6f1ab68ac78ac2ea";
            break;
        case #"common":
        LOC_000000f8:
            var_8ad7f92f = #"hash_29dbf9ddda64fc5a";
            break;
        case #"rare":
            var_8ad7f92f = #"hash_6e89d52c60dd7fc3";
            break;
        case #"epic":
            var_8ad7f92f = #"hash_4cf701d23a7301d2";
            break;
        case #"legendary":
            var_8ad7f92f = #"hash_4368c406e6a21060";
            break;
        }
        if (var_a6762160.itemtype == #"resource") {
            var_8ad7f92f = #"hash_2f523d47697a9ce3";
        } else if (var_a6762160.itemtype == #"cash") {
            var_8ad7f92f = #"hash_5fbd33a25f74ddf0";
        }
        if (isdefined(var_a6762160.var_47f145b4) && var_a6762160.var_47f145b4) {
            var_8ad7f92f = #"hash_52f7937d76fafca0";
        }
    } else {
        if (model.targetname === #"wz_stash_blackjack") {
            var_8ad7f92f = #"hash_71bb09e5b3013952";
        }
        if (isdefined(model.var_bad13452)) {
            if (model.var_bad13452 == 2) {
                function_3ee12d25(localclientnum, model);
                return;
            }
        } else if (!isdefined(model.type)) {
            state = function_ffdbe8c2(model);
            if (state == 2) {
                function_3ee12d25(localclientnum, model);
                return;
            }
        }
    }
    if (isdefined(player) && isdefined(var_8ad7f92f) && player function_237888bb(localclientnum)) {
        var_8ad7f92f = var_8ad7f92f + "_looter";
    }
    if (isdefined(networkid) && isdefined(clientdata) && isdefined(clientdata.var_ffc1c0e1)) {
        if (isdefined(clientdata.var_ffc1c0e1[networkid]) && clientdata.var_ffc1c0e1[networkid].servertime > getservertime(localclientnum, 1)) {
            var_8ad7f92f = #"hash_3d6eb4b9bbc74fbd";
            if (isdefined(var_a6762160)) {
                if (var_a6762160.rarity == #"epic") {
                    var_8ad7f92f = #"hash_269ac932c6e6b81f";
                } else if (isdefined(var_a6762160.unlockableitemref)) {
                    var_8ad7f92f = #"hash_12076df5fcd3d751";
                }
            }
        }
    }
    if (player clientfield::get_to_player("disableItemPickup")) {
        var_8ad7f92f = undefined;
    }
    if (isdefined(model.var_2584a90d) && model.var_2584a90d !== var_8ad7f92f) {
        model function_f6e99a8d(model.var_2584a90d);
    }
    if (isdefined(var_8ad7f92f)) {
        if (!model function_d2503806(var_8ad7f92f)) {
            model playrenderoverridebundle(var_8ad7f92f);
        }
    }
    model.var_2584a90d = var_8ad7f92f;
    if (isdefined(var_a6762160) && isdefined(var_a6762160.worldfx) && !isdefined(model.modelfx) && !model ishidden()) {
        originoffset = (isdefined(var_a6762160.var_5dc4470b) ? var_a6762160.var_5dc4470b : 0, isdefined(var_a6762160.var_54a3b4ca) ? var_a6762160.var_54a3b4ca : 0, isdefined(var_a6762160.var_3e688854) ? var_a6762160.var_3e688854 : 0);
        originoffset = rotatepoint(originoffset * -1, model.angles);
        originoffset = originoffset + rotatepoint((isdefined(var_a6762160.var_22d128f2) ? var_a6762160.var_22d128f2 : 0, isdefined(var_a6762160.var_48907470) ? var_a6762160.var_48907470 : 0, isdefined(var_a6762160.var_702943a1) ? var_a6762160.var_702943a1 : 0), model.angles);
        angles = combineangles(model.angles, (isdefined(var_a6762160.var_15b88fde) ? var_a6762160.var_15b88fde : 0, isdefined(var_a6762160.var_8c9a7dc8) ? var_a6762160.var_8c9a7dc8 : 0, isdefined(var_a6762160.var_7a51d937) ? var_a6762160.var_7a51d937 : 0));
        forward = anglestoforward(angles);
        up = anglestoup(angles);
        model.modelfx = playfx(localclientnum, var_a6762160.worldfx, model.origin + originoffset, forward, up);
    }
}

// Namespace item_world/item_world
// Params 4, eflags: 0x5 linked
// Checksum 0x45a48af2, Offset: 0x2578
// Size: 0xb2
function private function_3bd99d2f(localclientnum, clientdata, vehicle, clear = 0) {
    if (!isdefined(vehicle)) {
        return;
    }
    if (clear) {
        function_3ee12d25(localclientnum, vehicle);
        return;
    }
    var_8ad7f92f = #"hash_3d6eb4b9bbc74fbd";
    if (!vehicle function_d2503806(var_8ad7f92f)) {
        vehicle playrenderoverridebundle(var_8ad7f92f);
    }
    vehicle.var_2584a90d = var_8ad7f92f;
}

// Namespace item_world/item_world
// Params 2, eflags: 0x5 linked
// Checksum 0x2fe1ada2, Offset: 0x2638
// Size: 0x1036
function private _draw(localclientnum, draworigin) {
    self endon(#"shutdown");
    clientdata = function_a7e98a1a(localclientnum);
    if (!isdefined(clientdata)) {
        return;
    }
    var_5f6ea063 = isdefined(self.var_5f6ea063) && self.var_5f6ea063;
    self.var_5f6ea063 = undefined;
    self.var_506495f9 = undefined;
    servertime = getservertime(localclientnum, 0);
    clientdata.var_79b15dd1 = servertime;
    clientdata.drawing = 1;
    var_6369afab = function_963d3f6e();
    if (self isinfreefall() || self function_9a0edd92()) {
        var_6369afab = 4050;
    }
    maxdist = getdvarfloat(#"hash_2cd1a08f81049564", var_6369afab);
    var_f4b807cb = function_abaeb170(draworigin, undefined, level.var_c49f422c, maxdist, -1, 1, servertime);
    var_6665e24 = arraysortclosest(level.item_spawn_drops, draworigin, level.var_c49f422c, 0, maxdist);
    var_13e4be37 = [];
    foreach (dynamicitem in var_6665e24) {
        if (isdefined(dynamicitem) && dynamicitem.hidetime !== -1) {
            var_13e4be37[var_13e4be37.size] = dynamicitem;
        }
    }
    if (var_13e4be37.size > 0) {
        var_f4b807cb = arraycombine(var_f4b807cb, var_13e4be37, 1, 0);
        var_f4b807cb = arraysortclosest(var_f4b807cb, draworigin, level.var_c49f422c, 0, maxdist);
    }
    waitframe(1);
    clientdata.var_89e328b4 = clientdata.modellist;
    clientdata.modellist = [];
    var_c29769e0 = [];
    index = 0;
    /#
        assert(clientdata.var_89e328b4.size == level.var_c49f422c);
    #/
    for (index = 0; index < var_f4b807cb.size; index++) {
        item = var_f4b807cb[index];
        if (!isdefined(item)) {
            continue;
        }
        id = item.networkid;
        if (isdefined(clientdata.var_89e328b4[id])) {
            model = clientdata.var_89e328b4[id];
            clientdata.modellist[id] = model;
            clientdata.var_89e328b4[id] = undefined;
        } else {
            var_c29769e0[var_c29769e0.size] = item;
        }
        if ((index + 1) % 50 == 0) {
            waitframe(1);
        }
    }
    waitframe(1);
    arrayremovevalue(clientdata.var_89e328b4, undefined, 0);
    waitframe(1);
    /#
        assert(clientdata.var_89e328b4.size + clientdata.modellist.size == level.var_c49f422c);
    #/
    /#
        assert(clientdata.var_89e328b4.size >= var_c29769e0.size);
    #/
    for (index = 0; index < var_c29769e0.size && index < clientdata.var_89e328b4.size; index++) {
        item = var_c29769e0[index];
        model = clientdata.var_89e328b4[index];
        model unlink();
        if (!isdefined(item)) {
            model hide();
            function_2990e5f(localclientnum, model);
            function_3ee12d25(localclientnum, model);
            clientdata.modellist[index * -1 - 1] = model;
        } else {
            model.origin = item.origin;
            model.angles = item.angles;
            model function_e082e650(localclientnum, item, function_78a9fd5f(item), item.var_a6762160.modelscale);
            shouldshow = item_world_util::function_da09de95(item.networkid) && item_world_util::can_pick_up(item, servertime);
            shouldshow = shouldshow | (item.networkid < function_8322cf16() && item_world_util::can_pick_up(function_b1702735(item.networkid), servertime));
            shouldshow = shouldshow & !(isdefined(item.type) && item.type === #"missile");
            if (shouldshow) {
                model show();
            } else {
                model hide();
                function_2990e5f(localclientnum, model);
            }
            originoffset = (isdefined(item.var_a6762160.var_5dc4470b) ? item.var_a6762160.var_5dc4470b : 0, isdefined(item.var_a6762160.var_54a3b4ca) ? item.var_a6762160.var_54a3b4ca : 0, isdefined(item.var_a6762160.var_3e688854) ? item.var_a6762160.var_3e688854 : 0);
            model.origin = model.origin + rotatepoint(originoffset, model.angles);
            if (item_world_util::function_da09de95(item.networkid)) {
                model linkto(item);
            }
            clientdata.modellist[item.networkid] = model;
        }
        if ((index + 1) % 50 == 0) {
            waitframe(1);
        }
    }
    waitframe(1);
    /#
        assert(clientdata.var_89e328b4.size - index + clientdata.modellist.size == level.var_c49f422c);
    #/
    while (index < clientdata.var_89e328b4.size) {
        model = clientdata.var_89e328b4[index];
        model hide();
        function_2990e5f(localclientnum, model);
        function_3ee12d25(localclientnum, model);
        clientdata.modellist[index * -1 - 1] = model;
        if ((index + 1) % 50 == 0) {
            waitframe(1);
        }
        index++;
    }
    clientdata.var_89e328b4 = undefined;
    waitframe(1);
    /#
        assert(clientdata.modellist.size == level.var_c49f422c);
    #/
    if (getdvarint(#"hash_220f360a2cc8359a", 1)) {
        var_b8db3f93 = arraysortclosest(level.item_spawn_drops, draworigin, undefined, maxdist);
        foreach (item in var_b8db3f93) {
            function_3ee12d25(localclientnum, item);
        }
        waitframe(1);
        var_f945c1d4 = arraysortclosest(level.item_spawn_stashes, draworigin, undefined, maxdist);
        foreach (supplystash in var_f945c1d4) {
            function_3ee12d25(localclientnum, supplystash);
        }
        waitframe(1);
        var_8f6dbb2 = arraysortclosest(level.var_624588d5, draworigin, undefined, maxdist);
        foreach (deathstash in var_8f6dbb2) {
            function_3ee12d25(localclientnum, deathstash);
        }
        waitframe(1);
        var_6665e24 = arraysortclosest(level.item_spawn_drops, draworigin, level.var_927fd418, 0, maxdist);
        waitframe(1);
        var_ac2b6007 = arraysortclosest(level.item_spawn_stashes, draworigin, level.var_927fd418, 0, maxdist);
        waitframe(1);
        var_c36bd68a = arraysortclosest(level.var_624588d5, draworigin, level.var_927fd418, 0, maxdist);
        waitframe(1);
        var_f4b807cb = arraycombine(var_f4b807cb, var_6665e24, 1, 0);
        waitframe(1);
        var_f4b807cb = arraycombine(var_f4b807cb, var_ac2b6007, 1, 0);
        waitframe(1);
        var_f4b807cb = arraycombine(var_f4b807cb, var_c36bd68a, 1, 0);
        waitframe(1);
        var_f4b807cb = arraysortclosest(var_f4b807cb, draworigin, level.var_c49f422c + var_6665e24.size, 0, maxdist);
        waitframe(1);
        if (isdefined(self) && var_5f6ea063) {
            for (index = 0; index < var_f4b807cb.size; index++) {
                item = var_f4b807cb[index];
                if (!isdefined(item)) {
                    continue;
                }
                model = isdefined(item.networkid) ? clientdata.modellist[item.networkid] : item;
                function_3ee12d25(localclientnum, model);
                if ((index + 1) % 50 == 0) {
                    waitframe(1);
                }
            }
        }
        waitframe(1);
        for (index = int(min(level.var_927fd418, var_f4b807cb.size)); index < level.var_c49f422c && index < var_f4b807cb.size; index++) {
            item = var_f4b807cb[index];
            if (!isdefined(item)) {
                continue;
            }
            model = isdefined(item.networkid) ? clientdata.modellist[item.networkid] : item;
            function_3ee12d25(localclientnum, model);
            if ((index + 1) % 50 == 0) {
                waitframe(1);
            }
        }
        waitframe(1);
        for (index = 0; index < level.var_927fd418 && index < var_f4b807cb.size; index++) {
            item = var_f4b807cb[index];
            if (!isdefined(item)) {
                continue;
            }
            model = isdefined(item.networkid) ? clientdata.modellist[item.networkid] : item;
            if (isdefined(item.type) && item.type === #"missile") {
                model = item;
            }
            function_78bf134c(localclientnum, clientdata, item.networkid, model, item.var_a6762160);
            if ((index + 1) % 50 == 0) {
                waitframe(1);
            }
        }
    }
    clientdata.var_844c8166 = draworigin;
    clientdata.var_f4b807cb = var_f4b807cb;
    clientdata.var_d58b471d = var_f4b807cb.size;
    clientdata.drawing = undefined;
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xa8c4f363, Offset: 0x3678
// Size: 0x2fc
function private function_78a9fd5f(point) {
    if (!isdefined(level.var_8c615e33)) {
        level.var_8c615e33 = [];
    }
    if (!isstruct(point) && isdefined(point.type == #"scriptmover") && isdefined(point.var_a6762160.var_77d2cbb5) && point getentitynumber() < 1024) {
        if (isdefined(point.var_a6762160.weapon) && point.var_a6762160.weapon.name == #"waterballoon") {
            var_af7d7388 = array(#"hash_7306b72d120049f8", #"hash_27ae7cb403d5365b", #"hash_6add258ae958d31c", #"hash_6eb8f7ceb4627d9f", #"hash_228bf15c70137b61", #"hash_10c0ee53a36783e9");
            return var_af7d7388[randomintrange(0, var_af7d7388.size)];
        }
        return point.var_a6762160.var_77d2cbb5;
    }
    if (!isdefined(level.var_8c615e33[point.var_a6762160.name])) {
        if (isdefined(point.var_a6762160.model) && point.var_a6762160.model != "") {
            level.var_8c615e33[point.var_a6762160.name] = point.var_a6762160.model;
        } else if (isdefined(point.var_a6762160.weapon) && point.var_a6762160.weapon !== level.weaponnone) {
            level.var_8c615e33[point.var_a6762160.name] = point.var_a6762160.weapon.worldmodel;
        } else {
            level.var_8c615e33[point.var_a6762160.name] = "tag_origin";
        }
    }
    return level.var_8c615e33[point.var_a6762160.name];
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xc6fbbec3, Offset: 0x3980
// Size: 0x22
function private function_8cf40a8c(localclientnum) {
    return getcamposbylocalclientnum(localclientnum);
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0x5dd8caa6, Offset: 0x39b0
// Size: 0x24
function private function_9e4552fe(var_fee74908) {
    level thread function_37175e73(var_fee74908);
}

// Namespace item_world/item_world
// Params 5, eflags: 0x5 linked
// Checksum 0xc103491e, Offset: 0x39e0
// Size: 0x8e2
function private function_9160538(localclientnum, eventtype, eventdata, var_c5a66313, var_567004a8) {
    waitframe(1);
    reset = isdefined(level flagsys::get(#"item_world_reset")) && level flagsys::get(#"item_world_reset");
    if (reset && eventtype == 1) {
        return;
    }
    if (issplitscreen() && eventtype == 1) {
        if (!level flagsys::get(#"item_world_initialized")) {
            return;
        }
    }
    if (issplitscreen() && !issplitscreenhost(localclientnum) && eventtype == 2) {
        if (!level flagsys::get(#"item_world_initialized")) {
            return;
        }
    }
    level flagsys::wait_till(#"item_world_initialized");
    if (reset != (isdefined(level flagsys::get(#"item_world_reset")) && level flagsys::get(#"item_world_reset"))) {
        return;
    }
    if (!isdefined(level.var_d342a3fd[localclientnum])) {
        return;
    }
    player = function_27673a7(localclientnum);
    isalive = isalive(player);
    switch (eventtype) {
    case 1:
        if (level flagsys::get(#"item_world_reset")) {
            return;
        }
        networkid = eventdata;
        hide_item(localclientnum, networkid);
        function_b78a9820(localclientnum);
        item = function_b1702735(networkid);
        item_inventory::function_31868137(localclientnum, item);
        play_pickup_fx(localclientnum, item);
        break;
    case 2:
        function_4de3ca98();
        networkid = eventdata;
        hide_item(localclientnum, networkid);
        function_b78a9820(localclientnum);
        item = function_b1702735(networkid);
        item_inventory::function_31868137(localclientnum, item);
        play_pickup_fx(localclientnum, item);
        break;
    case 3:
        networkid = eventdata;
        resetitem = isdefined(var_c5a66313) && var_c5a66313;
        showitem = isdefined(var_567004a8) && var_567004a8;
        if (resetitem) {
            function_4de3ca98();
            waittillframeend();
        } else if (level flagsys::get(#"item_world_reset")) {
            return;
        }
        show_item(localclientnum, networkid, showitem);
        function_b78a9820(localclientnum);
        clientdata = function_a7e98a1a(localclientnum);
        model = function_61f5d33a(localclientnum, clientdata, networkid);
        if (isdefined(model)) {
            function_a4886b1e(localclientnum, networkid, model);
        }
        play_spawn_fx(localclientnum, networkid);
        break;
    case 4:
        itemid = eventdata;
        count = var_c5a66313;
        slotid = var_567004a8 ? var_567004a8 - 1 : undefined;
        if (!isalive) {
            return;
        }
        item_inventory::function_9c4460e0(localclientnum, itemid, count, slotid);
        function_b78a9820(localclientnum);
        break;
    case 11:
        networkid = eventdata;
        if (!isalive) {
            return;
        }
        item_inventory::consume_item(localclientnum, networkid);
        break;
    case 15:
        networkid = eventdata;
        if (!isalive) {
            return;
        }
        item_inventory::function_52e537be(localclientnum, networkid);
        break;
    case 5:
        networkid = eventdata;
        if (!isalive) {
            return;
        }
        item_inventory::function_c6ff0aa2(localclientnum, networkid);
        function_b78a9820(localclientnum);
        break;
    case 6:
        networkid = eventdata;
        if (!isalive) {
            return;
        }
        item_inventory::function_3bd1836f(localclientnum, networkid);
        function_b78a9820(localclientnum);
        break;
    case 12:
        var_c9293a27 = eventdata;
        var_8f194e5a = var_c5a66313;
        if (!isalive) {
            return;
        }
        item_inventory::function_26c87da8(localclientnum, var_c9293a27, var_8f194e5a);
        break;
    case 7:
        networkid = eventdata;
        if (!isalive) {
            return;
        }
        item_inventory::function_fa372100(localclientnum, networkid);
        break;
    case 8:
        networkid = eventdata;
        function_b78a9820(localclientnum);
        break;
    case 9:
        networkid = eventdata;
        count = var_c5a66313;
        if (!isalive) {
            return;
        }
        item_inventory::update_inventory_item(localclientnum, networkid, count);
        function_b78a9820(localclientnum);
        break;
    case 10:
        item_inventory::inventory_init(localclientnum);
        break;
    case 13:
        networkid = eventdata;
        var_2ccf7a1c = var_c5a66313;
        function_347698a5(localclientnum, networkid, var_2ccf7a1c);
        break;
    case 14:
        vehicleentnum = eventdata;
        var_2ccf7a1c = var_c5a66313;
        function_d2f95c1a(localclientnum, vehicleentnum, var_2ccf7a1c);
        break;
    default:
        /#
            assertmsg("<unknown string>" + eventtype);
        #/
        break;
    }
}

// Namespace item_world/item_world
// Params 7, eflags: 0x5 linked
// Checksum 0x15556318, Offset: 0x42d0
// Size: 0xd8
function private function_60386766(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level flagsys::wait_till(#"item_world_initialized");
    foreach (supply_stash in level.item_spawn_stashes) {
        setdynentenabled(supply_stash, !newval);
    }
}

// Namespace item_world/item_world
// Params 7, eflags: 0x5 linked
// Checksum 0x32dc8cc9, Offset: 0x43b0
// Size: 0x54c
function private function_4e9220ab(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        waitframe(1);
        if (isdemoplaying()) {
            function_8722e0f2(1);
        }
        if (!issplitscreenhost(localclientnum)) {
            function_1b11e73c();
        }
        level flagsys::wait_till_clear(#"hash_2d3b2a4d082ba5ee");
        level flagsys::set(#"hash_2d3b2a4d082ba5ee");
        if (level flagsys::get(#"item_world_reset")) {
            return;
        }
        seed = newval >> 1;
        reset = newval & 1;
        level.item_spawn_seed = seed;
        if (isdemoplaying() && !reset) {
            level flagsys::clear(#"hash_2d3b2a4d082ba5ee");
            level flagsys::clear(#"item_world_initialized");
            return;
        }
        if (reset) {
            level flagsys::set(#"item_world_reset");
        }
        setdvar(#"hash_21e070fbb56cf0f", 0);
        level flagsys::clear(#"item_world_initialized");
        level item_inventory::inventory_init(localclientnum);
        clientdata = function_a7e98a1a(localclientnum);
        if (isdefined(clientdata) && isdefined(clientdata.modellist)) {
            models = [];
            foreach (model in clientdata.modellist) {
                model notsolid();
                model hide();
                function_2990e5f(localclientnum, model);
                function_3ee12d25(localclientnum, model);
                models[models.size * -1 - 1] = model;
            }
            clientdata.modellist = models;
        }
        foreach (networkid, serverinfo in clientdata.var_ffc1c0e1) {
            clientdata.var_ffc1c0e1[networkid].servertime = 0;
        }
        foreach (vehicleentnum, serverinfo in clientdata.var_baf65690) {
            clientdata.var_baf65690[vehicleentnum].servertime = 0;
        }
        if (issplitscreenhost(localclientnum)) {
            level namespace_f0884ae5::setup(localclientnum, seed, reset);
        }
        if (reset) {
            level thread function_48b8fc19(localclientnum);
        }
        player = function_5c10bd79(localclientnum);
        player.var_5f6ea063 = 1;
        level flagsys::set(#"item_world_initialized");
        level flagsys::clear(#"hash_2d3b2a4d082ba5ee");
        if (isdemoplaying()) {
            function_8722e0f2(0);
        }
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xaae9088c, Offset: 0x4908
// Size: 0x3c
function private function_e2e7ee77(localclientnum) {
    self function_198ac8a(localclientnum);
    self function_e1f6ddbf(localclientnum);
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xd5ec8a9d, Offset: 0x4950
// Size: 0x5c
function private function_198ac8a(localclientnum) {
    setting = function_ab88dbd2(localclientnum, #"warzoneinstantpickups");
    if (isdefined(setting)) {
        function_97fedb0d(localclientnum, 1, setting);
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0x21c98a7c, Offset: 0x49b8
// Size: 0x5c
function private function_e1f6ddbf(localclientnum) {
    setting = function_ab88dbd2(localclientnum, #"warzoneprioritypickups");
    if (isdefined(setting)) {
        function_97fedb0d(localclientnum, 2, setting);
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xcf785748, Offset: 0x4a20
// Size: 0x3c
function private _on_localclient_connect(localclientnum) {
    function_952d97dc(localclientnum);
    self function_e2e7ee77(localclientnum);
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xdc939225, Offset: 0x4a68
// Size: 0x8c
function private _on_localplayer_spawned(localclientnum) {
    /#
        self thread function_cdd9b388();
    #/
    if (self function_21c0fa55()) {
        self function_e2e7ee77(localclientnum);
        self thread _update_loop(localclientnum);
        level callback::function_6231c19(&item_inventory::function_6231c19);
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0x753833ed, Offset: 0x4b00
// Size: 0x92
function private function_192b39cd(localclientnum) {
    if (self function_da43934d()) {
        var_db6db8ba = self hasperk(localclientnum, #"specialty_looter");
        var_de744098 = self.var_db6db8ba !== var_db6db8ba;
        if (var_de744098) {
            self.var_5f6ea063 = 1;
        }
        self.var_db6db8ba = var_db6db8ba;
    }
}

// Namespace item_world/item_world
// Params 2, eflags: 0x5 linked
// Checksum 0xb2a461cf, Offset: 0x4ba0
// Size: 0x248
function private _set_weapon(localclientnum, item) {
    if (isdefined(item) && isdefined(item.var_a6762160.weapon) && !isdefined(item.var_a6762160.model) && isdefined(item.var_a6762160.weapon.worldmodel)) {
        weapon = namespace_a0d533d1::function_2b83d3ff(item);
        camoweapon = undefined;
        weaponoptions = undefined;
        if (isdefined(getgametypesetting(#"hash_54fe37a58b87c7a0")) ? getgametypesetting(#"hash_54fe37a58b87c7a0") : 0) {
            if (isdefined(item.weapon)) {
                weapon = item.weapon;
            }
            camoweapon = activecamo::function_385ef18d(weapon);
            weaponoptions = self getbuildkitweaponoptions(localclientnum, camoweapon);
        }
        if (isdefined(weaponoptions)) {
            self useweaponmodel(level.weaponnone, "tag_origin");
            self useweaponmodel(weapon, undefined, weaponoptions);
        } else {
            self useweaponmodel(weapon);
        }
        self useweaponhidetags(weapon);
        if (isdefined(weaponoptions)) {
            self activecamo::function_6efb762c(localclientnum, camoweapon, weaponoptions);
        }
        return 1;
    } else {
        self detachall();
        self useweaponmodel(level.weaponnone, "tag_origin");
        return 0;
    }
}

// Namespace item_world/item_world
// Params 4, eflags: 0x5 linked
// Checksum 0x3ac10451, Offset: 0x4df0
// Size: 0xfc
function private function_e082e650(localclientnum, item, newmodel, scale) {
    if (newmodel === self.model) {
        if (!isdefined(item) && self.weapon == level.weaponnone) {
            return;
        }
    }
    function_2990e5f(localclientnum, item);
    function_3ee12d25(localclientnum, self);
    if (isdefined(newmodel)) {
        if (!self _set_weapon(localclientnum, item) || isdefined(item.var_a6762160.model)) {
            self setmodel(newmodel);
        }
        self setscale(scale);
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xc89d2c6b, Offset: 0x4ef8
// Size: 0x15a
function private function_96fa1c6d(localclientnum) {
    clientdata = function_a7e98a1a(localclientnum);
    if (isdefined(clientdata.drawing) && clientdata.drawing) {
        return 0;
    }
    if (!isdefined(clientdata.var_844c8166)) {
        return 1;
    }
    if (function_1cbf351b(localclientnum)) {
        return 1;
    }
    servertime = getservertime(localclientnum);
    if (servertime < clientdata.var_79b15dd1) {
        return 1;
    }
    var_605384fe = function_8cf40a8c(localclientnum);
    var_48f611aa = distancesquared(clientdata.var_844c8166, var_605384fe);
    if (var_48f611aa >= 72 * 72) {
        return 1;
    }
    if (isdefined(self.var_5f6ea063) && self.var_5f6ea063 || isdefined(self.var_506495f9) && self.var_506495f9) {
        return 1;
    }
    return 0;
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0x847e48ad, Offset: 0x5060
// Size: 0x58
function private function_c7e5c26(localclientnum) {
    clientdata = function_a7e98a1a(localclientnum);
    if (isdefined(clientdata.var_a4ad122e) && clientdata.var_a4ad122e) {
        return 0;
    }
    return 1;
}

// Namespace item_world/item_world
// Params 3, eflags: 0x5 linked
// Checksum 0x4a27b10e, Offset: 0x50c0
// Size: 0x76
function private function_34418003(localclientnum, eyepos, angles) {
    clientdata = function_a7e98a1a(localclientnum);
    if (isdefined(clientdata.var_ff9e7e43) && clientdata.var_ff9e7e43) {
        clientdata.var_ff9e7e43 = 0;
        return 1;
    }
    return 0;
}

// Namespace item_world/item_world
// Params 3, eflags: 0x5 linked
// Checksum 0xbbb10e1f, Offset: 0x5140
// Size: 0x2ba
function private function_5cbe24ea(&dest, &source, &order) {
    items = [];
    foreach (item in source) {
        if (!isdefined(item)) {
            continue;
        }
        itemname = item.var_a6762160.name;
        if (!isdefined(items[itemname])) {
            items[itemname] = [];
        }
        size = items[itemname].size;
        items[itemname][size] = item;
    }
    foreach (itemname in order) {
        if (isdefined(items[itemname])) {
            foreach (item in items[itemname]) {
                dest[dest.size] = item;
            }
        }
        items[itemname] = undefined;
    }
    foreach (itemarray in items) {
        if (!isdefined(itemarray)) {
            continue;
        }
        foreach (item in itemarray) {
            if (!isdefined(item)) {
                continue;
            }
            dest[dest.size] = item;
        }
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0x47abbede, Offset: 0x5408
// Size: 0xa70
function private function_43d3ebe1(&items) {
    /#
        assert(isplayer(self));
    #/
    if (items.size <= 1) {
        return items;
    }
    arrayremovevalue(items, undefined, 0);
    sorted = [];
    itemtypes = [];
    stash = item_world_util::function_31f5aa51(items[0]);
    var_e30063d2 = isdefined(stash) && isdefined(stash.lootlocker) && stash.lootlocker;
    if (var_e30063d2) {
        lootweapons = self namespace_a0d533d1::get_loot_weapons();
        if (lootweapons.size > 0) {
            var_41f13734 = lootweapons[0];
            for (index = 0; index < items.size; index++) {
                item = items[index];
                if (!isdefined(items[index].var_a6762160) || !isdefined(items[index].var_a6762160.weapon)) {
                    continue;
                }
                if (items[index].var_a6762160.weapon.name == var_41f13734) {
                    var_dd3170c7 = sorted.size;
                    sorted[var_dd3170c7] = items[index];
                    sorted[var_dd3170c7].var_41f13734 = 1;
                    arrayremoveindex(items, index, 0);
                    break;
                }
            }
        }
    }
    for (index = 0; index < items.size; index++) {
        if (!isdefined(items[index])) {
            continue;
        }
        var_a6762160 = items[index].var_a6762160;
        if (!isdefined(itemtypes[var_a6762160.itemtype])) {
            itemtypes[var_a6762160.itemtype] = [];
        }
        size = itemtypes[var_a6762160.itemtype].size;
        itemtypes[var_a6762160.itemtype][size] = items[index];
    }
    waitframe(1);
    if (isdefined(itemtypes[#"quest"])) {
        foreach (entry in itemtypes[#"quest"]) {
            sorted[sorted.size] = entry;
        }
    }
    if (isdefined(itemtypes[#"cash"])) {
        foreach (entry in itemtypes[#"cash"]) {
            sorted[sorted.size] = entry;
        }
    }
    if (isdefined(itemtypes[#"armor"])) {
        function_5cbe24ea(sorted, itemtypes[#"armor"], level.var_69ee9282);
        waitframe(1);
    }
    if (isdefined(itemtypes[#"armor_shard"])) {
        foreach (entry in itemtypes[#"armor_shard"]) {
            sorted[sorted.size] = entry;
        }
    }
    if (isdefined(itemtypes[#"weapon"])) {
        var_610b8743 = [];
        foreach (item in itemtypes[#"weapon"]) {
            if (!isdefined(item)) {
                continue;
            }
            if (item.var_a6762160.rarity == #"epic") {
                var_610b8743[var_610b8743.size] = item;
            }
        }
        if (isdefined(var_610b8743)) {
            function_5cbe24ea(sorted, var_610b8743, level.var_e93e16b);
            waitframe(1);
        }
    }
    if (isdefined(itemtypes[#"weapon"])) {
        weapons = [];
        foreach (item in itemtypes[#"weapon"]) {
            if (!isdefined(item)) {
                continue;
            }
            if (item.var_a6762160.rarity != #"epic") {
                weapons[weapons.size] = item;
            }
        }
        if (isdefined(weapons)) {
            function_5cbe24ea(sorted, weapons, level.var_b9917a92);
            waitframe(1);
        }
    }
    if (isdefined(itemtypes[#"health"])) {
        function_5cbe24ea(sorted, itemtypes[#"health"], level.var_9bc8c1bc);
        waitframe(1);
    }
    if (isdefined(itemtypes[#"backpack"])) {
        foreach (entry in itemtypes[#"backpack"]) {
            sorted[sorted.size] = entry;
        }
    }
    if (isdefined(itemtypes[#"attachment"])) {
        function_5cbe24ea(sorted, itemtypes[#"attachment"], level.var_6cb314b1);
        waitframe(1);
    }
    if (isdefined(itemtypes[#"killstreak"])) {
        foreach (entry in itemtypes[#"killstreak"]) {
            sorted[sorted.size] = entry;
        }
    }
    if (isdefined(itemtypes[#"equipment"])) {
        function_5cbe24ea(sorted, itemtypes[#"equipment"], level.var_3fd5d8f0);
        waitframe(1);
    }
    if (isdefined(itemtypes[#"generic"])) {
        function_5cbe24ea(sorted, itemtypes[#"generic"], level.var_683c7e30);
        waitframe(1);
    }
    if (isdefined(itemtypes[#"ammo"])) {
        function_5cbe24ea(sorted, itemtypes[#"ammo"], level.var_418d51ad);
        waitframe(1);
    }
    if (isdefined(itemtypes[#"resource"])) {
        foreach (entry in itemtypes[#"resource"]) {
            sorted[sorted.size] = entry;
        }
    }
    return sorted;
}

// Namespace item_world/item_world
// Params 4, eflags: 0x5 linked
// Checksum 0x91869761, Offset: 0x5e80
// Size: 0xfc
function private function_b21002cb(localclientnum, objid, obj, objstate) {
    if (obj.type === "scriptmover" || obj.type === "missile") {
        objective_onentity(localclientnum, objid, obj, 0, 0, 0);
    } else {
        objective_clearentity(localclientnum, objid);
        objective_setposition(localclientnum, objid, obj.origin);
    }
    objective_setgamemodeflags(localclientnum, objid, objstate);
    objective_setstate(localclientnum, objid, "active");
}

// Namespace item_world/item_world
// Params 3, eflags: 0x5 linked
// Checksum 0xb5a62820, Offset: 0x5f88
// Size: 0xfc
function private function_c3f5f99b(localclientnum, objid, obj) {
    objective_setstate(localclientnum, objid, "invisible");
    objective_setgamemodeflags(localclientnum, objid, 0);
    if (isdefined(obj)) {
        if (obj.type === "scriptmover" || obj.type === "missile") {
            objective_onentity(localclientnum, objid, obj, 0, 0, 0);
        } else {
            objective_clearentity(localclientnum, objid);
            objective_setposition(localclientnum, objid, obj.origin);
        }
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0x585532ed, Offset: 0x6090
// Size: 0x522
function private function_b0af857f(localclientnum) {
    self endon(#"death");
    clientdata = function_a7e98a1a(localclientnum);
    clientdata.var_a4ad122e = 1;
    var_da43934d = self function_da43934d();
    if (var_da43934d) {
        if (!self inlaststand() && !self clientfield::get_to_player("disableItemPickup")) {
            eyepos = getlocalclienteyepos(localclientnum);
            angles = getlocalclientangles(localclientnum);
            maxdist = undefined;
            var_512ddf16 = self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2;
            if (var_512ddf16) {
                maxdist = 128;
            } else {
                model = getuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.multiItemPickup.currentSelection"));
                if (isdefined(model)) {
                    uimodel = createuimodel(model, "id");
                    if (isdefined(uimodel)) {
                        itemid = getuimodelvalue(uimodel);
                        if (isdefined(itemid) && itemid != 32767) {
                            setuimodelvalue(createuimodel(model, "id"), 32767);
                        }
                    }
                }
            }
            self.var_54d9f4a6 = 0;
            if (var_512ddf16) {
                self.var_9b882d22 = undefined;
                self.var_cdaade8c = undefined;
                model = getuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.multiItemPickup.currentSelection"));
                if (isdefined(model)) {
                    uimodel = createuimodel(model, "id");
                    if (isdefined(uimodel)) {
                        itemid = getuimodelvalue(uimodel);
                        if (isdefined(itemid) && itemid != 32767) {
                            if (item_world_util::function_2c7fc531(itemid)) {
                                self.var_9b882d22 = function_b1702735(itemid);
                            } else if (item_world_util::function_da09de95(itemid)) {
                                if (isdefined(level.item_spawn_drops[itemid])) {
                                    self.var_9b882d22 = level.item_spawn_drops[itemid];
                                }
                            }
                            if (isdefined(self.var_9b882d22)) {
                                self.var_9b882d22.var_5d97fed1 = self.var_9b882d22.hidetime === -1;
                            }
                        }
                    }
                }
                if (!isdefined(self.var_9b882d22)) {
                    self.var_54d9f4a6 = 1;
                    foreach (item in clientdata.groupitems) {
                        if (self item_world_util::can_pick_up(item)) {
                            self.var_9b882d22 = item;
                            self.var_9b882d22.var_5d97fed1 = self.var_9b882d22.hidetime === -1;
                            break;
                        }
                    }
                }
            }
            if (!var_512ddf16 || !isdefined(self.var_9b882d22)) {
                self.var_9b882d22 = function_94db1536(localclientnum, eyepos, angles, maxdist);
                if (isdefined(self.var_9b882d22)) {
                    self.var_cdaade8c = self.var_9b882d22.origin;
                }
            }
        } else {
            self.var_9b882d22 = undefined;
        }
        function_802915bc(localclientnum);
    }
    if (isdefined(self.disableitempickup) && self.disableitempickup) {
        self.var_9b882d22 = undefined;
    }
    clientdata.var_a4ad122e = 0;
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xbdfe3338, Offset: 0x65c0
// Size: 0x2e4
function private function_802915bc(localclientnum) {
    if (!isdefined(level.var_62c91473) || !isdefined(level.var_62c91473[localclientnum])) {
        return;
    }
    eyepos = getlocalclienteyepos(localclientnum);
    if (isdefined(self.var_9b882d22) && self.var_9b882d22.var_5d97fed1) {
        var_1ba7b9c8 = arraysortclosest(level.var_624588d5, self.var_9b882d22.origin, 1, 0, 12);
        hinttext = #"wz/supply_stash";
        if (var_1ba7b9c8.size > 0) {
            isdeathstash = var_1ba7b9c8[0].stash_type === 2;
            hinttext = isdeathstash ? #"wz/death_stash" : #"wz/supply_drop";
        } else {
            var_1ba7b9c8 = arraysortclosest(level.item_spawn_stashes, self.var_9b882d22.origin, 1, 0, 12);
            if (var_1ba7b9c8.size > 0 && isdefined(var_1ba7b9c8[0].displayname)) {
                hinttext = var_1ba7b9c8[0].displayname;
            }
        }
        setuimodelvalue(level.var_62c91473[localclientnum], hinttext);
    } else if (!isdefined(self.var_9b882d22) || distance2dsquared(self.var_9b882d22.origin, eyepos) > 128 * 128) {
        angles = getlocalclientangles(localclientnum);
        vehicle = item_world_util::function_6af455de(localclientnum, eyepos, angles);
        hintstring = item_world_util::function_c62ad9a7(vehicle);
        setuimodelvalue(level.var_62c91473[localclientnum], hintstring);
    } else {
        setuimodelvalue(level.var_62c91473[localclientnum], #"");
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0x909d0eb1, Offset: 0x68b0
// Size: 0x69c
function private function_eb396946(localclientnum) {
    if (isdefined(self)) {
        var_f4b807cb = function_2e3efdda(self.origin, undefined, level.var_c102677c, 256, -1, 0);
        if (!isdefined(var_f4b807cb) || !var_f4b807cb.size) {
            return;
        }
        var_1988b305 = [];
        var_d61d8afa = [];
        for (index = 0; index < var_f4b807cb.size; index++) {
            item = var_f4b807cb[index];
            if (!isdefined(item)) {
                continue;
            }
            if (isdefined(item.var_a6762160)) {
                if (item.var_a6762160.itemtype == #"weapon") {
                    if (isdefined(item.weapon) && item.weapon != level.weaponnone && item.weapon !== item.var_a6762160.weapon) {
                        camoweapon = activecamo::function_385ef18d(item.weapon);
                        weaponoptions = self getbuildkitweaponoptions(localclientnum, camoweapon);
                        streamweapon = item.weapon;
                        forcestreamweaponrenderoptions(localclientnum, streamweapon, weaponoptions);
                        var_1988b305[streamweapon] = weaponoptions;
                    } else if (isdefined(item.var_a6762160.weapon) && item.var_a6762160.weapon != level.weaponnone) {
                        camoweapon = activecamo::function_385ef18d(item.var_a6762160.weapon);
                        weaponoptions = self getbuildkitweaponoptions(localclientnum, camoweapon);
                        streamweapon = namespace_a0d533d1::function_2b83d3ff(item);
                        forcestreamweaponrenderoptions(localclientnum, streamweapon, weaponoptions);
                        var_1988b305[streamweapon] = weaponoptions;
                    }
                } else if (item.var_a6762160.itemtype == #"attachment") {
                    if (isdefined(item.var_a6762160.attachments)) {
                        foreach (attachment in item.var_a6762160.attachments) {
                            if (isdefined(attachment.var_6be1bec7)) {
                                var_d61d8afa[attachment.var_6be1bec7] = attachment.var_6be1bec7;
                            }
                        }
                    }
                }
            }
        }
        currentweapon = self function_d2c2b168();
        if (isdefined(currentweapon) && currentweapon != level.weaponnone && currentweapon != level.weaponbasemeleeheld) {
            foreach (attachment in var_d61d8afa) {
                if (!weaponhasattachment(currentweapon, attachment)) {
                    weaponoptions = self function_e10e6c37();
                    streamweapon = getweapon(currentweapon.rootweapon.name, attachment);
                    if (isdefined(streamweapon) && weaponhasattachment(streamweapon, attachment)) {
                        forcestreamweaponrenderoptions(localclientnum, streamweapon, weaponoptions);
                    }
                }
            }
            if (var_1988b305.size) {
                var_1bf1ce1 = getweaponattachments(currentweapon);
                if (isdefined(var_1bf1ce1) && var_1bf1ce1.size) {
                    foreach (key, weaponoptions in var_1988b305) {
                        var_37eedd1 = weapon(key);
                        if (var_37eedd1.rootweapon != currentweapon.rootweapon) {
                            foreach (attachment in var_1bf1ce1) {
                                if (attachment !== "null" && !weaponhasattachment(var_37eedd1, attachment)) {
                                    streamweapon = getweapon(var_37eedd1.name, attachment);
                                    if (isdefined(streamweapon) && streamweapon != var_37eedd1 && weaponhasattachment(streamweapon, attachment)) {
                                        forcestreamweaponrenderoptions(localclientnum, streamweapon, weaponoptions);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0x1f75b684, Offset: 0x6f58
// Size: 0x27e
function private function_48ec057f(localclientnum) {
    clientdata = function_a7e98a1a(localclientnum);
    if (!isdefined(clientdata)) {
        return;
    }
    var_f1530a67 = getservertime(localclientnum, 1);
    var_bea3e246 = [];
    foreach (networkid, serverinfo in clientdata.var_ffc1c0e1) {
        model = function_61f5d33a(localclientnum, clientdata, networkid);
        if (isdefined(model)) {
            function_a4886b1e(localclientnum, networkid, model);
        }
        if (serverinfo.servertime >= var_f1530a67) {
            var_bea3e246[networkid] = serverinfo;
        }
    }
    clientdata.var_ffc1c0e1 = var_bea3e246;
    var_bf2d48f6 = [];
    foreach (vehicleentnum, serverinfo in clientdata.var_baf65690) {
        vehicle = getentbynum(localclientnum, vehicleentnum);
        if (isdefined(vehicle) && serverinfo.servertime >= var_f1530a67 && !function_97980fde(localclientnum, vehicle)) {
            var_bf2d48f6[vehicleentnum] = serverinfo;
            function_3bd99d2f(localclientnum, clientdata, vehicle);
        } else {
            function_3bd99d2f(localclientnum, clientdata, vehicle, 1);
        }
    }
    clientdata.var_baf65690 = var_bf2d48f6;
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0xe202175, Offset: 0x71e0
// Size: 0x166
function private _update_loop(localclientnum) {
    self endon(#"shutdown");
    self notify("787a164bb0bf6bcf");
    self endon("787a164bb0bf6bcf");
    waitframe(1);
    function_1b11e73c();
    while (isdefined(self) && isplayer(self)) {
        if (function_96fa1c6d(localclientnum)) {
            draworigin = function_8cf40a8c(localclientnum);
            self thread _draw(localclientnum, draworigin);
        }
        function_48ec057f(localclientnum);
        function_eb396946(localclientnum);
        if (isalive(self)) {
            if (function_c7e5c26(localclientnum)) {
                self thread function_b0af857f(localclientnum);
            }
            function_48ca0bbb(localclientnum);
        }
        waitframe(1);
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x5 linked
// Checksum 0x3d2306d0, Offset: 0x7350
// Size: 0x84c
function private function_48ca0bbb(localclientnum) {
    var_da43934d = self function_da43934d();
    if (var_da43934d) {
        eyepos = getlocalclienteyepos(localclientnum);
        angles = getlocalclientangles(localclientnum);
        if (isdefined(self.var_9b882d22) && isdefined(self.var_9b882d22.var_a6762160) && !isdefined(getplayervehicle(self))) {
            var_a6762160 = self.var_9b882d22.var_a6762160;
            var_77055f15 = 0;
            var_fa3df96 = undefined;
            if (var_a6762160.itemtype == #"ammo" && !item_inventory::can_pickup_ammo(localclientnum, self.var_9b882d22)) {
                var_77055f15 = 64;
            } else if (item_inventory::function_a243ddd6(localclientnum, var_a6762160)) {
                var_77055f15 = 1;
                if (var_a6762160.itemtype == #"attachment") {
                    var_77055f15 = 1;
                    if (item_inventory::function_ad4c6116(localclientnum, var_a6762160)) {
                        var_77055f15 = var_77055f15 | 32;
                    }
                } else if (var_a6762160.itemtype == #"weapon") {
                    var_a4250c2b = self item_inventory::function_d768ea30(localclientnum);
                    if (namespace_a0d533d1::function_4bd83c04(self.var_9b882d22) && self item_inventory::has_attachments(localclientnum, var_a4250c2b)) {
                        var_77055f15 = var_77055f15 | 512;
                    }
                }
            } else if (var_a6762160.itemtype == #"weapon") {
                var_77055f15 = 2;
                var_a4250c2b = self item_inventory::function_d768ea30(localclientnum);
                if (namespace_a0d533d1::function_4bd83c04(self.var_9b882d22) && self item_inventory::has_attachments(localclientnum, var_a4250c2b)) {
                    var_77055f15 = var_77055f15 | 512;
                }
            } else {
                var_fa3df96 = self item_inventory::function_78ed4455(localclientnum, var_a6762160);
                if (isdefined(var_fa3df96)) {
                    var_77055f15 = 2;
                    if (var_a6762160.itemtype == #"attachment") {
                        var_fa3df96 = undefined;
                        if (item_inventory::function_ad4c6116(localclientnum, var_a6762160)) {
                            var_77055f15 = var_77055f15 | 32;
                        }
                    }
                } else if (!item_inventory::function_ad4c6116(localclientnum, var_a6762160)) {
                    if (var_a6762160.itemtype == #"resource" && item_world_util::function_41f06d9d(var_a6762160)) {
                        var_77055f15 = 128;
                    } else {
                        var_77055f15 = 4;
                    }
                    if (var_a6762160.itemtype == #"equipment" || var_a6762160.itemtype == #"health") {
                        var_77055f15 = var_77055f15 | 1024;
                    }
                } else if (var_a6762160.itemtype == #"equipment" || var_a6762160.itemtype == #"health") {
                    if (item_inventory::function_ad4c6116(localclientnum, var_a6762160)) {
                        var_77055f15 = var_77055f15 | 256;
                    }
                }
            }
            objstate = 0;
            if (isdefined(self.var_9b882d22.isfar) && self.var_9b882d22.isfar) {
                objstate = 1;
            }
            pickupicon = isdefined(var_a6762160.pickupicon) ? var_a6762160.pickupicon : var_a6762160.icon;
            if (self.var_54d9f4a6) {
                var_77055f15 = 16;
            }
            setuimodelvalue(level.var_7e2f5883[localclientnum], isdefined(var_fa3df96) ? var_fa3df96 : -1);
            setuimodelvalue(level.var_ce95aace[localclientnum], var_77055f15);
            setuimodelvalue(level.var_19cf0be9[localclientnum], isdefined(pickupicon) ? pickupicon : #"blacktransparent");
            if (self.var_9b882d22.var_5d97fed1) {
                function_b21002cb(localclientnum, level.var_383edf80, self.var_9b882d22, objstate);
                function_c3f5f99b(localclientnum, level.var_d9beffb9);
            } else if (self item_world_util::can_pick_up(self.var_9b882d22)) {
                hintstring = self function_2fc74639();
                var_d1fce876 = #"";
                if (isdefined(var_a6762160.weapon)) {
                    var_d1fce876 = var_a6762160.weapon.displayname;
                } else {
                    var_d1fce876 = isdefined(var_a6762160.hintstring) ? var_a6762160.hintstring : #"";
                }
                if (var_d1fce876 == hintstring) {
                    function_b21002cb(localclientnum, level.var_d9beffb9, self.var_9b882d22, objstate);
                    function_c3f5f99b(localclientnum, level.var_383edf80);
                } else {
                    if (!(isdefined(self.var_9b882d22.isclose) && self.var_9b882d22.isclose)) {
                        function_b21002cb(localclientnum, level.var_d9beffb9, self.var_9b882d22, objstate);
                    } else {
                        function_c3f5f99b(localclientnum, level.var_d9beffb9, self.var_9b882d22);
                    }
                    function_c3f5f99b(localclientnum, level.var_383edf80, self.var_9b882d22);
                }
            }
        } else {
            setuimodelvalue(level.var_19cf0be9[localclientnum], #"blacktransparent");
            function_c3f5f99b(localclientnum, level.var_d9beffb9);
            function_c3f5f99b(localclientnum, level.var_383edf80);
        }
        if (self function_34418003(localclientnum, eyepos, angles)) {
            self function_7c84312d(localclientnum, eyepos, angles);
        }
    }
}

// Namespace item_world/item_world
// Params 4, eflags: 0x5 linked
// Checksum 0xf1b6abcb, Offset: 0x7ba8
// Size: 0x162
function private function_94db1536(localclientnum, origin, angles, maxdist = undefined) {
    /#
        assert(isplayer(self));
    #/
    clientdata = function_a7e98a1a(localclientnum);
    forward = vectornormalize(anglestoforward(angles));
    if (!isdefined(maxdist)) {
        maxdist = util::function_16fb0a3b();
    }
    var_f4b807cb = function_2e3efdda(origin, forward, 128, maxdist, 0);
    var_4bd72bfe = function_ab88dbd2(localclientnum, #"warzoneprioritypickups");
    var_9b882d22 = item_world_util::function_6061a15(var_f4b807cb, maxdist, origin, angles, forward, var_4bd72bfe, 1);
    return var_9b882d22;
}

// Namespace item_world/item_world
// Params 0, eflags: 0x5 linked
// Checksum 0x40d2a9c7, Offset: 0x7d18
// Size: 0x72
function private function_c5b6693a() {
    item = spawnstruct();
    item.amount = 0;
    item.count = 0;
    item.id = 32767;
    item.networkid = 32767;
    item.var_a6762160 = undefined;
    item.var_627c698b = undefined;
    return item;
}

// Namespace item_world/item_world
// Params 3, eflags: 0x5 linked
// Checksum 0xf1d1fee9, Offset: 0x7d98
// Size: 0x17c
function private function_7c84312d(localclientnum, origin, angles) {
    /#
        assert(isplayer(self));
    #/
    clientdata = function_a7e98a1a(localclientnum);
    while (isdefined(clientdata.var_a4ad122e) && clientdata.var_a4ad122e) {
        waitframe(1);
    }
    if (isdefined(self.var_9b882d22)) {
        var_433d429 = 14;
        groupitems = function_2e3efdda(self.var_9b882d22.origin, undefined, 128, var_433d429, undefined, 1);
        groupitems = self function_43d3ebe1(groupitems);
        if (!isdefined(self)) {
            return;
        }
        arrayremovevalue(groupitems, undefined, 0);
        clientdata.groupitems = function_83e328e1(clientdata.groupitems, groupitems);
    } else {
        clientdata.groupitems = [];
    }
    self item_inventory::function_9116bb0e(localclientnum);
}

// Namespace item_world/item_world
// Params 2, eflags: 0x5 linked
// Checksum 0x6871fa85, Offset: 0x7f20
// Size: 0x326
function private function_83e328e1(var_78ddf4e2, newitems) {
    if (!isdefined(var_78ddf4e2)) {
        return newitems;
    }
    items = [];
    emptycount = 0;
    newcount = 0;
    var_21198c86 = [];
    foreach (newitem in newitems) {
        if (!isdefined(newitem)) {
            continue;
        }
        var_f613370d = newitem;
        if (isstruct(var_f613370d) && item_world_util::function_2c7fc531(var_f613370d.networkid)) {
            var_f613370d = function_b1702735(var_f613370d.networkid);
        }
        if (self item_world_util::can_pick_up(var_f613370d)) {
            var_21198c86[var_21198c86.size] = var_f613370d;
        }
    }
    foreach (var_319b917b in var_78ddf4e2) {
        var_f59eabca = var_319b917b;
        if (isstruct(var_f59eabca) && item_world_util::function_2c7fc531(var_f59eabca.networkid)) {
            var_f59eabca = function_b1702735(var_f59eabca.networkid);
        }
        if (!isdefined(var_f59eabca) || !self item_world_util::can_pick_up(var_f59eabca)) {
            emptycount++;
            items[items.size] = function_c5b6693a();
        } else {
            foreach (newitem in var_21198c86) {
                if (newitem.networkid == var_f59eabca.networkid) {
                    newcount++;
                    items[items.size] = newitem;
                }
            }
        }
    }
    if (var_21198c86.size == newcount && var_78ddf4e2.size == newcount + emptycount) {
        return items;
    }
    return newitems;
}

// Namespace item_world/item_world
// Params 3, eflags: 0x5 linked
// Checksum 0x5aebe8a6, Offset: 0x8250
// Size: 0x22c
function private function_1b42632a(localclientnum, clientdata, var_2ccf7a1c) {
    var_f0a9e97d = undefined;
    var_e7349b30 = undefined;
    foreach (var_7d6cdf6f, serverinfo in clientdata.var_ffc1c0e1) {
        if (serverinfo.var_2ccf7a1c == var_2ccf7a1c) {
            var_f0a9e97d = var_7d6cdf6f;
            var_e7349b30 = serverinfo;
            break;
        }
    }
    if (isdefined(var_f0a9e97d)) {
        clientdata.var_ffc1c0e1[var_f0a9e97d] = undefined;
        model = function_61f5d33a(localclientnum, clientdata, var_f0a9e97d);
        if (isdefined(model)) {
            function_a4886b1e(localclientnum, var_f0a9e97d, model);
        }
    }
    var_cd3b74d6 = undefined;
    var_e7349b30 = undefined;
    foreach (vehicleentnum, serverinfo in clientdata.var_baf65690) {
        if (serverinfo.var_2ccf7a1c == var_2ccf7a1c) {
            var_cd3b74d6 = vehicleentnum;
            var_e7349b30 = serverinfo;
            break;
        }
    }
    if (isdefined(var_cd3b74d6)) {
        clientdata.var_baf65690[var_cd3b74d6] = undefined;
        vehicle = getentbynum(localclientnum, var_cd3b74d6);
        if (isdefined(vehicle)) {
            function_3bd99d2f(localclientnum, clientdata, vehicle, 1);
        }
    }
}

// Namespace item_world/item_world
// Params 3, eflags: 0x1 linked
// Checksum 0xf2a1b535, Offset: 0x8488
// Size: 0x10c
function function_347698a5(localclientnum, networkid, var_2ccf7a1c) {
    clientdata = function_a7e98a1a(localclientnum);
    function_1b42632a(localclientnum, clientdata, var_2ccf7a1c);
    endtime = getservertime(localclientnum, 1) + 60000;
    clientdata.var_ffc1c0e1[networkid] = {#var_2ccf7a1c:var_2ccf7a1c, #servertime:endtime};
    model = function_61f5d33a(localclientnum, clientdata, networkid);
    if (isdefined(model)) {
        function_a4886b1e(localclientnum, networkid, model);
    }
}

// Namespace item_world/item_world
// Params 3, eflags: 0x1 linked
// Checksum 0xa75be687, Offset: 0x85a0
// Size: 0xf4
function function_d2f95c1a(localclientnum, vehicleentnum, var_2ccf7a1c) {
    clientdata = function_a7e98a1a(localclientnum);
    function_1b42632a(localclientnum, clientdata, var_2ccf7a1c);
    endtime = getservertime(localclientnum, 1) + 60000;
    clientdata.var_baf65690[vehicleentnum] = {#var_2ccf7a1c:var_2ccf7a1c, #servertime:endtime};
    vehicle = getentbynum(localclientnum, vehicleentnum);
    function_d223645e(localclientnum, vehicle);
}

// Namespace item_world/item_world
// Params 1, eflags: 0x1 linked
// Checksum 0x5310e7b5, Offset: 0x86a0
// Size: 0x1c
function function_a7e98a1a(localclientnum) {
    return level.var_d342a3fd[localclientnum];
}

// Namespace item_world/item_world
// Params 0, eflags: 0x1 linked
// Checksum 0x42464e25, Offset: 0x86c8
// Size: 0xa2
function function_963d3f6e() {
    var_6e75b345 = 1350;
    if (isdefined(getgametypesetting(#"wzbigteambattle")) && getgametypesetting(#"wzbigteambattle")) {
        var_6e75b345 = 900;
    }
    if (issplitscreen()) {
        var_6e75b345 = int(var_6e75b345 * 0.7);
    }
    return var_6e75b345;
}

// Namespace item_world/item_world
// Params 2, eflags: 0x1 linked
// Checksum 0xf77e1038, Offset: 0x8778
// Size: 0xc8
function function_73436347(itemgroup, networkid) {
    /#
        assert(isarray(itemgroup));
    #/
    /#
        assert(isint(networkid));
    #/
    for (index = 0; index < itemgroup.size; index++) {
        item = itemgroup[index];
        if (isdefined(item) && item.networkid === networkid) {
            return index;
        }
    }
    return undefined;
}

// Namespace item_world/item_world
// Params 2, eflags: 0x1 linked
// Checksum 0xf7052ec1, Offset: 0x8848
// Size: 0x94
function function_d223645e(localclientnum, vehicle) {
    /#
        assert(isdefined(vehicle));
    #/
    if (!isdefined(vehicle) || !function_97980fde(localclientnum, vehicle)) {
        return;
    }
    clientdata = function_a7e98a1a(localclientnum);
    function_3bd99d2f(localclientnum, clientdata, vehicle);
}

// Namespace item_world/item_world
// Params 3, eflags: 0x1 linked
// Checksum 0x1e7bdce0, Offset: 0x88e8
// Size: 0x21c
function function_a4886b1e(localclientnum, networkid, model) {
    /#
        assert(isdefined(model));
    #/
    if (!isdefined(model)) {
        return;
    }
    draworigin = function_8cf40a8c(localclientnum);
    maxdist = getdvarfloat(#"hash_2cd1a08f81049564", function_963d3f6e());
    clientdata = function_a7e98a1a(localclientnum);
    if (isdefined(model.var_5d97fed1) && model.var_5d97fed1 || model.hidetime === -1) {
        stash = function_c17fe536(localclientnum, clientdata, networkid);
        function_78bf134c(localclientnum, clientdata, networkid, stash);
    } else if (distancesquared(draworigin, model.origin) <= maxdist * maxdist) {
        var_a6762160 = undefined;
        if (isdefined(networkid)) {
            if (item_world_util::function_2c7fc531(networkid)) {
                var_a6762160 = function_b1702735(networkid).var_a6762160;
            } else if (item_world_util::function_da09de95(networkid)) {
                if (isdefined(level.item_spawn_drops[networkid])) {
                    var_a6762160 = level.item_spawn_drops[networkid].var_a6762160;
                }
            }
        }
        function_78bf134c(localclientnum, clientdata, networkid, model, var_a6762160);
    }
}

// Namespace item_world/item_world
// Params 2, eflags: 0x1 linked
// Checksum 0xfffe8bef, Offset: 0x8b10
// Size: 0x1a4
function play_spawn_fx(localclientnum, networkid) {
    if (!isdefined(networkid)) {
        return;
    }
    item = undefined;
    if (item_world_util::function_2c7fc531(networkid)) {
        item = function_b1702735(networkid);
    } else if (item_world_util::function_da09de95(networkid)) {
        if (isdefined(level.item_spawn_drops[networkid])) {
            item = level.item_spawn_drops[networkid];
        }
    }
    if (!isdefined(item) || !isdefined(item.var_a6762160) || !isdefined(item.var_a6762160.var_86d1fc36)) {
        return;
    }
    var_a6762160 = item.var_a6762160;
    originoffset = function_7571fda9(item);
    angles = function_118d052e(item);
    forward = anglestoforward(angles);
    up = anglestoup(angles);
    playfx(localclientnum, var_a6762160.var_86d1fc36, item.origin + originoffset, forward, up);
}

// Namespace item_world/item_world
// Params 2, eflags: 0x1 linked
// Checksum 0x1c303496, Offset: 0x8cc0
// Size: 0x11c
function play_pickup_fx(localclientnum, item) {
    if (!isdefined(item) || !isdefined(item.var_a6762160) || !isdefined(item.var_a6762160.var_37cd55af)) {
        return;
    }
    var_a6762160 = item.var_a6762160;
    originoffset = function_7571fda9(item);
    angles = function_118d052e(item);
    forward = anglestoforward(angles);
    up = anglestoup(angles);
    playfx(localclientnum, var_a6762160.var_37cd55af, item.origin + originoffset, forward, up);
}

// Namespace item_world/item_world
// Params 1, eflags: 0x1 linked
// Checksum 0x94b3e8cf, Offset: 0x8de8
// Size: 0xea
function function_7571fda9(item) {
    if (!isdefined(item) || !isdefined(item.var_a6762160)) {
        return (0, 0, 0);
    }
    var_a6762160 = item.var_a6762160;
    originoffset = (isdefined(var_a6762160.var_5dc4470b) ? var_a6762160.var_5dc4470b : 0, isdefined(var_a6762160.var_54a3b4ca) ? var_a6762160.var_54a3b4ca : 0, isdefined(var_a6762160.var_3e688854) ? var_a6762160.var_3e688854 : 0);
    originoffset = rotatepoint(originoffset * -1, item.angles);
    return originoffset;
}

// Namespace item_world/item_world
// Params 1, eflags: 0x1 linked
// Checksum 0xc5c336f8, Offset: 0x8ee0
// Size: 0xda
function function_118d052e(item) {
    if (!isdefined(item)) {
        return (0, 0, 0);
    }
    var_a6762160 = item.var_a6762160;
    if (!isdefined(item.var_a6762160)) {
        return item.angles;
    }
    angles = combineangles(item.angles, (isdefined(var_a6762160.var_15b88fde) ? var_a6762160.var_15b88fde : 0, isdefined(var_a6762160.var_8c9a7dc8) ? var_a6762160.var_8c9a7dc8 : 0, isdefined(var_a6762160.var_7a51d937) ? var_a6762160.var_7a51d937 : 0));
    return angles;
}

// Namespace item_world/item_world
// Params 2, eflags: 0x1 linked
// Checksum 0xf3602600, Offset: 0x8fc8
// Size: 0xb0
function function_28b42f1c(localclientnum, networkid) {
    if (item_world_util::function_d9648161(networkid)) {
        if (item_world_util::function_2c7fc531(networkid)) {
            return networkid;
        } else if (item_world_util::function_da09de95(networkid)) {
            if (isdefined(level.item_spawn_drops[networkid])) {
                return level.item_spawn_drops[networkid].id;
            }
        } else {
            return item_inventory::function_c48cd17f(localclientnum, networkid);
        }
    }
    return 32767;
}

// Namespace item_world/item_world
// Params 1, eflags: 0x1 linked
// Checksum 0xd481c1cd, Offset: 0x9080
// Size: 0x82
function get_item_name(item) {
    if (isdefined(item.weapon)) {
        if (item.weapon.displayname != #"") {
            return item.weapon.displayname;
        }
    }
    return isdefined(item.displayname) ? item.displayname : #"";
}

// Namespace item_world/item_world
// Params 6, eflags: 0x1 linked
// Checksum 0xc0ee6b3d, Offset: 0x9110
// Size: 0x17a
function function_2e3efdda(origin, dir, maxitems, maxdistance, dot, var_653b55e5 = 0) {
    var_f4b807cb = function_abaeb170(origin, dir, maxitems, maxdistance, dot, 1, 2147483647);
    var_6665e24 = arraysortclosest(level.item_spawn_drops, origin, maxitems, 0, maxdistance);
    var_f4b807cb = arraycombine(var_f4b807cb, var_6665e24, 1, 0);
    var_f4b807cb = arraysortclosest(var_f4b807cb, origin, maxitems, 0, maxdistance);
    if (var_653b55e5) {
        stashitems = [];
        for (index = 0; index < var_f4b807cb.size; index++) {
            if (var_f4b807cb[index].hidetime === -1) {
                stashitems[stashitems.size] = var_f4b807cb[index];
            }
        }
        var_f4b807cb = stashitems;
    }
    return var_f4b807cb;
}

// Namespace item_world/item_world
// Params 2, eflags: 0x1 linked
// Checksum 0xe2409947, Offset: 0x9298
// Size: 0x302
function hide_item(localclientnum, networkid) {
    if (item_world_util::function_2c7fc531(networkid)) {
        if (isdefined(level.var_5b2a8d88) && isdefined(level.var_5b2a8d88[networkid])) {
            level.var_5b2a8d88[networkid] = 0;
        }
        if (function_54ca5536(networkid, getservertime(0, 1)) == 0) {
            return;
        }
    }
    clientdata = function_a7e98a1a(localclientnum);
    if (isdefined(clientdata)) {
        if (isdefined(clientdata.modellist[networkid])) {
            clientdata.modellist[networkid] hide();
            clientdata.modellist[networkid * -1] = clientdata.modellist[networkid];
            arrayremoveindex(clientdata.modellist, networkid, 1);
            function_2990e5f(localclientnum, clientdata.modellist[networkid]);
        }
        if (isdefined(clientdata.var_89e328b4) && isdefined(clientdata.var_89e328b4[networkid])) {
            clientdata.var_89e328b4[networkid] hide();
            clientdata.var_89e328b4[networkid * -1] = clientdata.var_89e328b4[networkid];
            arrayremoveindex(clientdata.var_89e328b4, networkid, 1);
            function_2990e5f(localclientnum, clientdata.var_89e328b4[networkid]);
        }
        if (isarray(clientdata.groupitems)) {
            foreach (item in clientdata.groupitems) {
                if (isdefined(item) && item.networkid === networkid) {
                    if (isstruct(item)) {
                        item.hidetime = gettime();
                    }
                    break;
                }
            }
        }
    }
}

// Namespace item_world/item_world
// Params 3, eflags: 0x1 linked
// Checksum 0x3fafe74b, Offset: 0x95a8
// Size: 0x294
function show_item(localclientnum, networkid, showitem) {
    item = undefined;
    if (item_world_util::function_2c7fc531(networkid)) {
        if (isdefined(level.var_5b2a8d88) && isdefined(level.var_5b2a8d88[networkid])) {
            level.var_5b2a8d88[networkid] = 1;
        }
        function_54ca5536(networkid, showitem ? 0 : -1);
        player = function_5c10bd79(localclientnum);
        item = function_b1702735(networkid);
        var_6369afab = function_963d3f6e();
        if (isplayer(player) && distance2dsquared(item.origin, player.origin) <= var_6369afab * var_6369afab) {
            player.var_506495f9 = 1;
        }
    } else {
        item = level.item_spawn_drops[networkid];
    }
    clientdata = function_a7e98a1a(localclientnum);
    if (isdefined(clientdata) && isdefined(item)) {
        if (isdefined(clientdata.modellist[networkid])) {
            clientdata.modellist[networkid] show();
            function_78bf134c(localclientnum, clientdata, networkid, clientdata.modellist[networkid], item.var_a6762160);
        }
        if (isdefined(clientdata.var_89e328b4) && isdefined(clientdata.var_89e328b4[networkid])) {
            clientdata.var_89e328b4[networkid] show();
            function_78bf134c(localclientnum, clientdata, networkid, clientdata.var_89e328b4[networkid], item.var_a6762160);
        }
    }
}

// Namespace item_world/item_world
// Params 1, eflags: 0x1 linked
// Checksum 0x7db34452, Offset: 0x9848
// Size: 0x3e
function function_b78a9820(localclientnum) {
    clientdata = function_a7e98a1a(localclientnum);
    clientdata.var_ff9e7e43 = 1;
}

// Namespace item_world/item_world
// Params 0, eflags: 0x1 linked
// Checksum 0xf5726eda, Offset: 0x9890
// Size: 0xda
function function_1b11e73c() {
    reset = isdefined(level flagsys::get(#"item_world_reset")) && level flagsys::get(#"item_world_reset");
    level flagsys::wait_till(#"item_world_initialized");
    if (reset != (isdefined(level flagsys::get(#"item_world_reset")) && level flagsys::get(#"item_world_reset"))) {
        return 0;
    }
    return 1;
}

// Namespace item_world/item_world
// Params 0, eflags: 0x1 linked
// Checksum 0x9d7691b1, Offset: 0x9978
// Size: 0x64
function function_4de3ca98() {
    level flagsys::wait_till_clear(#"hash_2d3b2a4d082ba5ee");
    level flagsys::wait_till(#"item_world_reset");
    level flagsys::wait_till(#"item_world_initialized");
}


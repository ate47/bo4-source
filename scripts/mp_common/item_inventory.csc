// Atian COD Tools GSC decompiler test
#using scripts\mp_common\item_world_util.csc;
#using scripts\mp_common\item_world.csc;
#using script_c1eebdc8cad5d78;
#using scripts\core_common\player\player_stats.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flagsys_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace item_inventory;

// Namespace item_inventory/item_inventory
// Params 0, eflags: 0x2
// Checksum 0xb2b95669, Offset: 0xa68
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"item_inventory", &__init__, undefined, #"item_world");
}

// Namespace item_inventory/item_inventory
// Params 0, eflags: 0x5 linked
// Checksum 0xb643fbbf, Offset: 0xab8
// Size: 0x18c
function private __init__() {
    if (!isdefined(getgametypesetting(#"useitemspawns")) || getgametypesetting(#"useitemspawns") == 0) {
        return;
    }
    callback::on_localplayer_spawned(&_on_localplayer_spawned);
    clientfield::register("clientuimodel", "hudItems.multiItemPickup.status", 1, 2, "int", &function_38ebb2a1, 0, 1);
    clientfield::register("clientuimodel", "hudItems.multiItemPickup.status", 17000, 3, "int", &function_38ebb2a1, 0, 1);
    clientfield::register("clientuimodel", "hudItems.healthItemstackCount", 5000, 8, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "hudItems.equipmentStackCount", 5000, 8, "int", undefined, 0, 0);
    level thread function_d2f05352();
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0xb87e777, Offset: 0xc50
// Size: 0xdc
function private _on_localplayer_spawned(localclientnum) {
    if (self function_da43934d()) {
        self thread function_3e624606(localclientnum);
        self thread function_ac4df751(localclientnum);
        self thread function_ca87f318(localclientnum);
        self thread function_7f35a045(localclientnum);
        self thread function_d1e6731e(localclientnum);
        self thread function_2ae9881d(localclientnum);
        if (ispc()) {
            self thread function_9b83c65d(localclientnum);
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x1 linked
// Checksum 0x34514119, Offset: 0xd38
// Size: 0x46
function function_a5c2a6b8(localclientnum) {
    return isdefined(level.tabbedmultiitempickup) && level.tabbedmultiitempickup || !gamepadusedlast(localclientnum);
}

// Namespace item_inventory/item_inventory
// Params 7, eflags: 0x5 linked
// Checksum 0x40e80674, Offset: 0xd88
// Size: 0x302
function private function_38ebb2a1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    clientdata = item_world::function_a7e98a1a(localclientnum);
    if (newval == 2) {
        clientdata.var_ff9e7e43 = 1;
        if (function_a5c2a6b8(localclientnum)) {
            clientdata.groupitems = [];
            if (isdefined(level.tabbedmultiitempickup) && level.tabbedmultiitempickup) {
                setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.canUseQuickInventory"), 0);
            }
        }
    } else {
        if (newval == 0) {
            clientdata.groupitems = [];
            player = function_27673a7(localclientnum);
            if (isplayer(player) && isalive(player)) {
                player function_9116bb0e(localclientnum, 1);
            }
        }
        if (isdefined(level.tabbedmultiitempickup) && level.tabbedmultiitempickup && oldval == 2) {
            for (i = 0; i < clientdata.inventory.var_c212de25; i++) {
                if (clientdata.inventory.items[i].networkid != 32767) {
                    if (clientdata.inventory.items[i].availableaction == 1 || clientdata.inventory.items[i].availableaction == 4 || clientdata.inventory.items[i].availableaction == 2 || clientdata.inventory.items[i].availableaction == 6) {
                        setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.canUseQuickInventory"), 1);
                        break;
                    }
                }
            }
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0xa88b8819, Offset: 0x1098
// Size: 0xf8
function private function_3fe6ef04(localclientnum) {
    data = item_world::function_a7e98a1a(localclientnum);
    var_cfa0e915 = [];
    foreach (consumeditem in data.inventory.consumed.items) {
        if (isdefined(var_cfa0e915[consumeditem.var_a6762160.name])) {
            continue;
        }
        var_cfa0e915[consumeditem.var_a6762160.name] = 1;
    }
    return var_cfa0e915.size;
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x2e31e24b, Offset: 0x1198
// Size: 0x4e
function private function_88da0c8e(localclientnum) {
    paintcans = stats::get_stat_global(localclientnum, #"items_paint_cans_collected");
    return (isdefined(paintcans) ? paintcans : 0) >= 150;
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0xce764531, Offset: 0x11f0
// Size: 0x5e
function private function_99b22bbc(localclientnum) {
    if (function_96d4f30e(localclientnum)) {
        return 0;
    }
    if (isgrappling(localclientnum)) {
        return 0;
    }
    if (function_d5f07a6e(localclientnum)) {
        return 0;
    }
    return 1;
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0xc4d434e6, Offset: 0x1258
// Size: 0x3fe
function private function_ca87f318(localclientnum) {
    self endon(#"shutdown", #"death");
    self notify("8b67206b631ec6e");
    self endon("8b67206b631ec6e");
    clientdata = item_world::function_a7e98a1a(localclientnum);
    var_790695cc = "inventory_equip" + localclientnum;
    var_6e7b39bc = "inventory_detach" + localclientnum;
    clientdata.var_b9730e2b = gettime();
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(var_790695cc, var_6e7b39bc);
        if (gettime() - clientdata.var_b9730e2b < 300) {
            continue;
        }
        if (waitresult._notify === var_790695cc) {
            networkid = waitresult.id;
            quickequip = isdefined(waitresult.extraarg) ? waitresult.extraarg : 0;
            if (quickequip) {
                var_ed98a5fe = function_15d578f4(localclientnum, networkid);
                if (isdefined(var_ed98a5fe)) {
                    var_a6762160 = var_ed98a5fe.var_a6762160;
                }
                if (isdefined(var_a6762160) && (var_a6762160.itemtype == #"generic" || var_a6762160.itemtype == #"killstreak")) {
                    data = item_world::function_a7e98a1a(localclientnum);
                    name = isdefined(var_a6762160.parentname) ? var_a6762160.parentname : var_a6762160.name;
                    for (index = 0; index < data.inventory.items.size && index < 16 + 1; index++) {
                        inventoryitem = data.inventory.items[index];
                        if (!isdefined(inventoryitem.var_a6762160) || isdefined(inventoryitem.endtime)) {
                            continue;
                        }
                        if (inventoryitem.networkid == networkid) {
                            continue;
                        }
                        if (name == (isdefined(inventoryitem.var_a6762160.parentname) ? inventoryitem.var_a6762160.parentname : inventoryitem.var_a6762160.name)) {
                            networkid = inventoryitem.networkid;
                            break;
                        }
                    }
                }
            }
            if (isdefined(waitresult.extraarg2)) {
                function_97fedb0d(localclientnum, 11, networkid, quickequip);
            } else {
                function_97fedb0d(localclientnum, 4, networkid, quickequip);
            }
        } else if (waitresult._notify === var_6e7b39bc) {
            networkid = waitresult.id;
            function_97fedb0d(localclientnum, 6, networkid);
        }
        clientdata.var_b9730e2b = gettime();
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x684b268, Offset: 0x1660
// Size: 0x94
function private function_10861362(localclientnum) {
    vehicle = getplayervehicle(self);
    if (!isdefined(vehicle)) {
        return 1;
    }
    var_88fa0205 = vehicle getoccupantseat(localclientnum, self);
    if (isdefined(var_88fa0205) && (var_88fa0205 == 0 || var_88fa0205 == 4)) {
        return 0;
    }
    return 1;
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0xe56082c5, Offset: 0x1700
// Size: 0x98
function private function_ee44351a(localclientnum, inventoryitem) {
    weapon = item_world_util::function_35e06774(inventoryitem.var_a6762160);
    if (!isdefined(weapon)) {
        return 1;
    }
    if (weapon == getcurrentweapon(localclientnum) || weapon == function_e9fe14ee(localclientnum)) {
        return function_99b22bbc(localclientnum);
    }
    return 1;
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x33ce7bec, Offset: 0x17a0
// Size: 0x1ca
function private function_e23e5e85(localclientnum) {
    clientdata = item_world::function_a7e98a1a(localclientnum);
    if (!isdefined(clientdata) || !isdefined(clientdata.inventory) || !isdefined(clientdata.inventory.items)) {
        return 0;
    }
    armoritem = clientdata.inventory.items[11];
    if (!isdefined(armoritem) || armoritem.networkid === 32767 || armoritem.var_a6762160.itemtype !== #"armor") {
        return 0;
    }
    clientmodel = getuimodelvalue(getuimodel(getuimodelforcontroller(localclientnum), "predictedClientModel"));
    armormodel = getuimodel(clientmodel, "armor");
    var_15663411 = getuimodel(armoritem.itemuimodel, "armorMax");
    if (!isdefined(armormodel) || !isdefined(var_15663411) || getuimodelvalue(armormodel) == getuimodelvalue(var_15663411)) {
        return 0;
    }
    return 1;
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0xb0604881, Offset: 0x1978
// Size: 0xa2
function private function_e094fd92(item) {
    if (!isdefined(item) || !isdefined(item.networkid) || item.networkid == 32767 || !isdefined(item.quickequip) || item.quickequip != 1 || !isdefined(item.consumable) || item.consumable != 1) {
        return 0;
    }
    return 1;
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0xa5b4223e, Offset: 0x1a28
// Size: 0xee
function private function_f3ef5269(localclientnum) {
    perksarray = [];
    clientdata = item_world::function_a7e98a1a(localclientnum);
    for (i = 0; i < 10; i++) {
        currentitem = clientdata.inventory.items[i];
        if (function_e094fd92(currentitem)) {
            if (!isdefined(perksarray)) {
                perksarray = [];
            } else if (!isarray(perksarray)) {
                perksarray = array(perksarray);
            }
            perksarray[perksarray.size] = currentitem;
        }
    }
    return perksarray;
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0xfeb06cda, Offset: 0x1b20
// Size: 0xce
function private function_e090a831(localclientnum, networkid) {
    clientdata = item_world::function_a7e98a1a(localclientnum);
    perkindex = 0;
    for (i = 0; i < 10; i++) {
        currentitem = clientdata.inventory.items[i];
        if (function_e094fd92(currentitem)) {
            if (currentitem.networkid == networkid) {
                return perkindex;
            }
            perkindex++;
        }
    }
    return -1;
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0x63ad370c, Offset: 0x1bf8
// Size: 0x188
function private function_535a5a06(localclientnum, var_6e51c00) {
    /#
        assert(var_6e51c00 >= -1 && var_6e51c00 <= 1);
    #/
    inventoryuimodel = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory");
    var_f99434b1 = createuimodel(inventoryuimodel, "quickConsumeIndex");
    perksarray = function_f3ef5269(localclientnum);
    var_be32fa6d = perksarray.size;
    if (var_be32fa6d < 2) {
        setuimodelvalue(var_f99434b1, 0);
        return 0;
    }
    quickconsumeindex = getuimodelvalue(var_f99434b1);
    if (!isdefined(quickconsumeindex)) {
        quickconsumeindex = 0;
    }
    quickconsumeindex = quickconsumeindex + var_6e51c00;
    if (quickconsumeindex >= var_be32fa6d) {
        quickconsumeindex = 0;
    } else if (quickconsumeindex < 0) {
        quickconsumeindex = var_be32fa6d - 1;
    }
    setuimodelvalue(var_f99434b1, quickconsumeindex);
    return quickconsumeindex;
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x8e5c5792, Offset: 0x1d88
// Size: 0x22
function private function_91483494(localclientnum) {
    return function_1606ff3(localclientnum, 1);
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x883921c5, Offset: 0x1db8
// Size: 0x22
function private function_9f5d2dc8(localclientnum) {
    return function_1606ff3(localclientnum, 0);
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0x456be26d, Offset: 0x1de8
// Size: 0x13c
function private function_1606ff3(localclientnum, var_6e51c00) {
    perksarray = function_f3ef5269(localclientnum);
    currentindex = function_535a5a06(localclientnum, var_6e51c00);
    inventoryuimodel = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory");
    var_98d32f1c = createuimodel(inventoryuimodel, "quickConsumeNetworkId");
    if (isdefined(perksarray[currentindex])) {
        setuimodelvalue(var_98d32f1c, perksarray[currentindex].networkid);
    } else {
        setuimodelvalue(var_98d32f1c, 32767);
    }
    if (perksarray.size > 1) {
        playsound(localclientnum, #"hash_4d31bd9927d823c3");
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0x37fa1322, Offset: 0x1f30
// Size: 0x10c
function private function_22759012(localclientnum, networkid) {
    perkindex = function_e090a831(localclientnum, networkid);
    if (perkindex > -1) {
        inventoryuimodel = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory");
        var_f99434b1 = createuimodel(inventoryuimodel, "quickConsumeIndex");
        setuimodelvalue(var_f99434b1, perkindex);
        var_98d32f1c = createuimodel(inventoryuimodel, "quickConsumeNetworkId");
        setuimodelvalue(var_98d32f1c, networkid);
    } else {
        function_9f5d2dc8(localclientnum);
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0x733a5a4a, Offset: 0x2048
// Size: 0x104
function private function_1470ccfe(localclientnum, item) {
    clientdata = item_world::function_a7e98a1a(localclientnum);
    for (i = 0; i < 10; i++) {
        currentitem = clientdata.inventory.items[i];
        if (currentitem.networkid == 32767 || !namespace_a0d533d1::function_73593286(item.var_a6762160, currentitem.var_a6762160) || !isdefined(currentitem.availableaction) || item.availableaction != currentitem.availableaction) {
            continue;
        }
        return currentitem.networkid;
    }
    return undefined;
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x40a4c33c, Offset: 0x2158
// Size: 0xcae
function private function_9b83c65d(localclientnum) {
    self endon(#"shutdown", #"death");
    self notify("7448ede5a4a225c6");
    self endon("7448ede5a4a225c6");
    clientdata = item_world::function_a7e98a1a(localclientnum);
    var_ca4fc719 = "inventory_consume" + localclientnum;
    var_e2d1f454 = "inventory_armor_repair_pressed" + localclientnum;
    var_3731e165 = "inventory_armor_repair_released" + localclientnum;
    var_6a10d173 = "inventory_quick_consume" + localclientnum;
    var_ce5c0b10 = "inventory_cycle_quick_consumable" + localclientnum;
    var_17bdd1c3 = "inventory_equip_quick_consumable" + localclientnum;
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(var_ca4fc719, var_e2d1f454, var_3731e165, var_6a10d173, var_ce5c0b10, var_17bdd1c3);
        if (waitresult._notify === var_ca4fc719) {
            if (!function_10861362(localclientnum)) {
                self playsound(localclientnum, #"uin_unavailable_charging");
                continue;
            }
            inventoryitem = function_15d578f4(localclientnum, waitresult.id);
            function_22759012(localclientnum, inventoryitem.networkid);
        } else if (waitresult._notify === var_17bdd1c3) {
            inventoryitem = function_15d578f4(localclientnum, waitresult.id);
            networkid = function_1470ccfe(localclientnum, inventoryitem);
            function_22759012(localclientnum, isdefined(networkid) ? inventoryitem.networkid : networkid);
            continue;
        } else if (waitresult._notify === var_6a10d173) {
            currentindex = function_535a5a06(localclientnum, 0);
            perksarray = function_f3ef5269(localclientnum);
            if (isdefined(perksarray[currentindex])) {
                inventoryitem = perksarray[currentindex];
            } else {
                continue;
            }
        } else if (waitresult._notify === var_ce5c0b10) {
            function_91483494(localclientnum);
            continue;
        } else {
            inventoryitem = clientdata.inventory.items[16];
            if (!isdefined(inventoryitem) || inventoryitem.networkid === 32767 || inventoryitem.var_a6762160.itemtype !== #"armor_shard") {
                if (waitresult._notify === var_e2d1f454) {
                    inventoryuimodel = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory");
                    var_3ea10284 = createuimodel(inventoryuimodel, "armorShardNotAvailable");
                    forcenotifyuimodel(var_3ea10284);
                }
                continue;
            }
            var_b3d8c077 = function_ab88dbd2(localclientnum, #"armorrepair_toggle");
            var_a3162739 = isdefined(clientdata.inventory.var_f3518190) && inventoryitem == clientdata.inventory.var_f3518190.item;
            if (waitresult._notify === var_e2d1f454) {
                if ((!function_e23e5e85(localclientnum) || inventoryitem.count == 0 || !function_10861362(localclientnum)) && (isdefined(var_b3d8c077) && !var_b3d8c077 || isdefined(var_b3d8c077) && var_b3d8c077 && !var_a3162739)) {
                    self playsound(localclientnum, #"uin_unavailable_charging");
                    inventoryuimodel = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory");
                    var_3ea10284 = createuimodel(inventoryuimodel, "armorShardNotAvailable");
                    forcenotifyuimodel(var_3ea10284);
                    continue;
                }
            } else if (isdefined(var_b3d8c077) && var_b3d8c077 || !var_a3162739) {
                continue;
            }
        }
        if (!isdefined(inventoryitem.var_a6762160.casttime) || inventoryitem.var_a6762160.casttime <= 0) {
            function_97fedb0d(localclientnum, 4, inventoryitem.networkid);
            continue;
        }
        var_eaae8ced = 0;
        if (isdefined(clientdata.inventory.consumed.items) && isarray(clientdata.inventory.consumed.items)) {
            foreach (consumeditem in clientdata.inventory.consumed.items) {
                if (isdefined(consumeditem.var_a6762160.talents) && isarray(consumeditem.var_a6762160.talents)) {
                    foreach (talent in consumeditem.var_a6762160.talents) {
                        if (talent.talent == #"talent_consumer_wz") {
                            var_eaae8ced = 1;
                            break;
                        }
                    }
                }
                if (var_eaae8ced) {
                    break;
                }
            }
        }
        if (isdefined(clientdata.inventory.var_f3518190)) {
            if (inventoryitem != clientdata.inventory.var_f3518190.item) {
                setuimodelvalue(createuimodel(clientdata.inventory.var_f3518190.item.itemuimodel, "castTimeFraction"), 0, 0);
                playsound(localclientnum, #"hash_4d31bd9927d823c3");
                var_f3518190 = spawnstruct();
                var_f3518190.item = inventoryitem;
                var_f3518190.caststart = gettime();
                var_f3518190.castend = var_f3518190.caststart + int((isdefined(var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime) ? var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime : 0) * 1000);
                clientdata.inventory.var_f3518190 = var_f3518190;
                function_de74158f(localclientnum, var_f3518190.item.networkid);
                clientdata.inventory.var_4d4ec560 = inventoryitem.networkid;
            } else {
                setuimodelvalue(createuimodel(clientdata.inventory.var_f3518190.item.itemuimodel, "castTimeFraction"), 0, 0);
                setuimodelvalue(clientdata.inventory.consumed.var_a25538fb, function_3fe6ef04(localclientnum));
                clientdata.inventory.var_f3518190 = undefined;
                clientdata.inventory.var_4d4ec560 = undefined;
            }
        } else if (!isdefined(clientdata.inventory.var_4d4ec560) || clientdata.inventory.var_4d4ec560 != inventoryitem.networkid) {
            playsound(localclientnum, #"hash_4d31bd9927d823c3");
            var_f3518190 = spawnstruct();
            var_f3518190.item = inventoryitem;
            var_f3518190.caststart = gettime();
            var_f3518190.castend = var_f3518190.caststart + int((isdefined(var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime) ? var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime : 0) * 1000);
            clientdata.inventory.var_f3518190 = var_f3518190;
            function_de74158f(localclientnum, var_f3518190.item.networkid);
            clientdata.inventory.var_4d4ec560 = inventoryitem.networkid;
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x8b9f6c1d, Offset: 0x2e10
// Size: 0x4a8
function private function_ac4df751(localclientnum) {
    self endon(#"shutdown", #"death");
    self notify("697b03f7ded5069f");
    self endon("697b03f7ded5069f");
    clientdata = item_world::function_a7e98a1a(localclientnum);
    var_5054e2f7 = "inventory_drop" + localclientnum;
    var_ffec0c46 = "inventory_drop_current_weapon" + localclientnum;
    var_46a7a0e3 = "inventory_drop_current_weapon_and_detach" + localclientnum;
    var_fcd005cc = "inventory_drop_weapon_in_slot" + localclientnum;
    var_3d759450 = "inventory_drop_weapon_in_slot_and_detach" + localclientnum;
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(var_5054e2f7, var_ffec0c46, var_46a7a0e3, var_fcd005cc, var_3d759450);
        if (waitresult._notify === var_5054e2f7) {
            networkid = waitresult.id;
            count = waitresult.extraarg;
            itemid = item_world::function_28b42f1c(localclientnum, networkid);
            if (itemid != 32767) {
                if (function_6d9d9cd7(waitresult.selectedindex)) {
                    inventoryitem = clientdata.inventory.items[waitresult.selectedindex];
                    if (isdefined(inventoryitem) && !function_ee44351a(localclientnum, inventoryitem)) {
                        continue;
                    }
                }
                if (ispc()) {
                    if (isdefined(clientdata.inventory.var_f3518190) && clientdata.inventory.var_f3518190.item.id == itemid) {
                        clientdata.inventory.var_f3518190 = undefined;
                        clientdata.inventory.var_4d4ec560 = undefined;
                        setuimodelvalue(clientdata.inventory.consumed.var_a25538fb, function_3fe6ef04(localclientnum));
                    }
                }
                function_97fedb0d(localclientnum, 5, networkid, count);
            }
        } else if (waitresult._notify === var_ffec0c46 || waitresult._notify === var_fcd005cc) {
            var_4838b749 = isdefined(waitresult.slotid) ? array(16 + 1, 16 + 1 + 6 + 1)[waitresult.slotid] : function_d768ea30(localclientnum);
            if (isdefined(var_4838b749)) {
                networkid = item_world_util::function_970b8d86(self, var_4838b749);
                function_97fedb0d(localclientnum, 5, networkid);
            }
        } else if (waitresult._notify === var_46a7a0e3 || waitresult._notify === var_3d759450) {
            var_4838b749 = isdefined(waitresult.slotid) ? array(16 + 1, 16 + 1 + 6 + 1)[waitresult.slotid] : function_d768ea30(localclientnum);
            if (isdefined(var_4838b749)) {
                networkid = item_world_util::function_970b8d86(self, var_4838b749);
                function_97fedb0d(localclientnum, 8, networkid);
            }
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0xc02400a8, Offset: 0x32c0
// Size: 0x1ea
function private function_8edef5cc(localclientnum, inventoryitem) {
    data = item_world::function_a7e98a1a(localclientnum);
    slot = function_daf3ebda(localclientnum, inventoryitem.var_a6762160);
    if (!isdefined(slot)) {
        slot = self function_78ed4455(localclientnum, inventoryitem.var_a6762160);
    }
    if (isdefined(slot)) {
        if (inventoryitem.var_a6762160.type != #"attachment") {
            item = data.inventory.items[slot];
            setuimodelvalue(createuimodel(item.itemuimodel, "focusTarget"), 1);
        }
    } else if (function_ad4c6116(localclientnum, inventoryitem.var_a6762160)) {
        for (i = 0; i < data.inventory.var_c212de25; i++) {
            if (data.inventory.items[i].networkid === 32767) {
                setuimodelvalue(createuimodel(data.inventory.items[i].itemuimodel, "focusTarget"), 1);
                break;
            }
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 4, eflags: 0x5 linked
// Checksum 0x50c80b4f, Offset: 0x34b8
// Size: 0x19a
function private function_96ce9058(localclientnum, var_6c2b2289, inventoryitem, item) {
    level endon(var_6c2b2289);
    self notify("7357e9cab2fc6298");
    self endon("7357e9cab2fc6298");
    if (isdefined(item.var_a6762160.unlockableitemref)) {
        var_1ce96a13 = array(0, 0, 0, 0, 0);
        while (1) {
            waitframe(1);
            for (i = 0; i < 5; i++) {
                if (isdefined(item.var_a6762160.objectives[i]) && isdefined(item.var_a6762160.objectives[i].var_7e835304)) {
                    value = stats::get_stat_global(localclientnum, item.var_a6762160.objectives[i].var_7e835304);
                    if (isdefined(value) && value != var_1ce96a13[i]) {
                        var_1ce96a13[i] = value;
                        function_39b663b7(localclientnum, inventoryitem, item);
                    }
                }
            }
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0xec4eeca3, Offset: 0x3660
// Size: 0x994
function private function_7f35a045(localclientnum) {
    self endon(#"shutdown", #"death");
    self notify("70f223fcee367f6f");
    self endon("70f223fcee367f6f");
    clientdata = item_world::function_a7e98a1a(localclientnum);
    var_6c2b2289 = "inventory_item_focus" + localclientnum;
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(var_6c2b2289);
        data = item_world::function_a7e98a1a(localclientnum);
        function_534dcb9c(localclientnum);
        if (isdefined(level.var_6d21daaf[localclientnum])) {
            setuimodelvalue(level.var_6d21daaf[localclientnum], 0);
        }
        foreach (var_4838b749 in array(16 + 1, 16 + 1 + 6 + 1)) {
            foreach (var_259f58f3 in array(1, 2, 3, 4, 5, 6)) {
                var_f9f8c0b5 = var_4838b749 + var_259f58f3;
                item = data.inventory.items[var_f9f8c0b5];
                setuimodelvalue(createuimodel(item.itemuimodel, "focusTarget"), 0);
                setuimodelvalue(createuimodel(item.itemuimodel, "notAvailable"), 0);
            }
        }
        setuimodelvalue(createuimodel(data.inventory.items[11].itemuimodel, "focusTarget"), 0);
        setuimodelvalue(createuimodel(data.inventory.items[13].itemuimodel, "focusTarget"), 0);
        setuimodelvalue(createuimodel(data.inventory.items[12].itemuimodel, "focusTarget"), 0);
        setuimodelvalue(createuimodel(data.inventory.items[10].itemuimodel, "focusTarget"), 0);
        for (i = 0; i < 10; i++) {
            setuimodelvalue(createuimodel(data.inventory.items[i].itemuimodel, "focusTarget"), 0);
        }
        if (waitresult._notify !== var_6c2b2289) {
            continue;
        }
        networkid = waitresult.id;
        data.inventory.var_9d51958c = networkid;
        if (networkid === 32767) {
            continue;
        }
        inventoryitem = function_15d578f4(localclientnum, networkid);
        if (isdefined(inventoryitem) && 32767 != inventoryitem.id) {
            item = function_b1702735(inventoryitem.id);
            if (isdefined(item) && isdefined(item.var_a6762160)) {
                self thread function_96ce9058(localclientnum, var_6c2b2289, inventoryitem, item);
            }
        }
        if (!isdefined(inventoryitem) && function_a5c2a6b8(localclientnum) && self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2) {
            arrayremovevalue(data.groupitems, undefined, 0);
            for (index = 0; index < data.groupitems.size; index++) {
                var_81bb13f5 = data.groupitems[index];
                if (var_81bb13f5.networkid === networkid) {
                    if (var_81bb13f5.var_a6762160.itemtype != #"ammo" && var_81bb13f5.var_a6762160.itemtype != #"weapon") {
                        inventoryitem = var_81bb13f5;
                        function_8edef5cc(localclientnum, inventoryitem);
                    }
                    break;
                }
            }
        }
        if (!isdefined(inventoryitem) || !isdefined(inventoryitem.var_a6762160) || inventoryitem.var_a6762160.itemtype !== #"attachment") {
            continue;
        }
        var_a4250c2b = function_d768ea30(localclientnum);
        foreach (var_4838b749 in array(16 + 1, 16 + 1 + 6 + 1)) {
            weaponitem = data.inventory.items[var_4838b749];
            if (weaponitem.id === 32767) {
                continue;
            }
            var_ceefbd10 = namespace_a0d533d1::function_837f4a57(inventoryitem.var_a6762160);
            var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_ceefbd10);
            attachmentname = namespace_a0d533d1::function_2ced1d34(weaponitem, inventoryitem.var_a6762160);
            var_86364446 = data.inventory.items[var_f9f8c0b5];
            if (isdefined(attachmentname)) {
                if (networkid != var_86364446.networkid) {
                    setuimodelvalue(createuimodel(var_86364446.itemuimodel, "focusTarget"), 1);
                }
                var_fdc9fcff = isdefined(var_a4250c2b) && var_a4250c2b == 16 + 1 ? 16 + 1 + 6 + 1 : 16 + 1;
                if (var_fdc9fcff == var_4838b749) {
                    setuimodelvalue(level.var_6d21daaf[localclientnum], 1);
                }
            } else {
                setuimodelvalue(createuimodel(var_86364446.itemuimodel, "notAvailable"), 1);
            }
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0xd06be2f7, Offset: 0x4000
// Size: 0x166
function private function_2ae9881d(localclientnum) {
    self endon(#"shutdown", #"death");
    self notify("62a25a832b1d0cff");
    self endon("62a25a832b1d0cff");
    clientdata = item_world::function_a7e98a1a(localclientnum);
    var_f3efb06b = "cycle_health" + localclientnum;
    var_db83305d = "cycle_equipment" + localclientnum;
    clientdata.var_cb55ac3c = gettime();
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(var_f3efb06b, var_db83305d);
        if (gettime() - clientdata.var_cb55ac3c < 200) {
            continue;
        }
        if (waitresult._notify === var_f3efb06b) {
            function_97fedb0d(localclientnum, 10);
        } else if (waitresult._notify === var_db83305d) {
            function_97fedb0d(localclientnum, 9);
        }
        clientdata.var_cb55ac3c = gettime();
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x1f403ef3, Offset: 0x4170
// Size: 0x3b8
function private function_d1e6731e(localclientnum) {
    self endon(#"shutdown", #"death");
    self notify("1eaaee589e299bd6");
    self endon("1eaaee589e299bd6");
    clientdata = item_world::function_a7e98a1a(localclientnum);
    var_bd0cdac3 = "attachment_pickup";
    var_b784f644 = var_bd0cdac3 + localclientnum;
    while (1) {
        util::waittill_any_ents(self, var_bd0cdac3, level, var_b784f644);
        currentitem = self.var_9b882d22;
        if (!isdefined(currentitem) || !isdefined(currentitem.var_a6762160)) {
            continue;
        }
        var_512ddf16 = self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2;
        if (self.var_9b882d22.hidetime === -1 && !var_512ddf16) {
            continue;
        }
        if (var_512ddf16 && self.var_54d9f4a6) {
            continue;
        }
        origin = getlocalclienteyepos(localclientnum);
        if (distance2dsquared(origin, currentitem.origin) > 128 * 128 || abs(origin[2] - currentitem.origin[2]) > 128) {
            continue;
        }
        if (!isdefined(currentitem.var_a6762160)) {
            continue;
        }
        var_fc7876fd = 0;
        if (!function_ad4c6116(localclientnum, currentitem.var_a6762160)) {
            swap = 0;
            data = item_world::function_a7e98a1a(localclientnum);
            switch (currentitem.var_a6762160.itemtype) {
            case #"equipment":
                swap = 1;
                break;
            case #"health":
                swap = 1;
                break;
            default:
                break;
            }
            if (!swap) {
                continue;
            }
            function_97fedb0d(localclientnum, 7, currentitem.networkid, 2);
            continue;
        } else {
            switch (currentitem.var_a6762160.itemtype) {
            case #"equipment":
                var_fc7876fd = 1;
            case #"health":
                var_fc7876fd = 1;
            case #"weapon":
                var_fc7876fd = 1;
                break;
            }
        }
        function_97fedb0d(localclientnum, 7, currentitem.networkid, var_fc7876fd);
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x31fdb695, Offset: 0x4530
// Size: 0xe2
function private function_6d9d9cd7(slotid) {
    /#
        assert(isint(slotid));
    #/
    foreach (slot in array(10, 11, 12, 13, 16 + 1, 16 + 1 + 6 + 1)) {
        if (slot == slotid) {
            return 1;
        }
    }
    return 0;
}

// Namespace item_inventory/item_inventory
// Params 0, eflags: 0x5 linked
// Checksum 0xa5100d8b, Offset: 0x4620
// Size: 0x7b8
function private function_d2f05352() {
    level endon(#"shutdown");
    waitframe(1);
    while (1) {
        players = getlocalplayers();
        time = gettime();
        foreach (player in players) {
            if (!isalive(player)) {
                continue;
            }
            localclientnum = player getlocalclientnumber();
            if (!isdefined(localclientnum)) {
                continue;
            }
            data = item_world::function_a7e98a1a(localclientnum);
            if (!isdefined(data) || !isdefined(data.inventory) || !isdefined(data.inventory.items)) {
                continue;
            }
            consumed = data.inventory.consumed;
            var_3ef517e = data.inventory.consumed.items;
            var_95dcc077 = 0;
            i = 0;
            while (i < var_3ef517e.size) {
                item = var_3ef517e[i];
                if (item.endtime <= time) {
                    var_95dcc077 = 1;
                    arrayremoveindex(var_3ef517e, i);
                    playsound(localclientnum, #"hash_4c7a6e162e2f26a0");
                } else {
                    i++;
                }
            }
            var_cfa0e915 = [];
            for (i = 0; i < var_3ef517e.size; i++) {
                item = var_3ef517e[i];
                if (isdefined(var_cfa0e915[item.var_a6762160.name])) {
                    continue;
                }
                var_cfa0e915[item.var_a6762160.name] = 1;
                duration = item.endtime - item.starttime;
                timeremaining = item.endtime - time;
                if (var_95dcc077) {
                    item.itemuimodel = createuimodel(consumed.uimodel, "item" + var_cfa0e915.size - 1);
                    function_1a99656a(localclientnum, item, item.networkid, item.id, 0, 0, 0, 0);
                }
                frac = 1;
                if (duration > 0) {
                    frac = 1 - timeremaining / duration;
                }
                setuimodelvalue(createuimodel(item.itemuimodel, "endStartFraction"), frac, 0);
            }
            if (ispc()) {
                var_f3518190 = data.inventory.var_f3518190;
                if (isdefined(var_f3518190) && var_f3518190.item.id != 32767) {
                    duration = var_f3518190.castend - var_f3518190.caststart;
                    timeremaining = var_f3518190.castend - time;
                    if (timeremaining <= 0) {
                        function_97fedb0d(localclientnum, 4, var_f3518190.item.networkid);
                        setuimodelvalue(createuimodel(var_f3518190.item.itemuimodel, "castTimeFraction"), 0, 0);
                        data.inventory.var_f3518190 = undefined;
                        if (var_f3518190.item.networkid == data.inventory.items[16].networkid) {
                            var_95dcc077 = 1;
                            if (!function_e23e5e85(localclientnum)) {
                                data.inventory.var_4d4ec560 = undefined;
                            }
                        }
                    } else {
                        setuimodelvalue(createuimodel(var_f3518190.item.itemuimodel, "castTimeFraction"), 1 - timeremaining / duration, 0);
                        uimodel = getuimodel(data.inventory.consumed.uimodel, "item" + function_3fe6ef04(localclientnum));
                        if (isdefined(uimodel)) {
                            setuimodelvalue(createuimodel(uimodel, "castTimeFraction"), 1 - timeremaining / duration, 0);
                        }
                    }
                }
            }
            for (index = 0; index < 10; index++) {
                item = data.inventory.items[index];
                if (!isdefined(item.endtime)) {
                    continue;
                }
                duration = item.endtime - item.starttime;
                timeremaining = item.endtime - time;
                frac = 1;
                if (duration > 0) {
                    frac = 1 - timeremaining / duration;
                }
                setuimodelvalue(createuimodel(item.itemuimodel, "endStartFraction"), frac, 0);
            }
            if (var_95dcc077) {
                setuimodelvalue(consumed.var_a25538fb, var_cfa0e915.size);
                function_9f5d2dc8(localclientnum);
            }
        }
        players = undefined;
        waitframe(1);
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x3b091694, Offset: 0x4de0
// Size: 0x72
function private function_fe189514(var_a6762160) {
    if (isdefined(var_a6762160) && isdefined(var_a6762160.weapon)) {
        return (isdefined(var_a6762160.weapon.name) ? var_a6762160.weapon.name : #"");
    }
    return #"";
}

// Namespace item_inventory/item_inventory
// Params a, eflags: 0x5 linked
// Checksum 0xc9b9fa8f, Offset: 0x4e60
// Size: 0x1fcc
function private function_1a99656a(localclientnum, inventoryitem, networkid, itemid, count, totalcount, availableaction, var_e35261f6 = 1, var_189fcf49 = 0, var_1204dfe9 = 1) {
    data = undefined;
    if (itemid == 32767 && isdefined(inventoryitem.networkid) && inventoryitem.networkid != 32767) {
        data = level.var_d342a3fd[localclientnum];
    } else if (itemid != 32767 && inventoryitem.networkid === 32767) {
        data = level.var_d342a3fd[localclientnum];
    } else if (isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype === #"armor_shard") {
        data = level.var_d342a3fd[localclientnum];
    }
    var_dbce1e30 = 0;
    if (inventoryitem.id === itemid && isdefined(inventoryitem.count) && inventoryitem.count > count) {
        var_dbce1e30 = 1;
        if (isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype === #"armor_shard") {
            clientdata = item_world::function_a7e98a1a(localclientnum);
            if (isdefined(clientdata) && isdefined(clientdata.inventory) && networkid === clientdata.inventory.var_4d4ec560) {
                clientdata.inventory.var_4d4ec560 = undefined;
            }
        }
    }
    player = function_27673a7(localclientnum);
    var_1bd87f37 = 1;
    if (isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype == #"armor_shard" && networkid == 32767 && var_1204dfe9 == 0) {
        var_1bd87f37 = 0;
    }
    var_d5042302 = isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype === #"attachment";
    var_1c54cff7 = inventoryitem.var_a6762160;
    if (var_1bd87f37) {
        inventoryitem.id = itemid;
        inventoryitem.networkid = networkid;
    } else {
        itemid = inventoryitem.id;
        networkid = inventoryitem.networkid;
    }
    inventoryitem.count = count;
    inventoryitem.var_a6762160 = 32767 == itemid ? undefined : function_b1702735(itemid).var_a6762160;
    inventoryitem.availableaction = availableaction;
    inventoryitem.consumable = isdefined(inventoryitem.var_a6762160) ? inventoryitem.var_a6762160.consumable : undefined;
    inventoryitem.quickequip = 0;
    if (var_e35261f6) {
        inventoryitem.starttime = undefined;
        inventoryitem.endtime = undefined;
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "endStartFraction"), 0, 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "castTimeFraction"), 0, 0);
    }
    setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "id"), inventoryitem.networkid);
    setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "realId"), inventoryitem.id);
    setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "stackCount"), count);
    if (isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype == #"armor_shard") {
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "totalCount"), count);
    } else {
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "totalCount"), totalcount);
    }
    item = undefined;
    if (itemid != 32767) {
        item = function_b1702735(itemid);
    }
    if (itemid == 32767 || !isdefined(item.var_a6762160)) {
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "name"), #"");
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "icon"), #"blacktransparent");
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "rarity"), "None");
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "availableAction"), availableaction);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "stowedAvailableAction"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "canTransferAttachment"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "consumable"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "assetName"), #"");
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "description"), #"");
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "castTime"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "type"), "");
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "equipped"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "endStartFraction"), 0, 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "castTimeFraction"), 0, 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "notAvailable"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "notAccessible"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "focusTarget"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quickEquip"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "cycle"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "armorMax"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "hasAttachments"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "supportsAttachments"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "unlockableItemRef"), #"");
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quote"), #"");
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "rewardName"), #"");
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "ammoType"), #"");
        function_442857e2(localclientnum, var_1c54cff7);
    } else {
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "name"), item_world::get_item_name(item.var_a6762160));
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "icon"), isdefined(item.var_a6762160.icon) ? item.var_a6762160.icon : #"blacktransparent");
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "rarity"), isdefined(item.var_a6762160.rarity) ? item.var_a6762160.rarity : "None");
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "assetName"), function_fe189514(item.var_a6762160));
        armormax = 0;
        if (isdefined(item.var_a6762160) && item.var_a6762160.itemtype == #"armor") {
            armormax = isdefined(item.var_a6762160.amount) ? item.var_a6762160.amount : 0;
        }
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "armorMax"), armormax);
        description = isdefined(item.var_a6762160.description) ? item.var_a6762160.description : #"";
        if (getdvar(#"hash_4a5fd7d94cfc9dfd", 0) == 1) {
            if (isdefined(item.var_a6762160.unlockableitemref)) {
                if (isdefined(item.var_a6762160.var_a51bc1f7)) {
                    description = isdefined(item.var_a6762160.var_a51bc1f7) ? item.var_a6762160.var_a51bc1f7 : #"";
                }
            }
        }
        if (description == #"" && isdefined(item.var_a6762160.weapon)) {
            itemindex = getitemindexfromref(item.var_a6762160.weapon.name);
            var_97dcd0a5 = getunlockableiteminfofromindex(itemindex);
            if (isdefined(var_97dcd0a5) && isdefined(var_97dcd0a5.description)) {
                description = var_97dcd0a5.description;
            }
        }
        if (isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"resource") {
            if (function_88da0c8e(localclientnum)) {
                setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "notAccessible"), 1);
                description = isdefined(item.var_a6762160.var_3b8219fd) ? item.var_a6762160.var_3b8219fd : description;
            }
        }
        if (isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"weapon") {
            supportsattachments = namespace_a0d533d1::function_4bd83c04(item);
            setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "supportsAttachments"), supportsattachments);
            var_754fe8c5 = getweaponammotype(item.var_a6762160.weapon);
            if (isdefined(level.var_c53d118f) && isdefined(level.var_c53d118f[var_754fe8c5])) {
                setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "ammoType"), level.var_c53d118f[var_754fe8c5]);
            } else {
                setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "ammoType"), #"");
            }
        }
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "description"), description);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "castTime"), isdefined(item.var_a6762160.casttime) ? item.var_a6762160.casttime : 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "type"), item.var_a6762160.itemtype);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "equipped"), isdefined(inventoryitem.endtime));
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "availableAction"), availableaction);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "stowedAvailableAction"), 0);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "consumable"), 0);
        if (isdefined(item.var_a6762160.unlockableitemref)) {
            function_39b663b7(localclientnum, inventoryitem, item);
        } else {
            setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "unlockableItemRef"), #"");
            setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quote"), #"");
            setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "rewardName"), #"");
        }
        if (!var_189fcf49) {
            function_442857e2(localclientnum, isdefined(inventoryitem.var_a6762160) ? inventoryitem.var_a6762160 : var_1c54cff7);
        }
        if (count != 0 && !var_dbce1e30) {
            function_8ffee46f(localclientnum, inventoryitem);
        }
    }
    if (isdefined(data)) {
        canusequickinventory = 0;
        filledslots = 0;
        for (i = 0; i < data.inventory.var_c212de25; i++) {
            if (data.inventory.items[i].networkid != 32767) {
                if (data.inventory.items[i].availableaction == 1 || data.inventory.items[i].availableaction == 4 || data.inventory.items[i].availableaction == 2 || data.inventory.items[i].availableaction == 6) {
                    if (isdefined(data.inventory.items[i].quickequip) && data.inventory.items[i].quickequip) {
                        canusequickinventory = canusequickinventory | 1;
                    }
                }
                filledslots++;
            }
        }
        shardcount = 0;
        if (data.inventory.items[16].networkid != 32767 && data.inventory.items[16].count > 0) {
            filledslots++;
            canusequickinventory = canusequickinventory | 1;
        }
        setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.filledSlots"), filledslots);
        setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.canUseQuickInventory"), canusequickinventory);
        var_a966c73b = data.inventory.items[15];
        inventoryuimodel = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory");
        if (var_a966c73b.networkid != 32767) {
            setuimodelvalue(createuimodel(inventoryuimodel, "resourceCount"), 2);
        } else {
            setuimodelvalue(createuimodel(inventoryuimodel, "resourceCount"), 1);
        }
        if (itemid !== 32767 && isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype === #"weapon") {
            foreach (var_4838b749 in array(16 + 1, 16 + 1 + 6 + 1)) {
                if (data.inventory.items[var_4838b749].networkid === networkid) {
                    attachmentslots = array("attachSlotOptics", "attachSlotBarrel", "attachSlotRail", "attachSlotMagazine", "attachSlotBody", "attachSlotStock");
                    foreach (index, var_259f58f3 in array(1, 2, 3, 4, 5, 6)) {
                        slot = attachmentslots[index];
                        var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_259f58f3);
                        attachmentitem = data.inventory.items[var_f9f8c0b5];
                        if (!isdefined(inventoryitem.var_a6762160.(slot))) {
                            setuimodelvalue(createuimodel(attachmentitem.itemuimodel, "disabled"), 1);
                        } else {
                            setuimodelvalue(createuimodel(attachmentitem.itemuimodel, "disabled"), 0);
                        }
                    }
                    break;
                }
            }
        }
        if (itemid !== 32767 && isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype === #"attachment") {
            var_f9f8c0b5 = item_world_util::function_808be9a3(player, inventoryitem.networkid);
            var_2cf6fb05 = undefined;
            foreach (var_4838b749 in array(16 + 1, 16 + 1 + 6 + 1)) {
                if (namespace_a0d533d1::function_398b9770(var_4838b749, var_f9f8c0b5)) {
                    var_2cf6fb05 = var_4838b749;
                    break;
                }
            }
            if (isdefined(var_2cf6fb05)) {
                function_cb7cfe5b(localclientnum, var_2cf6fb05, inventoryitem);
                hasattachments = has_attachments(localclientnum, var_2cf6fb05);
                var_508262d4 = data.inventory.items[var_2cf6fb05];
                if (hasattachments) {
                    setuimodelvalue(createuimodel(var_508262d4.itemuimodel, "hasAttachments"), 1);
                } else {
                    setuimodelvalue(createuimodel(var_508262d4.itemuimodel, "hasAttachments"), 0);
                }
            } else {
                var_a4250c2b = player function_d768ea30(localclientnum);
                function_cb7cfe5b(localclientnum, var_a4250c2b, inventoryitem);
            }
            function_ce628f27(localclientnum);
        } else if (var_d5042302) {
            var_a4250c2b = player function_d768ea30(localclientnum);
            hasattachments = has_attachments(localclientnum, var_a4250c2b);
            if (isdefined(var_a4250c2b)) {
                var_508262d4 = data.inventory.items[var_a4250c2b];
                if (hasattachments) {
                    setuimodelvalue(createuimodel(var_508262d4.itemuimodel, "hasAttachments"), 1);
                } else {
                    setuimodelvalue(createuimodel(var_508262d4.itemuimodel, "hasAttachments"), 0);
                }
            }
            function_deddbdf0(localclientnum, var_a4250c2b);
            function_ce628f27(localclientnum);
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x571bacd2, Offset: 0x6e38
// Size: 0x4be
function private function_8bb02a48(localclientnum) {
    data = item_world::function_a7e98a1a(localclientnum);
    if (!isdefined(data)) {
        return;
    }
    var_b8f1b496 = data.inventory.items[12];
    var_7007b688 = [];
    if (isdefined(var_b8f1b496.var_a6762160)) {
        var_7007b688 = item_world_util::function_4cbb6617(data.inventory, #"equipment", array(#"frag_grenade_wz_item", #"cluster_semtex_wz_item", #"acid_bomb_wz_item", #"molotov_wz_item", #"wraithfire_wz_item", #"hatchet_wz_item", #"tomahawk_t8_wz_item", #"seeker_mine_wz_item", #"dart_wz_item", #"hawk_wz_item", #"ultimate_turret_wz_item", #"swat_grenade_wz_item", #"concussion_wz_item", #"smoke_grenade_wz_item", #"smoke_grenade_wz_item_spring_holiday", #"emp_grenade_wz_item", #"spectre_grenade_wz_item", #"grapple_wz_item", #"unlimited_grapple_wz_item", #"barricade_wz_item", #"spiked_barrier_wz_item", #"trophy_system_wz_item", #"concertina_wire_wz_item", #"sensor_dart_wz_item", #"supply_pod_wz_item", #"trip_wire_wz_item", #"cymbal_monkey_wz_item", #"homunculus_wz_item", #"vision_pulse_wz_item", #"flare_gun_wz_item", #"flare_gun_veh_wz_item", #"wz_snowball", #"wz_waterballoon"), var_b8f1b496.var_a6762160);
    }
    for (index = 0; index < var_7007b688.size && index < 2; index++) {
        equipmentitem = data.inventory.equipmentitems[index];
        inventoryitem = var_7007b688[index];
        function_1a99656a(localclientnum, equipmentitem, inventoryitem.networkid, inventoryitem.id, inventoryitem.count, function_bba770de(localclientnum, inventoryitem.var_a6762160), inventoryitem.availableaction, undefined, 1);
        setuimodelvalue(createuimodel(equipmentitem.itemuimodel, "cycle"), 1);
        forcenotifyuimodel(createuimodel(equipmentitem.itemuimodel, "totalCount"));
    }
    for (index = var_7007b688.size; index < 2; index++) {
        equipmentitem = data.inventory.equipmentitems[index];
        function_1a99656a(localclientnum, equipmentitem, 32767, 32767, 0, 0, 0, undefined, 1);
        setuimodelvalue(createuimodel(equipmentitem.itemuimodel, "cycle"), 0);
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0xb9239457, Offset: 0x7300
// Size: 0x2ee
function private function_5c2fff73(localclientnum) {
    data = item_world::function_a7e98a1a(localclientnum);
    if (!isdefined(data)) {
        return;
    }
    var_765bac06 = data.inventory.items[10];
    var_7007b688 = [];
    if (isdefined(var_765bac06.var_a6762160)) {
        var_7007b688 = item_world_util::function_4cbb6617(data.inventory, #"health", array(#"health_item_small", #"health_item_medium", #"health_item_large", #"health_item_squad"), var_765bac06.var_a6762160);
    }
    for (index = 0; index < var_7007b688.size && index < 2; index++) {
        healthitem = data.inventory.healthitems[index];
        inventoryitem = var_7007b688[index];
        function_1a99656a(localclientnum, healthitem, inventoryitem.networkid, inventoryitem.id, inventoryitem.count, function_bba770de(localclientnum, inventoryitem.var_a6762160), inventoryitem.availableaction, undefined, 1);
        setuimodelvalue(createuimodel(healthitem.itemuimodel, "cycle"), 1);
        forcenotifyuimodel(createuimodel(healthitem.itemuimodel, "totalCount"));
    }
    for (index = var_7007b688.size; index < 2; index++) {
        healthitem = data.inventory.healthitems[index];
        function_1a99656a(localclientnum, healthitem, 32767, 32767, 0, 0, 0, undefined, 1);
        setuimodelvalue(createuimodel(healthitem.itemuimodel, "cycle"), 0);
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0xc05aceef, Offset: 0x75f8
// Size: 0x644
function private function_442857e2(localclientnum, var_a6762160) {
    if (!isdefined(var_a6762160)) {
        return;
    }
    if (var_a6762160.itemtype !== #"equipment" && var_a6762160.itemtype !== #"generic" && var_a6762160.itemtype !== #"health" && var_a6762160.itemtype !== #"killstreak" && var_a6762160.itemtype !== #"attachment" && var_a6762160.itemtype !== #"armor_shard") {
        return;
    }
    data = item_world::function_a7e98a1a(localclientnum);
    if (!isdefined(data)) {
        return;
    }
    var_6962e967 = 0;
    if (var_a6762160.itemtype == #"attachment") {
        player = function_27673a7(localclientnum);
        var_a4250c2b = player function_d768ea30(localclientnum);
        if (isdefined(var_a4250c2b)) {
            var_55022c4f = array(1, 2, 3, 4, 5, 6);
            for (attachmentindex = 0; attachmentindex < var_55022c4f.size; attachmentindex++) {
                var_259f58f3 = var_55022c4f[attachmentindex];
                var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_a4250c2b, var_259f58f3);
                inventoryitem = data.inventory.items[var_f9f8c0b5];
                if (inventoryitem.networkid != 32767 && namespace_a0d533d1::function_73593286(var_a6762160, inventoryitem.var_a6762160)) {
                    var_6962e967 = 1;
                    break;
                }
            }
        }
    } else if (var_a6762160.itemtype == #"armor_shard") {
        inventoryitem = data.inventory.items[16];
    } else {
        foreach (slot in array(10, 11, 12, 13, 16 + 1, 16 + 1 + 6 + 1)) {
            inventoryitem = data.inventory.items[slot];
            if (inventoryitem.networkid != 32767 && namespace_a0d533d1::function_73593286(var_a6762160, inventoryitem.var_a6762160)) {
                var_6962e967 = 1;
                break;
            }
        }
    }
    totalcount = function_bba770de(localclientnum, var_a6762160);
    if (var_a6762160.itemtype == #"armor_shard") {
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quickEquip"), totalcount > 0);
    } else {
        var_6d4bb070 = 0;
        for (index = 0; index < 10; index++) {
            inventoryitem = data.inventory.items[index];
            if (inventoryitem.networkid == 32767 || !namespace_a0d533d1::function_73593286(var_a6762160, inventoryitem.var_a6762160)) {
                continue;
            }
            if (var_6962e967 || var_6d4bb070 || isdefined(inventoryitem.endtime)) {
                setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quickEquip"), 0);
                inventoryitem.quickequip = 0;
            } else if (!var_6d4bb070) {
                setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quickEquip"), 1);
                inventoryitem.quickequip = 1;
                var_6d4bb070 = 1;
            }
            setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "totalCount"), totalcount);
        }
    }
    if (var_a6762160.itemtype === #"health") {
        function_5c2fff73(localclientnum);
    } else if (var_a6762160.itemtype === #"equipment") {
        function_8bb02a48(localclientnum);
    }
}

// Namespace item_inventory/item_inventory
// Params 3, eflags: 0x5 linked
// Checksum 0xb6a69205, Offset: 0x7c48
// Size: 0x5ac
function private function_39b663b7(localclientnum, inventoryitem, item) {
    var_409a5960 = createuimodel(getuimodelforcontroller(localclientnum), "questInfo");
    itemindex = getitemindexfromref(item.var_a6762160.unlockableitemref);
    if (itemindex !== 0) {
        var_10d25c94 = createuimodel(var_409a5960, itemindex);
        if (!isdefined(getuimodel(var_10d25c94, "completed"))) {
            setuimodelvalue(createuimodel(var_10d25c94, "completed"), 0);
        }
        for (i = 0; i < 5; i++) {
            description = undefined;
            objectivemodel = createuimodel(var_10d25c94, "objective" + i + 1);
            if (!isdefined(objectivemodel)) {
                continue;
            }
            if (!isdefined(getuimodel(objectivemodel, "state"))) {
                setuimodelvalue(createuimodel(objectivemodel, "state"), 0);
            }
            if (isdefined(item.var_a6762160.objectives[i])) {
                if (isdefined(item.var_a6762160.objectives[i].teamsizedescriptions) && item.var_a6762160.objectives[i].teamsizedescriptions.size > 0) {
                    numplayers = getgametypesetting("maxTeamPlayers");
                    foreach (objectivestruct in item.var_a6762160.objectives[i].teamsizedescriptions) {
                        if (objectivestruct.teamsize == numplayers) {
                            description = objectivestruct.description;
                            break;
                        }
                    }
                }
                if (!isdefined(description)) {
                    description = item.var_a6762160.objectives[i].description;
                }
                var_2571317b = 0;
                if (isdefined(item.var_a6762160.objectives[i].var_7e835304)) {
                    var_2571317b = setuimodelvalue(createuimodel(objectivemodel, "unlockProgress"), stats::get_stat_global(localclientnum, item.var_a6762160.objectives[i].var_7e835304));
                } else {
                    setuimodelvalue(createuimodel(objectivemodel, "unlockProgress"), -1);
                }
                if (!setuimodelvalue(createuimodel(objectivemodel, "description"), description) && var_2571317b) {
                    forcenotifyuimodel(createuimodel(objectivemodel, "description"));
                }
            } else {
                setuimodelvalue(createuimodel(objectivemodel, "unlockProgress"), -1);
                setuimodelvalue(createuimodel(objectivemodel, "description"), #"");
            }
        }
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "unlockableItemRef"), item.var_a6762160.unlockableitemref);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quote"), item.var_a6762160.var_e8b98a8a);
        setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "rewardName"), item.var_a6762160.rewardname);
    }
}

// Namespace item_inventory/item_inventory
// Params 3, eflags: 0x5 linked
// Checksum 0x57bcc2d, Offset: 0x8200
// Size: 0x684
function private function_cb7cfe5b(localclientnum, var_a4250c2b, var_ac517de7) {
    if (var_ac517de7.networkid === 32767 || !isdefined(var_ac517de7.var_a6762160) || var_ac517de7.var_a6762160.itemtype !== #"attachment") {
        return;
    }
    if (!isdefined(var_a4250c2b)) {
        setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "availableAction"), 0);
        setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "notAvailable"), 1);
        return;
    }
    data = item_world::function_a7e98a1a(localclientnum);
    var_ac044d12 = undefined;
    var_fdc9fcff = undefined;
    var_ffd2f6e4 = undefined;
    var_ac044d12 = data.inventory.items[var_a4250c2b];
    var_fdc9fcff = var_a4250c2b == 16 + 1 ? 16 + 1 + 6 + 1 : 16 + 1;
    var_ffd2f6e4 = data.inventory.items[var_fdc9fcff];
    noweapon = !isdefined(var_ac044d12) || var_ac044d12.networkid === 32767 || !isdefined(var_ac044d12.var_a6762160) || var_ac044d12.var_a6762160.itemtype !== #"weapon";
    var_cdef462d = !isdefined(var_ffd2f6e4) || var_ffd2f6e4.networkid === 32767 || !isdefined(var_ffd2f6e4.var_a6762160) || var_ffd2f6e4.var_a6762160.itemtype !== #"weapon";
    if (noweapon) {
        setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "availableAction"), 0);
        setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "notAvailable"), 1);
        if (var_cdef462d) {
            setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "stowedAvailableAction"), 0);
            return;
        }
    }
    var_ceefbd10 = namespace_a0d533d1::function_837f4a57(var_ac517de7.var_a6762160);
    if (isdefined(namespace_a0d533d1::function_2ced1d34(var_ac044d12, var_ac517de7.var_a6762160))) {
        var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_a4250c2b, var_ceefbd10);
        if (data.inventory.items[var_f9f8c0b5].networkid !== 32767) {
            setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "availableAction"), 3);
        } else {
            setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "availableAction"), 2);
        }
        setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "notAvailable"), 0);
        function_442857e2(localclientnum, var_ac517de7.var_a6762160);
    } else {
        setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "availableAction"), 0);
        setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "notAvailable"), 1);
    }
    if (var_cdef462d) {
        setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "stowedAvailableAction"), 0);
        return;
    }
    if (isdefined(namespace_a0d533d1::function_2ced1d34(var_ffd2f6e4, var_ac517de7.var_a6762160))) {
        var_50f8a92d = namespace_a0d533d1::function_dfaca25e(var_fdc9fcff, var_ceefbd10);
        if (data.inventory.items[var_50f8a92d].networkid !== 32767) {
            setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "stowedAvailableAction"), 3);
        } else {
            setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "stowedAvailableAction"), 2);
        }
    } else {
        setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "stowedAvailableAction"), 0);
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0x9db5ed77, Offset: 0x8890
// Size: 0xae
function private function_deddbdf0(localclientnum, var_f7956021) {
    data = item_world::function_a7e98a1a(localclientnum);
    for (itemindex = 0; itemindex < data.inventory.var_c212de25; itemindex++) {
        inventoryitem = data.inventory.items[itemindex];
        function_cb7cfe5b(localclientnum, var_f7956021, inventoryitem);
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x6f8eb1a9, Offset: 0x8948
// Size: 0x40c
function private function_ce628f27(localclientnum) {
    data = item_world::function_a7e98a1a(localclientnum);
    foreach (var_a4250c2b in array(16 + 1, 16 + 1 + 6 + 1)) {
        var_ac044d12 = data.inventory.items[var_a4250c2b];
        var_fdc9fcff = var_a4250c2b == 16 + 1 ? 16 + 1 + 6 + 1 : 16 + 1;
        var_ffd2f6e4 = data.inventory.items[var_fdc9fcff];
        foreach (var_259f58f3 in array(1, 2, 3, 4, 5, 6)) {
            var_f9f8c0b5 = var_a4250c2b + var_259f58f3;
            var_50f8a92d = var_fdc9fcff + var_259f58f3;
            var_ac517de7 = data.inventory.items[var_f9f8c0b5];
            var_3c2da577 = data.inventory.items[var_50f8a92d];
            if (var_ac517de7.networkid === 32767 || !isdefined(var_ac517de7.var_a6762160)) {
                continue;
            }
            if (var_3c2da577.networkid === 32767 || !isdefined(var_3c2da577.var_a6762160)) {
                if (isdefined(var_ffd2f6e4) && isdefined(var_ffd2f6e4.var_a6762160) && isdefined(namespace_a0d533d1::function_2ced1d34(var_ffd2f6e4, var_ac517de7.var_a6762160))) {
                    setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "canTransferAttachment"), 2);
                    continue;
                }
                setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "canTransferAttachment"), 0);
            } else if (isdefined(namespace_a0d533d1::function_2ced1d34(var_ffd2f6e4, var_ac517de7.var_a6762160)) && isdefined(namespace_a0d533d1::function_2ced1d34(var_ac044d12, var_3c2da577.var_a6762160))) {
                setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "canTransferAttachment"), 3);
            } else {
                setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "canTransferAttachment"), 0);
            }
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0xe536ed02, Offset: 0x8d60
// Size: 0x60
function is_inventory_item(localclientnum, var_a6762160) {
    data = item_world::function_a7e98a1a(localclientnum);
    if (var_a6762160.itemtype == #"ammo") {
        return 0;
    }
    return 1;
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0x6c57826d, Offset: 0x8dc8
// Size: 0x2c
function private function_a4a6f064(localclientnum, var_a6762160) {
    return isdefined(function_daf3ebda(localclientnum, var_a6762160));
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x9b62b8ae, Offset: 0x8e00
// Size: 0x348
function function_daf3ebda(localclientnum, var_a6762160) {
    if (!(isdefined(var_a6762160.stackable) && var_a6762160.stackable)) {
        return undefined;
    }
    data = item_world::function_a7e98a1a(localclientnum);
    maxstack = namespace_a0d533d1::function_cfa794ca(data.inventory.var_7658cbec, var_a6762160);
    if (maxstack <= 1) {
        return undefined;
    }
    clientdata = item_world::function_a7e98a1a(localclientnum);
    if (var_a6762160.itemtype == #"resource") {
        if (item_world_util::function_41f06d9d(var_a6762160) && clientdata.inventory.items[14].count < maxstack) {
            return 14;
        }
        var_ee79c3a4 = clientdata.inventory.items[15];
        if (!isdefined(var_ee79c3a4.id) || var_ee79c3a4.id == 32767) {
            return 15;
        }
        if (var_ee79c3a4.var_a6762160.name !== var_a6762160.name) {
            return undefined;
        }
        if (var_ee79c3a4.count < maxstack) {
            return 15;
        }
        return undefined;
    }
    if (var_a6762160.itemtype == #"armor_shard") {
        if (clientdata.inventory.items[16].count < maxstack) {
            return 16;
        }
        return undefined;
    }
    for (i = 0; i < clientdata.inventory.items.size; i++) {
        if (!isdefined(clientdata.inventory.items[i].id) || clientdata.inventory.items[i].id == 32767) {
            continue;
        }
        inventoryitem = function_b1702735(clientdata.inventory.items[i].id);
        if (!isdefined(inventoryitem) || !isdefined(inventoryitem.var_a6762160)) {
            continue;
        }
        if (inventoryitem.var_a6762160.name !== var_a6762160.name) {
            continue;
        }
        if (clientdata.inventory.items[i].count < maxstack) {
            return i;
        }
    }
    return undefined;
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0xe65add8b, Offset: 0x9150
// Size: 0x23e
function private function_3e624606(localclientnum) {
    self endon(#"shutdown", #"death");
    self notify("3260d2bc5ad24d7b");
    self endon("3260d2bc5ad24d7b");
    clientdata = item_world::function_a7e98a1a(localclientnum);
    var_99fe8c78 = "multi_item_pickup" + localclientnum;
    var_dab12fb1 = "multi_item_pickup_stowed_weapon" + localclientnum;
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(var_99fe8c78, var_dab12fb1);
        if (self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2) {
            networkid = waitresult.id;
            index = item_world::function_73436347(clientdata.groupitems, networkid);
            itemid = item_world::function_28b42f1c(localclientnum, networkid);
            if (itemid == 32767) {
                continue;
            }
            if (isdefined(index)) {
                item = function_b1702735(itemid);
                if (!function_ad4c6116(localclientnum, item.var_a6762160)) {
                    continue;
                }
                if (waitresult._notify === var_dab12fb1) {
                    function_97fedb0d(localclientnum, 12, networkid);
                } else {
                    function_97fedb0d(localclientnum, 3, networkid);
                }
                function_7f056944(localclientnum, index);
                if (!is_inventory_item(localclientnum, item.var_a6762160)) {
                    continue;
                }
            }
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0xffe25392, Offset: 0x9398
// Size: 0x182
function private function_30697356(localclientnum, var_a6762160) {
    if (!isdefined(var_a6762160)) {
        return 0;
    }
    if (var_a6762160.itemtype === #"armor_shard") {
        return 6;
    }
    if (isdefined(var_a6762160.consumable) && var_a6762160.consumable) {
        return 4;
    }
    if (var_a6762160.itemtype === #"generic") {
        return 0;
    }
    if (var_a6762160.itemtype === #"cash") {
        return 0;
    }
    if (var_a6762160.itemtype === #"killstreak") {
        return 4;
    }
    if (var_a6762160.itemtype === #"armor") {
        return 0;
    }
    if (var_a6762160.itemtype === #"ammo") {
        return 0;
    }
    if (var_a6762160.itemtype == #"weapon") {
        return 0;
    }
    if (var_a6762160.itemtype == #"quest") {
        return 0;
    }
    if (var_a6762160.itemtype === #"attachment") {
        return 2;
    }
    return 1;
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0xafc87175, Offset: 0x9528
// Size: 0x256
function function_ad4c6116(localclientnum, var_a6762160) {
    if (var_a6762160.itemtype == #"weapon") {
        return 1;
    }
    if (!is_inventory_item(localclientnum, var_a6762160)) {
        return 1;
    }
    if (var_a6762160.itemtype == #"resource") {
        if (item_world_util::function_41f06d9d(var_a6762160)) {
            return !function_88da0c8e(localclientnum);
        }
    }
    if (var_a6762160.itemtype == #"armor") {
        return 1;
    }
    if (var_a6762160.itemtype == #"attachment") {
        slotid = function_1415f8f1(localclientnum, var_a6762160);
        if (isdefined(slotid)) {
            return 1;
        }
    }
    if (function_a243ddd6(localclientnum, var_a6762160)) {
        return 1;
    }
    if (function_a4a6f064(localclientnum, var_a6762160)) {
        return 1;
    }
    if (var_a6762160.itemtype == #"armor_shard") {
        return 0;
    }
    data = item_world::function_a7e98a1a(localclientnum);
    if (var_a6762160.itemtype == #"resource") {
        if (data.inventory.items[15].networkid === 32767) {
            return 1;
        }
        return 0;
    }
    for (i = 0; i < data.inventory.var_c212de25; i++) {
        if (data.inventory.items[i].networkid === 32767) {
            return 1;
        }
    }
    return 0;
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0xd292775d, Offset: 0x9788
// Size: 0x1ae
function function_a243ddd6(localclientnum, var_a6762160) {
    data = item_world::function_a7e98a1a(localclientnum);
    switch (var_a6762160.itemtype) {
    case #"attachment":
        slotid = function_1415f8f1(localclientnum, var_a6762160);
        if (!isdefined(slotid)) {
            return 0;
        }
        return (data.inventory.items[slotid].networkid == 32767);
    case #"armor":
        return (data.inventory.items[11].networkid == 32767);
    case #"backpack":
        return (data.inventory.items[13].networkid == 32767);
    case #"equipment":
        return (data.inventory.items[12].networkid == 32767);
    case #"health":
        return (data.inventory.items[10].networkid == 32767);
    case #"weapon":
        return (data.inventory.items[16 + 1].networkid == 32767 || data.inventory.items[16 + 1 + 6 + 1].networkid == 32767);
    case #"ammo":
    case #"generic":
    case #"killstreak":
    case #"cash":
    default:
        return 0;
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x1 linked
// Checksum 0x3d52ba44, Offset: 0x9a00
// Size: 0x154
function function_d768ea30(localclientnum) {
    /#
        assert(isplayer(self));
    #/
    var_b4322d52 = 0;
    currentweapon = isdefined(self.currentweapon) ? self.currentweapon : self.weapon;
    if (currentweapon == level.weaponbasemeleeheld) {
        data = item_world::function_a7e98a1a(localclientnum);
        return;
    }
    foreach (attachment in currentweapon.attachments) {
        if (attachment == #"null") {
            var_b4322d52 = 1;
            break;
        }
    }
    return var_b4322d52 ? 16 + 1 + 6 + 1 : 16 + 1;
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0xe2b3ebe6, Offset: 0x9b60
// Size: 0x20c
function function_78ed4455(localclientnum, var_a6762160) {
    /#
        assert(isplayer(self));
    #/
    data = item_world::function_a7e98a1a(localclientnum);
    switch (var_a6762160.itemtype) {
    case #"armor":
        return 11;
    case #"backpack":
        return 13;
    case #"equipment":
        if (data.inventory.items[12].networkid == 32767) {
            return 12;
        }
        break;
    case #"health":
        if (data.inventory.items[10].networkid == 32767) {
            return 10;
        }
        break;
    case #"weapon":
        if (data.inventory.items[16 + 1].networkid == 32767) {
            return (16 + 1);
        } else if (data.inventory.items[16 + 1 + 6 + 1].networkid == 32767) {
            return (16 + 1 + 6 + 1);
        }
        break;
    }
    if (var_a6762160.itemtype == #"attachment") {
        return function_1415f8f1(localclientnum, var_a6762160);
    }
}

// Namespace item_inventory/item_inventory
// Params 4, eflags: 0x1 linked
// Checksum 0x8535fe41, Offset: 0x9d78
// Size: 0x294
function function_9c4460e0(localclientnum, itemid, count = 1, slotid = undefined) {
    /#
        assert(isint(itemid));
    #/
    if (!isdefined(itemid)) {
        return;
    }
    point = function_b1702735(itemid);
    if (!isdefined(point)) {
        return;
    }
    var_a6762160 = point.var_a6762160;
    availableaction = function_30697356(localclientnum, var_a6762160);
    data = item_world::function_a7e98a1a(localclientnum);
    selectedindex = undefined;
    if (count == 0) {
        return;
    }
    if (!isdefined(selectedindex) && isdefined(slotid)) {
        selectedindex = slotid;
    }
    if (!isdefined(selectedindex)) {
        selectedindex = item_world::function_73436347(data.inventory.items, 32767);
        if (!isdefined(selectedindex)) {
            /#
                println("castTime" + itemid + "none");
            #/
            return;
        }
    }
    player = function_27673a7(localclientnum);
    networkid = item_world_util::function_970b8d86(player, selectedindex);
    inventoryitem = undefined;
    if (selectedindex < data.inventory.items.size) {
        inventoryitem = data.inventory.items[selectedindex];
    }
    /#
        assert(isdefined(inventoryitem));
    #/
    totalcount = function_bba770de(localclientnum, var_a6762160);
    totalcount = totalcount + count;
    player function_1a99656a(localclientnum, inventoryitem, networkid, itemid, count, totalcount, availableaction);
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x590ece32, Offset: 0xa018
// Size: 0x184
function function_1415f8f1(localclientnum, var_a6762160) {
    /#
        assert(isplayer(self));
    #/
    data = item_world::function_a7e98a1a(localclientnum);
    if (var_a6762160.itemtype == #"attachment") {
        var_4838b749 = function_d768ea30(localclientnum);
        if (!isdefined(var_4838b749)) {
            return;
        }
        var_f0dc4e93 = item_world_util::function_970b8d86(self, var_4838b749);
        if (data.inventory.items[var_4838b749].networkid == 32767) {
            return;
        }
        var_ceefbd10 = namespace_a0d533d1::function_837f4a57(var_a6762160);
        var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_ceefbd10);
        weaponitem = self function_15d578f4(localclientnum, var_f0dc4e93);
        attachmentname = namespace_a0d533d1::function_2ced1d34(weaponitem, var_a6762160);
        if (isdefined(attachmentname)) {
            return var_f9f8c0b5;
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x3a105ed8, Offset: 0xa1a8
// Size: 0x18a
function function_bba770de(localclientnum, var_a6762160) {
    data = item_world::function_a7e98a1a(localclientnum);
    count = 0;
    if (!isdefined(var_a6762160)) {
        return count;
    }
    name = isdefined(var_a6762160.parentname) ? var_a6762160.parentname : var_a6762160.name;
    for (index = 0; index < data.inventory.items.size && index < 16 + 1; index++) {
        inventoryitem = data.inventory.items[index];
        if (!isdefined(inventoryitem.var_a6762160) || isdefined(inventoryitem.endtime)) {
            continue;
        }
        if (name == (isdefined(inventoryitem.var_a6762160.parentname) ? inventoryitem.var_a6762160.parentname : inventoryitem.var_a6762160.name)) {
            count = count + inventoryitem.count;
        }
    }
    return count;
}

// Namespace item_inventory/item_inventory
// Params 3, eflags: 0x1 linked
// Checksum 0x5df81870, Offset: 0xa340
// Size: 0x186
function can_pickup_ammo(localclientnum, item, var_1326fcc7 = undefined) {
    /#
        assert(isplayer(self));
    #/
    data = item_world::function_a7e98a1a(localclientnum);
    var_a6762160 = item.var_a6762160;
    ammoweapon = var_a6762160.weapon;
    var_1326fcc7 = isdefined(var_a6762160.amount) ? var_a6762160.amount : isdefined(var_1326fcc7) ? var_1326fcc7 : 1;
    var_2f399b51 = namespace_a0d533d1::function_2879cbe0(data.inventory.var_7658cbec, ammoweapon);
    currentammostock = self getweaponammostock(localclientnum, ammoweapon);
    var_9b9ba643 = var_2f399b51 - currentammostock;
    addammo = int(min(var_1326fcc7, var_9b9ba643));
    return addammo > 0;
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x5 linked
// Checksum 0x719e41fb, Offset: 0xa4d0
// Size: 0xe2
function private function_85645978(data, item) {
    currtime = gettime();
    foreach (consumeditem in data.inventory.consumed.items) {
        if (item.var_a6762160.name == consumeditem.var_a6762160.name && currtime < consumeditem.endtime) {
            return consumeditem;
        }
    }
    return undefined;
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0xc989f842, Offset: 0xa5c0
// Size: 0x136
function function_52e537be(localclientnum, networkid) {
    item = function_15d578f4(localclientnum, networkid);
    if (isdefined(item)) {
        setuimodelvalue(createuimodel(item.itemuimodel, "castTimeFraction"), 0, 0);
    }
    data = item_world::function_a7e98a1a(localclientnum);
    if (isdefined(data) && isdefined(data.inventory) && networkid === data.inventory.var_4d4ec560) {
        setuimodelvalue(data.inventory.consumed.var_a25538fb, function_3fe6ef04(localclientnum));
        data.inventory.var_4d4ec560 = undefined;
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x28255535, Offset: 0xa700
// Size: 0x56c
function consume_item(localclientnum, networkid) {
    /#
        assert(networkid != 32767);
    #/
    if (networkid == 32767) {
        return;
    }
    data = item_world::function_a7e98a1a(localclientnum);
    item = function_15d578f4(localclientnum, networkid);
    if (!isdefined(item) || !isdefined(item.var_a6762160)) {
        return;
    }
    duration = int((isdefined(item.var_a6762160.duration) ? item.var_a6762160.duration : 0) * 1000);
    starttime = gettime();
    endtime = starttime + duration;
    item.starttime = starttime;
    item.endtime = endtime;
    totalcount = function_bba770de(localclientnum, item.var_a6762160);
    function_1a99656a(localclientnum, item, networkid, item.id, 1, totalcount, 5, 0);
    var_3285d88f = data.inventory.consumed.items.size;
    var_cfa0e915 = [];
    foreach (consumeditem in data.inventory.consumed.items) {
        if (isdefined(var_cfa0e915[consumeditem.var_a6762160.name])) {
            continue;
        }
        var_cfa0e915[consumeditem.var_a6762160.name] = 1;
    }
    consumeditem = function_85645978(data, item);
    if (isdefined(consumeditem)) {
        consumeditem.endtime = consumeditem.endtime + duration;
        for (index = 0; index < 10; index++) {
            inventoryitem = data.inventory.items[index];
            if (!isdefined(inventoryitem.endtime)) {
                continue;
            }
            if (inventoryitem.var_a6762160.name == item.var_a6762160.name) {
                inventoryitem.starttime = consumeditem.starttime;
                inventoryitem.endtime = consumeditem.endtime;
            }
        }
    } else {
        consumeditem = spawnstruct();
        consumeditem.id = item.id;
        consumeditem.var_a6762160 = item.var_a6762160;
        consumeditem.itemuimodel = createuimodel(data.inventory.consumed.uimodel, "item" + var_cfa0e915.size);
        consumeditem.starttime = gettime();
        consumeditem.endtime = consumeditem.starttime + duration;
        var_cfa0e915[consumeditem.var_a6762160.name] = 1;
    }
    data.inventory.consumed.items[var_3285d88f] = consumeditem;
    var_31c78e6f = consumeditem.var_a6762160;
    function_1a99656a(localclientnum, consumeditem, 32767, 32767, 0, 0, 0, 0);
    function_1a99656a(localclientnum, consumeditem, networkid, item.id, 0, 0, 0, 0);
    setuimodelvalue(data.inventory.consumed.var_a25538fb, var_cfa0e915.size);
    function_442857e2(localclientnum, var_31c78e6f);
    level thread function_451ebd83(localclientnum, consumeditem.var_a6762160, networkid);
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0xc6e47b53, Offset: 0xac78
// Size: 0x2bc
function function_de74158f(localclientnum, networkid) {
    /#
        assert(networkid != 32767);
    #/
    if (networkid == 32767) {
        return;
    }
    data = item_world::function_a7e98a1a(localclientnum);
    item = function_15d578f4(localclientnum, networkid);
    if (!isdefined(item)) {
        return;
    }
    var_cfa0e915 = [];
    foreach (consumeditem in data.inventory.consumed.items) {
        if (isdefined(var_cfa0e915[consumeditem.var_a6762160.name])) {
            continue;
        }
        var_cfa0e915[consumeditem.var_a6762160.name] = 1;
    }
    consumeditem = spawnstruct();
    consumeditem.id = item.id;
    consumeditem.var_a6762160 = item.var_a6762160;
    consumeditem.itemuimodel = createuimodel(data.inventory.consumed.uimodel, "item" + var_cfa0e915.size);
    var_cfa0e915[consumeditem.var_a6762160.name] = 1;
    function_1a99656a(localclientnum, consumeditem, 32767, 32767, 0, 0, 0, 0);
    function_1a99656a(localclientnum, consumeditem, networkid, item.id, 0, 0, 0, 0);
    setuimodelvalue(data.inventory.consumed.var_a25538fb, var_cfa0e915.size);
    level thread function_451ebd83(localclientnum, item.var_a6762160, undefined);
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x3d52104f, Offset: 0xaf40
// Size: 0x94
function function_7f056944(localclientnum, index) {
    var_6e2c91d0 = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.multiItemPickup");
    setuimodelvalue(createuimodel(var_6e2c91d0, "item" + index + ".disabled"), 1);
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x26af18c0, Offset: 0xafe0
// Size: 0x142
function function_3bd1836f(localclientnum, networkid) {
    if (networkid == item_world_util::function_970b8d86(function_27673a7(localclientnum), 13)) {
        give_backpack(localclientnum, networkid);
        return;
    }
    data = item_world::function_a7e98a1a(localclientnum);
    foreach (inventoryitem in data.inventory.items) {
        if (inventoryitem.networkid === networkid) {
            function_8063170(inventoryitem, 1);
            playsound(localclientnum, #"hash_4d31bd9927d823c3");
            return;
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0xc2e9f35c, Offset: 0xb130
// Size: 0x224
function give_backpack(localclientnum, networkid) {
    data = item_world::function_a7e98a1a(localclientnum);
    if (!isdefined(data)) {
        return;
    }
    item = function_15d578f4(localclientnum, networkid);
    if (!isdefined(item)) {
        waittillframeend();
        item = function_15d578f4(localclientnum, networkid);
        if (!isdefined(item)) {
            return;
        }
    }
    data.inventory.var_7658cbec = namespace_a0d533d1::function_d8cebda3(item.var_a6762160);
    if (data.inventory.var_7658cbec & 1 && data.inventory.var_c212de25 != 10) {
        for (index = data.inventory.var_c212de25; index < 10; index++) {
            inventoryitem = data.inventory.items[index];
            setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "disabled"), 0);
        }
        data.inventory.var_c212de25 = 10;
        inventoryuimodel = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory");
        setuimodelvalue(createuimodel(inventoryuimodel, "count"), data.inventory.var_c212de25);
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x2b881ed5, Offset: 0xb360
// Size: 0x108
function function_15d578f4(localclientnum, networkid) {
    /#
        assert(isdefined(localclientnum));
    #/
    /#
        assert(item_world_util::function_d9648161(networkid));
    #/
    data = item_world::function_a7e98a1a(localclientnum);
    /#
        assert(isdefined(data));
    #/
    for (index = 0; index < data.inventory.items.size; index++) {
        inventoryitem = data.inventory.items[index];
        if (inventoryitem.networkid === networkid) {
            return inventoryitem;
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0xda3b54e1, Offset: 0xb470
// Size: 0x50
function function_c48cd17f(localclientnum, networkid) {
    item = function_15d578f4(localclientnum, networkid);
    if (isdefined(item)) {
        return item.id;
    }
    return 32767;
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x26a347d1, Offset: 0xb4c8
// Size: 0x134
function has_attachments(localclientnum, var_4838b749) {
    /#
        assert(isdefined(localclientnum));
    #/
    if (!isdefined(var_4838b749)) {
        return 0;
    }
    data = item_world::function_a7e98a1a(localclientnum);
    foreach (var_259f58f3 in array(1, 2, 3, 4, 5, 6)) {
        slotid = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_259f58f3);
        if (data.inventory.items[slotid].networkid != 32767) {
            return 1;
        }
    }
    return 0;
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x1 linked
// Checksum 0x307ff005, Offset: 0xb608
// Size: 0xcbc
function inventory_init(localclientnum) {
    data = item_world::function_a7e98a1a(localclientnum);
    inventoryuimodel = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory");
    pickedupammotypes = createuimodel(inventoryuimodel, "pickedUpAmmoTypes");
    setuimodelvalue(createuimodel(pickedupammotypes, "count"), 0);
    data.inventory = spawnstruct();
    data.inventory.consumed = {};
    data.inventory.consumed.items = [];
    data.inventory.count = 16 + 1 + 6 + 1 + 6 + 1;
    data.inventory.items = [];
    data.inventory.var_a7a2b773 = 0;
    data.inventory.var_c212de25 = 5;
    data.inventory.var_7658cbec = 0;
    if (ispc()) {
        data.inventory.var_f3518190 = undefined;
        data.inventory.var_4d4ec560 = undefined;
    }
    for (index = 0; index < data.inventory.count; index++) {
        data.inventory.items[index] = spawnstruct();
    }
    for (index = 0; index < 5; index++) {
        data.inventory.items[index].itemuimodel = createuimodel(inventoryuimodel, "item" + index);
        setuimodelvalue(createuimodel(data.inventory.items[index].itemuimodel, "backpackSlot"), 0);
        setuimodelvalue(createuimodel(data.inventory.items[index].itemuimodel, "disabled"), 0);
    }
    for (index = 5; index < 10; index++) {
        data.inventory.items[index].itemuimodel = createuimodel(inventoryuimodel, "item" + index);
        setuimodelvalue(createuimodel(data.inventory.items[index].itemuimodel, "backpackSlot"), 1);
        setuimodelvalue(createuimodel(data.inventory.items[index].itemuimodel, "disabled"), 1);
    }
    data.inventory.items[10].itemuimodel = createuimodel(inventoryuimodel, "health");
    data.inventory.items[11].itemuimodel = createuimodel(inventoryuimodel, "gear");
    data.inventory.items[13].itemuimodel = createuimodel(inventoryuimodel, "storage");
    data.inventory.items[12].itemuimodel = createuimodel(inventoryuimodel, "equipment");
    data.inventory.items[14].itemuimodel = createuimodel(inventoryuimodel, "resource0");
    data.inventory.items[15].itemuimodel = createuimodel(inventoryuimodel, "resource1");
    data.inventory.items[16].itemuimodel = createuimodel(inventoryuimodel, "shard0");
    weaponslots = array(16 + 1, 16 + 1 + 6 + 1);
    for (index = 0; index < weaponslots.size; index++) {
        var_4838b749 = weaponslots[index];
        data.inventory.items[var_4838b749].itemuimodel = createuimodel(inventoryuimodel, "weapon" + index);
        var_55022c4f = array(1, 2, 3, 4, 5, 6);
        for (attachmentindex = 0; attachmentindex < var_55022c4f.size; attachmentindex++) {
            var_259f58f3 = var_55022c4f[attachmentindex];
            var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_259f58f3);
            uimodelindex = attachmentindex + index * var_55022c4f.size;
            data.inventory.items[var_f9f8c0b5].itemuimodel = createuimodel(inventoryuimodel, "attachment" + uimodelindex);
        }
    }
    for (index = 0; index < data.inventory.items.size; index++) {
        if (!isdefined(data.inventory.items[index].itemuimodel)) {
            continue;
        }
        function_1a99656a(localclientnum, data.inventory.items[index], 32767, 32767, 0, 0, 0);
    }
    data.inventory.healthitems = [];
    for (index = 0; index < 2; index++) {
        data.inventory.healthitems[index] = spawnstruct();
        data.inventory.healthitems[index].itemuimodel = createuimodel(inventoryuimodel, "health" + index);
        function_1a99656a(localclientnum, data.inventory.healthitems[index], 32767, 32767, 0, 0, 0);
    }
    data.inventory.equipmentitems = [];
    for (index = 0; index < 2; index++) {
        data.inventory.equipmentitems[index] = spawnstruct();
        data.inventory.equipmentitems[index].itemuimodel = createuimodel(inventoryuimodel, "equipment" + index);
        function_1a99656a(localclientnum, data.inventory.equipmentitems[index], 32767, 32767, 0, 0, 0);
    }
    setuimodelvalue(createuimodel(inventoryuimodel, "count"), 5);
    setuimodelvalue(createuimodel(inventoryuimodel, "filledSlots"), 0);
    setuimodelvalue(createuimodel(inventoryuimodel, "attachmentCount"), 6);
    setuimodelvalue(createuimodel(inventoryuimodel, "resourceCount"), 1);
    setuimodelvalue(createuimodel(inventoryuimodel, "shardCount"), 1);
    setuimodelvalue(createuimodel(inventoryuimodel, "canUseQuickInventory"), 0);
    if (function_88da0c8e(localclientnum)) {
        setuimodelvalue(createuimodel(data.inventory.items[14].itemuimodel, "notAccessible"), 1);
    }
    data.inventory.consumed.uimodel = createuimodel(inventoryuimodel, "consumed");
    data.inventory.consumed.var_a25538fb = createuimodel(data.inventory.consumed.uimodel, "count");
    setuimodelvalue(data.inventory.consumed.var_a25538fb, 0);
    level thread function_dab42db1(localclientnum);
    level thread function_d7869556(localclientnum);
    level thread function_cf96d951(localclientnum);
    forcenotifyuimodel(createuimodel(inventoryuimodel, "initialize"));
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x1 linked
// Checksum 0x3bae278, Offset: 0xc2d0
// Size: 0x20c
function function_dab42db1(localclientnum) {
    level flagsys::wait_till(#"item_world_initialized");
    foreach (ammotype in array(#"ammo_type_9mm_item", #"ammo_type_45_item", #"ammo_type_556_item", #"ammo_type_762_item", #"ammo_type_338_item", #"ammo_type_50cal_item", #"ammo_type_12ga_item", #"ammo_type_rocket_item")) {
        point = function_4ba8fde(ammotype);
        if (isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"ammo") {
            function_4f16aa30(localclientnum, point.id);
        }
    }
    inventoryuimodel = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory");
    pickedupammotypes = createuimodel(inventoryuimodel, "pickedUpAmmoTypes");
    forcenotifyuimodel(pickedupammotypes);
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x1 linked
// Checksum 0x620b5233, Offset: 0xc4e8
// Size: 0x134
function function_cf96d951(localclientnum) {
    level flagsys::wait_till(#"item_world_initialized");
    data = item_world::function_a7e98a1a(localclientnum);
    point = function_4ba8fde(#"armor_shard_item");
    if (isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"armor_shard") {
        if (data.inventory.items[16].networkid == 32767) {
            function_1a99656a(localclientnum, data.inventory.items[16], point.networkid, point.id, 0, 0, 0);
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x1 linked
// Checksum 0xa451c122, Offset: 0xc628
// Size: 0x10c
function function_d7869556(localclientnum) {
    level flagsys::wait_till(#"item_world_initialized");
    data = item_world::function_a7e98a1a(localclientnum);
    point = function_4ba8fde(#"resource_item_paint");
    if (isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"resource") {
        function_1a99656a(localclientnum, data.inventory.items[14], point.networkid, point.id, 0, 0, 0);
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x5 linked
// Checksum 0x3b687e69, Offset: 0xc740
// Size: 0x466
function private function_534dcb9c(localclientnum) {
    if (!isdefined(level.var_af8f97c8) || !isdefined(level.var_af8f97c8[localclientnum])) {
        if (!isdefined(level.var_aa75d3e)) {
            level.var_aa75d3e = [];
        } else if (!isarray(level.var_aa75d3e)) {
            level.var_aa75d3e = array(level.var_aa75d3e);
        }
        if (!isdefined(level.var_af8f97c8)) {
            level.var_af8f97c8 = [];
        } else if (!isarray(level.var_af8f97c8)) {
            level.var_af8f97c8 = array(level.var_af8f97c8);
        }
        if (!isdefined(level.var_53cbbb33)) {
            level.var_53cbbb33 = [];
        } else if (!isarray(level.var_53cbbb33)) {
            level.var_53cbbb33 = array(level.var_53cbbb33);
        }
        if (!isdefined(level.var_3a0390dd)) {
            level.var_3a0390dd = [];
        } else if (!isarray(level.var_3a0390dd)) {
            level.var_3a0390dd = array(level.var_3a0390dd);
        }
        if (!isdefined(level.var_c8a5f79b)) {
            level.var_c8a5f79b = [];
        } else if (!isarray(level.var_c8a5f79b)) {
            level.var_c8a5f79b = array(level.var_c8a5f79b);
        }
        if (!isdefined(level.var_7086ad4f)) {
            level.var_7086ad4f = [];
        } else if (!isarray(level.var_7086ad4f)) {
            level.var_7086ad4f = array(level.var_7086ad4f);
        }
        level.var_aa75d3e[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.currentWeaponIndex");
        level.var_af8f97c8[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.currentWeapon");
        level.var_c8a5f79b[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.currentWeapon.ammoType");
        level.var_53cbbb33[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.currentWeapon.isOperator");
        level.var_3a0390dd[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.currentWeapon.isTactical");
        level.var_7086ad4f[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.showAttachments");
        level.var_6d21daaf[localclientnum] = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.canTransferFromStash");
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x1 linked
// Checksum 0xdaa38efe, Offset: 0xcbb0
// Size: 0x8ec
function function_6231c19(params) {
    if (params.weapon.name == #"none") {
        return;
    }
    if (isstruct(self)) {
        return;
    }
    if (!self function_da43934d() || !isplayer(self) || !isalive(self)) {
        return;
    }
    function_534dcb9c(params.localclientnum);
    if (isdefined(params.weapon)) {
        data = item_world::function_a7e98a1a(params.localclientnum);
        if (!isdefined(data) || !isdefined(data.inventory) || !isdefined(data.inventory.items) || data.inventory.items.size == 0) {
            return;
        }
        self.currentweapon = params.weapon;
        if (params.weapon == level.weaponbasemeleeheld) {
            setuimodelvalue(level.var_7086ad4f[params.localclientnum], 0);
            itemindex = getbaseweaponitemindex(getweapon(#"none"));
            foreach (index, slot in array(16 + 1, 16 + 1 + 6 + 1)) {
                if (data.inventory.items[slot].networkid == 32767) {
                    break;
                }
            }
            if (!isdefined(index)) {
                return;
            }
            setuimodelvalue(level.var_3a0390dd[params.localclientnum], 0);
            setuimodelvalue(level.var_53cbbb33[params.localclientnum], 0);
            if (!setuimodelvalue(level.var_aa75d3e[params.localclientnum], index)) {
                forcenotifyuimodel(level.var_aa75d3e[params.localclientnum]);
            }
            if (!setuimodelvalue(level.var_af8f97c8[params.localclientnum], itemindex)) {
                forcenotifyuimodel(level.var_af8f97c8[params.localclientnum]);
            }
            function_deddbdf0(params.localclientnum);
            function_ce628f27(params.localclientnum);
            return;
        }
        var_a4250c2b = self function_d768ea30(params.localclientnum);
        foreach (index, slot in array(16 + 1, 16 + 1 + 6 + 1)) {
            if (slot === var_a4250c2b) {
                if (!setuimodelvalue(level.var_aa75d3e[params.localclientnum], index)) {
                    forcenotifyuimodel(level.var_aa75d3e[params.localclientnum]);
                }
                break;
            }
        }
        networkid = item_world_util::function_970b8d86(self, var_a4250c2b);
        item = function_15d578f4(params.localclientnum, networkid);
        if (isdefined(item) && isdefined(item.var_a6762160) && isdefined(item.var_a6762160.var_340eac1f) && item.var_a6762160.var_340eac1f) {
            setuimodelvalue(level.var_53cbbb33[params.localclientnum], 0);
            setuimodelvalue(level.var_3a0390dd[params.localclientnum], 1);
        } else if (isdefined(item) && isdefined(item.var_a6762160) && isdefined(item.var_a6762160.var_dc6c5d3b) && item.var_a6762160.var_dc6c5d3b) {
            setuimodelvalue(level.var_3a0390dd[params.localclientnum], 0);
            setuimodelvalue(level.var_53cbbb33[params.localclientnum], 1);
        } else {
            setuimodelvalue(level.var_3a0390dd[params.localclientnum], 0);
            setuimodelvalue(level.var_53cbbb33[params.localclientnum], 0);
        }
        if (isdefined(params.weapon.statname) && params.weapon.statname != #"") {
            itemindex = getbaseweaponitemindex(getweapon(params.weapon.statname));
        } else {
            itemindex = getbaseweaponitemindex(params.weapon);
        }
        var_754fe8c5 = getweaponammotype(params.weapon);
        if (isdefined(level.var_c53d118f) && isdefined(level.var_c53d118f[var_754fe8c5])) {
            setuimodelvalue(level.var_c8a5f79b[params.localclientnum], level.var_c53d118f[var_754fe8c5]);
        } else {
            setuimodelvalue(level.var_c8a5f79b[params.localclientnum], #"");
        }
        setuimodelvalue(level.var_af8f97c8[params.localclientnum], itemindex);
        forcenotifyuimodel(level.var_af8f97c8[params.localclientnum]);
        supportsattachments = 0;
        if (isdefined(item)) {
            supportsattachments = namespace_a0d533d1::function_4bd83c04(item);
        }
        setuimodelvalue(level.var_7086ad4f[params.localclientnum], supportsattachments);
        function_deddbdf0(params.localclientnum, var_a4250c2b);
        function_ce628f27(params.localclientnum);
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0xd3d7d9b3, Offset: 0xd4a8
// Size: 0x174
function function_8ffee46f(localclientnum, item) {
    var_f9b70cae = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.pickedUpItem");
    itemname = item_world::get_item_name(item.var_a6762160);
    if (!setuimodelvalue(var_f9b70cae, itemname)) {
        forcenotifyuimodel(var_f9b70cae);
    }
    if (item.var_a6762160.itemtype == #"weapon") {
        var_d9659d2a = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.pickedUpWeapon");
        if (!setuimodelvalue(var_d9659d2a, itemname)) {
            forcenotifyuimodel(var_d9659d2a);
        }
    } else if (item.var_a6762160.itemtype == #"generic") {
        function_22759012(localclientnum, item.networkid);
    }
}

// Namespace item_inventory/item_inventory
// Params 1, eflags: 0x1 linked
// Checksum 0xf0bad28c, Offset: 0xd628
// Size: 0x5c
function function_c9764f6d(localclientnum) {
    var_80c295ff = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.droppedWeapon");
    forcenotifyuimodel(var_80c295ff);
}

// Namespace item_inventory/item_inventory
// Params 3, eflags: 0x1 linked
// Checksum 0xa2bc4c12, Offset: 0xd690
// Size: 0x12c
function function_451ebd83(localclientnum, item, networkid) {
    itemname = item_world::get_item_name(item);
    waittillframeend();
    var_e16dbee1 = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.consumedItem");
    if (!setuimodelvalue(var_e16dbee1, itemname)) {
        forcenotifyuimodel(var_e16dbee1);
    }
    data = item_world::function_a7e98a1a(localclientnum);
    if (isdefined(data) && isdefined(data.inventory) && networkid === data.inventory.var_4d4ec560) {
        data.inventory.var_4d4ec560 = undefined;
    }
    function_9f5d2dc8(localclientnum);
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x2d039ded, Offset: 0xd7c8
// Size: 0x4d4
function function_4f16aa30(localclientnum, itemid) {
    if (!isdefined(level.var_c53d118f)) {
        level.var_c53d118f = [];
    }
    /#
        assert(item_world_util::function_2c7fc531(itemid));
    #/
    item = function_b1702735(itemid);
    if (!isdefined(item.var_a6762160)) {
        return;
    }
    var_754fe8c5 = getweaponammotype(item.var_a6762160.weapon);
    if (!isdefined(var_754fe8c5) || item.var_a6762160.itemtype !== #"ammo") {
        return;
    }
    var_f9b70cae = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.pickedUpItem");
    var_7268d07 = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory.pickedUpAmmoTypes");
    var_5a2db7bb = createuimodel(var_7268d07, "count");
    var_b4676aed = getuimodelvalue(var_5a2db7bb);
    for (i = 0; i < var_b4676aed; i++) {
        var_acd2831f = createuimodel(var_7268d07, "" + i + 1);
        if (getuimodelvalue(createuimodel(var_acd2831f, "assetName")) == var_754fe8c5) {
            if (item.var_a6762160.itemtype == #"ammo" && !getuimodelvalue(createuimodel(var_acd2831f, "canDrop"))) {
                setuimodelvalue(createuimodel(var_acd2831f, "id"), itemid);
                setuimodelvalue(createuimodel(var_acd2831f, "canDrop"), item.var_a6762160.itemtype == #"ammo");
            }
            return;
        }
    }
    level.var_c53d118f[var_754fe8c5] = item.var_a6762160.displayname;
    var_acd2831f = createuimodel(var_7268d07, "" + var_b4676aed + 1);
    setuimodelvalue(createuimodel(var_acd2831f, "assetName"), var_754fe8c5);
    setuimodelvalue(createuimodel(var_acd2831f, "id"), itemid);
    setuimodelvalue(createuimodel(var_acd2831f, "canDrop"), 1);
    setuimodelvalue(createuimodel(var_acd2831f, "name"), item.var_a6762160.displayname);
    setuimodelvalue(createuimodel(var_acd2831f, "icon"), item.var_a6762160.icon);
    setuimodelvalue(createuimodel(var_acd2831f, "description"), item.var_a6762160.description);
    setuimodelvalue(var_5a2db7bb, var_b4676aed + 1);
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0xab9a6106, Offset: 0xdca8
// Size: 0x332
function function_b1136fc8(localclientnum, item) {
    if (isdefined(item) && isdefined(item.origin) && isdefined(item.var_a6762160)) {
        if (isdefined(item.var_a6762160.var_36781d9f)) {
            playsound(localclientnum, item.var_a6762160.var_36781d9f, item.origin);
            return;
        }
        switch (item.var_a6762160.itemtype) {
        case #"weapon":
            playsound(localclientnum, #"hash_67fed8a52accbb23", item.origin);
            break;
        case #"ammo":
            playsound(localclientnum, #"fly_drop_generic", item.origin);
            break;
        case #"health":
            playsound(localclientnum, #"hash_4d393a136d0df945", item.origin);
            break;
        case #"equipment":
            playsound(localclientnum, #"fly_drop_generic", item.origin);
            break;
        case #"armor":
            playsound(localclientnum, #"hash_6bd51d5a531ff32", item.origin);
            break;
        case #"backpack":
            playsound(localclientnum, #"hash_60e9138ddc9660ed", item.origin);
            break;
        case #"attachment":
            playsound(localclientnum, #"fly_drop_generic", item.origin);
            break;
        case #"quest":
            playsound(localclientnum, #"fly_drop_generic", item.origin);
            break;
        case #"generic":
            playsound(localclientnum, #"fly_drop_generic", item.origin);
            break;
        case #"cash":
            playsound(localclientnum, #"fly_drop_generic", item.origin);
            break;
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x113c832c, Offset: 0xdfe8
// Size: 0x332
function function_31868137(localclientnum, item) {
    if (isdefined(item) && isdefined(item.origin) && isdefined(item.var_a6762160)) {
        if (isdefined(item.var_a6762160.pickupsound)) {
            playsound(localclientnum, item.var_a6762160.pickupsound, item.origin);
            return;
        }
        switch (item.var_a6762160.itemtype) {
        case #"weapon":
            playsound(localclientnum, #"hash_62fabedcce13774c", item.origin);
            break;
        case #"ammo":
            playsound(localclientnum, #"hash_36c9bf9c68a692f6", item.origin);
            break;
        case #"health":
            playsound(localclientnum, #"hash_7cb9f9cf7068ccee", item.origin);
            break;
        case #"equipment":
            playsound(localclientnum, #"fly_pickup_generic", item.origin);
            break;
        case #"armor":
            playsound(localclientnum, #"hash_2d8e1c5a5387840f", item.origin);
            break;
        case #"backpack":
            playsound(localclientnum, #"hash_69949bb7db9ef21e", item.origin);
            break;
        case #"attachment":
            playsound(localclientnum, #"hash_48ae9b1190e79fc5", item.origin);
            break;
        case #"quest":
            playsound(localclientnum, #"hash_5738a0fcb2e4efca", item.origin);
            break;
        case #"generic":
            playsound(localclientnum, #"fly_pickup_generic", item.origin);
            break;
        case #"cash":
            playsound(localclientnum, #"fly_pickup_generic", item.origin);
            break;
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x2ea5b8bb, Offset: 0xe328
// Size: 0x53c
function function_c6ff0aa2(localclientnum, networkid) {
    data = item_world::function_a7e98a1a(localclientnum);
    index = item_world::function_73436347(data.inventory.items, networkid);
    if (!isdefined(index)) {
        /#
            println("<unknown string>" + networkid + "<unknown string>");
        #/
        return;
    }
    item = data.inventory.items[index];
    isweapon = isdefined(item.var_a6762160) && item.var_a6762160.itemtype == #"weapon";
    var_53aa3063 = isdefined(item.var_a6762160) && item.var_a6762160.itemtype == #"generic";
    var_ac3edb34 = item.var_a6762160;
    if (isdefined(item.endtime)) {
        consumeditem = function_85645978(data, item);
        if (isdefined(consumeditem)) {
            var_ee0e9af9 = [];
            for (index = 0; index < 10; index++) {
                inventoryitem = data.inventory.items[index];
                if (!isdefined(inventoryitem.endtime)) {
                    continue;
                }
                if (inventoryitem.var_a6762160.name == item.var_a6762160.name) {
                    var_ee0e9af9[var_ee0e9af9.size] = inventoryitem;
                }
            }
            remaining = consumeditem.endtime - gettime();
            consumeditem.endtime = consumeditem.endtime - remaining / var_ee0e9af9.size;
            for (index = 0; index < var_ee0e9af9.size; index++) {
                inventoryitem = var_ee0e9af9[index];
                inventoryitem.starttime = consumeditem.starttime;
                inventoryitem.endtime = consumeditem.endtime;
            }
        }
    }
    function_1a99656a(localclientnum, item, 32767, 32767, 0, 0, 0, 1, 0, 0);
    player = function_27673a7(localclientnum);
    if (player.weapon.name == #"none" || player.weapon.name == #"bare_hands") {
        var_a4250c2b = player function_d768ea30(localclientnum);
        if (isdefined(var_a4250c2b) && var_a4250c2b == index) {
            primaryweapons = player getweaponslistprimaries();
            nextweapon = level.weaponbasemeleeheld;
            foreach (weapon in primaryweapons) {
                if (weapon !== player.currentweapon) {
                    nextweapon = weapon;
                    break;
                }
            }
            var_a3eec6f2 = spawnstruct();
            var_a3eec6f2.localclientnum = localclientnum;
            var_a3eec6f2.weapon = nextweapon;
            player function_6231c19(var_a3eec6f2);
        }
    }
    if (index == 13) {
        take_backpack(localclientnum, networkid);
    }
    if (isweapon) {
        function_c9764f6d(localclientnum);
        function_ce628f27(localclientnum);
    } else if (var_53aa3063) {
        function_9f5d2dc8(localclientnum);
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x856c9c6c, Offset: 0xe870
// Size: 0x124
function function_8063170(inventoryitem, equipped) {
    if (!isdefined(inventoryitem) || !isdefined(inventoryitem.var_a6762160)) {
        return;
    }
    if (inventoryitem.var_a6762160.itemtype === #"armor_shard") {
        return;
    }
    if (inventoryitem.var_a6762160.itemtype === #"attachment" || inventoryitem.var_a6762160.itemtype === #"weapon") {
        availableaction = inventoryitem.availableaction;
    } else {
        availableaction = inventoryitem.availableaction && !equipped;
    }
    setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "availableAction"), availableaction);
}

// Namespace item_inventory/item_inventory
// Params 3, eflags: 0x1 linked
// Checksum 0xc039d53a, Offset: 0xe9a0
// Size: 0x33c
function function_26c87da8(localclientnum, var_c9293a27, var_8f194e5a) {
    /#
        assert(isdefined(var_c9293a27) && isdefined(var_8f194e5a));
    #/
    if (var_c9293a27 == var_8f194e5a) {
        return;
    }
    data = item_world::function_a7e98a1a(localclientnum);
    fromitem = data.inventory.items[var_c9293a27];
    toitem = data.inventory.items[var_8f194e5a];
    var_23501832 = fromitem.networkid;
    var_a2dd129a = fromitem.id;
    var_b208c7e1 = fromitem.var_a6762160;
    var_3907299e = fromitem.count;
    var_57b0c2f = fromitem.availableaction;
    var_9269cd0a = toitem.networkid;
    var_d3a45360 = toitem.id;
    var_ec763bb2 = toitem.var_a6762160;
    var_532f304 = toitem.count;
    var_ad138826 = toitem.availableaction;
    player = function_27673a7(localclientnum);
    player function_1a99656a(localclientnum, toitem, var_23501832 != 32767 ? item_world_util::function_970b8d86(player, var_8f194e5a) : 32767, var_a2dd129a, var_3907299e, function_bba770de(localclientnum, var_b208c7e1), var_57b0c2f, undefined, 1);
    player function_1a99656a(localclientnum, fromitem, var_9269cd0a != 32767 ? item_world_util::function_970b8d86(player, var_c9293a27) : 32767, var_d3a45360, var_532f304, function_bba770de(localclientnum, var_ec763bb2), var_ad138826, undefined, 1);
    function_442857e2(localclientnum, var_ec763bb2);
    function_442857e2(localclientnum, var_b208c7e1);
    function_ce628f27(localclientnum);
    var_a4250c2b = player function_d768ea30(localclientnum);
    function_deddbdf0(localclientnum, var_a4250c2b);
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x5cd94fc3, Offset: 0xece8
// Size: 0x17c
function take_backpack(localclientnum, networkid) {
    data = item_world::function_a7e98a1a(localclientnum);
    data.inventory.var_7658cbec = 0;
    if (data.inventory.var_c212de25 == 10) {
        for (index = 5; index < 10; index++) {
            inventoryitem = data.inventory.items[index];
            setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "disabled"), 1);
        }
        data.inventory.var_c212de25 = 5;
        inventoryuimodel = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.inventory");
        setuimodelvalue(createuimodel(inventoryuimodel, "count"), data.inventory.var_c212de25);
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0x473035f8, Offset: 0xee70
// Size: 0xd4
function function_fa372100(localclientnum, networkid) {
    data = item_world::function_a7e98a1a(localclientnum);
    foreach (inventoryitem in data.inventory.items) {
        if (inventoryitem.networkid === networkid) {
            function_8063170(inventoryitem, 0);
            break;
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 3, eflags: 0x1 linked
// Checksum 0x5c1068c8, Offset: 0xef50
// Size: 0x1c4
function update_inventory_item(localclientnum, networkid, count) {
    data = item_world::function_a7e98a1a(localclientnum);
    player = function_27673a7(localclientnum);
    foreach (inventoryslot, inventoryitem in data.inventory.items) {
        if (inventoryitem.networkid === networkid) {
            var_338e8597 = isdefined(inventoryitem.count) ? inventoryitem.count : 0;
            totalcount = function_bba770de(localclientnum, inventoryitem.var_a6762160);
            totalcount = totalcount + max(0, count - var_338e8597);
            function_1a99656a(localclientnum, inventoryitem, inventoryitem.networkid, inventoryitem.id, count, totalcount, inventoryitem.availableaction);
            function_8063170(inventoryitem, function_6d9d9cd7(inventoryslot));
            break;
        }
    }
}

// Namespace item_inventory/item_inventory
// Params 2, eflags: 0x1 linked
// Checksum 0xb883d5f5, Offset: 0xf120
// Size: 0xe84
function function_9116bb0e(localclientnum, closed = 0) {
    /#
        assert(isplayer(self));
    #/
    clientdata = item_world::function_a7e98a1a(localclientnum);
    var_6e2c91d0 = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.multiItemPickup");
    var_cc67e8b = createuimodel(var_6e2c91d0, "count");
    if (isdefined(clientdata.groupitems) && !closed) {
        arrayremovevalue(clientdata.groupitems, undefined, 0);
        foreach (i, itemdef in clientdata.groupitems) {
            itemmodel = createuimodel(var_6e2c91d0, "item" + i);
            setuimodelvalue(createuimodel(itemmodel, "id"), itemdef.networkid);
            if (!isdefined(itemdef.var_a6762160)) {
                setuimodelvalue(createuimodel(itemmodel, "inventoryFull"), 0);
                setuimodelvalue(createuimodel(itemmodel, "icon"), #"blacktransparent");
                setuimodelvalue(createuimodel(itemmodel, "rarity"), "none");
                setuimodelvalue(createuimodel(itemmodel, "name"), #"");
                setuimodelvalue(createuimodel(itemmodel, "claimsInventorySlot"), 0);
                setuimodelvalue(createuimodel(itemmodel, "stackCount"), 0);
                setuimodelvalue(createuimodel(itemmodel, "stashStackSize"), 0);
                setuimodelvalue(createuimodel(itemmodel, "armorTier"), 1);
                setuimodelvalue(createuimodel(itemmodel, "armor"), 0);
                setuimodelvalue(createuimodel(itemmodel, "armorMax"), 1);
                setuimodelvalue(createuimodel(itemmodel, "itemtype"), "none");
                setuimodelvalue(createuimodel(itemmodel, "specialItem"), 0);
                if (ispc()) {
                    setuimodelvalue(createuimodel(itemmodel, "description"), #"");
                }
            } else {
                setuimodelvalue(createuimodel(itemmodel, "itemtype"), itemdef.var_a6762160.itemtype);
                if (itemdef.var_a6762160.itemtype === #"ammo") {
                    canpickup = self can_pickup_ammo(localclientnum, itemdef);
                    setuimodelvalue(createuimodel(itemmodel, "inventoryFull"), !canpickup);
                } else if (itemdef.var_a6762160.itemtype === #"armor_shard") {
                    canpickup = self function_ad4c6116(localclientnum, itemdef.var_a6762160);
                    setuimodelvalue(createuimodel(itemmodel, "inventoryFull"), !canpickup);
                } else {
                    setuimodelvalue(createuimodel(itemmodel, "inventoryFull"), 0);
                }
                if (ispc()) {
                    description = isdefined(itemdef.var_a6762160.description) ? itemdef.var_a6762160.description : #"";
                    if (description == #"" && isdefined(itemdef.var_a6762160.weapon)) {
                        itemindex = getitemindexfromref(itemdef.var_a6762160.weapon.name);
                        var_97dcd0a5 = getunlockableiteminfofromindex(itemindex);
                        if (isdefined(var_97dcd0a5) && isdefined(var_97dcd0a5.description)) {
                            description = var_97dcd0a5.description;
                        }
                    }
                    setuimodelvalue(createuimodel(itemmodel, "description"), isdefined(description) ? description : #"");
                }
                pickupicon = isdefined(itemdef.var_a6762160.pickupicon) ? itemdef.var_a6762160.pickupicon : itemdef.var_a6762160.icon;
                stashicon = isdefined(itemdef.var_a6762160.stashicon) ? itemdef.var_a6762160.stashicon : pickupicon;
                setuimodelvalue(createuimodel(itemmodel, "icon"), isdefined(stashicon) ? stashicon : #"blacktransparent");
                setuimodelvalue(createuimodel(itemmodel, "rarity"), itemdef.var_a6762160.rarity);
                setuimodelvalue(createuimodel(itemmodel, "name"), item_world::get_item_name(itemdef.var_a6762160));
                setuimodelvalue(createuimodel(itemmodel, "claimsInventorySlot"), is_inventory_item(localclientnum, itemdef.var_a6762160) && !function_a4a6f064(localclientnum, itemdef.var_a6762160));
                setuimodelvalue(createuimodel(itemmodel, "stackCount"), 0);
                setuimodelvalue(createuimodel(itemmodel, "stashStackSize"), 0);
                if (itemdef.var_a6762160.itemtype === #"armor") {
                    setuimodelvalue(createuimodel(itemmodel, "armorTier"), itemdef.var_a6762160.armortier);
                    setuimodelvalue(createuimodel(itemmodel, "armor"), isdefined(isdefined(itemdef.amount) ? itemdef.amount : itemdef.var_a6762160.amount) ? isdefined(itemdef.amount) ? itemdef.amount : itemdef.var_a6762160.amount : 0);
                    setuimodelvalue(createuimodel(itemmodel, "armorMax"), isdefined(itemdef.var_a6762160.amount) ? itemdef.var_a6762160.amount : 1);
                } else {
                    setuimodelvalue(createuimodel(itemmodel, "armorTier"), 1);
                    setuimodelvalue(createuimodel(itemmodel, "armor"), 0);
                    setuimodelvalue(createuimodel(itemmodel, "armorMax"), 1);
                }
                if (isdefined(itemdef.var_a6762160.stackable) && itemdef.var_a6762160.stackable || itemdef.var_a6762160.itemtype === #"ammo") {
                    if ((itemdef.var_a6762160.itemtype === #"ammo" || isstruct(itemdef)) && !isdefined(itemdef.amount)) {
                        setuimodelvalue(createuimodel(itemmodel, "stackCount"), isdefined(itemdef.var_a6762160.amount) ? itemdef.var_a6762160.amount : 1);
                    } else {
                        setuimodelvalue(createuimodel(itemmodel, "stackCount"), int(max(isdefined(itemdef.amount) ? itemdef.amount : 1, isdefined(itemdef.count) ? itemdef.count : 1)));
                    }
                } else {
                    setuimodelvalue(createuimodel(itemmodel, "stashStackSize"), isdefined(itemdef.count) ? itemdef.count : 1);
                }
                if (isdefined(itemdef.var_41f13734) && itemdef.var_41f13734) {
                    setuimodelvalue(createuimodel(itemmodel, "specialItem"), 1);
                }
            }
        }
        currentcount = getuimodelvalue(var_cc67e8b);
        setuimodelvalue(var_cc67e8b, clientdata.groupitems.size);
        if (currentcount === clientdata.groupitems.size) {
        }
        var_aaa1adcb = createuimodel(var_6e2c91d0, "forceNotifyAmmoList");
        forcenotifyuimodel(var_aaa1adcb);
    } else {
        setuimodelvalue(var_cc67e8b, 0);
    }
}


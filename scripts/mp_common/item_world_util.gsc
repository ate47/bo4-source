// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;

#namespace item_world_util;

// Namespace item_world_util/item_world_util
// Params 0, eflags: 0x2
// Checksum 0x5b751cc3, Offset: 0x70
// Size: 0x18a
function autoexec __init__() {
    level.var_d8caca76 = function_a3975ce9();
    level.var_3f501cff = function_a04d222e() - 500;
    level.var_d051f0fe = function_d634ed59();
    level.var_8ee4985f = 115 * (16 + 1 + 6 + 1 + 6 + 1);
    level.var_c4160ac0 = level.var_d8caca76 - 2;
    /#
        assert(level.var_c4160ac0 + 1 == 32767);
    #/
    level.var_c1fb34bd = level.var_c4160ac0;
    level.var_b52c46a6 = level.var_c1fb34bd - level.var_8ee4985f;
    level.var_7d942c18 = level.var_b52c46a6 - 1;
    level.var_afaaa0ee = level.var_3f501cff;
    /#
        assert(level.var_7d942c18 - level.var_afaaa0ee > 1024);
    #/
    level.var_b7364e19 = level.var_afaaa0ee - 1;
    level.var_6e47811c = 0;
}

// Namespace item_world_util/item_world_util
// Params 2, eflags: 0x1 linked
// Checksum 0x1113f913, Offset: 0x208
// Size: 0x220
function function_2eb2c17c(origin, item) {
    traceoffset = vectorscale((0, 0, 1), 4);
    var_5d97fed1 = item.hidetime === -1;
    var_8e2d9611 = item.origin + traceoffset;
    var_b0fbfe59 = bullettrace(origin, var_8e2d9611, 0, self, 0);
    if (var_b0fbfe59[#"fraction"] < 1 && var_b0fbfe59[#"entity"] !== item) {
        if (var_5d97fed1) {
            var_acdfe076 = isdefined(var_b0fbfe59[#"dynent"]) && distance2dsquared(var_b0fbfe59[#"dynent"].origin, item.origin) <= 12 * 12;
            var_45127074 = isdefined(var_b0fbfe59[#"entity"]) && distance2dsquared(var_b0fbfe59[#"entity"].origin, item.origin) <= 12 * 12;
            if (!var_acdfe076 && !var_45127074) {
                return 0;
            }
        } else {
            var_5408bd2a = physicstraceex(origin, var_8e2d9611, (0, 0, 0), (0, 0, 0), self, 1);
            if (var_5408bd2a[#"fraction"] >= 1) {
                return 1;
            }
            return 0;
        }
    }
    return 1;
}

// Namespace item_world_util/item_world_util
// Params 7, eflags: 0x1 linked
// Checksum 0xef674d12, Offset: 0x430
// Size: 0x792
function function_6061a15(var_f4b807cb, maxdist, origin, angles, forward, var_4bd72bfe = 0, var_82043550 = 0) {
    var_9b882d22 = undefined;
    bestdot = -1;
    var_1530699e = undefined;
    var_7cd624f6 = 2147483647;
    var_431e5926 = undefined;
    var_548943d3 = 2147483647;
    var_95d4627b = 0;
    var_490fd61a = undefined;
    var_6b7d827a = 2147483647;
    var_404fbede = 0;
    var_ba6bb2bd = undefined;
    var_9fd8216d = -1;
    var_75f6d739 = anglestoforward((0, angles[1], 0));
    var_66347f1f = 115 * 115;
    var_6b35a0b8 = 24 * 24;
    for (itemindex = 0; itemindex < var_f4b807cb.size; itemindex++) {
        itemdef = var_f4b807cb[itemindex];
        if (var_82043550) {
        }
        if (!isdefined(itemdef)) {
            continue;
        }
        toitem = itemdef.origin - origin;
        var_abd887b5 = distance2dsquared(itemdef.origin, origin);
        if (var_abd887b5 < var_66347f1f && abs(itemdef.origin[2] - origin[2]) < 72) {
            dot = vectordot(forward, vectornormalize(toitem));
            if (dot >= 0.965 && var_abd887b5 < var_66347f1f && dot > var_9fd8216d) {
                if (!self can_pick_up(itemdef) || !function_2eb2c17c(origin, itemdef)) {
                    continue;
                }
                var_ba6bb2bd = itemdef;
                var_9fd8216d = dot;
            }
            if (isdefined(var_ba6bb2bd) && var_abd887b5 >= var_66347f1f) {
                break;
            }
            var_1777205e = vectordot(var_75f6d739, vectornormalize((toitem[0], toitem[1], 0)));
            var_c5722fe1 = 0;
            if (var_4bd72bfe) {
                var_c5722fe1 = itemdef.var_a6762160.itemtype == #"weapon";
            }
            if (var_1777205e >= 0.965 && (var_abd887b5 < var_6b7d827a || !var_c5722fe1 && var_404fbede) && var_abd887b5 > var_6b35a0b8) {
                if (isdefined(var_490fd61a) && var_c5722fe1 && !var_404fbede) {
                    continue;
                }
                if (!self can_pick_up(itemdef) || !function_2eb2c17c(origin, itemdef)) {
                    continue;
                }
                var_490fd61a = itemdef;
                var_6b7d827a = var_abd887b5;
                var_404fbede = var_c5722fe1;
            }
            if (isdefined(var_490fd61a) && !var_404fbede) {
                break;
            }
            var_19b17831 = var_95d4627b || var_404fbede;
            if (var_1777205e >= 0.866 && var_1777205e < 0.965 && (var_abd887b5 < var_548943d3 || !var_c5722fe1 && var_19b17831) && var_abd887b5 > var_6b35a0b8) {
                if ((isdefined(var_490fd61a) || isdefined(var_431e5926)) && var_c5722fe1 && !var_19b17831) {
                    continue;
                }
                if (!self can_pick_up(itemdef) || !function_2eb2c17c(origin, itemdef)) {
                    continue;
                }
                var_431e5926 = itemdef;
                var_548943d3 = var_abd887b5;
                var_95d4627b = var_c5722fe1;
            }
        } else {
            var_7ef7c839 = isdefined(var_ba6bb2bd) || isdefined(var_490fd61a) || isdefined(var_431e5926) || isdefined(var_1530699e);
            if (var_7ef7c839) {
                break;
            }
            var_1777205e = vectordot(var_75f6d739, vectornormalize((toitem[0], toitem[1], 0)));
            if (var_1777205e >= 0.866 && var_abd887b5 < var_7cd624f6) {
                if (!self can_pick_up(itemdef) || !function_2eb2c17c(origin, itemdef)) {
                    continue;
                }
                var_1530699e = itemdef;
                var_7cd624f6 = var_abd887b5;
            }
        }
    }
    if (isdefined(var_ba6bb2bd)) {
        var_9b882d22 = var_ba6bb2bd;
    } else if (isdefined(var_490fd61a) && (!isdefined(var_431e5926) || !var_404fbede)) {
        var_9b882d22 = var_490fd61a;
    } else if (isdefined(var_431e5926)) {
        var_9b882d22 = var_431e5926;
    } else if (isdefined(var_1530699e)) {
        var_9b882d22 = var_1530699e;
    }
    if (isdefined(var_9b882d22)) {
        neardist = util::function_4c1656d5();
        var_9b882d22.isfar = neardist < maxdist && distance2dsquared(origin, var_9b882d22.origin) > neardist * neardist;
        var_9b882d22.isclose = distance2dsquared(origin, var_9b882d22.origin) < (128 - 12) * (128 - 12);
        var_9b882d22.var_5d97fed1 = var_9b882d22.hidetime === -1;
    }
    return var_9b882d22;
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x0
// Checksum 0xd44cb6c5, Offset: 0xbd0
// Size: 0xfa
function function_45efe0ab(var_a6762160) {
    var_caafaa25 = #"hash_0";
    if (isdefined(var_a6762160.weapon) && var_a6762160.weapon != level.weaponnone) {
        if (var_a6762160.itemtype != #"ammo") {
            var_caafaa25 = var_a6762160.weapon.displayname;
        } else {
            var_caafaa25 = isdefined(var_a6762160.hintstring) ? var_a6762160.hintstring : #"hash_0";
        }
    } else {
        var_caafaa25 = isdefined(var_a6762160.hintstring) ? var_a6762160.hintstring : #"hash_0";
    }
    return var_caafaa25;
}

// Namespace item_world_util/item_world_util
// Params 2, eflags: 0x1 linked
// Checksum 0x35475d85, Offset: 0xcd8
// Size: 0x148
function function_808be9a3(player, var_bd027dd9) {
    /#
        assert(isplayer(player));
    #/
    /#
        assert(var_bd027dd9 >= level.var_b52c46a6 && var_bd027dd9 <= level.var_c1fb34bd);
    #/
    entnum = player getentitynumber();
    /#
        assert(entnum < 115);
    #/
    slotid = var_bd027dd9 - level.var_b52c46a6 - entnum * (16 + 1 + 6 + 1 + 6 + 1);
    /#
        assert(slotid >= 0 && slotid < 16 + 1 + 6 + 1 + 6 + 1);
    #/
    return slotid;
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x0
// Checksum 0xd2ac721f, Offset: 0xe28
// Size: 0x36
function function_c094ccd3(var_bd027dd9) {
    if (function_da09de95(var_bd027dd9)) {
        return (var_bd027dd9 - level.var_afaaa0ee);
    }
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0x65470300, Offset: 0xe68
// Size: 0x130
function function_1f0def85(item) {
    /#
        assert(isdefined(item));
    #/
    if (!isdefined(item)) {
        return 32767;
    }
    if (isstruct(item)) {
        /#
            assert(isdefined(item.id));
        #/
        /#
            assert(item.id >= level.var_6e47811c && item.id <= level.var_b7364e19);
        #/
        return item.id;
    }
    entnum = item getentitynumber();
    var_bd027dd9 = entnum + level.var_afaaa0ee;
    /#
        assert(var_bd027dd9 >= level.var_afaaa0ee && var_bd027dd9 <= level.var_7d942c18);
    #/
    return var_bd027dd9;
}

// Namespace item_world_util/item_world_util
// Params 3, eflags: 0x1 linked
// Checksum 0xa6ea58d7, Offset: 0xfa0
// Size: 0x1a8
function function_970b8d86(player, slotid, var_259f58f3 = undefined) {
    /#
        assert(isplayer(player));
    #/
    if (isdefined(var_259f58f3)) {
        /#
            assert(var_259f58f3 <= 6);
        #/
        slotid = slotid + var_259f58f3;
    }
    /#
        assert(slotid >= 0 && slotid < 16 + 1 + 6 + 1 + 6 + 1);
    #/
    entnum = player getentitynumber();
    /#
        assert(entnum < 115);
    #/
    var_f5e3c230 = entnum * (16 + 1 + 6 + 1 + 6 + 1) + slotid;
    var_bd027dd9 = var_f5e3c230 + level.var_b52c46a6;
    /#
        assert(var_bd027dd9 >= level.var_b52c46a6 && var_bd027dd9 <= level.var_c1fb34bd);
    #/
    return var_bd027dd9;
}

// Namespace item_world_util/item_world_util
// Params 3, eflags: 0x1 linked
// Checksum 0xd8e7efff, Offset: 0x1150
// Size: 0x24c
function function_6af455de(localclientnum, origin, angles) {
    forward = anglestoforward(angles);
    vehicles = getentitiesinradius(origin, 1024, 12);
    var_bf3cabc9 = undefined;
    var_e664ecda = undefined;
    var_33b49591 = undefined;
    var_1dd6e163 = undefined;
    foreach (vehicle in vehicles) {
        occupied = 0;
        occupied = vehicle getvehoccupants().size > 0;
        if (occupied) {
            continue;
        }
        tovehicle = vectornormalize(vehicle.origin - origin);
        dot = vectordot(forward, tovehicle);
        var_aba3faed = distance2dsquared(vehicle.origin, origin);
        if (dot >= 0.965 && (!isdefined(var_e664ecda) || var_aba3faed < var_e664ecda)) {
            var_bf3cabc9 = vehicle;
            var_e664ecda = var_aba3faed;
        }
        if (dot >= 0.5 && var_aba3faed <= 128 * 128 && (!isdefined(var_1dd6e163) || var_aba3faed < var_1dd6e163)) {
            var_33b49591 = vehicle;
            var_1dd6e163 = var_aba3faed;
        }
    }
    if (isdefined(var_33b49591)) {
        return var_33b49591;
    }
    return var_bf3cabc9;
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0xd6489a63, Offset: 0x13a8
// Size: 0x1ee
function function_c62ad9a7(vehicle) {
    hinttext = #"hash_0";
    if (isdefined(vehicle) && isdefined(vehicle.scriptvehicletype)) {
        switch (vehicle.scriptvehicletype) {
        case #"player_atv":
            hinttext = #"wz/player_atv";
            break;
        case #"helicopter_light":
            hinttext = #"wz/helicopter";
            break;
        case #"cargo_truck_wz":
            hinttext = #"wz/cargo_truck";
            break;
        case #"tactical_raft_wz":
            hinttext = #"hash_602556b5bd4f952d";
            break;
        case #"player_fav":
            hinttext = #"wz/arav";
            break;
        case #"player_suv":
            hinttext = #"wz/suv";
            break;
        case #"player_muscle":
            hinttext = #"wz/muscle_car";
            break;
        case #"pbr_boat_wz":
            hinttext = #"wz/pbr";
            break;
        case #"player_motorcycle":
            hinttext = #"wz/motorcycle";
            break;
        case #"player_tank":
            hinttext = #"wz/tank";
            break;
        }
    }
    return hinttext;
}

// Namespace item_world_util/item_world_util
// Params 2, eflags: 0x1 linked
// Checksum 0xf5bf00ab, Offset: 0x15a0
// Size: 0xee
function can_pick_up(item, servertime = undefined) {
    if (!isdefined(item) || !isdefined(item.var_a6762160)) {
        return 0;
    }
    if (isdefined(servertime)) {
        if (item.hidetime > 0 && item.hidetime <= servertime) {
            return 0;
        }
    } else if (item.hidetime > 0 && item.hidetime != -1) {
        return 0;
    }
    if (!isstruct(item) && item getitemindex() == 32767) {
        return 0;
    }
    return 1;
}

// Namespace item_world_util/item_world_util
// Params 4, eflags: 0x0
// Checksum 0xbb3442ce, Offset: 0x1698
// Size: 0x2f6
function function_4cbb6617(inventory, itemtype, var_da328e7b, var_bcc2655a) {
    /#
        assert(ishash(itemtype));
    #/
    /#
        assert(isarray(var_da328e7b));
    #/
    if (!isdefined(var_bcc2655a)) {
        return;
    }
    items = [];
    var_c7837092 = get_itemtype(var_bcc2655a);
    foreach (item in inventory.items) {
        if (!isdefined(item)) {
            continue;
        }
        if (item.id == 32767) {
            continue;
        }
        if (!isdefined(item.var_a6762160)) {
            continue;
        }
        var_b74300d3 = get_itemtype(item.var_a6762160);
        if (item.var_a6762160.itemtype == itemtype) {
            if (isdefined(items[var_b74300d3])) {
                if (item.count > items[var_b74300d3].count) {
                    items[var_b74300d3] = item;
                }
            } else {
                items[var_b74300d3] = item;
            }
        }
    }
    listitems = [];
    for (currentindex = 0; currentindex < var_da328e7b.size; currentindex++) {
        if (var_da328e7b[currentindex] == var_c7837092) {
            break;
        }
    }
    for (index = currentindex + 1; index < var_da328e7b.size; index++) {
        var_b74300d3 = var_da328e7b[index];
        if (isdefined(items[var_b74300d3])) {
            listitems[listitems.size] = items[var_b74300d3];
        }
    }
    if (currentindex < var_da328e7b.size) {
        for (index = 0; index < currentindex; index++) {
            var_b74300d3 = var_da328e7b[index];
            if (isdefined(items[var_b74300d3])) {
                listitems[listitems.size] = items[var_b74300d3];
            }
        }
    }
    return listitems;
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x0
// Checksum 0xb3fe4995, Offset: 0x1998
// Size: 0x36
function function_f73bc33(item) {
    return isdefined(item.var_bd027dd9) ? item.var_bd027dd9 : item.id;
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0x9e6508a0, Offset: 0x19d8
// Size: 0x4a
function get_itemtype(var_a6762160) {
    return isdefined(var_a6762160.var_456aa154) ? getscriptbundle(var_a6762160.var_456aa154).name : var_a6762160.name;
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0x4c9e891, Offset: 0x1a30
// Size: 0xf6
function function_31f5aa51(item) {
    if (!isdefined(item) || !isdefined(item.targetname) && !isdefined(item.var_67169c0b)) {
        return;
    }
    targetname = isdefined(item.targetname) ? item.targetname : item.var_67169c0b;
    stashes = level.var_93d08989[targetname];
    if (!isdefined(stashes) || stashes.size <= 0) {
        return;
    }
    stashes = arraysortclosest(stashes, item.origin, 1, 0, 12);
    if (stashes.size <= 0) {
        return;
    }
    return stashes[0];
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0xd14ee626, Offset: 0x1b30
// Size: 0x32
function function_da09de95(id) {
    return id >= level.var_afaaa0ee && id <= level.var_7d942c18;
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0xbf15f864, Offset: 0x1b70
// Size: 0x60
function function_7363384a(name) {
    bundle = getscriptbundle(name);
    if (!isdefined(bundle)) {
        return 0;
    }
    if (bundle.type != #"hash_10587321f369e7f3") {
        return 0;
    }
    return 1;
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0x9ffdd161, Offset: 0x1bd8
// Size: 0x32
function function_db35e94f(id) {
    return id >= level.var_b52c46a6 && id <= level.var_c1fb34bd;
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0xb5be0787, Offset: 0x1c18
// Size: 0x6e
function function_41f06d9d(var_a6762160) {
    if (!isdefined(var_a6762160) || !isdefined(var_a6762160.name)) {
        return 0;
    }
    return var_a6762160.name == #"resource_item_paint" || var_a6762160.name == #"resource_item_paint_stack_10";
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0xf5fb9e1a, Offset: 0x1c90
// Size: 0x22
function function_74e1e547(point) {
    return function_3238d10d(point);
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0x9319cfc8, Offset: 0x1cc0
// Size: 0x32
function function_2c7fc531(id) {
    return id >= level.var_6e47811c && id <= level.var_b7364e19;
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0x9a0e6ea0, Offset: 0x1d00
// Size: 0x2c
function function_d9648161(id) {
    return id >= level.var_6e47811c && id <= 32767;
}

// Namespace item_world_util/item_world_util
// Params 2, eflags: 0x1 linked
// Checksum 0x2876b05c, Offset: 0x1d38
// Size: 0x2a6
function function_35e06774(var_a6762160, var_48cfb6ca = 0) {
    if (isdefined(var_a6762160) && isdefined(var_a6762160.weapon) && (isarray(var_a6762160.attachments) || var_48cfb6ca)) {
        attachments = [];
        foreach (attachment in var_a6762160.attachments) {
            attachments[attachments.size] = attachment.var_6be1bec7;
        }
        if (var_48cfb6ca) {
            foreach (attachment in var_a6762160.attachments) {
                var_fe35755b = getscriptbundle(attachment.var_6be1bec7);
                if (!isdefined(var_fe35755b) || var_fe35755b.type != #"hash_10587321f369e7f3" || !isarray(var_fe35755b.attachments)) {
                    continue;
                }
                foreach (var_a4559ed2 in var_fe35755b.attachments) {
                    attachments[attachments.size] = var_a4559ed2.var_6be1bec7;
                }
            }
        }
        weapon = getweapon(var_a6762160.weapon.name, attachments);
        return function_1242e467(weapon);
    } else if (isdefined(var_a6762160)) {
        return var_a6762160.weapon;
    }
    return undefined;
}

// Namespace item_world_util/item_world_util
// Params 1, eflags: 0x1 linked
// Checksum 0xcb69aa6c, Offset: 0x1fe8
// Size: 0x8e
function function_f4a8d375(itemid) {
    /#
        assert(function_2c7fc531(itemid));
    #/
    point = function_b1702735(itemid);
    if (isdefined(point)) {
        var_a6762160 = point.var_a6762160;
        return function_35e06774(var_a6762160);
    }
    return undefined;
}


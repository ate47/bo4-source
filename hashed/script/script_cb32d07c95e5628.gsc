#using scripts\mp_common\item_world_util;
#using scripts\mp_common\item_drop;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\struct;

#namespace namespace_65181344;

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x5 linked
// Checksum 0x8222ab7e, Offset: 0xe0
// Size: 0x1a2
function private function_2c4d3d40() {
    level.var_de3d5d56 = [];
    var_3a1737b4 = getscriptbundles(#"itemspawnentry");
    var_cce250bc = function_d634ed59();
    index = 0;
    offsetorigin = (0, 0, -64000);
    foreach (var_1461de43, var_28f8f6a9 in var_3a1737b4) {
        if (isdefined(level.var_de3d5d56)) {
            level.var_de3d5d56[var_1461de43] = var_28f8f6a9;
        }
        function_43cd95f4(index, var_1461de43);
        function_54ca5536(index, 1);
        function_b97dfce0(index, offsetorigin);
        index++;
        if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
            waitframe(1);
            level.var_d0676b07 = getrealtime();
        }
    }
}

// Namespace namespace_65181344/namespace_65181344
// Params 1, eflags: 0x5 linked
// Checksum 0x19b119f8, Offset: 0x290
// Size: 0x326
function private function_440f0490(itemlistbundle) {
    assert(isdefined(itemlistbundle) && itemlistbundle.type === "<dev string:x38>");
    assert(itemlistbundle.itemlist.size > 0, "<dev string:x4d>" + itemlistbundle.name + "<dev string:x63>");
    if (itemlistbundle.itemlist.size <= 0) {
        return;
    }
    weights = [];
    weighttotal = 0;
    for (rowindex = 0; rowindex < itemlistbundle.itemlist.size; rowindex++) {
        var_35843db5 = isdefined(itemlistbundle.itemlist[rowindex].minweight) ? itemlistbundle.itemlist[rowindex].minweight : 0;
        var_ccef9e25 = isdefined(itemlistbundle.itemlist[rowindex].maxweight) ? itemlistbundle.itemlist[rowindex].maxweight : 0;
        minweight = int(min(var_35843db5, var_ccef9e25));
        maxweight = int(max(var_35843db5, var_ccef9e25));
        diff = maxweight - minweight;
        randomint = function_d59c2d03(diff + 1);
        weight = randomint + minweight;
        weights[weights.size] = weight;
        weighttotal += weight;
    }
    var_d54615ef = function_d59c2d03(weighttotal);
    currentweight = 0;
    for (weightindex = 0; weightindex < weights.size; weightindex++) {
        currentweight += weights[weightindex];
        if (var_d54615ef <= currentweight) {
            itemlistbundle = getscriptbundle(itemlistbundle.itemlist[weightindex].itementry);
            assert(itemlistbundle.type === "<dev string:x6f>");
            break;
        }
    }
    return itemlistbundle;
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x5 linked
// Checksum 0x9723bfbe, Offset: 0x5c0
// Size: 0xe
function private function_6a5c090c() {
    level.var_de3d5d56 = undefined;
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x1 linked
// Checksum 0xc727abcd, Offset: 0x5d8
// Size: 0x21a
function function_9e9f43cd() {
    if (!level flagsys::get(#"hash_67b445a4b1d59922") && !level flagsys::get(#"hash_11c9cde7b522c5a9")) {
        assert(0);
        return;
    }
    foreach (targetname, points in level.var_1d777960) {
        for (index = 0; index < points.size; index++) {
            origin = points[index].origin;
            angles = points[index].angles;
            ground_pos = physicstraceex(origin + (0, 0, 24), origin - (0, 0, 96), (0, 0, 0), (0, 0, 0), undefined, 32);
            position = ground_pos[#"position"];
            function_53a81463(position, angles, targetname, #"");
        }
        if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
            waitframe(1);
            level.var_d0676b07 = getrealtime();
        }
    }
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x1 linked
// Checksum 0xc6fd4d7a, Offset: 0x800
// Size: 0x1e8
function function_e88ecf7f() {
    if (!level flagsys::get(#"hash_67b445a4b1d59922") && !level flagsys::get(#"hash_11c9cde7b522c5a9")) {
        assert(0);
        return;
    }
    assert(level.var_bf9b06d3.size == level.var_8d50adaa.size);
    for (index = 0; index < level.var_bf9b06d3.size; index++) {
        points = function_abaeb170(level.var_bf9b06d3[index], undefined, undefined, level.var_8d50adaa[index], undefined, 0);
        for (pointindex = 0; pointindex < points.size; pointindex++) {
            function_b2cf8bc6(points[pointindex].id, #"");
            if (isdefined(points[pointindex].targetname)) {
                level.var_28cd0b1f[points[pointindex].targetname] = 1;
            }
        }
        if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
            waitframe(1);
            level.var_d0676b07 = getrealtime();
        }
    }
}

// Namespace namespace_65181344/namespace_65181344
// Params 2, eflags: 0x5 linked
// Checksum 0x1a261b57, Offset: 0x9f0
// Size: 0x12e
function private function_35461e5f(row, stashitem = 0) {
    items = [];
    item_name = self.itemlistbundle.itemlist[row].itementry;
    item = function_62c0d32d(item_name, stashitem);
    if (isdefined(item)) {
        items[items.size] = item;
    }
    for (index = 1; index <= 5; index++) {
        item_name = self.itemlistbundle.itemlist[row].("childitementry_" + index);
        if (!isdefined(item_name)) {
            continue;
        }
        item = function_62c0d32d(item_name, stashitem);
        if (isdefined(item)) {
            items[items.size] = item;
        }
    }
    return items;
}

// Namespace namespace_65181344/namespace_65181344
// Params 2, eflags: 0x5 linked
// Checksum 0x8fc72c7d, Offset: 0xb28
// Size: 0x27a
function private function_62c0d32d(item_name, stashitem = 0) {
    if (isdefined(item_name) && isdefined(level.var_4afb8f5a[item_name])) {
        item_name = level.var_4afb8f5a[item_name];
    }
    if (!isdefined(item_name) || item_name == "") {
        return;
    }
    itemspawnpoint = function_4ba8fde(item_name);
    if (!isdefined(itemspawnpoint)) {
        return;
    }
    origin = (0, 0, 0);
    angles = (0, 0, 0);
    if (!stashitem) {
        origin = self.origin;
        angles = self.angles;
    }
    itementry = isdefined(level.var_de3d5d56) ? level.var_de3d5d56[item_name] : getscriptbundle(item_name);
    weapon = item_world_util::function_35e06774(itementry, isdefined(itementry.attachments));
    itemcount = isdefined(itementry.amount) ? itementry.amount : 1;
    var_aec6fa7f = 0;
    if (itementry.itemtype == #"weapon") {
        var_aec6fa7f = itementry.amount * weapon.clipsize;
    } else if (itementry.itemtype == #"armor" || itementry.itemtype == #"ammo") {
        var_aec6fa7f = itementry.amount;
        itemcount = 1;
    }
    item = item_drop::drop_item(weapon, itemcount, var_aec6fa7f, itemspawnpoint.id, origin, angles, stashitem);
    if (isdefined(item)) {
        item.spawning = 1;
    }
    return item;
}

// Namespace namespace_65181344/namespace_65181344
// Params 1, eflags: 0x5 linked
// Checksum 0x3e344f68, Offset: 0xdb0
// Size: 0x88
function private function_98013deb(row) {
    numchildren = 0;
    for (index = 1; index <= 5; index++) {
        item_name = self.itemlistbundle.itemlist[row].("childitementry_" + index);
        if (isdefined(item_name)) {
            numchildren++;
        }
    }
    return numchildren;
}

// Namespace namespace_65181344/namespace_65181344
// Params 3, eflags: 0x5 linked
// Checksum 0x23f0cf98, Offset: 0xe40
// Size: 0xb3e
function private _spawn_item(point, row, stashitem = 0) {
    if (!isdefined(point)) {
        return;
    }
    item_name = self.itemlistbundle.itemlist[row].itementry;
    if (isdefined(item_name) && isdefined(level.var_4afb8f5a[item_name])) {
        item_name = level.var_4afb8f5a[item_name];
    }
    if (!isdefined(item_name) || item_name == "") {
        function_43cd95f4(point.id, "");
        /#
            if (!isdefined(level.var_d80c35aa[#"blank"])) {
                level.var_d80c35aa[#"blank"] = 0;
            }
            level.var_d80c35aa[#"blank"]++;
        #/
        return;
    }
    itementry = isdefined(level.var_de3d5d56) ? level.var_de3d5d56[item_name] : getscriptbundle(item_name);
    /#
        if (!stashitem && isdefined(itementry) && isdefined(itementry.itemtype)) {
            if (!isdefined(level.var_d80c35aa[itementry.itemtype])) {
                level.var_d80c35aa[itementry.itemtype] = 0;
            }
            level.var_d80c35aa[itementry.itemtype]++;
        }
    #/
    if (!isdefined(itementry) || !isdefined(itementry.itemtype) || itementry.itemtype == #"blank") {
        function_43cd95f4(point.id, "");
        return;
    } else if (itementry.itemtype == #"vehicle") {
        ground_pos = bullettrace(point.origin + (0, 0, 128), point.origin - (0, 0, 128), 0, undefined, 1);
        if (ground_pos[#"surfacetype"] == "water" || ground_pos[#"surfacetype"] == "watershallow") {
            ground_pos = bullettrace(point.origin + (0, 0, 2048), point.origin - (0, 0, 2048), 0, undefined, 1);
        }
        spawnpoint = ground_pos[#"position"] + (0, 0, 36);
        vehicle = undefined;
        if (item_world_util::function_74e1e547(spawnpoint)) {
            vehicle = spawnvehicle(itementry.vehicle, spawnpoint, point.angles);
        }
        if (isdefined(vehicle)) {
            level.item_vehicles[level.item_vehicles.size] = vehicle;
            level.var_8819644a[level.var_8819644a.size] = {#origin:vehicle.origin, #vehicletype:vehicle.vehicletype, #vehicle:vehicle, #used:0};
            if (isairborne(vehicle)) {
                spawnoffset = (0, 0, vehicle.height);
                vehicle.origin = point.origin + spawnoffset;
            }
            vehicle makeusable();
            if (isdefined(vehicle.isphysicsvehicle) && vehicle.isphysicsvehicle) {
                vehicle setbrake(1);
            }
            if (isdefined(getgametypesetting(#"hash_59ab05f71c3789c7")) && getgametypesetting(#"hash_59ab05f71c3789c7")) {
                target_remove(vehicle);
            }
        }
        function_43cd95f4(point.id, "");
        /#
            level.var_f2db6a7f++;
        #/
        if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
            waitframe(1);
            level.var_d0676b07 = getrealtime();
        }
        return;
    }
    numchildren = self function_98013deb(row);
    if (!stashitem) {
        origin = point.origin;
        angles = point.angles;
        if (numchildren > 0) {
            if (!isdefined(itementry.var_47f145b4)) {
                angles = (0, angleclamp180(origin[0] + origin[1] + origin[2]), 0);
                forward = anglestoforward(angles) * level.var_69dda516[0];
                offset = rotatepoint(forward, (0, level.var_cc113617[0], 0));
                origin += offset;
                ground_pos = physicstraceex(origin + (0, 0, 24), origin - (0, 0, 96), (0, 0, 0), (0, 0, 0), undefined, 32);
                origin = ground_pos[#"position"];
                normal = ground_pos[#"normal"];
                angles = function_c1fa62a2(angles, normal);
            }
        } else if (!isdefined(itementry.var_47f145b4)) {
            angles = combineangles(angles, (0, angleclamp180(origin[0] + origin[1] + origin[2]), 0));
        } else {
            angles = (0, angles[1], 0);
        }
        angles = combineangles(angles, (isdefined(itementry.angleoffsetx) ? itementry.angleoffsetx : 0, isdefined(itementry.angleoffsety) ? itementry.angleoffsety : 0, isdefined(itementry.angleoffsetz) ? itementry.angleoffsetz : 0));
        originoffset = (isdefined(itementry.positionoffsetx) ? itementry.positionoffsetx : 0, isdefined(itementry.positionoffsety) ? itementry.positionoffsety : 0, isdefined(itementry.positionoffsetz) ? itementry.positionoffsetz : 0);
        origin += originoffset;
        if (numchildren > 0 || isdefined(itementry.var_47f145b4)) {
            point = function_53a81463(origin, angles, point.targetname, item_name);
        } else {
            function_b97dfce0(point.id, origin);
            function_3eab95b5(point.id, angles);
            point.angles = angles;
        }
    }
    function_43cd95f4(point.id, item_name);
    if (item_name == #"sig_blade_wz_item") {
        level.var_5b2a8d88[point.id] = 1;
    }
    if (stashitem) {
        function_54ca5536(point.id, -1);
    }
    /#
        if (stashitem) {
            if (!isdefined(level.var_ecf16fd3[itementry.itemtype])) {
                level.var_ecf16fd3[itementry.itemtype] = 0;
            }
            level.var_ecf16fd3[itementry.itemtype]++;
            level.var_2850ef5++;
        } else {
            level.var_136445c0++;
        }
    #/
    if (numchildren > 0) {
        for (index = 1; index <= 5; index++) {
            item_name = self.itemlistbundle.itemlist[row].("childitementry_" + index);
            if (isdefined(item_name)) {
                function_f0e5262b(item_name, point, index, stashitem, point.targetname);
            }
        }
    }
}

// Namespace namespace_65181344/namespace_65181344
// Params 5, eflags: 0x5 linked
// Checksum 0xfbb1dc52, Offset: 0x1988
// Size: 0x50c
function private function_f0e5262b(item_name, point, childindex, stashitem = 0, targetname) {
    if (isdefined(level.var_4afb8f5a[item_name])) {
        item_name = level.var_4afb8f5a[item_name];
    }
    itementry = isdefined(level.var_de3d5d56) ? level.var_de3d5d56[item_name] : getscriptbundle(item_name);
    offset = (0, 0, 0);
    angles = (0, 0, 0);
    origin = point.origin;
    if (!stashitem) {
        assert(childindex > 0 && childindex <= 5);
        parentangles = (0, point.angles[1], 0);
        degree = level.var_cc113617[childindex];
        distance = level.var_69dda516[childindex];
        offset = (cos(degree) * distance, sin(degree) * distance, 0);
        offset = rotatepoint(offset, parentangles);
        origin += offset;
        ground_pos = physicstraceex(origin + (0, 0, 24), origin - (0, 0, 96), (0, 0, 0), (0, 0, 0), undefined, 32);
        var_f05b52fe = (isdefined(itementry.positionoffsetx) ? itementry.positionoffsetx : 0, isdefined(itementry.positionoffsety) ? itementry.positionoffsety : 0, isdefined(itementry.positionoffsetz) ? itementry.positionoffsetz : 0);
        origin = ground_pos[#"position"] + var_f05b52fe;
        normal = ground_pos[#"normal"];
        angles += (0, level.var_82e94a26[childindex], 0);
        angles += (0, point.angles[1], 0);
        angles = function_c1fa62a2(angles, normal);
        angles = combineangles(angles, (isdefined(itementry.angleoffsetx) ? itementry.angleoffsetx : 0, isdefined(itementry.angleoffsety) ? itementry.angleoffsety : 0, isdefined(itementry.angleoffsetz) ? itementry.angleoffsetz : 0));
        if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
            waitframe(1);
            level.var_d0676b07 = getrealtime();
        }
    }
    var_23972ae0 = function_53a81463(origin, angles, targetname, item_name);
    if (stashitem) {
        function_54ca5536(var_23972ae0.id, -1);
    }
    /#
        if (stashitem) {
            if (!isdefined(level.var_ecf16fd3[itementry.itemtype])) {
                level.var_ecf16fd3[itementry.itemtype] = 0;
            }
            level.var_ecf16fd3[itementry.itemtype]++;
            level.var_2850ef5++;
            return;
        }
        if (!isdefined(level.var_8d9ad8e8[itementry.itemtype])) {
            level.var_8d9ad8e8[itementry.itemtype] = 0;
        }
        level.var_8d9ad8e8[itementry.itemtype]++;
        level.var_5720c09a++;
    #/
}

// Namespace namespace_65181344/namespace_65181344
// Params 1, eflags: 0x5 linked
// Checksum 0x236e67a2, Offset: 0x1ea0
// Size: 0x5c6
function private function_ea39d1fa(stash) {
    stash.var_aa9f8f87 = self.scriptbundlename;
    var_aa9f8f87 = self.itemlistbundle;
    if (isdefined(var_aa9f8f87) && isdefined(level.var_fb9a8536[var_aa9f8f87.name])) {
        var_aa9f8f87 = getscriptbundle(level.var_fb9a8536[var_aa9f8f87.name]);
    }
    var_eff83f3 = var_aa9f8f87;
    if (isdefined(level.var_93c59949[var_aa9f8f87.name])) {
        var_cf36f90d = level.var_93c59949[var_aa9f8f87.name];
        for (index = 0; index < var_cf36f90d.size; index++) {
            randindex = function_d59c2d03(var_cf36f90d.size);
            var_ec7042e9 = var_cf36f90d[index];
            var_cf36f90d[index] = var_cf36f90d[randindex];
            var_cf36f90d[randindex] = var_ec7042e9;
        }
        foreach (var_ee110db8 in var_cf36f90d) {
            if (isdefined(var_ee110db8.var_52a66db0)) {
                if (stash.targetname !== var_ee110db8.var_52a66db0) {
                    continue;
                }
            }
            if (var_ee110db8.count == 0) {
                continue;
            }
            var_1dd9b7f1 = getscriptbundle(var_ee110db8.replacement);
            if (var_1dd9b7f1.type !== #"itemspawnlist") {
                assert(0, "<dev string:x7f>" + var_ee110db8);
                continue;
            }
            var_eff83f3 = var_1dd9b7f1;
            self.itemlistbundle = var_eff83f3;
            if (var_ee110db8.count > 0) {
                var_ee110db8.count--;
            }
            break;
        }
    }
    for (row = 0; row < var_eff83f3.itemlist.size; row++) {
        if (!isdefined(var_eff83f3.itemlist[row].itementry)) {
            continue;
        }
        itemlistbundle = getscriptbundle(var_eff83f3.itemlist[row].itementry);
        var_bbe618cc = itemlistbundle.type == #"itemspawnlist" || itemlistbundle.type == #"itemspawnlistalias";
        available = isdefined(var_eff83f3.itemlist[row].available) ? var_eff83f3.itemlist[row].available : 0;
        var_8107154f = [];
        do {
            point = function_53a81463(stash.origin, stash.angles, isdefined(stash.targetname) ? stash.targetname : stash.target, "");
            var_8107154f[var_8107154f.size] = point.id;
            if (!var_bbe618cc) {
                _spawn_item(point, row, 1);
            }
            available--;
        } while (available > 0);
        if (var_bbe618cc) {
            if (itemlistbundle.type == #"itemspawnlistalias") {
                var_12ab6449 = function_440f0490(itemlistbundle);
                if (!isdefined(var_12ab6449)) {
                    continue;
                }
                itemlistbundle = var_12ab6449;
            }
            if (isdefined(itemlistbundle) && isdefined(level.var_fb9a8536[itemlistbundle.name])) {
                itemlistbundle = getscriptbundle(level.var_fb9a8536[itemlistbundle.name]);
            }
            itemspawnlist = spawnstruct();
            itemspawnlist.itemlistbundle = itemlistbundle;
            itemspawnlist function_e25c9d12(var_8107154f, var_8107154f.size, 1);
        }
        if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
            waitframe(1);
            level.var_d0676b07 = getrealtime();
        }
    }
    self.itemlistbundle = var_aa9f8f87;
}

// Namespace namespace_65181344/namespace_65181344
// Params 2, eflags: 0x5 linked
// Checksum 0xfc49d908, Offset: 0x2470
// Size: 0x75e
function private function_216a69d6(spawnchance, reset) {
    dynents = array();
    if (isdefined(self.target)) {
        dynents = getdynentarray(self.target, 1);
    }
    if (isdefined(self.targetname)) {
        var_ed91073b = function_c79d31c4(self.targetname, 1);
        dynents = arraycombine(dynents, var_ed91073b, 1, 0);
    }
    for (index = 0; index < self.points.size; index++) {
        randindex = function_d59c2d03(self.points.size);
        tempid = self.points[index];
        self.points[index] = self.points[randindex];
        self.points[randindex] = tempid;
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    maxspawns = isdefined(self.itemlistbundle.var_9b009839) ? self.itemlistbundle.var_9b009839 : 0;
    var_418a2e03 = [];
    foreach (dynent in dynents) {
        level.item_spawn_stashes[level.item_spawn_stashes.size] = dynent;
        dynent.lootlocker = self.itemlistbundle.lootlocker;
        if (isdefined(dynent.lootlocker) && dynent.lootlocker) {
        }
        randint = function_d59c2d03(100);
        shouldspawn = randint <= spawnchance;
        if (maxspawns > -1 && var_418a2e03.size >= maxspawns) {
            shouldspawn = 0;
        }
        if (shouldspawn && reset) {
            var_418a2e03[var_418a2e03.size] = dynent;
            continue;
        }
        setdynentenabled(dynent, 0);
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    var_c041d1bd = 0;
    var_a9826383 = 0;
    for (pointindex = 0; var_c041d1bd < var_418a2e03.size; pointindex++) {
        if (pointindex >= self.points.size) {
            if (var_a9826383) {
                break;
            }
            var_a9826383 = 1;
            pointindex = 0;
        }
        if (self.points[pointindex] == -1) {
            continue;
        }
        point = function_b1702735(self.points[pointindex]);
        if (point.hidetime == -1) {
            continue;
        }
        if (isdefined(self.itemlistbundle.var_7fb0967b) && !var_a9826383) {
            var_1ba7b9c8 = arraysortclosest(level.var_5ce07338, point.origin, 1, 0, self.itemlistbundle.var_7fb0967b);
            if (var_1ba7b9c8.size > 0) {
                continue;
            }
        }
        function_54ca5536(self.points[pointindex], -1);
        self.points[pointindex] = -1;
        dynent = var_418a2e03[var_c041d1bd];
        dynent.angles = point.angles;
        dynent.origin = point.origin;
        dynent.hintstring = self.itemlistbundle.hintstring;
        dynent.displayname = self.itemlistbundle.displayname;
        dynent.var_3d685b35 = isdefined(self.itemlistbundle.var_3d685b35) ? self.itemlistbundle.var_3d685b35 : 0;
        level.var_5ce07338[level.var_5ce07338.size] = dynent;
        targetname = isdefined(dynent.targetname) ? dynent.targetname : dynent.target;
        if (!isdefined(level.var_93d08989[targetname])) {
            level.var_93d08989[targetname] = array();
        }
        var_2a4308b9 = level.var_93d08989[targetname].size;
        level.var_93d08989[targetname][var_2a4308b9] = dynent;
        setdynentenabled(dynent, 1);
        function_e2a06860(dynent, 0);
        self function_ea39d1fa(dynent);
        var_c041d1bd++;
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    for (var_63d7a070 = var_c041d1bd; var_63d7a070 < var_418a2e03.size; var_63d7a070++) {
        dynent = var_418a2e03[var_63d7a070];
        setdynentenabled(dynent, 0);
    }
}

// Namespace namespace_65181344/namespace_65181344
// Params 1, eflags: 0x5 linked
// Checksum 0x3f2d204c, Offset: 0x2bd8
// Size: 0x9c
function private _spawn(reset) {
    if (isdefined(self.itemlistbundle.supplystash) && self.itemlistbundle.supplystash) {
        self function_216a69d6(isdefined(self.itemlistbundle.var_fde72c94) ? self.itemlistbundle.var_fde72c94 : 100, reset);
        return;
    }
    self function_e25c9d12(self.var_8107154f, self.var_8107154f.size);
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x5 linked
// Checksum 0x9f19e227, Offset: 0x2c80
// Size: 0x242
function private _setup() {
    self.itemlistbundle = getscriptbundle(self.scriptbundlename);
    if (isdefined(self.itemlistbundle) && isdefined(level.var_fb9a8536[self.itemlistbundle.name])) {
        self.itemlistbundle = getscriptbundle(level.var_fb9a8536[self.itemlistbundle.name]);
    }
    assert(isdefined(self.itemlistbundle), "<dev string:xc6>" + self.scriptbundlename + "<dev string:xd7>");
    assert(isdefined(self.itemlistbundle.itemlist), "<dev string:xc6>" + self.scriptbundlename + "<dev string:x63>");
    self.remaining = isdefined(self.count) ? self.count : 0;
    self.points = function_d0dc448b(self.target);
    self.var_8107154f = [];
    foreach (pointid in self.points) {
        self.var_8107154f[pointid] = pointid;
    }
    if (!isdefined(level.var_28cd0b1f[self.target])) {
        assert(isdefined(self.points) && self.points.size > 0, "<dev string:xe4>" + self.itemlistbundle.name + "<dev string:xf5>" + self.target);
    }
    if (!isdefined(self.points)) {
        self.points = [];
    }
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x5 linked
// Checksum 0x87ba8a9e, Offset: 0x2ed0
// Size: 0x76
function private _teardown() {
    self.points = undefined;
    self.var_8107154f = undefined;
    self.itemlistbundle = undefined;
    self.angles = undefined;
    self.available = undefined;
    self.var_ccc6d5b7 = undefined;
    self.modelscale = undefined;
    self.remaining = undefined;
    self.var_3ddde668 = undefined;
    self.var_5d3a106 = undefined;
    self.var_202d2992 = undefined;
    self.rows = undefined;
    self.weights = undefined;
    self.weighttotal = undefined;
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x1 linked
// Checksum 0x78a3caf7, Offset: 0x2f50
// Size: 0x44
function function_3095d12a() {
    if (isdefined(level.var_ccc3aaf)) {
        return;
    }
    level.var_ccc3aaf = 1;
    flagsys::set(#"item_world_traces");
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x5 linked
// Checksum 0x212e03f2, Offset: 0x2fa0
// Size: 0xa4
function private function_9db93def() {
    assert(isdefined(self.target) && self.target != "<dev string:x130>", "<dev string:x133>" + self.origin + "<dev string:x150>");
    assert(self.target !== self.targetname, "<dev string:x133>" + self.origin + "<dev string:x172>" + self.target + "<dev string:x1ae>");
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x5 linked
// Checksum 0xbe8de2eb, Offset: 0x3050
// Size: 0x2a
function private function_6b9be08d() {
    return getdvarint(#"hash_21e070fbb56cf0f", 1);
}

// Namespace namespace_65181344/namespace_65181344
// Params 4, eflags: 0x5 linked
// Checksum 0xd8d56baf, Offset: 0x3088
// Size: 0x1364
function private function_e25c9d12(&var_8107154f, spawncount, stashitem = 0, &var_a1b91de4 = undefined) {
    if (!isstruct(self)) {
        assert(0);
        return;
    }
    /#
        if (isdefined(self.points) && isdefined(self.target)) {
            level.var_2e96a450[self.target] = self.points.size;
        }
    #/
    assert(isstruct(self));
    assert(isarray(var_8107154f));
    assert(isint(spawncount));
    assert(isdefined(self.itemlistbundle));
    assert(!(isdefined(self.vehiclespawner) && self.vehiclespawner));
    assert(!(isdefined(self.supplystash) && self.supplystash));
    if (spawncount <= 0) {
        return;
    }
    items = [];
    self.rows = isdefined(self.itemlistbundle.itemlist.size) ? self.itemlistbundle.itemlist.size : 0;
    self.count = spawncount;
    self.available = [];
    self.weights = [];
    self.weighttotal = 0;
    for (row = 0; row < self.rows; row++) {
        self.available[row] = isdefined(self.itemlistbundle.itemlist[row].available) ? self.itemlistbundle.itemlist[row].available : 0;
        if (self.available[row] != 0) {
            var_35843db5 = isdefined(self.itemlistbundle.itemlist[row].minweight) ? self.itemlistbundle.itemlist[row].minweight : 0;
            var_ccef9e25 = isdefined(self.itemlistbundle.itemlist[row].maxweight) ? self.itemlistbundle.itemlist[row].maxweight : 0;
            minweight = int(min(var_35843db5, var_ccef9e25));
            maxweight = int(max(var_35843db5, var_ccef9e25));
            diff = maxweight - minweight;
            weight = function_d59c2d03(diff + 1) + minweight;
            self.weights[row] = weight;
            self.weighttotal += self.weights[row];
        }
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    var_399d601b = spawncount;
    var_413b71b8 = self.weighttotal;
    self.weighttotal = 0;
    for (row = 0; row < self.rows; row++) {
        if (self.available[row] == 0) {
            continue;
        }
        if (self.available[row] < 0) {
            self.weighttotal += self.weights[row];
            continue;
        }
        points = self.weights[row] / var_413b71b8 * var_399d601b;
        if (points > self.available[row]) {
            self.weights[row] = 2147483647;
            spawncount -= self.available[row];
            continue;
        }
        self.weighttotal += self.weights[row];
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    self.var_202d2992 = [];
    self.var_3ddde668 = [];
    self.var_43feff59 = 0;
    self.var_5d3a106 = 0;
    totalspawncount = spawncount / max(self.weighttotal, 1);
    for (row = 0; row < self.rows; row++) {
        if (self.available[row] != 0) {
            if (self.weights[row] == 2147483647) {
                points = self.available[row];
            } else {
                points = self.weights[row] * totalspawncount;
            }
            self.var_202d2992[row] = int(floor(points));
            self.var_3ddde668[row] = int((points - self.var_202d2992[row]) * 1000);
            self.var_43feff59 += self.var_202d2992[row];
            self.var_5d3a106 += self.var_3ddde668[row];
        }
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    arrayremovevalue(self.var_202d2992, 0, 1);
    arrayremovevalue(self.var_3ddde668, 0, 1);
    assert(self.var_43feff59 <= var_399d601b);
    var_c499a7fa = getarraykeys(self.var_3ddde668);
    if (self.var_5d3a106 > 0) {
        for (pointindex = self.var_43feff59; pointindex < spawncount && self.var_5d3a106 > 0; pointindex++) {
            randomval = function_d59c2d03(self.var_5d3a106);
            var_28ef6352 = 0;
            for (var_56c03814 = 0; var_56c03814 < self.var_3ddde668.size; var_56c03814++) {
                var_75aa5cbb = var_c499a7fa[var_c499a7fa.size - var_56c03814 - 1];
                if (self.available[var_75aa5cbb] != 0) {
                    var_cc5fea3d = var_28ef6352 + self.var_3ddde668[var_75aa5cbb];
                    if (var_28ef6352 <= randomval && randomval <= var_cc5fea3d) {
                        self.var_5d3a106 -= self.var_3ddde668[var_75aa5cbb];
                        self.var_3ddde668[var_75aa5cbb] = 0;
                        self.var_202d2992[var_75aa5cbb] = (isdefined(self.var_202d2992[var_75aa5cbb]) ? self.var_202d2992[var_75aa5cbb] : 0) + 1;
                        self.var_43feff59++;
                        break;
                    }
                    var_28ef6352 = var_cc5fea3d;
                }
            }
        }
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    assert(self.var_43feff59 <= var_399d601b);
    if (!isdefined(var_a1b91de4)) {
        var_a1b91de4 = getarraykeys(var_8107154f);
        for (index = 0; index < var_8107154f.size; index++) {
            randindex = function_d59c2d03(var_8107154f.size);
            tempid = var_8107154f[var_a1b91de4[randindex]];
            var_8107154f[var_a1b91de4[randindex]] = var_8107154f[var_a1b91de4[index]];
            var_8107154f[var_a1b91de4[index]] = tempid;
        }
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    self.var_ccc6d5b7 = [];
    var_7a7ab6bf = 0;
    var_a9826383 = 0;
    arraykeys = getarraykeys(self.var_202d2992);
    var_f5111345 = 0;
    for (pointindex = 0; var_f5111345 < arraykeys.size && var_7a7ab6bf < self.count; pointindex++) {
        if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
            waitframe(1);
            level.var_d0676b07 = getrealtime();
        }
        var_75aa5cbb = arraykeys[var_f5111345];
        if (pointindex >= var_8107154f.size) {
            assert(var_a9826383 === 0);
            var_a9826383 = 1;
            pointindex = 0;
        }
        if (var_8107154f[var_a1b91de4[pointindex]] == -1) {
            continue;
        }
        itementry = self.itemlistbundle.itemlist[var_75aa5cbb].itementry;
        if (isdefined(itementry) && itementry != "") {
            scriptbundle = isdefined(level.var_de3d5d56) && isdefined(level.var_de3d5d56[itementry]) ? level.var_de3d5d56[itementry] : getscriptbundle(itementry);
            if (isdefined(scriptbundle) && isdefined(scriptbundle.type) && (scriptbundle.type == #"itemspawnlist" || scriptbundle.type == #"itemspawnlistalias")) {
                self.var_ccc6d5b7[var_75aa5cbb] = self.var_202d2992[var_75aa5cbb];
                self.var_202d2992[var_75aa5cbb] = 0;
                var_f5111345++;
                continue;
            }
        }
        if (var_8107154f[var_a1b91de4[pointindex]] == -2) {
            spawnitems = self function_35461e5f(var_75aa5cbb, stashitem);
            items = arraycombine(items, spawnitems, 1, 0);
        } else {
            itemspawnpoint = function_b1702735(var_8107154f[var_a1b91de4[pointindex]]);
            if (isdefined(self.itemlistbundle.var_7fb0967b) && !var_a9826383) {
                var_8822f354 = 0;
                itemtype = undefined;
                if (isdefined(itementry)) {
                    scriptbundle = isdefined(level.var_de3d5d56) && isdefined(level.var_de3d5d56[itementry]) ? level.var_de3d5d56[itementry] : getscriptbundle(itementry);
                    if (isdefined(scriptbundle)) {
                        itemtype = scriptbundle.itemtype;
                    }
                }
                if (isdefined(self.itemlistbundle.var_dc7ffbef) && isdefined(itemtype)) {
                    if (itemtype == #"vehicle") {
                        vehicles = getvehiclearray();
                        nearbyvehicles = arraysortclosest(vehicles, itemspawnpoint.origin, 1, 0, self.itemlistbundle.var_7fb0967b);
                        var_8822f354 = nearbyvehicles.size;
                    } else {
                        var_8822f354 = function_579fdc53(itemspawnpoint.origin, undefined, itemtype, self.itemlistbundle.var_7fb0967b, -1, -2147483647);
                    }
                } else {
                    var_8822f354 = function_6de8969b(itemspawnpoint.origin, undefined, self.itemlistbundle.var_7fb0967b, -1, 1, -2147483647);
                }
                if (var_8822f354 > 0) {
                    continue;
                }
            }
            self _spawn_item(itemspawnpoint, var_75aa5cbb, stashitem);
        }
        var_8107154f[var_a1b91de4[pointindex]] = -1;
        self.var_202d2992[var_75aa5cbb]--;
        var_7a7ab6bf++;
        if (self.var_202d2992[var_75aa5cbb] == 0) {
            var_f5111345++;
        }
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    for (index = 0; index < self.itemlistbundle.itemlist.size; index++) {
        if (!isdefined(self.var_ccc6d5b7[index])) {
            continue;
        }
        itemlist = self.itemlistbundle.itemlist[index];
        if (!isdefined(itemlist.itementry) || itemlist.itementry === "") {
            continue;
        }
        itemlistbundle = getscriptbundle(itemlist.itementry);
        if (!isdefined(itemlistbundle.type) || itemlistbundle.type != #"itemspawnlist" && itemlistbundle.type != #"itemspawnlistalias") {
            continue;
        }
        if (itemlistbundle.type == #"itemspawnlistalias") {
            var_12ab6449 = function_440f0490(itemlistbundle);
            if (!isdefined(var_12ab6449)) {
                continue;
            }
            itemlistbundle = var_12ab6449;
        }
        if (isdefined(itemlistbundle) && isdefined(level.var_fb9a8536[itemlistbundle.name])) {
            itemlistbundle = getscriptbundle(level.var_fb9a8536[itemlistbundle.name]);
        }
        itemspawnlist = spawnstruct();
        itemspawnlist.itemlistbundle = itemlistbundle;
        itemspawnlist.origin = self.origin;
        itemspawnlist.angles = self.angles;
        var_4168f4f3 = itemspawnlist function_e25c9d12(var_8107154f, self.var_ccc6d5b7[index], stashitem, var_a1b91de4);
        items = arraycombine(items, var_4168f4f3, 1, 0);
    }
    return items;
}

// Namespace namespace_65181344/namespace_65181344
// Params 1, eflags: 0x5 linked
// Checksum 0x6d0b1790, Offset: 0x43f8
// Size: 0x4c4
function private function_c6477714(reset) {
    override = spawnstruct();
    override.scriptbundlename = #"prematch_override_list";
    override.itemlistbundle = getscriptbundle(override.scriptbundlename);
    override.var_ebfb74b9 = function_8322cf16();
    var_8107154f = [];
    for (index = 0; index < override.var_ebfb74b9; index++) {
        var_8107154f[index] = index;
    }
    item_spawn_groups = struct::get_array("scriptbundle_itemspawnlist", "classname");
    foreach (group in item_spawn_groups) {
        group.itemlistbundle = getscriptbundle(group.scriptbundlename);
        if (isdefined(group.itemlistbundle.vehiclespawner) && group.itemlistbundle.vehiclespawner) {
            spawnpoints = function_91b29d2a(group.target);
            foreach (spawnpoint in spawnpoints) {
                var_8107154f[spawnpoint.id] = -1;
                override.var_ebfb74b9--;
            }
            group function_9db93def();
            group _setup();
            group _spawn(reset);
        }
    }
    foreach (group in item_spawn_groups) {
        group.itemlistbundle = getscriptbundle(group.scriptbundlename);
        if (isdefined(group.itemlistbundle.supplystash) && group.itemlistbundle.supplystash) {
            dynents = getdynentarray(group.target, 1);
            foreach (dynent in dynents) {
                level.item_spawn_stashes[level.item_spawn_stashes.size] = dynent;
                setdynentenabled(dynent, 0);
            }
            spawnpoints = function_91b29d2a(group.target);
            foreach (spawnpoint in spawnpoints) {
                var_8107154f[spawnpoint.id] = -1;
                override.var_ebfb74b9--;
            }
        }
    }
    override function_e25c9d12(var_8107154f, override.var_ebfb74b9);
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x1 linked
// Checksum 0x4591f687, Offset: 0x48c8
// Size: 0x134
function function_62fdaf9e() {
    keys = getarraykeys(level.struct);
    for (index = 0; index < keys.size; index++) {
        key = keys[index];
        value = level.struct[key];
        if (!isdefined(value)) {
            continue;
        }
        if (isdefined(value.classname) && value.classname == #"scriptbundle_itemspawnlist") {
            level.struct[key] = undefined;
        }
        if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
            waitframe(1);
            level.var_d0676b07 = getrealtime();
        }
    }
    arrayremovevalue(level.struct, undefined, 0);
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x1 linked
// Checksum 0x5ce1d65d, Offset: 0x4a08
// Size: 0x54
function init_spawn_system() {
    level.var_d0676b07 = getrealtime();
    level.var_3e9c9a35 = 30;
    function_2c4d3d40();
    function_3095d12a();
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x1 linked
// Checksum 0xaee4bde7, Offset: 0x4a68
// Size: 0x4c
function is_enabled() {
    return isdefined(getgametypesetting(#"useitemspawns")) && getgametypesetting(#"useitemspawns");
}

// Namespace namespace_65181344/namespace_65181344
// Params 0, eflags: 0x1 linked
// Checksum 0x68a3fd88, Offset: 0x4ac0
// Size: 0x5c2
function reset_items() {
    originalpoints = function_c77ddcd6();
    for (pointid = 0; pointid < originalpoints; pointid++) {
        point = function_b1702735(pointid);
        itementry = point.itementry;
        if (!isdefined(itementry)) {
            continue;
        }
        origin = point.origin;
        angles = point.angles;
        angles = function_bdd10bae(angles, (isdefined(itementry.angleoffsetx) ? itementry.angleoffsetx : 0, isdefined(itementry.angleoffsety) ? itementry.angleoffsety : 0, isdefined(itementry.angleoffsetz) ? itementry.angleoffsetz : 0));
        if (!isdefined(itementry.var_47f145b4)) {
            angles = function_bdd10bae(angles, (0, angleclamp180(origin[0] + origin[1] + origin[2]), 0));
        }
        originoffset = ((isdefined(itementry.positionoffsetx) ? itementry.positionoffsetx : 0) * -1, (isdefined(itementry.positionoffsety) ? itementry.positionoffsety : 0) * -1, (isdefined(itementry.positionoffsetz) ? itementry.positionoffsetz : 0) * -1);
        origin += originoffset;
        function_b97dfce0(point.id, origin);
        function_3eab95b5(point.id, angles);
        if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
            waitframe(1);
            level.var_d0676b07 = getrealtime();
        }
    }
    function_682385e7();
    if (isarray(level.item_spawn_drops)) {
        foreach (item in level.item_spawn_drops) {
            if (isdefined(item)) {
                item delete();
            }
        }
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    level.item_spawn_drops = [];
    if (isarray(level.var_8ac64bf3)) {
        foreach (stash in level.var_8ac64bf3) {
            if (isdefined(stash)) {
                stash delete();
            }
        }
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    level.var_8ac64bf3 = [];
    if (isarray(level.item_vehicles)) {
        foreach (vehicle in level.item_vehicles) {
            if (isdefined(vehicle)) {
                vehicle delete();
            }
        }
    }
    if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
        waitframe(1);
        level.var_d0676b07 = getrealtime();
    }
    level.item_vehicles = [];
    level.var_8819644a = [];
    level.item_spawn_drops = [];
}

// Namespace namespace_65181344/namespace_65181344
// Params 3, eflags: 0x1 linked
// Checksum 0x755da753, Offset: 0x5090
// Size: 0x3ee
function function_50a2c746(&var_f38d5b52, reset = 1, var_87e9f374 = 0) {
    assert(isarray(var_f38d5b52));
    /#
        if (var_87e9f374) {
        }
    #/
    item_spawn_groups = struct::get_array("scriptbundle_itemspawnlist", "classname");
    foreach (group in item_spawn_groups) {
        if (!isdefined(group.target)) {
            continue;
        }
        itemlistbundle = getscriptbundle(group.scriptbundlename);
        if (isdefined(itemlistbundle) && isdefined(level.var_fb9a8536[itemlistbundle.name])) {
            itemlistbundle = getscriptbundle(level.var_fb9a8536[itemlistbundle.name]);
        }
        if (!isdefined(itemlistbundle)) {
            continue;
        }
        if (var_87e9f374) {
            if (!(isdefined(itemlistbundle.var_dc91e192) && itemlistbundle.var_dc91e192) || !(isdefined(itemlistbundle.supplystash) && itemlistbundle.supplystash)) {
                continue;
            }
        } else if (isdefined(itemlistbundle.var_dc91e192) && itemlistbundle.var_dc91e192 && isdefined(itemlistbundle.supplystash) && itemlistbundle.supplystash) {
            continue;
        }
        if (isdefined(var_f38d5b52[group.target])) {
            if (!(isdefined(itemlistbundle.supplystash) && itemlistbundle.supplystash)) {
                continue;
            }
        }
        var_f38d5b52[group.target] = 1;
        if (getdvarint(#"hash_424f2e897e67b1ba", 0)) {
            if (!(isdefined(itemlistbundle.var_bb617d29) && itemlistbundle.var_bb617d29) && !(isdefined(itemlistbundle.supplystash) && itemlistbundle.supplystash) && !(isdefined(itemlistbundle.vehiclespawner) && itemlistbundle.vehiclespawner)) {
                continue;
            }
        } else if (isdefined(itemlistbundle.var_bb617d29) && itemlistbundle.var_bb617d29) {
            continue;
        }
        group function_9db93def();
        group _setup();
        group _spawn(reset);
        group _teardown();
        if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
            waitframe(1);
            level.var_d0676b07 = getrealtime();
        }
    }
    return var_f38d5b52;
}

// Namespace namespace_65181344/namespace_65181344
// Params 1, eflags: 0x1 linked
// Checksum 0x97f2e01a, Offset: 0x5488
// Size: 0x6d6
function setup_groups(reset = 1) {
    if (reset) {
        level flagsys::set(#"hash_67b445a4b1d59922");
    } else {
        level flagsys::set(#"hash_11c9cde7b522c5a9");
    }
    flagsys::wait_till(#"item_world_traces");
    /#
        if (!isdefined(level.var_55f723bd)) {
            level.var_3683df16 = 0;
            level.var_3062619 = "<dev string:x130>";
            level.var_55f723bd = openfile("<dev string:x1b3>", "<dev string:x1d1>");
        }
    #/
    /#
        if (reset) {
        }
    #/
    starttime = gettime();
    level.var_d0676b07 = getrealtime();
    level.var_4afb8f5a = reset ? level.itemreplacement : level.var_ee46a98d;
    foreach (key, value in level.var_4afb8f5a) {
    }
    level.var_fb9a8536 = reset ? level.var_ee110db8 : level.var_db0e7b82;
    foreach (value in level.var_fb9a8536) {
    }
    if (!isdefined(level.var_28cd0b1f)) {
        level.var_28cd0b1f = [];
    }
    if (reset) {
        reset_items();
    }
    function_e88ecf7f();
    function_9e9f43cd();
    level.item_spawn_stashes = [];
    level.var_5ce07338 = [];
    level.var_93d08989 = [];
    level.item_vehicles = [];
    level.var_8819644a = [];
    level.var_5b2a8d88 = [];
    level.var_cc113617 = [-130, 50, 120, 315, 225, 270];
    level.var_82e94a26 = [1:10, 2:-5, 3:-15, 4:5, 5:0];
    level.var_69dda516 = [17, 34, 32, 25, 25, 25];
    /#
        level.var_136445c0 = 0;
        level.var_d80c35aa = [];
        level.var_5720c09a = 0;
        level.var_8d9ad8e8 = [];
        level.var_2850ef5 = 0;
        level.var_ecf16fd3 = [];
        level.var_f2db6a7f = 0;
    #/
    if (isdefined(function_6b9be08d()) && function_6b9be08d() == 1) {
        function_c6477714(reset);
    } else {
        var_f38d5b52 = [];
        function_50a2c746(var_f38d5b52, reset, 1);
        if (getrealtime() - level.var_d0676b07 > level.var_3e9c9a35) {
            waitframe(1);
            level.var_d0676b07 = getrealtime();
        }
        function_50a2c746(var_f38d5b52, reset, 0);
    }
    /#
        level.var_a7247d85 = function_8322cf16();
        level.var_66e56764 = level.var_136445c0 + level.var_5720c09a + level.var_2850ef5;
        level.var_efeab371 = [];
        foreach (type, count in level.var_d80c35aa) {
            level.var_efeab371[type] = (isdefined(count) ? count : 0) + (isdefined(level.var_8d9ad8e8[type]) ? level.var_8d9ad8e8[type] : 0) + (isdefined(level.var_ecf16fd3[type]) ? level.var_ecf16fd3[type] : 0);
        }
    #/
    /#
        foreach (type, count in level.var_efeab371) {
        }
    #/
    if (reset) {
        function_62fdaf9e();
        function_6a5c090c();
    }
    /#
        if (reset) {
            closefile(level.var_55f723bd);
            level.var_55f723bd = undefined;
        }
    #/
    level.var_f1f90fd3 = float(gettime() - starttime) / 1000;
}

// Namespace namespace_65181344/namespace_65181344
// Params 2, eflags: 0x1 linked
// Checksum 0x4d5f0b33, Offset: 0x5b68
// Size: 0x442
function function_5eada592(scriptbundlename, linkto = 1) {
    if (!isdefined(self)) {
        assert(0);
        return;
    }
    if (!isdefined(scriptbundlename)) {
        assert(0);
        return;
    }
    self.itemlistbundle = getscriptbundle(scriptbundlename);
    if (!isdefined(self.itemlistbundle)) {
        assert(0);
        return;
    }
    items = [];
    for (row = 0; row < self.itemlistbundle.itemlist.size; row++) {
        if (!isdefined(self.itemlistbundle.itemlist[row].itementry)) {
            continue;
        }
        itemlistbundle = getscriptbundle(self.itemlistbundle.itemlist[row].itementry);
        var_bbe618cc = itemlistbundle.type == #"itemspawnlist" || itemlistbundle.type == #"itemspawnlistalias";
        available = isdefined(self.itemlistbundle.itemlist[row].available) ? self.itemlistbundle.itemlist[row].available : 0;
        var_8107154f = [];
        do {
            var_8107154f[var_8107154f.size] = -2;
            if (!var_bbe618cc) {
                spawnitems = function_35461e5f(row, 1);
                items = arraycombine(items, spawnitems, 1, 0);
            }
            available--;
        } while (available > 0);
        if (var_bbe618cc) {
            if (itemlistbundle.type == #"itemspawnlistalias") {
                var_12ab6449 = function_440f0490(itemlistbundle);
                if (!isdefined(var_12ab6449)) {
                    continue;
                }
                itemlistbundle = var_12ab6449;
            }
            if (isdefined(itemlistbundle) && isdefined(level.var_fb9a8536[itemlistbundle.name])) {
                itemlistbundle = getscriptbundle(level.var_fb9a8536[itemlistbundle.name]);
            }
            itemspawnlist = spawnstruct();
            itemspawnlist.itemlistbundle = itemlistbundle;
            spawnitems = itemspawnlist function_e25c9d12(var_8107154f, var_8107154f.size, 1);
            items = arraycombine(items, spawnitems, 1, 0);
        }
    }
    foreach (item in items) {
        if (!isdefined(item)) {
            continue;
        }
        item.targetnamehash = self.targetname;
        item.origin = self.origin;
        if (linkto) {
            item linkto(self);
        }
        item.spawning = 0;
    }
    return items;
}

// Namespace namespace_65181344/namespace_65181344
// Params 2, eflags: 0x1 linked
// Checksum 0xaf13f82a, Offset: 0x5fb8
// Size: 0x1ea
function function_fd87c780(scriptbundlename, itemcount) {
    if (!isdefined(self)) {
        assert(0);
        return;
    }
    if (!isdefined(scriptbundlename)) {
        assert(0);
        return;
    }
    if (!isint(itemcount) || itemcount <= 0) {
        assert(0);
        return;
    }
    itemgroup = spawnstruct();
    itemgroup.itemlistbundle = getscriptbundle(scriptbundlename);
    itemgroup.origin = self.origin;
    itemgroup.angles = self.angles;
    var_8107154f = [];
    for (pointid = 0; pointid < itemcount; pointid++) {
        var_8107154f[var_8107154f.size] = -2;
    }
    items = itemgroup function_e25c9d12(var_8107154f, var_8107154f.size, 0);
    foreach (item in items) {
        if (!isdefined(item)) {
            continue;
        }
        item.spawning = 0;
    }
    return items;
}


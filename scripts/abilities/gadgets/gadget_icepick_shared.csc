#using scripts\killstreaks\killstreak_detect.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace icepick;

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe95909ae, Offset: 0x3c8
// Size: 0x6c
function init_shared() {
    if (!isdefined(level.var_422c4695)) {
        level.var_422c4695 = [];
    }
    if (!isdefined(level.var_1a8113a7)) {
        level.var_1a8113a7 = [];
    }
    if (!isdefined(level.var_11631715)) {
        level.var_11631715 = [];
    }
    registerclientfields();
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x802bcad0, Offset: 0x440
// Size: 0xda
function function_b53fa4ba(entity) {
    if (!isdefined(entity)) {
        return getweapon(#"none");
    }
    if (isdefined(entity.vehicletype)) {
        if (entity.vehicletype == #"vehicle_t8_mil_helicopter_swat_transport") {
            return getweapon("player_air_vehicle1_main_turret_3rd_person_swat");
        } else if (entity.vehicletype == #"vehicle_t8_mil_helicopter_overwatch") {
            return getweapon("overwatch_helicopter");
        }
    }
    return getweapon(#"none");
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xdd7fb740, Offset: 0x528
// Size: 0x196
function function_b2755499(weapon, entity) {
    returnweapon = weapon;
    switch (weapon.name) {
    case #"cobra_20mm_comlink":
        returnweapon = getweapon("helicopter_comlink");
        break;
    case #"gun_ultimate_turret":
        returnweapon = getweapon("ultimate_turret");
        break;
    case #"hash_17df39d53492b0bf":
        returnweapon = getweapon("ac130");
        break;
    case #"straferun_gun":
        returnweapon = getweapon("straferun");
        break;
    case #"hash_26ffb92552ae26be":
        returnweapon = getweapon("drone_squadron");
        break;
    case #"hash_7eca6eae4128f3a0":
        returnweapon = function_b53fa4ba(entity);
        break;
    case #"hash_61b88900b127386a":
    case #"hash_71088fcd3aaa23fb":
        returnweapon = getweapon("eq_hawk");
        break;
    }
    return returnweapon;
}

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x5 linked
// Checksum 0xee6bd5a3, Offset: 0x6c8
// Size: 0x4c4
function private registerclientfields() {
    clientfield::register("toplayer", "gadget_icepick_on", 9000, 1, "int", &icepick_on, 0, 0);
    clientfield::register("toplayer", "currentlyHacking", 9000, 1, "int", &function_d3c5b110, 0, 0);
    clientfield::register("toplayer", "hackedvehpostfx", 9000, 1, "int", &function_4a82368f, 0, 1);
    clientfield::register("toplayer", "currentlybeinghackedplayer", 9000, 4, "int", &function_39f69700, 0, 0);
    clientfield::register("clientuimodel", "IcePickInfo.hackStarted", 9000, 1, "int", &function_fd2904cd, 0, 0);
    clientfield::register("clientuimodel", "IcePickInfo.hackFinished", 9000, 1, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "IcePickInfo.hackEquipFinished", 9000, 1, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "IcePickInfo.hackVehicleFinished", 9000, 1, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "hudItems.hacked", 9000, 1, "int", &function_868adc20, 0, 0);
    clientfield::register("clientuimodel", "hudItems.hackedRebootProgress", 9000, 5, "float", undefined, 0, 0);
    clientfield::register("clientuimodel", "IcePickInfo.currentHackProgress", 9000, 5, "float", undefined, 0, 0);
    clientfield::register("missile", "cant_be_hacked", 9000, 1, "int", &function_45e26cb2, 0, 0);
    clientfield::register("vehicle", "cant_be_hacked", 9000, 1, "int", &function_45e26cb2, 0, 0);
    clientfield::register("scriptmover", "cant_be_hacked", 9000, 1, "int", &function_45e26cb2, 0, 0);
    clientfield::register("scriptmover", "hackStatus", 9000, 2, "int", &function_1238516b, 0, 0);
    clientfield::register("missile", "hackStatus", 9000, 2, "int", &function_1238516b, 0, 0);
    clientfield::register("vehicle", "hackStatus", 9000, 2, "int", &function_1238516b, 0, 0);
    clientfield::register("allplayers", "hackStatus", 9000, 2, "int", &function_1238516b, 0, 1);
}

// Namespace icepick/gadget_icepick_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x37ab8d8c, Offset: 0xb98
// Size: 0x66
function function_45e26cb2(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.cantbehacked = 1;
        return;
    }
    self.cantbehacked = 0;
}

// Namespace icepick/gadget_icepick_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x58d4c8d7, Offset: 0xc08
// Size: 0xfc
function function_d3c5b110(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        if (!isdefined(level.var_1a8113a7[local_client_num])) {
            level.var_1a8113a7[local_client_num] = function_604c9983(local_client_num, #"hash_7c507989ceae567f");
        }
        return;
    }
    if (isdefined(level.var_1a8113a7[local_client_num])) {
        function_d48752e(local_client_num, level.var_1a8113a7[local_client_num]);
        level.var_1a8113a7[local_client_num] = undefined;
        playsound(local_client_num, #"hash_1d4f78480965b59d");
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x756d6aa2, Offset: 0xd10
// Size: 0x2ce
function function_39f69700(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    parentmodel = getuimodel(getuimodelforcontroller(local_client_num), "IcePickHackables");
    if (!isdefined(parentmodel)) {
        return;
    }
    totalcount = getuimodelvalue(getuimodel(parentmodel, "hackablesCount"));
    for (index = 0; index < totalcount; index++) {
        itemuimodel = getuimodel(parentmodel, "item" + index);
        isplayer = getuimodelvalue(getuimodel(itemuimodel, "hackableCategory")) == 0;
        if (!isplayer) {
            continue;
        }
        idval = getuimodelvalue(getuimodel(itemuimodel, "hackableId"));
        if (newval == -1) {
            setuimodelvalue(getuimodel(itemuimodel, "hackStatus"), 0);
            continue;
        } else if (newval == -2) {
            setuimodelvalue(getuimodel(itemuimodel, "hackStatus"), 2);
            continue;
        }
        if (idval < newval) {
            setuimodelvalue(getuimodel(itemuimodel, "hackStatus"), 2);
            continue;
        }
        if (idval == newval) {
            setuimodelvalue(getuimodel(itemuimodel, "hackStatus"), 1);
            continue;
        }
        setuimodelvalue(getuimodel(itemuimodel, "hackStatus"), 0);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x850008db, Offset: 0xfe8
// Size: 0x26c
function function_ca096bad(model, index, namehash, entnum, category, categoryindex, weapon) {
    itemuimodel = createuimodel(model, "item" + index);
    if (isdefined(namehash)) {
        setuimodelvalue(createuimodel(itemuimodel, "hackableName"), namehash);
    }
    doublewidth = 0;
    setuimodelvalue(createuimodel(itemuimodel, "hackableId"), entnum);
    if (isdefined(weapon) && weapon.statname != #"") {
        weaponindex = getitemindexfromref(weapon.statname);
        setuimodelvalue(createuimodel(itemuimodel, "hackableItemIndex"), weaponindex);
        doublewidth = weapon.var_df381b5d == 2;
    }
    setuimodelvalue(createuimodel(itemuimodel, "hackableCategory"), category);
    setuimodelvalue(createuimodel(itemuimodel, "indexWithinCategory"), categoryindex);
    setuimodelvalue(createuimodel(itemuimodel, "hackStatus"), 0);
    setuimodelvalue(createuimodel(itemuimodel, "hackableDoubleWidth"), doublewidth);
    setuimodelvalue(createuimodel(itemuimodel, "hackableFlavorText"), #"");
}

// Namespace icepick/gadget_icepick_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xabf87136, Offset: 0x1260
// Size: 0x162
function function_808efdee(hacker, entity, weapon) {
    if (hacker.team == entity.team) {
        return false;
    }
    if (!isdefined(weapon) || !isdefined(weapon.displayname) || weapon.displayname == "") {
        return false;
    }
    if (!weapon.ishackable) {
        return false;
    }
    if ((entity.type == "missile" || entity.type == "vehicle" || entity.type == "scriptmover") && entity clientfield::get("cant_be_hacked")) {
        return false;
    }
    if (entity.type == "NA") {
        return false;
    }
    if (weapon == getweapon("gadget_supplypod") && entity.type != "scriptmover") {
        return false;
    }
    return true;
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x11d6bae0, Offset: 0x13d0
// Size: 0xf8
function function_8d50c205(left, right) {
    leftweapon = function_b2755499(left.weapon, left);
    rightweapon = function_b2755499(right.weapon, right);
    if (isplayer(left) || isplayer(right) || leftweapon.var_8134b209 == rightweapon.var_8134b209) {
        return (left getentitynumber() < right getentitynumber());
    }
    return leftweapon.var_8134b209 < rightweapon.var_8134b209;
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x664225a8, Offset: 0x14d0
// Size: 0x380
function function_adceefd(local_client_num, hacker) {
    var_94e70cdd = [];
    var_94e70cdd[0] = [];
    var_94e70cdd[1] = [];
    var_94e70cdd[2] = [];
    players = getplayers(local_client_num);
    foreach (player in players) {
        if (player.team == hacker.team) {
            continue;
        }
        if (!isdefined(var_94e70cdd[0])) {
            var_94e70cdd[0] = [];
        } else if (!isarray(var_94e70cdd[0])) {
            var_94e70cdd[0] = array(var_94e70cdd[0]);
        }
        var_94e70cdd[0][var_94e70cdd[0].size] = player;
    }
    var_88d95648 = function_e563a9b(local_client_num);
    foreach (var_20651f4 in var_88d95648) {
        if (isplayer(var_20651f4)) {
            continue;
        }
        entweapon = function_b2755499(var_20651f4.weapon, var_20651f4);
        if (!function_808efdee(self, var_20651f4, entweapon)) {
            continue;
        }
        if (!isdefined(var_94e70cdd[entweapon.var_a8bd8bb2])) {
            var_94e70cdd[entweapon.var_a8bd8bb2] = [];
        } else if (!isarray(var_94e70cdd[entweapon.var_a8bd8bb2])) {
            var_94e70cdd[entweapon.var_a8bd8bb2] = array(var_94e70cdd[entweapon.var_a8bd8bb2]);
        }
        var_94e70cdd[entweapon.var_a8bd8bb2][var_94e70cdd[entweapon.var_a8bd8bb2].size] = var_20651f4;
    }
    array::bubble_sort(var_94e70cdd[0], &function_8d50c205);
    array::bubble_sort(var_94e70cdd[1], &function_8d50c205);
    array::bubble_sort(var_94e70cdd[2], &function_8d50c205);
    return var_94e70cdd;
}

// Namespace icepick/gadget_icepick_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x3130a27d, Offset: 0x1858
// Size: 0x10c
function watchfordeath(local_client_num, entity, index) {
    entity endon(#"icepickhacked");
    while (isdefined(entity) && !(isdefined(entity.cantbehacked) && entity.cantbehacked)) {
        waitframe(1);
    }
    parentmodel = getuimodel(getuimodelforcontroller(local_client_num), "IcePickHackables");
    if (!isdefined(parentmodel)) {
        return;
    }
    itemuimodel = createuimodel(parentmodel, "item" + index);
    setuimodelvalue(createuimodel(itemuimodel, "hackStatus"), 3);
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x81ab0d84, Offset: 0x1970
// Size: 0x58c
function function_9e88e881(local_client_num) {
    self endon(#"hash_3eb91a66cb027059");
    self endon(#"death");
    var_e2d02d46 = createuimodel(getuimodelforcontroller(local_client_num), "IcePickHackables");
    var_a9705012 = [];
    var_a9705012[0] = 0;
    var_a9705012[1] = 0;
    var_a9705012[2] = 0;
    var_88d95648 = function_e563a9b(local_client_num);
    var_9411ea0 = 0;
    hackableitems = function_adceefd(local_client_num, self);
    numplayers = getdvarint(#"com_maxclients", 0);
    for (i = 0; i < numplayers; i++) {
        function_ca096bad(var_e2d02d46, var_9411ea0, #"", i, 0, var_a9705012[0], undefined);
        var_9411ea0++;
        var_a9705012[0]++;
    }
    icepickweapon = getweapon(#"gadget_icepick");
    var_a4739e20 = getscriptbundle(icepickweapon.customsettings);
    var_9b81203 = var_a4739e20.var_a65e249e;
    var_f998f517 = 0;
    foreach (var_20651f4 in hackableitems[1]) {
        var_b095c57b = function_b2755499(var_20651f4.weapon, var_20651f4);
        var_f998f517 += var_b095c57b.var_df381b5d;
        if (var_f998f517 > var_9b81203) {
            break;
        }
        function_ca096bad(var_e2d02d46, var_9411ea0, var_b095c57b.displayname, var_20651f4 getentitynumber(), var_b095c57b.var_a8bd8bb2, var_a9705012[var_b095c57b.var_a8bd8bb2], var_b095c57b);
        thread watchfordeath(local_client_num, var_20651f4, var_9411ea0);
        var_a9705012[var_b095c57b.var_a8bd8bb2]++;
        var_9411ea0++;
    }
    var_f998f517 = 0;
    foreach (var_20651f4 in hackableitems[2]) {
        var_b095c57b = function_b2755499(var_20651f4.weapon, var_20651f4);
        var_f998f517 += var_b095c57b.var_df381b5d;
        if (var_f998f517 > var_9b81203) {
            break;
        }
        function_ca096bad(var_e2d02d46, var_9411ea0, var_b095c57b.displayname, var_20651f4 getentitynumber(), var_b095c57b.var_a8bd8bb2, var_a9705012[var_b095c57b.var_a8bd8bb2], var_b095c57b);
        thread watchfordeath(local_client_num, var_20651f4, var_9411ea0);
        var_a9705012[var_b095c57b.var_a8bd8bb2]++;
        var_9411ea0++;
    }
    setuimodelvalue(createuimodel(var_e2d02d46, "hackablesCount"), var_9411ea0);
    var_d2291427 = createuimodel(var_e2d02d46, "hackablesCategoryCounts");
    setuimodelvalue(createuimodel(var_d2291427, "" + 0), var_a9705012[0]);
    setuimodelvalue(createuimodel(var_d2291427, "" + 1), var_a9705012[1]);
    setuimodelvalue(createuimodel(var_d2291427, "" + 2), var_a9705012[2]);
}

// Namespace icepick/gadget_icepick_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x2cdf27e, Offset: 0x1f08
// Size: 0x124
function function_868adc20(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1 && oldval != 1) {
        if (!isdefined(level.var_422c4695[local_client_num])) {
            level.var_422c4695[local_client_num] = function_604c9983(local_client_num, #"hash_48af3a16cdf94e6f");
        }
        return;
    }
    if (newval == 0 && isdefined(level.var_422c4695[local_client_num])) {
        function_d48752e(local_client_num, level.var_422c4695[local_client_num]);
        level.var_422c4695[local_client_num] = undefined;
        if (!bwastimejump) {
            playsound(local_client_num, #"hash_b5e00bf57762b86");
        }
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xf4660742, Offset: 0x2038
// Size: 0xce
function icepick_on(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self thread function_9e88e881(local_client_num);
        return;
    }
    if (newval == 0 && oldval == 1) {
        level notify(#"hash_3eb91a66cb027059");
        var_e2d02d46 = createuimodel(getuimodelforcontroller(local_client_num), "IcePickHackables");
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x4806162e, Offset: 0x2110
// Size: 0xf4
function function_4a82368f(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    isplaying = postfx::function_556665f2(#"hash_108c587fdd95588a");
    if (newval == 1) {
        if (!isplaying && self isremotecontrolling(local_client_num)) {
            self postfx::playpostfxbundle(#"hash_108c587fdd95588a");
        }
        return;
    }
    if (newval == 0) {
        if (isplaying) {
            self postfx::stoppostfxbundle(#"hash_108c587fdd95588a");
        }
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x632f7fd5, Offset: 0x2210
// Size: 0xf0
function private function_67b9bc99(player, local_client_num) {
    entitynumber = player getentitynumber();
    if (isdefined(level.var_11631715[entitynumber]) && isarray(level.var_11631715[entitynumber])) {
        foreach (fx in level.var_11631715[entitynumber]) {
            stopfx(local_client_num, fx);
        }
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x85f0f988, Offset: 0x2308
// Size: 0x19c
function function_d96f79be(local_client_num, oldval, newval, bwastimejump) {
    if (self function_da43934d() && newval == 2) {
        return;
    }
    starttime = gettime();
    while (isdefined(self) && !self hasdobj(local_client_num)) {
        if (gettime() - starttime > 1000) {
            return;
        }
        waitframe(1);
    }
    if (!isdefined(self)) {
        return;
    }
    entitynumber = self getentitynumber();
    if (!isdefined(level.var_11631715[entitynumber])) {
        level.var_11631715[entitynumber] = [];
    }
    if (newval == 2 && !bwastimejump) {
        function_67b9bc99(self, local_client_num);
        level.var_11631715[entitynumber] = playtagfxset(local_client_num, "gadget_icepick_hacked_3p", self);
        return;
    }
    if (newval == 0 && oldval == 2 && isdefined(level.var_11631715[entitynumber])) {
        function_67b9bc99(self, local_client_num);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 3, eflags: 0x5 linked
// Checksum 0x470b181c, Offset: 0x24b0
// Size: 0x232
function private function_34aba8d8(local_client_num, targetid, newval) {
    parentmodel = getuimodel(getuimodelforcontroller(local_client_num), "IcePickHackables");
    if (!isdefined(parentmodel)) {
        return;
    }
    totalcount = getuimodelvalue(getuimodel(parentmodel, "hackablesCount"));
    for (index = 0; index < totalcount; index++) {
        itemuimodel = getuimodel(parentmodel, "item" + index);
        idval = getuimodelvalue(getuimodel(itemuimodel, "hackableId"));
        if (idval != targetid) {
            continue;
        }
        if (newval == 1) {
            if (!isplayer(self)) {
                var_b095c57b = function_b2755499(self.weapon, self);
                flavortext = var_b095c57b.var_77b46a8c;
            } else {
                flavortext = #"";
            }
            setuimodelvalue(getuimodel(itemuimodel, "hackableFlavorText"), flavortext);
        } else if (newval == 2) {
            self notify(#"icepickhacked");
        }
        setuimodelvalue(getuimodel(itemuimodel, "hackStatus"), newval);
        break;
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xeba9ae7a, Offset: 0x26f0
// Size: 0x1a8
function function_91803954(local_client_num, oldval, newval) {
    starttime = gettime();
    while (isdefined(self) && !self hasdobj(local_client_num)) {
        if (gettime() - starttime > 1000) {
            return;
        }
        waitframe(1);
    }
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.weapon)) {
        return;
    }
    weapon = function_b2755499(self.weapon);
    if (!isdefined(weapon)) {
        return;
    }
    if (!isdefined(weapon.var_26f68e75)) {
        return;
    }
    if (newval == 1) {
        self.var_2cd459a0 = playtagfxset(local_client_num, weapon.var_26f68e75, self);
        return;
    }
    if (newval != 1 && oldval == 1 && isdefined(self.var_2cd459a0)) {
        foreach (fx in self.var_2cd459a0) {
            stopfx(local_client_num, fx);
        }
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x3a7d9481, Offset: 0x28a0
// Size: 0x12c
function function_1238516b(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isplayer(self)) {
        self killstreak_detect::function_d859c344(local_client_num, newval);
        self thread function_91803954(local_client_num, oldval, newval);
    } else {
        self thread function_d96f79be(local_client_num, oldval, newval, bwastimejump);
    }
    if (!isdefined(self)) {
        return;
    }
    targetid = self getentitynumber();
    var_37ceef06 = clientfield::get_to_player("gadget_icepick_on");
    if (var_37ceef06) {
        self function_34aba8d8(local_client_num, targetid, newval);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x8cd5640d, Offset: 0x29d8
// Size: 0x3c
function function_fd2904cd(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    
}


// Atian COD Tools GSC decompiler test
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace icepick;

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x2d31390d, Offset: 0x528
// Size: 0x4c
function init_shared() {
    ability_player::register_gadget_should_notify(8, 1);
    function_2aec10d2();
    registerclientfields();
    setupcallbacks();
}

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x5 linked
// Checksum 0xccc8148, Offset: 0x580
// Size: 0x66
function private function_2aec10d2() {
    if (!isdefined(level.icepicksettings)) {
        level.icepicksettings = spawnstruct();
    }
    if (!isdefined(level.var_ff6f539f)) {
        level.var_ff6f539f = [];
    }
    if (!isdefined(level.var_fdb0a658)) {
        level.var_fdb0a658 = 0;
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x5 linked
// Checksum 0xee64bb81, Offset: 0x5f0
// Size: 0x14c
function private setupcallbacks() {
    level.var_1b900c1d = &function_1b900c1d;
    level.var_14151f16 = &function_14151f16;
    level.var_f1edf93f = &function_3e3330bc;
    callback::on_player_killed_with_params(&on_player_killed);
    callback::on_connect(&onplayerconnect);
    callback::on_spawned(&onplayerspawned);
    callback::on_joined_team(&onplayerjoinedteam);
    callback::on_disconnect(&onplayerdisconnect);
    callback::add_callback(#"on_status_effect", &on_status_effect);
    ability_player::register_gadget_activation_callbacks(8, &gadget_icepick_on, &gadget_icepick_off);
}

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x5 linked
// Checksum 0xe49f4ac0, Offset: 0x748
// Size: 0x32c
function private registerclientfields() {
    clientfield::register("toplayer", "gadget_icepick_on", 9000, 1, "int");
    clientfield::register("toplayer", "currentlyHacking", 9000, 1, "int");
    clientfield::register("toplayer", "hackedvehpostfx", 9000, 1, "int");
    clientfield::register("toplayer", "currentlybeinghackedplayer", 9000, 4, "int");
    clientfield::register_clientuimodel("IcePickInfo.hackStarted", 9000, 1, "int", 0);
    clientfield::register_clientuimodel("IcePickInfo.hackFinished", 9000, 1, "int", 0);
    clientfield::register_clientuimodel("IcePickInfo.hackEquipFinished", 9000, 1, "int", 0);
    clientfield::register_clientuimodel("IcePickInfo.hackVehicleFinished", 9000, 1, "int", 0);
    clientfield::register_clientuimodel("hudItems.hacked", 9000, 1, "int", 0);
    clientfield::register_clientuimodel("hudItems.hackedRebootProgress", 9000, 5, "float", 0);
    clientfield::register_clientuimodel("IcePickInfo.currentHackProgress", 9000, 5, "float", 0);
    clientfield::register("missile", "cant_be_hacked", 9000, 1, "int");
    clientfield::register("vehicle", "cant_be_hacked", 9000, 1, "int");
    clientfield::register("scriptmover", "cant_be_hacked", 9000, 1, "int");
    clientfield::register("scriptmover", "hackStatus", 9000, 2, "int");
    clientfield::register("missile", "hackStatus", 9000, 2, "int");
    clientfield::register("vehicle", "hackStatus", 9000, 2, "int");
    clientfield::register("allplayers", "hackStatus", 9000, 2, "int");
}

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x7ea9b280, Offset: 0xa80
// Size: 0x40
function function_3e3330bc() {
    settingsbundle = function_13f4415c();
    return isdefined(settingsbundle.var_1f06f5a) ? settingsbundle.var_1f06f5a : 0;
}

// Namespace icepick/event_36cd4a90
// Params 1, eflags: 0x40
// Checksum 0x63166fd, Offset: 0xac8
// Size: 0xc
function event_handler[event_36cd4a90] function_9497a4f3(eventstruct) {
    
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xb68f1d3, Offset: 0xae0
// Size: 0x2b4
function private function_c18360f6(var_11a83c3a, params) {
    if (!isdefined(params)) {
        return;
    }
    if (!isdefined(params.eattacker)) {
        return;
    }
    icepickweapon = getweapon(#"gadget_icepick");
    if (isdefined(var_11a83c3a.var_e2131267) && var_11a83c3a.var_e2131267 == params.eattacker) {
        scoreevents::processscoreevent(#"hacked_kill", var_11a83c3a.var_e2131267, undefined, icepickweapon);
        params.eattacker function_be7a08a8(icepickweapon, 1);
        time = gettime();
        if (!isdefined(params.eattacker.var_7b9616d6)) {
            params.eattacker.var_7b9616d6 = time;
        }
        if (!isdefined(params.eattacker.var_bcae5314)) {
            params.eattacker.var_bcae5314 = 0;
        }
        if (params.eattacker.var_7b9616d6 + 4000 < time) {
            params.eattacker.var_bcae5314 = 0;
        }
        params.eattacker.var_bcae5314++;
        params.eattacker.var_7b9616d6 = time;
        if (params.eattacker.var_bcae5314 == 2) {
            scoreevents::processscoreevent(#"hash_e18a9f29b8e1132", var_11a83c3a.var_e2131267, undefined, icepickweapon);
            params.eattacker.var_bcae5314 = 0;
        }
        return;
    }
    if (isdefined(var_11a83c3a.var_e2131267.team) && isdefined(params.eattacker.team) && var_11a83c3a.var_e2131267.team == params.eattacker.team) {
        scoreevents::processscoreevent(#"hacked_assist", var_11a83c3a.var_e2131267, undefined, icepickweapon);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xf1fc7366, Offset: 0xda0
// Size: 0x208
function private function_a5b83ede(hacker, var_11a83c3a) {
    if (!isdefined(hacker) || !isdefined(var_11a83c3a)) {
        return;
    }
    settingsbundle = function_13f4415c();
    var_be75e624 = isdefined(settingsbundle.var_cd8eae22) ? settingsbundle.var_cd8eae22 : 0;
    var_696beab8 = isdefined(settingsbundle.var_51593b) ? settingsbundle.var_51593b : 0;
    if (!var_be75e624 && !var_696beab8) {
        return;
    }
    if (isdefined(settingsbundle.var_4ffa4f3c) ? settingsbundle.var_4ffa4f3c : 0) {
        if (isdefined(hacker.var_c269451a) ? hacker.var_c269451a : 0) {
            return;
        }
        hacker.var_c269451a = 1;
    }
    scoreevents::processscoreevent("hacker_shutdown", var_11a83c3a, hacker);
    if (!var_696beab8 || !level.teambased) {
        thread function_27c9bfc8(var_11a83c3a, 1);
        return;
    }
    if (var_696beab8) {
        foreach (player in getplayers(var_11a83c3a.team)) {
            thread function_27c9bfc8(player, 1);
        }
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xdec678b4, Offset: 0xfb0
// Size: 0x62
function private function_5e9bb390(hacker, var_11a83c3a) {
    function_a5b83ede(hacker, var_11a83c3a);
    if (isdefined(hacker.var_e989badb)) {
        hacker.var_e989badb notify(#"hash_2476803a0d5fa572");
    }
    hacker.var_e989badb = undefined;
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xac6833c2, Offset: 0x1020
// Size: 0x15c
function on_player_killed(params) {
    if ((isdefined(self.ishacked) ? self.ishacked : 0) && isdefined(self.var_e2131267)) {
        function_c18360f6(self, params);
    }
    if (isdefined(params) && isdefined(params.eattacker) && isdefined(params.eattacker.var_e2131267)) {
        if (params.eattacker.var_e2131267 == self) {
            function_5e9bb390(self, params.eattacker);
        }
    }
    if (isdefined(self.var_c1911c44) && self.var_c1911c44) {
        if (isdefined(self.var_982faa7c) && isplayer(self.var_982faa7c)) {
            self.var_982faa7c clientfield::set_to_player("hackedvehpostfx", 0);
        }
        if (isdefined(params.eattacker)) {
            scoreevents::processscoreevent("ice_pick_shutdown", params.eattacker, self);
        }
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x6d7b43cd, Offset: 0x1188
// Size: 0x3c
function onplayerspawned() {
    if (isdefined(self.ishacked) ? self.ishacked : 0) {
        thread function_39026c34(self.var_e2131267, self, 0);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xdcd8af2e, Offset: 0x11d0
// Size: 0x1c
function onplayerconnect() {
    self thread function_c1d2f9aa();
}

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xdf1b4627, Offset: 0x11f8
// Size: 0x64
function function_c1d2f9aa() {
    self endon(#"death", #"disconnect");
    self flagsys::wait_till(#"loadout_given");
    self ability_player::function_c9b950e3();
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x688ec111, Offset: 0x1268
// Size: 0x52
function function_1b900c1d(weapon, var_5651313e) {
    if (!isdefined(level.var_ff6f539f)) {
        level.var_ff6f539f = [];
    }
    level.var_ff6f539f[weapon.name] = var_5651313e;
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x85fb751e, Offset: 0x12c8
// Size: 0x82
function on_status_effect(var_756fda07) {
    if (!(isdefined(self.var_1f5ab061) && self.var_1f5ab061)) {
        return;
    }
    if (!isdefined(var_756fda07)) {
        return;
    }
    switch (var_756fda07.setype) {
    case 1:
    case 5:
        function_6c031486(self);
        break;
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x6b70ed34, Offset: 0x1358
// Size: 0x7c
function onplayerjoinedteam(params) {
    if (isdefined(self.ishacked) && self.ishacked) {
        if (isdefined(self.var_e2131267) && self.var_e2131267.team == self.team) {
            function_27c9bfc8(self, 0);
        }
    }
    function_ea2dfad6(self);
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc2d33adf, Offset: 0x13e0
// Size: 0x24
function onspecialistchange(params) {
    function_ea2dfad6(self);
}

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xbaa29e8f, Offset: 0x1410
// Size: 0x1c
function onplayerdisconnect() {
    function_ea2dfad6(self);
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x9997c464, Offset: 0x1438
// Size: 0xb6
function private findweapon(entity) {
    if (isdefined(entity.identifier_weapon)) {
        return entity.identifier_weapon;
    } else if (isdefined(entity.weapon)) {
        return entity.weapon;
    } else if (isdefined(entity.var_22a05c26) && isdefined(entity.var_22a05c26.ksweapon)) {
        return entity.var_22a05c26.ksweapon;
    } else if (isdefined(entity.defaultweapon)) {
        return entity.defaultweapon;
    }
    return level.weaponnone;
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x4f53a847, Offset: 0x14f8
// Size: 0x46
function function_14151f16(entity, canhack) {
    entity clientfield::set("cant_be_hacked", !canhack);
    entity.canthack = !canhack;
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x478e7b22, Offset: 0x1548
// Size: 0x152
function private function_808efdee(hacker, entity) {
    entityweapon = findweapon(entity);
    if ((!isdefined(entityweapon) || entityweapon == level.weaponnone) && !isplayer(entity)) {
        return false;
    }
    if (entity.team == hacker.team) {
        return false;
    }
    if (entity.team == #"spectator") {
        return false;
    }
    if (isdefined(entity.canthack) && entity.canthack) {
        return false;
    }
    if (!isplayer(entity) && !entityweapon.ishackable) {
        return false;
    }
    if (isdefined(entity.ishacked) && entity.ishacked && !isplayer(entity)) {
        return false;
    }
    return true;
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x26723349, Offset: 0x16a8
// Size: 0xe8
function function_8d50c205(left, right) {
    leftweapon = findweapon(left);
    rightweapon = findweapon(right);
    if (isplayer(left) || isplayer(right) || leftweapon.var_8134b209 == rightweapon.var_8134b209) {
        return (left getentitynumber() < right getentitynumber());
    }
    return leftweapon.var_8134b209 < rightweapon.var_8134b209;
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x508fdff5, Offset: 0x1798
// Size: 0x8e
function function_ab1f58d0(entity) {
    entityweapon = findweapon(entity);
    if (isplayer(entity)) {
        settingsbundle = function_13f4415c();
        return settingsbundle.var_4d1cd723;
    } else if (isdefined(entityweapon)) {
        return entityweapon.var_19f920eb;
    }
    return 0;
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xd78e7e55, Offset: 0x1830
// Size: 0xb2
function function_39d1ce95(entity, entityweapon) {
    if (!isdefined(entityweapon.name)) {
        return;
    }
    switch (entityweapon.name) {
    case #"supplydrop":
        if (isdefined(level.cratemodelfriendly)) {
            streamermodelhint(level.cratemodelfriendly, 10);
        }
        if (isdefined(level.cratemodelenemy)) {
            streamermodelhint(level.cratemodelenemy, 10);
        }
        break;
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x184f8263, Offset: 0x18f0
// Size: 0xac
function function_6c031486(hacker) {
    if (!isdefined(hacker)) {
        return;
    }
    icepickweapon = getweapon(#"gadget_icepick");
    hacker notify(#"hash_7b4714f415b8f49e");
    var_3e361f1a = hacker gadgetgetslot(icepickweapon);
    hacker gadgetdeactivate(var_3e361f1a, icepickweapon);
    hacker switchtoweapon();
}

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc799a9db, Offset: 0x19a8
// Size: 0x4a
function function_13f4415c() {
    icepickweapon = getweapon(#"gadget_icepick");
    return getscriptbundle(icepickweapon.customsettings);
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xc41c7a01, Offset: 0x1a00
// Size: 0x2a4
function private function_73d5db3b(player) {
    player.var_be9a0b4b = [];
    player.var_be9a0b4b[0] = getplayers();
    function_d65b8dbe(player.var_be9a0b4b[0], &function_8d50c205);
    player.var_be9a0b4b[1] = [];
    player.var_be9a0b4b[2] = [];
    foreach (entity in getentities()) {
        entityweapon = findweapon(entity);
        if (entityweapon.var_a8bd8bb2 > 0) {
            if (!isdefined(player.var_be9a0b4b[entityweapon.var_a8bd8bb2])) {
                player.var_be9a0b4b[entityweapon.var_a8bd8bb2] = [];
            } else if (!isarray(player.var_be9a0b4b[entityweapon.var_a8bd8bb2])) {
                player.var_be9a0b4b[entityweapon.var_a8bd8bb2] = array(player.var_be9a0b4b[entityweapon.var_a8bd8bb2]);
            }
            player.var_be9a0b4b[entityweapon.var_a8bd8bb2][player.var_be9a0b4b[entityweapon.var_a8bd8bb2].size] = entity;
            function_39d1ce95(entity, entityweapon);
        }
    }
    function_f1f877e0(player.var_be9a0b4b[1], &function_8d50c205);
    sort_vehicles(player.var_be9a0b4b[2], &function_8d50c205);
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x1f6c0cd6, Offset: 0x1cb0
// Size: 0x2c
function private function_d65b8dbe(&array, sort_func) {
    array::bubble_sort(array, sort_func);
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x15aae6fd, Offset: 0x1ce8
// Size: 0x2c
function private function_f1f877e0(&array, sort_func) {
    array::bubble_sort(array, sort_func);
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x60f3b2db, Offset: 0x1d20
// Size: 0x2c
function private sort_vehicles(&array, sort_func) {
    array::bubble_sort(array, sort_func);
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xf06c75c2, Offset: 0x1d58
// Size: 0x522
function private starthack(player) {
    player endoncallback(&function_4802ca63, #"death", #"hash_7b4714f415b8f49e");
    level.var_fdb0a658 = 1;
    player clientfield::set_player_uimodel("IcePickInfo.hackStarted", 1);
    icepickweapon = getweapon(#"gadget_icepick");
    var_3e361f1a = player gadgetgetslot(icepickweapon);
    player gadgetpowerset(var_3e361f1a, 0);
    player.var_c269451a = 0;
    player.var_86f63ff1 = 0;
    player.var_639e4be8 = 0;
    thread function_b76c8353(player);
    player clientfield::set_to_player("currentlyHacking", 1);
    if (isdefined(level.heroplaydialog)) {
        player thread [[ level.heroplaydialog ]]("icePickWeaponUse", 2);
        if (isdefined(level.var_9082a3b6)) {
            player thread [[ level.var_9082a3b6 ]]("icePickWeaponUseFutz");
        }
    }
    if (level.teambased) {
        if (isdefined(level.var_57e2bc08)) {
            thread [[ level.var_57e2bc08 ]]("hackingStarted", util::getotherteam(self.team));
        }
    } else if (isdefined(level.playleaderdialogonplayer)) {
        foreach (enemyplayer in level.players) {
            if (enemyplayer == self) {
                continue;
            }
            enemyplayer thread [[ level.playleaderdialogonplayer ]]("hackingStarted");
        }
    }
    player.var_c1911c44 = 1;
    thread function_d1f6e8d0(player);
    settingsbundle = function_13f4415c();
    var_891378ce = isdefined(settingsbundle.var_a65e249e) ? settingsbundle.var_a65e249e : 0;
    function_aaf0a382(player.var_be9a0b4b[1], player, var_891378ce);
    player clientfield::set_player_uimodel("IcePickInfo.hackEquipFinished", 1);
    function_aaf0a382(player.var_be9a0b4b[2], player, var_891378ce);
    player clientfield::set_player_uimodel("IcePickInfo.hackVehicleFinished", 1);
    function_aaf0a382(player.var_be9a0b4b[0], player);
    player clientfield::set_player_uimodel("IcePickInfo.hackFinished", 1);
    player clientfield::set_to_player("currentlybeinghackedplayer", -2);
    wait(0.75);
    if (!isdefined(player)) {
        return;
    }
    icepickweapon = getweapon(#"gadget_icepick");
    var_3e361f1a = player gadgetgetslot(icepickweapon);
    player gadgetdeactivate(var_3e361f1a, icepickweapon);
    player switchtoweapon();
    player.var_c1911c44 = 0;
    level.var_fdb0a658 = 0;
    if (isdefined(player.var_86f63ff1) && isdefined(level.playgadgetsuccess) && isdefined(level.var_ac6052e9)) {
        var_9194a036 = [[ level.var_ac6052e9 ]]("icePickHackSuccessLineCount", 1);
        if (player.var_86f63ff1 >= (isdefined(var_9194a036) ? var_9194a036 : 1)) {
            player [[ level.playgadgetsuccess ]](icepickweapon);
        }
    }
    player.var_86f63ff1 = undefined;
    player.var_639e4be8 = undefined;
}

// Namespace icepick/gadget_icepick_shared
// Params 3, eflags: 0x5 linked
// Checksum 0xfc59c02c, Offset: 0x2288
// Size: 0x158
function private function_aaf0a382(entities, player, max) {
    player endon(#"death", #"hash_7b4714f415b8f49e");
    var_e8e3cc00 = 0;
    foreach (entity in entities) {
        if (!isdefined(entity)) {
            continue;
        }
        if (!function_808efdee(player, entity)) {
            continue;
        }
        if (!isplayer(entity)) {
            entityweapon = findweapon(entity);
            var_e8e3cc00 += entityweapon.var_df381b5d;
        }
        if (isdefined(max) && var_e8e3cc00 > max) {
            break;
        }
        function_2b2ed159(entity, player);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xf076c1b5, Offset: 0x23e8
// Size: 0x65c
function private function_2b2ed159(entity, attackingplayer) {
    attackingplayer endon(#"death", #"hash_7b4714f415b8f49e");
    var_87bdc7d3 = int(function_ab1f58d0(entity) * 1000);
    var_7570395 = 0;
    attackingplayer.var_e989badb = entity;
    if (isplayer(entity)) {
        entity clientfield::set("hackStatus", 1);
        attackingplayer clientfield::set_to_player("currentlybeinghackedplayer", entity getentitynumber());
    } else {
        entity clientfield::set("hackStatus", 1);
        entityweapon = findweapon(entity);
        if (!isdefined(entityweapon)) {
            return;
        }
        originalowner = entity.owner;
        if (isdefined(originalowner) && entityweapon.var_775d2aad === 1) {
            thread function_4a82368f(entity, originalowner);
            attackingplayer.var_982faa7c = originalowner;
            var_7570395 = 1;
        }
    }
    if (randomint(100) <= 50) {
        if (isdefined(level.var_e2fff792)) {
            attackingplayer [[ level.var_e2fff792 ]]("icePickWeaponHackStart", attackingplayer);
        }
    }
    var_3d69d460 = 0;
    lasttime = gettime();
    var_9b4cc45c = gettime();
    while (var_3d69d460 < var_87bdc7d3 && var_87bdc7d3 > 0) {
        if (!isdefined(entity) || isdefined(entity.leaving) && entity.leaving) {
            if (isdefined(entity)) {
                function_14151f16(entity, 0);
            }
            break;
        }
        var_50c86c4 = var_3d69d460 / var_87bdc7d3;
        attackingplayer clientfield::set_player_uimodel("IcePickInfo.currentHackProgress", var_50c86c4);
        timediff = gettime() - lasttime;
        var_3d69d460 += timediff * (isdefined(attackingplayer.var_6704e6fa) ? attackingplayer.var_6704e6fa : 1);
        lasttime = gettime();
        waitframe(1);
    }
    hackendtime = gettime();
    if (!isdefined(entity) || !isdefined(attackingplayer) || isdefined(entity.canthack) && entity.canthack) {
        if (var_7570395) {
            if (isdefined(originalowner) && isplayer(originalowner)) {
                originalowner clientfield::set_to_player("hackedvehpostfx", 0);
            }
            attackingplayer.var_982faa7c = undefined;
        }
        return;
    }
    attackingplayer clientfield::set_player_uimodel("IcePickInfo.currentHackProgress", 1);
    entity clientfield::set("hackStatus", 2);
    attackingplayer playsoundtoplayer(#"hash_fc83e70c477029c", attackingplayer);
    entity notify(#"hash_2476803a0d5fa572");
    attackingplayer.var_982faa7c = undefined;
    if (!isdefined(attackingplayer.var_86f63ff1)) {
        attackingplayer.var_86f63ff1 = 0;
    }
    attackingplayer.var_86f63ff1++;
    if (isplayer(entity)) {
        targetname = #"player";
        playernum = entity.entnum;
        thread function_39026c34(attackingplayer, entity, 1);
    } else {
        entityweapon = findweapon(entity);
        if (isdefined(entityweapon) && isdefined(entityweapon.name) && isdefined(entity.owner) && entity.owner getentitynumber()) {
            targetname = entityweapon.name;
            playernum = entity.owner getentitynumber();
        }
        thread function_29f4ff02(attackingplayer, entity);
    }
    attackingplayer.var_e989badb = undefined;
    var_46df240b = hackendtime - var_9b4cc45c;
    if (isdefined(targetname) && isdefined(playernum)) {
        var_6c52b424 = {#var_5f512560:attackingplayer getmatchrecordlifeindex(), #var_a9451146:attackingplayer.var_c48b30ab, #content_targeted:targetname, #var_e7f6239c:playernum, #duration:var_46df240b, #hack_success:1};
        function_92d1707f(#"hash_3c946cbb149411ad", var_6c52b424);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x909a0aa3, Offset: 0x2a50
// Size: 0x146
function function_4802ca63(str_notify) {
    if (str_notify != #"hash_7b4714f415b8f49e" || !isdefined(self) || !isplayer(self)) {
        return;
    }
    self clientfield::set_player_uimodel("IcePickInfo.hackFinished", 1);
    icepickweapon = getweapon(#"gadget_icepick");
    var_3e361f1a = self gadgetgetslot(icepickweapon);
    self gadgetdeactivate(var_3e361f1a, icepickweapon);
    self.var_c1911c44 = 0;
    level.var_fdb0a658 = 0;
    if (isdefined(self.var_982faa7c) && isplayer(self.var_982faa7c)) {
        self.var_982faa7c clientfield::set_to_player("hackedvehpostfx", 0);
        self.var_982faa7c = undefined;
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x6038cea2, Offset: 0x2ba0
// Size: 0xdc
function function_4a82368f(entity, owner) {
    assert(isdefined(owner));
    if (isplayer(owner)) {
        owner clientfield::set_to_player("hackedvehpostfx", 1);
    }
    entity waittill(#"death", #"remote_weapon_end", #"hash_2476803a0d5fa572");
    if (!isdefined(owner)) {
        return;
    }
    if (isplayer(owner)) {
        owner clientfield::set_to_player("hackedvehpostfx", 0);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc1570d32, Offset: 0x2c88
// Size: 0x244
function function_29f4ff02(attackingplayer, entity) {
    if (isplayer(entity)) {
        return;
    }
    entityweapon = findweapon(entity);
    if (!isdefined(entityweapon)) {
        return;
    }
    killstreak = killstreaks::get_from_weapon(entityweapon);
    if (isdefined(killstreak)) {
        attackingplayer.var_639e4be8++;
        if (isdefined(attackingplayer.var_639e4be8) && attackingplayer.var_639e4be8 == 3) {
            scoreevents::processscoreevent(#"hash_232128502a39219d", attackingplayer, undefined, getweapon(#"gadget_icepick"));
        }
    }
    originalowner = entity.owner;
    if (isdefined(level.var_ff6f539f[entityweapon.name])) {
        thread [[ level.var_ff6f539f[entityweapon.name] ]](entity, attackingplayer);
        function_d545fd0a(attackingplayer, entityweapon);
    }
    if (entityweapon.var_b8a85edd) {
        icepickweapon = getweapon(#"gadget_icepick");
        if (isentity(entity)) {
            entity kill(entity.origin, attackingplayer, self, icepickweapon);
        }
        function_d545fd0a(attackingplayer, entityweapon);
    } else {
        if (isdefined(entity.var_6f6b8de5)) {
            var_9daa805 = 1;
        }
        entity.var_6f6b8de5 = 1;
    }
    function_42bb8ac1(entityweapon, originalowner, attackingplayer, var_9daa805);
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf60295c7, Offset: 0x2ed8
// Size: 0xf8
function function_ea2dfad6(hacker) {
    if (!isdefined(hacker)) {
        return;
    }
    foreach (player in getplayers()) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.var_e2131267) || !(isdefined(player.ishacked) && player.ishacked)) {
            continue;
        }
        if (player.var_e2131267 == hacker) {
            thread function_27c9bfc8(player, 0);
        }
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x63af6ed0, Offset: 0x2fd8
// Size: 0x16c
function function_27c9bfc8(var_11a83c3a, announce) {
    assert(isdefined(var_11a83c3a));
    assert(isdefined(announce));
    var_11a83c3a notify(#"hack_end");
    var_11a83c3a.ishacked = 0;
    var_11a83c3a.var_be173895 = 0;
    var_11a83c3a.var_e2131267 = undefined;
    var_11a83c3a clientfield::set_player_uimodel("hudItems.hacked", 0);
    var_11a83c3a clientfield::set("hackStatus", 0);
    var_11a83c3a clientfield::set_player_uimodel("hudItems.hackedRebootProgress", 1);
    var_11a83c3a ability_player::function_c9b950e3();
    var_559f4f0a = getstatuseffect("hacked");
    var_11a83c3a status_effect::function_408158ef(var_559f4f0a.setype, var_559f4f0a.var_18d16a6b);
    if (announce) {
        var_11a83c3a thread killstreaks::play_taacom_dialog("specialistHackEnd");
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x20aac83d, Offset: 0x3150
// Size: 0x224
function private function_aadad2c(attackingplayer, var_11a83c3a) {
    assert(isdefined(attackingplayer));
    assert(isdefined(var_11a83c3a));
    icepickweapon = getweapon(#"gadget_icepick");
    scoreevents::processscoreevent(#"hacked_enemy", attackingplayer, var_11a83c3a, icepickweapon);
    var_11a83c3a clientfield::set_player_uimodel("hudItems.hackedRebootProgress", 0);
    var_11a83c3a thread killstreaks::play_taacom_dialog("specialistHackBegin", undefined, undefined, undefined, undefined, undefined, 1);
    var_11a83c3a.var_9b4cc45c = gettime();
    var_11a83c3a.ishacked = 1;
    var_11a83c3a.var_e2131267 = attackingplayer;
    var_11a83c3a.var_20183706 = var_11a83c3a function_6c32d092(#"talent_resistance");
    var_559f4f0a = getstatuseffect("hacked");
    duration = var_559f4f0a.var_77449e9;
    if (var_11a83c3a.var_20183706) {
        settingsbundle = function_13f4415c();
        duration *= isdefined(settingsbundle.var_4624074e) ? settingsbundle.var_4624074e : 1;
    }
    var_11a83c3a.hackendtime = gettime() + duration;
    if (isdefined(var_11a83c3a.var_1f5ab061) ? var_11a83c3a.var_1f5ab061 : 0) {
        function_6c031486(var_11a83c3a);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 3, eflags: 0x5 linked
// Checksum 0xbbe14787, Offset: 0x3380
// Size: 0x13c
function private function_a9987363(var_559f4f0a, attackingplayer, var_11a83c3a) {
    assert(isdefined(var_559f4f0a));
    assert(isdefined(attackingplayer));
    assert(isdefined(var_11a83c3a));
    if (!isdefined(var_11a83c3a.hackendtime)) {
        return;
    }
    var_575cc792 = var_11a83c3a.hackendtime - gettime();
    icepickweapon = getweapon(#"gadget_icepick");
    var_11a83c3a status_effect::status_effect_apply(var_559f4f0a, icepickweapon, attackingplayer, 0, var_575cc792);
    var_11a83c3a clientfield::set("hackStatus", 2);
    var_11a83c3a clientfield::set_player_uimodel("hudItems.hacked", 1);
    var_11a83c3a ability_player::function_116ec442();
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x639d4ca9, Offset: 0x34c8
// Size: 0x19c
function private function_bf744a1e(attackingplayer, var_11a83c3a) {
    var_11a83c3a.var_e2131267 = attackingplayer;
    icepickweapon = getweapon(#"gadget_icepick");
    scoreevents::processscoreevent(#"hacked_enemy", attackingplayer, var_11a83c3a, icepickweapon);
    settingsbundle = function_13f4415c();
    var_e7af1dd4 = var_11a83c3a function_6c32d092(#"talent_resistance") ? isdefined(settingsbundle.var_4624074e) ? settingsbundle.var_4624074e : 1 : 1;
    statuseffect = getstatuseffect("hacked");
    additionaltime = statuseffect.var_77449e9 * var_e7af1dd4 * (isdefined(settingsbundle.var_9b5b082d) ? settingsbundle.var_9b5b082d : 1);
    var_11a83c3a.hackendtime += additionaltime;
    var_11a83c3a status_effect::status_effect_apply(statuseffect, icepickweapon, attackingplayer, 0, additionaltime);
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x1859c81c, Offset: 0x3670
// Size: 0x15c
function private function_f255c737(var_11a83c3a) {
    assert(isdefined(var_11a83c3a));
    var_11a83c3a endon(#"death", #"hack_end");
    settingsbundle = function_13f4415c();
    while (gettime() <= var_11a83c3a.hackendtime && level.gameended !== 1) {
        duration = var_11a83c3a.hackendtime - var_11a83c3a.var_9b4cc45c;
        totaltime = gettime() - var_11a83c3a.var_9b4cc45c;
        var_15ab01c8 = totaltime / duration;
        if (totaltime > (isdefined(settingsbundle.var_2f2b5447) ? settingsbundle.var_2f2b5447 : 0)) {
            var_11a83c3a clientfield::set_player_uimodel("hudItems.hackedRebootProgress", var_15ab01c8);
        }
        waitframe(1);
    }
    if (!isdefined(var_11a83c3a)) {
        return;
    }
    thread function_27c9bfc8(var_11a83c3a, 1);
}

// Namespace icepick/gadget_icepick_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x6e34c7c4, Offset: 0x37d8
// Size: 0x144
function function_39026c34(attackingplayer, var_11a83c3a, var_4f6e2cbe) {
    assert(isdefined(attackingplayer));
    assert(isdefined(var_11a83c3a));
    var_11a83c3a endon(#"death");
    if (var_4f6e2cbe) {
        if (isdefined(var_11a83c3a.ishacked) ? var_11a83c3a.ishacked : 0) {
            function_bf744a1e(attackingplayer, var_11a83c3a);
        } else {
            function_aadad2c(attackingplayer, var_11a83c3a);
        }
    }
    if (gettime() >= var_11a83c3a.hackendtime) {
        function_27c9bfc8(var_11a83c3a, 0);
        return;
    }
    function_a9987363(getstatuseffect("hacked"), attackingplayer, var_11a83c3a);
    thread function_f255c737(var_11a83c3a);
}

// Namespace icepick/gadget_icepick_shared
// Params 0, eflags: 0x5 linked
// Checksum 0xb28758b6, Offset: 0x3928
// Size: 0x5c
function private function_9a1266be() {
    self endon(#"death", #"hash_2945c35e0b146804", #"hash_5e72464fef90323e");
    wait(1);
    self function_de8a54a6(0.01);
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x5ad06b7c, Offset: 0x3990
// Size: 0x1ac
function private gadget_icepick_on(slot, weapon) {
    self clientfield::set_to_player("gadget_icepick_on", 1);
    self clientfield::set_player_uimodel("IcePickInfo.hackStarted", 0);
    self clientfield::set_player_uimodel("IcePickInfo.hackFinished", 0);
    self clientfield::set_player_uimodel("IcePickInfo.hackEquipFinished", 0);
    self clientfield::set_player_uimodel("IcePickInfo.hackVehicleFinished", 0);
    self clientfield::set_to_player("currentlybeinghackedplayer", -1);
    function_73d5db3b(self);
    self thread function_9a1266be();
    self function_124efc19(1);
    self.var_c1911c44 = 0;
    self.var_1f5ab061 = 1;
    self.var_6704e6fa = 1;
    self.var_c48b30ab = self function_57dfc908();
    if (isbot(self)) {
        self.var_46fccfba = 1;
        self thread function_f1148c2c(self);
        return;
    }
    thread function_6b9d6894(self);
}

/#

    // Namespace icepick/gadget_icepick_shared
    // Params 0, eflags: 0x4
    // Checksum 0x9f0e2fe5, Offset: 0x3b48
    // Size: 0x4e
    function private function_30fe16c7() {
        self notify("hacked_sensor_dart");
        self endon("hacked_sensor_dart");
        while (isdefined(self)) {
            function_73d5db3b(self);
            waitframe(1);
        }
    }

#/

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xd0daa5a0, Offset: 0x3ba0
// Size: 0x14c
function private gadget_icepick_off(slot, weapon) {
    self clientfield::set_to_player("gadget_icepick_on", 0);
    self notify(#"hash_2945c35e0b146804");
    self notify(#"hash_7b4714f415b8f49e");
    self function_124efc19(0);
    self function_de8a54a6(1);
    self.var_6704e6fa = 1;
    self.var_1f5ab061 = 0;
    self.var_c1911c44 = 0;
    self allowjump(1);
    var_559f4f0a = getstatuseffect("hacking");
    self status_effect::function_408158ef(var_559f4f0a.setype, var_559f4f0a.var_18d16a6b);
    self clientfield::set_to_player("currentlyHacking", 0);
    function_28f0bd8e(self);
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x31ffee52, Offset: 0x3cf8
// Size: 0x29e
function private function_d1f6e8d0(player) {
    player endon(#"hash_2945c35e0b146804", #"death");
    if (!isdefined(player.var_46fccfba)) {
        player.var_46fccfba = 0;
    }
    var_3e6425fc = 0;
    player function_124efc19(1);
    player function_de8a54a6(1);
    var_559f4f0a = getstatuseffect("hacking");
    icepickweapon = getweapon(#"gadget_icepick");
    settingsbundle = function_13f4415c();
    while (true) {
        if (player.var_46fccfba && !var_3e6425fc) {
            player function_124efc19(0);
            player function_de8a54a6(isdefined(settingsbundle.var_3ca119bd) ? settingsbundle.var_3ca119bd : 1);
            player allowjump(0);
            player.var_6704e6fa = isdefined(settingsbundle.var_c424ffde) ? settingsbundle.var_c424ffde : 1;
            if (isdefined(var_559f4f0a)) {
                player status_effect::status_effect_apply(var_559f4f0a, icepickweapon, player, 0);
            }
            var_3e6425fc = 1;
        } else if (!player.var_46fccfba && var_3e6425fc) {
            player function_124efc19(1);
            player function_de8a54a6(1);
            player.var_6704e6fa = 1;
            var_3e6425fc = 0;
            player allowjump(1);
            player status_effect::function_408158ef(var_559f4f0a.setype, var_559f4f0a.var_18d16a6b);
        }
        waitframe(1);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa72b4024, Offset: 0x3fa0
// Size: 0xb4
function function_f1148c2c(player) {
    player endon(#"death", #"hash_7b4714f415b8f49e");
    player notify(#"hash_5e72464fef90323e");
    if (player isswitchingweapons()) {
        player waittilltimeout(1, #"weapon_change_complete");
    }
    if (isdefined(player) && isplayer(player)) {
        starthack(player);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x5d8b6d94, Offset: 0x4060
// Size: 0x216
function private function_6b9d6894(player) {
    player endon(#"hash_2945c35e0b146804", #"death", #"disconnect");
    if (!isdefined(player.var_3ca20bb9)) {
        player.var_3ca20bb9 = 0;
    }
    while (true) {
        waitresult = player waittill(#"menuresponse");
        switch (waitresult.response) {
        case #"id":
            if (!(isdefined(player.var_c1911c44) ? player.var_c1911c44 : 0) && waitresult.intpayload === 1) {
                if (isdefined(level.var_fdb0a658) && level.var_fdb0a658) {
                    player iprintlnbold(#"hash_77195fae71b9bcdd");
                    player switchtoweapon();
                    return;
                }
                player thread function_f1148c2c(player);
            }
            switch (waitresult.intpayload) {
            case 1:
                player.var_46fccfba = 1;
                break;
            case 0:
                player.var_46fccfba = 0;
                break;
            }
            break;
        case #"back":
            if (waitresult.intpayload == 1) {
                player switchtoweapon();
            }
            break;
        }
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xd1c58c58, Offset: 0x4280
// Size: 0xf6
function private function_28f0bd8e(hacker) {
    hacker notify(#"hash_ea5ac4d11419268");
    hacker endon(#"hash_ea5ac4d11419268");
    objectiveid = hacker.var_1d6ad02e;
    settingsbundle = function_13f4415c();
    hacker waittilltimeout(isdefined(settingsbundle.var_9baf2d44) ? settingsbundle.var_9baf2d44 : 0, #"death", #"disconnect");
    if (isdefined(objectiveid)) {
        gameobjects::release_obj_id(objectiveid);
        objective_delete(objectiveid);
        if (isdefined(hacker)) {
            hacker.var_1d6ad02e = undefined;
        }
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x74106bc8, Offset: 0x4380
// Size: 0x1b4
function private function_b76c8353(hacker) {
    hacker endon(#"death", #"hash_2945c35e0b146804");
    settingsbundle = function_13f4415c();
    var_a1a18ce2 = isdefined(settingsbundle.var_679962fc) ? settingsbundle.var_679962fc : 1000;
    var_49c01cfb = gettime() + var_a1a18ce2;
    starttime = gettime();
    while (gettime() < var_49c01cfb) {
        timeelapsed = gettime() - starttime;
        var_2d62ff4b = timeelapsed / var_a1a18ce2;
        wait(0.1);
    }
    if (!isdefined(hacker.var_1d6ad02e)) {
        hacker.var_1d6ad02e = gameobjects::get_next_obj_id();
    }
    objective_add(hacker.var_1d6ad02e, "active", hacker, #"exposed_hacker");
    objective_setteam(hacker.var_1d6ad02e, hacker.team);
    function_da7940a3(hacker.var_1d6ad02e, 1);
    function_3ae6fa3(hacker.var_1d6ad02e, hacker.team, 0);
}

// Namespace icepick/gadget_icepick_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x404bde6a, Offset: 0x4540
// Size: 0x1f8
function function_42bb8ac1(weapon, originalowner, newowner, var_53c10ed8) {
    if (!isdefined(weapon) || !isdefined(originalowner)) {
        return;
    }
    switch (weapon.name) {
    case #"gadget_spawnbeacon":
        leaderdialog = "enemySpawnBeaconHack";
        break;
    case #"cobra_20mm_comlink":
    case #"helicopter_comlink":
    case #"inventory_helicopter_comlink":
        leaderdialog = "enemyAttackChopperHack";
        break;
    case #"counteruav":
        leaderdialog = "enemyCUAVHack";
        break;
    case #"drone_squadron":
    case #"inventory_drone_squadron":
        leaderdialog = "enemyDroneSquadronHack";
        break;
    case #"supplydrop":
        leaderdialog = "enemyCarePackageHack";
        break;
    case #"uav":
        leaderdialog = "enemyUAVHack";
        break;
    case #"ultimate_turret":
    case #"inventory_ultimate_turret":
        leaderdialog = "enemySentryHack";
        break;
    }
    if (isdefined(leaderdialog) && isdefined(level.var_57e2bc08)) {
        if (level.teambased) {
            thread [[ level.var_57e2bc08 ]](leaderdialog, originalowner.team, originalowner);
        }
    }
    if (isdefined(level.var_b42019ef)) {
        originalowner thread [[ level.var_b42019ef ]](weapon, newowner, var_53c10ed8);
    }
}

// Namespace icepick/gadget_icepick_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3f698822, Offset: 0x4740
// Size: 0x3ec
function function_d545fd0a(player, weapon) {
    switch (weapon.name) {
    case #"supplydrop":
        var_d975dd49 = "hacked_care_package";
        break;
    case #"counteruav":
        var_d975dd49 = "hacked_cuav";
        break;
    case #"uav":
        var_d975dd49 = "hacked_uav";
        break;
    case #"gadget_spawnbeacon":
        var_d975dd49 = "hacked_spawn_beacon";
        break;
    case #"planemortar":
    case #"inventory_planemortar":
        var_d975dd49 = "hacked_planemortar";
        break;
    case #"inventory_remote_missile":
    case #"remote_missile":
        var_d975dd49 = "hacked_hellstorm";
        break;
    case #"inventory_straferun":
    case #"straferun":
        var_d975dd49 = "hacked_warthog";
        break;
    case #"dart":
    case #"inventory_dart":
        var_d975dd49 = "hacked_dart";
        break;
    case #"inventory_drone_squadron":
    case #"drone_squadron":
        var_d975dd49 = "hacked_drone_squad";
        break;
    case #"inventory_helicopter_comlink":
    case #"cobra_20mm_comlink":
    case #"helicopter_comlink":
        var_d975dd49 = "hacked_attack_chopper";
        break;
    case #"overwatch_helicopter":
    case #"inventory_overwatch_helicopter":
        var_d975dd49 = "hacked_sniper_chopper";
        break;
    case #"ac130":
    case #"inventory_ac130":
        var_d975dd49 = "hacked_ac130";
        break;
    case #"tank_robot":
    case #"inventory_tank_robot":
    case #"ai_tank_marker":
        var_d975dd49 = "hacked_mantis";
        break;
    case #"ultimate_turret":
    case #"inventory_ultimate_turret":
        var_d975dd49 = "hacked_ult_turret";
        break;
    case #"recon_car":
    case #"inventory_recon_car":
        var_d975dd49 = "hacked_rcxd";
        break;
    case #"gadget_supplypod":
        var_d975dd49 = "hacked_supplypod";
        break;
    case #"gadget_smart_cover":
    case #"ability_smart_cover":
        var_d975dd49 = "hacked_barricade";
        break;
    case #"eq_sensor":
        var_d975dd49 = "hacked_sensor_dart";
        break;
    case #"eq_seeker_mine":
        var_d975dd49 = "hacked_seeker";
        break;
    case #"trophy_system":
        var_d975dd49 = "hacked_trophy";
        break;
    }
    if (isdefined(var_d975dd49)) {
        icepickweapon = getweapon(#"gadget_icepick");
        scoreevents::processscoreevent(var_d975dd49, player, undefined, icepickweapon);
    }
}


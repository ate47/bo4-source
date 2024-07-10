#using scripts\wz_common\wz_ai_zonemgr.gsc;

#namespace wz_open_skyscrapers_ai_zones;

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x8ade708e, Offset: 0x88
// Size: 0x858
function init() {
    level.var_dc16557c = 1;
    level.var_c64b3b46 = 1;
    level.var_31c1a07f = isdefined(getgametypesetting(#"hash_9ccb8e5d58cd832")) ? getgametypesetting(#"hash_9ccb8e5d58cd832") : 0;
    level.var_524d0ac5 = isdefined(getgametypesetting(#"hash_2491cd92f1d6a91c")) ? getgametypesetting(#"hash_2491cd92f1d6a91c") : 0;
    level.var_243ebed2 = isdefined(getgametypesetting(#"hash_32c2e0d36ccd839b")) ? getgametypesetting(#"hash_32c2e0d36ccd839b") : 0;
    level.var_34d42591 = isdefined(getgametypesetting(#"hash_183653e5217f3e44")) ? getgametypesetting(#"hash_183653e5217f3e44") : 0;
    level.var_8a023320 = isdefined(getgametypesetting(#"hash_782886da6ca17e94")) ? getgametypesetting(#"hash_782886da6ca17e94") : 0;
    level.var_d224ae55 = isdefined(getgametypesetting(#"hash_47764e32feb62fde")) ? getgametypesetting(#"hash_47764e32feb62fde") : 0;
    level.var_ac94a871 = isdefined(getgametypesetting(#"hash_6cd3a8276b19f394")) ? getgametypesetting(#"hash_6cd3a8276b19f394") : 0;
    level.var_56a1f858 = isdefined(getgametypesetting(#"hash_2034b036eea8a033")) ? getgametypesetting(#"hash_2034b036eea8a033") : 0;
    level.var_2f8e7ed7 = isdefined(getgametypesetting(#"hash_3fb5dc1cb345b96d")) ? getgametypesetting(#"hash_3fb5dc1cb345b96d") : 0;
    level.var_97d3cd33 = isdefined(getgametypesetting(#"hash_4c2ba49a89782be7")) ? getgametypesetting(#"hash_4c2ba49a89782be7") : 0;
    level.var_66626ce3 = isdefined(getgametypesetting(#"hash_448933e114e4d339")) ? getgametypesetting(#"hash_448933e114e4d339") : 0;
    level.var_85d43ea3 = #"spawner_boct_zombie_wz";
    if ((isdefined(getgametypesetting(#"hash_72594454f1c833aa")) ? getgametypesetting(#"hash_72594454f1c833aa") : 0) == 1) {
        level.var_85d43ea3 = #"hash_618248fca82d83a6";
    }
    level.var_6df0d3b6 = &function_6df0d3b6;
    if (isdefined(level.warzoneblightfatherseverywhere) && level.warzoneblightfatherseverywhere && isdefined(level.var_d33a57a) && level.var_d33a57a) {
        function_36cc50(#"spawner_wz_blight_father", 1, 1);
    } else if (isdefined(level.warzonebrutuseverywhere) && level.warzonebrutuseverywhere && isdefined(level.var_6b59ac2c) && level.var_6b59ac2c) {
        function_36cc50(#"spawner_boct_brutus_wz", 4, 2);
    } else if (isdefined(level.warzonebrutuslargeeverywhere) && level.warzonebrutuslargeeverywhere && isdefined(level.var_4f7f5c18) && level.var_4f7f5c18) {
        function_36cc50(#"spawner_boct_brutus_special_wz", 4, 2);
    } else if (isdefined(level.warzonehellhoundseverywhere) && level.warzonehellhoundseverywhere && isdefined(level.var_b6e30614) && level.var_b6e30614) {
        function_36cc50(#"spawner_boct_zombie_dog_wz", 10, 4);
    } else if (isdefined(level.warzoneavogadroeverywhere) && level.warzoneavogadroeverywhere && isdefined(level.var_9196aafd) && level.var_9196aafd) {
        function_36cc50(#"spawner_boct_avogadro", 4, 2);
    } else if (isdefined(level.var_d373b4e4) && level.var_d373b4e4) {
        function_f910ed8a();
    } else if (isdefined(level.warzoneminibosses) && level.warzoneminibosses) {
        function_e938f117();
    } else {
        level.zoneindex = level.var_3622eea1;
        level.zone_setups = [];
        level.zone_setups[0] = &function_c41ad9f9;
        level.zone_setups[1] = &function_53f0d046;
        level.zone_setups[2] = &function_864a9dec;
        if (isdefined(level.var_d06e67bc) && level.var_d06e67bc) {
            level.zoneindex = randomintrange(0, level.zone_setups.size);
        }
        if (isdefined(level.zone_setups[level.zoneindex])) {
            [[ level.zone_setups[level.zoneindex] ]]();
        } else {
            function_c41ad9f9();
        }
    }
    level notify(#"hash_7f7eec328c07606d");
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 1, eflags: 0x1 linked
// Checksum 0xfd8c9869, Offset: 0x8e8
// Size: 0x28c
function function_6df0d3b6(zone_name) {
    switch (zone_name) {
    case #"asylum":
        if (isdefined(level.var_243ebed2) && level.var_243ebed2) {
            return true;
        }
        break;
    case #"cemetary":
        if (isdefined(level.var_34d42591) && level.var_34d42591) {
            return true;
        }
        break;
    case #"diner":
        if (isdefined(level.var_8a023320) && level.var_8a023320) {
            return true;
        }
        break;
    case #"boxinggym":
        if (isdefined(level.var_31c1a07f) && level.var_31c1a07f) {
            return true;
        }
        break;
    case #"lighthouse":
        if (isdefined(level.var_524d0ac5) && level.var_524d0ac5) {
            return true;
        }
        break;
    case #"nuketowncrater":
        if (isdefined(level.var_d224ae55) && level.var_d224ae55) {
            return true;
        }
        break;
    case #"nuketownbunker":
        if (isdefined(level.var_ac94a871) && level.var_ac94a871) {
            return true;
        }
        break;
    case #"farmnorth":
        if (isdefined(level.var_56a1f858) && level.var_56a1f858) {
            return true;
        }
        break;
    case #"farmsouth":
        if (isdefined(level.var_2f8e7ed7) && level.var_2f8e7ed7) {
            return true;
        }
        break;
    case #"farmwest":
        if (isdefined(level.var_97d3cd33) && level.var_97d3cd33) {
            return true;
        }
        break;
    case #"buried":
        if (isdefined(level.var_66626ce3) && level.var_66626ce3) {
            return true;
        }
        break;
    }
    return false;
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 2, eflags: 0x1 linked
// Checksum 0x839d9eb6, Offset: 0xb80
// Size: 0x3e
function function_6e9af98a(var_2799920d, var_d6d494ab) {
    if (isdefined(level.var_fd6c6b69) && level.var_fd6c6b69) {
        return var_d6d494ab;
    }
    return var_2799920d;
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 2, eflags: 0x1 linked
// Checksum 0xb4df905b, Offset: 0xbc8
// Size: 0x3e
function function_bb7cbe85(var_2799920d, var_d6d494ab) {
    if (isdefined(level.var_3fecd9c2) && level.var_3fecd9c2) {
        return var_d6d494ab;
    }
    return var_2799920d;
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 2, eflags: 0x1 linked
// Checksum 0xb979a99, Offset: 0xc10
// Size: 0x3e
function function_5f1710a5(var_2799920d, var_d6d494ab) {
    if (isdefined(level.var_3fecd9c2) && level.var_3fecd9c2) {
        return var_d6d494ab;
    }
    return var_2799920d;
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xf9abcf1b, Offset: 0xc58
// Size: 0x108
function function_14cf2357() {
    var_d71618bb = [];
    if (function_6df0d3b6(#"farmnorth")) {
        var_d71618bb[var_d71618bb.size] = #"farmnorth";
    }
    if (function_6df0d3b6(#"farmsouth")) {
        var_d71618bb[var_d71618bb.size] = #"farmsouth";
    }
    if (function_6df0d3b6(#"farmwest")) {
        var_d71618bb[var_d71618bb.size] = #"farmwest";
    }
    if (var_d71618bb.size == 0) {
        return #"farmnorth";
    }
    return var_d71618bb[randomintrange(0, var_d71618bb.size)];
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 1, eflags: 0x1 linked
// Checksum 0xd5f92087, Offset: 0xd68
// Size: 0xfc
function function_b0b1cbb8(ai_type) {
    wz_ai_zonemgr::function_462b41e2(#"farmnorth", ai_type, #"hash_2783dbab1f862606", #"hash_3ad3de90342f2d4b", #"hash_2a93e93b275c38ed");
    wz_ai_zonemgr::function_462b41e2(#"farmsouth", ai_type, #"hash_6dea2e4afc816818", #"hash_61373b747c6a21fd", #"hash_734bf5054445e0df");
    wz_ai_zonemgr::function_462b41e2(#"farmwest", ai_type, #"hash_4b49cb98f0fd776a", #"hash_43647ef7af66f82f", #"hash_408b3ed7db6f9401");
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xe6673503, Offset: 0xe70
// Size: 0x884
function function_c41ad9f9() {
    var_ce0426e0 = (function_6e9af98a(10, 20), function_bb7cbe85(5, 7), function_5f1710a5(2, 3));
    var_6ba5e275 = (function_6e9af98a(6, 12), function_bb7cbe85(3, 5), function_5f1710a5(1, 2));
    var_b0befc80 = getdvar(#"hash_15fba4abe8704cb8", 0);
    if (isdefined(var_b0befc80) && var_b0befc80) {
        var_ce0426e0 = getdvarvector(#"hash_cbccd885e75d219", (10, 5, 2));
        var_6ba5e275 = getdvarvector(#"hash_cbccd885e75d219", (6, 3, 1));
    }
    var_ecf3ab7f = var_ce0426e0[0];
    var_8a0a1dec = var_ce0426e0[1];
    var_5b2d986e = var_ce0426e0[2];
    wz_ai_zonemgr::function_5f0d105a(0, #"asylum", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    if (level.var_d33a57a) {
        wz_ai_zonemgr::function_5f0d105a(0, #"cemetary", #"spawner_wz_blight_father", 1, 1, 0);
        wz_ai_zonemgr::function_c3bb62c1(#"cemetary", #"spawner_wz_blight_father", 2);
        wz_ai_zonemgr::function_d6258153(#"cemetary", #"spawner_wz_blight_father", 1);
    } else {
        wz_ai_zonemgr::function_5f0d105a(0, #"cemetary", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    }
    wz_ai_zonemgr::function_5f0d105a(0, #"nuketowncrater", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e + 3);
    wz_ai_zonemgr::function_6c75dee3(#"nuketowncrater", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_5f0d105a(0, #"nuketownbunker", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_5f0d105a(0, #"buried", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(#"buried", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_2826217a(#"buried", level.var_85d43ea3, 2);
    var_b2ab573e = function_14cf2357();
    wz_ai_zonemgr::function_5f0d105a(0, var_b2ab573e, level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(var_b2ab573e, level.var_85d43ea3, 1);
    var_ecf3ab7f = var_6ba5e275[0];
    var_8a0a1dec = var_6ba5e275[1];
    var_5b2d986e = var_6ba5e275[2];
    wz_ai_zonemgr::function_5f0d105a(1, #"diner", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_5f0d105a(1, #"boxinggym", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(#"boxinggym", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_5f0d105a(1, #"lighthouse", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_462b41e2(#"asylum", level.var_85d43ea3, #"hospital_stash", #"hash_ca8b234ad1fea38");
    if (level.var_d33a57a) {
        wz_ai_zonemgr::function_462b41e2(#"cemetary", #"spawner_wz_blight_father", #"zombie_stash_graveyard", #"zombie_stash_graveyard_quest", #"zombie_stash_graveyard_ee");
    } else {
        wz_ai_zonemgr::function_462b41e2(#"cemetary", level.var_85d43ea3, #"zombie_stash_graveyard", #"zombie_stash_graveyard_quest", #"zombie_stash_graveyard_ee");
    }
    wz_ai_zonemgr::function_462b41e2(#"diner", level.var_85d43ea3, #"hash_678a1efded2b597a", #"hash_33f7121f70c3065f", #"hash_779cba7072600ad1");
    wz_ai_zonemgr::function_462b41e2(#"boxinggym", level.var_85d43ea3, #"hash_1b83b702bbaae298", #"hash_6a0d13acf3e5687d", #"hash_47a63bc4a605b45f");
    wz_ai_zonemgr::function_462b41e2(#"lighthouse", level.var_85d43ea3, #"hash_2141ecb8d2d86b22", #"hash_2b546c0315159617", #"hash_75cc919e81dc8b19");
    wz_ai_zonemgr::function_462b41e2(#"nuketowncrater", level.var_85d43ea3, #"hash_468067e2be6e3cfd", #"hash_49e8a607ea22e650", #"hash_550872d1d1938f94");
    wz_ai_zonemgr::function_462b41e2(#"nuketownbunker", level.var_85d43ea3, #"hash_688b1b12624fa9a3", #"hash_e14eae568dbe7c6");
    wz_ai_zonemgr::function_462b41e2(#"buried", level.var_85d43ea3, #"hash_78f8f730158519ff", #"hash_4ee6deffa30cc6e2", #"hash_7d028af90dad72ae");
    function_b0b1cbb8(level.var_85d43ea3);
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xb1f740, Offset: 0x1700
// Size: 0x884
function function_53f0d046() {
    var_ce0426e0 = (function_6e9af98a(10, 20), function_bb7cbe85(4, 6), function_5f1710a5(2, 3));
    var_6ba5e275 = (function_6e9af98a(10, 20), function_bb7cbe85(4, 6), function_5f1710a5(2, 3));
    var_b0befc80 = getdvar(#"hash_15fba4abe8704cb8", 0);
    if (isdefined(var_b0befc80) && var_b0befc80) {
        var_ce0426e0 = getdvarvector(#"hash_cbccd885e75d219", (10, 4, 2));
        var_6ba5e275 = getdvarvector(#"hash_cbccd885e75d219", (10, 4, 2));
    }
    var_ecf3ab7f = var_ce0426e0[0];
    var_8a0a1dec = var_ce0426e0[1];
    var_5b2d986e = var_ce0426e0[2];
    wz_ai_zonemgr::function_5f0d105a(0, #"boxinggym", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(#"boxinggym", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_5f0d105a(0, #"lighthouse", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_5f0d105a(0, #"nuketowncrater", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e + 2);
    wz_ai_zonemgr::function_6c75dee3(#"nuketowncrater", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_5f0d105a(0, #"nuketownbunker", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_5f0d105a(0, #"buried", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(#"buried", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_2826217a(#"buried", level.var_85d43ea3, 2);
    var_b2ab573e = function_14cf2357();
    wz_ai_zonemgr::function_5f0d105a(0, var_b2ab573e, level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(var_b2ab573e, level.var_85d43ea3, 1);
    var_ecf3ab7f = var_6ba5e275[0];
    var_8a0a1dec = var_6ba5e275[1];
    var_5b2d986e = var_6ba5e275[2];
    wz_ai_zonemgr::function_5f0d105a(1, #"asylum", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    if (level.var_d33a57a) {
        wz_ai_zonemgr::function_5f0d105a(1, #"cemetary", #"spawner_wz_blight_father", 1, 1, 0);
        wz_ai_zonemgr::function_c3bb62c1(#"cemetary", #"spawner_wz_blight_father", 2);
        wz_ai_zonemgr::function_d6258153(#"cemetary", #"spawner_wz_blight_father", 1);
    } else {
        wz_ai_zonemgr::function_5f0d105a(1, #"cemetary", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    }
    wz_ai_zonemgr::function_5f0d105a(1, #"diner", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_462b41e2(#"asylum", level.var_85d43ea3, #"hospital_stash", #"hash_ca8b234ad1fea38");
    if (level.var_d33a57a) {
        wz_ai_zonemgr::function_462b41e2(#"cemetary", #"spawner_wz_blight_father", #"zombie_stash_graveyard", #"zombie_stash_graveyard_quest", #"zombie_stash_graveyard_ee");
    } else {
        wz_ai_zonemgr::function_462b41e2(#"cemetary", level.var_85d43ea3, #"zombie_stash_graveyard", #"zombie_stash_graveyard_quest", #"zombie_stash_graveyard_ee");
    }
    wz_ai_zonemgr::function_462b41e2(#"diner", level.var_85d43ea3, #"hash_678a1efded2b597a", #"hash_33f7121f70c3065f", #"hash_779cba7072600ad1");
    wz_ai_zonemgr::function_462b41e2(#"boxinggym", level.var_85d43ea3, #"hash_1b83b702bbaae298", #"hash_6a0d13acf3e5687d", #"hash_47a63bc4a605b45f");
    wz_ai_zonemgr::function_462b41e2(#"lighthouse", level.var_85d43ea3, #"hash_2141ecb8d2d86b22", #"hash_2b546c0315159617", #"hash_75cc919e81dc8b19");
    wz_ai_zonemgr::function_462b41e2(#"nuketowncrater", level.var_85d43ea3, #"hash_468067e2be6e3cfd", #"hash_49e8a607ea22e650", #"hash_550872d1d1938f94");
    wz_ai_zonemgr::function_462b41e2(#"nuketownbunker", level.var_85d43ea3, #"hash_688b1b12624fa9a3", #"hash_e14eae568dbe7c6");
    wz_ai_zonemgr::function_462b41e2(#"buried", level.var_85d43ea3, #"hash_78f8f730158519ff", #"hash_4ee6deffa30cc6e2", #"hash_7d028af90dad72ae");
    function_b0b1cbb8(level.var_85d43ea3);
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x63798396, Offset: 0x1f90
// Size: 0x884
function function_864a9dec() {
    var_ce0426e0 = (function_6e9af98a(10, 20), function_bb7cbe85(4, 6), function_5f1710a5(2, 3));
    var_6ba5e275 = (function_6e9af98a(10, 20), function_bb7cbe85(4, 6), function_5f1710a5(2, 3));
    var_b0befc80 = getdvar(#"hash_15fba4abe8704cb8", 0);
    if (isdefined(var_b0befc80) && var_b0befc80) {
        var_ce0426e0 = getdvarvector(#"hash_cbccd885e75d219", (10, 4, 2));
        var_6ba5e275 = getdvarvector(#"hash_cbccd885e75d219", (10, 4, 2));
    }
    var_ecf3ab7f = var_ce0426e0[0];
    var_8a0a1dec = var_ce0426e0[1];
    var_5b2d986e = var_ce0426e0[2];
    wz_ai_zonemgr::function_5f0d105a(0, #"diner", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_5f0d105a(0, #"lighthouse", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_5f0d105a(0, #"nuketowncrater", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e + 2);
    wz_ai_zonemgr::function_6c75dee3(#"nuketowncrater", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_5f0d105a(0, #"nuketownbunker", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_5f0d105a(0, #"buried", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(#"buried", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_2826217a(#"buried", level.var_85d43ea3, 2);
    var_b2ab573e = function_14cf2357();
    wz_ai_zonemgr::function_5f0d105a(0, var_b2ab573e, level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(var_b2ab573e, level.var_85d43ea3, 1);
    var_ecf3ab7f = var_6ba5e275[0];
    var_8a0a1dec = var_6ba5e275[1];
    var_5b2d986e = var_6ba5e275[2];
    wz_ai_zonemgr::function_5f0d105a(1, #"asylum", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    if (level.var_d33a57a) {
        wz_ai_zonemgr::function_5f0d105a(1, #"cemetary", #"spawner_wz_blight_father", 1, 1, 0);
        wz_ai_zonemgr::function_c3bb62c1(#"cemetary", #"spawner_wz_blight_father", 2);
        wz_ai_zonemgr::function_d6258153(#"cemetary", #"spawner_wz_blight_father", 1);
    } else {
        wz_ai_zonemgr::function_5f0d105a(1, #"cemetary", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    }
    wz_ai_zonemgr::function_5f0d105a(1, #"boxinggym", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(#"boxinggym", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_462b41e2(#"asylum", level.var_85d43ea3, #"hospital_stash", #"hash_ca8b234ad1fea38");
    if (level.var_d33a57a) {
        wz_ai_zonemgr::function_462b41e2(#"cemetary", #"spawner_wz_blight_father", #"zombie_stash_graveyard", #"zombie_stash_graveyard_quest", #"zombie_stash_graveyard_ee");
    } else {
        wz_ai_zonemgr::function_462b41e2(#"cemetary", level.var_85d43ea3, #"zombie_stash_graveyard", #"zombie_stash_graveyard_quest", #"zombie_stash_graveyard_ee");
    }
    wz_ai_zonemgr::function_462b41e2(#"diner", level.var_85d43ea3, #"hash_678a1efded2b597a", #"hash_33f7121f70c3065f", #"hash_779cba7072600ad1");
    wz_ai_zonemgr::function_462b41e2(#"boxinggym", level.var_85d43ea3, #"hash_1b83b702bbaae298", #"hash_6a0d13acf3e5687d", #"hash_47a63bc4a605b45f");
    wz_ai_zonemgr::function_462b41e2(#"lighthouse", level.var_85d43ea3, #"hash_2141ecb8d2d86b22", #"hash_2b546c0315159617", #"hash_75cc919e81dc8b19");
    wz_ai_zonemgr::function_462b41e2(#"nuketowncrater", level.var_85d43ea3, #"hash_468067e2be6e3cfd", #"hash_49e8a607ea22e650", #"hash_550872d1d1938f94");
    wz_ai_zonemgr::function_462b41e2(#"nuketownbunker", level.var_85d43ea3, #"hash_688b1b12624fa9a3", #"hash_e14eae568dbe7c6");
    wz_ai_zonemgr::function_462b41e2(#"buried", level.var_85d43ea3, #"hash_78f8f730158519ff", #"hash_4ee6deffa30cc6e2", #"hash_7d028af90dad72ae");
    function_b0b1cbb8(level.var_85d43ea3);
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 3, eflags: 0x1 linked
// Checksum 0x6b457506, Offset: 0x2820
// Size: 0x5dc
function function_36cc50(var_8667e69, maxcount, var_8a14a619) {
    wz_ai_zonemgr::function_5f0d105a(0, #"asylum", var_8667e69, maxcount, var_8a14a619, 0);
    wz_ai_zonemgr::function_c3bb62c1(#"asylum", var_8667e69, 2);
    wz_ai_zonemgr::function_5f0d105a(0, #"cemetary", var_8667e69, maxcount, var_8a14a619, 0);
    wz_ai_zonemgr::function_c3bb62c1(#"cemetary", var_8667e69, 2);
    wz_ai_zonemgr::function_5f0d105a(1, #"diner", var_8667e69, maxcount, var_8a14a619, 0);
    wz_ai_zonemgr::function_c3bb62c1(#"diner", var_8667e69, 2);
    wz_ai_zonemgr::function_5f0d105a(1, #"boxinggym", var_8667e69, maxcount, var_8a14a619, 0);
    wz_ai_zonemgr::function_c3bb62c1(#"boxinggym", var_8667e69, 2);
    wz_ai_zonemgr::function_6c75dee3(#"boxinggym", var_8667e69, 1);
    wz_ai_zonemgr::function_5f0d105a(1, #"lighthouse", var_8667e69, maxcount, var_8a14a619, 0);
    wz_ai_zonemgr::function_c3bb62c1(#"lighthouse", var_8667e69, 2);
    wz_ai_zonemgr::function_5f0d105a(2, #"nuketowncrater", var_8667e69, maxcount, var_8a14a619, 0);
    wz_ai_zonemgr::function_c3bb62c1(#"nuketowncrater", var_8667e69, 2);
    wz_ai_zonemgr::function_5f0d105a(2, #"nuketownbunker", var_8667e69, maxcount, var_8a14a619, 0);
    wz_ai_zonemgr::function_c3bb62c1(#"nuketownbunker", var_8667e69, 2);
    wz_ai_zonemgr::function_5f0d105a(2, #"buried", var_8667e69, maxcount, var_8a14a619, 0);
    wz_ai_zonemgr::function_c3bb62c1(#"buried", var_8667e69, 2);
    var_b2ab573e = function_14cf2357();
    wz_ai_zonemgr::function_5f0d105a(2, var_b2ab573e, var_8667e69, maxcount, var_8a14a619, 0);
    wz_ai_zonemgr::function_c3bb62c1(var_b2ab573e, var_8667e69, 2);
    wz_ai_zonemgr::function_462b41e2(#"asylum", var_8667e69, #"hospital_stash", #"hash_ca8b234ad1fea38");
    wz_ai_zonemgr::function_462b41e2(#"cemetary", var_8667e69, #"zombie_stash_graveyard", #"zombie_stash_graveyard_quest", #"zombie_stash_graveyard_ee");
    wz_ai_zonemgr::function_462b41e2(#"diner", var_8667e69, #"hash_678a1efded2b597a", #"hash_33f7121f70c3065f", #"hash_779cba7072600ad1");
    wz_ai_zonemgr::function_462b41e2(#"boxinggym", var_8667e69, #"hash_1b83b702bbaae298", #"hash_6a0d13acf3e5687d", #"hash_47a63bc4a605b45f");
    wz_ai_zonemgr::function_462b41e2(#"lighthouse", var_8667e69, #"hash_2141ecb8d2d86b22", #"hash_2b546c0315159617", #"hash_75cc919e81dc8b19");
    wz_ai_zonemgr::function_462b41e2(#"nuketowncrater", var_8667e69, #"hash_468067e2be6e3cfd", #"hash_49e8a607ea22e650", #"hash_550872d1d1938f94");
    wz_ai_zonemgr::function_462b41e2(#"nuketownbunker", var_8667e69, #"hash_688b1b12624fa9a3", #"hash_e14eae568dbe7c6");
    wz_ai_zonemgr::function_462b41e2(#"buried", var_8667e69, #"hash_78f8f730158519ff", #"hash_4ee6deffa30cc6e2", #"hash_7d028af90dad72ae");
    function_b0b1cbb8(var_8667e69);
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xf8efddda, Offset: 0x2e08
// Size: 0x63c
function function_f910ed8a() {
    zombie_count = max(level.warzonezombiesmaxcount, 1);
    if (isdedicated()) {
        iprintlnbold("Zombie count is " + zombie_count + "\n");
    }
    var_c3bb4e09 = zombie_count;
    var_f1fbce84 = zombie_count;
    var_aeae9f59 = var_f1fbce84 + var_f1fbce84;
    wz_ai_zonemgr::function_5f0d105a(0, #"diner", level.var_85d43ea3, var_aeae9f59, var_f1fbce84, var_c3bb4e09);
    wz_ai_zonemgr::function_5f0d105a(0, #"lighthouse", level.var_85d43ea3, var_aeae9f59, var_f1fbce84, var_c3bb4e09);
    wz_ai_zonemgr::function_5f0d105a(0, #"nuketowncrater", level.var_85d43ea3, var_aeae9f59, var_f1fbce84, var_c3bb4e09);
    wz_ai_zonemgr::function_6c75dee3(#"nuketowncrater", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_5f0d105a(0, #"nuketownbunker", level.var_85d43ea3, var_aeae9f59, var_f1fbce84, var_c3bb4e09);
    wz_ai_zonemgr::function_5f0d105a(0, #"asylum", level.var_85d43ea3, var_aeae9f59, var_f1fbce84, var_c3bb4e09);
    wz_ai_zonemgr::function_5f0d105a(0, #"cemetary", level.var_85d43ea3, var_aeae9f59, var_f1fbce84, var_c3bb4e09);
    wz_ai_zonemgr::function_5f0d105a(0, #"boxinggym", level.var_85d43ea3, var_aeae9f59, var_f1fbce84, var_c3bb4e09);
    wz_ai_zonemgr::function_6c75dee3(#"boxinggym", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_5f0d105a(0, #"buried", level.var_85d43ea3, var_aeae9f59, var_f1fbce84, var_c3bb4e09);
    wz_ai_zonemgr::function_6c75dee3(#"buried", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_2826217a(#"buried", level.var_85d43ea3, 2);
    var_b2ab573e = function_14cf2357();
    wz_ai_zonemgr::function_5f0d105a(0, var_b2ab573e, level.var_85d43ea3, var_aeae9f59, var_f1fbce84, var_c3bb4e09);
    wz_ai_zonemgr::function_6c75dee3(var_b2ab573e, level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_462b41e2(#"asylum", level.var_85d43ea3, #"hospital_stash", #"hash_ca8b234ad1fea38");
    wz_ai_zonemgr::function_462b41e2(#"cemetary", level.var_85d43ea3, #"zombie_stash_graveyard", #"zombie_stash_graveyard_quest", #"zombie_stash_graveyard_ee");
    wz_ai_zonemgr::function_462b41e2(#"diner", level.var_85d43ea3, #"hash_678a1efded2b597a", #"hash_33f7121f70c3065f", #"hash_779cba7072600ad1");
    wz_ai_zonemgr::function_462b41e2(#"boxinggym", level.var_85d43ea3, #"hash_1b83b702bbaae298", #"hash_6a0d13acf3e5687d", #"hash_47a63bc4a605b45f");
    wz_ai_zonemgr::function_462b41e2(#"lighthouse", level.var_85d43ea3, #"hash_2141ecb8d2d86b22", #"hash_2b546c0315159617", #"hash_75cc919e81dc8b19");
    wz_ai_zonemgr::function_462b41e2(#"nuketowncrater", level.var_85d43ea3, #"hash_468067e2be6e3cfd", #"hash_49e8a607ea22e650", #"hash_550872d1d1938f94");
    wz_ai_zonemgr::function_462b41e2(#"nuketownbunker", level.var_85d43ea3, #"hash_688b1b12624fa9a3", #"hash_e14eae568dbe7c6");
    wz_ai_zonemgr::function_462b41e2(#"buried", level.var_85d43ea3, #"hash_78f8f730158519ff", #"hash_4ee6deffa30cc6e2", #"hash_7d028af90dad72ae");
    function_b0b1cbb8(level.var_85d43ea3);
}

// Namespace wz_open_skyscrapers_ai_zones/wz_open_skyscrapers_ai_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x5a8d479a, Offset: 0x3450
// Size: 0x99c
function function_e938f117() {
    var_ce0426e0 = (function_6e9af98a(10, 20), function_bb7cbe85(5, 6), function_5f1710a5(2, 3));
    var_6ba5e275 = (function_6e9af98a(6, 12), function_bb7cbe85(3, 5), function_5f1710a5(1, 2));
    var_b0befc80 = getdvar(#"hash_15fba4abe8704cb8", 0);
    if (isdefined(var_b0befc80) && var_b0befc80) {
        var_ce0426e0 = getdvarvector(#"hash_cbccd885e75d219", (10, 5, 2));
        var_6ba5e275 = getdvarvector(#"hash_cbccd885e75d219", (6, 3, 1));
    }
    var_ecf3ab7f = var_ce0426e0[0];
    var_8a0a1dec = var_ce0426e0[1];
    var_5b2d986e = var_ce0426e0[2];
    wz_ai_zonemgr::function_5f0d105a(0, #"asylum", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_5f0d105a(0, #"nuketowncrater", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e + 3);
    wz_ai_zonemgr::function_6c75dee3(#"nuketowncrater", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_5f0d105a(0, #"nuketownbunker", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_5f0d105a(0, #"buried", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(#"buried", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_2826217a(#"buried", level.var_85d43ea3, 2);
    var_b2ab573e = function_14cf2357();
    wz_ai_zonemgr::function_5f0d105a(0, var_b2ab573e, level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(var_b2ab573e, level.var_85d43ea3, 1);
    var_ecf3ab7f = var_6ba5e275[0];
    var_8a0a1dec = var_6ba5e275[1];
    var_5b2d986e = var_6ba5e275[2];
    wz_ai_zonemgr::function_5f0d105a(1, #"diner", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_5f0d105a(1, #"boxinggym", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    wz_ai_zonemgr::function_6c75dee3(#"boxinggym", level.var_85d43ea3, 1);
    wz_ai_zonemgr::function_5f0d105a(1, #"cemetary", level.var_85d43ea3, var_ecf3ab7f, var_8a0a1dec, var_5b2d986e);
    if (isdefined(level.warzoneadddogs) && level.warzoneadddogs) {
        wz_ai_zonemgr::function_a2ac506b(#"asylum", level.var_85d43ea3, #"spawner_boct_zombie_dog_wz");
        wz_ai_zonemgr::function_a2ac506b(#"nuketowncrater", level.var_85d43ea3, #"spawner_boct_zombie_dog_wz");
        wz_ai_zonemgr::function_a2ac506b(#"nuketownbunker", level.var_85d43ea3, #"spawner_boct_zombie_dog_wz");
        wz_ai_zonemgr::function_a2ac506b(#"buried", level.var_85d43ea3, #"spawner_boct_zombie_dog_wz");
        wz_ai_zonemgr::function_a2ac506b(var_b2ab573e, level.var_85d43ea3, #"spawner_boct_zombie_dog_wz");
        wz_ai_zonemgr::function_a2ac506b(#"diner", level.var_85d43ea3, #"spawner_boct_zombie_dog_wz");
        wz_ai_zonemgr::function_a2ac506b(#"boxinggym", level.var_85d43ea3, #"spawner_boct_zombie_dog_wz");
        wz_ai_zonemgr::function_a2ac506b(#"cemetary", level.var_85d43ea3, #"spawner_boct_zombie_dog_wz");
    }
    wz_ai_zonemgr::function_5f0d105a(2, #"lighthouse", #"spawner_boct_brutus_wz", 1, 1, 0);
    wz_ai_zonemgr::function_c3bb62c1(#"lighthouse", #"spawner_boct_brutus_wz", 2);
    wz_ai_zonemgr::function_d6258153(#"lighthouse", #"spawner_boct_brutus_wz", 1);
    wz_ai_zonemgr::function_462b41e2(#"asylum", level.var_85d43ea3, #"hospital_stash", #"hash_ca8b234ad1fea38");
    wz_ai_zonemgr::function_462b41e2(#"diner", level.var_85d43ea3, #"hash_678a1efded2b597a", #"hash_33f7121f70c3065f", #"hash_779cba7072600ad1");
    wz_ai_zonemgr::function_462b41e2(#"boxinggym", level.var_85d43ea3, #"hash_1b83b702bbaae298", #"hash_6a0d13acf3e5687d", #"hash_47a63bc4a605b45f");
    wz_ai_zonemgr::function_462b41e2(#"cemetary", level.var_85d43ea3, #"zombie_stash_graveyard", #"zombie_stash_graveyard_quest", #"zombie_stash_graveyard_ee");
    wz_ai_zonemgr::function_462b41e2(#"nuketowncrater", level.var_85d43ea3, #"hash_468067e2be6e3cfd", #"hash_49e8a607ea22e650", #"hash_550872d1d1938f94");
    wz_ai_zonemgr::function_462b41e2(#"nuketownbunker", level.var_85d43ea3, #"hash_688b1b12624fa9a3", #"hash_e14eae568dbe7c6");
    wz_ai_zonemgr::function_462b41e2(#"buried", level.var_85d43ea3, #"hash_78f8f730158519ff", #"hash_4ee6deffa30cc6e2", #"hash_7d028af90dad72ae");
    function_b0b1cbb8(level.var_85d43ea3);
    wz_ai_zonemgr::function_462b41e2(#"lighthouse", #"spawner_boct_brutus_wz", #"hash_2141ecb8d2d86b22", #"hash_2b546c0315159617", #"hash_75cc919e81dc8b19");
}


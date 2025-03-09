#using scripts\abilities\ability_util;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\challenges_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\contracts_shared;
#using scripts\core_common\damage;
#using scripts\core_common\damagefeedback_shared;
#using scripts\core_common\dialog_shared;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\hostmigration_shared;
#using scripts\core_common\hud_shared;
#using scripts\core_common\influencers_shared;
#using scripts\core_common\loadout_shared;
#using scripts\core_common\placeables;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\struct;
#using scripts\core_common\throttle_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\weapons_shared;
#using scripts\killstreaks\airsupport;
#using scripts\killstreaks\killstreak_bundles;
#using scripts\killstreaks\killstreak_hacking;
#using scripts\killstreaks\killstreakrules_shared;
#using scripts\killstreaks\killstreaks_util;
#using scripts\weapons\deployable;
#using scripts\weapons\tacticalinsertion;
#using scripts\weapons\weaponobjects;

#namespace killstreaks;

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x1fbd8b0e, Offset: 0x660
// Size: 0x22c
function init_shared() {
    level.killstreaks = [];
    level.killstreakweapons = [];
    level.var_8997324c = [];
    level.droplocations = [];
    level.zoffsetcounter = 0;
    level.var_46c23c0f = 0;
    clientfield::register("clientuimodel", "locSel.commandMode", 1, 1, "int");
    clientfield::register("clientuimodel", "locSel.snapTo", 1, 1, "int");
    clientfield::register("vehicle", "timeout_beep", 1, 2, "int");
    clientfield::register("toplayer", "thermal_glow", 1, 1, "int");
    clientfield::register("toplayer", "thermal_glow_enemies_only", 12000, 1, "int");
    level.play_killstreak_firewall_being_hacked_dialog = undefined;
    level.play_killstreak_firewall_hacked_dialog = undefined;
    level.play_killstreak_being_hacked_dialog = undefined;
    level.play_killstreak_hacked_dialog = undefined;
    level.play_pilot_dialog_on_owner = undefined;
    level.play_pilot_dialog = undefined;
    level.play_taacom_dialog_response_on_owner = undefined;
    level.play_taacom_dialog = undefined;
    level.var_514f9d20 = undefined;
    level.var_9f8e080d = undefined;
    level.var_19a15e42 = undefined;
    level.var_239dc073 = getweapon(#"killstreak_remote");
    if (!isdefined(level.var_6cfbe5a)) {
        level.var_6cfbe5a = new throttle();
        [[ level.var_6cfbe5a ]]->initialize(1, 0.1);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x4aef68a2, Offset: 0x898
// Size: 0xd6
function function_447e6858() {
    level.numkillstreakreservedobjectives = 0;
    level.killstreakcounter = 0;
    if (!isdefined(level.roundstartkillstreakdelay)) {
        level.roundstartkillstreakdelay = 0;
    }
    level.iskillstreakweapon = &is_killstreak_weapon;
    level.killstreakcorebundle = struct::get_script_bundle("killstreak", "killstreak_core");
    callback::on_spawned(&on_player_spawned);
    callback::on_joined_team(&on_joined_team);
    level.var_d80e834 = &function_da600615;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x10698ee5, Offset: 0x978
// Size: 0xe0
function function_da600615(bot) {
    weapons = bot getweaponslist();
    foreach (weapon in weapons) {
        if (is_killstreak_weapon(weapon)) {
            killstreak = get_killstreak_for_weapon(weapon);
            bot thread usekillstreak(killstreak, 0);
        }
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0xc8866853, Offset: 0xa60
// Size: 0x3c
function function_b5b6ef3e(func, obj) {
    callback::add_callback(#"hash_45f35669076bc317", func, obj);
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0xc287955a, Offset: 0xaa8
// Size: 0x18e
function register_ui(killstreak_type, killstreak_menu) {
    assert(isdefined(level.killstreaks[killstreak_type]), "<dev string:x38>");
    item_index = getitemindexfromref(killstreak_menu);
    killstreak_info = getunlockableiteminfofromindex(item_index, 0);
    killstreak_cost = 0;
    if (isdefined(killstreak_info)) {
        killstreak_cost = killstreak_info.momentum;
    }
    level.killstreaks[killstreak_type].itemindex = item_index;
    level.killstreaks[killstreak_type].momentumcost = killstreak_cost;
    level.killstreaks[killstreak_type].menuname = killstreak_menu;
    level.killstreaks[killstreak_type].uiname = "";
    /#
        if (isdefined(killstreak_info)) {
            level.killstreaks[killstreak_type].uiname = killstreak_info.displayname;
        }
        if (level.killstreaks[killstreak_type].uiname == "<dev string:x74>") {
            level.killstreaks[killstreak_type].uiname = killstreak_menu;
        }
    #/
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x448731d8, Offset: 0xc40
// Size: 0x13a
function killstreak_init(killstreak_type) {
    assert(isdefined(killstreak_type), "<dev string:x77>");
    assert(!isdefined(level.killstreaks[killstreak_type]), "<dev string:xb2>" + killstreak_type + "<dev string:xc0>");
    level.killstreaks[killstreak_type] = spawnstruct();
    level.killstreaks[killstreak_type].killstreaklevel = 0;
    level.killstreaks[killstreak_type].quantity = 0;
    level.killstreaks[killstreak_type].allowassists = 0;
    level.killstreaks[killstreak_type].overrideentitycameraindemo = 0;
    level.killstreaks[killstreak_type].teamkillpenaltyscale = 1;
    level.killstreaks[killstreak_type].var_b6c17aab = 0;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x2fe1ab23, Offset: 0xd88
// Size: 0xea
function register_weapon(killstreak_type, weapon) {
    if (weapon.name == #"none") {
        return;
    }
    assert(isdefined(killstreak_type), "<dev string:x77>");
    assert(weapon.name != #"none");
    assert(!isdefined(level.killstreakweapons[weapon]), "<dev string:xd6>");
    level.killstreaks[killstreak_type].weapon = weapon;
    level.killstreakweapons[weapon] = killstreak_type;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x55ebc4c8, Offset: 0xe80
// Size: 0x9a
function register_vehicle(killstreak_type, vehicle) {
    assert(isdefined(killstreak_type), "<dev string:x77>");
    assert(!isdefined(level.var_8997324c[vehicle]), "<dev string:xd6>");
    level.killstreaks[killstreak_type].vehicle = vehicle;
    level.var_8997324c[vehicle] = killstreak_type;
}

// Namespace killstreaks/killstreaks_shared
// Params 10, eflags: 0x0
// Checksum 0xd9388809, Offset: 0xf28
// Size: 0x284
function register(killstreaktype, killstreakweaponname, killstreakmenuname, killstreakusagekey, killstreakusefunction, killstreakdelaystreak, weaponholdallowed = 0, killstreakstatsname = undefined, registerdvars = 1, registerinventory = 1) {
    assert(isdefined(killstreakusefunction), "<dev string:x114>" + killstreaktype);
    killstreak_init(killstreaktype);
    register_ui(killstreaktype, killstreakmenuname);
    level.killstreaks[killstreaktype].usagekey = killstreakusagekey;
    level.killstreaks[killstreaktype].usefunction = killstreakusefunction;
    level.killstreaks[killstreaktype].delaystreak = killstreakdelaystreak;
    if (isdefined(killstreakweaponname)) {
        killstreakweapon = getweapon(killstreakweaponname);
        register_weapon(killstreaktype, killstreakweapon);
    }
    if (isdefined(killstreakstatsname)) {
        level.killstreaks[killstreaktype].killstreakstatsname = killstreakstatsname;
    }
    level.killstreaks[killstreaktype].weaponholdallowed = weaponholdallowed;
    if (isdefined(registerinventory) && registerinventory) {
        level.menureferenceforkillstreak[killstreakmenuname] = killstreaktype;
        bundlename = function_656f23d5(killstreaktype);
        killstreak_bundles::register_killstreak_bundle(bundlename);
        var_28f0acc5 = undefined;
        if (isdefined(killstreakweaponname)) {
            var_28f0acc5 = "inventory_" + killstreakweaponname;
        }
        register("inventory_" + killstreaktype, var_28f0acc5, killstreakmenuname, killstreakusagekey, killstreakusefunction, killstreakdelaystreak, weaponholdallowed, killstreakstatsname, 0, 0);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x4
// Checksum 0x18b7eeb4, Offset: 0x11b8
// Size: 0x46
function private function_656f23d5(killstreaktype) {
    if (killstreaktype === "drone_squadron") {
        if (sessionmodeiscampaigngame()) {
            return ("drone_squadron" + "_cp");
        }
    }
    return killstreaktype;
}

// Namespace killstreaks/killstreaks_shared
// Params 6, eflags: 0x4
// Checksum 0x9e86985d, Offset: 0x1208
// Size: 0x624
function private function_e48aca4d(type, bundle, weapon, vehicle, killstreak_use_function, isinventoryweapon) {
    killstreak_init(type);
    menukey = bundle.var_a99ef6da;
    if (!isdefined(menukey)) {
        menukey = type;
    } else if (isdefined(isinventoryweapon) && isinventoryweapon) {
        menukey = "inventory_" + menukey;
    }
    register_ui(type, menukey);
    level.killstreaks[type].usagekey = type;
    level.killstreaks[type].delaystreak = bundle.var_daf6b7af;
    level.killstreaks[type].usefunction = killstreak_use_function;
    level.killstreaks[type].weaponholdallowed = 0;
    register_weapon(type, weapon);
    level.menureferenceforkillstreak[menukey] = type;
    if (isdefined(bundle.altweapons)) {
        foreach (alt_weapon in bundle.altweapons) {
            function_181f96a6(type, alt_weapon.ksaltweapon);
        }
    }
    if (isdefined(vehicle)) {
        register_vehicle(type, vehicle);
    }
    function_7e46eaea(type, bundle.var_b45be9e6, bundle.var_502a0e23, bundle.var_667c638e, bundle.var_a56710c6, bundle.var_bc2f6af9, bundle.var_6417048f, isdefined(bundle.var_65d707d0) ? bundle.var_65d707d0 : 0, isdefined(bundle.var_a9b0c301) ? bundle.var_a9b0c301 : 0);
    level.killstreaks[type].var_4a5906fd = bundle.var_3211a185;
    if (isdefined(level.cratetypes)) {
        if (isdefined(isinventoryweapon) && isinventoryweapon) {
            if (isdefined(level.cratetypes[#"inventory_supplydrop"]) && isdefined(level.cratetypes[#"inventory_supplydrop"][type])) {
                level.cratetypes[#"inventory_supplydrop"][type].hint = bundle.var_1d2a2ca4;
                level.cratetypes[#"inventory_supplydrop"][type].hint_gambler = bundle.var_8c4d7906;
            }
        } else {
            if (isdefined(level.cratetypes[#"supplydrop"]) && isdefined(level.cratetypes[#"supplydrop"][type])) {
                level.cratetypes[#"supplydrop"][type].hint = bundle.var_1d2a2ca4;
                level.cratetypes[#"supplydrop"][type].hint_gambler = bundle.var_8c4d7906;
                game.strings[type + "_hint"] = bundle.var_1d2a2ca4;
            }
            if (isdefined(level.cratetypes[#"gambler"]) && isdefined(level.cratetypes[#"gambler"][type])) {
                level.cratetypes[#"gambler"][type].hint = bundle.var_1d2a2ca4;
                level.cratetypes[#"gambler"][type].hint_gambler = bundle.var_8c4d7906;
            }
        }
    }
    function_1110a5de(type, bundle.var_5fbfc70d, bundle.var_e7b30a9a, bundle.var_b7bd2ff9, bundle.var_f6042a3, bundle.var_2451b1f2, bundle.var_7742570a, bundle.var_335def6c, bundle.var_7a502c34, bundle.var_e773a429, bundle.var_799a81a7, bundle.var_f5871fe4, bundle.var_bd7786a4);
    level.killstreaks[type].script_bundle = bundle;
    killstreak_bundles::register_bundle(type, bundle);
    if (isdefined(bundle.var_1bc9830d) && bundle.var_1bc9830d && !(isdefined(isinventoryweapon) && isinventoryweapon)) {
        register_dev_dvars(type);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x8cd61ebb, Offset: 0x1838
// Size: 0xcc
function register_bundle(bundle, killstreak_use_function) {
    function_e48aca4d(bundle.kstype, bundle, bundle.ksweapon, bundle.ksvehicle, killstreak_use_function, 0);
    if (isdefined(bundle.ksinventoryweapon) && bundle.ksinventoryweapon.name != #"none") {
        function_e48aca4d("inventory_" + bundle.kstype, bundle, bundle.ksinventoryweapon, undefined, killstreak_use_function, 1);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0xb7b90e2c, Offset: 0x1910
// Size: 0x4c
function register_killstreak(bundlename, use_function) {
    bundle = struct::get_script_bundle("killstreak", bundlename);
    register_bundle(bundle, use_function);
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xa2867bf1, Offset: 0x1968
// Size: 0x1e
function is_registered(killstreaktype) {
    return isdefined(level.killstreaks[killstreaktype]);
}

// Namespace killstreaks/killstreaks_shared
// Params 9, eflags: 0x0
// Checksum 0xf84173dd, Offset: 0x1990
// Size: 0x17e
function function_7e46eaea(killstreaktype, receivedtext, notusabletext, inboundtext, inboundnearplayertext, var_43279ec9, hackedtext, utilizesairspace, var_a4a7d3e7) {
    assert(isdefined(killstreaktype), "<dev string:x13e>");
    assert(isdefined(level.killstreaks[killstreaktype]), "<dev string:x174>");
    level.killstreaks[killstreaktype].receivedtext = receivedtext;
    level.killstreaks[killstreaktype].notavailabletext = notusabletext;
    level.killstreaks[killstreaktype].inboundtext = inboundtext;
    level.killstreaks[killstreaktype].var_43279ec9 = var_43279ec9;
    level.killstreaks[killstreaktype].inboundnearplayertext = inboundnearplayertext;
    level.killstreaks[killstreaktype].hackedtext = hackedtext;
    level.killstreaks[killstreaktype].utilizesairspace = utilizesairspace;
    level.killstreaks[killstreaktype].var_a4a7d3e7 = var_a4a7d3e7;
}

// Namespace killstreaks/killstreaks_shared
// Params 13, eflags: 0x0
// Checksum 0x5656707b, Offset: 0x1b18
// Size: 0x346
function function_1110a5de(killstreaktype, informdialog, taacomdialogbundlekey, pilotdialogarraykey, startdialogkey, enemystartdialogkey, enemystartmultipledialogkey, hackeddialogkey, hackedstartdialogkey, requestdialogkey, threatdialogkey, var_3b69c05b, var_2729ed45) {
    assert(isdefined(killstreaktype), "<dev string:x77>");
    assert(isdefined(level.killstreaks[killstreaktype]), "<dev string:x1b9>");
    level.killstreaks[killstreaktype].informdialog = informdialog;
    level.killstreaks[killstreaktype].taacomdialogbundlekey = taacomdialogbundlekey;
    level.killstreaks[killstreaktype].startdialogkey = startdialogkey;
    level.killstreaks[killstreaktype].enemystartdialogkey = enemystartdialogkey;
    level.killstreaks[killstreaktype].enemystartmultipledialogkey = enemystartmultipledialogkey;
    level.killstreaks[killstreaktype].hackeddialogkey = hackeddialogkey;
    level.killstreaks[killstreaktype].hackedstartdialogkey = hackedstartdialogkey;
    level.killstreaks[killstreaktype].var_2729ed45 = var_2729ed45;
    level.killstreaks[killstreaktype].requestdialogkey = requestdialogkey;
    level.killstreaks[killstreaktype].var_3b69c05b = var_3b69c05b;
    level.killstreaks[killstreaktype].threatdialogkey = threatdialogkey;
    if (isdefined(pilotdialogarraykey)) {
        taacombundles = struct::get_script_bundles("mpdialog_taacom");
        foreach (bundle in taacombundles) {
            if (!isdefined(bundle.pilotbundles)) {
                bundle.pilotbundles = [];
            }
            bundle.pilotbundles[killstreaktype] = [];
            i = 0;
            field = pilotdialogarraykey + i;
            for (fieldvalue = bundle.(field); isdefined(fieldvalue); fieldvalue = bundle.(field)) {
                bundle.pilotbundles[killstreaktype][i] = fieldvalue;
                i++;
                field = pilotdialogarraykey + i;
            }
        }
        level.tacombundles = taacombundles;
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x69acdaf7, Offset: 0x1e68
// Size: 0x13a
function function_181f96a6(killstreaktype, weapon) {
    assert(isdefined(killstreaktype), "<dev string:x77>");
    assert(isdefined(level.killstreaks[killstreaktype]), "<dev string:x1fd>");
    if (weapon.name == #"none") {
        return;
    }
    if (level.killstreaks[killstreaktype].weapon === weapon) {
        return;
    }
    if (!isdefined(level.killstreaks[killstreaktype].altweapons)) {
        level.killstreaks[killstreaktype].altweapons = [];
    }
    if (!isdefined(level.killstreakweapons[weapon])) {
        level.killstreakweapons[weapon] = killstreaktype;
    }
    level.killstreaks[killstreaktype].altweapons[level.killstreaks[killstreaktype].altweapons.size] = weapon;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x236db43c, Offset: 0x1fb0
// Size: 0x4c
function register_alt_weapon(killstreaktype, weapon) {
    function_181f96a6(killstreaktype, weapon);
    function_181f96a6("inventory_" + killstreaktype, weapon);
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0xd7e73783, Offset: 0x2008
// Size: 0x2c
function function_e37b061(killstreaktype, weapon) {
    function_181f96a6(killstreaktype, weapon);
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0xb96b3c92, Offset: 0x2040
// Size: 0x4a
function function_b013c2d3(killstreaktype, weapon) {
    if (!isdefined(level.var_3ff1b984)) {
        level.var_3ff1b984 = [];
    }
    level.var_3ff1b984[weapon] = killstreaktype;
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x6f845769, Offset: 0x2098
// Size: 0x146
function register_remote_override_weapon(killstreaktype, weaponname, isinventory) {
    assert(isdefined(killstreaktype), "<dev string:x77>");
    assert(isdefined(level.killstreaks[killstreaktype]), "<dev string:x245>");
    weapon = getweapon(weaponname);
    if (level.killstreaks[killstreaktype].weapon === weapon) {
        return;
    }
    if (!isdefined(level.killstreaks[killstreaktype].remoteoverrideweapons)) {
        level.killstreaks[killstreaktype].remoteoverrideweapons = [];
    }
    if (!isdefined(level.killstreakweapons[weapon])) {
        level.killstreakweapons[weapon] = killstreaktype;
    }
    level.killstreaks[killstreaktype].remoteoverrideweapons[level.killstreaks[killstreaktype].remoteoverrideweapons.size] = weapon;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0xfd3ee148, Offset: 0x21e8
// Size: 0x94
function is_remote_override_weapon(killstreaktype, weapon) {
    if (isdefined(level.killstreaks[killstreaktype].remoteoverrideweapons)) {
        for (i = 0; i < level.killstreaks[killstreaktype].remoteoverrideweapons.size; i++) {
            if (level.killstreaks[killstreaktype].remoteoverrideweapons[i] == weapon) {
                return true;
            }
        }
    }
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xe3eed71, Offset: 0x2288
// Size: 0x134
function register_dev_dvars(killstreaktype) {
    /#
        assert(isdefined(killstreaktype), "<dev string:x77>");
        assert(isdefined(level.killstreaks[killstreaktype]), "<dev string:x299>");
        level.killstreaks[killstreaktype].devdvar = "<dev string:x2df>" + killstreaktype + "<dev string:x2e6>";
        level.killstreaks[killstreaktype].devenemydvar = "<dev string:x2df>" + killstreaktype + "<dev string:x2ee>";
        level.killstreaks[killstreaktype].devtimeoutdvar = "<dev string:x2df>" + killstreaktype + "<dev string:x2fb>";
        setdvar(level.killstreaks[killstreaktype].devtimeoutdvar, 0);
        level thread register_devgui(killstreaktype);
    #/
}

/#

    // Namespace killstreaks/killstreaks_shared
    // Params 1, eflags: 0x0
    // Checksum 0xfaa7106f, Offset: 0x23c8
    // Size: 0xbc
    function register_dev_debug_dvar(killstreaktype) {
        assert(isdefined(killstreaktype), "<dev string:x77>");
        assert(isdefined(level.killstreaks[killstreaktype]), "<dev string:x299>");
        level.killstreaks[killstreaktype].devdebugdvar = "<dev string:x2df>" + killstreaktype + "<dev string:x308>";
        devgui_scorestreak_command_debugdvar(killstreaktype, level.killstreaks[killstreaktype].devdebugdvar);
    }

    // Namespace killstreaks/killstreaks_shared
    // Params 1, eflags: 0x0
    // Checksum 0xcd94a804, Offset: 0x2490
    // Size: 0x138
    function register_devgui(killstreaktype) {
        level endon(#"game_ended");
        wait randomintrange(2, 20) * float(function_60d95f53()) / 1000;
        give_type_all = "<dev string:x311>";
        give_type_enemy = "<dev string:x318>";
        if (isdefined(level.killstreaks[killstreaktype].devdvar)) {
            devgui_scorestreak_command_givedvar(killstreaktype, give_type_all, level.killstreaks[killstreaktype].devdvar);
        }
        if (isdefined(level.killstreaks[killstreaktype].devenemydvar)) {
            devgui_scorestreak_command_givedvar(killstreaktype, give_type_enemy, level.killstreaks[killstreaktype].devenemydvar);
        }
        if (isdefined(level.killstreaks[killstreaktype].devtimeoutdvar)) {
        }
    }

    // Namespace killstreaks/killstreaks_shared
    // Params 3, eflags: 0x0
    // Checksum 0xd0873308, Offset: 0x25d0
    // Size: 0x54
    function devgui_scorestreak_command_givedvar(killstreaktype, give_type, dvar) {
        devgui_scorestreak_command(killstreaktype, give_type, "<dev string:x325>" + dvar + "<dev string:x32c>");
    }

    // Namespace killstreaks/killstreaks_shared
    // Params 2, eflags: 0x0
    // Checksum 0x3b975041, Offset: 0x2630
    // Size: 0x34
    function devgui_scorestreak_command_timeoutdvar(killstreaktype, dvar) {
        devgui_scorestreak_dvar_toggle(killstreaktype, "<dev string:x331>", dvar);
    }

    // Namespace killstreaks/killstreaks_shared
    // Params 2, eflags: 0x0
    // Checksum 0xd5b5a8e8, Offset: 0x2670
    // Size: 0x34
    function devgui_scorestreak_command_debugdvar(killstreaktype, dvar) {
        devgui_scorestreak_dvar_toggle(killstreaktype, "<dev string:x33c>", dvar);
    }

#/

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0xd8515d7c, Offset: 0x26b0
// Size: 0x6c
function devgui_scorestreak_dvar_toggle(killstreaktype, title, dvar) {
    setdvar(dvar, 0);
    devgui_scorestreak_command(killstreaktype, "Toggle " + title, "toggle " + dvar + " 1 0");
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x225196e3, Offset: 0x2728
// Size: 0xfc
function devgui_scorestreak_command(killstreaktype, title, command) {
    /#
        assert(isdefined(killstreaktype), "<dev string:x77>");
        assert(isdefined(level.killstreaks[killstreaktype]), "<dev string:x299>");
        root = "<dev string:x344>";
        user_name = level.killstreaks[killstreaktype].menuname;
        util::add_queued_debug_command(root + user_name + "<dev string:x363>" + killstreaktype + "<dev string:x368>" + title + "<dev string:x36d>" + command + "<dev string:x373>");
    #/
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xb9d33805, Offset: 0x2830
// Size: 0x9e
function should_draw_debug(killstreak) {
    /#
        assert(isdefined(killstreak), "<dev string:x77>");
        function_2459bd2f();
        if (isdefined(level.killstreaks[killstreak]) && isdefined(level.killstreaks[killstreak].devdebugdvar)) {
            return getdvarint(level.killstreaks[killstreak].devdebugdvar, 0);
        }
    #/
    return 0;
}

/#

    // Namespace killstreaks/killstreaks_shared
    // Params 0, eflags: 0x0
    // Checksum 0x89aba113, Offset: 0x28d8
    // Size: 0x34
    function function_2459bd2f() {
        assert(isdefined(level.killstreaks), "<dev string:x379>");
    }

#/

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x25a5f372, Offset: 0x2918
// Size: 0x30
function is_available(killstreak) {
    if (isdefined(level.menureferenceforkillstreak[killstreak])) {
        return 1;
    }
    return 0;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x104c1963, Offset: 0x2950
// Size: 0x1c
function get_by_menu_name(killstreak) {
    return level.menureferenceforkillstreak[killstreak];
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xb5b3bb8, Offset: 0x2978
// Size: 0x4a
function get_menu_name(killstreaktype) {
    assert(isdefined(level.killstreaks[killstreaktype]));
    return level.killstreaks[killstreaktype].menuname;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x2883c6bc, Offset: 0x29d0
// Size: 0x122
function get_level(index, killstreak) {
    killstreaklevel = level.killstreaks[get_by_menu_name(killstreak)].killstreaklevel;
    if (getdvarint(#"custom_killstreak_mode", 0) == 2) {
        if (isdefined(self.killstreak[index]) && killstreak == self.killstreak[index]) {
            killsrequired = getdvarint("custom_killstreak_" + index + 1 + "_kills", 0);
            if (killsrequired) {
                killstreaklevel = getdvarint("custom_killstreak_" + index + 1 + "_kills", 0);
            }
        }
    }
    return killstreaklevel;
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x3a74463f, Offset: 0x2b00
// Size: 0x25e
function give_if_streak_count_matches(index, killstreak, streakcount) {
    pixbeginevent(#"givekillstreakifstreakcountmatches");
    /#
        if (!isdefined(killstreak)) {
            println("<dev string:x3e8>");
        }
        if (isdefined(killstreak)) {
            println("<dev string:x401>" + killstreak + "<dev string:x419>");
        }
        if (!is_available(killstreak)) {
            println("<dev string:x41d>");
        }
    #/
    if (self.pers[#"killstreaksearnedthiskillstreak"] > index && util::isroundbased()) {
        hasalreadyearnedkillstreak = 1;
    } else {
        hasalreadyearnedkillstreak = 0;
    }
    if (isdefined(killstreak) && is_available(killstreak) && !hasalreadyearnedkillstreak) {
        killstreaklevel = get_level(index, killstreak);
        if (self hasperk(#"specialty_killstreak")) {
            reduction = getdvarint(#"perk_killstreakreduction", 0);
            killstreaklevel -= reduction;
            if (killstreaklevel <= 0) {
                killstreaklevel = 1;
            }
        }
        if (killstreaklevel == streakcount) {
            self give(get_by_menu_name(killstreak), streakcount);
            self.pers[#"killstreaksearnedthiskillstreak"] = index + 1;
            pixendevent();
            return true;
        }
    }
    pixendevent();
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x606eb200, Offset: 0x2d68
// Size: 0xca
function give_for_streak() {
    if (!util::is_killstreaks_enabled()) {
        return;
    }
    if (!isdefined(self.pers[#"totalkillstreakcount"])) {
        self.pers[#"totalkillstreakcount"] = 0;
    }
    given = 0;
    for (i = 0; i < self.killstreak.size; i++) {
        given |= give_if_streak_count_matches(i, self.killstreak[i], self.pers[#"cur_kill_streak"]);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0xfbfba1b6, Offset: 0x2e40
// Size: 0xa2
function is_an_a_killstreak() {
    onkillstreak = 0;
    if (!isdefined(self.pers[#"kill_streak_before_death"])) {
        self.pers[#"kill_streak_before_death"] = 0;
    }
    streakplusone = self.pers[#"kill_streak_before_death"] + 1;
    if (self.pers[#"kill_streak_before_death"] >= 5) {
        onkillstreak = 1;
    }
    return onkillstreak;
}

// Namespace killstreaks/killstreaks_shared
// Params 5, eflags: 0x0
// Checksum 0x58cc984a, Offset: 0x2ef0
// Size: 0x194
function give(killstreaktype, streak, suppressnotification, noxp, tobottom) {
    pixbeginevent(#"givekillstreak");
    self endon(#"disconnect");
    level endon(#"game_ended");
    had_to_delay = 0;
    killstreakgiven = 0;
    if (isdefined(noxp)) {
        if (self give_internal(killstreaktype, undefined, noxp, tobottom)) {
            killstreakgiven = 1;
            if (self.just_given_new_inventory_killstreak === 1) {
                self add_to_notification_queue(level.killstreaks[killstreaktype].menuname, streak, killstreaktype, noxp, 1);
            }
        }
    } else if (self give_internal(killstreaktype, noxp)) {
        killstreakgiven = 1;
        if (self.just_given_new_inventory_killstreak === 1) {
            self add_to_notification_queue(level.killstreaks[killstreaktype].menuname, streak, killstreaktype, noxp, 1);
        }
    }
    pixendevent();
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x38847068, Offset: 0x3090
// Size: 0xfc
function take(killstreak) {
    self endon(#"disconnect");
    killstreak_weapon = get_killstreak_weapon(killstreak);
    remove_used_killstreak(killstreak);
    if (self getinventoryweapon() == killstreak_weapon) {
        self setinventoryweapon(level.weaponnone);
    }
    waittillframeend();
    currentweapon = self getcurrentweapon();
    if (currentweapon != killstreak_weapon || killstreak_weapon.iscarriedkillstreak) {
        return;
    }
    switch_to_last_non_killstreak_weapon();
    activate_next();
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x9589c7b6, Offset: 0x3198
// Size: 0x174
function remove_oldest() {
    if (isdefined(self.pers[#"killstreaks"][0])) {
        currentweapon = self getcurrentweapon();
        if (currentweapon == get_killstreak_weapon(self.pers[#"killstreaks"][0])) {
            primaries = self getweaponslistprimaries();
            if (primaries.size > 0) {
                self switchtoweapon(primaries[0]);
            }
        }
        self notify(#"oldest_killstreak_removed", {#type:self.pers[#"killstreaks"][0], #id:self.pers[#"killstreak_unique_id"][0]});
        self remove_used_killstreak(self.pers[#"killstreaks"][0], self.pers[#"killstreak_unique_id"][0], 0);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 4, eflags: 0x0
// Checksum 0xbe20b265, Offset: 0x3318
// Size: 0x980
function give_internal(killstreaktype, do_not_update_death_count, noxp, tobottom) {
    self.just_given_new_inventory_killstreak = undefined;
    if (level.gameended) {
        return false;
    }
    if (!util::is_killstreaks_enabled()) {
        return false;
    }
    if (!isdefined(level.killstreaks[killstreaktype])) {
        return false;
    }
    if (!isdefined(self.pers[#"killstreaks"])) {
        self.pers[#"killstreaks"] = [];
    }
    if (!isdefined(self.pers[#"killstreak_has_been_used"])) {
        self.pers[#"killstreak_has_been_used"] = [];
    }
    if (!isdefined(self.pers[#"killstreak_unique_id"])) {
        self.pers[#"killstreak_unique_id"] = [];
    }
    if (!isdefined(self.pers[#"killstreak_ammo_count"])) {
        self.pers[#"killstreak_ammo_count"] = [];
    }
    just_max_stack_removed_inventory_killstreak = undefined;
    if (isdefined(tobottom) && tobottom) {
        size = self.pers[#"killstreaks"].size;
        if (self.pers[#"killstreaks"].size >= level.maxinventoryscorestreaks) {
            self remove_oldest();
            just_max_stack_removed_inventory_killstreak = self.just_removed_used_killstreak;
        }
        for (i = size; i > 0; i--) {
            self.pers[#"killstreaks"][i] = self.pers[#"killstreaks"][i - 1];
            self.pers[#"killstreak_has_been_used"][i] = self.pers[#"killstreak_has_been_used"][i - 1];
            self.pers[#"killstreak_unique_id"][i] = self.pers[#"killstreak_unique_id"][i - 1];
            self.pers[#"killstreak_ammo_count"][i] = self.pers[#"killstreak_ammo_count"][i - 1];
        }
        self.pers[#"killstreaks"][0] = killstreaktype;
        self.pers[#"killstreak_unique_id"][0] = level.killstreakcounter;
        level.killstreakcounter++;
        if (isdefined(noxp)) {
            self.pers[#"killstreak_has_been_used"][0] = noxp;
        } else {
            self.pers[#"killstreak_has_been_used"][0] = 0;
        }
        if (size == 0) {
            weapon = get_killstreak_weapon(killstreaktype);
            ammocount = give_weapon(weapon, 1);
        }
        self.pers[#"killstreak_ammo_count"][0] = 0;
    } else {
        var_7b935486 = 0;
        if (self.pers[#"killstreaks"].size && self.currentweapon === get_killstreak_weapon(self.pers[#"killstreaks"][self.pers[#"killstreaks"].size - 1])) {
            var_7b935486 = 1;
        }
        self.pers[#"killstreaks"][self.pers[#"killstreaks"].size] = killstreaktype;
        self.pers[#"killstreak_unique_id"][self.pers[#"killstreak_unique_id"].size] = level.killstreakcounter;
        level.killstreakcounter++;
        if (self.pers[#"killstreaks"].size > level.maxinventoryscorestreaks) {
            self remove_oldest();
            just_max_stack_removed_inventory_killstreak = self.just_removed_used_killstreak;
        }
        if (!isdefined(noxp)) {
            noxp = 0;
        }
        self.pers[#"killstreak_has_been_used"][self.pers[#"killstreak_has_been_used"].size] = noxp;
        weapon = get_killstreak_weapon(killstreaktype);
        ammocount = give_weapon(weapon, 1);
        self.pers[#"killstreak_ammo_count"][self.pers[#"killstreak_ammo_count"].size] = ammocount;
        if (var_7b935486) {
            var_3522232f = self.pers[#"killstreaks"].size - 2;
            var_a1312679 = self.pers[#"killstreaks"].size - 1;
            var_3197d2aa = self.pers[#"killstreaks"][var_3522232f];
            var_c72e250a = self.pers[#"killstreak_unique_id"][var_3522232f];
            var_948e9ad0 = self.pers[#"killstreak_has_been_used"][var_3522232f];
            var_80931fe9 = self.pers[#"killstreak_ammo_count"][var_3522232f];
            self.pers[#"killstreaks"][var_3522232f] = self.pers[#"killstreaks"][var_a1312679];
            self.pers[#"killstreak_unique_id"][var_3522232f] = self.pers[#"killstreak_unique_id"][var_a1312679];
            self.pers[#"killstreak_has_been_used"][var_3522232f] = self.pers[#"killstreak_has_been_used"][var_a1312679];
            self.pers[#"killstreak_ammo_count"][var_3522232f] = self.pers[#"killstreak_ammo_count"][var_a1312679];
            self.pers[#"killstreaks"][var_a1312679] = var_3197d2aa;
            self.pers[#"killstreak_unique_id"][var_a1312679] = var_c72e250a;
            self.pers[#"killstreak_has_been_used"][var_a1312679] = var_948e9ad0;
            self.pers[#"killstreak_ammo_count"][var_a1312679] = var_80931fe9;
            self setinventoryweapon(get_killstreak_weapon(var_3197d2aa));
        }
    }
    self.just_given_new_inventory_killstreak = killstreaktype !== just_max_stack_removed_inventory_killstreak && !(isdefined(var_7b935486) && var_7b935486);
    if (!isdefined(self.var_58d669ff)) {
        self.var_58d669ff = [];
    }
    if (!isdefined(self.var_58d669ff[killstreaktype])) {
        self.var_58d669ff[killstreaktype] = [];
    }
    array::push(self.var_58d669ff[killstreaktype], gettime(), self.var_58d669ff[killstreaktype].size);
    return true;
}

// Namespace killstreaks/killstreaks_shared
// Params 5, eflags: 0x0
// Checksum 0x4372c9c5, Offset: 0x3ca0
// Size: 0x11c
function add_to_notification_queue(menuname, streakcount, hardpointtype, nonotify, var_af825242) {
    killstreaktablenumber = level.killstreakindices[menuname];
    if (!isdefined(killstreaktablenumber)) {
        return;
    }
    if (isdefined(nonotify) && nonotify) {
        return;
    }
    informdialog = get_killstreak_inform_dialog(hardpointtype);
    self thread play_killstreak_ready_dialog(hardpointtype, 2.4);
    self thread play_killstreak_ready_sfx(hardpointtype);
    self luinotifyevent(#"killstreak_received", 3, killstreaktablenumber, informdialog, var_af825242);
    self function_b552ffa9(#"killstreak_received", 3, killstreaktablenumber, informdialog, var_af825242);
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x28a4b350, Offset: 0x3dc8
// Size: 0xa2
function has_equipped() {
    currentweapon = self getcurrentweapon();
    keys = getarraykeys(level.killstreaks);
    for (i = 0; i < keys.size; i++) {
        if (level.killstreaks[keys[i]].weapon == currentweapon) {
            return true;
        }
    }
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xa4d5d87d, Offset: 0x3e78
// Size: 0x22
function _get_from_weapon(weapon) {
    return get_killstreak_for_weapon(weapon);
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xc82018c2, Offset: 0x3ea8
// Size: 0x76
function get_from_weapon(weapon) {
    if (weapon == level.weaponnone) {
        return undefined;
    }
    res = _get_from_weapon(weapon);
    if (!isdefined(res)) {
        return _get_from_weapon(weapon.rootweapon);
    }
    return res;
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x6240500e, Offset: 0x3f28
// Size: 0x74a
function give_weapon(weapon, isinventory, usestoredammo) {
    currentweapon = self getcurrentweapon();
    if (currentweapon != level.weaponnone && !(isdefined(level.usingmomentum) && level.usingmomentum)) {
        weaponslist = self getweaponslist();
        for (idx = 0; idx < weaponslist.size; idx++) {
            carriedweapon = weaponslist[idx];
            if (currentweapon == carriedweapon) {
                continue;
            }
            switch (carriedweapon.name) {
            case #"m32":
            case #"minigun":
                continue;
            }
            if (is_killstreak_weapon(carriedweapon)) {
                self takeweapon(carriedweapon);
            }
        }
    }
    if (currentweapon != weapon && self hasweapon(weapon) == 0) {
        self takeweapon(weapon);
        self giveweapon(weapon);
    }
    if (isdefined(level.usingmomentum) && level.usingmomentum) {
        self setinventoryweapon(weapon);
        if (weapon.iscarriedkillstreak) {
            if (!isdefined(self.pers[#"held_killstreak_ammo_count"][weapon])) {
                self.pers[#"held_killstreak_ammo_count"][weapon] = 0;
            }
            if (!isdefined(self.pers[#"held_killstreak_clip_count"][weapon])) {
                self.pers[#"held_killstreak_clip_count"][weapon] = weapon.clipsize;
            }
            if (!isdefined(self.pers[#"killstreak_quantity"][weapon])) {
                self.pers[#"killstreak_quantity"][weapon] = 0;
            }
            if (currentweapon == weapon && !isheldinventorykillstreakweapon(weapon)) {
                return weapon.maxammo;
            } else if (isdefined(usestoredammo) && usestoredammo && self.pers[#"killstreak_ammo_count"][self.pers[#"killstreak_ammo_count"].size - 1] > 0) {
                switch (weapon.name) {
                case #"inventory_minigun":
                    if (isdefined(self.minigunactive) && self.minigunactive) {
                        return self.pers[#"held_killstreak_ammo_count"][weapon];
                    }
                    break;
                case #"inventory_m32":
                    if (isdefined(self.m32active) && self.m32active) {
                        return self.pers[#"held_killstreak_ammo_count"][weapon];
                    }
                    break;
                default:
                    break;
                }
                self.pers[#"held_killstreak_ammo_count"][weapon] = self.pers[#"killstreak_ammo_count"][self.pers[#"killstreak_ammo_count"].size - 1];
                self loadout::function_3ba6ee5d(weapon, self.pers[#"killstreak_ammo_count"][self.pers[#"killstreak_ammo_count"].size - 1]);
            } else {
                self.pers[#"held_killstreak_ammo_count"][weapon] = weapon.maxammo;
                self.pers[#"held_killstreak_clip_count"][weapon] = weapon.clipsize;
                self loadout::function_3ba6ee5d(weapon, self.pers[#"held_killstreak_ammo_count"][weapon]);
            }
            return self.pers[#"held_killstreak_ammo_count"][weapon];
        } else {
            switch (weapon.statname) {
            case #"dart":
            case #"ultimate_turret":
            case #"counteruav":
            case #"combat_robot_marker":
            case #"remote_missile":
            case #"swat_team":
            case #"supplydrop_marker":
            case #"m32_drop":
            case #"drone_squadron":
            case #"overwatch_helicopter":
            case #"straferun":
            case #"recon_car":
            case #"uav":
            case #"ac130":
            case #"helicopter_comlink":
            case #"swat_helicopter":
            case #"ai_tank_marker":
            case #"planemortar":
            case #"minigun_drop":
            case #"missile_drone":
                delta = 1;
                break;
            default:
                delta = 0;
                break;
            }
            return change_killstreak_quantity(weapon, delta);
        }
        return;
    }
    self setactionslot(4, "weapon", weapon);
    return 1;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xcc1a1c27, Offset: 0x4680
// Size: 0x282
function activate_next(do_not_update_death_count) {
    if (level.gameended) {
        return false;
    }
    if (isdefined(level.usingmomentum) && level.usingmomentum) {
        self setinventoryweapon(level.weaponnone);
    } else {
        self setactionslot(4, "");
    }
    if (!isdefined(self.pers[#"killstreaks"]) || self.pers[#"killstreaks"].size == 0) {
        return false;
    }
    killstreaktype = self.pers[#"killstreaks"][self.pers[#"killstreaks"].size - 1];
    if (!isdefined(level.killstreaks[killstreaktype])) {
        return false;
    }
    weapon = level.killstreaks[killstreaktype].weapon;
    waitframe(1);
    if (self isremotecontrolling() && self.usingremote === weapon.statname) {
        while (self isremotecontrolling()) {
            waitframe(1);
        }
    }
    ammocount = give_weapon(weapon, 0, 1);
    if (weapon.iscarriedkillstreak) {
        self setweaponammoclip(weapon, self.pers[#"held_killstreak_clip_count"][weapon]);
        self setweaponammostock(weapon, ammocount - self.pers[#"held_killstreak_clip_count"][weapon]);
    }
    if (!isdefined(do_not_update_death_count) || do_not_update_death_count != 0) {
        self.pers["killstreakItemDeathCount" + killstreaktype] = self.deathcount;
    }
    return true;
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x186674bc, Offset: 0x4910
// Size: 0x20e
function give_owned() {
    if (!isdefined(self.pers[#"killstreaks"])) {
        self.pers[#"killstreaks"] = [];
    }
    if (!isdefined(self.pers[#"killstreak_has_been_used"])) {
        self.pers[#"killstreak_has_been_used"] = [];
    }
    if (!isdefined(self.pers[#"killstreak_unique_id"])) {
        self.pers[#"killstreak_unique_id"] = [];
    }
    if (!isdefined(self.pers[#"killstreak_ammo_count"])) {
        self.pers[#"killstreak_ammo_count"] = [];
    }
    if (self.pers[#"killstreaks"].size > 0) {
        self activate_next(0);
    }
    size = self.pers[#"killstreaks"].size;
    if (size > 0) {
        self thread play_killstreak_ready_dialog(self.pers[#"killstreaks"][size - 1]);
    }
    self.lastnonkillstreakweapon = isdefined(self.currentweapon) ? self.currentweapon : level.weaponnone;
    if (self.lastnonkillstreakweapon == level.weaponnone) {
        weapons = self getweaponslistprimaries();
        if (weapons.size > 0) {
            self.lastnonkillstreakweapon = weapons[0];
            return;
        }
        self.lastnonkillstreakweapon = level.weaponbasemelee;
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x8232b0b6, Offset: 0x4b28
// Size: 0x74
function get_killstreak_quantity(killstreakweapon) {
    if (!isdefined(self.pers[#"killstreak_quantity"])) {
        return 0;
    }
    return isdefined(self.pers[#"killstreak_quantity"][killstreakweapon]) ? self.pers[#"killstreak_quantity"][killstreakweapon] : 0;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x2595f3fe, Offset: 0x4ba8
// Size: 0x24a
function change_killstreak_quantity(killstreakweapon, delta) {
    if (delta === 1 && killstreakweapon.statname == "remote_missile") {
        streamermodelhint(killstreakweapon.var_22082a57, 7);
    }
    quantity = get_killstreak_quantity(killstreakweapon);
    previousquantity = quantity;
    quantity += delta;
    if (quantity > level.scorestreaksmaxstacking) {
        quantity = level.scorestreaksmaxstacking;
    }
    if (self hasweapon(killstreakweapon) == 0) {
        self takeweapon(killstreakweapon);
        self giveweapon(killstreakweapon);
        self seteverhadweaponall(1);
    }
    self.pers[#"killstreak_quantity"][killstreakweapon] = quantity;
    self setweaponammoclip(killstreakweapon, quantity);
    self notify("killstreak_quantity_" + killstreakweapon.name);
    killstreaktype = get_killstreak_for_weapon(killstreakweapon);
    if (!isdefined(self.var_58d669ff)) {
        self.var_58d669ff = [];
    }
    if (!isdefined(self.var_58d669ff[killstreaktype])) {
        self.var_58d669ff[killstreaktype] = [];
    }
    for (index = 0; delta - index > 0; index++) {
        array::push(self.var_58d669ff[killstreaktype], function_f8d53445(), self.var_58d669ff[killstreaktype].size);
    }
    return quantity;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xfb30ad69, Offset: 0x4e00
// Size: 0xd0
function function_1f96e8f8(killstreakweapon) {
    quantity = get_killstreak_quantity(killstreakweapon);
    if (quantity > level.scorestreaksmaxstacking) {
        quantity = level.scorestreaksmaxstacking;
    }
    if (self hasweapon(killstreakweapon) == 0) {
        self takeweapon(killstreakweapon);
        self giveweapon(killstreakweapon);
        self seteverhadweaponall(1);
    }
    self setweaponammoclip(killstreakweapon, quantity);
    return quantity;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xe80a8cb3, Offset: 0x4ed8
// Size: 0x82
function has_killstreak_in_class(killstreakmenuname) {
    foreach (equippedkillstreak in self.killstreak) {
        if (equippedkillstreak == killstreakmenuname) {
            return true;
        }
    }
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x508bd6ac, Offset: 0x4f68
// Size: 0xb6
function has_killstreak(killstreak) {
    player = self;
    if (!isdefined(killstreak) || !isdefined(player.pers[#"killstreaks"])) {
        return false;
    }
    for (i = 0; i < self.pers[#"killstreaks"].size; i++) {
        if (player.pers[#"killstreaks"][i] == killstreak) {
            return true;
        }
    }
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x6800a840, Offset: 0x5028
// Size: 0x196
function recordkillstreakbegindirect(killstreak, recordstreakindex) {
    player = self;
    if (!isplayer(player) || !isdefined(recordstreakindex)) {
        return;
    }
    if (!isdefined(self.killstreakevents)) {
        player.killstreakevents = associativearray();
    }
    var_b16cd32d = 0;
    if (isdefined(self.var_58d669ff) && isdefined(self.var_58d669ff[killstreak]) && self.var_58d669ff[killstreak].size > 0) {
        var_b16cd32d = array::pop_front(self.var_58d669ff[killstreak], 0);
    }
    if (isdefined(self.killstreakevents[recordstreakindex])) {
        kills = player.killstreakevents[recordstreakindex];
        eventindex = player recordkillstreakevent(recordstreakindex, var_b16cd32d);
        player killstreakrules::recordkillstreakenddirect(eventindex, recordstreakindex, kills);
        player.killstreakevents[recordstreakindex] = undefined;
        return;
    }
    eventindex = player recordkillstreakevent(recordstreakindex, var_b16cd32d);
    player.killstreakevents[recordstreakindex] = eventindex;
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0xb9844ec0, Offset: 0x51c8
// Size: 0x63c
function remove_when_done(killstreak, haskillstreakbeenused, isfrominventory) {
    self endon(#"disconnect");
    waitresult = self waittill(#"killstreak_done");
    killstreaktype = waitresult.kstype;
    if (waitresult.is_successful) {
        /#
            print("<dev string:x43a>" + get_menu_name(killstreak));
        #/
        killstreak_weapon = get_killstreak_weapon(killstreak);
        recordstreakindex = undefined;
        var_d86010cb = get_killstreak_for_weapon_for_stats(killstreak_weapon);
        if (isdefined(level.killstreaks[var_d86010cb].menuname)) {
            recordstreakindex = level.killstreakindices[level.killstreaks[var_d86010cb].menuname];
            self recordkillstreakbegindirect(killstreak, recordstreakindex);
        }
        if (isdefined(level.usingscorestreaks) && level.usingscorestreaks) {
            var_ad8ae78f = {#gametime:function_f8d53445(), #killstreak:killstreak, #activatedby:getplayerspawnid(self)};
            function_92d1707f(#"hash_1aa07f199266e0c7", var_ad8ae78f);
            if (isdefined(isfrominventory) && isfrominventory) {
                remove_used_killstreak(killstreak);
                if (self getinventoryweapon() == killstreak_weapon) {
                    self setinventoryweapon(level.weaponnone);
                }
            } else {
                self change_killstreak_quantity(killstreak_weapon, -1);
            }
        } else if (isdefined(level.usingmomentum) && level.usingmomentum) {
            if (isdefined(isfrominventory) && isfrominventory && self getinventoryweapon() == killstreak_weapon) {
                remove_used_killstreak(killstreak);
                self setinventoryweapon(level.weaponnone);
            } else if (isdefined(level.var_b0dc03c7)) {
                self [[ level.var_b0dc03c7 ]](killstreaktype);
            }
        } else {
            remove_used_killstreak(killstreak);
        }
        if (!(isdefined(level.usingmomentum) && level.usingmomentum)) {
            self setactionslot(4, "");
        }
        success = 1;
    } else {
        killstreak_weapon = get_killstreak_weapon(killstreak);
        self function_1f96e8f8(killstreak_weapon);
    }
    waittillframeend();
    self unhide_compass();
    killstreak_weapon = get_killstreak_weapon(killstreaktype);
    if (killstreak_weapon.isgestureweapon) {
        if ((!(isdefined(level.usingmomentum) && level.usingmomentum) || isdefined(isfrominventory) && isfrominventory) && waitresult.is_successful) {
            activate_next();
        }
        return;
    }
    currentweapon = self getcurrentweapon();
    if (currentweapon == killstreak_weapon && killstreak_weapon.iscarriedkillstreak) {
        return;
    }
    if (waitresult.is_successful && (!self has_killstreak_in_class(get_menu_name(killstreak)) || isdefined(isfrominventory) && isfrominventory)) {
        switch_to_last_non_killstreak_weapon();
    } else {
        killstreakforcurrentweapon = get_from_weapon(currentweapon);
        if (currentweapon.isgameplayweapon) {
            if (isdefined(self.isplanting) && self.isplanting || isdefined(self.isdefusing) && self.isdefusing) {
                return;
            }
        }
        if (!isdefined(killstreakforcurrentweapon) && isdefined(currentweapon)) {
            return;
        }
        if (waitresult.is_successful || !isdefined(killstreakforcurrentweapon) || killstreakforcurrentweapon == killstreak || killstreakforcurrentweapon == "inventory_" + killstreak) {
            switch_to_last_non_killstreak_weapon();
        }
    }
    if ((!(isdefined(level.usingmomentum) && level.usingmomentum) || isdefined(isfrominventory) && isfrominventory) && waitresult.is_successful) {
        activate_next();
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0xfca1a76e, Offset: 0x5810
// Size: 0xa4
function usekillstreak(killstreak, isfrominventory) {
    haskillstreakbeenused = get_if_top_killstreak_has_been_used();
    if (isdefined(self.selectinglocation)) {
        return;
    }
    if (isdefined(self.drone)) {
        [[ level.killstreaks[killstreak].usefunction ]](killstreak);
        return;
    }
    self thread remove_when_done(killstreak, haskillstreakbeenused, isfrominventory);
    self thread trigger_killstreak(killstreak, isfrominventory);
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0xb93886bd, Offset: 0x58c0
// Size: 0x66
function function_2ea0382e() {
    self.pers[#"killstreaks"] = [];
    self.pers[#"killstreak_has_been_used"] = [];
    self.pers[#"killstreak_unique_id"] = [];
    self.pers[#"killstreak_ammo_count"] = [];
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x79ea9e99, Offset: 0x5930
// Size: 0x372
function remove_used_killstreak(killstreak, killstreakid, take_weapon_after_use = 1) {
    self.just_removed_used_killstreak = undefined;
    if (!isdefined(self.pers[#"killstreaks"])) {
        return;
    }
    killstreakindex = undefined;
    for (i = self.pers[#"killstreaks"].size - 1; i >= 0; i--) {
        if (self.pers[#"killstreaks"][i] == killstreak) {
            if (isdefined(killstreakid) && self.pers[#"killstreak_unique_id"][i] != killstreakid) {
                continue;
            }
            killstreakindex = i;
            break;
        }
    }
    if (!isdefined(killstreakindex)) {
        return 0;
    }
    self.just_removed_used_killstreak = killstreak;
    if (take_weapon_after_use && !self has_killstreak_in_class(get_menu_name(killstreak))) {
        self thread take_weapon_after_use(get_killstreak_weapon(killstreak));
    }
    arraysize = self.pers[#"killstreaks"].size;
    for (i = killstreakindex; i < arraysize - 1; i++) {
        self.pers[#"killstreaks"][i] = self.pers[#"killstreaks"][i + 1];
        self.pers[#"killstreak_has_been_used"][i] = self.pers[#"killstreak_has_been_used"][i + 1];
        self.pers[#"killstreak_unique_id"][i] = self.pers[#"killstreak_unique_id"][i + 1];
        self.pers[#"killstreak_ammo_count"][i] = self.pers[#"killstreak_ammo_count"][i + 1];
    }
    self.pers[#"killstreaks"][arraysize - 1] = undefined;
    self.pers[#"killstreak_has_been_used"][arraysize - 1] = undefined;
    self.pers[#"killstreak_unique_id"][arraysize - 1] = undefined;
    self.pers[#"killstreak_ammo_count"][arraysize - 1] = undefined;
    return 1;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x839dff14, Offset: 0x5cb0
// Size: 0xb2
function take_weapon_after_use(killstreakweapon) {
    self endon(#"disconnect", #"death", #"joined_team", #"joined_spectators");
    self waittill(#"weapon_change");
    inventoryweapon = self getinventoryweapon();
    if (inventoryweapon != killstreakweapon) {
        self takeweapon(killstreakweapon);
    }
    self.killstreakactivated = 1;
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0xd00a01b, Offset: 0x5d70
// Size: 0x66
function get_top_killstreak() {
    if (self.pers[#"killstreaks"].size == 0) {
        return undefined;
    }
    return self.pers[#"killstreaks"][self.pers[#"killstreaks"].size - 1];
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0xc935897c, Offset: 0x5de0
// Size: 0x88
function get_if_top_killstreak_has_been_used() {
    if (!(isdefined(level.usingmomentum) && level.usingmomentum)) {
        if (self.pers[#"killstreak_has_been_used"].size == 0) {
            return undefined;
        }
        return self.pers[#"killstreak_has_been_used"][self.pers[#"killstreak_has_been_used"].size - 1];
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x694db466, Offset: 0x5e70
// Size: 0x66
function get_top_killstreak_unique_id() {
    if (self.pers[#"killstreak_unique_id"].size == 0) {
        return undefined;
    }
    return self.pers[#"killstreak_unique_id"][self.pers[#"killstreak_unique_id"].size - 1];
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x6b0826b9, Offset: 0x5ee0
// Size: 0x7a
function get_killstreak_index_by_id(killstreakid) {
    for (index = self.pers[#"killstreak_unique_id"].size - 1; index >= 0; index--) {
        if (self.pers[#"killstreak_unique_id"][index] == killstreakid) {
            return index;
        }
    }
    return undefined;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x60cf6ab0, Offset: 0x5f68
// Size: 0xba
function get_killstreak_momentum_cost(player, killstreak) {
    if (!(isdefined(level.usingmomentum) && level.usingmomentum)) {
        return 0;
    }
    if (!isdefined(killstreak) || !isdefined(player) || !isplayer(player)) {
        return 0;
    }
    assert(isdefined(level.killstreaks[killstreak]));
    return player function_dceb5542(level.killstreaks[killstreak].itemindex);
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x3d3fd004, Offset: 0x6030
// Size: 0x82
function get_killstreak_for_weapon_for_stats(weapon) {
    prefix = "inventory_";
    killstreak = get_killstreak_for_weapon(weapon);
    if (isdefined(killstreak)) {
        if (strstartswith(killstreak, prefix)) {
            killstreak = getsubstr(killstreak, prefix.size);
        }
    }
    return killstreak;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xc1f023ed, Offset: 0x60c0
// Size: 0x7e
function get_killstreak_team_kill_penalty_scale(weapon) {
    killstreak = get_killstreak_for_weapon(weapon);
    if (!isdefined(killstreak)) {
        return 1;
    }
    return isdefined(level.killstreaks[killstreak].teamkillpenaltyscale) ? level.killstreaks[killstreak].teamkillpenaltyscale : 1;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xa7fc90ea, Offset: 0x6148
// Size: 0x96
function wait_till_heavy_weapon_is_fully_on(weapon) {
    self endon(#"death", #"disconnect");
    slot = self gadgetgetslot(weapon);
    while (weapon == self getcurrentweapon()) {
        if (self util::gadget_is_in_use(slot)) {
            self.lastnonkillstreakweapon = weapon;
            return;
        }
        waitframe(1);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xb95cc349, Offset: 0x61e8
// Size: 0x222
function function_4f415d8e(params) {
    if (game.state == "postgame" || !isdefined(self)) {
        return;
    }
    assert(self.lastnonkillstreakweapon != level.weaponnone);
    lastvalidpimary = self.lastnonkillstreakweapon;
    weapon = params.weapon;
    if (weapons::is_primary_weapon(weapon)) {
        lastvalidpimary = weapon;
    }
    if (weapon === self.lastnonkillstreakweapon || weapon === level.weaponnone || weapon === level.weaponbasemelee) {
        return;
    }
    if (weapon.isgameplayweapon) {
        return;
    }
    if (isdefined(self.resurrect_weapon) && weapon == self.resurrect_weapon) {
        return;
    }
    name = get_killstreak_for_weapon(weapon);
    if (isdefined(name) && !weapon.iscarriedkillstreak) {
        killstreak = level.killstreaks[name];
        return;
    }
    if (params.last_weapon.isequipment) {
        if (self.lastnonkillstreakweapon.iscarriedkillstreak) {
            self.lastnonkillstreakweapon = lastvalidpimary;
        }
        return;
    }
    if (ability_util::is_hero_weapon(weapon)) {
        if (weapon.gadget_heroversion_2_0) {
            if (weapon.isgadget && self getammocount(weapon) > 0) {
                self thread wait_till_heavy_weapon_is_fully_on(weapon);
                return;
            }
        }
    }
    self.lastnonkillstreakweapon = weapon;
}

// Namespace killstreaks/killstreaks_shared
// Params 5, eflags: 0x0
// Checksum 0x7584140, Offset: 0x6418
// Size: 0x6c
function function_1e9a761c(timeout, timeoutcallback, endcondition1, endcondition2, endcondition3) {
    waitframe(1);
    placeable = self;
    placeable thread waitfortimeout(placeable.killstreakref, timeout, timeoutcallback, endcondition1, endcondition2);
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xa071e028, Offset: 0x6490
// Size: 0x2cc
function function_4167ea4e(params) {
    weapon = params.weapon;
    if (!is_killstreak_weapon(weapon)) {
        return;
    }
    if (function_f479a2ff(weapon)) {
        return;
    }
    killstreak = get_killstreak_for_weapon(weapon);
    if (isdefined(level.forceusekillstreak) && level.forceusekillstreak) {
        thread usekillstreak(killstreak, undefined);
        return;
    }
    if (!(isdefined(level.usingmomentum) && level.usingmomentum)) {
        killstreak = get_top_killstreak();
        if (weapon != get_killstreak_weapon(killstreak)) {
            return;
        }
    }
    if (is_remote_override_weapon(killstreak, weapon)) {
        return;
    }
    waittillframeend();
    if (isdefined(self.usingkillstreakheldweapon) && self.usingkillstreakheldweapon && weapon.iscarriedkillstreak) {
        return;
    }
    isfrominventory = undefined;
    if (isdefined(level.usingscorestreaks) && level.usingscorestreaks) {
        if (weapon == self getinventoryweapon()) {
            isfrominventory = 1;
        } else if (self getammocount(weapon) <= 0 && weapon.name != "killstreak_ai_tank") {
            self switch_to_last_non_killstreak_weapon();
            return;
        }
    } else if (isdefined(level.usingmomentum) && level.usingmomentum) {
        if (weapon == self getinventoryweapon()) {
            isfrominventory = 1;
        } else if (self.momentum < self function_dceb5542(level.killstreaks[killstreak].itemindex)) {
            self switch_to_last_non_killstreak_weapon();
            return;
        }
    }
    if (!isdefined(level.starttime) && level.roundstartkillstreakdelay > 0) {
        display_unavailable_time();
        return;
    }
    thread usekillstreak(killstreak, isfrominventory);
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xcf979e48, Offset: 0x6768
// Size: 0xdc
function on_grenade_fired(params) {
    grenade = params.projectile;
    grenadeweaponid = params.weapon;
    if (grenadeweaponid == level.var_239dc073) {
        return;
    }
    if (grenadeweaponid.inventorytype === "offhand") {
        if (is_killstreak_weapon(grenadeweaponid)) {
            killstreak = get_killstreak_for_weapon(grenadeweaponid);
            isfrominventory = grenadeweaponid == self getinventoryweapon();
            thread usekillstreak(killstreak, isfrominventory);
        }
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x44f55126, Offset: 0x6850
// Size: 0xac
function on_offhand_fire(params) {
    grenadeweaponid = params.weapon;
    if (grenadeweaponid == level.var_239dc073) {
        return;
    }
    if (is_killstreak_weapon(grenadeweaponid)) {
        killstreak = get_killstreak_for_weapon(grenadeweaponid);
        isfrominventory = grenadeweaponid == self getinventoryweapon();
        thread usekillstreak(killstreak, isfrominventory);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x86dca66, Offset: 0x6908
// Size: 0xe8
function should_delay_killstreak(killstreaktype) {
    if (!isdefined(level.starttime)) {
        return false;
    }
    if (level.roundstartkillstreakdelay < float(gettime() - level.starttime - level.discardtime) / 1000) {
        return false;
    }
    if (!is_delayable_killstreak(killstreaktype)) {
        return false;
    }
    killstreakweapon = get_killstreak_weapon(killstreaktype);
    if (killstreakweapon.iscarriedkillstreak) {
        return false;
    }
    if (util::isfirstround() || util::isoneround()) {
        return false;
    }
    return true;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xff9307f6, Offset: 0x69f8
// Size: 0x62
function is_delayable_killstreak(killstreaktype) {
    if (isdefined(level.killstreaks[killstreaktype]) && isdefined(level.killstreaks[killstreaktype].delaystreak) && level.killstreaks[killstreaktype].delaystreak) {
        return true;
    }
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xcc0fb719, Offset: 0x6a68
// Size: 0x186
function get_xp_amount_for_killstreak(killstreaktype) {
    xpamount = 0;
    switch (level.killstreaks[killstreaktype].killstreaklevel) {
    case 1:
    case 2:
    case 3:
    case 4:
        xpamount = 100;
        break;
    case 5:
        xpamount = 150;
        break;
    case 6:
    case 7:
        xpamount = 200;
        break;
    case 8:
        xpamount = 250;
        break;
    case 9:
        xpamount = 300;
        break;
    case 10:
    case 11:
        xpamount = 350;
        break;
    case 12:
    case 13:
    case 14:
    case 15:
        xpamount = 500;
        break;
    }
    return xpamount;
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x5e28270f, Offset: 0x6bf8
// Size: 0xbc
function display_unavailable_time() {
    timepassed = float([[ level.gettimepassed ]]()) / 1000;
    timeleft = int(level.roundstartkillstreakdelay - timepassed);
    if (timeleft <= 0) {
        timeleft = 1;
    }
    self iprintlnbold(#"hash_55a79f95e07a10bc", " " + timeleft + " ", #"hash_79a58948c3b976f5");
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x6e6981bd, Offset: 0x6cc0
// Size: 0x220
function trigger_killstreak(killstreaktype, isfrominventory) {
    assert(isdefined(level.killstreaks[killstreaktype].usefunction), "<dev string:x114>" + killstreaktype);
    self.usingkillstreakfrominventory = isfrominventory;
    if (isdefined(level.infinalkillcam) && level.infinalkillcam) {
        return false;
    }
    if (should_delay_killstreak(killstreaktype)) {
        display_unavailable_time();
    } else {
        success = [[ level.killstreaks[killstreaktype].usefunction ]](killstreaktype);
        if (isdefined(success) && success) {
            if (isdefined(self)) {
                if (sessionmodeismultiplayergame()) {
                }
                if (!isdefined(self.pers[level.killstreaks[killstreaktype].usagekey])) {
                    self.pers[level.killstreaks[killstreaktype].usagekey] = 0;
                }
                self.pers[level.killstreaks[killstreaktype].usagekey]++;
                self notify(#"killstreak_used", killstreaktype);
                self notify(#"killstreak_done", {#is_successful:1, #kstype:killstreaktype});
                self.usingkillstreakfrominventory = undefined;
            }
            return true;
        }
    }
    if (isdefined(self)) {
        self.usingkillstreakfrominventory = undefined;
        self notify(#"killstreak_done", {#is_successful:0, #kstype:killstreaktype});
    }
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xc049ea4f, Offset: 0x6ee8
// Size: 0x5e
function add_to_killstreak_count(weapon) {
    if (!isdefined(self.pers[#"totalkillstreakcount"])) {
        self.pers[#"totalkillstreakcount"] = 0;
    }
    self.pers[#"totalkillstreakcount"]++;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x3be75253, Offset: 0x6f50
// Size: 0xd6
function get_first_valid_killstreak_alt_weapon(killstreaktype) {
    assert(isdefined(level.killstreaks[killstreaktype]), "<dev string:x449>");
    if (isdefined(level.killstreaks[killstreaktype].altweapons)) {
        for (i = 0; i < level.killstreaks[killstreaktype].altweapons.size; i++) {
            if (isdefined(level.killstreaks[killstreaktype].altweapons[i])) {
                return level.killstreaks[killstreaktype].altweapons[i];
            }
        }
    }
    return level.weaponnone;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xffda38d7, Offset: 0x7030
// Size: 0x9e
function should_give_killstreak(weapon) {
    killstreakbuilding = getdvarint(#"scr_allow_killstreak_building", 0);
    rootweapon = isdefined(weapon) && isdefined(weapon.rootweapon) ? weapon.rootweapon : weapon;
    if (killstreakbuilding == 0) {
        if (is_weapon_associated_with_killstreak(rootweapon)) {
            return false;
        }
    }
    return true;
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0xb26a7194, Offset: 0x70d8
// Size: 0x42
function point_is_in_danger_area(point, targetpos, radius) {
    return distance2d(point, targetpos) <= radius * 1.25;
}

// Namespace killstreaks/killstreaks_shared
// Params 5, eflags: 0x0
// Checksum 0xb884d98e, Offset: 0x7128
// Size: 0x2bc
function print_killstreak_start_text(killstreaktype, owner, team, targetpos, dangerradius) {
    if (!isdefined(level.killstreaks[killstreaktype])) {
        return;
    }
    if (level.teambased) {
        players = level.players;
        if (!level.hardcoremode && isdefined(level.killstreaks[killstreaktype].inboundnearplayertext)) {
            for (i = 0; i < players.size; i++) {
                if (isalive(players[i]) && isdefined(players[i].pers[#"team"]) && players[i].pers[#"team"] == team) {
                    if (point_is_in_danger_area(players[i].origin, targetpos, dangerradius)) {
                        players[i] iprintlnbold(level.killstreaks[killstreaktype].inboundnearplayertext);
                    }
                }
            }
        }
        if (isdefined(level.killstreaks[killstreaktype])) {
            for (i = 0; i < level.players.size; i++) {
                player = level.players[i];
                playerteam = player.pers[#"team"];
                if (isdefined(playerteam)) {
                    if (playerteam == team) {
                        player iprintln(level.killstreaks[killstreaktype].inboundtext, owner);
                    }
                }
            }
        }
        return;
    }
    if (!level.hardcoremode && isdefined(level.killstreaks[killstreaktype].inboundnearplayertext)) {
        if (point_is_in_danger_area(owner.origin, targetpos, dangerradius)) {
            owner iprintlnbold(level.killstreaks[killstreaktype].inboundnearplayertext);
        }
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x6502437d, Offset: 0x73f0
// Size: 0x20c
function play_killstreak_ready_sfx(killstreaktype) {
    if (!isdefined(level.gameended) || !level.gameended) {
        switch (killstreaktype) {
        case #"uav":
            var_426d4c5d = "uin_kls_uav";
            break;
        case #"counteruav":
            var_426d4c5d = "uin_kls_counteruav";
            break;
        case #"remote_missile":
            var_426d4c5d = "uin_kls_remote_missile";
            break;
        case #"ultimate_turret":
            var_426d4c5d = "uin_kls_ultimate_turret";
            break;
        case #"helicopter_comlink":
            var_426d4c5d = "uin_kls_helicopter_comlink";
            break;
        case #"tank_robot":
            var_426d4c5d = "uin_kls_tank_robot";
            break;
        case #"swat_team":
            var_426d4c5d = "uin_kls_swat_team";
            break;
        case #"ac130":
            var_426d4c5d = "uin_kls_ac130";
            break;
        case #"recon_car":
            var_426d4c5d = "uin_kls_rcbomb";
            break;
        case #"supply_drop":
            var_426d4c5d = "uin_kls_supply_drop";
            break;
        case #"planemortar":
            var_426d4c5d = "uin_kls_airstrike";
            break;
        case #"straferun":
            var_426d4c5d = "uin_kls_straferun";
            break;
        }
        if (isdefined(var_426d4c5d)) {
            self playsoundtoplayer(var_426d4c5d, self);
            return;
        }
        self playsoundtoplayer("uin_kls_generic", self);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x2e90b495, Offset: 0x7608
// Size: 0x120
function killstreak_dialog_queued(dialogkey, killstreaktype, killstreakid) {
    if (!isdefined(dialogkey) || !isdefined(killstreaktype)) {
        return;
    }
    if (isdefined(self.currentkillstreakdialog)) {
        if (dialogkey === self.currentkillstreakdialog.dialogkey && killstreaktype === self.currentkillstreakdialog.killstreaktype && killstreakid === self.currentkillstreakdialog.killstreakid) {
            return 1;
        }
    }
    for (i = 0; i < self.killstreakdialogqueue.size; i++) {
        if (dialogkey === self.killstreakdialogqueue[i].dialogkey && killstreaktype === self.killstreakdialogqueue[i].killstreaktype && killstreaktype === self.killstreakdialogqueue[i].killstreaktype) {
            return 1;
        }
    }
    return 0;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x4e6ce951, Offset: 0x7730
// Size: 0xcc
function play_killstreak_ready_dialog(killstreaktype, taacomwaittime) {
    self notify("killstreak_ready_" + killstreaktype);
    self endon(#"death", "killstreak_start_" + killstreaktype, "killstreak_ready_" + killstreaktype);
    level endon(#"game_ended");
    if (isdefined(level.gameended) && level.gameended) {
        return;
    }
    if (killstreak_dialog_queued("ready", killstreaktype)) {
        return;
    }
    if (isdefined(taacomwaittime)) {
        wait taacomwaittime;
    }
    self play_taacom_dialog("ready", killstreaktype);
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0xa79dc5c0, Offset: 0x7808
// Size: 0x7c
function play_taacom_dialog_on_owner(dialogkey, killstreaktype, killstreakid) {
    if (!isdefined(self.owner) || !isdefined(self.team) || self.team != self.owner.team) {
        return;
    }
    self.owner play_taacom_dialog(dialogkey, killstreaktype, killstreakid);
}

// Namespace killstreaks/killstreaks_shared
// Params 4, eflags: 0x0
// Checksum 0xa452af7, Offset: 0x7890
// Size: 0x84
function play_taacom_dialog_response(dialogkey, killstreaktype, killstreakid, pilotindex) {
    assert(isdefined(dialogkey));
    assert(isdefined(killstreaktype));
    if (!isdefined(pilotindex)) {
        return;
    }
    self play_taacom_dialog(dialogkey + pilotindex, killstreaktype, killstreakid);
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x227b033b, Offset: 0x7920
// Size: 0x320
function player_killstreak_threat_tracking(killstreaktype) {
    assert(isdefined(killstreaktype));
    self endon(#"death", #"delete", #"leaving");
    level endon(#"game_ended");
    while (true) {
        if (!isdefined(self.owner)) {
            return;
        }
        players = self.owner dialog_shared::get_enemy_players();
        players = array::randomize(players);
        foreach (player in players) {
            if (!player dialog_shared::can_play_dialog(1)) {
                continue;
            }
            lookangles = player getplayerangles();
            if (lookangles[0] < 270 || lookangles[0] > 330) {
                continue;
            }
            lookdir = anglestoforward(lookangles);
            eyepoint = player geteye();
            streakdir = vectornormalize(self.origin - eyepoint);
            dot = vectordot(streakdir, lookdir);
            if (dot < 0.94) {
                continue;
            }
            traceresult = bullettrace(eyepoint, self.origin, 1, player);
            if (traceresult[#"fraction"] >= 1 || traceresult[#"entity"] === self) {
                if (dialog_shared::dialog_chance("killstreakSpotChance")) {
                    player dialog_shared::play_killstreak_threat(killstreaktype);
                }
                wait dialog_shared::mpdialog_value("killstreakSpotDelay", 0);
                break;
            }
        }
        wait dialog_shared::mpdialog_value("killstreakSpotInterval", float(function_60d95f53()) / 1000);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xfe475e43, Offset: 0x7c48
// Size: 0x46
function get_killstreak_inform_dialog(killstreaktype) {
    if (isdefined(level.killstreaks[killstreaktype].informdialog)) {
        return level.killstreaks[killstreaktype].informdialog;
    }
    return "";
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x696d02eb, Offset: 0x7c98
// Size: 0x62
function get_killstreak_usage_by_killstreak(killstreaktype) {
    assert(isdefined(level.killstreaks[killstreaktype]), "<dev string:x466>");
    return get_killstreak_usage(level.killstreaks[killstreaktype].usagekey);
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x1bf1158e, Offset: 0x7d08
// Size: 0x30
function get_killstreak_usage(usagekey) {
    if (!isdefined(self.pers[usagekey])) {
        return 0;
    }
    return self.pers[usagekey];
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x54acca58, Offset: 0x7d40
// Size: 0xee
function on_player_spawned() {
    profilestart();
    pixbeginevent(#"hash_1d81325f0403ec55");
    self thread give_owned();
    self.killcamkilledbyent = undefined;
    self callback::on_weapon_change(&function_4f415d8e);
    self callback::on_weapon_change(&function_4167ea4e);
    self callback::on_grenade_fired(&on_grenade_fired);
    self callback::on_offhand_fire(&on_offhand_fire);
    self thread initialspawnprotection();
    pixendevent();
    profilestop();
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x4a6e824e, Offset: 0x7e38
// Size: 0x166
function on_joined_team(params) {
    self endon(#"disconnect");
    self setinventoryweapon(level.weaponnone);
    self.pers[#"cur_kill_streak"] = 0;
    self.pers[#"cur_total_kill_streak"] = 0;
    self setplayercurrentstreak(0);
    self.pers[#"totalkillstreakcount"] = 0;
    self.pers[#"killstreaks"] = [];
    self.pers[#"killstreak_has_been_used"] = [];
    self.pers[#"killstreak_unique_id"] = [];
    self.pers[#"killstreak_ammo_count"] = [];
    if (isdefined(level.usingscorestreaks) && level.usingscorestreaks) {
        self.pers[#"killstreak_quantity"] = [];
        self.pers[#"held_killstreak_ammo_count"] = [];
        self.pers[#"held_killstreak_clip_count"] = [];
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x4
// Checksum 0x93966cba, Offset: 0x7fa8
// Size: 0x11c
function private initialspawnprotection() {
    self endon(#"death", #"disconnect");
    self thread airsupport::monitorspeed(level.spawnprotectiontime);
    if (!isdefined(level.spawnprotectiontime) || level.spawnprotectiontime == 0) {
        return;
    }
    self.specialty_nottargetedbyairsupport = 1;
    self clientfield::set("killstreak_spawn_protection", 1);
    self val::set(#"killstreak_spawn_protection", "ignoreme", 1);
    wait level.spawnprotectiontime;
    self clientfield::set("killstreak_spawn_protection", 0);
    self.specialty_nottargetedbyairsupport = undefined;
    self val::reset(#"killstreak_spawn_protection", "ignoreme");
}

/#

    // Namespace killstreaks/killstreaks_shared
    // Params 0, eflags: 0x0
    // Checksum 0x31c27ad8, Offset: 0x80d0
    // Size: 0xe0
    function killstreak_debug_think() {
        setdvar(#"debug_killstreak", "<dev string:x74>");
        for (;;) {
            cmd = getdvarstring(#"debug_killstreak");
            switch (cmd) {
            case #"data_dump":
                killstreak_data_dump();
                break;
            }
            if (cmd != "<dev string:x74>") {
                setdvar(#"debug_killstreak", "<dev string:x74>");
            }
            wait 0.5;
        }
    }

    // Namespace killstreaks/killstreaks_shared
    // Params 0, eflags: 0x0
    // Checksum 0x57af23ce, Offset: 0x81b8
    // Size: 0x33c
    function killstreak_data_dump() {
        iprintln("<dev string:x4af>");
        println("<dev string:x4d1>");
        println("<dev string:x4ef>");
        keys = getarraykeys(level.killstreaks);
        for (i = 0; i < keys.size; i++) {
            data = level.killstreaks[keys[i]];
            type_data = level.killstreaktype[keys[i]];
            print(keys[i] + "<dev string:x557>");
            print(data.killstreaklevel + "<dev string:x557>");
            print(data.weapon.name + "<dev string:x557>");
            alt = 0;
            if (isdefined(data.altweapons)) {
                assert(data.altweapons.size <= 4);
                for (alt = 0; alt < data.altweapons.size; alt++) {
                    print(data.altweapons[alt].name + "<dev string:x557>");
                }
            }
            while (alt < 4) {
                print("<dev string:x557>");
                alt++;
            }
            type = 0;
            if (isdefined(type_data)) {
                assert(type_data.size < 4);
                type_keys = getarraykeys(type_data);
                while (type < type_keys.size) {
                    if (type_data[type_keys[type]] == 1) {
                        print(type_keys[type] + "<dev string:x557>");
                    }
                    type++;
                }
            }
            while (type < 4) {
                print("<dev string:x557>");
                type++;
            }
            println("<dev string:x74>");
        }
        println("<dev string:x55b>");
    }

#/

// Namespace killstreaks/killstreaks_shared
// Params 4, eflags: 0x0
// Checksum 0x3d325193, Offset: 0x8500
// Size: 0x94
function function_2b6aa9e8(killstreak_ref, destroyed_callback, low_health_callback, emp_callback) {
    self setcandamage(1);
    self thread monitordamage(killstreak_ref, killstreak_bundles::get_max_health(killstreak_ref), destroyed_callback, killstreak_bundles::get_low_health(killstreak_ref), low_health_callback, 0, emp_callback, 1);
}

// Namespace killstreaks/killstreaks_shared
// Params 8, eflags: 0x0
// Checksum 0xf79a35ad, Offset: 0x85a0
// Size: 0x706
function monitordamage(killstreak_ref, max_health, destroyed_callback, low_health, low_health_callback, emp_damage, emp_callback, allow_bullet_damage) {
    self endon(#"death", #"delete");
    self setcandamage(1);
    self setup_health(killstreak_ref, max_health, low_health);
    self.health = self.maxhealth;
    self.damagetaken = 0;
    while (true) {
        weapon_damage = undefined;
        waitresult = self waittill(#"damage");
        attacker = waitresult.attacker;
        damage = waitresult.amount;
        direction = waitresult.direction;
        point = waitresult.position;
        type = waitresult.mod;
        tagname = waitresult.tag_name;
        modelname = waitresult.model_name;
        partname = waitresult.part_name;
        weapon = waitresult.weapon;
        flags = waitresult.flags;
        inflictor = waitresult.inflictor;
        chargelevel = waitresult.charge_level;
        if (isdefined(self.invulnerable) && self.invulnerable) {
            continue;
        }
        if (!isdefined(attacker) || !isplayer(attacker)) {
            continue;
        }
        friendlyfire = damage::friendlyfirecheck(self.owner, attacker);
        if (!friendlyfire) {
            continue;
        }
        if (isdefined(self.owner) && attacker == self.owner) {
            continue;
        }
        isvalidattacker = 1;
        if (level.teambased) {
            isvalidattacker = isdefined(attacker.team) && util::function_fbce7263(attacker.team, self.team);
        }
        if (!isvalidattacker) {
            continue;
        }
        if (isdefined(self.killstreakdamagemodifier)) {
            damage = [[ self.killstreakdamagemodifier ]](damage, attacker, direction, point, type, tagname, modelname, partname, weapon, flags, inflictor, chargelevel);
            if (damage <= 0) {
                continue;
            }
        }
        if (weapon.isemp && type == "MOD_GRENADE_SPLASH") {
            emp_damage_to_apply = killstreak_bundles::get_emp_grenade_damage(killstreak_ref, self.maxhealth);
            if (!isdefined(emp_damage_to_apply)) {
                emp_damage_to_apply = isdefined(emp_damage) ? emp_damage : 1;
            }
            if (isdefined(emp_callback) && emp_damage_to_apply > 0) {
                self [[ emp_callback ]](attacker);
            }
            weapon_damage = emp_damage_to_apply;
        }
        if (isdefined(self.selfdestruct) && self.selfdestruct) {
            weapon_damage = self.maxhealth + 1;
        }
        if (!isdefined(weapon_damage)) {
            weapon_damage = killstreak_bundles::get_weapon_damage(killstreak_ref, self.maxhealth, attacker, weapon, type, damage, flags, chargelevel);
            if (!isdefined(weapon_damage)) {
                weapon_damage = get_old_damage(attacker, weapon, type, damage, allow_bullet_damage);
            }
        }
        if (weapon_damage > 0) {
            if (damagefeedback::dodamagefeedback(weapon, attacker)) {
                if (!isvehicle(self)) {
                    attacker thread damagefeedback::update(type, undefined, undefined, weapon, self);
                }
            }
            self challenges::trackassists(attacker, weapon_damage, 0);
        }
        self.damagetaken += weapon_damage;
        if (!issentient(self) && weapon_damage > 0) {
            self.attacker = attacker;
        }
        if (self.damagetaken > self.maxhealth) {
            level.globalkillstreaksdestroyed++;
            attacker stats::function_e24eec31(getweapon(killstreak_ref), #"destroyed", 1);
            self function_73566ec7(attacker, weapon, self.owner);
            if (isdefined(destroyed_callback)) {
                self thread [[ destroyed_callback ]](attacker, weapon);
            }
            return;
        }
        remaining_health = max_health - self.damagetaken;
        if (remaining_health < low_health && weapon_damage > 0) {
            if (isdefined(low_health_callback) && (!isdefined(self.currentstate) || self.currentstate != "damaged")) {
                self [[ low_health_callback ]](attacker, weapon);
            }
            self.currentstate = "damaged";
        }
        if (isdefined(self.extra_low_health) && remaining_health < self.extra_low_health && weapon_damage > 0) {
            if (isdefined(self.extra_low_health_callback) && !isdefined(self.extra_low_damage_notified)) {
                self [[ self.extra_low_health_callback ]](attacker, weapon);
                self.extra_low_damage_notified = 1;
            }
        }
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0xbbccf197, Offset: 0x8cb0
// Size: 0x3b8
function function_73566ec7(attacker, weapon, owner) {
    if (!isdefined(self) || isdefined(self.var_c5bb583d) && self.var_c5bb583d || !isdefined(attacker) || !isplayer(attacker) || !isdefined(self.killstreaktype) || self.team === attacker.team) {
        return;
    }
    bundle = level.killstreakbundle[self.killstreaktype];
    if (isdefined(bundle) && isdefined(bundle.var_ebd92bbc)) {
        scoreevents::processscoreevent(bundle.var_ebd92bbc, attacker, owner, weapon);
        attacker stats::function_dad108fa(#"stats_destructions", 1);
        attacker contracts::increment_contract(#"hash_317a8b8df3aa8838");
        self.var_c5bb583d = 1;
        if (isdefined(self.attackers) && self.attackers.size > 0) {
            maxhealth = 1 / self.maxhealth;
            if (!isdefined(bundle.var_74711af9)) {
                return;
            }
            foreach (assister in self.attackers) {
                if (assister == attacker || !isplayer(assister) || !util::function_fbce7263(self.team, assister.team)) {
                    continue;
                }
                if (isdefined(bundle.var_93f7b1ae) && isdefined(self.attackerdamage)) {
                    timepassed = float(gettime() - self.attackerdamage[assister.clientid].lastdamagetime) / 1000;
                    if (timepassed > bundle.var_93f7b1ae) {
                        continue;
                    }
                }
                if (isdefined(bundle.var_ebcd245a) && isdefined(self.attackerdamage)) {
                    damagepercent = self.attackerdamage[assister.clientid].damage * maxhealth;
                    if (damagepercent < bundle.var_ebcd245a) {
                        continue;
                    }
                }
                scoreevents::processscoreevent(bundle.var_74711af9, assister, owner, self.attackerdamage[assister.clientid].weapon);
                assister stats::function_dad108fa(#"stats_destructions", 1);
                assister contracts::increment_contract(#"hash_317a8b8df3aa8838");
            }
        }
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 15, eflags: 0x0
// Checksum 0xf5fd7d12, Offset: 0x9070
// Size: 0x394
function ondamageperweapon(killstreak_ref, attacker, damage, flags, type, weapon, max_health, destroyed_callback, low_health, low_health_callback, emp_damage, emp_callback, allow_bullet_damage, chargelevel, var_488beb6d) {
    self.maxhealth = max_health;
    self.lowhealth = low_health;
    tablehealth = killstreak_bundles::get_max_health(killstreak_ref);
    if (isdefined(tablehealth)) {
        self.maxhealth = tablehealth;
    }
    tablehealth = killstreak_bundles::get_low_health(killstreak_ref);
    if (isdefined(tablehealth)) {
        self.lowhealth = tablehealth;
    }
    if (isdefined(self.invulnerable) && self.invulnerable) {
        return 0;
    }
    if (!isdefined(attacker) || !isplayer(attacker)) {
        return get_old_damage(attacker, weapon, type, damage, allow_bullet_damage);
    }
    friendlyfire = damage::friendlyfirecheck(self.owner, attacker);
    if (!friendlyfire) {
        return 0;
    }
    if (!(isdefined(var_488beb6d) && var_488beb6d)) {
        isvalidattacker = 1;
        if (level.teambased) {
            isvalidattacker = isdefined(attacker.team) && util::function_fbce7263(attacker.team, self.team);
        }
        if (!isvalidattacker) {
            return 0;
        }
    }
    if (weapon.isemp && type == "MOD_GRENADE_SPLASH") {
        emp_damage_to_apply = killstreak_bundles::get_emp_grenade_damage(killstreak_ref, self.maxhealth);
        if (!isdefined(emp_damage_to_apply)) {
            emp_damage_to_apply = isdefined(emp_damage) ? emp_damage : 1;
        }
        if (isdefined(emp_callback) && emp_damage_to_apply > 0) {
            self [[ emp_callback ]](attacker, weapon);
        }
        return emp_damage_to_apply;
    }
    weapon_damage = killstreak_bundles::get_weapon_damage(killstreak_ref, self.maxhealth, attacker, weapon, type, damage, flags, chargelevel);
    if (!isdefined(weapon_damage)) {
        weapon_damage = get_old_damage(attacker, weapon, type, damage, allow_bullet_damage);
    }
    if (!isdefined(weapon_damage) || weapon_damage <= 0) {
        return 0;
    }
    idamage = int(weapon_damage);
    if (idamage > self.health) {
        self function_73566ec7(attacker, weapon, self.owner);
        if (isdefined(destroyed_callback)) {
            self thread [[ destroyed_callback ]](attacker, weapon);
        }
    }
    return idamage;
}

// Namespace killstreaks/killstreaks_shared
// Params 6, eflags: 0x0
// Checksum 0x9614d753, Offset: 0x9410
// Size: 0x246
function get_old_damage(attacker, weapon, type, damage, allow_bullet_damage, bullet_damage_scalar) {
    switch (type) {
    case #"mod_rifle_bullet":
    case #"mod_pistol_bullet":
        if (!allow_bullet_damage) {
            damage = 0;
            break;
        }
        if (isdefined(attacker) && isplayer(attacker)) {
            hasfmj = attacker hasperk(#"specialty_armorpiercing");
        }
        if (isdefined(hasfmj) && hasfmj) {
            damage = int(damage * level.cac_armorpiercing_data);
        }
        if (isdefined(bullet_damage_scalar)) {
            damage = int(damage * bullet_damage_scalar);
        }
        break;
    case #"mod_explosive":
    case #"mod_projectile":
    case #"mod_projectile_splash":
        if (weapon.statindex == level.weaponpistolenergy.statindex || weapon.statindex != level.weaponshotgunenergy.statindex || weapon.statindex == level.weaponspecialcrossbow.statindex) {
            break;
        }
        if (isdefined(self.remotemissiledamage) && isdefined(weapon) && weapon.name == #"remote_missile_missile") {
            damage = self.remotemissiledamage;
        } else if (isdefined(self.rocketdamage)) {
            damage = self.rocketdamage;
        }
        break;
    default:
        break;
    }
    return damage;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xaec8dcea, Offset: 0x9660
// Size: 0x4c
function isheldinventorykillstreakweapon(killstreakweapon) {
    switch (killstreakweapon.name) {
    case #"inventory_m32":
    case #"inventory_minigun":
        return true;
    }
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 5, eflags: 0x0
// Checksum 0x59baeabb, Offset: 0x96b8
// Size: 0xac
function waitfortimecheck(duration, callback, endcondition1, endcondition2, endcondition3) {
    self endon(#"hacked");
    if (isdefined(endcondition1)) {
        self endon(endcondition1);
    }
    if (isdefined(endcondition2)) {
        self endon(endcondition2);
    }
    if (isdefined(endcondition3)) {
        self endon(endcondition3);
    }
    hostmigration::migrationawarewait(duration);
    self notify(#"time_check");
    self [[ callback ]]();
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x463640d5, Offset: 0x9770
// Size: 0x3a
function emp_isempd() {
    if (isdefined(level.emp_shared.enemyempactivefunc)) {
        return self [[ level.emp_shared.enemyempactivefunc ]]();
    }
    return 0;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0xae381fc1, Offset: 0x97b8
// Size: 0x7c
function waittillemp(onempdcallback, arg) {
    self endon(#"death", #"delete");
    waitresult = self waittill(#"emp_deployed");
    if (isdefined(onempdcallback)) {
        [[ onempdcallback ]](waitresult.attacker, arg);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x8fe0a48a, Offset: 0x9840
// Size: 0x12c
function destroyotherteamsequipment(attacker, weapon, radius) {
    foreach (team, _ in level.teams) {
        if (!util::function_fbce7263(team, attacker.team)) {
            continue;
        }
        destroyequipment(attacker, team, weapon, radius);
        destroytacticalinsertions(attacker, team, radius);
    }
    destroyequipment(attacker, "free", weapon, radius);
    destroytacticalinsertions(attacker, "free", radius);
}

// Namespace killstreaks/killstreaks_shared
// Params 4, eflags: 0x0
// Checksum 0x7e9d5430, Offset: 0x9978
// Size: 0x1de
function destroyequipment(attacker, team, weapon, radius) {
    radiussq = radius * radius;
    for (i = 0; i < level.missileentities.size; i++) {
        item = level.missileentities[i];
        if (!isdefined(item)) {
            continue;
        }
        if (distancesquared(item.origin, attacker.origin) > radiussq) {
            continue;
        }
        if (!isdefined(item.weapon)) {
            continue;
        }
        if (!isdefined(item.owner)) {
            continue;
        }
        if (isdefined(team) && util::function_fbce7263(item.owner.team, team)) {
            continue;
        } else if (item.owner == attacker) {
            continue;
        }
        if (!item.weapon.isequipment && !(isdefined(item.destroyedbyemp) && item.destroyedbyemp)) {
            continue;
        }
        watcher = item.owner weaponobjects::getwatcherforweapon(item.weapon);
        if (!isdefined(watcher)) {
            continue;
        }
        watcher thread weaponobjects::waitanddetonate(item, 0, attacker, weapon);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x19ed56a8, Offset: 0x9b60
// Size: 0x11e
function destroytacticalinsertions(attacker, victimteam, radius) {
    radiussq = radius * radius;
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (!isdefined(player.tacticalinsertion)) {
            continue;
        }
        if (level.teambased && util::function_fbce7263(player.team, victimteam)) {
            continue;
        }
        if (attacker == player) {
            continue;
        }
        if (distancesquared(player.origin, attacker.origin) < radiussq) {
            player.tacticalinsertion thread tacticalinsertion::fizzle();
        }
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x275aa921, Offset: 0x9c88
// Size: 0xc8
function destroyotherteamsactivevehicles(attacker, weapon, radius) {
    foreach (team, _ in level.teams) {
        if (!util::function_fbce7263(team, attacker.team)) {
            continue;
        }
        destroyactivevehicles(attacker, team, weapon, radius);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 4, eflags: 0x0
// Checksum 0x7292f5ec, Offset: 0x9d58
// Size: 0xc04
function destroyactivevehicles(attacker, team, weapon, radius) {
    radiussq = radius * radius;
    targets = target_getarray();
    destroyentities(targets, attacker, team, weapon, radius);
    ai_tanks = getentarray("talon", "targetname");
    destroyentities(ai_tanks, attacker, team, weapon, radius);
    remotemissiles = getentarray("remote_missile", "targetname");
    destroyentities(remotemissiles, attacker, team, weapon, radius);
    remotedrone = getentarray("remote_drone", "targetname");
    destroyentities(remotedrone, attacker, team, weapon, radius);
    script_vehicles = getentarray("script_vehicle", "classname");
    foreach (vehicle in script_vehicles) {
        if (distancesquared(vehicle.origin, attacker.origin) > radiussq) {
            continue;
        }
        if (isdefined(team) && !util::function_fbce7263(vehicle.team, team) && isvehicle(vehicle)) {
            if (isdefined(vehicle.detonateviaemp) && isdefined(weapon.isempkillstreak) && weapon.isempkillstreak) {
                vehicle [[ vehicle.detonateviaemp ]](attacker, weapon);
            }
            if (isdefined(vehicle.archetype)) {
                if (vehicle.archetype == "turret" || vehicle.archetype == "rcbomb" || vehicle.archetype == "wasp") {
                    vehicle dodamage(vehicle.health + 1, vehicle.origin, attacker, attacker, "", "MOD_EXPLOSIVE", 0, weapon);
                }
            }
        }
    }
    planemortars = getentarray("plane_mortar", "targetname");
    foreach (planemortar in planemortars) {
        if (distance2d(planemortar.origin, attacker.origin) > radius) {
            continue;
        }
        if (isdefined(team) && isdefined(planemortar.team)) {
            if (util::function_fbce7263(planemortar.team, team)) {
                continue;
            }
        } else if (planemortar.owner == attacker) {
            continue;
        }
        planemortar notify(#"emp_deployed", {#attacker:attacker});
    }
    dronestrikes = getentarray("drone_strike", "targetname");
    foreach (dronestrike in dronestrikes) {
        if (distance2d(dronestrike.origin, attacker.origin) > radius) {
            continue;
        }
        if (isdefined(team) && isdefined(dronestrike.team)) {
            if (util::function_fbce7263(dronestrike.team, team)) {
                continue;
            }
        } else if (dronestrike.owner == attacker) {
            continue;
        }
        dronestrike notify(#"emp_deployed", {#attacker:attacker});
    }
    var_eca5110 = getentarray("guided_artillery_shell", "targetname");
    foreach (shell in var_eca5110) {
        if (distance2d(shell.origin, attacker.origin) > radius) {
            continue;
        }
        if (isdefined(team) && isdefined(shell.team)) {
            if (util::function_fbce7263(shell.team, team)) {
                continue;
            }
        } else if (shell.owner == attacker) {
            continue;
        }
        shell notify(#"emp_deployed", {#attacker:attacker});
    }
    counteruavs = getentarray("counteruav", "targetname");
    foreach (counteruav in counteruavs) {
        if (distance2d(counteruav.origin, attacker.origin) > radius) {
            continue;
        }
        if (isdefined(team) && isdefined(counteruav.team)) {
            if (util::function_fbce7263(counteruav.team, team)) {
                continue;
            }
        } else if (counteruav.owner == attacker) {
            continue;
        }
        counteruav notify(#"emp_deployed", {#attacker:attacker});
    }
    satellites = getentarray("satellite", "targetname");
    foreach (satellite in satellites) {
        if (distance2d(satellite.origin, attacker.origin) > radius) {
            continue;
        }
        if (isdefined(team) && isdefined(satellite.team)) {
            if (util::function_fbce7263(satellite.team, team)) {
                continue;
            }
        } else if (satellite.owner == attacker) {
            continue;
        }
        satellite notify(#"emp_deployed", {#attacker:attacker});
    }
    robots = getaiarchetypearray("robot");
    foreach (robot in robots) {
        if (distancesquared(robot.origin, attacker.origin) > radiussq) {
            continue;
        }
        if (robot.allowdeath !== 0 && robot.magic_bullet_shield !== 1 && isdefined(team) && !util::function_fbce7263(robot.team, team)) {
            if (isdefined(attacker) && (!isdefined(robot.owner) || robot.owner util::isenemyplayer(attacker))) {
                scoreevents::processscoreevent(#"destroyed_combat_robot", attacker, robot.owner, weapon);
                luinotifyevent(#"player_callout", 2, #"hash_3b274c8c3c961f3", attacker.entnum);
            }
            robot kill();
        }
    }
    if (isdefined(level.missile_swarm_owner)) {
        if (level.missile_swarm_owner util::isenemyplayer(attacker)) {
            if (distancesquared(level.missile_swarm_owner.origin, attacker.origin) < radiussq) {
                level.missile_swarm_owner notify(#"emp_destroyed_missile_swarm", {#attacker:attacker});
            }
        }
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 5, eflags: 0x0
// Checksum 0x308e6b06, Offset: 0xa968
// Size: 0x26c
function destroyentities(entities, attacker, team, weapon, radius) {
    meansofdeath = "MOD_EXPLOSIVE";
    damage = 5000;
    direction_vec = (0, 0, 0);
    point = (0, 0, 0);
    modelname = "";
    tagname = "";
    partname = "";
    radiussq = radius * radius;
    foreach (entity in entities) {
        if (isdefined(team) && isdefined(entity.team)) {
            if (util::function_fbce7263(entity.team, team)) {
                continue;
            }
        } else if (isdefined(entity.owner) && entity.owner == attacker) {
            continue;
        }
        if (distancesquared(entity.origin, attacker.origin) < radiussq) {
            entity notify(#"damage", {#amount:damage, #attacker:attacker, #direction:direction_vec, #position:point, #mod:meansofdeath, #tag_name:tagname, #model_name:modelname, #part_name:partname, #weapon:weapon});
        }
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x6ff20849, Offset: 0xabe0
// Size: 0x62
function get_killstreak_for_weapon(weapon) {
    if (!isdefined(level.killstreakweapons)) {
        return undefined;
    }
    if (isdefined(level.killstreakweapons[weapon])) {
        return level.killstreakweapons[weapon];
    }
    return level.killstreakweapons[weapon.rootweapon];
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x1791b548, Offset: 0xac50
// Size: 0x5a
function is_killstreak_weapon_assist_allowed(weapon) {
    killstreak = get_killstreak_for_weapon(weapon);
    if (!isdefined(killstreak)) {
        return false;
    }
    if (level.killstreaks[killstreak].allowassists) {
        return true;
    }
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x49fb5665, Offset: 0xacb8
// Size: 0xaa
function should_override_entity_camera_in_demo(player, weapon) {
    killstreak = get_killstreak_for_weapon(weapon);
    if (!isdefined(killstreak)) {
        return false;
    }
    if (level.killstreaks[killstreak].overrideentitycameraindemo) {
        return true;
    }
    if (isdefined(player.remoteweapon) && isdefined(player.remoteweapon.controlled) && player.remoteweapon.controlled) {
        return true;
    }
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0xdb20c792, Offset: 0xad70
// Size: 0x58
function watch_for_remove_remote_weapon() {
    self endon(#"endwatchforremoveremoteweapon");
    for (;;) {
        self waittill(#"remove_remote_weapon");
        self switch_to_last_non_killstreak_weapon();
        self enableusability();
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x30a73597, Offset: 0xadd0
// Size: 0x154
function clear_using_remote(immediate, skipnotify, gameended) {
    if (!isdefined(self)) {
        return;
    }
    self.dofutz = 0;
    self.no_fade2black = 0;
    self clientfield::set_to_player("static_postfx", 0);
    if (isdefined(self.carryicon)) {
        self.carryicon.alpha = 1;
    }
    self.usingremote = undefined;
    self reset_killstreak_delay_killcam();
    self enableoffhandweapons();
    self enableweaponcycling();
    curweapon = self getcurrentweapon();
    if (isalive(self)) {
        self switch_to_last_non_killstreak_weapon(immediate, undefined, gameended);
    }
    if (!(isdefined(skipnotify) && skipnotify)) {
        self notify(#"stopped_using_remote");
    }
    thread hide_tablet();
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0xdd9e6ba, Offset: 0xaf30
// Size: 0x20
function hide_tablet() {
    self endon(#"disconnect");
    wait 0.2;
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0xf94b6b5f, Offset: 0xaf58
// Size: 0xe
function reset_killstreak_delay_killcam() {
    self.killstreak_delay_killcam = undefined;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x1d6b270, Offset: 0xaf70
// Size: 0x78
function init_ride_killstreak(streak, always_allow = 0) {
    self disableusability();
    result = self init_ride_killstreak_internal(streak, always_allow);
    if (isdefined(self)) {
        self enableusability();
    }
    return result;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x75cd999, Offset: 0xaff0
// Size: 0x4dc
function init_ride_killstreak_internal(streak, always_allow) {
    var_5df1cb97 = 0;
    if (isdefined(streak) && (streak == "dart" || streak == "killstreak_remote_turret" || streak == "killstreak_ai_tank" || streak == "qrdrone" || streak == "sentinel" || streak == "recon_car")) {
        laptopwait = "timeout";
    } else if (isdefined(streak) && streak == "remote_missile") {
        laptopwait = "timeout";
        var_5df1cb97 = getdvarfloat(#"hash_409036e81396b597", 0.075);
    } else {
        laptopwait = self waittilltimeout(0.2, #"disconnect", #"death", #"weapon_switch_started");
        laptopwait = laptopwait._notify;
    }
    hostmigration::waittillhostmigrationdone();
    if (laptopwait == "weapon_switch_started") {
        return "fail";
    }
    if (!isalive(self) && !always_allow) {
        return "fail";
    }
    if (laptopwait == "disconnect" || laptopwait == "death") {
        if (laptopwait == "disconnect") {
            return "disconnect";
        }
        if (!isdefined(self.team) || self.team == #"spectator") {
            return "fail";
        }
        return "success";
    }
    if (self isempjammed() && !(isdefined(self.ignoreempjammed) && self.ignoreempjammed)) {
        return "fail";
    }
    if (self is_interacting_with_object()) {
        return "fail";
    }
    self thread hud::fade_to_black_for_x_sec(0, 0.2 + var_5df1cb97, 0.1, 0.1);
    self thread watch_for_remove_remote_weapon();
    blackoutwait = self waittilltimeout(0.2, #"disconnect", #"death");
    self notify(#"endwatchforremoveremoteweapon");
    hostmigration::waittillhostmigrationdone();
    if (blackoutwait._notify != "disconnect") {
        self thread clear_ride_intro(1);
        if (!isdefined(self.team) || self.team == #"spectator") {
            return "fail";
        }
    }
    if (always_allow) {
        if (blackoutwait._notify == "disconnect") {
            return "disconnect";
        } else {
            return "success";
        }
    }
    if (self isonladder()) {
        return "fail";
    }
    if (!isalive(self)) {
        return "fail";
    }
    if (self isempjammed() && !(isdefined(self.ignoreempjammed) && self.ignoreempjammed)) {
        return "fail";
    }
    if (isdefined(self.laststand) && self.laststand) {
        return "fail";
    }
    if (self is_interacting_with_object()) {
        return "fail";
    }
    if (blackoutwait._notify == "disconnect") {
        return "disconnect";
    }
    return "success";
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xc35525fe, Offset: 0xb4d8
// Size: 0x44
function clear_ride_intro(delay) {
    self endon(#"disconnect");
    if (isdefined(delay)) {
        wait delay;
    }
    self thread hud::screen_fade_in(0);
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x5d3bfb56, Offset: 0xb528
// Size: 0x64
function is_interacting_with_object() {
    if (self iscarryingturret()) {
        return true;
    }
    if (isdefined(self.isplanting) && self.isplanting) {
        return true;
    }
    if (isdefined(self.isdefusing) && self.isdefusing) {
        return true;
    }
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x3657744c, Offset: 0xb598
// Size: 0xe2
function get_random_pilot_index(killstreaktype) {
    if (!isdefined(killstreaktype)) {
        return undefined;
    }
    if (!isdefined(self.pers[#"mptaacom"])) {
        return undefined;
    }
    taacombundle = get_mpdialog_tacom_bundle(self.pers[#"mptaacom"]);
    if (!isdefined(taacombundle) || !isdefined(taacombundle.pilotbundles)) {
        return undefined;
    }
    if (!isdefined(taacombundle.pilotbundles[killstreaktype])) {
        return undefined;
    }
    numpilots = taacombundle.pilotbundles[killstreaktype].size;
    if (numpilots <= 0) {
        return undefined;
    }
    return randomint(numpilots);
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x53b8c27b, Offset: 0xb688
// Size: 0x30
function get_mpdialog_tacom_bundle(name) {
    if (!isdefined(level.tacombundles)) {
        return undefined;
    }
    return level.tacombundles[name];
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x68901e7, Offset: 0xb6c0
// Size: 0x24
function hide_compass() {
    self clientfield::set("killstreak_hides_compass", 1);
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x3cf65802, Offset: 0xb6f0
// Size: 0x24
function unhide_compass() {
    self clientfield::set("killstreak_hides_compass", 0);
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x52eb398d, Offset: 0xb720
// Size: 0xee
function setup_health(killstreak_ref, max_health, low_health) {
    self.maxhealth = max_health;
    self.lowhealth = low_health;
    self.hackedhealthupdatecallback = &defaulthackedhealthupdatecallback;
    tablemaxhealth = killstreak_bundles::get_max_health(killstreak_ref);
    if (isdefined(tablemaxhealth)) {
        self.maxhealth = tablemaxhealth;
    }
    tablelowhealth = killstreak_bundles::get_low_health(killstreak_ref);
    if (isdefined(tablelowhealth)) {
        self.lowhealth = tablelowhealth;
    }
    tablehackedhealth = killstreak_bundles::get_hacked_health(killstreak_ref);
    if (isdefined(tablehackedhealth)) {
        self.hackedhealth = tablehackedhealth;
        return;
    }
    self.hackedhealth = self.maxhealth;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xf6b89fe9, Offset: 0xb818
// Size: 0xb2
function defaulthackedhealthupdatecallback(hacker) {
    killstreak = self;
    assert(isdefined(self.maxhealth));
    assert(isdefined(self.hackedhealth));
    assert(isdefined(self.damagetaken));
    damageafterhacking = self.maxhealth - self.hackedhealth;
    if (self.damagetaken < damageafterhacking) {
        self.damagetaken = damageafterhacking;
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 19, eflags: 0x0
// Checksum 0xd3ef1564, Offset: 0xb8d8
// Size: 0x1b0
function function_8cd96439(killstreakref, killstreakid, onplacecallback, oncancelcallback, onmovecallback, onshutdowncallback, ondeathcallback, onempcallback, model, validmodel, invalidmodel, spawnsvehicle, pickupstring, timeout, health, empdamage, placehintstring, invalidlocationhintstring, placeimmediately = 0) {
    player = self;
    placeable = placeables::spawnplaceable(onplacecallback, oncancelcallback, onmovecallback, onshutdowncallback, ondeathcallback, onempcallback, undefined, undefined, model, validmodel, invalidmodel, spawnsvehicle, pickupstring, timeout, health, empdamage, placehintstring, invalidlocationhintstring, placeimmediately, &function_84da1341);
    if (isdefined(placeable.othermodel)) {
        placeable.othermodel clientfield::set("enemyvehicle", 1);
    }
    placeable.killstreakref = killstreakref;
    placeable.killstreakid = killstreakid;
    placeable configure_team(killstreakref, killstreakid, player);
    return placeable;
}

// Namespace killstreaks/killstreaks_shared
// Params 4, eflags: 0x0
// Checksum 0xa99b2f6, Offset: 0xba90
// Size: 0x88
function function_84da1341(damagecallback, destroyedcallback, var_1891d3cd, var_2053fdc6) {
    waitframe(1);
    placeable = self;
    if (isdefined(level.var_8ddb1b0e)) {
        placeable thread [[ level.var_8ddb1b0e ]](placeable.killstreakref, placeable.health, destroyedcallback, 0, undefined, var_1891d3cd, var_2053fdc6, 1);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 7, eflags: 0x0
// Checksum 0x47404ea4, Offset: 0xbb20
// Size: 0xcc
function configure_team(killstreaktype, killstreakid, owner, influencertype, configureteamprefunction, configureteampostfunction, ishacked = 0) {
    killstreak = self;
    killstreak.killstreaktype = killstreaktype;
    killstreak.killstreakid = killstreakid;
    killstreak _setup_configure_team_callbacks(influencertype, configureteamprefunction, configureteampostfunction);
    killstreak configure_team_internal(owner, ishacked);
    owner thread trackactivekillstreak(killstreak);
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x553b6b49, Offset: 0xbbf8
// Size: 0x218
function configure_team_internal(owner, ishacked) {
    killstreak = self;
    if (ishacked == 0) {
        killstreak.originalowner = owner;
        killstreak.originalteam = owner.team;
        /#
        #/
    } else {
        assert(killstreak.killstreakteamconfigured, "<dev string:x57d>");
    }
    if (isdefined(killstreak.killstreakconfigureteamprefunction)) {
        killstreak thread [[ killstreak.killstreakconfigureteamprefunction ]](owner, ishacked);
    }
    if (isdefined(killstreak.killstreakinfluencertype)) {
        killstreak influencers::remove_influencers();
    }
    if (!isdefined(owner) || !isdefined(owner.team)) {
        return;
    }
    killstreak setteam(owner.team);
    killstreak.team = owner.team;
    if (!isai(killstreak)) {
        killstreak setowner(owner);
    }
    killstreak.owner = owner;
    killstreak.ownerentnum = owner.entnum;
    killstreak.pilotindex = killstreak.owner get_random_pilot_index(killstreak.killstreaktype);
    if (isdefined(killstreak.killstreakinfluencertype)) {
        killstreak influencers::create_entity_enemy_influencer(killstreak.killstreakinfluencertype, owner.team);
    }
    if (isdefined(killstreak.killstreakconfigureteampostfunction)) {
        killstreak thread [[ killstreak.killstreakconfigureteampostfunction ]](owner, ishacked);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x4
// Checksum 0x7ef006cd, Offset: 0xbe18
// Size: 0x6a
function private _setup_configure_team_callbacks(influencertype, configureteamprefunction, configureteampostfunction) {
    killstreak = self;
    killstreak.killstreakteamconfigured = 1;
    killstreak.killstreakinfluencertype = influencertype;
    killstreak.killstreakconfigureteamprefunction = configureteamprefunction;
    killstreak.killstreakconfigureteampostfunction = configureteampostfunction;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xcdc57544, Offset: 0xbe90
// Size: 0xb6
function trackactivekillstreak(killstreak) {
    killstreakindex = killstreak.killstreakid;
    if (isdefined(self) && isdefined(self.pers) && isdefined(killstreakindex)) {
        self endon(#"disconnect");
        self.pers[#"activekillstreaks"][killstreakindex] = killstreak;
        killstreak waittill(#"killstreak_hacked", #"death");
        self.pers[#"activekillstreaks"][killstreakindex] = undefined;
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x85697c5f, Offset: 0xbf50
// Size: 0x3c
function play_killstreak_firewall_being_hacked_dialog(killstreaktype, killstreakid) {
    if (isdefined(level.play_killstreak_firewall_being_hacked_dialog)) {
        self [[ level.play_killstreak_firewall_being_hacked_dialog ]](killstreaktype, killstreakid);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0xfaed37c0, Offset: 0xbf98
// Size: 0x3c
function play_killstreak_firewall_hacked_dialog(killstreaktype, killstreakid) {
    if (isdefined(level.play_killstreak_firewall_hacked_dialog)) {
        self [[ level.play_killstreak_firewall_hacked_dialog ]](killstreaktype, killstreakid);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x72f86d3, Offset: 0xbfe0
// Size: 0x3c
function play_killstreak_being_hacked_dialog(killstreaktype, killstreakid) {
    if (isdefined(level.play_killstreak_being_hacked_dialog)) {
        self [[ level.play_killstreak_being_hacked_dialog ]](killstreaktype, killstreakid);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x69366c5a, Offset: 0xc028
// Size: 0x48
function play_killstreak_hacked_dialog(killstreaktype, killstreakid, hacker) {
    if (isdefined(level.play_killstreak_hacked_dialog)) {
        self [[ level.play_killstreak_hacked_dialog ]](killstreaktype, killstreakid, hacker);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0xfe499411, Offset: 0xc078
// Size: 0x48
function play_killstreak_start_dialog(hardpointtype, team, killstreak_id) {
    if (isdefined(level.play_killstreak_start_dialog)) {
        self [[ level.play_killstreak_start_dialog ]](hardpointtype, team, killstreak_id);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 4, eflags: 0x0
// Checksum 0xfbf4e22d, Offset: 0xc0c8
// Size: 0x54
function play_pilot_dialog(dialogkey, killstreaktype, killstreakid, pilotindex) {
    if (isdefined(level.play_pilot_dialog)) {
        self [[ level.play_pilot_dialog ]](dialogkey, killstreaktype, killstreakid, pilotindex);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x106de477, Offset: 0xc128
// Size: 0x48
function play_pilot_dialog_on_owner(dialogkey, killstreaktype, killstreakid) {
    if (isdefined(level.play_pilot_dialog_on_owner)) {
        self [[ level.play_pilot_dialog_on_owner ]](dialogkey, killstreaktype, killstreakid);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x3475b4f8, Offset: 0xc178
// Size: 0x3c
function play_destroyed_dialog_on_owner(killstreaktype, killstreakid) {
    if (isdefined(level.play_destroyed_dialog_on_owner)) {
        self [[ level.play_destroyed_dialog_on_owner ]](killstreaktype, killstreakid);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 7, eflags: 0x0
// Checksum 0xa6933b7, Offset: 0xc1c0
// Size: 0x78
function play_taacom_dialog(dialogkey, killstreaktype, killstreakid, soundevent, var_8a6b001a, weapon, priority) {
    if (isdefined(level.play_taacom_dialog)) {
        self [[ level.play_taacom_dialog ]](dialogkey, killstreaktype, killstreakid, soundevent, var_8a6b001a, weapon, priority);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0xfd42b25d, Offset: 0xc240
// Size: 0x48
function play_taacom_dialog_response_on_owner(dialogkey, killstreaktype, killstreakid) {
    if (isdefined(level.play_taacom_dialog_response_on_owner)) {
        self [[ level.play_taacom_dialog_response_on_owner ]](dialogkey, killstreaktype, killstreakid);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 5, eflags: 0x0
// Checksum 0x8874cbf4, Offset: 0xc290
// Size: 0x60
function leader_dialog_for_other_teams(dialogkey, skipteam, objectivekey, killstreakid, dialogbufferkey) {
    if (isdefined(level.var_9f8e080d)) {
        [[ level.var_9f8e080d ]](dialogkey, skipteam, objectivekey, killstreakid, dialogbufferkey);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 6, eflags: 0x0
// Checksum 0xe78e35cb, Offset: 0xc2f8
// Size: 0x6c
function leader_dialog(dialogkey, team, excludelist, objectivekey, killstreakid, dialogbufferkey) {
    if (isdefined(level.var_514f9d20)) {
        [[ level.var_514f9d20 ]](dialogkey, team, excludelist, objectivekey, killstreakid, dialogbufferkey);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 4, eflags: 0x0
// Checksum 0xf13d7d7c, Offset: 0xc370
// Size: 0x54
function processscoreevent(event, player, victim, weapon) {
    if (isdefined(level.var_19a15e42)) {
        [[ level.var_19a15e42 ]](event, player, victim, weapon);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x6f01d1c4, Offset: 0xc3d0
// Size: 0x32
function allow_assists(killstreaktype, allow) {
    level.killstreaks[killstreaktype].allowassists = allow;
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x4806634d, Offset: 0xc410
// Size: 0x3a
function set_team_kill_penalty_scale(killstreaktype, scale, isinventory) {
    level.killstreaks[killstreaktype].teamkillpenaltyscale = scale;
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x74cda3da, Offset: 0xc458
// Size: 0x3a
function override_entity_camera_in_demo(killstreaktype, value, isinventory) {
    level.killstreaks[killstreaktype].overrideentitycameraindemo = value;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x7cd93d31, Offset: 0xc4a0
// Size: 0x27a
function update_player_threat(player) {
    if (!isplayer(player)) {
        return;
    }
    heli = self;
    player.threatlevel = 0;
    dist = distance(player.origin, heli.origin);
    player.threatlevel += (level.heli_visual_range - dist) / level.heli_visual_range * 100;
    if (isdefined(heli.attacker) && player == heli.attacker) {
        player.threatlevel += 100;
    }
    if (isdefined(player.carryobject)) {
        player.threatlevel += 200;
    }
    if (isdefined(player.score)) {
        player.threatlevel += player.score * 2;
    }
    if (player weapons::has_launcher()) {
        if (player weapons::has_lockon(heli)) {
            player.threatlevel += 1000;
        } else {
            player.threatlevel += 500;
        }
    }
    if (player weapons::has_heavy_weapon()) {
        player.threatlevel += 300;
    }
    if (player weapons::has_lmg()) {
        player.threatlevel += 200;
    }
    if (isdefined(player.antithreat)) {
        player.threatlevel -= player.antithreat;
    }
    if (player.threatlevel <= 0) {
        player.threatlevel = 1;
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x2c27ff2f, Offset: 0xc728
// Size: 0xb2
function update_non_player_threat(non_player) {
    heli = self;
    non_player.threatlevel = 0;
    dist = distance(non_player.origin, heli.origin);
    non_player.threatlevel += (level.heli_visual_range - dist) / level.heli_visual_range * 100;
    if (non_player.threatlevel <= 0) {
        non_player.threatlevel = 1;
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x5631dac2, Offset: 0xc7e8
// Size: 0x1d2
function update_actor_threat(actor) {
    heli = self;
    actor.threatlevel = 0;
    dist = distance(actor.origin, heli.origin);
    actor.threatlevel += (level.heli_visual_range - dist) / level.heli_visual_range * 100;
    if (isdefined(actor.owner)) {
        if (isdefined(heli.attacker) && actor.owner == heli.attacker) {
            actor.threatlevel += 100;
        }
        if (isdefined(actor.owner.carryobject)) {
            actor.threatlevel += 200;
        }
        if (isdefined(actor.owner.score)) {
            actor.threatlevel += actor.owner.score * 4;
        }
        if (isdefined(actor.owner.antithreat)) {
            actor.threatlevel -= actor.owner.antithreat;
        }
    }
    if (actor.threatlevel <= 0) {
        actor.threatlevel = 1;
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x6b0d6732, Offset: 0xc9c8
// Size: 0x8e
function update_dog_threat(dog) {
    heli = self;
    dog.threatlevel = 0;
    dist = distance(dog.origin, heli.origin);
    dog.threatlevel += (level.heli_visual_range - dist) / level.heli_visual_range * 100;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xf2072deb, Offset: 0xca60
// Size: 0xb8
function missile_valid_target_check(missiletarget) {
    heli2target_normal = vectornormalize(missiletarget.origin - self.origin);
    heli2forward = anglestoforward(self.angles);
    heli2forward_normal = vectornormalize(heli2forward);
    heli_dot_target = vectordot(heli2target_normal, heli2forward_normal);
    if (heli_dot_target >= level.heli_valid_target_cone) {
        return true;
    }
    return false;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xfc6a5fb0, Offset: 0xcb20
// Size: 0x16a
function update_missile_player_threat(player) {
    player.missilethreatlevel = 0;
    dist = distance(player.origin, self.origin);
    player.missilethreatlevel += (level.heli_missile_range - dist) / level.heli_missile_range * 100;
    if (self missile_valid_target_check(player) == 0) {
        player.missilethreatlevel = 1;
        return;
    }
    if (isdefined(self.attacker) && player == self.attacker) {
        player.missilethreatlevel += 100;
    }
    player.missilethreatlevel += player.score * 4;
    if (isdefined(player.antithreat)) {
        player.missilethreatlevel -= player.antithreat;
    }
    if (player.missilethreatlevel <= 0) {
        player.missilethreatlevel = 1;
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xe6f5360c, Offset: 0xcc98
// Size: 0x1a
function update_missile_dog_threat(dog) {
    dog.missilethreatlevel = 1;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x44f9c19c, Offset: 0xccc0
// Size: 0xa8
function function_fff56140(owner, var_4a025683) {
    self notify(#"hash_4363bc1bae999ad3");
    self endon(#"hash_4363bc1bae999ad3", #"death");
    res = owner waittill(#"joined_team", #"disconnect", #"joined_spectators", #"changed_specialist");
    [[ var_4a025683 ]]();
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0x4fd82f9b, Offset: 0xcd70
// Size: 0xd6
function should_not_timeout(killstreak) {
    /#
        assert(isdefined(killstreak), "<dev string:x77>");
        assert(isdefined(level.killstreaks[killstreak]), "<dev string:x299>");
        if (getdvarint(#"hash_e8bb2ce168acce0", 0)) {
            return 1;
        }
        if (isdefined(level.killstreaks[killstreak].devtimeoutdvar)) {
            return getdvarint(level.killstreaks[killstreak].devtimeoutdvar, 0);
        }
    #/
    return 0;
}

// Namespace killstreaks/killstreaks_shared
// Params 6, eflags: 0x0
// Checksum 0x76406f25, Offset: 0xce50
// Size: 0x194
function waitfortimeout(killstreak, duration, callback, endcondition1, endcondition2, endcondition3) {
    /#
        if (should_not_timeout(killstreak)) {
            return;
        }
    #/
    self endon(#"killstreak_hacked", #"cancel_timeout");
    if (isdefined(endcondition1)) {
        self endon(endcondition1);
    }
    if (isdefined(endcondition2)) {
        self endon(endcondition2);
    }
    if (isdefined(endcondition3)) {
        self endon(endcondition3);
    }
    self thread waitfortimeouthacked(killstreak, callback, endcondition1, endcondition2, endcondition3);
    killstreakbundle = level.killstreakbundle[killstreak];
    self.killstreakendtime = gettime() + duration;
    if (isdefined(killstreakbundle) && isdefined(killstreakbundle.kstimeoutbeepduration)) {
        self function_b00e94e0(killstreakbundle, duration);
    } else {
        hostmigration::migrationawarewait(duration);
    }
    self notify(#"kill_waitfortimeouthacked_thread");
    self.killstreaktimedout = 1;
    self.killstreakendtime = 0;
    self notify(#"timed_out");
    self [[ callback ]]();
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x4375c286, Offset: 0xcff0
// Size: 0x44
function function_b00e94e0(killstreakbundle, duration) {
    self waitfortimeoutbeep(killstreakbundle.kstimeoutbeepduration, killstreakbundle.kstimeoutfastbeepduration, duration);
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0xb5a158e6, Offset: 0xd040
// Size: 0x184
function waitfortimeoutbeep(kstimeoutbeepduration, kstimeoutfastbeepduration, duration) {
    self endon(#"death");
    beepduration = int(kstimeoutbeepduration * 1000);
    hostmigration::migrationawarewait(max(duration - beepduration, 0));
    if (isvehicle(self)) {
        self clientfield::set("timeout_beep", 1);
    }
    if (isdefined(kstimeoutfastbeepduration)) {
        fastbeepduration = int(kstimeoutfastbeepduration * 1000);
        hostmigration::migrationawarewait(max(beepduration - fastbeepduration, 0));
        if (isvehicle(self)) {
            self clientfield::set("timeout_beep", 2);
        }
        hostmigration::migrationawarewait(fastbeepduration);
    }
    self function_67bc25ec();
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x1835166, Offset: 0xd1d0
// Size: 0x44
function function_67bc25ec() {
    if (isdefined(self) && isvehicle(self)) {
        self clientfield::set("timeout_beep", 0);
    }
}

// Namespace killstreaks/killstreaks_shared
// Params 5, eflags: 0x0
// Checksum 0xc010d7a1, Offset: 0xd220
// Size: 0xf4
function waitfortimeouthacked(killstreak, callback, endcondition1, endcondition2, endcondition3) {
    self endon(#"kill_waitfortimeouthacked_thread");
    if (isdefined(endcondition1)) {
        self endon(endcondition1);
    }
    if (isdefined(endcondition2)) {
        self endon(endcondition2);
    }
    if (isdefined(endcondition3)) {
        self endon(endcondition3);
    }
    self waittill(#"killstreak_hacked");
    hackedduration = self killstreak_hacking::get_hacked_timeout_duration_ms();
    self.killstreakendtime = gettime() + hackedduration;
    hostmigration::migrationawarewait(hackedduration);
    self.killstreakendtime = 0;
    self notify(#"timed_out");
    self [[ callback ]]();
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x710042bc, Offset: 0xd320
// Size: 0x76
function function_975d45c3() {
    startheight = 200;
    switch (self getstance()) {
    case #"crouch":
        startheight = 30;
        break;
    case #"prone":
        startheight = 15;
        break;
    }
    return startheight;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xa390ab0f, Offset: 0xd3a0
// Size: 0x1a
function set_killstreak_delay_killcam(killstreak_name) {
    self.killstreak_delay_killcam = killstreak_name;
}

// Namespace killstreaks/killstreaks_shared
// Params 0, eflags: 0x0
// Checksum 0x6f81cecf, Offset: 0xd3c8
// Size: 0x1c
function getactivekillstreaks() {
    return self.pers[#"activekillstreaks"];
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xb2df8979, Offset: 0xd3f0
// Size: 0xae
function watchteamchange(teamchangenotify) {
    self notify(teamchangenotify + "_Singleton");
    self endon(teamchangenotify + "_Singleton");
    killstreak = self;
    killstreak endon(#"death", teamchangenotify);
    killstreak.owner waittill(#"joined_team", #"disconnect", #"joined_spectators", #"emp_jammed");
    killstreak notify(teamchangenotify);
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x21edcfd3, Offset: 0xd4a8
// Size: 0x3c
function killstreak_assist(victim, assister, killstreak) {
    victim recordkillstreakassist(victim, assister, killstreak);
}

// Namespace killstreaks/killstreaks_shared
// Params 4, eflags: 0x0
// Checksum 0xd416383a, Offset: 0xd4f0
// Size: 0x122
function add_ricochet_protection(killstreak_id, owner, origin, ricochet_distance) {
    testing = 0;
    /#
        testing = getdvarint(#"scr_ricochet_protection_debug", 0) == 2;
    #/
    if (!level.hardcoremode && !testing) {
        return;
    }
    if (!isdefined(ricochet_distance) || ricochet_distance == 0) {
        return;
    }
    if (!isdefined(owner.ricochet_protection)) {
        owner.ricochet_protection = [];
    }
    owner.ricochet_protection[killstreak_id] = spawnstruct();
    owner.ricochet_protection[killstreak_id].origin = origin;
    owner.ricochet_protection[killstreak_id].distancesq = ricochet_distance * ricochet_distance;
}

// Namespace killstreaks/killstreaks_shared
// Params 3, eflags: 0x0
// Checksum 0x3133257f, Offset: 0xd620
// Size: 0x82
function set_ricochet_protection_endtime(killstreak_id, owner, endtime) {
    if (!isdefined(owner) || !isdefined(owner.ricochet_protection) || !isdefined(killstreak_id)) {
        return;
    }
    if (!isdefined(owner.ricochet_protection[killstreak_id])) {
        return;
    }
    owner.ricochet_protection[killstreak_id].endtime = endtime;
}

// Namespace killstreaks/killstreaks_shared
// Params 2, eflags: 0x0
// Checksum 0x7b41b8ab, Offset: 0xd6b0
// Size: 0x54
function remove_ricochet_protection(killstreak_id, owner) {
    if (!isdefined(owner) || !isdefined(owner.ricochet_protection) || !isdefined(killstreak_id)) {
        return;
    }
    owner.ricochet_protection[killstreak_id] = undefined;
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xf3b712bb, Offset: 0xd710
// Size: 0x24
function thermal_glow(enable) {
    clientfield::set_to_player("thermal_glow", enable);
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xf7a4ed8, Offset: 0xd740
// Size: 0x24
function thermal_glow_enemies_only(enable) {
    clientfield::set_to_player("thermal_glow_enemies_only", enable);
}

// Namespace killstreaks/killstreaks_shared
// Params 1, eflags: 0x0
// Checksum 0xb42c6cec, Offset: 0xd770
// Size: 0x106
function is_ricochet_protected(player) {
    if (!isdefined(player) || !isdefined(player.ricochet_protection)) {
        return false;
    }
    foreach (protection in player.ricochet_protection) {
        if (!isdefined(protection)) {
            continue;
        }
        if (isdefined(protection.endtime) && protection.endtime < gettime()) {
            continue;
        }
        if (distancesquared(protection.origin, player.origin) < protection.distancesq) {
            return true;
        }
    }
    return false;
}

/#

    // Namespace killstreaks/killstreaks_shared
    // Params 0, eflags: 0x0
    // Checksum 0x2dff2cdd, Offset: 0xd880
    // Size: 0x2a8
    function debug_ricochet_protection() {
        debug_wait = 0.5;
        debug_frames = int(debug_wait / float(function_60d95f53()) / 1000) + 1;
        while (true) {
            if (getdvarint(#"scr_ricochet_protection_debug", 0) == 0) {
                wait 2;
                continue;
            }
            wait debug_wait;
            foreach (player in level.players) {
                if (!isdefined(player)) {
                    continue;
                }
                if (!isdefined(player.ricochet_protection)) {
                    continue;
                }
                foreach (protection in player.ricochet_protection) {
                    if (!isdefined(protection)) {
                        continue;
                    }
                    if (isdefined(protection.endtime) && protection.endtime < gettime()) {
                        continue;
                    }
                    radius = sqrt(protection.distancesq);
                    sphere(protection.origin, radius, (1, 1, 0), 0.25, 0, 36, debug_frames);
                    circle(protection.origin, radius, (1, 0.5, 0), 0, 1, debug_frames);
                    circle(protection.origin + (0, 0, 2), radius, (1, 0.5, 0), 0, 1, debug_frames);
                }
            }
        }
    }

#/

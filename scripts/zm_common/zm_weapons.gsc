#using script_43642da1b2402e5c;
#using scripts\abilities\ability_util;
#using scripts\core_common\aat_shared;
#using scripts\core_common\activecamo_shared;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\bb_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\weapons\weapons;
#using scripts\zm\weapons\zm_weap_chakram;
#using scripts\zm\weapons\zm_weap_hammer;
#using scripts\zm\weapons\zm_weap_scepter;
#using scripts\zm\weapons\zm_weap_sword_pistol;
#using scripts\zm_common\bb;
#using scripts\zm_common\gametypes\globallogic_utils;
#using scripts\zm_common\trials\zm_trial_reset_loadout;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_camos;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_melee_weapon;
#using scripts\zm_common\zm_pack_a_punch_util;
#using scripts\zm_common\zm_placeable_mine;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_wallbuy;

#namespace zm_weapons;

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x2
// Checksum 0xd9a7fb13, Offset: 0x290
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_weapons", &__init__, &__main__, undefined);
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x7df4f7e8, Offset: 0x2e0
// Size: 0x166
function __init__() {
    level flag::init("zm_weapons_table_loaded");
    level.weaponnone = getweapon(#"none");
    level.weaponnull = getweapon(#"weapon_null");
    level.weapondefault = getweapon(#"defaultweapon");
    level.weaponbasemelee = getweapon(#"knife");
    if (!isdefined(level.zombie_weapons)) {
        level.zombie_weapons = [];
    }
    if (!isdefined(level.zombie_weapons_upgraded)) {
        level.zombie_weapons_upgraded = [];
    }
    level.limited_weapons = [];
    function_ec38915a();
    level.var_51443ce5 = &get_player_weapondata;
    level.var_bfbdc0cd = &weapondata_give;
    level.var_ee5c0b6e = &function_93cd8e76;
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x83d34315, Offset: 0x450
// Size: 0x14
function __main__() {
    init();
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x23799ba0, Offset: 0x470
// Size: 0x9c
function init() {
    if (!isdefined(level.pack_a_punch_camo_index)) {
        level.pack_a_punch_camo_index = 42;
    }
    level.primary_weapon_array = [];
    level.side_arm_array = [];
    level.grenade_array = [];
    level.inventory_array = [];
    init_weapons();
    level._zombiemode_check_firesale_loc_valid_func = &default_check_firesale_loc_valid_func;
    callback::on_spawned(&on_player_spawned);
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0xa9d9031a, Offset: 0x518
// Size: 0x56
function on_player_spawned() {
    self thread watchforgrenadeduds();
    self thread watchforgrenadelauncherduds();
    self.staticweaponsstarttime = gettime();
    if (!isdefined(self.var_f6d3c3)) {
        self.var_f6d3c3 = [];
    }
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x868ccc04, Offset: 0x578
// Size: 0x184
function function_ec38915a() {
    if (!isdefined(level.var_5a069e6)) {
        level.var_5a069e6 = [];
    }
    if (!isdefined(level.var_44e0d625)) {
        level.var_44e0d625 = [];
    }
    function_8005e7f3(getweapon(#"smg_handling_t8"), getweapon(#"smg_handling_t8_dw"));
    function_8005e7f3(getweapon(#"smg_handling_t8_upgraded"), getweapon(#"smg_handling_t8_upgraded_dw"));
    function_8005e7f3(getweapon(#"special_ballisticknife_t8_dw"), getweapon(#"special_ballisticknife_t8_dw_dw"));
    function_8005e7f3(getweapon(#"special_ballisticknife_t8_dw_upgraded"), getweapon(#"special_ballisticknife_t8_dw_upgraded_dw"));
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0x6c786f73, Offset: 0x708
// Size: 0x6e
function function_8005e7f3(w_base, var_ebc2aad) {
    if (w_base != level.weaponnone && var_ebc2aad != level.weaponnone) {
        level.var_5a069e6[w_base] = var_ebc2aad;
        level.var_44e0d625[var_ebc2aad] = w_base;
    }
}

// Namespace zm_weapons/player_gunchallengecomplete
// Params 1, eflags: 0x40
// Checksum 0xa9d92e3d, Offset: 0x780
// Size: 0x1bc
function event_handler[player_gunchallengecomplete] player_gunchallengecomplete(s_event) {
    if (s_event.is_lastrank) {
        var_8e617ca1 = 0;
        a_w_guns = get_guns();
        foreach (weapon in a_w_guns) {
            str_weapon = weapon.name;
            n_item_index = getbaseweaponitemindex(weapon);
            var_cc074f5b = stats::get_stat(#"ranked_item_stats", str_weapon, #"xp");
            if (isdefined(var_cc074f5b)) {
                var_6b792d1d = function_33cc663e(str_weapon);
                var_56ccc9fe = stats::get_stat(#"ranked_item_stats", str_weapon, #"plevel");
                if (var_cc074f5b >= var_6b792d1d || var_56ccc9fe >= 1) {
                    var_8e617ca1++;
                }
            }
        }
        if (var_8e617ca1 >= 25) {
            zm_utility::giveachievement_wrapper("zm_trophy_gold");
        }
    }
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x839431eb, Offset: 0x948
// Size: 0x158
function get_guns() {
    a_w_guns = [];
    foreach (s_weapon in level.zombie_weapons) {
        switch (s_weapon.weapon_classname) {
        case 0:
        case #"equipment":
        case #"shield":
        case #"melee":
            continue;
        }
        if (is_wonder_weapon(s_weapon.weapon)) {
            continue;
        }
        if (!isdefined(a_w_guns)) {
            a_w_guns = [];
        } else if (!isarray(a_w_guns)) {
            a_w_guns = array(a_w_guns);
        }
        a_w_guns[a_w_guns.size] = s_weapon.weapon;
    }
    return a_w_guns;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x6f12f579, Offset: 0xaa8
// Size: 0xb4
function function_14590040(str_weapon) {
    var_9bea1b6 = [];
    for (i = 0; i < 16; i++) {
        var_4a3def14 = tablelookup(#"gamedata/weapons/zm/zm_gunlevels.csv", 2, str_weapon, 0, i, 1);
        if ("" == var_4a3def14) {
            break;
        }
        var_9bea1b6[i] = int(var_4a3def14);
    }
    return var_9bea1b6;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x1b654af7, Offset: 0xb68
// Size: 0x40
function function_33cc663e(str_weapon) {
    var_9bea1b6 = function_14590040(str_weapon);
    return var_9bea1b6[var_9bea1b6.size - 1];
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x8afc916a, Offset: 0xbb0
// Size: 0xd8
function watchforgrenadeduds() {
    self endon(#"death", #"disconnect");
    while (true) {
        waitresult = self waittill(#"grenade_fire");
        grenade = waitresult.projectile;
        weapon = waitresult.weapon;
        if (!zm_equipment::is_equipment(weapon) && !zm_loadout::is_placeable_mine(weapon)) {
            grenade thread checkgrenadefordud(weapon, 1, self);
        }
    }
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x2fe199f6, Offset: 0xc90
// Size: 0xa8
function watchforgrenadelauncherduds() {
    self endon(#"death", #"disconnect");
    while (true) {
        waitresult = self waittill(#"grenade_launcher_fire");
        grenade = waitresult.projectile;
        weapon = waitresult.weapon;
        grenade thread checkgrenadefordud(weapon, 0, self);
    }
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xd45f590e, Offset: 0xd40
// Size: 0x40
function grenade_safe_to_throw(player, weapon) {
    if (isdefined(level.grenade_safe_to_throw)) {
        return self [[ level.grenade_safe_to_throw ]](player, weapon);
    }
    return 1;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xa4ecef2c, Offset: 0xd88
// Size: 0x40
function grenade_safe_to_bounce(player, weapon) {
    if (isdefined(level.grenade_safe_to_bounce)) {
        return self [[ level.grenade_safe_to_bounce ]](player, weapon);
    }
    return 1;
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x4718cbca, Offset: 0xdd0
// Size: 0x64
function makegrenadedudanddestroy() {
    self endon(#"death");
    self notify(#"grenade_dud");
    self makegrenadedud();
    wait 3;
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace zm_weapons/zm_weapons
// Params 3, eflags: 0x0
// Checksum 0x63610df7, Offset: 0xe40
// Size: 0x102
function checkgrenadefordud(weapon, isthrowngrenade, player) {
    self endon(#"death");
    player endon(#"zombify");
    if (!isdefined(self)) {
        return;
    }
    if (!self grenade_safe_to_throw(player, weapon)) {
        self thread makegrenadedudanddestroy();
        return;
    }
    for (;;) {
        self waittilltimeout(0.25, #"grenade_bounce", #"stationary", #"death", #"zombify");
        if (!self grenade_safe_to_bounce(player, weapon)) {
            self thread makegrenadedudanddestroy();
            return;
        }
    }
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x460c80d9, Offset: 0xf50
// Size: 0x3c
function get_nonalternate_weapon(weapon) {
    if (isdefined(weapon.isaltmode) && weapon.isaltmode) {
        return weapon.altweapon;
    }
    return weapon;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x8f91c57f, Offset: 0xf98
// Size: 0x4a
function function_af29d744(weapon) {
    if (isdefined(weapon)) {
        if (weapon.isaltmode) {
            weapon = weapon.altweapon;
        }
        weapon = function_386dacbc(weapon);
    }
    return weapon;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0x1dcb32fc, Offset: 0xff0
// Size: 0x92
function function_93cd8e76(weapon, var_1011fc73 = 0) {
    if (weapon.inventorytype == "dwlefthand") {
        weapon = weapon.dualwieldweapon;
    }
    weapon = function_af29d744(weapon);
    if (var_1011fc73 && isdefined(level.zombie_weapons_upgraded[weapon])) {
        return level.zombie_weapons_upgraded[weapon];
    }
    return weapon;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xa4861721, Offset: 0x1090
// Size: 0xa8
function switch_from_alt_weapon(weapon) {
    if (weapon.ischargeshot) {
        return weapon;
    }
    alt = get_nonalternate_weapon(weapon);
    if (alt != weapon) {
        if (!weaponhasattachment(weapon, "dualoptic")) {
            self switchtoweaponimmediate(alt);
            self waittilltimeout(1, #"weapon_change_complete");
        }
        return alt;
    }
    return weapon;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xa606c387, Offset: 0x1140
// Size: 0xcc
function give_start_weapons(takeallweapons, alreadyspawned) {
    if (isdefined(self.s_loadout) && zombie_utility::get_zombie_var("retain_weapons") && zm_custom::function_901b751c(#"zmretainweapons")) {
        self player_give_loadout(self.s_loadout, 1, 0);
        self.s_loadout = undefined;
        return;
    }
    self zm_loadout::give_start_weapon(1);
    self zm_loadout::init_player_offhand_weapons();
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xa8d7c786, Offset: 0x1218
// Size: 0x2c
function give_fallback_weapon(immediate = 0) {
    zm_melee_weapon::give_fallback_weapon(immediate);
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x48138b35, Offset: 0x1250
// Size: 0x14
function take_fallback_weapon() {
    zm_melee_weapon::take_fallback_weapon();
}

// Namespace zm_weapons/zm_weapons
// Params 3, eflags: 0x0
// Checksum 0xbbd39943, Offset: 0x1270
// Size: 0x254
function switch_back_primary_weapon(oldprimary, immediate = 0, var_6d4494f9 = 0) {
    if (isdefined(self.laststand) && self.laststand) {
        return;
    }
    if (!isdefined(oldprimary) || oldprimary == level.weaponnone || oldprimary.isflourishweapon || zm_loadout::is_melee_weapon(oldprimary) || zm_loadout::is_placeable_mine(oldprimary) || zm_loadout::is_lethal_grenade(oldprimary) || zm_loadout::is_tactical_grenade(oldprimary, !var_6d4494f9) || !self hasweapon(oldprimary)) {
        oldprimary = undefined;
    } else if ((oldprimary.isheroweapon || oldprimary.isgadget) && (!isdefined(self.hero_power) || self.hero_power <= 0)) {
        oldprimary = undefined;
    }
    primaryweapons = self getweaponslistprimaries();
    if (isdefined(oldprimary) && (isinarray(primaryweapons, oldprimary) || oldprimary.isriotshield && var_6d4494f9)) {
        if (immediate) {
            self switchtoweaponimmediate(oldprimary);
        } else {
            self switchtoweapon(oldprimary);
        }
        return;
    }
    if (primaryweapons.size > 0) {
        if (immediate) {
            self switchtoweaponimmediate();
        } else {
            self switchtoweapon();
        }
        return;
    }
    give_fallback_weapon(immediate);
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x7b4efe42, Offset: 0x14d0
// Size: 0x9c
function updatelastheldweapontimingszm(newtime) {
    if (isdefined(self.currentweapon) && isdefined(self.currenttime)) {
        curweapon = self.currentweapon;
        totaltime = int((newtime - self.currenttime) / 1000);
        if (totaltime > 0) {
            self stats::function_e24eec31(curweapon, #"timeused", totaltime);
        }
    }
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xac15c9c3, Offset: 0x1578
// Size: 0x8e
function updateweapontimingszm(newtime) {
    if (isbot(self)) {
        return;
    }
    updatelastheldweapontimingszm(newtime);
    if (!isdefined(self.staticweaponsstarttime)) {
        return;
    }
    totaltime = int((newtime - self.staticweaponsstarttime) / 1000);
    if (totaltime < 0) {
        return;
    }
    self.staticweaponsstarttime = newtime;
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x3a274aac, Offset: 0x1610
// Size: 0x8
function default_check_firesale_loc_valid_func() {
    return true;
}

// Namespace zm_weapons/zm_weapons
// Params 12, eflags: 0x0
// Checksum 0xd1405f, Offset: 0x1620
// Size: 0x3a0
function add_zombie_weapon(weapon_name, upgrade_name, is_ee, cost, weaponvo, weaponvoresp, ammo_cost, create_vox, weapon_class, is_wonder_weapon, tier = 0, in_box) {
    weapon = getweapon(weapon_name);
    upgrade = undefined;
    if (isdefined(upgrade_name)) {
        upgrade = getweapon(upgrade_name);
    }
    if (isdefined(level.zombie_include_weapons) && !isdefined(level.zombie_include_weapons[weapon])) {
        return;
    }
    struct = spawnstruct();
    if (!isdefined(level.zombie_weapons)) {
        level.zombie_weapons = [];
    }
    if (!isdefined(level.zombie_weapons_upgraded)) {
        level.zombie_weapons_upgraded = [];
    }
    if (isdefined(upgrade_name)) {
        level.zombie_weapons_upgraded[upgrade] = weapon;
    }
    struct.weapon = weapon;
    struct.upgrade = upgrade;
    struct.weapon_classname = weapon_class;
    if (function_8b1a219a()) {
        struct.hint = #"hash_2791ecebb85142c4";
    } else {
        struct.hint = #"hash_60606b68e93a29c8";
    }
    struct.cost = cost;
    struct.vox = weaponvo;
    struct.vox_response = weaponvoresp;
    struct.is_wonder_weapon = is_wonder_weapon;
    struct.tier = tier;
    println("<dev string:x38>" + function_9e72a96(weapon_name));
    struct.is_in_box = level.zombie_include_weapons[weapon];
    if (!isdefined(ammo_cost) || ammo_cost == 0) {
        ammo_cost = zm_utility::round_up_to_ten(int(cost * 0.5));
    }
    struct.ammo_cost = ammo_cost;
    if (weapon.isemp || isdefined(upgrade) && upgrade.isemp) {
        level.should_watch_for_emp = 1;
    }
    level.zombie_weapons[weapon] = struct;
    if (isdefined(create_vox)) {
    }
    /#
        if (isdefined(level.devgui_add_weapon) && (!is_ee || getdvarint(#"zm_debug_ee", 0))) {
            level thread [[ level.devgui_add_weapon ]](weapon, upgrade, in_box, cost, weaponvo, weaponvoresp, ammo_cost);
        }
    #/
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x546f926d, Offset: 0x19c8
// Size: 0x56
function is_weapon_included(weapon) {
    if (!isdefined(level.zombie_weapons)) {
        return false;
    }
    weapon = get_nonalternate_weapon(weapon);
    return isdefined(level.zombie_weapons[function_386dacbc(weapon)]);
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x13b76d7a, Offset: 0x1a28
// Size: 0x68
function is_weapon_or_base_included(weapon) {
    weapon = get_nonalternate_weapon(weapon);
    return isdefined(level.zombie_weapons[function_386dacbc(weapon)]) || isdefined(level.zombie_weapons[get_base_weapon(weapon)]);
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xebac861, Offset: 0x1a98
// Size: 0x9a
function include_zombie_weapon(weapon_name, in_box) {
    if (!isdefined(level.zombie_include_weapons)) {
        level.zombie_include_weapons = [];
    }
    if (!isdefined(in_box)) {
        in_box = 1;
    }
    println("<dev string:x56>" + function_9e72a96(weapon_name));
    level.zombie_include_weapons[getweapon(weapon_name)] = in_box;
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x78b0ed04, Offset: 0x1b40
// Size: 0x146
function init_weapons() {
    level.var_c60359dc = [];
    var_8e01336 = getdvarint(#"hash_4fdf506c770b343", 0);
    switch (var_8e01336) {
    case 1:
        var_4ef031c9 = #"hash_5694d3fa5334f8fe";
        break;
    case 2:
        var_4ef031c9 = #"hash_3f8d28bb3d9e9bec";
        break;
    default:
        var_4ef031c9 = #"hash_7bda40310359350e";
        break;
    }
    load_weapon_spec_from_table(var_4ef031c9, 0);
    if (isdefined(level.var_d0ab70a2)) {
        load_weapon_spec_from_table(level.var_d0ab70a2, 0);
    }
    level flag::set("zm_weapons_table_loaded");
    level.var_c60359dc = undefined;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0x6d5b4deb, Offset: 0x1c90
// Size: 0x4a
function add_limited_weapon(weapon_name, amount) {
    if (amount == 0) {
        return;
    }
    level.limited_weapons[getweapon(weapon_name)] = amount;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0x86bd38b5, Offset: 0x1ce8
// Size: 0x48c
function limited_weapon_below_quota(weapon, ignore_player) {
    if (isdefined(level.limited_weapons[weapon])) {
        pap_machines = undefined;
        if (!isdefined(pap_machines)) {
            pap_machines = getentarray("zm_pack_a_punch", "targetname");
        }
        if (isdefined(level.no_limited_weapons) && level.no_limited_weapons) {
            return false;
        }
        upgradedweapon = weapon;
        if (isdefined(level.zombie_weapons[weapon]) && isdefined(level.zombie_weapons[weapon].upgrade)) {
            upgradedweapon = level.zombie_weapons[weapon].upgrade;
        }
        players = getplayers();
        count = 0;
        limit = level.limited_weapons[weapon];
        for (i = 0; i < players.size; i++) {
            if (isdefined(ignore_player) && ignore_player == players[i]) {
                continue;
            }
            if (players[i] has_weapon_or_upgrade(weapon)) {
                count++;
                if (count >= limit) {
                    return false;
                }
            }
        }
        foreach (machine in pap_machines) {
            if (!isdefined(machine)) {
                continue;
            }
            if (!isdefined(machine.unitrigger_stub)) {
                continue;
            }
            if (isdefined(machine.unitrigger_stub.current_weapon) && (machine.unitrigger_stub.current_weapon == weapon || machine.unitrigger_stub.current_weapon == upgradedweapon)) {
                count++;
                if (count >= limit) {
                    return false;
                }
            }
        }
        foreach (chest in level.chests) {
            if (!isdefined(chest)) {
                continue;
            }
            if (!isdefined(chest.zbarrier)) {
                continue;
            }
            if (isdefined(chest.zbarrier.weapon) && chest.zbarrier.weapon == weapon) {
                count++;
                if (count >= limit) {
                    return false;
                }
            }
        }
        if (isdefined(level.custom_limited_weapon_checks)) {
            foreach (check in level.custom_limited_weapon_checks) {
                count += [[ check ]](weapon);
            }
            if (count >= limit) {
                return false;
            }
        }
        if (isdefined(level.random_weapon_powerups)) {
            for (powerupindex = 0; powerupindex < level.random_weapon_powerups.size; powerupindex++) {
                if (isdefined(level.random_weapon_powerups[powerupindex]) && level.random_weapon_powerups[powerupindex].base_weapon == weapon) {
                    count++;
                    if (count >= limit) {
                        return false;
                    }
                }
            }
        }
    }
    return true;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xcd54f8e6, Offset: 0x2180
// Size: 0x46
function add_custom_limited_weapon_check(callback) {
    if (!isdefined(level.custom_limited_weapon_checks)) {
        level.custom_limited_weapon_checks = [];
    }
    level.custom_limited_weapon_checks[level.custom_limited_weapon_checks.size] = callback;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xf18ae1c, Offset: 0x21d0
// Size: 0x5a
function add_weapon_to_content(weapon_name, package) {
    if (!isdefined(level.content_weapons)) {
        level.content_weapons = [];
    }
    level.content_weapons[getweapon(weapon_name)] = package;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xdc30a685, Offset: 0x2238
// Size: 0x58
function player_can_use_content(weapon) {
    if (isdefined(level.content_weapons)) {
        if (isdefined(level.content_weapons[weapon])) {
            return self hasdlcavailable(level.content_weapons[weapon]);
        }
    }
    return 1;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xbc708a55, Offset: 0x2298
// Size: 0x72
function get_weapon_hint(weapon) {
    assert(isdefined(level.zombie_weapons[weapon]), function_9e72a96(weapon.name) + "<dev string:x72>");
    return level.zombie_weapons[weapon].hint;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xe0242ace, Offset: 0x2318
// Size: 0x72
function get_weapon_cost(weapon) {
    assert(isdefined(level.zombie_weapons[weapon]), function_9e72a96(weapon.name) + "<dev string:x72>");
    return level.zombie_weapons[weapon].cost;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x4d62bd05, Offset: 0x2398
// Size: 0x72
function get_ammo_cost(weapon) {
    assert(isdefined(level.zombie_weapons[weapon]), function_9e72a96(weapon.name) + "<dev string:x72>");
    return level.zombie_weapons[weapon].ammo_cost;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x9ed22387, Offset: 0x2418
// Size: 0x94
function get_upgraded_ammo_cost(weapon) {
    assert(isdefined(level.zombie_weapons[weapon]), function_9e72a96(weapon.name) + "<dev string:x72>");
    if (isdefined(level.zombie_weapons[weapon].upgraded_ammo_cost)) {
        return level.zombie_weapons[weapon].upgraded_ammo_cost;
    }
    return 4500;
}

// Namespace zm_weapons/zm_weapons
// Params 3, eflags: 0x0
// Checksum 0xbb2a54b8, Offset: 0x24b8
// Size: 0x192
function get_ammo_cost_for_weapon(w_current, n_base_non_wallbuy_cost = 750, n_upgraded_non_wallbuy_cost = 5000) {
    w_root = function_386dacbc(w_current);
    if (is_weapon_upgraded(w_root)) {
        w_root = get_base_weapon(w_root);
    }
    is_wonder_weapon = is_wonder_weapon(w_root);
    if (self has_upgrade(w_root)) {
        if (zm_wallbuy::is_wallbuy(w_root)) {
            n_ammo_cost = 4000;
        } else if (is_wonder_weapon) {
            n_ammo_cost = 7500;
        } else {
            n_ammo_cost = n_upgraded_non_wallbuy_cost;
        }
    } else if (zm_wallbuy::is_wallbuy(w_root)) {
        n_ammo_cost = get_ammo_cost(w_root);
        n_ammo_cost = zm_utility::halve_score(n_ammo_cost);
    } else if (is_wonder_weapon) {
        n_ammo_cost = 4000;
    } else {
        n_ammo_cost = n_base_non_wallbuy_cost;
    }
    return n_ammo_cost;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x3269ab61, Offset: 0x2658
// Size: 0x5a
function get_is_in_box(weapon) {
    assert(isdefined(level.zombie_weapons[weapon]), weapon.name + "<dev string:x72>");
    return level.zombie_weapons[weapon].is_in_box;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x3e882eef, Offset: 0x26c0
// Size: 0x74
function function_603af7a8(weapon) {
    if (isdefined(level.zombie_weapons[weapon])) {
        level.zombie_weapons[weapon].is_in_box = 1;
    }
    /#
        level thread zm_devgui::function_bcc8843e(getweaponname(weapon), "<dev string:xb0>", "<dev string:xb0>");
    #/
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x77320d63, Offset: 0x2740
// Size: 0x3e
function function_f1114209(weapon) {
    if (isdefined(level.zombie_weapons[weapon])) {
        level.zombie_weapons[weapon].is_in_box = 0;
    }
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xc0982dc5, Offset: 0x2788
// Size: 0x4a
function weapon_supports_default_attachment(weapon) {
    weapon = get_base_weapon(weapon);
    attachment = level.zombie_weapons[weapon].default_attachment;
    return isdefined(attachment);
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x3d3cfb12, Offset: 0x27e0
// Size: 0x60
function default_attachment(weapon) {
    weapon = get_base_weapon(weapon);
    attachment = level.zombie_weapons[weapon].default_attachment;
    if (isdefined(attachment)) {
        return attachment;
    }
    return "none";
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x74893da9, Offset: 0x2848
// Size: 0x5c
function weapon_supports_attachments(weapon) {
    weapon = get_base_weapon(weapon);
    attachments = level.zombie_weapons[weapon].addon_attachments;
    return isdefined(attachments) && attachments.size > 1;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0x5a978841, Offset: 0x28b0
// Size: 0x14a
function random_attachment(weapon, exclude) {
    lo = 0;
    if (isdefined(level.zombie_weapons[weapon].addon_attachments) && level.zombie_weapons[weapon].addon_attachments.size > 0) {
        attachments = level.zombie_weapons[weapon].addon_attachments;
    } else {
        attachments = weapon.supportedattachments;
        lo = 1;
    }
    minatt = lo;
    if (isdefined(exclude) && exclude != "none") {
        minatt = lo + 1;
    }
    if (attachments.size > minatt) {
        while (true) {
            idx = randomint(attachments.size - lo) + lo;
            if (!isdefined(exclude) || attachments[idx] != exclude) {
                return attachments[idx];
            }
        }
    }
    return "none";
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x3b5a918f, Offset: 0x2a08
// Size: 0x148
function get_attachment_index(weapon) {
    attachments = weapon.attachments;
    if (!attachments.size) {
        return -1;
    }
    weapon = get_nonalternate_weapon(weapon);
    base = function_386dacbc(weapon);
    if (attachments[0] === level.zombie_weapons[base].default_attachment) {
        return 0;
    }
    if (isdefined(level.zombie_weapons[base].addon_attachments)) {
        for (i = 0; i < level.zombie_weapons[base].addon_attachments.size; i++) {
            if (level.zombie_weapons[base].addon_attachments[i] == attachments[0]) {
                return (i + 1);
            }
        }
    }
    println("<dev string:xb3>" + weapon.name);
    return -1;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xc0cdd154, Offset: 0x2b58
// Size: 0xf0
function weapon_supports_this_attachment(weapon, att) {
    weapon = get_nonalternate_weapon(weapon);
    base = function_386dacbc(weapon);
    if (att == level.zombie_weapons[base].default_attachment) {
        return true;
    }
    if (isdefined(level.zombie_weapons[base].addon_attachments)) {
        for (i = 0; i < level.zombie_weapons[base].addon_attachments.size; i++) {
            if (level.zombie_weapons[base].addon_attachments[i] == att) {
                return true;
            }
        }
    }
    return false;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x696678e8, Offset: 0x2c50
// Size: 0x66
function get_base_weapon(upgradedweapon) {
    upgradedweapon = get_nonalternate_weapon(upgradedweapon);
    upgradedweapon = function_386dacbc(upgradedweapon);
    if (isdefined(level.zombie_weapons_upgraded[upgradedweapon])) {
        return level.zombie_weapons_upgraded[upgradedweapon];
    }
    return upgradedweapon;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0x1324b255, Offset: 0x2cc0
// Size: 0x1da
function get_upgrade_weapon(weapon, add_attachment) {
    weapon = get_nonalternate_weapon(weapon);
    rootweapon = function_386dacbc(weapon);
    newweapon = rootweapon;
    baseweapon = get_base_weapon(weapon);
    if (!is_weapon_upgraded(rootweapon) && isdefined(level.zombie_weapons[rootweapon])) {
        newweapon = level.zombie_weapons[rootweapon].upgrade;
    } else if (!zm_custom::function_901b751c(#"zmsuperpapenabled")) {
        return weapon;
    }
    /#
        if (isdefined(self.var_8d5839f4) && isinarray(self.var_8d5839f4, weapon) && weapon.attachments.size) {
            newweapon = getweapon(newweapon.name, weapon.attachments);
            return newweapon;
        }
    #/
    if (isdefined(level.zombie_weapons[rootweapon]) && isdefined(level.zombie_weapons[rootweapon].default_attachment)) {
        att = level.zombie_weapons[rootweapon].default_attachment;
        newweapon = getweapon(newweapon.name, att);
    }
    return newweapon;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xf8beadbd, Offset: 0x2ea8
// Size: 0xe2
function can_upgrade_weapon(weapon) {
    if (weapon == level.weaponnone || weapon == level.weaponzmfists || !is_weapon_included(weapon)) {
        return false;
    }
    weapon = get_nonalternate_weapon(weapon);
    rootweapon = function_386dacbc(weapon);
    if (!is_weapon_upgraded(rootweapon)) {
        upgraded_weapon = level.zombie_weapons[rootweapon].upgrade;
        return (isdefined(upgraded_weapon) && upgraded_weapon != level.weaponnone);
    }
    return false;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x1a9045a7, Offset: 0x2f98
// Size: 0xa6
function weapon_supports_aat(weapon) {
    if (!zm_custom::function_901b751c(#"zmsuperpapenabled")) {
        return false;
    }
    if (!isdefined(weapon)) {
        return false;
    }
    if (weapon == level.weaponnone || weapon == level.weaponzmfists) {
        return false;
    }
    weapontopack = get_nonalternate_weapon(weapon);
    if (!aat::is_exempt_weapon(weapontopack)) {
        return true;
    }
    return false;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xab91e5c2, Offset: 0x3048
// Size: 0x9a
function is_weapon_upgraded(weapon) {
    if (!isdefined(weapon)) {
        return false;
    }
    if (weapon == level.weaponnone || weapon == level.weaponzmfists) {
        return false;
    }
    weapon = get_nonalternate_weapon(weapon);
    rootweapon = function_386dacbc(weapon);
    if (isdefined(level.zombie_weapons_upgraded[rootweapon])) {
        return true;
    }
    return false;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xd251e8e0, Offset: 0x30f0
// Size: 0xbe
function get_weapon_with_attachments(weapon) {
    weapon = get_nonalternate_weapon(weapon);
    rootweapon = function_386dacbc(weapon);
    if (self has_weapon_or_attachments(rootweapon)) {
        /#
            if (isdefined(self.var_8d5839f4) && isinarray(self.var_8d5839f4, weapon) && weapon.attachments.size) {
                return weapon;
            }
        #/
        return self getbuildkitweapon(rootweapon);
    }
    return undefined;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x1e6dae9a, Offset: 0x31b8
// Size: 0x6e
function has_weapon_or_attachments(weapon) {
    if (self hasweapon(weapon, 1)) {
        return true;
    } else if (self hasweapon(self getbuildkitweapon(weapon), 1)) {
        return true;
    }
    return false;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x147b3a4d, Offset: 0x3230
// Size: 0x4c
function function_386dacbc(weapon) {
    rootweapon = weapon.rootweapon;
    if (isdefined(level.var_44e0d625[rootweapon])) {
        rootweapon = level.var_44e0d625[rootweapon];
    }
    return rootweapon;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xba098011, Offset: 0x3288
// Size: 0xb2
function has_upgrade(weapon) {
    weapon = get_nonalternate_weapon(weapon);
    rootweapon = function_386dacbc(weapon);
    has_upgrade = 0;
    if (isdefined(level.zombie_weapons[rootweapon]) && isdefined(level.zombie_weapons[rootweapon].upgrade)) {
        has_upgrade = self has_weapon_or_attachments(level.zombie_weapons[rootweapon].upgrade);
    }
    return has_upgrade;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x90063408, Offset: 0x3348
// Size: 0x132
function has_weapon_or_upgrade(weapon) {
    weapon = get_nonalternate_weapon(weapon);
    rootweapon = function_386dacbc(weapon);
    upgradedweaponname = rootweapon;
    if (isdefined(level.zombie_weapons[rootweapon]) && isdefined(level.zombie_weapons[rootweapon].upgrade)) {
        upgradedweaponname = level.zombie_weapons[rootweapon].upgrade;
    }
    has_weapon = 0;
    if (isdefined(level.zombie_weapons[rootweapon])) {
        has_weapon = self has_weapon_or_attachments(rootweapon) || self has_upgrade(rootweapon);
    }
    if (!has_weapon && zm_equipment::is_equipment(rootweapon)) {
        has_weapon = self zm_equipment::is_active(rootweapon);
    }
    return has_weapon;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xf8d35138, Offset: 0x3488
// Size: 0x32
function add_shared_ammo_weapon(weapon, base_weapon) {
    level.zombie_weapons[weapon].shared_ammo_weapon = base_weapon;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x9632ae39, Offset: 0x34c8
// Size: 0x176
function get_shared_ammo_weapon(weapon) {
    weapon = get_nonalternate_weapon(weapon);
    rootweapon = function_386dacbc(weapon);
    weapons = self getweaponslist(1);
    foreach (w in weapons) {
        w = function_386dacbc(w);
        if (!isdefined(level.zombie_weapons[w]) && isdefined(level.zombie_weapons_upgraded[w])) {
            w = level.zombie_weapons_upgraded[w];
        }
        if (isdefined(level.zombie_weapons[w]) && isdefined(level.zombie_weapons[w].shared_ammo_weapon) && level.zombie_weapons[w].shared_ammo_weapon == rootweapon) {
            return w;
        }
    }
    return undefined;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xe5d12b13, Offset: 0x3648
// Size: 0x132
function get_player_weapon_with_same_base(weapon) {
    if (isdefined(level.var_ee565b3f)) {
        retweapon = [[ level.var_ee565b3f ]](weapon);
        if (isdefined(retweapon)) {
            return retweapon;
        }
    }
    weapon = get_nonalternate_weapon(weapon);
    rootweapon = function_386dacbc(weapon);
    retweapon = self get_weapon_with_attachments(rootweapon);
    if (!isdefined(retweapon)) {
        if (isdefined(level.zombie_weapons[rootweapon])) {
            if (isdefined(level.zombie_weapons[rootweapon].upgrade)) {
                retweapon = self get_weapon_with_attachments(level.zombie_weapons[rootweapon].upgrade);
            }
        } else if (isdefined(level.zombie_weapons_upgraded[rootweapon])) {
            retweapon = self get_weapon_with_attachments(level.zombie_weapons_upgraded[rootweapon]);
        }
    }
    return retweapon;
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0xa4c7b600, Offset: 0x3788
// Size: 0x34
function get_weapon_hint_ammo() {
    if (function_8b1a219a()) {
        return #"hash_2791ecebb85142c4";
    }
    return #"hash_60606b68e93a29c8";
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0x81c73c1a, Offset: 0x37c8
// Size: 0x3c
function weapon_set_first_time_hint(cost, ammo_cost) {
    self sethintstring(get_weapon_hint_ammo());
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x5f59a1c1, Offset: 0x3810
// Size: 0x198
function get_pack_a_punch_weapon_options(weapon) {
    if (!isdefined(self.pack_a_punch_weapon_options)) {
        self.pack_a_punch_weapon_options = [];
    }
    if (!is_weapon_upgraded(weapon)) {
        return self calcweaponoptions(0, 0, 0, 0, 0);
    }
    if (isdefined(self.pack_a_punch_weapon_options[weapon])) {
        return self.pack_a_punch_weapon_options[weapon];
    }
    camo_index = self zm_camos::function_4f727cf5(weapon);
    reticle_index = randomintrange(0, 16);
    var_eb2e3f90 = 0;
    plain_reticle_index = 16;
    use_plain = randomint(10) < 1;
    if (use_plain) {
        reticle_index = plain_reticle_index;
    }
    /#
        if (getdvarint(#"scr_force_reticle_index", 0) >= 0) {
            reticle_index = getdvarint(#"scr_force_reticle_index", 0);
        }
    #/
    self.pack_a_punch_weapon_options[weapon] = self calcweaponoptions(camo_index, reticle_index, var_eb2e3f90);
    return self.pack_a_punch_weapon_options[weapon];
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x39ca88e8, Offset: 0x39b0
// Size: 0xa4
function function_17512fb3() {
    lethal_grenade = self zm_loadout::get_player_lethal_grenade();
    if (!self hasweapon(lethal_grenade)) {
        self giveweapon(lethal_grenade);
        self setweaponammoclip(lethal_grenade, 0);
        self switchtooffhand(lethal_grenade);
        self ability_util::gadget_reset(lethal_grenade, 0, 0, 1, 0);
    }
}

// Namespace zm_weapons/zm_weapons
// Params 4, eflags: 0x0
// Checksum 0x2a735f33, Offset: 0x3a60
// Size: 0x338
function give_build_kit_weapon(weapon, var_51ec4e93, var_bd5d43c6, b_switch_weapon = 1) {
    if (isdefined(var_51ec4e93)) {
        n_camo = var_51ec4e93;
    } else {
        n_camo = self zm_camos::function_79be4786(weapon);
    }
    base_weapon = weapon;
    if (is_weapon_upgraded(weapon)) {
        level notify(#"hash_6dead3931d3e708a", {#player:self, #weapon:weapon});
        if (!isdefined(n_camo)) {
            n_camo = self zm_camos::function_4f727cf5(weapon);
        }
        base_weapon = get_base_weapon(weapon);
    }
    /#
        if (isdefined(self.var_8d5839f4) && isinarray(self.var_8d5839f4, weapon) && weapon.attachments.size) {
            if (!isdefined(n_camo)) {
                n_camo = 0;
            }
            weapon_options = self calcweaponoptions(n_camo, 0, 0);
            self giveweapon(weapon, weapon_options);
            return weapon;
        }
    #/
    weapon = self getbuildkitweapon(weapon);
    weapon = function_1242e467(weapon);
    w_root = function_386dacbc(weapon);
    weapon_options = self getbuildkitweaponoptions(w_root, n_camo, var_bd5d43c6);
    if (!isdefined(n_camo)) {
        n_camo = getcamoindex(weapon_options);
    }
    if (!(isdefined(b_switch_weapon) && b_switch_weapon)) {
        self.var_57c1d146[weapon] = 1;
    }
    self giveweapon(weapon, weapon_options);
    if (!self hasweapon(weapon)) {
        return weapon;
    }
    var_35dbd2be = self function_9826b353(w_root);
    if (isdefined(var_35dbd2be) && var_35dbd2be >= 0) {
        self function_3fb8b14(weapon, var_35dbd2be);
    }
    var_502dadb4 = self function_74829bcf(w_root);
    if (isdefined(var_502dadb4) && var_502dadb4 >= 0) {
        self function_a85d2581(weapon, var_502dadb4);
    }
    return weapon;
}

// Namespace zm_weapons/zm_weapons
// Params 5, eflags: 0x0
// Checksum 0x68d8c56f, Offset: 0x3da0
// Size: 0xc8
function weapon_give(weapon, nosound = 0, b_switch_weapon = 1, var_51ec4e93, var_bd5d43c6) {
    if (!(isdefined(nosound) && nosound)) {
        self zm_utility::play_sound_on_ent("purchase");
    }
    weapon = self give_build_kit_weapon(weapon, var_51ec4e93, var_bd5d43c6, b_switch_weapon);
    if (!(isdefined(nosound) && nosound)) {
        self play_weapon_vo(weapon);
    }
    return weapon;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xb70bd707, Offset: 0x3e70
// Size: 0x3c
function weapon_take(weapon) {
    if (self hasweapon(weapon)) {
        self takeweapon(weapon);
    }
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xd4cd282e, Offset: 0x3eb8
// Size: 0x26c
function play_weapon_vo(weapon) {
    if (isdefined(level.var_d99d49fd)) {
        result = self [[ level.var_d99d49fd ]](weapon);
        if (result) {
            return;
        }
    }
    if (isdefined(level._audio_custom_weapon_check)) {
        type = self [[ level._audio_custom_weapon_check ]](weapon);
    } else {
        type = self weapon_type_check(weapon);
    }
    if (!isdefined(type)) {
        return;
    }
    if (isdefined(level.sndweaponpickupoverride)) {
        foreach (override in level.sndweaponpickupoverride) {
            if (type === override) {
                self zm_audio::create_and_play_dialog(#"weapon_pickup", override);
                return;
            }
        }
    }
    if (isdefined(self.var_966bfd1b) && self.var_966bfd1b) {
        self.var_966bfd1b = 0;
        self zm_audio::create_and_play_dialog(#"magicbox", type);
        return;
    }
    if (type == "upgrade") {
        self zm_audio::create_and_play_dialog(#"weapon_pickup", #"upgrade");
        return;
    }
    if (randomintrange(0, 100) <= 75 || type == "shield") {
        self zm_audio::create_and_play_dialog(#"weapon_pickup", type);
        return;
    }
    self zm_audio::create_and_play_dialog(#"weapon_pickup", #"generic");
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x6f7f58de, Offset: 0x4130
// Size: 0xcc
function weapon_type_check(weapon) {
    if (!isdefined(self.entity_num)) {
        return "crappy";
    }
    weapon = get_nonalternate_weapon(weapon);
    weapon = function_386dacbc(weapon);
    if (is_weapon_upgraded(weapon) && !self bgb::is_enabled(#"zm_bgb_wall_power")) {
        return "upgrade";
    }
    if (isdefined(level.zombie_weapons[weapon])) {
        return level.zombie_weapons[weapon].vox;
    }
    return "crappy";
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xd4f2953f, Offset: 0x4208
// Size: 0x37e
function ammo_give(weapon, b_purchased = 1) {
    var_cd9d17e0 = 0;
    if (!zm_loadout::is_offhand_weapon(weapon) || weapon.isriotshield) {
        weapon = self get_weapon_with_attachments(weapon);
        if (isdefined(weapon)) {
            if (zm_trial_reset_loadout::is_active(1) || namespace_a9e73d8d::is_active()) {
                var_cb48c3c9 = 0;
                var_ef0714fa = 0;
            } else {
                var_cb48c3c9 = weapon.maxammo;
                var_ef0714fa = weapon.startammo;
            }
            var_98f6dae8 = self getweaponammoclip(weapon);
            n_clip_size = weapon.clipsize;
            if (var_98f6dae8 < n_clip_size) {
                var_cd9d17e0 = 1;
            }
            var_4052eae0 = 0;
            if (!var_cd9d17e0 && weapon.dualwieldweapon != level.weaponnone) {
                var_4052eae0 = self getweaponammoclip(weapon.dualwieldweapon);
                var_5916b9ab = weapon.dualwieldweapon.clipsize;
                if (var_4052eae0 < var_5916b9ab) {
                    var_cd9d17e0 = 1;
                }
            }
            if (!var_cd9d17e0) {
                var_b8624c26 = self getammocount(weapon);
                if (self hasperk(#"specialty_extraammo")) {
                    n_ammo_max = var_cb48c3c9;
                } else {
                    n_ammo_max = var_ef0714fa;
                }
                if (weapon.isdualwield) {
                    if (weapon == getweapon(#"pistol_topbreak_t8_upgraded")) {
                        n_ammo_max = n_ammo_max * 2 - var_98f6dae8;
                    }
                    var_b8624c26 += var_4052eae0;
                }
                var_6ec34556 = isdefined(weapon.iscliponly) && weapon.iscliponly ? var_98f6dae8 : n_ammo_max + var_98f6dae8 + var_4052eae0;
                if (var_b8624c26 >= var_6ec34556) {
                    var_cd9d17e0 = 0;
                } else {
                    var_cd9d17e0 = 1;
                }
            }
        }
    } else if (self has_weapon_or_upgrade(weapon)) {
        if (self getammocount(weapon) < weapon.maxammo) {
            var_cd9d17e0 = 1;
        }
    }
    if (var_cd9d17e0) {
        if (b_purchased) {
            self zm_utility::play_sound_on_ent("purchase");
        }
        self function_7c5dd4bd(weapon);
        return 1;
    }
    if (!var_cd9d17e0) {
        return 0;
    }
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x30a1de26, Offset: 0x4590
// Size: 0x216
function get_default_weapondata(weapon) {
    weapondata = [];
    weapondata[#"weapon"] = weapon;
    dw_weapon = weapon.dualwieldweapon;
    alt_weapon = weapon.altweapon;
    weaponnone = getweapon(#"none");
    if (isdefined(level.weaponnone)) {
        weaponnone = level.weaponnone;
    }
    if (weapon != weaponnone) {
        weapondata[#"clip"] = weapon.clipsize;
        weapondata[#"stock"] = weapon.maxammo;
        weapondata[#"fuel"] = weapon.fuellife;
        weapondata[#"heat"] = 0;
        weapondata[#"overheat"] = 0;
    }
    if (dw_weapon != weaponnone) {
        weapondata[#"lh_clip"] = dw_weapon.clipsize;
    } else {
        weapondata[#"lh_clip"] = 0;
    }
    if (alt_weapon != weaponnone) {
        weapondata[#"alt_clip"] = alt_weapon.clipsize;
        weapondata[#"alt_stock"] = alt_weapon.maxammo;
    } else {
        weapondata[#"alt_clip"] = 0;
        weapondata[#"alt_stock"] = 0;
    }
    return weapondata;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x9b84c4dd, Offset: 0x47b0
// Size: 0x426
function get_player_weapondata(weapon) {
    weapondata = [];
    if (!isdefined(weapon)) {
        weapon = self getcurrentweapon();
    }
    weapondata[#"weapon"] = weapon;
    if (weapondata[#"weapon"] != level.weaponnone) {
        weapondata[#"clip"] = self getweaponammoclip(weapon);
        weapondata[#"stock"] = self getweaponammostock(weapon);
        weapondata[#"fuel"] = self getweaponammofuel(weapon);
        weapondata[#"heat"] = self isweaponoverheating(1, weapon);
        weapondata[#"overheat"] = self isweaponoverheating(0, weapon);
        if (weapon.isgadget) {
            slot = self gadgetgetslot(weapon);
            weapondata[#"power"] = self gadgetpowerget(slot);
        }
        if (weapon.isriotshield) {
            weapondata[#"health"] = self.weaponhealth;
        }
    } else {
        weapondata[#"clip"] = 0;
        weapondata[#"stock"] = 0;
        weapondata[#"fuel"] = 0;
        weapondata[#"heat"] = 0;
        weapondata[#"overheat"] = 0;
        weapondata[#"power"] = undefined;
    }
    dw_weapon = weapon.dualwieldweapon;
    if (dw_weapon != level.weaponnone) {
        weapondata[#"lh_clip"] = self getweaponammoclip(dw_weapon);
    } else {
        weapondata[#"lh_clip"] = 0;
    }
    alt_weapon = weapon.altweapon;
    if (alt_weapon != level.weaponnone) {
        weapondata[#"alt_clip"] = self getweaponammoclip(alt_weapon);
        weapondata[#"alt_stock"] = self getweaponammostock(alt_weapon);
    } else {
        weapondata[#"alt_clip"] = 0;
        weapondata[#"alt_stock"] = 0;
    }
    if (self aat::has_aat(weapon)) {
        weapondata[#"aat"] = self aat::getaatonweapon(weapon, 1);
    }
    weapondata[#"repacks"] = self zm_pap_util::function_83c29ddb(weapon);
    return weapondata;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xaf85f1fb, Offset: 0x4be0
// Size: 0x6e
function weapon_is_better(left, right) {
    if (left != right) {
        left_upgraded = is_weapon_upgraded(left);
        right_upgraded = is_weapon_upgraded(right);
        if (left_upgraded) {
            return true;
        }
    }
    return false;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xec100bf1, Offset: 0x4c58
// Size: 0x64e
function merge_weapons(oldweapondata, newweapondata) {
    weapondata = [];
    if (isdefined(level.var_bb2323e4)) {
        weapondata = [[ level.var_bb2323e4 ]](oldweapondata, newweapondata);
        if (isdefined(weapondata)) {
            return weapondata;
        }
    }
    if (weapon_is_better(oldweapondata[#"weapon"], newweapondata[#"weapon"])) {
        weapondata[#"weapon"] = oldweapondata[#"weapon"];
    } else {
        weapondata[#"weapon"] = newweapondata[#"weapon"];
    }
    weapon = weapondata[#"weapon"];
    dw_weapon = weapon.dualwieldweapon;
    alt_weapon = weapon.altweapon;
    if (weapon != level.weaponnone) {
        weapondata[#"clip"] = newweapondata[#"clip"] + oldweapondata[#"clip"];
        weapondata[#"clip"] = int(min(weapondata[#"clip"], weapon.clipsize));
        weapondata[#"stock"] = newweapondata[#"stock"] + oldweapondata[#"stock"];
        weapondata[#"stock"] = int(min(weapondata[#"stock"], weapon.maxammo));
        weapondata[#"fuel"] = newweapondata[#"fuel"] + oldweapondata[#"fuel"];
        weapondata[#"fuel"] = int(min(weapondata[#"fuel"], weapon.fuellife));
        weapondata[#"heat"] = int(min(newweapondata[#"heat"], oldweapondata[#"heat"]));
        weapondata[#"overheat"] = int(min(newweapondata[#"overheat"], oldweapondata[#"overheat"]));
        weapondata[#"power"] = int(max(isdefined(newweapondata[#"power"]) ? newweapondata[#"power"] : 0, isdefined(oldweapondata[#"power"]) ? oldweapondata[#"power"] : 0));
    }
    if (dw_weapon != level.weaponnone) {
        weapondata[#"lh_clip"] = newweapondata[#"lh_clip"] + oldweapondata[#"lh_clip"];
        weapondata[#"lh_clip"] = int(min(weapondata[#"lh_clip"], dw_weapon.clipsize));
    }
    if (alt_weapon != level.weaponnone) {
        weapondata[#"alt_clip"] = newweapondata[#"alt_clip"] + oldweapondata[#"alt_clip"];
        weapondata[#"alt_clip"] = int(min(weapondata[#"alt_clip"], alt_weapon.clipsize));
        weapondata[#"alt_stock"] = newweapondata[#"alt_stock"] + oldweapondata[#"alt_stock"];
        weapondata[#"alt_stock"] = int(min(weapondata[#"alt_stock"], alt_weapon.maxammo));
    }
    return weapondata;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xe1eacf9b, Offset: 0x52b0
// Size: 0x4f8
function weapondata_give(weapondata) {
    current = self get_player_weapon_with_same_base(weapondata[#"weapon"]);
    if (isdefined(current)) {
        curweapondata = self get_player_weapondata(current);
        self weapon_take(current);
        weapondata = merge_weapons(curweapondata, weapondata);
    }
    weapon = weapondata[#"weapon"];
    weapon_give(weapon, 1);
    if (weapon != level.weaponnone) {
        if (weapondata[#"clip"] + weapondata[#"stock"] <= weapon.clipsize) {
            self setweaponammoclip(weapon, weapon.clipsize);
            self setweaponammostock(weapon, 0);
        } else {
            self setweaponammoclip(weapon, weapondata[#"clip"]);
            self setweaponammostock(weapon, weapondata[#"stock"]);
        }
        if (isdefined(weapondata[#"fuel"])) {
            self setweaponammofuel(weapon, weapondata[#"fuel"]);
        }
        if (isdefined(weapondata[#"heat"]) && isdefined(weapondata[#"overheat"])) {
            self setweaponoverheating(weapondata[#"overheat"], weapondata[#"heat"], weapon);
        }
        if (weapon.isgadget && isdefined(weapondata[#"power"])) {
            slot = self gadgetgetslot(weapon);
            if (slot >= 0) {
                self gadgetpowerset(slot, weapondata[#"power"]);
            }
        }
        if (weapon.isriotshield && isdefined(weapondata[#"health"])) {
            self.weaponhealth = weapondata[#"health"];
        }
    }
    dw_weapon = weapon.dualwieldweapon;
    if (function_386dacbc(dw_weapon) != level.weaponnone) {
        if (!self hasweapon(dw_weapon)) {
            self giveweapon(dw_weapon);
        }
        self setweaponammoclip(dw_weapon, weapondata[#"lh_clip"]);
    }
    alt_weapon = weapon.altweapon;
    if (function_386dacbc(alt_weapon) != level.weaponnone) {
        if (!self hasweapon(alt_weapon)) {
            self giveweapon(alt_weapon);
        }
        self setweaponammoclip(alt_weapon, weapondata[#"alt_clip"]);
        self setweaponammostock(alt_weapon, weapondata[#"alt_stock"]);
    }
    if (isdefined(weapondata[#"aat"])) {
        self aat::acquire(weapon, weapondata[#"aat"]);
    }
    if (isdefined(weapondata[#"repacks"]) && weapondata[#"repacks"] > 0) {
        self zm_pap_util::repack_weapon(weapon, weapondata[#"repacks"]);
    }
    return weapon;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xc841871c, Offset: 0x57b0
// Size: 0x204
function weapondata_take(weapondata) {
    weapon = weapondata[#"weapon"];
    if (weapon != level.weaponnone) {
        if (self hasweapon(weapon)) {
            self weapon_take(weapon);
        }
    }
    dw_weapon = weapon.dualwieldweapon;
    if (dw_weapon != level.weaponnone) {
        if (self hasweapon(dw_weapon)) {
            self weapon_take(dw_weapon);
        }
    }
    alt_weapon = weapon.altweapon;
    a_alt_weapons = [];
    while (alt_weapon != level.weaponnone) {
        if (!isdefined(a_alt_weapons)) {
            a_alt_weapons = [];
        } else if (!isarray(a_alt_weapons)) {
            a_alt_weapons = array(a_alt_weapons);
        }
        if (!isinarray(a_alt_weapons, alt_weapon)) {
            a_alt_weapons[a_alt_weapons.size] = alt_weapon;
        }
        if (self hasweapon(alt_weapon)) {
            self weapon_take(alt_weapon);
        }
        alt_weapon = alt_weapon.altweapon;
        if (isinarray(a_alt_weapons, alt_weapon)) {
            println("<dev string:xe9>" + function_9e72a96(alt_weapon.name) + "<dev string:x108>");
            break;
        }
    }
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x6b55731e, Offset: 0x59c0
// Size: 0x19e
function create_loadout(weapons) {
    weaponnone = getweapon(#"none");
    if (isdefined(level.weaponnone)) {
        weaponnone = level.weaponnone;
    }
    loadout = spawnstruct();
    loadout.weapons = [];
    foreach (weapon in weapons) {
        if (isstring(weapon)) {
            weapon = getweapon(weapon);
        }
        if (weapon == weaponnone) {
            println("<dev string:x1a0>" + weapon.name);
        }
        loadout.weapons[weapon.name] = get_default_weapondata(weapon);
        if (!isdefined(loadout.current)) {
            loadout.current = weapon;
        }
    }
    return loadout;
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0xe1bcf82, Offset: 0x5b68
// Size: 0x106
function player_get_loadout() {
    loadout = spawnstruct();
    loadout.current = self getcurrentweapon();
    loadout.stowed = self getstowedweapon();
    loadout.weapons = [];
    foreach (weapon in self getweaponslist()) {
        loadout.weapons[weapon.name] = self get_player_weapondata(weapon);
    }
    return loadout;
}

// Namespace zm_weapons/zm_weapons
// Params 3, eflags: 0x0
// Checksum 0x7fa798de, Offset: 0x5c78
// Size: 0x2cc
function player_give_loadout(loadout, replace_existing = 1, immediate_switch = 0) {
    if (replace_existing) {
        self takeallweapons();
    }
    foreach (weapondata in loadout.weapons) {
        if (isdefined(weapondata[#"weapon"].isheroweapon) && weapondata[#"weapon"].isheroweapon) {
            self zm_hero_weapon::hero_give_weapon(self.var_fd05e363, 0);
            w_weapon = weapondata[#"weapon"];
            if (w_weapon.isgadget && isdefined(weapondata[#"power"])) {
                slot = self gadgetgetslot(w_weapon);
                if (slot >= 0) {
                    self gadgetpowerset(slot, weapondata[#"power"]);
                }
            }
            continue;
        }
        self weapondata_give(weapondata);
    }
    if (self getweaponslistprimaries().size == 0) {
        self zm_loadout::give_start_weapon(1);
    }
    if (!zm_loadout::is_offhand_weapon(loadout.current)) {
        if (immediate_switch) {
            self switchtoweaponimmediate(loadout.current);
        } else {
            self switchtoweapon(loadout.current);
        }
    } else if (immediate_switch) {
        self switchtoweaponimmediate();
    } else {
        self switchtoweapon();
    }
    if (isdefined(loadout.stowed)) {
        self setstowedweapon(loadout.stowed);
    }
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x3818308, Offset: 0x5f50
// Size: 0x88
function player_take_loadout(loadout) {
    foreach (weapondata in loadout.weapons) {
        self weapondata_take(weapondata);
    }
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xc6a82209, Offset: 0x5fe0
// Size: 0x5e
function register_zombie_weapon_callback(weapon, func) {
    if (!isdefined(level.zombie_weapons_callbacks)) {
        level.zombie_weapons_callbacks = [];
    }
    if (!isdefined(level.zombie_weapons_callbacks[weapon])) {
        level.zombie_weapons_callbacks[weapon] = func;
    }
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x6a63d8d, Offset: 0x6048
// Size: 0x54
function set_stowed_weapon(weapon) {
    self.weapon_stowed = weapon;
    if (!(isdefined(self.stowed_weapon_suppressed) && self.stowed_weapon_suppressed)) {
        self setstowedweapon(self.weapon_stowed);
    }
}

// Namespace zm_weapons/zm_weapons
// Params 0, eflags: 0x0
// Checksum 0x8bb2e800, Offset: 0x60a8
// Size: 0x34
function clear_stowed_weapon() {
    self notify(#"hash_70957a1035bda74b");
    self.weapon_stowed = undefined;
    self clearstowedweapon();
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xf0b422f2, Offset: 0x60e8
// Size: 0x6c
function suppress_stowed_weapon(onoff) {
    self.stowed_weapon_suppressed = onoff;
    if (onoff || !isdefined(self.weapon_stowed)) {
        self clearstowedweapon();
        return;
    }
    self setstowedweapon(self.weapon_stowed);
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x7edd808, Offset: 0x6160
// Size: 0x24
function checkstringvalid(hash_or_str) {
    if (hash_or_str != "") {
        return hash_or_str;
    }
    return undefined;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0x89bf10cd, Offset: 0x6190
// Size: 0x49a
function load_weapon_spec_from_table(table, first_row) {
    gametype = util::get_game_type();
    index = first_row;
    for (row = tablelookuprow(table, index); isdefined(row); row = tablelookuprow(table, index)) {
        weapon_name = checkstringvalid(row[0]);
        if (isinarray(level.var_c60359dc, weapon_name)) {
            index++;
            row = tablelookuprow(table, index);
            continue;
        }
        if (!isdefined(level.var_c60359dc)) {
            level.var_c60359dc = [];
        } else if (!isarray(level.var_c60359dc)) {
            level.var_c60359dc = array(level.var_c60359dc);
        }
        level.var_c60359dc[level.var_c60359dc.size] = weapon_name;
        upgrade_name = checkstringvalid(row[1]);
        is_ee = row[2];
        cost = row[3];
        weaponvo = checkstringvalid(row[4]);
        weaponvoresp = checkstringvalid(row[5]);
        ammo_cost = row[6];
        create_vox = row[7];
        is_zcleansed = row[8];
        in_box = row[9];
        upgrade_in_box = row[10];
        is_limited = row[11];
        var_ddca6652 = row[17];
        limit = row[12];
        upgrade_limit = row[13];
        content_restrict = row[14];
        wallbuy_autospawn = row[15];
        weapon_class = checkstringvalid(row[16]);
        is_wonder_weapon = row[18];
        tier = row[19];
        zm_utility::include_weapon(weapon_name, in_box);
        if (isdefined(upgrade_name)) {
            zm_utility::include_weapon(upgrade_name, upgrade_in_box);
        }
        add_zombie_weapon(weapon_name, upgrade_name, is_ee, cost, weaponvo, weaponvoresp, ammo_cost, create_vox, weapon_class, is_wonder_weapon, tier, in_box);
        if (is_limited) {
            if (isdefined(limit)) {
                add_limited_weapon(weapon_name, limit);
            }
            if (isdefined(upgrade_limit) && isdefined(upgrade_name)) {
                add_limited_weapon(upgrade_name, upgrade_limit);
            }
        }
        if (!var_ddca6652 && weapon_class !== "equipment") {
            aat::register_aat_exemption(getweapon(weapon_name));
            if (isdefined(upgrade_name)) {
                aat::register_aat_exemption(getweapon(upgrade_name));
            }
        }
        index++;
    }
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xe9c011ef, Offset: 0x6638
// Size: 0x64
function is_wonder_weapon(w_to_check) {
    w_base = get_base_weapon(w_to_check);
    if (isdefined(level.zombie_weapons[w_base]) && level.zombie_weapons[w_base].is_wonder_weapon) {
        return true;
    }
    return false;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0x6c46732b, Offset: 0x66a8
// Size: 0x38
function is_tactical_rifle(w_to_check) {
    if (level.zombie_weapons[w_to_check].weapon_classname === "tr") {
        return true;
    }
    return false;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xf4bb57a8, Offset: 0x66e8
// Size: 0x3c
function is_explosive_weapon(weapon) {
    if (weapon.explosioninnerdamage > 0 || weapon.explosionouterdamage > 0) {
        return true;
    }
    return false;
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0x8bca6199, Offset: 0x6730
// Size: 0x96
function function_f5a0899d(weapon, var_d921715f = 1) {
    if (isdefined(weapon)) {
        if (!var_d921715f && is_wonder_weapon(weapon)) {
            return false;
        }
        var_3ba4bf7d = self getweaponslistprimaries();
        if (isinarray(var_3ba4bf7d, weapon)) {
            return true;
        }
    }
    return false;
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x0
// Checksum 0xa6ca8c32, Offset: 0x67d0
// Size: 0xf4
function function_7c5dd4bd(w_weapon) {
    if (zm_loadout::function_2ff6913(w_weapon)) {
        return;
    }
    if (!self hasweapon(w_weapon)) {
        return;
    }
    self setweaponammoclip(w_weapon, w_weapon.clipsize);
    self notify(#"hash_278526d0bbdb4ce7");
    if (zm_trial_reset_loadout::is_active(1)) {
        self function_7f7c1226(w_weapon);
        return;
    }
    if (self hasperk(#"specialty_extraammo")) {
        self givemaxammo(w_weapon);
        return;
    }
    self givestartammo(w_weapon);
}

// Namespace zm_weapons/zm_weapons
// Params 1, eflags: 0x4
// Checksum 0xa7d85986, Offset: 0x68d0
// Size: 0xb4
function private function_7f7c1226(weapon) {
    waittillframeend();
    if (weaponhasattachment(weapon, "uber") && weapon.statname == #"smg_capacity_t8" || isdefined(weapon.isriotshield) && weapon.isriotshield) {
        n_stock = weapon.clipsize;
    } else {
        n_stock = 0;
    }
    self setweaponammostock(weapon, n_stock);
}

// Namespace zm_weapons/zm_weapons
// Params 2, eflags: 0x0
// Checksum 0xde97860d, Offset: 0x6990
// Size: 0xba
function function_35746b9c(weapon, str_mod = "MOD_MELEE") {
    w_root = function_93cd8e76(weapon, 1);
    if (w_root.name == "pistol_standard_t8" || w_root.name == "ar_stealth_t8") {
        if (weaponhasattachment(weapon, "uber") && str_mod == "MOD_MELEE") {
            return true;
        }
    }
    return false;
}

// Namespace zm_weapons/zm_weapons
// Params 3, eflags: 0x0
// Checksum 0xa464fb4c, Offset: 0x6a58
// Size: 0x570
function function_ed29dde5(var_947d01ee, var_ccd1bc81 = 0, var_609a8d33 = 0) {
    a_weapons = [];
    foreach (s_weapon in level.zombie_weapons) {
        if (s_weapon.weapon_classname === var_947d01ee) {
            if (var_609a8d33) {
                if (!isdefined(a_weapons)) {
                    a_weapons = [];
                } else if (!isarray(a_weapons)) {
                    a_weapons = array(a_weapons);
                }
                a_weapons[a_weapons.size] = s_weapon.weapon.name;
            } else {
                if (!isdefined(a_weapons)) {
                    a_weapons = [];
                } else if (!isarray(a_weapons)) {
                    a_weapons = array(a_weapons);
                }
                a_weapons[a_weapons.size] = s_weapon.weapon;
            }
            if (var_ccd1bc81) {
                if (var_609a8d33) {
                    if (!isdefined(a_weapons)) {
                        a_weapons = [];
                    } else if (!isarray(a_weapons)) {
                        a_weapons = array(a_weapons);
                    }
                    a_weapons[a_weapons.size] = s_weapon.upgrade.name;
                } else {
                    if (!isdefined(a_weapons)) {
                        a_weapons = [];
                    } else if (!isarray(a_weapons)) {
                        a_weapons = array(a_weapons);
                    }
                    a_weapons[a_weapons.size] = s_weapon.upgrade;
                }
            }
        }
        if (s_weapon.weapon_classname === "shield" && var_947d01ee != "shield") {
            if (s_weapon.weapon.weapclass === var_947d01ee) {
                if (var_609a8d33) {
                    if (!isdefined(a_weapons)) {
                        a_weapons = [];
                    } else if (!isarray(a_weapons)) {
                        a_weapons = array(a_weapons);
                    }
                    a_weapons[a_weapons.size] = s_weapon.weapon.name;
                    if (s_weapon.weapon.dualwieldweapon != level.weaponnone) {
                        if (!isdefined(a_weapons)) {
                            a_weapons = [];
                        } else if (!isarray(a_weapons)) {
                            a_weapons = array(a_weapons);
                        }
                        a_weapons[a_weapons.size] = s_weapon.weapon.dualwieldweapon.name;
                    }
                } else {
                    if (!isdefined(a_weapons)) {
                        a_weapons = [];
                    } else if (!isarray(a_weapons)) {
                        a_weapons = array(a_weapons);
                    }
                    a_weapons[a_weapons.size] = s_weapon.weapon;
                    if (s_weapon.weapon.dualwieldweapon != level.weaponnone) {
                        if (!isdefined(a_weapons)) {
                            a_weapons = [];
                        } else if (!isarray(a_weapons)) {
                            a_weapons = array(a_weapons);
                        }
                        a_weapons[a_weapons.size] = s_weapon.weapon.dualwieldweapon;
                    }
                }
            }
            if (s_weapon.weapon.altweapon.weapclass === var_947d01ee) {
                if (var_609a8d33) {
                    if (!isdefined(a_weapons)) {
                        a_weapons = [];
                    } else if (!isarray(a_weapons)) {
                        a_weapons = array(a_weapons);
                    }
                    a_weapons[a_weapons.size] = s_weapon.weapon.altweapon.name;
                    continue;
                }
                if (!isdefined(a_weapons)) {
                    a_weapons = [];
                } else if (!isarray(a_weapons)) {
                    a_weapons = array(a_weapons);
                }
                a_weapons[a_weapons.size] = s_weapon.weapon.altweapon;
            }
        }
    }
    return a_weapons;
}


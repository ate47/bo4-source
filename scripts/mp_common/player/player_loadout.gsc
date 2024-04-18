// Atian COD Tools GSC decompiler test
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\dev.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\mp_common\armor.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\abilities\gadgets\gadget_health_regen.gsc;
#using scripts\abilities\ability_util.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\loadout_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\healthoverlay.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace loadout;

// Namespace loadout/player_loadout
// Params 0, eflags: 0x2
// Checksum 0xa5b5fe11, Offset: 0x530
// Size: 0x2da
function autoexec function_313e9d31() {
    callback::on_start_gametype(&function_dd840c5f);
    level.specialisthealingenabled = getgametypesetting(#"specialisthealingenabled_allies_1");
    level.specialistabilityenabled = getgametypesetting(#"specialistabilityenabled_allies_1");
    level.specialistequipmentenabled = getgametypesetting(#"specialistequipmentenabled_allies_1");
    level.var_50e97365 = getgametypesetting(#"hash_7684a70eb68f1ebb");
    level.specialistabilityreadyonrespawn = getgametypesetting(#"specialistabilityreadyonrespawn_allies_1");
    level.specialistequipmentreadyonrespawn = getgametypesetting(#"specialistequipmentreadyonrespawn_allies_1");
    level.playerloadoutrestrictions = [];
    level.playerloadoutrestrictions[0] = getscriptbundle(#"plr_mp_default");
    if (isdefined(getgametypesetting(#"scorestreaksbarebones")) && getgametypesetting(#"scorestreaksbarebones")) {
        level.scorestreaksbarebones = [];
        level.scorestreaksbarebones[0] = 126;
        level.scorestreaksbarebones[1] = 130;
        level.scorestreaksbarebones[2] = 134;
    }
    wildcardtable = getscriptbundle(#"wildcardtable");
    foreach (wildcard in wildcardtable.wildcardtable) {
        var_43645456 = wildcard.playerloadoutrestrictions;
        playerloadoutrestrictions = getscriptbundle(var_43645456);
        level.playerloadoutrestrictions[playerloadoutrestrictions.var_9bb0ceab] = playerloadoutrestrictions;
    }
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0x7fe61e1f, Offset: 0x818
// Size: 0x1e
function function_dd840c5f() {
    profilestart();
    mp_init();
    profilestop();
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x0
// Checksum 0x1a9c3b09, Offset: 0x840
// Size: 0x88e
function function_9f888e75(weapons_table) {
    level.weapon_sig_minigun = getweapon(#"sig_minigun");
    level.weapon_hero_annihilator = getweapon(#"hero_annihilator");
    level.weaponbasemeleeheld = getweapon(#"bare_hands");
    level.weaponknifeloadout = getweapon(#"knife_loadout");
    level.weaponmeleeclub = getweapon(#"melee_club_t8");
    level.weaponmeleecoinbag = getweapon(#"melee_coinbag_t8");
    level.weaponmeleecutlass = getweapon(#"melee_cutlass_t8");
    level.weaponmeleedemohammer = getweapon(#"melee_demohammer_t8");
    level.weaponmeleesecretsanta = getweapon(#"melee_secretsanta_t8");
    level.weaponmeleeslaybell = getweapon(#"melee_slaybell_t8");
    level.weaponmeleezombiearm = getweapon(#"melee_zombiearm_t8");
    level.weaponmeleestopsign = getweapon(#"melee_stopsign_t8");
    level.weaponmeleeactionfigure = getweapon(#"melee_actionfigure_t8");
    level.weaponmeleeamuletfist = getweapon(#"melee_amuletfist_t8");
    if (!isdefined(level.meleeweapons)) {
        level.meleeweapons = [];
    } else if (!isarray(level.meleeweapons)) {
        level.meleeweapons = array(level.meleeweapons);
    }
    level.meleeweapons[level.meleeweapons.size] = level.weaponknifeloadout;
    if (!isdefined(level.meleeweapons)) {
        level.meleeweapons = [];
    } else if (!isarray(level.meleeweapons)) {
        level.meleeweapons = array(level.meleeweapons);
    }
    level.meleeweapons[level.meleeweapons.size] = level.weaponmeleeclub;
    if (!isdefined(level.meleeweapons)) {
        level.meleeweapons = [];
    } else if (!isarray(level.meleeweapons)) {
        level.meleeweapons = array(level.meleeweapons);
    }
    level.meleeweapons[level.meleeweapons.size] = level.weaponmeleecoinbag;
    if (!isdefined(level.meleeweapons)) {
        level.meleeweapons = [];
    } else if (!isarray(level.meleeweapons)) {
        level.meleeweapons = array(level.meleeweapons);
    }
    level.meleeweapons[level.meleeweapons.size] = level.weaponmeleecutlass;
    if (!isdefined(level.meleeweapons)) {
        level.meleeweapons = [];
    } else if (!isarray(level.meleeweapons)) {
        level.meleeweapons = array(level.meleeweapons);
    }
    level.meleeweapons[level.meleeweapons.size] = level.weaponmeleedemohammer;
    if (!isdefined(level.meleeweapons)) {
        level.meleeweapons = [];
    } else if (!isarray(level.meleeweapons)) {
        level.meleeweapons = array(level.meleeweapons);
    }
    level.meleeweapons[level.meleeweapons.size] = level.weaponmeleesecretsanta;
    if (!isdefined(level.meleeweapons)) {
        level.meleeweapons = [];
    } else if (!isarray(level.meleeweapons)) {
        level.meleeweapons = array(level.meleeweapons);
    }
    level.meleeweapons[level.meleeweapons.size] = level.weaponmeleeslaybell;
    if (!isdefined(level.meleeweapons)) {
        level.meleeweapons = [];
    } else if (!isarray(level.meleeweapons)) {
        level.meleeweapons = array(level.meleeweapons);
    }
    level.meleeweapons[level.meleeweapons.size] = level.weaponmeleezombiearm;
    if (!isdefined(level.meleeweapons)) {
        level.meleeweapons = [];
    } else if (!isarray(level.meleeweapons)) {
        level.meleeweapons = array(level.meleeweapons);
    }
    level.meleeweapons[level.meleeweapons.size] = level.weaponmeleestopsign;
    if (!isdefined(level.meleeweapons)) {
        level.meleeweapons = [];
    } else if (!isarray(level.meleeweapons)) {
        level.meleeweapons = array(level.meleeweapons);
    }
    level.meleeweapons[level.meleeweapons.size] = level.weaponmeleeactionfigure;
    if (!isdefined(level.meleeweapons)) {
        level.meleeweapons = [];
    } else if (!isarray(level.meleeweapons)) {
        level.meleeweapons = array(level.meleeweapons);
    }
    level.meleeweapons[level.meleeweapons.size] = level.weaponmeleeamuletfist;
    level.weaponshotgunenergy = getweapon(#"shotgun_energy");
    level.weaponpistolenergy = getweapon(#"pistol_energy");
    level.var_c1954e36 = getweapon(#"ac130_chaingun");
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0xa1f7048c, Offset: 0x10d8
// Size: 0x422
function function_5be71695() {
    level.classmap[#"class_smg"] = "CLASS_SMG";
    level.classmap[#"class_cqb"] = "CLASS_CQB";
    level.classmap[#"class_assault"] = "CLASS_ASSAULT";
    level.classmap[#"class_lmg"] = "CLASS_LMG";
    level.classmap[#"class_sniper"] = "CLASS_SNIPER";
    level.classmap[#"class_specialized"] = "CLASS_SPECIALIZED";
    level.classmap[#"custom0"] = "CLASS_CUSTOM1";
    level.classmap[#"custom1"] = "CLASS_CUSTOM2";
    level.classmap[#"custom2"] = "CLASS_CUSTOM3";
    level.classmap[#"custom3"] = "CLASS_CUSTOM4";
    level.classmap[#"custom4"] = "CLASS_CUSTOM5";
    level.classmap[#"custom5"] = "CLASS_CUSTOM6";
    level.classmap[#"custom6"] = "CLASS_CUSTOM7";
    level.classmap[#"custom7"] = "CLASS_CUSTOM8";
    level.classmap[#"custom8"] = "CLASS_CUSTOM9";
    level.classmap[#"custom9"] = "CLASS_CUSTOM10";
    level.classmap[#"custom10"] = "CLASS_CUSTOM11";
    level.classmap[#"custom11"] = "CLASS_CUSTOM12";
    level.classmap[#"custom12"] = level.classmap[#"class_smg"];
    level.classmap[#"custom13"] = level.classmap[#"class_cqb"];
    level.classmap[#"custom14"] = level.classmap[#"class_assault"];
    level.classmap[#"custom15"] = level.classmap[#"class_lmg"];
    level.classmap[#"custom16"] = level.classmap[#"class_sniper"];
    level.classmap[#"custom17"] = level.classmap[#"class_specialized"];
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0x2d99b557, Offset: 0x1508
// Size: 0x114
function function_5f206535() {
    if (!function_87bcb1b()) {
        return;
    }
    function_5be71695();
    level.defaultclass = "CLASS_CUSTOM1";
    create_class_exclusion_list();
    load_default_loadout("CLASS_SMG", 12);
    load_default_loadout("CLASS_CQB", 13);
    load_default_loadout("CLASS_ASSAULT", 14);
    load_default_loadout("CLASS_LMG", 15);
    load_default_loadout("CLASS_SNIPER", 16);
    load_default_loadout("CLASS_SPECIALIZED", 17);
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0xa1687d1c, Offset: 0x1628
// Size: 0x13c
function mp_init() {
    level.maxkillstreaks = 4;
    level.maxspecialties = 6;
    level.maxallocation = getgametypesetting(#"maxallocation");
    level.loadoutkillstreaksenabled = getgametypesetting(#"loadoutkillstreaksenabled");
    level.prestigenumber = 5;
    function_6bc4927f();
    level thread function_8624b793();
    function_9f888e75();
    function_5f206535();
    callback::on_connecting(&on_player_connecting);
    if (isdefined(level.specialisthealingenabled) && !level.specialisthealingenabled) {
        ability_player::register_gadget_activation_callbacks(23, undefined, &offhealthregen);
    }
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0x8ce2f94e, Offset: 0x1770
// Size: 0x108
function private create_class_exclusion_list() {
    currentdvar = 0;
    level.itemexclusions = [];
    while (getdvarint("item_exclusion_" + currentdvar, 0)) {
        level.itemexclusions[currentdvar] = getdvarint("item_exclusion_" + currentdvar, 0);
        currentdvar++;
    }
    level.attachmentexclusions = [];
    for (currentdvar = 0; getdvarstring("attachment_exclusion_" + currentdvar) != ""; currentdvar++) {
        level.attachmentexclusions[currentdvar] = getdvarstring("attachment_exclusion_" + currentdvar);
    }
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0x79b4f0bb, Offset: 0x1880
// Size: 0x68
function private is_attachment_excluded(attachment) {
    numexclusions = level.attachmentexclusions.size;
    for (exclusionindex = 0; exclusionindex < numexclusions; exclusionindex++) {
        if (attachment == level.attachmentexclusions[exclusionindex]) {
            return true;
        }
    }
    return false;
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x4
// Checksum 0x978edc92, Offset: 0x18f0
// Size: 0x42
function private load_default_loadout(weaponclass, classnum) {
    level.classtoclassnum[weaponclass] = classnum;
    level.var_8e1db8ee[classnum] = weaponclass;
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x4
// Checksum 0xcd61cf02, Offset: 0x1940
// Size: 0x19c
function private weapon_class_register(weaponname, weapon_type) {
    if (issubstr("weapon_smg weapon_cqb weapon_assault weapon_tactical weapon_lmg weapon_sniper weapon_shotgun weapon_launcher weapon_knife weapon_special", weapon_type)) {
        level.primary_weapon_array[getweapon(weaponname)] = 1;
        return;
    }
    if (issubstr("weapon_pistol", weapon_type)) {
        level.side_arm_array[getweapon(weaponname)] = 1;
        return;
    }
    if (issubstr("weapon_grenade hero", weapon_type)) {
        level.grenade_array[getweapon(weaponname)] = 1;
        return;
    }
    if (weapon_type == "weapon_explosive") {
        level.inventory_array[getweapon(weaponname)] = 1;
        return;
    }
    if (weapon_type == "weapon_rifle") {
        level.inventory_array[getweapon(weaponname)] = 1;
        return;
    }
    assert(0, "head" + weapon_type + "<unknown string>" + weaponname);
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0xf95fcf98, Offset: 0x1ae8
// Size: 0x42
function private heavy_weapon_register_dialog(weapon) {
    readyvo = weapon.name + "_ready";
    game.dialog[readyvo] = readyvo;
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0x42cef183, Offset: 0x1b38
// Size: 0x1fc
function private function_6bc4927f() {
    level.meleeweapons = [];
    level.primary_weapon_array = [];
    level.side_arm_array = [];
    level.grenade_array = [];
    level.inventory_array = [];
    level.perkicons = [];
    level.perkspecialties = [];
    level.killstreakicons = [];
    level.killstreakindices = [];
    for (i = 0; i < 1024; i++) {
        iteminfo = getunlockableiteminfofromindex(i, 0);
        if (isdefined(iteminfo)) {
            group_s = iteminfo.itemgroupname;
            reference_s = iteminfo.name;
            var_da0b29d2 = iteminfo.namehash;
            display_name_s = iteminfo.displayname;
            if (issubstr(group_s, "weapon_") || group_s == "hero") {
                if (group_s != "" && var_da0b29d2 != "") {
                    weapon_class_register(var_da0b29d2, group_s);
                }
                continue;
            }
            if (group_s == "specialty") {
                level.perkspecialties[display_name_s] = reference_s;
                continue;
            }
            if (group_s == "killstreak") {
                level.tbl_killstreakdata[i] = var_da0b29d2;
                level.killstreakindices[var_da0b29d2] = i;
            }
        }
    }
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0xce25ab44, Offset: 0x1d40
// Size: 0x18e
function private function_8624b793() {
    /#
        wait(0.5);
        for (i = 0; i < 1024; i++) {
            iteminfo = getunlockableiteminfofromindex(i, 0);
            if (!isdefined(iteminfo)) {
                continue;
            }
            reference_s = iteminfo.name;
            if (reference_s == "<unknown string>") {
                continue;
            }
            group_s = iteminfo.itemgroupname;
            display_name_s = iteminfo.displayname;
            if (group_s == "<unknown string>") {
                dev::add_perk_devgui(display_name_s, reference_s);
                continue;
            }
            if (group_s == "<unknown string>") {
                if (strstartswith(iteminfo.name, "<unknown string>")) {
                    dev::function_8263c0d5(reference_s, "<unknown string>");
                    continue;
                }
                postfix = "<unknown string>" + sessionmodeabbreviation();
                dev::function_373068ca(reference_s, postfix);
            }
        }
    #/
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x0
// Checksum 0xa62caed7, Offset: 0x1ed8
// Size: 0x44
function function_97d216fa(response) {
    assert(isdefined(level.classmap[response]));
    return level.classmap[response];
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x4
// Checksum 0x9cc437fa, Offset: 0x1f28
// Size: 0xe4
function private function_f8157311(weaponclass, killstreaknum) {
    killstreaknum++;
    killstreakstring = "killstreak" + killstreaknum;
    if (getdvarint(#"custom_killstreak_mode", 0) == 2) {
        return getdvarint("custom_" + killstreakstring, 0);
    }
    if (isdefined(level.scorestreaksbarebones) && isdefined(level.scorestreaksbarebones[killstreaknum - 1])) {
        return level.scorestreaksbarebones[killstreaknum - 1];
    }
    return self getloadoutitem(weaponclass, killstreakstring);
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0x455e8ec7, Offset: 0x2018
// Size: 0x13a
function clear_killstreaks() {
    player = self;
    if (isdefined(player.killstreak)) {
        foreach (killstreak in player.killstreak) {
            killstreaktype = killstreaks::get_by_menu_name(killstreak);
            if (isdefined(killstreaktype)) {
                killstreakweapon = killstreaks::get_killstreak_weapon(killstreaktype);
                player takeweapon(killstreakweapon);
            }
        }
        for (i = 0; i < 4; i = i + 1) {
            player function_b181bcbd(i);
        }
    }
    player.killstreak = [];
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0x67d63abb, Offset: 0x2160
// Size: 0x5a6
function give_killstreaks() {
    self clear_killstreaks();
    if (!level.loadoutkillstreaksenabled) {
        return;
    }
    classnum = self.class_num_for_global_weapons;
    sortedkillstreaks = [];
    currentkillstreak = 0;
    for (killstreaknum = 0; killstreaknum < level.maxkillstreaks; killstreaknum++) {
        killstreakindex = function_f8157311(classnum, killstreaknum);
        if (isdefined(killstreakindex) && killstreakindex > 0) {
            assert(isdefined(level.tbl_killstreakdata[killstreakindex]), "<unknown string>" + killstreakindex + "<unknown string>");
            if (isdefined(level.tbl_killstreakdata[killstreakindex])) {
                self.killstreak[currentkillstreak] = level.tbl_killstreakdata[killstreakindex];
                if (isdefined(level.usingmomentum) && level.usingmomentum) {
                    killstreaktype = killstreaks::get_by_menu_name(self.killstreak[currentkillstreak]);
                    if (isdefined(killstreaktype)) {
                        weapon = killstreaks::get_killstreak_weapon(killstreaktype);
                        self giveweapon(weapon);
                        if (isdefined(level.usingscorestreaks) && level.usingscorestreaks) {
                            if (weapon.iscarriedkillstreak) {
                                if (!isdefined(self.pers[#"held_killstreak_ammo_count"][weapon])) {
                                    self.pers[#"held_killstreak_ammo_count"][weapon] = 0;
                                }
                                if (!isdefined(self.pers[#"held_killstreak_clip_count"][weapon])) {
                                    self.pers[#"held_killstreak_clip_count"][weapon] = 0;
                                }
                                if (self.pers[#"held_killstreak_ammo_count"][weapon] > 0) {
                                    self setweaponammoclip(weapon, self.pers[#"held_killstreak_clip_count"][weapon]);
                                    self setweaponammostock(weapon, self.pers[#"held_killstreak_ammo_count"][weapon] - self.pers[#"held_killstreak_clip_count"][weapon]);
                                } else {
                                    self function_3ba6ee5d(weapon, 0);
                                }
                            } else {
                                quantity = 0;
                                if (isdefined(self.pers[#"killstreak_quantity"]) && isdefined(self.pers[#"killstreak_quantity"][weapon])) {
                                    quantity = self.pers[#"killstreak_quantity"][weapon];
                                }
                                self setweaponammoclip(weapon, quantity);
                            }
                        }
                        sortdata = spawnstruct();
                        sortdata.cost = self function_dceb5542(level.killstreaks[killstreaktype].itemindex);
                        sortdata.weapon = weapon;
                        sortindex = 0;
                        for (sortindex = 0; sortindex < sortedkillstreaks.size; sortindex++) {
                            if (sortedkillstreaks[sortindex].cost > sortdata.cost) {
                                break;
                            }
                        }
                        for (i = sortedkillstreaks.size; i > sortindex; i--) {
                            sortedkillstreaks[i] = sortedkillstreaks[i - 1];
                        }
                        sortedkillstreaks[sortindex] = sortdata;
                    }
                }
                currentkillstreak++;
            }
        }
    }
    var_2e1bd530 = [];
    var_2e1bd530[0] = 3;
    var_2e1bd530[1] = 1;
    var_2e1bd530[2] = 0;
    if (isdefined(level.usingmomentum) && level.usingmomentum) {
        for (sortindex = 0; sortindex < sortedkillstreaks.size && sortindex < var_2e1bd530.size; sortindex++) {
            if (sortedkillstreaks[sortindex].weapon != level.weaponnone) {
                self setkillstreakweapon(var_2e1bd530[sortindex], sortedkillstreaks[sortindex].weapon);
            }
        }
    }
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0xa2af6c43, Offset: 0x2710
// Size: 0x16
function private reset_specialty_slots(class_num) {
    self.specialty = [];
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0x24bb0a24, Offset: 0x2730
// Size: 0xe
function function_da96d067() {
    self.staticweaponsstarttime = gettime();
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0x5c7ec43c, Offset: 0x2748
// Size: 0x40
function private function_50797a7f(equipment_name) {
    if (equipment_name == level.weapontacticalinsertion.name && level.disabletacinsert) {
        return false;
    }
    return true;
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x0
// Checksum 0xa6432719, Offset: 0x2790
// Size: 0x5e
function init_player(takeallweapons) {
    if (takeallweapons) {
        self takeallweapons();
    }
    self.specialty = [];
    self clear_killstreaks();
    self notify(#"give_map");
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0x2adde2be, Offset: 0x27f8
// Size: 0x1c
function private give_gesture() {
    self gestures::clear_gesture();
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0x956b40bd, Offset: 0x2820
// Size: 0xd6
function private function_c84c77d8(loadoutslot) {
    switch (loadoutslot) {
    case 41:
        self.playerloadoutrestrictions.var_a2ef45f8--;
        if (self.playerloadoutrestrictions.var_a2ef45f8 < 0) {
            return false;
        }
        break;
    case 42:
        self.playerloadoutrestrictions.var_cd3db98c--;
        if (self.playerloadoutrestrictions.var_cd3db98c < 0) {
            return false;
        }
        break;
    case 43:
        self.playerloadoutrestrictions.var_25a22f4--;
        if (self.playerloadoutrestrictions.var_25a22f4 < 0) {
            return false;
        }
        break;
    }
    return true;
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0x7fb3a6a8, Offset: 0x2900
// Size: 0x17c
function private give_talents() {
    pixbeginevent(#"give_talents");
    self.var_c8836f02 = self function_fd62a2aa(self.class_num);
    foreach (var_ebdddedf in self.var_c8836f02) {
        if (var_ebdddedf.namehash == #"hash_6be738527a4213aa" && level.hardcoremode) {
            var_ebdddedf.namehash = #"hash_5c9c79c25b74b7bb";
        }
        var_b3ed76f5 = function_c84c77d8(var_ebdddedf.loadoutslot);
        if (var_b3ed76f5 && !self function_6c32d092(var_ebdddedf.namehash)) {
            self function_b5feff95(var_ebdddedf.namehash);
        }
    }
    pixendevent();
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0x635f5a44, Offset: 0x2a88
// Size: 0x164
function give_perks() {
    pixbeginevent(#"give_perks");
    self.specialty = self getloadoutperks(self.class_num);
    self setplayerstateloadoutweapons(self.class_num);
    self setplayerstateloadoutbonuscards(self.class_num);
    if (level.leaguematch) {
        for (i = 0; i < self.specialty.size; i++) {
            if (isitemrestricted(self.specialty[i])) {
                arrayremoveindex(self.specialty, i);
                i--;
            }
        }
    }
    self register_perks();
    if (self hasperk(#"specialty_immunenvthermal")) {
        self clientfield::set("cold_blooded", 1);
    }
    pixendevent();
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x0
// Checksum 0xf765c220, Offset: 0x2bf8
// Size: 0x18c
function function_f436358b(weaponclass) {
    self.class_num = get_class_num(weaponclass);
    if (issubstr(weaponclass, "CLASS_CUSTOM")) {
        pixbeginevent(#"custom class");
        self.class_num_for_global_weapons = self.class_num;
        self reset_specialty_slots(self.class_num);
        playerrenderoptions = self calcplayeroptions(self.class_num);
        self setplayerrenderoptions(playerrenderoptions);
        pixendevent();
    } else {
        pixbeginevent(#"default class");
        assert(isdefined(self.pers[#"class"]), "<unknown string>");
        self.class_num_for_global_weapons = 0;
        self setplayerrenderoptions(0);
        pixendevent();
    }
    self recordloadoutindex(self.class_num);
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x0
// Checksum 0x64f197ab, Offset: 0x2d90
// Size: 0x1e0
function get_class_num(weaponclass) {
    assert(isdefined(weaponclass));
    prefixstring = "CLASS_CUSTOM";
    var_8bba14bc = self getcustomclasscount();
    var_8bba14bc = max(var_8bba14bc, 0);
    if (isstring(weaponclass) && issubstr(weaponclass, prefixstring)) {
        var_3858e4e = getsubstr(weaponclass, prefixstring.size);
        class_num = int(var_3858e4e) - 1;
        if (class_num == -1) {
            class_num = var_8bba14bc;
        }
        assert(isdefined(class_num));
        if (class_num < 0 || class_num > var_8bba14bc) {
            class_num = 0;
        }
        assert(class_num >= 0 && class_num <= var_8bba14bc);
    } else {
        class_num = level.classtoclassnum[weaponclass];
    }
    if (!isdefined(class_num)) {
        class_num = self stats::get_stat(#"selectedcustomclass");
        if (!isdefined(class_num)) {
            class_num = 0;
        }
    }
    assert(isdefined(class_num));
    return class_num;
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0xb76e1f5d, Offset: 0x2f78
// Size: 0x9a
function private function_d81e599e() {
    self.spawnweapon = level.weaponbasemeleeheld;
    self giveweapon(level.weaponbasemeleeheld);
    self.pers[#"spawnweapon"] = self.spawn_weapon;
    switchimmediate = isdefined(self.alreadysetspawnweapononce);
    self setspawnweapon(self.spawnweapon, switchimmediate);
    self.alreadysetspawnweapononce = 1;
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0x82514339, Offset: 0x3020
// Size: 0x10
function private function_6bc6995e(weapon_options) {
    return weapon_options;
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0xcf29deb9, Offset: 0x3038
// Size: 0x2a
function private get_weapon_options(type_index) {
    return self calcweaponoptions(self.class_num, type_index);
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0x272f2c28, Offset: 0x3070
// Size: 0x42
function private function_f4042786(type_index) {
    weapon_options = self get_weapon_options(type_index);
    return function_6bc6995e(weapon_options);
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0x4ede78cf, Offset: 0x30c0
// Size: 0xe6
function private function_2ada6938(slot) {
    weapon = self getloadoutweapon(self.class_num, slot);
    if (weapon.iscarriedkillstreak) {
        weapon = level.weaponnull;
    }
    var_348d3044 = weapon.name;
    if (slot == "primary" || slot == "secondary") {
        var_4d371861 = self getweaponoptic(weapon);
    }
    var_a15bcb9f = getdvarint(#"hash_3c3e56404c9ca59c", 0) > 0;
    return weapon;
}

// Namespace loadout/player_loadout
// Params 4, eflags: 0x4
// Checksum 0x480e1d3f, Offset: 0x31b0
// Size: 0x208
function private give_weapon(weapon, slot, var_a6a8156, var_bc218695) {
    if (weapon != level.weaponnull) {
        if (isdefined(var_a6a8156)) {
            weapon_options = self [[ var_a6a8156 ]](var_bc218695);
        } else {
            weapon_options = 0;
        }
        self giveweapon(weapon, weapon_options);
        self function_442539(slot, weapon);
        if (self hasperk(#"specialty_extraammo")) {
            self givemaxammo(weapon);
        }
        changedspecialist = 0;
        changedspecialist = self.pers[#"changed_specialist"];
        if (weapon.isgadget) {
            self ability_util::gadget_reset(weapon, self.pers[#"changed_class"], !util::isoneround(), util::isfirstround(), changedspecialist);
        }
        self function_3fb8b14(weapon, self function_9b237966(self.class_num, "primary" == slot));
        self function_a85d2581(weapon, self function_73182cb6(self.class_num, "primary" == slot));
    } else {
        self function_442539(slot, level.weaponnone);
    }
    return weapon;
}

// Namespace loadout/player_loadout
// Params 4, eflags: 0x4
// Checksum 0x1e4d7543, Offset: 0x33c0
// Size: 0x68
function private function_d35292b6(var_c41b864, new_weapon, var_9691c281, var_8feec653) {
    spawn_weapon = var_c41b864;
    if (new_weapon != level.weaponnull) {
        if (spawn_weapon == level.weaponnull) {
            spawn_weapon = new_weapon;
        }
    }
    return spawn_weapon;
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x4
// Checksum 0x8ff34eb3, Offset: 0x3430
// Size: 0x98
function private function_286ee0b6(previous_weapon, spawn_weapon) {
    if (!self hasmaxprimaryweapons()) {
        if (!isusingt7melee()) {
            self giveweapon(level.weaponbasemeleeheld);
            return self function_d35292b6(spawn_weapon, level.weaponbasemeleeheld, previous_weapon, level.weaponbasemeleeheld);
        }
    }
    return spawn_weapon;
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0x9e3aada0, Offset: 0x34d0
// Size: 0x6c
function private function_ee9b8d55() {
    primary_weapon = function_18a77b37("primary");
    secondary_weapon = function_18a77b37("secondary");
    self bbclasschoice(self.class_num, primary_weapon, secondary_weapon);
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0x4ec800c0, Offset: 0x3548
// Size: 0xe0
function private function_d9035e42(weapon) {
    itemindex = getbaseweaponitemindex(weapon);
    iteminfo = getunlockableiteminfofromindex(itemindex, 1);
    if (iteminfo.loadoutslotname === "primary") {
        self.playerloadoutrestrictions.numprimaryweapons--;
        if (self.playerloadoutrestrictions.numprimaryweapons < 0) {
            return false;
        }
    } else if (iteminfo.loadoutslotname === "secondary") {
        self.playerloadoutrestrictions.var_ab1984e9--;
        if (self.playerloadoutrestrictions.var_ab1984e9 < 0) {
            return false;
        }
    }
    return true;
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0xef615925, Offset: 0x3630
// Size: 0x88
function private function_e229fb1(weapon) {
    foreach (attachment in weapon.attachments) {
        if (attachment === "uber") {
            return true;
        }
    }
    return false;
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0xd0339b17, Offset: 0x36c0
// Size: 0xae
function private function_ad874c55(weapon) {
    foreach (attachment in weapon.attachments) {
        if (attachment === "clantag" || attachment === "killcounter" || attachment === "custom2") {
            return true;
        }
    }
    return false;
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x4
// Checksum 0x6cc70963, Offset: 0x3778
// Size: 0x19c
function private function_3aa744b9(slot, weapon) {
    num_attachments = weapon.attachments.size;
    if (function_ad874c55(weapon)) {
        num_attachments--;
    }
    has_uber = function_e229fb1(weapon);
    if (has_uber) {
        num_attachments--;
    }
    if (slot === "primary") {
        self.playerloadoutrestrictions.var_355c3581 = self.playerloadoutrestrictions.var_355c3581 - num_attachments;
        if (self.playerloadoutrestrictions.var_355c3581 < 0) {
            return false;
        }
        if (has_uber || weapon.isdualwield) {
            self.playerloadoutrestrictions.var_882b6b71--;
            if (self.playerloadoutrestrictions.var_882b6b71 < 0) {
                return false;
            }
        }
    } else if (slot === "secondary") {
        self.playerloadoutrestrictions.var_934131b6 = self.playerloadoutrestrictions.var_934131b6 - num_attachments;
        if (self.playerloadoutrestrictions.var_934131b6 < 0) {
            return false;
        }
        if (has_uber || weapon.isdualwield) {
            self.playerloadoutrestrictions.var_c3fc8c73--;
            if (self.playerloadoutrestrictions.var_c3fc8c73 < 0) {
                return false;
            }
        }
    }
    return true;
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x4
// Checksum 0x6cd5fac2, Offset: 0x3920
// Size: 0x1c2
function private function_d126318c(slot, weapon) {
    var_b5bd8bd9 = 0;
    remove_uber = 0;
    if (slot === "primary") {
        var_b5bd8bd9 = self.playerloadoutrestrictions.var_355c3581;
        remove_uber = self.playerloadoutrestrictions.var_882b6b71 < 0;
    } else if (slot === "secondary") {
        var_b5bd8bd9 = self.playerloadoutrestrictions.var_934131b6;
        remove_uber = self.playerloadoutrestrictions.var_c3fc8c73 < 0;
    }
    attachments = arraycopy(weapon.attachments);
    max_index = attachments.size + var_b5bd8bd9;
    if (remove_uber) {
        arrayremovevalue(attachments, "uber");
    }
    for (i = attachments.size - 1; i >= max_index; i--) {
        arrayremoveindex(attachments, i);
    }
    rootweaponname = weapon.rootweapon.name;
    if (weapon.isdualwield) {
        if (#"smg_handling_t8_dw" == rootweaponname) {
            rootweaponname = #"smg_handling_t8";
        }
    }
    return getweapon(rootweaponname, attachments);
}

// Namespace loadout/player_loadout
// Params 5, eflags: 0x4
// Checksum 0x41e0227c, Offset: 0x3af0
// Size: 0x142
function private function_68c2f1dc(slot, previous_weapon, var_c41b864, var_fe5710f, var_60b97679) {
    loadout = self get_loadout_slot(slot);
    var_8feec653 = loadout.weapon;
    weapon = self function_2ada6938(slot);
    if (weapon != level.weaponnull) {
        if (!self function_d9035e42(weapon)) {
            weapon = level.weaponnull;
        } else if (!self function_3aa744b9(slot, weapon)) {
            weapon = self function_d126318c(slot, weapon);
        }
    }
    self give_weapon(weapon, slot, var_60b97679, var_fe5710f);
    return self function_d35292b6(var_c41b864, weapon, previous_weapon, var_8feec653);
}

// Namespace loadout/player_loadout
// Params 4, eflags: 0x4
// Checksum 0x138694f4, Offset: 0x3c40
// Size: 0x9a
function private function_cba7f33e(slot, previous_weapon, var_c41b864, var_4571c11d) {
    var_8feec653 = self function_18a77b37(slot);
    weapon = self function_2ada6938(slot);
    self [[ var_4571c11d ]](slot, previous_weapon);
    return self function_d35292b6(var_c41b864, weapon, previous_weapon, var_8feec653);
}

// Namespace loadout/player_loadout
// Params 3, eflags: 0x4
// Checksum 0x99a50c17, Offset: 0x3ce8
// Size: 0x62
function private give_hero_gadget(previous_weapon, var_c41b864, var_4571c11d) {
    var_8feec653 = self function_18a77b37("herogadget");
    self [[ var_4571c11d ]]("herogadget", previous_weapon);
    return var_c41b864;
}

// Namespace loadout/player_loadout
// Params 3, eflags: 0x4
// Checksum 0xc05746a8, Offset: 0x3d58
// Size: 0xb2
function private function_f20f595a(previous_weapon, var_c41b864, var_4571c11d) {
    var_8feec653 = self function_18a77b37("ultimate");
    if (isdefined(self.playerrole) && isdefined(self.playerrole.ultimateweapon)) {
        weapon = getweapon(self.playerrole.ultimateweapon);
        self [[ var_4571c11d ]]("ultimate", previous_weapon);
    }
    return var_c41b864;
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x0
// Checksum 0x9473a307, Offset: 0x3e18
// Size: 0x15a
function function_d98a8122(spawn_weapon) {
    if (!isdefined(self.spawnweapon) && isdefined(self.pers[#"spawnweapon"])) {
        self.spawnweapon = self.pers[#"spawnweapon"];
    }
    if (isdefined(self.spawnweapon) && doesweaponreplacespawnweapon(self.spawnweapon, spawn_weapon) && !self.pers[#"changed_class"]) {
        spawn_weapon = self.spawnweapon;
    }
    self thread initweaponattachments(spawn_weapon);
    self.pers[#"changed_class"] = 0;
    self.spawnweapon = spawn_weapon;
    self.pers[#"spawn_weapon"] = self.spawnweapon;
    if (spawn_weapon != level.weaponnone) {
        switchimmediate = isdefined(self.alreadysetspawnweapononce);
        self setspawnweapon(spawn_weapon, switchimmediate);
        self.alreadysetspawnweapononce = 1;
    }
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0x94839be3, Offset: 0x3f80
// Size: 0x23c
function private give_weapons(previous_weapon) {
    pixbeginevent(#"give_weapons");
    self.primaryloadoutgunsmithvariantindex = self getloadoutgunsmithvariantindex(self.class_num, 0);
    self.secondaryloadoutgunsmithvariantindex = self getloadoutgunsmithvariantindex(self.class_num, 1);
    spawn_weapon = self function_68c2f1dc("primary", previous_weapon, level.weaponnull, 0, &function_f4042786);
    spawn_weapon = self function_68c2f1dc("secondary", previous_weapon, spawn_weapon, 1, &get_weapon_options);
    spawn_weapon = self function_286ee0b6(previous_weapon, spawn_weapon);
    spawn_weapon = self function_cba7f33e("primarygrenade", previous_weapon, spawn_weapon, &function_8e961216);
    spawn_weapon = self function_cba7f33e("specialgrenade", previous_weapon, spawn_weapon, &function_c3448ab0);
    if (!(isdefined(level.specialistabilityenabled) && !level.specialistabilityenabled)) {
        spawn_weapon = self give_hero_gadget(previous_weapon, spawn_weapon, &give_special_offhand);
    }
    spawn_weapon = self function_f20f595a(previous_weapon, spawn_weapon, &give_ultimate);
    self function_d98a8122(spawn_weapon);
    self function_da96d067();
    self function_ee9b8d55();
    pixendevent();
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0xa906460c, Offset: 0x41c8
// Size: 0x14
function function_cdb86a18() {
    function_5536bd9e();
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0xcaef4b83, Offset: 0x41e8
// Size: 0x294
function function_5536bd9e() {
    has_specialty_armor = self hasperk(#"specialty_armor");
    healthtoassign = self.spawnhealth;
    if (isdefined(level.maxspawnhealthboostprct)) {
        self.bonusspawnhealth = int(level.maxspawnhealthboostprct * self.spawnhealth);
        healthtoassign = healthtoassign + self.bonusspawnhealth;
    }
    if (isdefined(self.var_71a70093)) {
        healthtoassign = self.var_71a70093;
    }
    self player::function_9080887a(healthtoassign);
    self.maxhealth = healthtoassign + (isdefined(level.var_90bb9821) ? level.var_90bb9821 : 0);
    new_health = self.var_66cb03ad < 0 ? healthtoassign : self.var_66cb03ad;
    give_armor = has_specialty_armor && (!isdefined(self.var_a06951b7) || self.var_a06951b7 < gettime());
    armor = give_armor ? self.spawnarmor : 0;
    self.health = new_health;
    self armor::set_armor(armor, armor, 0, self function_e95ae03(#"hash_56055daf9601d89e"), self function_e95ae03(#"hash_e7550a3c852687e"), self function_e95ae03(#"hash_5a20313f9a8825a9"), self function_e95ae03(#"hash_7c24b2a7dce26e8f"), 1, 1, 1);
    self.var_ed2f8b3a = self.spawnhealth;
    if (give_armor || isdefined(self.var_a06951b7) && self.var_a06951b7 < gettime()) {
        self.var_a06951b7 = undefined;
        clientfield::set_player_uimodel("hudItems.armorIsOnCooldown", 0);
    }
    self healthoverlay::restart_player_health_regen();
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x4
// Checksum 0xff1e9ffc, Offset: 0x4488
// Size: 0x4c4
function private function_8e961216(slot, previous_weapon) {
    pixbeginevent(#"hash_7187aa59ab81d21a");
    changedclass = self.pers[#"changed_class"];
    roundbased = !util::isoneround();
    firstround = util::isfirstround();
    changedspecialist = self.pers[#"changed_specialist"];
    primaryoffhand = level.weaponnone;
    var_46119dfa = 0;
    primaryoffhandcount = 0;
    primaryoffhandname = self function_b958b70d(self.class_num, "primarygrenade");
    if (primaryoffhandname == "default_specialist_equipment" && isdefined(self.playerrole) && isdefined(self.playerrole.primaryequipment)) {
        if (isdefined(level.var_50e97365) && level.var_50e97365) {
            primaryoffhandname = self.playerrole.primaryequipment;
        } else {
            primaryoffhandname = #"weapon_null";
        }
    }
    if (primaryoffhandname != #"" && primaryoffhandname != #"weapon_null") {
        primaryoffhand = getweapon(primaryoffhandname);
        var_46119dfa = self getloadoutitem(self.class_num, "primarygrenadecount");
        primaryoffhandcount = var_46119dfa ? 2 : 1;
        if (isdefined(self.pers[#"primarygrenadecount"]) && self.pers[#"primarygrenadecount"] < primaryoffhandcount && isdefined(self.pers[#"held_gadgets_power"]) && isdefined(self.pers[#"held_gadgets_power"][primaryoffhand])) {
            self.pers[#"held_gadgets_power"][primaryoffhand] = self.pers[#"held_gadgets_power"][primaryoffhand] * self.pers[#"primarygrenadecount"] / primaryoffhandcount;
        }
        self.pers[#"primarygrenadecount"] = primaryoffhandcount;
    }
    if (isitemrestricted(primaryoffhand.name) || !function_50797a7f(primaryoffhand.name)) {
        primaryoffhand = level.weaponnone;
        primaryoffhandcount = 0;
    }
    if (primaryoffhand == level.weaponnone || isdefined(level.specialistequipmentenabled) && !level.specialistequipmentenabled) {
        primaryoffhand = level.var_34d27b26;
        primaryoffhandcount = 0;
    }
    if (primaryoffhand != level.weaponnull) {
        self giveweapon(primaryoffhand);
        self setweaponammoclip(primaryoffhand, primaryoffhandcount);
        self switchtooffhand(primaryoffhand);
        loadout = self get_loadout_slot(slot);
        loadout.weapon = primaryoffhand;
        loadout.count = primaryoffhandcount;
        self ability_util::gadget_reset(primaryoffhand, changedclass, roundbased, firstround, changedspecialist);
        if (isdefined(level.specialistequipmentreadyonrespawn) && level.specialistequipmentreadyonrespawn) {
            self ability_util::function_36a15b60(primaryoffhand);
        }
    }
    pixendevent();
}

// Namespace loadout/player_loadout
// Params 3, eflags: 0x0
// Checksum 0xb122409, Offset: 0x4958
// Size: 0x46c
function function_c3448ab0(slot, previous_weapon, force_give_gadget_health_regen = 1) {
    pixbeginevent(#"hash_d790bf4ec8958ba");
    changedclass = self.pers[#"changed_class"];
    roundbased = !util::isoneround();
    firstround = util::isfirstround();
    changedspecialist = self.pers[#"changed_specialist"];
    secondaryoffhand = level.weaponnone;
    secondaryoffhandcount = 0;
    if (getdvarint(#"equipmentasgadgets", 0) == 1) {
        if (isdefined(self.playerrole) && isdefined(self.playerrole.secondaryequipment)) {
            secondaryoffhand = self.playerrole.secondaryequipment;
            secondaryoffhandcount = secondaryoffhand.startammo;
        }
    } else {
        secondaryoffhandname = self function_b958b70d(self.class_num, "specialgrenade");
        if (secondaryoffhandname != #"" && secondaryoffhandname != #"weapon_null") {
            secondaryoffhand = getweapon(secondaryoffhandname);
            secondaryoffhandcount = self getloadoutitem(self.class_num, "specialgrenadecount");
        }
    }
    if (isitemrestricted(secondaryoffhand.name) || !function_50797a7f(secondaryoffhand.name)) {
        secondaryoffhand = level.weaponnone;
        secondaryoffhandcount = 0;
    }
    if (secondaryoffhand == level.weaponnone) {
        secondaryoffhand = level.var_6388e216;
        secondaryoffhandcount = 0;
    }
    if (globallogic_utils::function_308e3379()) {
        secondaryoffhand = getweapon(#"hash_28323cd36d8b5f93");
        secondaryoffhandcount = 0;
    } else if (force_give_gadget_health_regen === 1 && level.new_health_model) {
        tactical_gear = self function_d78e0e04(self.class_num);
        if (#"gear_medicalinjectiongun" == tactical_gear) {
            secondaryoffhand = getweapon(#"gadget_medicalinjectiongun");
        } else if (level.specialisthealingenabled) {
            secondaryoffhand = getweapon(#"gadget_health_regen");
        }
        secondaryoffhandcount = 0;
    }
    if (secondaryoffhand != level.weaponnull) {
        self giveweapon(secondaryoffhand);
        self setweaponammoclip(secondaryoffhand, secondaryoffhandcount);
        self switchtooffhand(secondaryoffhand);
        loadout = self get_loadout_slot(slot);
        loadout.weapon = secondaryoffhand;
        loadout.count = secondaryoffhandcount;
        if (force_give_gadget_health_regen === 1) {
            self ability_util::function_36a15b60(secondaryoffhand);
        } else {
            self ability_util::gadget_reset(secondaryoffhand, changedclass, roundbased, firstround, changedspecialist);
        }
    }
    pixendevent();
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x4
// Checksum 0x3e208e7a, Offset: 0x4dd0
// Size: 0x454
function private give_special_offhand(slot, previous_weapon) {
    pixbeginevent(#"give_special_offhand");
    changedclass = self.pers[#"changed_class"];
    roundbased = !util::isoneround();
    firstround = util::isfirstround();
    changedspecialist = self.pers[#"changed_specialist"];
    classnum = self.class_num_for_global_weapons;
    specialoffhand = level.weaponnone;
    specialoffhandcount = 0;
    if (isdefined(self.playerrole) && isdefined(self.playerrole.var_c21d61e9)) {
        specialoffhand = getweapon(self.playerrole.var_c21d61e9);
        specialoffhandcount = specialoffhand.startammo;
    }
    /#
        if (getdvarstring(#"scr_herogadgetname_debug") != "<unknown string>") {
            herogadgetname = getdvarstring(#"scr_herogadgetname_debug");
            specialoffhand = level.weaponnone;
            if (herogadgetname != "<unknown string>") {
                specialoffhand = getweapon(herogadgetname);
            }
        }
    #/
    if (isdefined(self.pers[#"rouletteweapon"])) {
        assert(specialoffhand.name == "<unknown string>");
        specialoffhand = self.pers[#"rouletteweapon"];
    }
    if (isitemrestricted(specialoffhand.name) || !function_50797a7f(specialoffhand.name)) {
        specialoffhand = level.weaponnone;
        specialoffhandcount = 0;
    }
    if (specialoffhand == level.weaponnone) {
        specialoffhand = level.var_43a51921;
        specialoffhandcount = 0;
    }
    if (specialoffhand != level.weaponnull) {
        self giveweapon(specialoffhand);
        self setweaponammoclip(specialoffhand, specialoffhandcount);
        loadout = self get_loadout_slot("specialgrenade");
        loadout.weapon = specialoffhand;
        loadout.count = specialoffhandcount;
        self ability_util::gadget_reset(specialoffhand, changedclass, roundbased, firstround, changedspecialist);
        if (isdefined(level.specialistabilityreadyonrespawn) && level.specialistabilityreadyonrespawn) {
            self ability_util::function_36a15b60(specialoffhand);
        }
        if (isdefined(self.var_ad1472a2) && self.var_ad1472a2 && specialoffhand.name == #"eq_gravityslam") {
            gadgetslot = self gadgetgetslot(specialoffhand);
            self gadgetpowerchange(gadgetslot, 100 - specialoffhand.var_d911d477);
            self.var_ad1472a2 = 0;
        }
        self function_442539(slot, specialoffhand);
    }
    pixendevent();
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x4
// Checksum 0x9f01897f, Offset: 0x5230
// Size: 0x32c
function private give_ultimate(slot, previous_weapon) {
    pixbeginevent(#"give_ultimate");
    changedclass = self.pers[#"changed_class"];
    roundbased = !util::isoneround();
    firstround = util::isfirstround();
    changedspecialist = self.pers[#"changed_specialist"];
    classnum = self.class_num_for_global_weapons;
    ultimate = level.weaponnone;
    var_36aac800 = 0;
    if (isdefined(self.playerrole) && isdefined(self.playerrole.ultimateweapon)) {
        ultimate = getweapon(self.playerrole.ultimateweapon);
        var_36aac800 = ultimate.startammo;
    }
    /#
        if (getdvarstring(#"hash_488ee9aa10c06400") != "<unknown string>") {
            var_92d4ff6c = getdvarstring(#"hash_488ee9aa10c06400");
            ultimate = level.weaponnone;
            if (var_92d4ff6c != "<unknown string>") {
                ultimate = getweapon(var_92d4ff6c);
            }
        }
    #/
    if (isitemrestricted(ultimate.name) || !function_50797a7f(ultimate.name)) {
        ultimate = level.weaponnone;
        var_36aac800 = 0;
    }
    if (ultimate == level.weaponnone) {
        ultimate = level.var_387e902c;
        var_36aac800 = 0;
    }
    if (ultimate != level.weaponnull) {
        self giveweapon(ultimate);
        self setweaponammoclip(ultimate, var_36aac800);
        loadout = self get_loadout_slot("ultimate");
        loadout.weapon = ultimate;
        loadout.count = var_36aac800;
        self ability_util::gadget_reset(ultimate, changedclass, roundbased, firstround, changedspecialist);
        self function_442539(slot, ultimate);
    }
    pixendevent();
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x0
// Checksum 0x8a700a4d, Offset: 0x5568
// Size: 0x4e
function function_3d16577a(team, weaponclass) {
    /#
        level.var_8314ef9f = 1;
        self give_loadout(team, weaponclass);
        level.var_8314ef9f = undefined;
    #/
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x0
// Checksum 0x5a6bb33d, Offset: 0x55c0
// Size: 0x674
function give_loadout(team, weaponclass) {
    self endon(#"death");
    pixbeginevent(#"give_loadout");
    pixbeginevent(#"hash_d8a2ffe71c27024");
    self clientfield::set("cold_blooded", 0);
    if (function_87bcb1b()) {
        assert(isdefined(self.curclass));
        self function_d7c205b9(self.curclass, #"give_loadout");
        var_c8f2f688 = 1;
        /#
            if (level.var_8314ef9f === 1) {
                var_c8f2f688 = 0;
            }
        #/
        current_weapon = self getcurrentweapon();
        if (isdefined(self.var_560765bb) && self.var_560765bb >= gettime() && current_weapon != level.weaponnone) {
            return;
        }
        if (current_weapon == level.weaponnone && isdefined(self.class_num)) {
            current_weapon = self getloadoutweapon(self.class_num, "primary");
        }
        self setactionslot(3, "flourish_callouts");
        self setactionslot(4, "sprays_boasts");
        if (isdefined(level.givecustomloadout)) {
            spawn_weapon = self [[ level.givecustomloadout ]]();
            if (isdefined(spawn_weapon)) {
                self thread initweaponattachments(spawn_weapon);
            }
            self.spawnweapon = spawn_weapon;
        } else {
            hero_gadget = self function_18a77b37("herogadget");
            self.var_e74926dc = isdefined(hero_gadget) ? self getweaponammoclip(hero_gadget) : undefined;
            primary_grenade = self function_18a77b37("primarygrenade");
            self.var_d92d6743 = undefined;
            if (isdefined(primary_grenade)) {
                slot = self gadgetgetslot(primary_grenade);
                self.var_d92d6743 = self gadgetpowerget(slot);
            }
            self init_player(1);
            function_f436358b(weaponclass);
            allocationspent = self getloadoutallocation(self.class_num);
            overallocation = allocationspent > level.maxallocation;
            self function_8aa3ff4e();
            if (var_c8f2f688) {
                self function_e6f9e3cd();
                give_talents();
            }
            give_perks();
            give_weapons(current_weapon);
            function_5536bd9e();
            give_gesture();
            give_killstreaks();
            self.attackeraccuracy = self function_968b6c6a();
        }
    } else if (isdefined(level.givecustomloadout)) {
        spawn_weapon = self [[ level.givecustomloadout ]]();
        if (isdefined(spawn_weapon)) {
            self thread initweaponattachments(spawn_weapon);
        }
        self.spawnweapon = spawn_weapon;
    }
    self.var_e74926dc = undefined;
    self.var_d92d6743 = undefined;
    self detachall();
    if (isdefined(self.movementspeedmodifier)) {
        self setmovespeedscale(self.movementspeedmodifier * self getmovespeedscale());
    } else {
        self setmovespeedscale(1);
    }
    self cac_selector();
    specialistindex = self getspecialistindex();
    self.ability_medal_count = isdefined(self.pers["ability_medal_count" + specialistindex]) ? self.pers["ability_medal_count" + specialistindex] : 0;
    self.equipment_medal_count = isdefined(self.pers["equipment_medal_count" + specialistindex]) ? self.pers["equipment_medal_count" + specialistindex] : 0;
    self.firstspawn = 0;
    primary_weapon = function_18a77b37("primary");
    self function_43048d33(self.spawnweapon, primary_weapon);
    self notify(#"loadout_given");
    callback::callback(#"on_loadout");
    self thread function_b61852e1();
    pixendevent();
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0x3dbab482, Offset: 0x5c40
// Size: 0xac
function private function_b61852e1() {
    self endon(#"disconnect");
    self notify("25e412c683e8d36");
    self endon("25e412c683e8d36");
    waitframe(1);
    self luinotifyevent(#"hash_21e30e91084f7e66", 0);
    wait(0.1);
    self luinotifyevent(#"hash_21e30e91084f7e66", 0);
    wait(0.5);
    self luinotifyevent(#"hash_21e30e91084f7e66", 0);
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x4
// Checksum 0xca571068, Offset: 0x5cf8
// Size: 0x1a4
function private function_43048d33(spawn_weapon, primaryweapon) {
    if (!isdefined(self.firstspawn)) {
        if (isdefined(spawn_weapon)) {
            self initialweaponraise(spawn_weapon);
        } else if (isdefined(primaryweapon)) {
            self initialweaponraise(primaryweapon);
        }
    } else {
        self seteverhadweaponall(1);
    }
    if (isdefined(spawn_weapon)) {
        self function_c9a111a(spawn_weapon);
    } else if (isdefined(primaryweapon)) {
        self function_c9a111a(primaryweapon);
    }
    self.firstspawn = 0;
    self.switchedteamsresetgadgets = 0;
    self.var_560765bb = gettime();
    if (isdefined(self.pers[#"changed_specialist"]) && self.pers[#"changed_specialist"]) {
        self notify(#"changed_specialist");
        self callback::callback(#"changed_specialist");
        self.var_228b6835 = 1;
    } else {
        self.var_228b6835 = 0;
    }
    self.pers[#"changed_specialist"] = 0;
    self flagsys::set(#"loadout_given");
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0xabd1724e, Offset: 0x5ea8
// Size: 0xe4
function private on_player_connecting() {
    if (!isdefined(self)) {
        return;
    }
    self.pers[#"loadoutindex"] = 0;
    if (function_87bcb1b()) {
        if (!isdefined(self.pers[#"class"])) {
            self.pers[#"class"] = "";
        }
        self.curclass = self.pers[#"class"];
        self.lastclass = "";
        self function_c67222df();
        self function_d7c205b9(self.curclass);
    }
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x0
// Checksum 0xd1e8620d, Offset: 0x5f98
// Size: 0x1a
function function_53b62db1(newclass) {
    self.curclass = newclass;
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x0
// Checksum 0x9c60ab97, Offset: 0x5fc0
// Size: 0x1b4
function function_d7c205b9(newclass, calledfrom = #"unspecified") {
    loadoutindex = isdefined(newclass) ? get_class_num(newclass) : undefined;
    self.pers[#"loadoutindex"] = loadoutindex;
    var_45843e9a = calledfrom == #"give_loadout";
    var_7f8c24df = 0;
    if (!var_45843e9a) {
        var_7f8c24df = isdefined(game) && isdefined(game.state) && game.state == "playing" && isalive(self);
        if (var_7f8c24df && self.sessionstate == "playing") {
            var_25b0cd7 = self.usingsupplystation === 1;
            if (isdefined(level.ingraceperiod) && level.ingraceperiod && !(isdefined(self.hasdonecombat) && self.hasdonecombat) || var_25b0cd7) {
                var_7f8c24df = 0;
            }
        }
    }
    if (var_7f8c24df) {
        return;
    }
    self setloadoutindex(loadoutindex);
    self setplayerstateloadoutweapons(loadoutindex);
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0xc8f659bd, Offset: 0x6180
// Size: 0x126
function init_dvars() {
    level.cac_armorpiercing_data = getdvarint(#"perk_armorpiercing", 40) / 100;
    level.cac_bulletdamage_data = getdvarint(#"perk_bulletdamage", 35);
    level.cac_fireproof_data = getdvarint(#"perk_fireproof", 20);
    level.cac_armorvest_data = getdvarint(#"perk_armorvest", 80);
    level.cac_flakjacket_data = getdvarint(#"perk_flakjacket", 35);
    level.cac_flakjacket_hardcore_data = getdvarint(#"perk_flakjacket_hardcore", 9);
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0xaa10c2ac, Offset: 0x62b0
// Size: 0x88
function private cac_selector() {
    self.detectexplosives = 0;
    if (isdefined(self.specialty)) {
        perks = self.specialty;
        for (i = 0; i < perks.size; i++) {
            perk = perks[i];
            if (perk == "specialty_detectexplosive") {
                self.detectexplosives = 1;
            }
        }
    }
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x0
// Checksum 0x8a504bc1, Offset: 0x6340
// Size: 0xf4
function register_perks() {
    perks = self.specialty;
    perks::perk_reset_all();
    if (isdefined(perks) && isdefined(level.perksenabled) && level.perksenabled) {
        for (i = 0; i < perks.size; i++) {
            perk = perks[i];
            if (perk == #"specialty_null" || perk == #"weapon_null") {
                continue;
            }
            self perks::perk_setperk(perk);
        }
    }
    /#
        dev::giveextraperks();
    #/
}

// Namespace loadout/player_loadout
// Params 7, eflags: 0x0
// Checksum 0xe5c767fe, Offset: 0x6440
// Size: 0x65e
function cac_modified_damage(victim, attacker, damage, mod, weapon, inflictor, hitloc) {
    assert(isdefined(victim));
    assert(isdefined(attacker));
    assert(isplayer(victim));
    attacker_is_player = isplayer(attacker);
    if (damage <= 0) {
        return damage;
    }
    /#
        debug = 0;
        if (getdvarint(#"scr_perkdebug", 0)) {
            debug = 1;
            if (!isdefined(attacker.name)) {
                attacker.name = "<unknown string>";
            }
        }
    #/
    final_damage = damage;
    if (victim != attacker) {
        var_81ca51d = 1;
        if (attacker_is_player && attacker hasperk(#"specialty_bulletdamage") && isprimarydamage(mod)) {
            if (victim hasperk(#"specialty_armorvest") && !function_4c80bca1(hitloc)) {
                /#
                    if (debug) {
                        println("<unknown string>" + victim.name + "<unknown string>" + attacker.name + "<unknown string>");
                    }
                #/
            } else {
                final_damage = damage * (100 + level.cac_bulletdamage_data) / 100;
                /#
                    if (debug) {
                        println("<unknown string>" + attacker.name + "<unknown string>" + victim.name);
                    }
                #/
            }
        } else if (victim hasperk(#"specialty_armorvest") && isprimarydamage(mod) && !function_4c80bca1(hitloc)) {
            final_damage = damage * level.cac_armorvest_data * 0.01;
            /#
                if (debug) {
                    println("<unknown string>" + attacker.name + "<unknown string>" + victim.name);
                }
            #/
        } else if (victim hasperk(#"specialty_fireproof") && weapon_utils::isfiredamage(weapon, mod)) {
            final_damage = damage * level.cac_fireproof_data * 0.01;
            /#
                if (debug) {
                    println("<unknown string>" + attacker.name + "<unknown string>" + victim.name);
                }
            #/
        } else if (!var_81ca51d && victim hasperk(#"specialty_flakjacket") && weapon_utils::isexplosivedamage(mod) && !weapon.ignoresflakjacket && !victim grenade_stuck(inflictor)) {
            cac_data = level.hardcoremode ? level.cac_flakjacket_hardcore_data : level.cac_flakjacket_data;
            final_damage = int(damage * cac_data / 100);
            /#
                if (debug) {
                    println("<unknown string>" + victim.name + "<unknown string>" + attacker.name + "<unknown string>");
                }
            #/
        }
    }
    /#
        victim.cac_debug_damage_type = tolower(mod);
        victim.cac_debug_original_damage = damage;
        victim.cac_debug_final_damage = final_damage;
        victim.cac_debug_location = tolower(hitloc);
        victim.cac_debug_weapon = weapon.displayname;
        victim.cac_debug_range = int(distance(attacker.origin, victim.origin));
        if (debug) {
            println("<unknown string>" + final_damage / damage + "<unknown string>" + damage + "<unknown string>" + final_damage);
        }
    #/
    final_damage = int(final_damage);
    if (final_damage < 1) {
        final_damage = 1;
    }
    return final_damage;
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0x8277c5e3, Offset: 0x6aa8
// Size: 0x3e
function private function_4c80bca1(hitloc) {
    return hitloc == "helmet" || hitloc == "head" || hitloc == "neck";
}

// Namespace loadout/player_loadout
// Params 1, eflags: 0x4
// Checksum 0x4f7e7c31, Offset: 0x6af0
// Size: 0x38
function private grenade_stuck(inflictor) {
    return isdefined(inflictor) && isdefined(inflictor.stucktoplayer) && inflictor.stucktoplayer == self;
}

// Namespace loadout/player_loadout
// Params 2, eflags: 0x4
// Checksum 0x69182725, Offset: 0x6b30
// Size: 0x4c
function private offhealthregen(slot, weapon) {
    self gadgetdeactivate(self.gadget_health_regen_slot, self.gadget_health_regen_weapon);
    thread function_c57586b8();
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0x5b5505e, Offset: 0x6b88
// Size: 0x64
function private function_c57586b8() {
    self endon(#"disconnect");
    wait(0.5);
    self gadget_health_regen::power_off();
    if (isdefined(self.gadget_health_regen_slot)) {
        self function_19ed70ca(self.gadget_health_regen_slot, 1);
    }
}

// Namespace loadout/player_loadout
// Params 0, eflags: 0x4
// Checksum 0x1c6428cf, Offset: 0x6bf8
// Size: 0x586
function private function_8aa3ff4e() {
    wildcards = self function_6f2c0492(self.class_num);
    self.playerloadoutrestrictions = spawnstruct();
    self.playerloadoutrestrictions.numprimaryweapons = isdefined(level.playerloadoutrestrictions[0].numprimaryweapons) ? level.playerloadoutrestrictions[0].numprimaryweapons : 0;
    self.playerloadoutrestrictions.var_355c3581 = isdefined(level.playerloadoutrestrictions[0].var_355c3581) ? level.playerloadoutrestrictions[0].var_355c3581 : 0;
    self.playerloadoutrestrictions.var_882b6b71 = isdefined(level.playerloadoutrestrictions[0].var_882b6b71) ? level.playerloadoutrestrictions[0].var_882b6b71 : 0;
    self.playerloadoutrestrictions.var_ab1984e9 = isdefined(level.playerloadoutrestrictions[0].var_ab1984e9) ? level.playerloadoutrestrictions[0].var_ab1984e9 : 0;
    self.playerloadoutrestrictions.var_934131b6 = isdefined(level.playerloadoutrestrictions[0].var_934131b6) ? level.playerloadoutrestrictions[0].var_934131b6 : 0;
    self.playerloadoutrestrictions.var_c3fc8c73 = isdefined(level.playerloadoutrestrictions[0].var_c3fc8c73) ? level.playerloadoutrestrictions[0].var_c3fc8c73 : 0;
    self.playerloadoutrestrictions.var_a2ef45f8 = isdefined(level.playerloadoutrestrictions[0].var_a2ef45f8) ? level.playerloadoutrestrictions[0].var_a2ef45f8 : 0;
    self.playerloadoutrestrictions.var_cd3db98c = isdefined(level.playerloadoutrestrictions[0].var_cd3db98c) ? level.playerloadoutrestrictions[0].var_cd3db98c : 0;
    self.playerloadoutrestrictions.var_25a22f4 = isdefined(level.playerloadoutrestrictions[0].var_25a22f4) ? level.playerloadoutrestrictions[0].var_25a22f4 : 0;
    if (isdefined(wildcards) && wildcards.size > 0) {
        foreach (var_9bb0ceab in wildcards) {
            var_47dbd1c3 = level.playerloadoutrestrictions[var_9bb0ceab];
            if (isdefined(var_47dbd1c3)) {
                self.playerloadoutrestrictions.numprimaryweapons = self.playerloadoutrestrictions.numprimaryweapons + (isdefined(var_47dbd1c3.numprimaryweapons) ? var_47dbd1c3.numprimaryweapons : 0);
                self.playerloadoutrestrictions.var_355c3581 = self.playerloadoutrestrictions.var_355c3581 + (isdefined(var_47dbd1c3.var_355c3581) ? var_47dbd1c3.var_355c3581 : 0);
                self.playerloadoutrestrictions.var_882b6b71 = self.playerloadoutrestrictions.var_882b6b71 + (isdefined(var_47dbd1c3.var_882b6b71) ? var_47dbd1c3.var_882b6b71 : 0);
                self.playerloadoutrestrictions.var_ab1984e9 = self.playerloadoutrestrictions.var_ab1984e9 + (isdefined(var_47dbd1c3.var_ab1984e9) ? var_47dbd1c3.var_ab1984e9 : 0);
                self.playerloadoutrestrictions.var_934131b6 = self.playerloadoutrestrictions.var_934131b6 + (isdefined(var_47dbd1c3.var_934131b6) ? var_47dbd1c3.var_934131b6 : 0);
                self.playerloadoutrestrictions.var_c3fc8c73 = self.playerloadoutrestrictions.var_c3fc8c73 + (isdefined(var_47dbd1c3.var_c3fc8c73) ? var_47dbd1c3.var_c3fc8c73 : 0);
                self.playerloadoutrestrictions.var_a2ef45f8 = self.playerloadoutrestrictions.var_a2ef45f8 + (isdefined(var_47dbd1c3.var_a2ef45f8) ? var_47dbd1c3.var_a2ef45f8 : 0);
                self.playerloadoutrestrictions.var_cd3db98c = self.playerloadoutrestrictions.var_cd3db98c + (isdefined(var_47dbd1c3.var_cd3db98c) ? var_47dbd1c3.var_cd3db98c : 0);
                self.playerloadoutrestrictions.var_25a22f4 = self.playerloadoutrestrictions.var_25a22f4 + (isdefined(var_47dbd1c3.var_25a22f4) ? var_47dbd1c3.var_25a22f4 : 0);
            }
        }
    }
}


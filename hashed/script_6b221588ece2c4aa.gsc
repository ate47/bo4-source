// Atian COD Tools GSC decompiler test
#include scripts/weapons/weaponobjects.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/util_shared.gsc;

#namespace weaponobjects;

// Namespace weaponobjects/namespace_4c668920
// Params 0, eflags: 0x1 linked
// Checksum 0x6f1ee32b, Offset: 0xd8
// Size: 0x1cc
function function_b455d5d8() {
    function_e6400478(#"hatchet", &createhatchetwatcher, 1);
    function_e6400478(#"tactical_insertion", &createtactinsertwatcher, 1);
    function_e6400478(#"rcbomb", &creatercbombwatcher, 1);
    function_e6400478(#"qrdrone", &createqrdronewatcher, 1);
    function_e6400478(#"helicopter_player", &createplayerhelicopterwatcher, 1);
    function_e6400478(#"tr_flechette_t8", &function_1eaa3e20);
    function_e6400478(#"hash_17ac9a2101b6ff2d", &function_1eaa3e20);
    if (isdefined(level.var_b68902c4) && level.var_b68902c4) {
        function_e6400478(#"tr_flechette_t8_upgraded", &function_1eaa3e20);
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x1 linked
// Checksum 0x5cc76fc1, Offset: 0x2b0
// Size: 0xf6
function createspecialcrossbowwatchertypes(watcher) {
    watcher.ondetonatecallback = &deleteent;
    watcher.ondamage = &voidondamage;
    if (isdefined(level.var_32db78d1) && level.var_32db78d1) {
        watcher.onspawn = &onspawncrossbowboltimpact;
        watcher.onspawnretrievetriggers = &voidonspawnretrievetriggers;
        watcher.pickup = &voidpickup;
    } else {
        watcher.onspawn = &onspawncrossbowbolt;
        watcher.onspawnretrievetriggers = &function_23b0aea9;
        watcher.pickup = &function_d9219ce2;
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 0, eflags: 0x0
// Checksum 0x2e114810, Offset: 0x3b0
// Size: 0x104
function function_f297d773() {
    function_e6400478(#"special_crossbow_t8", &createspecialcrossbowwatchertypes, 1);
    function_e6400478(#"special_crossbowlh", &createspecialcrossbowwatchertypes, 1);
    function_e6400478(#"special_crossbow_dw", &createspecialcrossbowwatchertypes, 1);
    if (isdefined(level.var_6a438cde) && level.var_6a438cde) {
        function_e6400478(#"special_crossbow_t8_upgraded", &createspecialcrossbowwatchertypes, 1);
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x1 linked
// Checksum 0xeb0c9abd, Offset: 0x4c0
// Size: 0x26
function function_1eaa3e20(watcher) {
    watcher.notequipment = 1;
    watcher.onfizzleout = undefined;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x1 linked
// Checksum 0x9ffe44af, Offset: 0x4f0
// Size: 0xae
function createhatchetwatcher(watcher) {
    watcher.ondetonatecallback = &deleteent;
    watcher.onspawn = &onspawnhatchet;
    watcher.ondamage = &voidondamage;
    watcher.onspawnretrievetriggers = &function_23b0aea9;
    if (!sessionmodeiswarzonegame()) {
        watcher.timeout = 120;
    }
    watcher.pickup = &function_d9219ce2;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x1 linked
// Checksum 0xc8f5f2d1, Offset: 0x5a8
// Size: 0x1a
function createtactinsertwatcher(watcher) {
    watcher.playdestroyeddialog = 0;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x1 linked
// Checksum 0x5b1d009, Offset: 0x5d0
// Size: 0x86
function creatercbombwatcher(watcher) {
    watcher.altdetonate = 0;
    watcher.var_cf3d8844 = 1;
    watcher.ownergetsassist = 1;
    watcher.playdestroyeddialog = 0;
    watcher.deleteonkillbrush = 0;
    watcher.ondetonatecallback = level.var_19b42c74;
    watcher.stuntime = 1;
    watcher.notequipment = 1;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x1 linked
// Checksum 0xe3d64544, Offset: 0x660
// Size: 0x9a
function createqrdronewatcher(watcher) {
    watcher.altdetonate = 0;
    watcher.var_cf3d8844 = 1;
    watcher.ownergetsassist = 1;
    watcher.playdestroyeddialog = 0;
    watcher.deleteonkillbrush = 0;
    watcher.ondetonatecallback = level.var_97b3d697;
    watcher.ondamage = level.var_5a2f8f1f;
    watcher.stuntime = 5;
    watcher.notequipment = 1;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x1 linked
// Checksum 0x7eeb86ea, Offset: 0x708
// Size: 0xb0
function getspikelauncheractivespikecount(watcher) {
    var_10deeef2 = 0;
    foreach (obj in watcher.objectarray) {
        if (isdefined(obj) && obj.item !== watcher.weapon) {
            var_10deeef2++;
        }
    }
    return var_10deeef2;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x0
// Checksum 0xb48c58c7, Offset: 0x7c0
// Size: 0x10e
function watchspikelauncheritemcountchanged(watcher) {
    self endon(#"death");
    var_328f5bc4 = undefined;
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"weapon_change");
        weapon = waitresult.weapon;
        while (weapon.name == #"spike_launcher") {
            var_10deeef2 = getspikelauncheractivespikecount(watcher);
            if (var_10deeef2 !== var_328f5bc4) {
                self setcontrolleruimodelvalue("spikeLauncherCounter.spikesReady", var_10deeef2);
                var_328f5bc4 = var_10deeef2;
            }
            wait(0.1);
            weapon = self getcurrentweapon();
        }
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x1 linked
// Checksum 0x2ea3f1be, Offset: 0x8d8
// Size: 0x84
function spikesdetonating(watcher) {
    var_ed2f4efe = getspikelauncheractivespikecount(watcher);
    if (var_ed2f4efe > 0) {
        self setcontrolleruimodelvalue("spikeLauncherCounter.blasting", 1);
        wait(2);
        self setcontrolleruimodelvalue("spikeLauncherCounter.blasting", 0);
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x0
// Checksum 0xaf26a396, Offset: 0x968
// Size: 0x146
function createspikelauncherwatcher(watcher) {
    watcher.altname = #"spike_charge";
    watcher.altweapon = getweapon(#"spike_charge");
    watcher.altdetonate = 0;
    watcher.watchforfire = 1;
    watcher.hackable = 1;
    watcher.hackertoolradius = level.equipmenthackertoolradius;
    watcher.hackertooltimems = level.equipmenthackertooltimems;
    watcher.ondetonatecallback = &spikedetonate;
    watcher.onstun = &weaponstun;
    watcher.stuntime = 1;
    watcher.ownergetsassist = 1;
    watcher.detonatestationary = 0;
    watcher.detonationdelay = 0;
    watcher.detonationsound = #"wpn_claymore_alert";
    watcher.ondetonationhandle = &spikesdetonating;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x1 linked
// Checksum 0xcd7f2b66, Offset: 0xab8
// Size: 0x2a
function createplayerhelicopterwatcher(watcher) {
    watcher.altdetonate = 1;
    watcher.notequipment = 1;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x0
// Checksum 0x29f2ee4d, Offset: 0xaf0
// Size: 0x56
function function_50d4198b(watcher) {
    watcher.hackable = 0;
    watcher.headicon = 0;
    watcher.deleteonplayerspawn = 0;
    watcher.enemydestroy = 0;
    watcher.onspawn = &function_f0e307a2;
}

// Namespace weaponobjects/namespace_4c668920
// Params 2, eflags: 0x1 linked
// Checksum 0x907b50d4, Offset: 0xb50
// Size: 0xc4
function function_f0e307a2(watcher, player) {
    level endon(#"game_ended");
    self endon(#"death");
    if (isdefined(player)) {
        player stats::function_e24eec31(self.weapon, #"used", 1);
    }
    self playloopsound(#"uin_c4_air_alarm_loop");
    self waittilltimeout(10, #"stationary");
    function_b70eb3a9(watcher, player);
}

// Namespace weaponobjects/namespace_4c668920
// Params 2, eflags: 0x1 linked
// Checksum 0xfa0d7872, Offset: 0xc20
// Size: 0xc4
function function_b70eb3a9(watcher, player) {
    pos = self.origin + vectorscale((0, 0, 1), 15);
    self.var_faa71693 = spawn("trigger_radius", pos, 0, 50, 50);
    self.var_faa71693 setteamfortrigger(player.team);
    self.var_faa71693.owner = player;
    self thread function_5742754c();
    self thread function_42eeab72(self);
}

// Namespace weaponobjects/namespace_4c668920
// Params 0, eflags: 0x1 linked
// Checksum 0xc53c4de0, Offset: 0xcf0
// Size: 0x170
function function_5742754c() {
    station = self;
    station endon(#"death");
    if (!isdefined(station.var_e66dbbd1)) {
        station.var_e66dbbd1 = 0;
    }
    /#
        assert(isdefined(station.var_faa71693));
    #/
    trigger = station.var_faa71693;
    while (isdefined(trigger)) {
        waitresult = undefined;
        waitresult = trigger waittill(#"touch");
        player = waitresult.entity;
        if (!isplayer(player)) {
            continue;
        }
        if (!isalive(player)) {
            continue;
        }
        if (isdefined(trigger.team) && util::function_fbce7263(player.team, trigger.team)) {
            continue;
        }
        station function_e98cee52(player, station);
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 2, eflags: 0x1 linked
// Checksum 0xecc41cc1, Offset: 0xe68
// Size: 0x16c
function function_e98cee52(player, station) {
    primary_weapons = player getweaponslistprimaries();
    var_c20b09e1 = 0;
    foreach (weapon in primary_weapons) {
        var_c20b09e1 = var_c20b09e1 | player function_61bdb626(weapon);
    }
    if (!var_c20b09e1) {
        return;
    }
    if (!isdefined(station.var_99c10edf)) {
        station.var_99c10edf = [];
    }
    station.var_99c10edf[player getentitynumber()] = gettime();
    station.var_e66dbbd1++;
    if (station.var_e66dbbd1 >= 1) {
        station function_f47cd4cb();
        station delete();
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x1 linked
// Checksum 0x116c4560, Offset: 0xfe0
// Size: 0xb8
function function_61bdb626(weapon) {
    player = self;
    var_d54bce7 = weapon.clipsize;
    stockammo = player getweaponammostock(weapon);
    player setweaponammostock(weapon, int(stockammo + var_d54bce7));
    newammo = player getweaponammostock(weapon);
    return newammo > stockammo;
}

// Namespace weaponobjects/namespace_4c668920
// Params 1, eflags: 0x1 linked
// Checksum 0xdaecc0df, Offset: 0x10a0
// Size: 0x34
function function_42eeab72(station) {
    self waittill(#"death");
    self function_f47cd4cb();
}

// Namespace weaponobjects/namespace_4c668920
// Params 0, eflags: 0x1 linked
// Checksum 0x3c03a841, Offset: 0x10e0
// Size: 0x2c
function function_f47cd4cb() {
    if (isdefined(self.var_faa71693)) {
        self.var_faa71693 delete();
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 2, eflags: 0x1 linked
// Checksum 0xc19cf275, Offset: 0x1118
// Size: 0xe4
function delayedspikedetonation(attacker, weapon) {
    if (!isdefined(self.owner.var_98332466)) {
        self.owner.var_98332466 = 0;
    }
    delaytime = self.owner.var_98332466;
    owner = self.owner;
    self.owner.var_98332466 = self.owner.var_98332466 + 0.3;
    waittillframeend();
    wait(delaytime);
    owner.var_98332466 = owner.var_98332466 - 0.3;
    if (isdefined(self)) {
        self weapondetonate(attacker, weapon);
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 3, eflags: 0x1 linked
// Checksum 0x8c21c52d, Offset: 0x1208
// Size: 0x6c
function spikedetonate(attacker, weapon, target) {
    if (isdefined(weapon) && weapon.isvalid) {
        if (isdefined(attacker)) {
            if (self.owner util::isenemyplayer(attacker)) {
            }
        }
    }
    thread delayedspikedetonation(attacker, weapon);
}

// Namespace weaponobjects/namespace_4c668920
// Params 2, eflags: 0x1 linked
// Checksum 0x7a42ed3, Offset: 0x1280
// Size: 0x38
function onspawnhatchet(watcher, player) {
    if (isdefined(level.var_5c1e9085)) {
        player [[ level.var_5c1e9085 ]]();
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 2, eflags: 0x1 linked
// Checksum 0x78ce9d35, Offset: 0x12c0
// Size: 0x3c
function onspawncrossbowbolt(watcher, player) {
    self.delete_on_death = 1;
    self thread onspawncrossbowbolt_internal(watcher, player);
}

// Namespace weaponobjects/namespace_4c668920
// Params 2, eflags: 0x1 linked
// Checksum 0x7295c385, Offset: 0x1308
// Size: 0xdc
function onspawncrossbowbolt_internal(watcher, player) {
    player endon(#"disconnect");
    self endon(#"death");
    wait(0.25);
    var_c53b5b70 = self getlinkedent();
    if (!isdefined(var_c53b5b70) || !isvehicle(var_c53b5b70)) {
        self.takedamage = 0;
    } else {
        self.takedamage = 1;
        if (isvehicle(var_c53b5b70)) {
            self thread dieonentitydeath(var_c53b5b70, player);
        }
    }
}

// Namespace weaponobjects/namespace_4c668920
// Params 2, eflags: 0x1 linked
// Checksum 0x8154f0b9, Offset: 0x13f0
// Size: 0x3c
function onspawncrossbowboltimpact(s_watcher, e_player) {
    self.delete_on_death = 1;
    self thread onspawncrossbowboltimpact_internal(s_watcher, e_player);
}

// Namespace weaponobjects/namespace_4c668920
// Params 2, eflags: 0x1 linked
// Checksum 0x46c3401, Offset: 0x1438
// Size: 0x104
function onspawncrossbowboltimpact_internal(s_watcher, e_player) {
    self endon(#"death");
    e_player endon(#"disconnect");
    self waittill(#"stationary");
    s_watcher thread waitandfizzleout(self, 0);
    foreach (n_index, e_object in s_watcher.objectarray) {
        if (self == e_object) {
            n_index = [];
        }
    }
    cleanweaponobjectarray(s_watcher);
}

// Namespace weaponobjects/namespace_4c668920
// Params 2, eflags: 0x1 linked
// Checksum 0x6e3d80d4, Offset: 0x1548
// Size: 0xb6
function dieonentitydeath(entity, player) {
    player endon(#"disconnect");
    self endon(#"death");
    var_9a9f4be2 = entity.dead === 1 || isdefined(entity.health) && entity.health < 0;
    if (!var_9a9f4be2) {
        entity waittill(#"death");
    }
    self notify(#"death");
}


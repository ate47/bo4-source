// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/archetype_utility.gsc;
#include script_4c5c4a64a59247a2;
#include scripts/core_common/name_shared.gsc;

#namespace init;

// Namespace init/init
// Params 1, eflags: 0x1 linked
// Checksum 0x5b7a63c, Offset: 0xc0
// Size: 0xd6
function initweapon(weapon) {
    self.weaponinfo[weapon.name] = spawnstruct();
    self.weaponinfo[weapon.name].position = "none";
    self.weaponinfo[weapon.name].var_638ddb07 = 1;
    if (isdefined(weapon.clipmodel)) {
        self.weaponinfo[weapon.name].var_d49f07d5 = 1;
    } else {
        self.weaponinfo[weapon.name].var_d49f07d5 = 0;
    }
}

// Namespace init/init
// Params 0, eflags: 0x1 linked
// Checksum 0xea0388f, Offset: 0x1a0
// Size: 0x46a
function main() {
    self.a = spawnstruct();
    self.a.var_a5b8e231 = [];
    if (self.weapon == level.weaponnone) {
        self aiutility::setcurrentweapon(level.weaponnone);
    }
    self aiutility::setprimaryweapon(self.weapon);
    if (self.secondaryweapon == level.weaponnone) {
        self aiutility::setsecondaryweapon(level.weaponnone);
    }
    self aiutility::setsecondaryweapon(self.secondaryweapon);
    self aiutility::setcurrentweapon(self.primaryweapon);
    self.var_96db7167 = self.primaryweapon;
    self.var_f2eb1a69 = self.secondaryweapon;
    self initweapon(self.primaryweapon);
    self initweapon(self.secondaryweapon);
    self initweapon(self.sidearm);
    self.var_7f75cf1c = array("left", "right", "chest", "back");
    for (i = 0; i < self.var_7f75cf1c.size; i++) {
        self.a.var_a5b8e231[self.var_7f75cf1c[i]] = level.weaponnone;
    }
    self.lastweapon = self.weapon;
    firstinit();
    self.a.rockets = 3;
    self.a.var_42ce0bc1 = 1;
    self.a.pose = "stand";
    self.a.var_d80411b2 = self.a.pose;
    self.a.movement = "stop";
    self.a.special = "none";
    self.a.gunhand = "none";
    shared::placeweaponon(self.primaryweapon, "right");
    if (isdefined(self.secondaryweaponclass) && self.secondaryweaponclass != "none" && self.secondaryweaponclass != "pistol") {
        shared::placeweaponon(self.secondaryweapon, "back");
    }
    self.a.var_2b93b565 = gettime();
    self.a.var_b3a03f9a = 0;
    self.a.var_2c477e18 = 0;
    self.rightaimlimit = 45;
    self.leftaimlimit = -45;
    self.upaimlimit = 45;
    self.downaimlimit = -45;
    self.walk = 0;
    self.sprint = 0;
    self.a.postscriptfunc = undefined;
    self.var_21e45989 = self.accuracy;
    if (!isdefined(self.script_accuracy)) {
        self.script_accuracy = 1;
    }
    self.a.var_af0e9c5e = 0;
    self.ai.bulletsinclip = self.weapon.clipsize;
    self.var_4ee8e8b7 = 0;
    self.var_4ab473e4 = 0;
    self.suppressed = 0;
    self.var_7358cc81 = 0;
    self.suppressionthreshold = 0.75;
    self.var_8a8b8134 = 128;
    self.reacquire_state = 0;
}

// Namespace init/init
// Params 0, eflags: 0x0
// Checksum 0xfe73ee6f, Offset: 0x618
// Size: 0x2c
function setnameandrank() {
    self endon(#"death");
    self name::get();
}

// Namespace init/init
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x650
// Size: 0x4
function donothing() {
    
}

// Namespace init/init
// Params 0, eflags: 0x0
// Checksum 0x783a5e7b, Offset: 0x660
// Size: 0x3a
function set_anim_playback_rate() {
    self.var_e72aff62 = 0.9 + randomfloat(0.2);
    self.var_bf7cfad9 = 1;
}

// Namespace init/init
// Params 0, eflags: 0x0
// Checksum 0x89c0b4d6, Offset: 0x6a8
// Size: 0x34
function trackvelocity() {
    self endon(#"death");
    for (;;) {
        self.var_3e61bab9 = self.origin;
        wait(0.2);
    }
}

// Namespace init/init
// Params 1, eflags: 0x0
// Checksum 0xfd6a6f6b, Offset: 0x6e8
// Size: 0x400
function checkapproachangles(var_9089e49a) {
    /#
        idealtransangles[1] = 45;
        idealtransangles[2] = 0;
        idealtransangles[3] = -45;
        idealtransangles[4] = 90;
        idealtransangles[6] = -90;
        idealtransangles[7] = 135;
        idealtransangles[8] = 180;
        idealtransangles[9] = -135;
        waitframe(1);
        for (i = 1; i <= 9; i++) {
            for (j = 0; j < var_9089e49a.size; j++) {
                trans = var_9089e49a[j];
                idealadd = 0;
                if (trans == "<unknown string>" || trans == "<unknown string>") {
                    idealadd = 90;
                } else if (trans == "<unknown string>" || trans == "<unknown string>") {
                    idealadd = -90;
                }
                if (isdefined(anim.var_efe5d7c1[trans][i])) {
                    correctangle = angleclamp180(idealtransangles[i] + idealadd);
                    actualangle = angleclamp180(anim.var_efe5d7c1[trans][i]);
                    if (absangleclamp180(actualangle - correctangle) > 7) {
                        println("<unknown string>" + trans + "<unknown string>" + i + "<unknown string>" + actualangle + "<unknown string>" + correctangle + "<unknown string>");
                    }
                }
            }
        }
        for (i = 1; i <= 9; i++) {
            for (j = 0; j < var_9089e49a.size; j++) {
                trans = var_9089e49a[j];
                idealadd = 0;
                if (trans == "<unknown string>" || trans == "<unknown string>") {
                    idealadd = 90;
                } else if (trans == "<unknown string>" || trans == "<unknown string>") {
                    idealadd = -90;
                }
                if (isdefined(anim.var_1604aa3e[trans][i])) {
                    correctangle = angleclamp180(-1 * (idealtransangles[i] + idealadd + 180));
                    actualangle = angleclamp180(anim.var_1604aa3e[trans][i]);
                    if (absangleclamp180(actualangle - correctangle) > 7) {
                        println("<unknown string>" + trans + "<unknown string>" + i + "<unknown string>" + actualangle + "<unknown string>" + correctangle + "<unknown string>");
                    }
                }
            }
        }
    #/
}

// Namespace init/init
// Params 2, eflags: 0x0
// Checksum 0xeb1fcbb2, Offset: 0xaf0
// Size: 0x2a
function getexitsplittime(var_e5a8a5e8, dir) {
    return anim.var_e863185a[var_e5a8a5e8][dir];
}

// Namespace init/init
// Params 2, eflags: 0x0
// Checksum 0x9c9bd793, Offset: 0xb28
// Size: 0x2a
function gettranssplittime(var_e5a8a5e8, dir) {
    return anim.var_e643a2a[var_e5a8a5e8][dir];
}

// Namespace init/init
// Params 0, eflags: 0x1 linked
// Checksum 0xd73d8988, Offset: 0xb60
// Size: 0x1c6
function firstinit() {
    if (isdefined(anim.var_785f9b07)) {
        return;
    }
    anim.var_785f9b07 = 1;
    anim.var_cb7674ab[#"player_frag_grenade_sp"] = randomintrange(1000, 20000);
    anim.var_cb7674ab[#"player_flash_grenade_sp"] = randomintrange(1000, 20000);
    anim.var_cb7674ab[#"player_double_grenade"] = randomintrange(10000, 60000);
    anim.var_cb7674ab[#"ai_frag_grenade_sp"] = randomintrange(0, 20000);
    anim.var_cb7674ab[#"ai_flash_grenade_sp"] = randomintrange(0, 20000);
    anim.var_bb6e6482 = 0;
    anim.var_8e7defeb = 1000000;
    anim.var_ef2ee752 = 1000000;
    thread setnextplayergrenadetime();
    if (!isdefined(level.flag)) {
        level.flag = [];
    }
    level.var_27e6c80b = undefined;
    anim.covercrouchleanpitch = -55;
}

// Namespace init/init
// Params 0, eflags: 0x0
// Checksum 0x1eaf3771, Offset: 0xd30
// Size: 0x32
function onplayerconnect() {
    player = self;
    firstinit();
    player.var_cbc0589f = 0;
}

// Namespace init/init
// Params 0, eflags: 0x1 linked
// Checksum 0x6dfbafbf, Offset: 0xd70
// Size: 0x172
function setnextplayergrenadetime() {
    waittillframeend();
    if (isdefined(anim.var_1bac0190)) {
        maxtime = int(anim.var_1bac0190 * 0.7);
        if (maxtime < 1) {
            maxtime = 1;
        }
        anim.var_cb7674ab[#"player_frag_grenade_sp"] = randomintrange(0, maxtime);
        anim.var_cb7674ab[#"player_flash_grenade_sp"] = randomintrange(0, maxtime);
    }
    if (isdefined(anim.var_a06a61a0)) {
        maxtime = int(anim.var_a06a61a0);
        mintime = int(maxtime / 2);
        if (maxtime <= mintime) {
            maxtime = mintime + 1;
        }
        anim.var_cb7674ab[#"player_double_grenade"] = randomintrange(mintime, maxtime);
    }
}

// Namespace init/init
// Params 1, eflags: 0x1 linked
// Checksum 0x3e29b032, Offset: 0xef0
// Size: 0xdc
function addtomissiles(grenade) {
    if (!isdefined(level.missileentities)) {
        level.missileentities = [];
    }
    if (!isdefined(level.missileentities)) {
        level.missileentities = [];
    } else if (!isarray(level.missileentities)) {
        level.missileentities = array(level.missileentities);
    }
    level.missileentities[level.missileentities.size] = grenade;
    while (isdefined(grenade)) {
        waitframe(1);
    }
    arrayremovevalue(level.missileentities, grenade);
}

// Namespace init/grenade_fire
// Params 1, eflags: 0x40
// Checksum 0xb0ff18de, Offset: 0xfd8
// Size: 0x74
function event<grenade_fire> function_960adbea(eventstruct) {
    grenade = eventstruct.projectile;
    weapon = eventstruct.weapon;
    if (isdefined(grenade)) {
        grenade.owner = self;
        grenade.weapon = weapon;
        level thread addtomissiles(grenade);
    }
}

// Namespace init/grenade_launcher_fire
// Params 1, eflags: 0x40
// Checksum 0xbf4e1fe8, Offset: 0x1058
// Size: 0x64
function event<grenade_launcher_fire> function_c6ddaa47(eventstruct) {
    eventstruct.projectile.owner = self;
    eventstruct.projectile.weapon = eventstruct.weapon;
    level thread addtomissiles(eventstruct.projectile);
}

// Namespace init/missile_fire
// Params 1, eflags: 0x40
// Checksum 0xb07ec8b4, Offset: 0x10c8
// Size: 0x64
function event<missile_fire> function_596d3a28(eventstruct) {
    eventstruct.projectile.owner = self;
    eventstruct.projectile.weapon = eventstruct.weapon;
    level thread addtomissiles(eventstruct.projectile);
}

// Namespace init/init
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1138
// Size: 0x4
function end_script() {
    
}


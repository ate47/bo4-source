// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai\systems\shared.gsc;
#using scripts\core_common\name_shared.gsc;

#namespace init;

// Namespace init/init
// Params 1, eflags: 0x1 linked
// Checksum 0x5b7a63c, Offset: 0xc0
// Size: 0xd6
function initweapon(weapon) {
    self.weaponinfo[weapon.name] = spawnstruct();
    self.weaponinfo[weapon.name].position = "none";
    self.weaponinfo[weapon.name].hasclip = 1;
    if (isdefined(weapon.clipmodel)) {
        self.weaponinfo[weapon.name].useclip = 1;
    } else {
        self.weaponinfo[weapon.name].useclip = 0;
    }
}

// Namespace init/init
// Params 0, eflags: 0x1 linked
// Checksum 0xea0388f, Offset: 0x1a0
// Size: 0x46a
function main() {
    self.a = spawnstruct();
    self.a.weaponpos = [];
    if (self.weapon == level.weaponnone) {
        self aiutility::setcurrentweapon(level.weaponnone);
    }
    self aiutility::setprimaryweapon(self.weapon);
    if (self.secondaryweapon == level.weaponnone) {
        self aiutility::setsecondaryweapon(level.weaponnone);
    }
    self aiutility::setsecondaryweapon(self.secondaryweapon);
    self aiutility::setcurrentweapon(self.primaryweapon);
    self.initial_primaryweapon = self.primaryweapon;
    self.initial_secondaryweapon = self.secondaryweapon;
    self initweapon(self.primaryweapon);
    self initweapon(self.secondaryweapon);
    self initweapon(self.sidearm);
    self.weapon_positions = array("left", "right", "chest", "back");
    for (i = 0; i < self.weapon_positions.size; i++) {
        self.a.weaponpos[self.weapon_positions[i]] = level.weaponnone;
    }
    self.lastweapon = self.weapon;
    firstinit();
    self.a.rockets = 3;
    self.a.rocketvisible = 1;
    self.a.pose = "stand";
    self.a.prevpose = self.a.pose;
    self.a.movement = "stop";
    self.a.special = "none";
    self.a.gunhand = "none";
    shared::placeweaponon(self.primaryweapon, "right");
    if (isdefined(self.secondaryweaponclass) && self.secondaryweaponclass != "none" && self.secondaryweaponclass != "pistol") {
        shared::placeweaponon(self.secondaryweapon, "back");
    }
    self.a.combatendtime = gettime();
    self.a.nextgrenadetrytime = 0;
    self.a.isaiming = 0;
    self.rightaimlimit = 45;
    self.leftaimlimit = -45;
    self.upaimlimit = 45;
    self.downaimlimit = -45;
    self.walk = 0;
    self.sprint = 0;
    self.a.postscriptfunc = undefined;
    self.baseaccuracy = self.accuracy;
    if (!isdefined(self.script_accuracy)) {
        self.script_accuracy = 1;
    }
    self.a.misstime = 0;
    self.ai.bulletsinclip = self.weapon.clipsize;
    self.lastenemysighttime = 0;
    self.combattime = 0;
    self.suppressed = 0;
    self.suppressedtime = 0;
    self.suppressionthreshold = 0.75;
    self.randomgrenaderange = 128;
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
    self.animplaybackrate = 0.9 + randomfloat(0.2);
    self.moveplaybackrate = 1;
}

// Namespace init/init
// Params 0, eflags: 0x0
// Checksum 0x89c0b4d6, Offset: 0x6a8
// Size: 0x34
function trackvelocity() {
    self endon(#"death");
    for (;;) {
        self.oldorigin = self.origin;
        wait(0.2);
    }
}

// Namespace init/init
// Params 1, eflags: 0x0
// Checksum 0xfd6a6f6b, Offset: 0x6e8
// Size: 0x400
function checkapproachangles(transtypes) {
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
            for (j = 0; j < transtypes.size; j++) {
                trans = transtypes[j];
                idealadd = 0;
                if (trans == "<unknown string>" || trans == "<unknown string>") {
                    idealadd = 90;
                } else if (trans == "<unknown string>" || trans == "<unknown string>") {
                    idealadd = -90;
                }
                if (isdefined(anim.covertransangles[trans][i])) {
                    correctangle = angleclamp180(idealtransangles[i] + idealadd);
                    actualangle = angleclamp180(anim.covertransangles[trans][i]);
                    if (absangleclamp180(actualangle - correctangle) > 7) {
                        println("<unknown string>" + trans + "<unknown string>" + i + "<unknown string>" + actualangle + "<unknown string>" + correctangle + "<unknown string>");
                    }
                }
            }
        }
        for (i = 1; i <= 9; i++) {
            for (j = 0; j < transtypes.size; j++) {
                trans = transtypes[j];
                idealadd = 0;
                if (trans == "<unknown string>" || trans == "<unknown string>") {
                    idealadd = 90;
                } else if (trans == "<unknown string>" || trans == "<unknown string>") {
                    idealadd = -90;
                }
                if (isdefined(anim.coverexitangles[trans][i])) {
                    correctangle = angleclamp180(-1 * (idealtransangles[i] + idealadd + 180));
                    actualangle = angleclamp180(anim.coverexitangles[trans][i]);
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
function getexitsplittime(approachtype, dir) {
    return anim.coverexitsplit[approachtype][dir];
}

// Namespace init/init
// Params 2, eflags: 0x0
// Checksum 0x9c9bd793, Offset: 0xb28
// Size: 0x2a
function gettranssplittime(approachtype, dir) {
    return anim.covertranssplit[approachtype][dir];
}

// Namespace init/init
// Params 0, eflags: 0x1 linked
// Checksum 0xd73d8988, Offset: 0xb60
// Size: 0x1c6
function firstinit() {
    if (isdefined(anim.notfirsttime)) {
        return;
    }
    anim.notfirsttime = 1;
    anim.grenadetimers[#"player_frag_grenade_sp"] = randomintrange(1000, 20000);
    anim.grenadetimers[#"player_flash_grenade_sp"] = randomintrange(1000, 20000);
    anim.grenadetimers[#"player_double_grenade"] = randomintrange(10000, 60000);
    anim.grenadetimers[#"ai_frag_grenade_sp"] = randomintrange(0, 20000);
    anim.grenadetimers[#"ai_flash_grenade_sp"] = randomintrange(0, 20000);
    anim.numgrenadesinprogresstowardsplayer = 0;
    anim.lastgrenadelandednearplayertime = 1000000;
    anim.lastfraggrenadetoplayerstart = 1000000;
    thread setnextplayergrenadetime();
    if (!isdefined(level.flag)) {
        level.flag = [];
    }
    level.painai = undefined;
    anim.covercrouchleanpitch = -55;
}

// Namespace init/init
// Params 0, eflags: 0x0
// Checksum 0x1eaf3771, Offset: 0xd30
// Size: 0x32
function onplayerconnect() {
    player = self;
    firstinit();
    player.invul = 0;
}

// Namespace init/init
// Params 0, eflags: 0x1 linked
// Checksum 0x6dfbafbf, Offset: 0xd70
// Size: 0x172
function setnextplayergrenadetime() {
    waittillframeend();
    if (isdefined(anim.playergrenaderangetime)) {
        maxtime = int(anim.playergrenaderangetime * 0.7);
        if (maxtime < 1) {
            maxtime = 1;
        }
        anim.grenadetimers[#"player_frag_grenade_sp"] = randomintrange(0, maxtime);
        anim.grenadetimers[#"player_flash_grenade_sp"] = randomintrange(0, maxtime);
    }
    if (isdefined(anim.playerdoublegrenadetime)) {
        maxtime = int(anim.playerdoublegrenadetime);
        mintime = int(maxtime / 2);
        if (maxtime <= mintime) {
            maxtime = mintime + 1;
        }
        anim.grenadetimers[#"player_double_grenade"] = randomintrange(mintime, maxtime);
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
function event_handler[grenade_fire] function_960adbea(eventstruct) {
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
function event_handler[grenade_launcher_fire] function_c6ddaa47(eventstruct) {
    eventstruct.projectile.owner = self;
    eventstruct.projectile.weapon = eventstruct.weapon;
    level thread addtomissiles(eventstruct.projectile);
}

// Namespace init/missile_fire
// Params 1, eflags: 0x40
// Checksum 0xb07ec8b4, Offset: 0x10c8
// Size: 0x64
function event_handler[missile_fire] function_596d3a28(eventstruct) {
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


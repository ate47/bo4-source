// Atian COD Tools GSC decompiler test
#include scripts/weapons/heatseekingmissile.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace multilockap_guidance;

// Namespace multilockap_guidance/multilockapguidance
// Params 0, eflags: 0x2
// Checksum 0xe2190632, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"multilockap_guidance", &__init__, undefined, undefined);
}

// Namespace multilockap_guidance/multilockapguidance
// Params 0, eflags: 0x1 linked
// Checksum 0x6912008, Offset: 0x100
// Size: 0x4c
function __init__() {
    callback::on_spawned(&on_player_spawned);
    setdvar(#"scr_max_simlocks", 3);
}

// Namespace multilockap_guidance/multilockapguidance
// Params 0, eflags: 0x1 linked
// Checksum 0x58143f9b, Offset: 0x158
// Size: 0x4c
function on_player_spawned() {
    self endon(#"disconnect");
    self clearaptarget();
    self callback::on_weapon_change(&on_weapon_change);
}

// Namespace multilockap_guidance/multilockapguidance
// Params 2, eflags: 0x1 linked
// Checksum 0xf6ae05f7, Offset: 0x1b0
// Size: 0x23c
function clearaptarget(weapon, whom) {
    if (!isdefined(self.multilocklist)) {
        self.multilocklist = [];
    }
    if (isdefined(whom)) {
        for (i = 0; i < self.multilocklist.size; i++) {
            if (whom.aptarget == self.multilocklist[i].aptarget) {
                if (isdefined(self.multilocklist[i].aptarget)) {
                    self.multilocklist[i].aptarget notify(#"missile_unlocked");
                }
                self notify("stop_sound" + whom.apsoundid);
                self weaponlockremoveslot(i);
                arrayremovevalue(self.multilocklist, whom, 0);
                break;
            }
        }
    } else {
        for (i = 0; i < self.multilocklist.size; i++) {
            self.multilocklist[i].aptarget notify(#"missile_unlocked");
            self notify("stop_sound" + self.multilocklist[i].apsoundid);
        }
        self.multilocklist = [];
    }
    if (self.multilocklist.size == 0) {
        self stoprumble("stinger_lock_rumble");
        self weaponlockremoveslot(-1);
        if (isdefined(weapon)) {
            if (isdefined(weapon.lockonseekersearchsound)) {
                self stoplocalsound(weapon.lockonseekersearchsound);
            }
            if (isdefined(weapon.lockonseekerlockedsound)) {
                self stoplocalsound(weapon.lockonseekerlockedsound);
            }
        }
    }
}

// Namespace multilockap_guidance/missile_fire
// Params 1, eflags: 0x40
// Checksum 0x5da9cf00, Offset: 0x3f8
// Size: 0x118
function event<missile_fire> function_bfb94991(eventstruct) {
    if (!isplayer(self)) {
        return;
    }
    missile = eventstruct.projectile;
    weapon = eventstruct.weapon;
    if (weapon.lockontype == "AP Multi") {
        foreach (target in self.multilocklist) {
            if (isdefined(target.aptarget) && target.aplockfinalized) {
                target.aptarget heatseekingmissile::function_a439ae56(missile, weapon, self);
            }
        }
    }
}

// Namespace multilockap_guidance/multilockapguidance
// Params 1, eflags: 0x1 linked
// Checksum 0xf8b90a9c, Offset: 0x518
// Size: 0x152
function on_weapon_change(params) {
    weapon = params.weapon;
    while (weapon.lockontype == "AP Multi") {
        abort = 0;
        while (!(self playerads() == 1)) {
            waitframe(1);
            currentweapon = self getcurrentweapon();
            if (currentweapon.lockontype != "AP Multi") {
                abort = 1;
                break;
            }
        }
        if (abort) {
            break;
        }
        self thread aplockloop(weapon);
        while (self playerads() == 1) {
            waitframe(1);
        }
        self notify(#"ap_off");
        self clearaptarget(weapon);
        weapon = self getcurrentweapon();
    }
}

// Namespace multilockap_guidance/multilockapguidance
// Params 1, eflags: 0x1 linked
// Checksum 0xe3088331, Offset: 0x678
// Size: 0x552
function aplockloop(weapon) {
    self endon(#"disconnect", #"death", #"ap_off");
    locklength = self getlockonspeed();
    self.multilocklist = [];
    for (;;) {
        waitframe(1);
        do {
            done = 1;
            foreach (target in self.multilocklist) {
                if (target.aplockfinalized) {
                    if (!isstillvalidtarget(weapon, target.aptarget)) {
                        self clearaptarget(weapon, target);
                        done = 0;
                        break;
                    }
                }
            }
        } while(!done);
        inlockingstate = 0;
        do {
            done = 1;
            for (i = 0; i < self.multilocklist.size; i++) {
                target = self.multilocklist[i];
                if (target.aplocking) {
                    if (!isstillvalidtarget(weapon, target.aptarget)) {
                        self clearaptarget(weapon, target);
                        done = 0;
                        break;
                    }
                    inlockingstate = 1;
                    timepassed = gettime() - target.aplockstarttime;
                    if (timepassed < locklength) {
                        continue;
                    }
                    /#
                        assert(isdefined(target.aptarget));
                    #/
                    target.aplockfinalized = 1;
                    target.aplocking = 0;
                    target.aplockpending = 0;
                    self weaponlockfinalize(target.aptarget, i);
                    self thread seekersound(weapon.lockonseekerlockedsound, weapon.lockonseekerlockedsoundloops, target.apsoundid);
                    target.aptarget heatseekingmissile::function_5e6cd0ab(self getcurrentweapon(), self);
                }
            }
        } while(!done);
        if (!inlockingstate) {
            do {
                done = 1;
                for (i = 0; i < self.multilocklist.size; i++) {
                    target = self.multilocklist[i];
                    if (target.aplockpending) {
                        if (!isstillvalidtarget(weapon, target.aptarget)) {
                            self clearaptarget(weapon, target);
                            done = 0;
                            break;
                        }
                        target.aplockstarttime = gettime();
                        target.aplockfinalized = 0;
                        target.aplockpending = 0;
                        target.aplocking = 1;
                        self thread seekersound(weapon.lockonseekersearchsound, weapon.lockonseekersearchsoundloops, target.apsoundid);
                        done = 1;
                        break;
                    }
                }
            } while(!done);
        }
        if (self.multilocklist.size >= getdvarint(#"scr_max_simlocks", 0) || self.multilocklist.size >= self getweaponammoclip(weapon)) {
            continue;
        }
        besttarget = self getbesttarget(weapon);
        if (!isdefined(besttarget) && self.multilocklist.size == 0) {
            continue;
        }
        if (isdefined(besttarget) && self.multilocklist.size < getdvarint(#"scr_max_simlocks", 0) && self.multilocklist.size < self getweaponammoclip(weapon)) {
            self weaponlockstart(besttarget.aptarget, self.multilocklist.size);
            self.multilocklist[self.multilocklist.size] = besttarget;
        }
    }
}

// Namespace multilockap_guidance/multilockapguidance
// Params 1, eflags: 0x1 linked
// Checksum 0x3f5b6fcc, Offset: 0xbd8
// Size: 0x4ca
function getbesttarget(weapon) {
    playertargets = getplayers();
    vehicletargets = target_getarray();
    targetsall = getaiteamarray();
    targetsall = arraycombine(targetsall, playertargets, 0, 0);
    targetsall = arraycombine(targetsall, vehicletargets, 0, 0);
    targetsvalid = [];
    for (idx = 0; idx < targetsall.size; idx++) {
        if (level.teambased) {
            if (isdefined(targetsall[idx].team) && targetsall[idx].team != self.team) {
                if (self insideapreticlenolock(targetsall[idx])) {
                    if (self locksighttest(targetsall[idx])) {
                        targetsvalid[targetsvalid.size] = targetsall[idx];
                    }
                }
            }
        } else if (self insideapreticlenolock(targetsall[idx])) {
            if (isdefined(targetsall[idx].owner) && self != targetsall[idx].owner) {
                if (self locksighttest(targetsall[idx])) {
                    targetsvalid[targetsvalid.size] = targetsall[idx];
                }
            }
        }
    }
    if (targetsvalid.size == 0) {
        return undefined;
    }
    playerforward = anglestoforward(self getplayerangles());
    dots = [];
    for (i = 0; i < targetsvalid.size; i++) {
        newitem = spawnstruct();
        newitem.index = i;
        newitem.dot = vectordot(playerforward, vectornormalize(targetsvalid[i].origin - self.origin));
        array::add_sorted(dots, newitem, 0, &targetinsertionsortcompare);
    }
    index = 0;
    foreach (dot in dots) {
        found = 0;
        foreach (lock in self.multilocklist) {
            if (lock.aptarget == targetsvalid[dot.index]) {
                found = 1;
            }
        }
        if (found) {
            continue;
        }
        newentry = spawnstruct();
        newentry.aptarget = targetsvalid[dot.index];
        newentry.aplockstarttime = gettime();
        newentry.aplockpending = 1;
        newentry.aplocking = 0;
        newentry.aplockfinalized = 0;
        newentry.aplostsightlinetime = 0;
        newentry.apsoundid = randomint(2147483647);
        return newentry;
    }
    return undefined;
}

// Namespace multilockap_guidance/multilockapguidance
// Params 2, eflags: 0x1 linked
// Checksum 0xba6b1100, Offset: 0x10b0
// Size: 0x56
function targetinsertionsortcompare(a, b) {
    if (a.dot < b.dot) {
        return -1;
    }
    if (a.dot > b.dot) {
        return 1;
    }
    return 0;
}

// Namespace multilockap_guidance/multilockapguidance
// Params 1, eflags: 0x1 linked
// Checksum 0xcdc365, Offset: 0x1110
// Size: 0x4a
function insideapreticlenolock(target) {
    radius = self getlockonradius();
    return target_isincircle(target, self, 65, radius);
}

// Namespace multilockap_guidance/multilockapguidance
// Params 1, eflags: 0x1 linked
// Checksum 0xb0808c79, Offset: 0x1168
// Size: 0x4a
function insideapreticlelocked(target) {
    radius = self getlockonlossradius();
    return target_isincircle(target, self, 65, radius);
}

// Namespace multilockap_guidance/multilockapguidance
// Params 2, eflags: 0x1 linked
// Checksum 0x3d7fae3, Offset: 0x11c0
// Size: 0x6e
function isstillvalidtarget(weapon, ent) {
    if (!isdefined(ent)) {
        return 0;
    }
    if (!insideapreticlelocked(ent)) {
        return 0;
    }
    if (!isalive(ent)) {
        return 0;
    }
    if (!locksighttest(ent)) {
        return 0;
    }
    return 1;
}

// Namespace multilockap_guidance/multilockapguidance
// Params 3, eflags: 0x1 linked
// Checksum 0x8dff43, Offset: 0x1238
// Size: 0xec
function seekersound(alias, looping, id) {
    self notify("stop_sound" + id);
    self endon("stop_sound" + id, #"disconnect", #"death");
    if (isdefined(alias)) {
        self playrumbleonentity("stinger_lock_rumble");
        time = soundgetplaybacktime(alias) * 0.001;
        do {
            self playlocalsound(alias);
            wait(time);
        } while(looping);
        self stoprumble("stinger_lock_rumble");
    }
}

// Namespace multilockap_guidance/multilockapguidance
// Params 1, eflags: 0x1 linked
// Checksum 0x356f79e6, Offset: 0x1330
// Size: 0x166
function locksighttest(target) {
    eyepos = self geteye();
    if (!isdefined(target)) {
        return 0;
    }
    if (!isalive(target)) {
        return 0;
    }
    pos = target getshootatpos();
    if (isdefined(pos)) {
        passed = bullettracepassed(eyepos, pos, 0, target, undefined, 1, 1);
        if (passed) {
            return 1;
        }
    }
    pos = target getcentroid();
    if (isdefined(pos)) {
        passed = bullettracepassed(eyepos, pos, 0, target, undefined, 1, 1);
        if (passed) {
            return 1;
        }
    }
    pos = target.origin;
    passed = bullettracepassed(eyepos, pos, 0, target, undefined, 1, 1);
    if (passed) {
        return 1;
    }
    return 0;
}


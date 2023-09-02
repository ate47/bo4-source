// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace singlelockap_guidance;

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 0, eflags: 0x2
// Checksum 0x9b4b4c3a, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"singlelockap_guidance", &__init__, undefined, undefined);
}

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 0, eflags: 0x0
// Checksum 0xa72223b1, Offset: 0xf8
// Size: 0x24
function __init__() {
    callback::on_spawned(&on_player_spawned);
}

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 0, eflags: 0x0
// Checksum 0x1918b21e, Offset: 0x128
// Size: 0x3c
function on_player_spawned() {
    self endon(#"disconnect");
    self clearaptarget();
    thread aptoggleloop();
}

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 2, eflags: 0x0
// Checksum 0x1a095955, Offset: 0x170
// Size: 0x224
function clearaptarget(weapon, whom) {
    if (!isdefined(self.multilocklist)) {
        self.multilocklist = [];
    }
    if (isdefined(whom)) {
        for (i = 0; i < self.multilocklist.size; i++) {
            if (whom.aptarget == self.multilocklist[i].aptarget) {
                self.multilocklist[i].aptarget notify(#"missile_unlocked");
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

// Namespace singlelockap_guidance/missile_fire
// Params 1, eflags: 0x40
// Checksum 0x92bc179e, Offset: 0x3a0
// Size: 0x144
function event_handler[missile_fire] function_dc710809(eventstruct) {
    if (!isplayer(self)) {
        return;
    }
    missile = eventstruct.projectile;
    weapon = eventstruct.weapon;
    if (weapon.lockontype == "AP Single") {
        foreach (target in self.multilocklist) {
            if (isdefined(target.aptarget) && target.aplockfinalized) {
                target.aptarget notify(#"stinger_fired_at_me", {#attacker:self, #weapon:weapon, #projectile:missile});
            }
        }
    }
}

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 0, eflags: 0x0
// Checksum 0x6bcf4264, Offset: 0x4f0
// Size: 0x196
function aptoggleloop() {
    self endon(#"disconnect", #"death");
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(#"weapon_change");
        weapon = waitresult.weapon;
        while (weapon.lockontype == "AP Single") {
            abort = 0;
            while (!(self playerads() == 1)) {
                waitframe(1);
                currentweapon = self getcurrentweapon();
                if (currentweapon.lockontype != "AP Single") {
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
}

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 1, eflags: 0x0
// Checksum 0xd51f1f49, Offset: 0x690
// Size: 0x4ea
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
                    target.aptarget notify(#"missile_lock", {#weapon:weapon, #attacker:self});
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
        if (self.multilocklist.size >= 1) {
            continue;
        }
        besttarget = self getbesttarget(weapon);
        if (!isdefined(besttarget) && self.multilocklist.size == 0) {
            continue;
        }
        if (isdefined(besttarget) && self.multilocklist.size < 1) {
            self weaponlockstart(besttarget.aptarget, self.multilocklist.size);
            self.multilocklist[self.multilocklist.size] = besttarget;
        }
    }
}

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 1, eflags: 0x0
// Checksum 0xaad8a291, Offset: 0xb88
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

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 2, eflags: 0x0
// Checksum 0x546658eb, Offset: 0x1060
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

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 1, eflags: 0x0
// Checksum 0xe942792c, Offset: 0x10c0
// Size: 0x4a
function insideapreticlenolock(target) {
    radius = self getlockonradius();
    return target_isincircle(target, self, 65, radius);
}

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 1, eflags: 0x0
// Checksum 0xe9f36a2a, Offset: 0x1118
// Size: 0x4a
function insideapreticlelocked(target) {
    radius = self getlockonlossradius();
    return target_isincircle(target, self, 65, radius);
}

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 2, eflags: 0x0
// Checksum 0x34598e0, Offset: 0x1170
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

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 3, eflags: 0x0
// Checksum 0x30d7d78c, Offset: 0x11e8
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

// Namespace singlelockap_guidance/antipersonnelguidance
// Params 1, eflags: 0x0
// Checksum 0x8de5d3a7, Offset: 0x12e0
// Size: 0x18e
function locksighttest(target) {
    eyepos = self geteye();
    if (!isdefined(target)) {
        return 0;
    }
    if (!isalive(target)) {
        return 0;
    }
    if (isdefined(target.var_e8ec304d) && target.var_e8ec304d) {
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


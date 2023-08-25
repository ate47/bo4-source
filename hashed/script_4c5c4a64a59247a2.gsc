// Atian COD Tools GSC decompiler test
#include scripts/core_common/throttle_shared.gsc;
#include scripts/core_common/ai/archetype_utility.gsc;
#include script_5dfa1afaab9c1935;

#namespace shared;

// Namespace shared/shared
// Params 0, eflags: 0x2
// Checksum 0x8130f67a, Offset: 0x130
// Size: 0x4c
function autoexec main() {
    if (!isdefined(level.var_d3f761e0)) {
        level.var_d3f761e0 = new throttle();
        [[ level.var_d3f761e0 ]]->initialize(1, 0.1);
    }
}

// Namespace shared/shared
// Params 3, eflags: 0x5 linked
// Checksum 0x194268c0, Offset: 0x188
// Size: 0xa4
function private _throwstowedweapon(entity, weapon, weaponmodel) {
    entity waittill(#"death");
    if (isdefined(entity)) {
        weaponmodel unlink();
        entity throwweapon(weapon, gettagforpos("back"), 0, 0);
    }
    weaponmodel delete();
}

// Namespace shared/shared
// Params 3, eflags: 0x0
// Checksum 0x830fd99c, Offset: 0x238
// Size: 0xd4
function stowweapon(weapon, positionoffset, orientationoffset) {
    entity = self;
    if (!isdefined(positionoffset)) {
        positionoffset = (0, 0, 0);
    }
    if (!isdefined(orientationoffset)) {
        orientationoffset = (0, 0, 0);
    }
    weaponmodel = spawn("script_model", (0, 0, 0));
    weaponmodel setmodel(weapon.worldmodel);
    weaponmodel linkto(entity, "tag_stowed_back", positionoffset, orientationoffset);
    entity thread _throwstowedweapon(entity, weapon, weaponmodel);
}

// Namespace shared/shared
// Params 2, eflags: 0x1 linked
// Checksum 0x1e01fd1, Offset: 0x318
// Size: 0x3ec
function placeweaponon(weapon, position) {
    self notify(#"weapon_position_change");
    if (isstring(weapon)) {
        weapon = getweapon(weapon);
    }
    if (!isdefined(self.weaponinfo[weapon.name])) {
        self init::initweapon(weapon);
    }
    curposition = self.weaponinfo[weapon.name].position;
    /#
        assert(curposition == "<unknown string>" || self.a.var_a5b8e231[curposition] == weapon);
    #/
    if (!isarray(self.a.var_a5b8e231)) {
        self.a.var_a5b8e231 = [];
    }
    /#
        assert(isarray(self.a.var_a5b8e231));
    #/
    /#
        assert(position == "<unknown string>" || isdefined(self.a.var_a5b8e231[position]), "<unknown string>" + position + "<unknown string>");
    #/
    /#
        assert(isweapon(weapon));
    #/
    if (position != "none" && self.a.var_a5b8e231[position] == weapon) {
        return;
    }
    self detachallweaponmodels();
    if (curposition != "none") {
        self detachweapon(weapon);
    }
    if (position == "none") {
        self updateattachedweaponmodels();
        self aiutility::setcurrentweapon(level.weaponnone);
        return;
    }
    if (self.a.var_a5b8e231[position] != level.weaponnone) {
        self detachweapon(self.a.var_a5b8e231[position]);
    }
    if (position == "left" || position == "right") {
        self updatescriptweaponinfoandpos(weapon, position);
        self aiutility::setcurrentweapon(weapon);
    } else {
        self updatescriptweaponinfoandpos(weapon, position);
    }
    self updateattachedweaponmodels();
    /#
        assert(self.a.var_a5b8e231[#"left"] == level.weaponnone || self.a.var_a5b8e231[#"right"] == level.weaponnone);
    #/
}

// Namespace shared/shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf6999dc7, Offset: 0x710
// Size: 0x6e
function detachweapon(weapon) {
    self.a.var_a5b8e231[self.weaponinfo[weapon.name].position] = level.weaponnone;
    self.weaponinfo[weapon.name].position = "none";
}

// Namespace shared/shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa7ef733, Offset: 0x788
// Size: 0x52
function updatescriptweaponinfoandpos(weapon, position) {
    self.weaponinfo[weapon.name].position = position;
    self.a.var_a5b8e231[position] = weapon;
}

// Namespace shared/shared
// Params 0, eflags: 0x1 linked
// Checksum 0x7b78e362, Offset: 0x7e8
// Size: 0xa6
function detachallweaponmodels() {
    if (isdefined(self.var_7f75cf1c)) {
        for (index = 0; index < self.var_7f75cf1c.size; index++) {
            weapon = self.a.var_a5b8e231[self.var_7f75cf1c[index]];
            if (weapon == level.weaponnone) {
                continue;
            }
            self setactorweapon(level.weaponnone, self getactorweaponoptions());
        }
    }
}

// Namespace shared/shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5b979ac9, Offset: 0x898
// Size: 0x126
function updateattachedweaponmodels() {
    if (isdefined(self.var_7f75cf1c)) {
        for (index = 0; index < self.var_7f75cf1c.size; index++) {
            weapon = self.a.var_a5b8e231[self.var_7f75cf1c[index]];
            if (weapon == level.weaponnone) {
                continue;
            }
            if (self.var_7f75cf1c[index] != "right") {
                continue;
            }
            self setactorweapon(weapon, self getactorweaponoptions());
            if (self.weaponinfo[weapon.name].var_d49f07d5 && !self.weaponinfo[weapon.name].var_638ddb07) {
                self hidepart("tag_clip");
            }
        }
    }
}

// Namespace shared/shared
// Params 1, eflags: 0x1 linked
// Checksum 0x23774ff3, Offset: 0x9c8
// Size: 0xd2
function gettagforpos(position) {
    switch (position) {
    case #"chest":
        return "tag_weapon_chest";
    case #"back":
        return "tag_stowed_back";
    case #"left":
        return "tag_weapon_left";
    case #"right":
        return "tag_weapon_right";
    case #"hand":
        return "tag_inhand";
    default:
        /#
            assertmsg("<unknown string>" + position);
        #/
        break;
    }
}

// Namespace shared/shared
// Params 4, eflags: 0x1 linked
// Checksum 0xb61943f9, Offset: 0xaa8
// Size: 0x216
function throwweapon(weapon, positiontag, scavenger, var_c1a8dca6) {
    waittime = 0.1;
    linearscalar = 2;
    angularscalar = 10;
    startposition = self gettagorigin(positiontag);
    startangles = self gettagangles(positiontag);
    if (!isdefined(startposition) || !isdefined(startangles)) {
        return;
    }
    wait(waittime);
    if (isdefined(self)) {
        endposition = self gettagorigin(positiontag);
        endangles = self gettagangles(positiontag);
        linearvelocity = (endposition - startposition) * 1 / waittime * linearscalar;
        angularvelocity = vectornormalize(endangles - startangles) * angularscalar;
        throwweapon = self dropweapon(weapon, positiontag, linearvelocity, angularvelocity, scavenger);
        if (isdefined(throwweapon)) {
            throwweapon setcontents(throwweapon setcontents(0) & ~(32768 | 67108864 | 8388608 | 33554432));
        }
        if (var_c1a8dca6) {
            throwweapon delete();
        } else {
            return throwweapon;
        }
    }
}

// Namespace shared/shared
// Params 0, eflags: 0x1 linked
// Checksum 0x525947a0, Offset: 0xcc8
// Size: 0x2f4
function dropaiweapon() {
    self endon(#"death");
    if (self.weapon == level.weaponnone) {
        return;
    }
    if (isdefined(self.var_4abd4aa5) && self.var_4abd4aa5 && self.weapon == self.var_f2eb1a69) {
        /#
            println("<unknown string>" + self.weapon.name + "<unknown string>");
        #/
        return;
    } else if (isdefined(self.var_77fd5541) && self.var_77fd5541 && self.weapon == self.sidearm) {
        /#
            println("<unknown string>" + self.weapon.name + "<unknown string>");
        #/
        return;
    }
    [[ level.var_d3f761e0 ]]->waitinqueue(self);
    current_weapon = self.weapon;
    dropweaponname = player_weapon_drop(current_weapon);
    position = self.weaponinfo[current_weapon.name].position;
    shoulddropweapon = !isdefined(self.dontdropweapon) || self.dontdropweapon === 0;
    shoulddeleteafterdropping = current_weapon == getweapon("riotshield");
    if (current_weapon.isscavengable == 0) {
        shoulddropweapon = 0;
    }
    if (shoulddropweapon && self.dropweapon) {
        self.dontdropweapon = 1;
        positiontag = gettagforpos(position);
        throwweapon(dropweaponname, positiontag, 0, shoulddeleteafterdropping);
    }
    if (self.weapon != level.weaponnone) {
        placeweaponon(current_weapon, "none");
        if (self.weapon == self.primaryweapon) {
            self aiutility::setprimaryweapon(level.weaponnone);
        } else if (self.weapon == self.secondaryweapon) {
            self aiutility::setsecondaryweapon(level.weaponnone);
        }
    }
    self aiutility::setcurrentweapon(level.weaponnone);
}

// Namespace shared/shared
// Params 0, eflags: 0x0
// Checksum 0x28c612ed, Offset: 0xfc8
// Size: 0x3da
function dropallaiweapons() {
    if (isdefined(self.a.var_2db594e4) && self.a.var_2db594e4) {
        return;
    }
    if (!self.dropweapon) {
        if (self.weapon != level.weaponnone) {
            placeweaponon(self.weapon, "none");
            self aiutility::setcurrentweapon(level.weaponnone);
        }
        return;
    }
    self.a.var_2db594e4 = 1;
    self detachallweaponmodels();
    droppedsidearm = 0;
    if (isdefined(self.var_7f75cf1c)) {
        for (index = 0; index < self.var_7f75cf1c.size; index++) {
            weapon = self.a.var_a5b8e231[self.var_7f75cf1c[index]];
            if (weapon != level.weaponnone) {
                self.weaponinfo[weapon.name].position = "none";
                self.a.var_a5b8e231[self.var_7f75cf1c[index]] = level.weaponnone;
                if (isdefined(self.var_4abd4aa5) && self.var_4abd4aa5 && weapon == self.var_f2eb1a69) {
                    /#
                        println("<unknown string>" + weapon.name + "<unknown string>");
                    #/
                } else if (isdefined(self.var_77fd5541) && self.var_77fd5541 && weapon == self.sidearm) {
                    /#
                        println("<unknown string>" + weapon.name + "<unknown string>");
                    #/
                } else {
                    velocity = self getvelocity();
                    speed = length(velocity) * 0.5;
                    weapon = player_weapon_drop(weapon);
                    droppedweapon = self dropweapon(weapon, self.var_7f75cf1c[index], speed);
                    if (self.sidearm != level.weaponnone) {
                        if (weapon == self.sidearm) {
                            droppedsidearm = 1;
                        }
                    }
                }
            }
        }
    }
    if (!droppedsidearm && self.sidearm != level.weaponnone) {
        if (randomint(100) <= 10) {
            velocity = self getvelocity();
            speed = length(velocity) * 0.5;
            droppedweapon = self dropweapon(self.sidearm, "chest", speed);
        }
    }
    self aiutility::setcurrentweapon(level.weaponnone);
    self.a.var_2db594e4 = undefined;
}

// Namespace shared/shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb4abe591, Offset: 0x13b0
// Size: 0x10
function player_weapon_drop(weapon) {
    return weapon;
}

// Namespace shared/shared
// Params 4, eflags: 0x1 linked
// Checksum 0xe04f6e2f, Offset: 0x13c8
// Size: 0x24
function handlenotetrack(note, flagname, customfunction, var1) {
    
}

// Namespace shared/shared
// Params 4, eflags: 0x1 linked
// Checksum 0xddc41154, Offset: 0x13f8
// Size: 0xa8
function donotetracks(flagname, customfunction, debugidentifier, var1) {
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(flagname);
        note = waitresult.notetrack;
        if (!isdefined(note)) {
            note = "undefined";
        }
        val = self handlenotetrack(note, flagname, customfunction, var1);
        if (isdefined(val)) {
            return val;
        }
    }
}

// Namespace shared/shared
// Params 3, eflags: 0x1 linked
// Checksum 0xd29a6d97, Offset: 0x14a8
// Size: 0xe0
function donotetracksintercept(flagname, var_dd8ebebf, debugidentifier) {
    /#
        assert(isdefined(var_dd8ebebf));
    #/
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(flagname);
        note = waitresult.notetrack;
        if (!isdefined(note)) {
            note = "undefined";
        }
        intercepted = [[ var_dd8ebebf ]](note);
        if (isdefined(intercepted) && intercepted) {
            continue;
        }
        val = self handlenotetrack(note, flagname);
        if (isdefined(val)) {
            return val;
        }
    }
}

// Namespace shared/shared
// Params 2, eflags: 0x0
// Checksum 0xc4679a55, Offset: 0x1590
// Size: 0xb6
function donotetrackspostcallback(flagname, postfunction) {
    /#
        assert(isdefined(postfunction));
    #/
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(flagname);
        note = waitresult.notetrack;
        if (!isdefined(note)) {
            note = "undefined";
        }
        val = self handlenotetrack(note, flagname);
        [[ postfunction ]](note);
        if (isdefined(val)) {
            return val;
        }
    }
}

// Namespace shared/shared
// Params 4, eflags: 0x1 linked
// Checksum 0xb22dfe33, Offset: 0x1650
// Size: 0x54
function donotetracksforever(flagname, killstring, customfunction, debugidentifier) {
    donotetracksforeverproc(&donotetracks, flagname, killstring, customfunction, debugidentifier);
}

// Namespace shared/shared
// Params 4, eflags: 0x1 linked
// Checksum 0x165d17ab, Offset: 0x16b0
// Size: 0x54
function donotetracksforeverintercept(flagname, killstring, var_dd8ebebf, debugidentifier) {
    donotetracksforeverproc(&donotetracksintercept, flagname, killstring, var_dd8ebebf, debugidentifier);
}

// Namespace shared/shared
// Params 5, eflags: 0x1 linked
// Checksum 0x812df0e6, Offset: 0x1710
// Size: 0x14e
function donotetracksforeverproc(notetracksfunc, flagname, killstring, customfunction, debugidentifier) {
    if (isdefined(killstring)) {
        self endon(killstring);
    }
    self endon(#"killanimscript");
    if (!isdefined(debugidentifier)) {
        debugidentifier = "undefined";
    }
    for (;;) {
        time = gettime();
        returnednote = [[ notetracksfunc ]](flagname, customfunction, debugidentifier);
        timetaken = gettime() - time;
        if (timetaken < 0.05) {
            time = gettime();
            returnednote = [[ notetracksfunc ]](flagname, customfunction, debugidentifier);
            timetaken = gettime() - time;
            if (timetaken < 0.05) {
                /#
                    println(gettime() + "<unknown string>" + debugidentifier + "<unknown string>" + flagname + "<unknown string>" + returnednote + "<unknown string>");
                #/
                wait(0.05 - timetaken);
            }
        }
    }
}

// Namespace shared/shared
// Params 4, eflags: 0x0
// Checksum 0x4e04bb9c, Offset: 0x1868
// Size: 0x84
function donotetracksfortime(time, flagname, customfunction, debugidentifier) {
    ent = spawnstruct();
    ent thread donotetracksfortimeendnotify(time);
    donotetracksfortimeproc(&donotetracksforever, time, flagname, customfunction, debugidentifier, ent);
}

// Namespace shared/shared
// Params 4, eflags: 0x0
// Checksum 0xcdeeb063, Offset: 0x18f8
// Size: 0x84
function donotetracksfortimeintercept(time, flagname, var_dd8ebebf, debugidentifier) {
    ent = spawnstruct();
    ent thread donotetracksfortimeendnotify(time);
    donotetracksfortimeproc(&donotetracksforeverintercept, time, flagname, var_dd8ebebf, debugidentifier, ent);
}

// Namespace shared/shared
// Params 6, eflags: 0x1 linked
// Checksum 0xff1e620d, Offset: 0x1988
// Size: 0x62
function donotetracksfortimeproc(donotetracksforeverfunc, time, flagname, customfunction, debugidentifier, ent) {
    ent endon(#"stop_notetracks");
    [[ donotetracksforeverfunc ]](flagname, undefined, customfunction, debugidentifier);
}

// Namespace shared/shared
// Params 1, eflags: 0x1 linked
// Checksum 0xef5b5b23, Offset: 0x19f8
// Size: 0x26
function donotetracksfortimeendnotify(time) {
    wait(time);
    self notify(#"stop_notetracks");
}


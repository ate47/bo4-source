// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace remote_weapons;

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0x87d5d22a, Offset: 0x138
// Size: 0x64
function init_shared() {
    if (!isdefined(level.var_4249c222)) {
        level.var_4249c222 = {};
        level.remoteweapons = [];
        level.remoteexithint = #"mp/remote_exit";
        callback::on_spawned(&on_player_spawned);
    }
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0xec64e63d, Offset: 0x1a8
// Size: 0x2c
function on_player_spawned() {
    self endon(#"disconnect");
    self assignremotecontroltrigger();
}

// Namespace remote_weapons/remote_weapons
// Params 1, eflags: 0x0
// Checksum 0x5098baaa, Offset: 0x1e0
// Size: 0x3c
function removeandassignnewremotecontroltrigger(remotecontroltrigger) {
    arrayremovevalue(self.activeremotecontroltriggers, remotecontroltrigger);
    self assignremotecontroltrigger(1);
}

// Namespace remote_weapons/remote_weapons
// Params 1, eflags: 0x0
// Checksum 0xe7878a5d, Offset: 0x228
// Size: 0xdc
function assignremotecontroltrigger(force_new_assignment = 0) {
    if (!isdefined(self.activeremotecontroltriggers)) {
        self.activeremotecontroltriggers = [];
    }
    arrayremovevalue(self.activeremotecontroltriggers, undefined);
    if ((!isdefined(self.remotecontroltrigger) || force_new_assignment) && self.activeremotecontroltriggers.size > 0) {
        self.remotecontroltrigger = self.activeremotecontroltriggers[self.activeremotecontroltriggers.size - 1];
    }
    if (isdefined(self.remotecontroltrigger)) {
        self.remotecontroltrigger.origin = self.origin;
        self.remotecontroltrigger linkto(self);
    }
}

// Namespace remote_weapons/remote_weapons
// Params 5, eflags: 0x0
// Checksum 0xf2eae12d, Offset: 0x310
// Size: 0xee
function registerremoteweapon(weaponname, hintstring, usecallback, endusecallback, hidecompassonuse = 1) {
    /#
        assert(isdefined(level.remoteweapons));
    #/
    level.remoteweapons[weaponname] = spawnstruct();
    level.remoteweapons[weaponname].hintstring = hintstring;
    level.remoteweapons[weaponname].usecallback = usecallback;
    level.remoteweapons[weaponname].endusecallback = endusecallback;
    level.remoteweapons[weaponname].hidecompassonuse = hidecompassonuse;
}

// Namespace remote_weapons/remote_weapons
// Params 5, eflags: 0x0
// Checksum 0x80fdfed5, Offset: 0x408
// Size: 0x12c
function useremoteweapon(weapon, weaponname, immediate, allowmanualdeactivation = 1, always_allow_ride = 0) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    weapon.remoteowner = player;
    weapon.inittime = gettime();
    weapon.remotename = weaponname;
    weapon.remoteweaponallowmanualdeactivation = allowmanualdeactivation;
    weapon thread watchremoveremotecontrolledweapon();
    if (!immediate) {
        weapon createremoteweapontrigger();
        return;
    }
    weapon thread watchownerdisconnect();
    weapon useremotecontrolweapon(allowmanualdeactivation, always_allow_ride);
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0x642739e7, Offset: 0x540
// Size: 0x9a
function watchforhack() {
    weapon = self;
    weapon endon(#"death");
    waitresult = undefined;
    waitresult = weapon waittill(#"killstreak_hacked");
    if (isdefined(weapon.remoteweaponallowmanualdeactivation) && weapon.remoteweaponallowmanualdeactivation) {
        weapon thread watchremotecontroldeactivate();
    }
    weapon.remoteowner = waitresult.hacker;
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0xfa229eed, Offset: 0x5e8
// Size: 0x2c
function on_game_ended() {
    weapon = self;
    weapon endremotecontrolweaponuse(0, 1);
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0xd563afc7, Offset: 0x620
// Size: 0xf6
function watchremoveremotecontrolledweapon() {
    weapon = self;
    weapon endon(#"remote_weapon_end");
    waitresult = undefined;
    waitresult = weapon waittill(#"death", #"remote_weapon_shutdown");
    if (weapon.watch_remote_weapon_death === 1 && isdefined(waitresult._notify) && waitresult._notify == "remote_weapon_shutdown") {
        weapon notify(#"hash_59b25025ce93a142");
        weapon waittill(#"death");
    }
    weapon endremotecontrolweaponuse(0);
    while (isdefined(weapon)) {
        waitframe(1);
    }
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0x3830b118, Offset: 0x720
// Size: 0x27c
function createremoteweapontrigger() {
    weapon = self;
    player = weapon.remoteowner;
    if (isdefined(weapon.usetrigger)) {
        weapon.usetrigger delete();
    }
    weapon.usetrigger = spawn("trigger_radius_use", player.origin, 0, 32, 32);
    weapon.usetrigger enablelinkto();
    weapon.usetrigger linkto(player);
    weapon.usetrigger sethintlowpriority(1);
    weapon.usetrigger setcursorhint("HINT_NOICON");
    if (isdefined(level.remoteweapons[weapon.remotename])) {
        weapon.usetrigger sethintstring(level.remoteweapons[weapon.remotename].hintstring);
    }
    weapon.usetrigger setteamfortrigger(player.team);
    weapon.usetrigger.team = player.team;
    player clientclaimtrigger(weapon.usetrigger);
    player.remotecontroltrigger = weapon.usetrigger;
    player.activeremotecontroltriggers[player.activeremotecontroltriggers.size] = weapon.usetrigger;
    weapon.usetrigger.claimedby = player;
    weapon thread watchweapondeath();
    weapon thread watchownerdisconnect();
    weapon thread watchremotetriggeruse();
    weapon thread watchremotetriggerdisable();
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0xf19ad7ff, Offset: 0x9a8
// Size: 0xac
function watchweapondeath() {
    weapon = self;
    weapon.usetrigger endon(#"death");
    weapon waittill(#"death", #"remote_weapon_end");
    if (isdefined(weapon.remoteowner)) {
        weapon.remoteowner removeandassignnewremotecontroltrigger(weapon.usetrigger);
    }
    weapon.usetrigger delete();
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0x40d77a4f, Offset: 0xa60
// Size: 0xfc
function watchownerdisconnect() {
    weapon = self;
    weapon endon(#"remote_weapon_end", #"remote_weapon_shutdown");
    if (isdefined(weapon.usetrigger)) {
        weapon.usetrigger endon(#"death");
    }
    weapon.remoteowner waittill(#"joined_team", #"disconnect", #"joined_spectators");
    endremotecontrolweaponuse(0);
    if (isdefined(weapon) && isdefined(weapon.usetrigger)) {
        weapon.usetrigger delete();
    }
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0x80f96690, Offset: 0xb68
// Size: 0xc0
function watchremotetriggerdisable() {
    weapon = self;
    weapon endon(#"remote_weapon_end", #"remote_weapon_shutdown");
    weapon.usetrigger endon(#"death");
    weapon.remoteowner endon(#"disconnect");
    while (1) {
        weapon.usetrigger triggerenable(!weapon.remoteowner iswallrunning());
        wait(0.1);
    }
}

// Namespace remote_weapons/remote_weapons
// Params 1, eflags: 0x0
// Checksum 0x6965bce7, Offset: 0xc30
// Size: 0xe0
function allowremotestart(var_59d2c24b) {
    player = self;
    if ((isdefined(var_59d2c24b) && var_59d2c24b || player usebuttonpressed()) && !player.throwinggrenade && !player meleebuttonpressed() && !player util::isusingremote() && !(isdefined(player.carryobject) && isdefined(player.carryobject.disallowremotecontrol) && player.carryobject.disallowremotecontrol)) {
        return 1;
    }
    return 0;
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0xc2f8483f, Offset: 0xd18
// Size: 0x228
function watchremotetriggeruse() {
    weapon = self;
    weapon endon(#"death", #"remote_weapon_end");
    if (isbot(weapon.remoteowner)) {
        return;
    }
    while (1) {
        res = undefined;
        res = weapon.usetrigger waittill(#"trigger", #"death");
        if (res._notify == "death") {
            return;
        }
        if (weapon.remoteowner isusingoffhand() || weapon.remoteowner iswallrunning() || weapon.remoteowner util::isusingremote() && weapon.remoteowner.usingremote !== weapon.remotename) {
            continue;
        }
        if (isdefined(weapon.hackertrigger) && isdefined(weapon.hackertrigger.progressbar)) {
            if (weapon.remotename == "killstreak_remote_turret") {
                weapon.remoteowner iprintlnbold(#"hash_7b4c84d5307fea60");
            }
            continue;
        }
        if (weapon.remoteowner allowremotestart()) {
            var_48096e05 = gettime() - (isdefined(weapon.lastusetime) ? weapon.lastusetime : 0);
            if (var_48096e05 > 700) {
                useremotecontrolweapon();
            }
        }
    }
}

// Namespace remote_weapons/remote_weapons
// Params 2, eflags: 0x0
// Checksum 0x18368c86, Offset: 0xf48
// Size: 0x4a8
function useremotecontrolweapon(allowmanualdeactivation = 1, always_allow_ride = 0) {
    self endon(#"death");
    weapon = self;
    /#
        assert(isdefined(weapon.remoteowner));
    #/
    weapon.control_initiated = 1;
    weapon.endremotecontrolweapon = 0;
    weapon.remoteowner endon(#"disconnect", #"joined_team");
    weapon.remoteowner disableoffhandweapons();
    weapon.remoteowner disableweaponcycling();
    weapon.remoteowner.dofutz = 0;
    if (!isdefined(weapon.disableremoteweaponswitch)) {
        remoteweapon = getweapon(#"killstreak_remote");
        weapon.remoteowner giveweapon(remoteweapon);
        weapon.remoteowner switchtoweapon(remoteweapon);
        if (always_allow_ride) {
            weapon.remoteowner waittill(#"weapon_change", #"death");
        } else {
            waitresult = undefined;
            waitresult = weapon.remoteowner waittill(#"weapon_change");
            newweapon = waitresult.weapon;
        }
    }
    if (isdefined(newweapon)) {
        if (newweapon != remoteweapon || weapon.remoteowner util::isusingremote() && weapon.remoteowner.usingremote !== weapon.remotename) {
            weapon.remoteowner killstreaks::clear_using_remote(1, 1);
            return;
        }
    }
    weapon callback::function_d8abfc3d(#"on_end_game", &on_game_ended);
    weapon.var_57446df7 = 1;
    weapon.remoteowner thread killstreaks::watch_for_remove_remote_weapon();
    weapon.remoteowner util::setusingremote(weapon.remotename);
    weapon.remoteowner val::set(#"useremotecontrolweapon", "freezecontrols");
    weapon.remoteowner thread resetcontrols(weapon);
    result = weapon.remoteowner killstreaks::init_ride_killstreak(weapon.remotename, always_allow_ride);
    if (result != "success") {
        if (result != "disconnect") {
            weapon.remoteowner killstreaks::clear_using_remote();
            weapon thread resetcontrolinitiateduponownerrespawn();
        }
    } else {
        weapon.controlled = 1;
        weapon.killcament = self;
        weapon notify(#"remote_start");
        if (allowmanualdeactivation) {
            weapon thread watchremotecontroldeactivate();
        }
        weapon.remoteowner thread [[ level.remoteweapons[weapon.remotename].usecallback ]](weapon);
        if (level.remoteweapons[weapon.remotename].hidecompassonuse) {
            weapon.remoteowner killstreaks::hide_compass();
        }
    }
    weapon notify(#"reset_controls");
}

// Namespace remote_weapons/remote_weapons
// Params 1, eflags: 0x0
// Checksum 0xe4485d34, Offset: 0x13f8
// Size: 0x64
function resetcontrols(weapon) {
    weapon waittill(#"death", #"reset_controls");
    if (isdefined(self)) {
        self val::reset(#"useremotecontrolweapon", "freezecontrols");
    }
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0x8b2b2d86, Offset: 0x1468
// Size: 0x3a
function resetcontrolinitiateduponownerrespawn() {
    self endon(#"death");
    self.remoteowner waittill(#"spawned");
    self.control_initiated = 0;
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0x3f87b03e, Offset: 0x14b0
// Size: 0x138
function watchremotecontroldeactivate() {
    self notify(#"watchremotecontroldeactivate_remoteweapons");
    self endon(#"watchremotecontroldeactivate_remoteweapons");
    weapon = self;
    weapon endon(#"remote_weapon_end", #"death");
    weapon.remoteowner endon(#"disconnect");
    while (weapon.remoteowner usebuttonpressed()) {
        waitframe(1);
    }
    while (1) {
        timeused = 0;
        while (weapon.remoteowner usebuttonpressed()) {
            timeused = timeused + 0.05;
            if (timeused > 0.25) {
                weapon thread endremotecontrolweaponuse(1);
                weapon.lastusetime = gettime();
                return;
            }
            waitframe(1);
        }
        waitframe(1);
    }
}

// Namespace remote_weapons/remote_weapons
// Params 2, eflags: 0x0
// Checksum 0x87987e5a, Offset: 0x15f0
// Size: 0x540
function endremotecontrolweaponuse(exitrequestedbyowner, gameended) {
    weapon = self;
    if (!isdefined(weapon) || isdefined(weapon.endremotecontrolweapon) && weapon.endremotecontrolweapon) {
        return;
    }
    weapon.endremotecontrolweapon = 1;
    remote_controlled = isdefined(weapon.control_initiated) && weapon.control_initiated || isdefined(weapon.controlled) && weapon.controlled;
    while (isdefined(weapon) && weapon.forcewaitremotecontrol === 1 && remote_controlled == 0) {
        remote_controlled = isdefined(weapon.control_initiated) && weapon.control_initiated || isdefined(weapon.controlled) && weapon.controlled;
        waitframe(1);
    }
    if (!isdefined(weapon)) {
        return;
    }
    if (isdefined(weapon.remoteowner) && remote_controlled) {
        if (isdefined(weapon.remoteweaponshutdowndelay)) {
            wait(weapon.remoteweaponshutdowndelay);
        }
        player = weapon.remoteowner;
        if (player.dofutz === 1) {
            player clientfield::set_to_player("static_postfx", 1);
            wait(1);
            if (isdefined(player)) {
                player clientfield::set_to_player("static_postfx", 0);
                player.dofutz = 0;
            }
        } else if (!exitrequestedbyowner && weapon.watch_remote_weapon_death === 1 && !isalive(weapon)) {
            weapon.dontfreeme = 1;
            wait(isdefined(weapon.watch_remote_weapon_death_duration) ? weapon.watch_remote_weapon_death_duration : 1);
            weapon.dontfreeme = undefined;
        }
        if (isdefined(player)) {
            player thread fadetoblackandbackin();
            player waittill(#"fade2black");
            if (remote_controlled) {
                player unlink();
            }
            player killstreaks::clear_using_remote(0, undefined, gameended);
            cleared_killstreak_delay = 1;
            player enableusability();
        }
    }
    if (isdefined(weapon) && isdefined(weapon.remotename)) {
        self [[ level.remoteweapons[weapon.remotename].endusecallback ]](weapon, exitrequestedbyowner);
    }
    if (isdefined(weapon)) {
        weapon.killcament = weapon;
        if (isdefined(weapon.remoteowner)) {
            if (remote_controlled) {
                weapon.remoteowner unlink();
                if (!(isdefined(cleared_killstreak_delay) && cleared_killstreak_delay)) {
                    weapon.remoteowner killstreaks::reset_killstreak_delay_killcam();
                }
                weapon.remoteowner util::clientnotify("nofutz");
            }
            if (isdefined(level.gameended) && level.gameended) {
                weapon.remoteowner val::set(#"game_end", "freezecontrols");
            }
        }
    }
    if (isdefined(weapon)) {
        if (isdefined(weapon.var_57446df7) && weapon.var_57446df7) {
            weapon callback::function_52ac9652(#"on_end_game", &on_game_ended);
        }
        weapon.control_initiated = 0;
        weapon.controlled = 0;
        if (isdefined(weapon.remoteowner)) {
            weapon.remoteowner killstreaks::unhide_compass();
        }
        if (!exitrequestedbyowner || isdefined(weapon.one_remote_use) && weapon.one_remote_use) {
            weapon.remote_weapon_end = 1;
            weapon notify(#"remote_weapon_end");
        }
    }
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0xdd4407fd, Offset: 0x1b38
// Size: 0x7c
function fadetoblackandbackin() {
    self endon(#"disconnect");
    lui::screen_fade_out(0.1);
    self destroyhud();
    waitframe(1);
    self notify(#"fade2black");
    lui::screen_fade_in(0.2);
}

// Namespace remote_weapons/remote_weapons
// Params 1, eflags: 0x0
// Checksum 0x8849a456, Offset: 0x1bc0
// Size: 0x70
function stunstaticfx(duration) {
    self endon(#"remove_remote_weapon");
    wait(duration - 0.5);
    for (time = duration - 0.5; time < duration; time = time + 0.05) {
        waitframe(1);
    }
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0x36146895, Offset: 0x1c38
// Size: 0x84
function destroyhud() {
    if (isdefined(self)) {
        self notify(#"stop_signal_failure");
        self.flashingsignalfailure = 0;
        self clientfield::set_to_player("static_postfx", 0);
        self destroyremotehud();
        self util::clientnotify("nofutz");
    }
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0xc33f393d, Offset: 0x1cc8
// Size: 0x34
function destroyremotehud() {
    self useservervisionset(0);
    self setinfraredvision(0);
}

// Namespace remote_weapons/remote_weapons
// Params 1, eflags: 0x0
// Checksum 0x5057db3a, Offset: 0x1d08
// Size: 0xac
function set_static(val) {
    owner = self.owner;
    if (val) {
        if (isdefined(owner) && owner.usingvehicle && isdefined(owner.viewlockedentity) && owner.viewlockedentity == self) {
            owner clientfield::set_to_player("static_postfx", 1);
        }
        return;
    }
    if (isdefined(owner)) {
        owner function_3c9e877a();
    }
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0x9b787b9e, Offset: 0x1dc0
// Size: 0x24
function function_3c9e877a() {
    self clientfield::set_to_player("static_postfx", 0);
}

// Namespace remote_weapons/remote_weapons
// Params 0, eflags: 0x0
// Checksum 0x3d530f72, Offset: 0x1df0
// Size: 0x6e
function do_static_fx() {
    self set_static(1);
    owner = self.owner;
    wait(2);
    if (isdefined(owner)) {
        owner function_3c9e877a();
    }
    if (isdefined(self)) {
        self notify(#"static_fx_done");
    }
}


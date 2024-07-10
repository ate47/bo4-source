#using scripts\abilities\ability_util.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace killstreaks;

// Namespace killstreaks/killstreaks_util
// Params 3, eflags: 0x1 linked
// Checksum 0xe83fdc81, Offset: 0x78
// Size: 0x3f0
function switch_to_last_non_killstreak_weapon(immediate, awayfromball, gameended) {
    ball = getweapon(#"ball");
    if (isdefined(ball) && self hasweapon(ball) && !(isdefined(awayfromball) && awayfromball)) {
        self switchtoweaponimmediate(ball);
        self disableweaponcycling();
        self disableoffhandweapons();
    } else if (isdefined(self.laststand) && self.laststand) {
        if (isdefined(self.laststandpistol) && self hasweapon(self.laststandpistol)) {
            self switchtoweapon(self.laststandpistol);
        }
    } else if (isdefined(self.lastnonkillstreakweapon) && self hasweapon(self.lastnonkillstreakweapon) && self getcurrentweapon() != self.lastnonkillstreakweapon) {
        if (ability_util::is_hero_weapon(self.lastnonkillstreakweapon)) {
            if (self.lastnonkillstreakweapon.gadget_heroversion_2_0) {
                if (self.lastnonkillstreakweapon.isgadget && self getammocount(self.lastnonkillstreakweapon) > 0) {
                    slot = self gadgetgetslot(self.lastnonkillstreakweapon);
                    if (self util::gadget_is_in_use(slot)) {
                        return self switchtoweapon(self.lastnonkillstreakweapon);
                    } else {
                        return 1;
                    }
                }
            } else if (self getammocount(self.lastnonkillstreakweapon) > 0) {
                return self switchtoweapon(self.lastnonkillstreakweapon);
            }
            if (isdefined(awayfromball) && awayfromball && isdefined(self.lastdroppableweapon) && self hasweapon(self.lastdroppableweapon)) {
                self switchtoweapon(self.lastdroppableweapon);
            } else {
                self switchtoweapon();
            }
            return 1;
        } else if (isdefined(immediate) && immediate) {
            self switchtoweaponimmediate(self.lastnonkillstreakweapon, isdefined(gameended) && gameended);
        } else {
            self switchtoweapon(self.lastnonkillstreakweapon);
        }
    } else if (isdefined(self.lastdroppableweapon) && self hasweapon(self.lastdroppableweapon) && self getcurrentweapon() != self.lastdroppableweapon) {
        self switchtoweapon(self.lastdroppableweapon);
    } else {
        return 0;
    }
    return 1;
}

// Namespace killstreaks/killstreaks_util
// Params 1, eflags: 0x1 linked
// Checksum 0x113b45ce, Offset: 0x470
// Size: 0x34
function hasuav(team_or_entnum) {
    if (!isdefined(level.activeuavs)) {
        return true;
    }
    return level.activeuavs[team_or_entnum] > 0;
}

// Namespace killstreaks/killstreaks_util
// Params 1, eflags: 0x1 linked
// Checksum 0x855ab0aa, Offset: 0x4b0
// Size: 0x34
function hassatellite(team_or_entnum) {
    if (!isdefined(level.activesatellites)) {
        return true;
    }
    return level.activesatellites[team_or_entnum] > 0;
}

// Namespace killstreaks/killstreaks_util
// Params 1, eflags: 0x1 linked
// Checksum 0x17c684aa, Offset: 0x4f0
// Size: 0x3c
function function_f479a2ff(weapon) {
    if (isdefined(level.var_3ff1b984) && isdefined(level.var_3ff1b984[weapon])) {
        return true;
    }
    return false;
}

// Namespace killstreaks/killstreaks_util
// Params 1, eflags: 0x1 linked
// Checksum 0x334ead95, Offset: 0x538
// Size: 0x8c
function function_e3a30c69(weapon) {
    assert(isdefined(isdefined(level.killstreakweapons[weapon])));
    killstreak = level.killstreaks[level.killstreakweapons[weapon]];
    return isdefined(killstreak.script_bundle.var_a82b593f) ? killstreak.script_bundle.var_a82b593f : 0;
}

// Namespace killstreaks/killstreaks_util
// Params 1, eflags: 0x1 linked
// Checksum 0xb48b45b5, Offset: 0x5d0
// Size: 0x60
function is_killstreak_weapon(weapon) {
    if (weapon == level.weaponnone || weapon.notkillstreak) {
        return false;
    }
    if (weapon.isspecificuse || is_weapon_associated_with_killstreak(weapon)) {
        return true;
    }
    return false;
}

// Namespace killstreaks/killstreaks_util
// Params 1, eflags: 0x1 linked
// Checksum 0x4579eae4, Offset: 0x638
// Size: 0x5a
function get_killstreak_weapon(killstreak) {
    if (!isdefined(killstreak)) {
        return level.weaponnone;
    }
    assert(isdefined(level.killstreaks[killstreak]));
    return level.killstreaks[killstreak].weapon;
}

// Namespace killstreaks/killstreaks_util
// Params 1, eflags: 0x1 linked
// Checksum 0xff9ed894, Offset: 0x6a0
// Size: 0x30
function is_weapon_associated_with_killstreak(weapon) {
    return isdefined(level.killstreakweapons) && isdefined(level.killstreakweapons[weapon]);
}


// Atian COD Tools GSC decompiler test
#include scripts/core_common/spawner_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/ai_shared.gsc;

#namespace aisquads;

// Namespace aisquads
// Method(s) 9 Total 9
class squad {

    // Namespace squad/ai_squads
    // Params 0, eflags: 0x9 linked
    // Checksum 0x9c3729b9, Offset: 0x170
    // Size: 0x26
    __constructor() {
        self.squadleader = 0;
        self.var_7c4bdc0a = [];
        self.var_830b81e8 = [];
    }

    // Namespace squad/ai_squads
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x418
    // Size: 0x4
    __destructor() {
        
    }

    // Namespace squad/ai_squads
    // Params 0, eflags: 0x1 linked
    // Checksum 0xff993b77, Offset: 0x388
    // Size: 0x86
    function think() {
        if (isint(self.squadleader) && self.squadleader == 0 || !isdefined(self.squadleader)) {
            if (self.var_7c4bdc0a.size > 0) {
                self.squadleader = self.var_7c4bdc0a[0];
                self.var_830b81e8 = self.squadleader.origin;
            } else {
                return 0;
            }
        }
        return 1;
    }

    // Namespace squad/ai_squads
    // Params 1, eflags: 0x1 linked
    // Checksum 0x864d5361, Offset: 0x320
    // Size: 0x5e
    function removeaifromsqaud(ai) {
        if (isinarray(self.var_7c4bdc0a, ai)) {
            arrayremovevalue(self.var_7c4bdc0a, ai, 0);
            if (self.squadleader === ai) {
                self.squadleader = undefined;
            }
        }
    }

    // Namespace squad/ai_squads
    // Params 1, eflags: 0x1 linked
    // Checksum 0x55856af, Offset: 0x290
    // Size: 0x86
    function addaitosquad(ai) {
        if (!isinarray(self.var_7c4bdc0a, ai)) {
            if (ai.archetype == #"robot") {
                ai ai::set_behavior_attribute("move_mode", "squadmember");
            }
            self.var_7c4bdc0a[self.var_7c4bdc0a.size] = ai;
        }
    }

    // Namespace squad/ai_squads
    // Params 0, eflags: 0x1 linked
    // Checksum 0xd12a356b, Offset: 0x278
    // Size: 0xa
    function getmembers() {
        return self.var_7c4bdc0a;
    }

    // Namespace squad/ai_squads
    // Params 0, eflags: 0x1 linked
    // Checksum 0xc47f015, Offset: 0x260
    // Size: 0xa
    function getleader() {
        return self.squadleader;
    }

    // Namespace squad/ai_squads
    // Params 0, eflags: 0x1 linked
    // Checksum 0xa64e689e, Offset: 0x248
    // Size: 0xa
    function getsquadbreadcrumb() {
        return self.var_830b81e8;
    }

    // Namespace squad/ai_squads
    // Params 1, eflags: 0x1 linked
    // Checksum 0xc64824e6, Offset: 0x1a0
    // Size: 0x9e
    function addsquadbreadcrumbs(ai) {
        /#
            assert(self.squadleader == ai);
        #/
        if (distance2dsquared(self.var_830b81e8, ai.origin) >= 9216) {
            /#
                recordcircle(ai.origin, 4, (0, 0, 1), "<unknown string>", ai);
            #/
            self.var_830b81e8 = ai.origin;
        }
    }

}

// Namespace aisquads/ai_squads
// Params 0, eflags: 0x2
// Checksum 0xc9c6f142, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ai_squads", &__init__, undefined, undefined);
}

// Namespace aisquads/ai_squads
// Params 0, eflags: 0x1 linked
// Checksum 0xe67bfc17, Offset: 0xf8
// Size: 0x6c
function __init__() {
    level.var_af268484 = [];
    actorspawnerarray = getactorspawnerteamarray(#"axis");
    array::run_all(actorspawnerarray, &spawner::add_spawn_function, &squadmemberthink);
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x5 linked
// Checksum 0x7e557816, Offset: 0x608
// Size: 0x3c
function private createsquad(var_7435af0b) {
    level.var_af268484[var_7435af0b] = new squad();
    return level.var_af268484[var_7435af0b];
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x5 linked
// Checksum 0xdf15700b, Offset: 0x650
// Size: 0x44
function private removesquad(var_7435af0b) {
    if (isdefined(level.var_af268484) && isdefined(level.var_af268484[var_7435af0b])) {
        var_7435af0b = [];
    }
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x5 linked
// Checksum 0xd20c7723, Offset: 0x6a0
// Size: 0x1c
function private getsquad(var_7435af0b) {
    return level.var_af268484[var_7435af0b];
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x5 linked
// Checksum 0xe0e8ddf7, Offset: 0x6c8
// Size: 0x5c
function private thinksquad(var_7435af0b) {
    while (1) {
        if ([[ level.var_af268484[var_7435af0b] ]]->think()) {
            wait(0.5);
        } else {
            removesquad(var_7435af0b);
            break;
        }
    }
}

// Namespace aisquads/ai_squads
// Params 0, eflags: 0x5 linked
// Checksum 0x11a3634c, Offset: 0x730
// Size: 0x60
function private squadmemberdeath() {
    self waittill(#"death");
    if (isdefined(self.var_7435af0b) && isdefined(level.var_af268484[self.var_7435af0b])) {
        [[ level.var_af268484[self.var_7435af0b] ]]->removeaifromsqaud(self);
    }
}

// Namespace aisquads/ai_squads
// Params 0, eflags: 0x5 linked
// Checksum 0xf4938fb4, Offset: 0x798
// Size: 0x416
function private squadmemberthink() {
    self endon(#"death");
    if (!isdefined(self.var_141bf78c)) {
        return;
    }
    wait(0.5);
    self.var_7435af0b = self.var_141bf78c;
    if (isdefined(self.var_7435af0b)) {
        if (!isdefined(level.var_af268484[self.var_7435af0b])) {
            squad = createsquad(self.var_7435af0b);
            newsquadcreated = 1;
        } else {
            squad = getsquad(self.var_7435af0b);
        }
        [[ squad ]]->addaitosquad(self);
        self thread squadmemberdeath();
        if (isdefined(newsquadcreated) && newsquadcreated) {
            level thread thinksquad(self.var_7435af0b);
        }
        while (1) {
            squadleader = [[ level.var_af268484[self.var_7435af0b] ]]->getleader();
            if (isdefined(squadleader) && !(isint(squadleader) && squadleader == 0)) {
                if (squadleader == self) {
                    /#
                        recordenttext(self.var_7435af0b + "<unknown string>", self, (0, 1, 0), "<unknown string>");
                    #/
                    /#
                        recordenttext(self.var_7435af0b + "<unknown string>", self, (0, 1, 0), "<unknown string>");
                    #/
                    /#
                        recordcircle(self.origin, 300, (1, 0.5, 0), "<unknown string>", self);
                    #/
                    if (isdefined(self.enemy)) {
                        self setgoal(self.enemy);
                    }
                    [[ squad ]]->addsquadbreadcrumbs(self);
                } else {
                    /#
                        recordline(self.origin, squadleader.origin, (0, 1, 0), "<unknown string>", self);
                    #/
                    /#
                        recordenttext(self.var_7435af0b + "<unknown string>", self, (0, 1, 0), "<unknown string>");
                    #/
                    followposition = [[ squad ]]->getsquadbreadcrumb();
                    followdistsq = distance2dsquared(self.goalpos, followposition);
                    if (isdefined(squadleader.enemy)) {
                        if (!isdefined(self.enemy) || isdefined(self.enemy) && self.enemy != squadleader.enemy) {
                            self setentitytarget(squadleader.enemy, 1);
                        }
                    }
                    if (isdefined(self.goalpos) && followdistsq >= 256) {
                        if (followdistsq >= 22500) {
                            self ai::set_behavior_attribute("sprint", 1);
                        } else {
                            self ai::set_behavior_attribute("sprint", 0);
                        }
                        self setgoal(followposition, 1);
                    }
                }
            }
            wait(1);
        }
    }
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x0
// Checksum 0x7502ffb3, Offset: 0xbb8
// Size: 0xba
function isfollowingsquadleader(ai) {
    if (ai ai::get_behavior_attribute("move_mode") != "squadmember") {
        return 0;
    }
    squadmember = issquadmember(ai);
    currentsquadleader = getsquadleader(ai);
    isaisquadleader = isdefined(currentsquadleader) && currentsquadleader == ai;
    if (squadmember && !isaisquadleader) {
        return 1;
    }
    return 0;
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x1 linked
// Checksum 0x589cde66, Offset: 0xc80
// Size: 0x66
function issquadmember(ai) {
    if (isdefined(ai.var_7435af0b)) {
        squad = getsquad(ai.var_7435af0b);
        if (isdefined(squad)) {
            return isinarray([[ squad ]]->getmembers(), ai);
        }
    }
    return 0;
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x0
// Checksum 0xb93bec5d, Offset: 0xcf0
// Size: 0x76
function issquadleader(ai) {
    if (isdefined(ai.var_7435af0b)) {
        squad = getsquad(ai.var_7435af0b);
        if (isdefined(squad)) {
            squadleader = [[ squad ]]->getleader();
            return (isdefined(squadleader) && squadleader == ai);
        }
    }
    return 0;
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x1 linked
// Checksum 0x2dae9864, Offset: 0xd70
// Size: 0x56
function getsquadleader(ai) {
    if (isdefined(ai.var_7435af0b)) {
        squad = getsquad(ai.var_7435af0b);
        if (isdefined(squad)) {
            return [[ squad ]]->getleader();
        }
    }
    return undefined;
}


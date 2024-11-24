#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\system_shared;

#namespace aisquads;

// Namespace aisquads
// Method(s) 9 Total 9
class squad {

    var squadbreadcrumb;
    var squadleader;
    var squadmembers;

    // Namespace squad/ai_squads
    // Params 0, eflags: 0x9 linked
    // Checksum 0x9c3729b9, Offset: 0x170
    // Size: 0x26
    constructor() {
        squadleader = 0;
        squadmembers = [];
        squadbreadcrumb = [];
    }

    // Namespace squad/ai_squads
    // Params 0, eflags: 0x1 linked
    // Checksum 0xff993b77, Offset: 0x388
    // Size: 0x86
    function think() {
        if (isint(squadleader) && squadleader == 0 || !isdefined(squadleader)) {
            if (squadmembers.size > 0) {
                squadleader = squadmembers[0];
                squadbreadcrumb = squadleader.origin;
            } else {
                return false;
            }
        }
        return true;
    }

    // Namespace squad/ai_squads
    // Params 1, eflags: 0x1 linked
    // Checksum 0x864d5361, Offset: 0x320
    // Size: 0x5e
    function removeaifromsqaud(ai) {
        if (isinarray(squadmembers, ai)) {
            arrayremovevalue(squadmembers, ai, 0);
            if (squadleader === ai) {
                squadleader = undefined;
            }
        }
    }

    // Namespace squad/ai_squads
    // Params 1, eflags: 0x1 linked
    // Checksum 0x55856af, Offset: 0x290
    // Size: 0x86
    function addaitosquad(ai) {
        if (!isinarray(squadmembers, ai)) {
            if (ai.archetype == #"robot") {
                ai ai::set_behavior_attribute("move_mode", "squadmember");
            }
            squadmembers[squadmembers.size] = ai;
        }
    }

    // Namespace squad/ai_squads
    // Params 0, eflags: 0x1 linked
    // Checksum 0xd12a356b, Offset: 0x278
    // Size: 0xa
    function getmembers() {
        return squadmembers;
    }

    // Namespace squad/ai_squads
    // Params 0, eflags: 0x1 linked
    // Checksum 0xc47f015, Offset: 0x260
    // Size: 0xa
    function getleader() {
        return squadleader;
    }

    // Namespace squad/ai_squads
    // Params 0, eflags: 0x1 linked
    // Checksum 0xa64e689e, Offset: 0x248
    // Size: 0xa
    function getsquadbreadcrumb() {
        return squadbreadcrumb;
    }

    // Namespace squad/ai_squads
    // Params 1, eflags: 0x1 linked
    // Checksum 0xc64824e6, Offset: 0x1a0
    // Size: 0x9e
    function addsquadbreadcrumbs(ai) {
        assert(squadleader == ai);
        if (distance2dsquared(squadbreadcrumb, ai.origin) >= 9216) {
            /#
                recordcircle(ai.origin, 4, (0, 0, 1), "<dev string:x38>", ai);
            #/
            squadbreadcrumb = ai.origin;
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
    level._squads = [];
    actorspawnerarray = getactorspawnerteamarray(#"axis");
    array::run_all(actorspawnerarray, &spawner::add_spawn_function, &squadmemberthink);
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x5 linked
// Checksum 0x7e557816, Offset: 0x608
// Size: 0x3c
function private createsquad(squadname) {
    level._squads[squadname] = new squad();
    return level._squads[squadname];
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x5 linked
// Checksum 0xdf15700b, Offset: 0x650
// Size: 0x44
function private removesquad(squadname) {
    if (isdefined(level._squads) && isdefined(level._squads[squadname])) {
        level._squads[squadname] = undefined;
    }
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x5 linked
// Checksum 0xd20c7723, Offset: 0x6a0
// Size: 0x1c
function private getsquad(squadname) {
    return level._squads[squadname];
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x5 linked
// Checksum 0xe0e8ddf7, Offset: 0x6c8
// Size: 0x5c
function private thinksquad(squadname) {
    while (true) {
        if ([[ level._squads[squadname] ]]->think()) {
            wait 0.5;
            continue;
        }
        removesquad(squadname);
        break;
    }
}

// Namespace aisquads/ai_squads
// Params 0, eflags: 0x5 linked
// Checksum 0x11a3634c, Offset: 0x730
// Size: 0x60
function private squadmemberdeath() {
    self waittill(#"death");
    if (isdefined(self.squadname) && isdefined(level._squads[self.squadname])) {
        [[ level._squads[self.squadname] ]]->removeaifromsqaud(self);
    }
}

// Namespace aisquads/ai_squads
// Params 0, eflags: 0x5 linked
// Checksum 0xf4938fb4, Offset: 0x798
// Size: 0x416
function private squadmemberthink() {
    self endon(#"death");
    if (!isdefined(self.script_aisquadname)) {
        return;
    }
    wait 0.5;
    self.squadname = self.script_aisquadname;
    if (isdefined(self.squadname)) {
        if (!isdefined(level._squads[self.squadname])) {
            squad = createsquad(self.squadname);
            newsquadcreated = 1;
        } else {
            squad = getsquad(self.squadname);
        }
        [[ squad ]]->addaitosquad(self);
        self thread squadmemberdeath();
        if (isdefined(newsquadcreated) && newsquadcreated) {
            level thread thinksquad(self.squadname);
        }
        while (true) {
            squadleader = [[ level._squads[self.squadname] ]]->getleader();
            if (isdefined(squadleader) && !(isint(squadleader) && squadleader == 0)) {
                if (squadleader == self) {
                    /#
                        recordenttext(self.squadname + "<dev string:x45>", self, (0, 1, 0), "<dev string:x38>");
                    #/
                    /#
                        recordenttext(self.squadname + "<dev string:x45>", self, (0, 1, 0), "<dev string:x38>");
                    #/
                    /#
                        recordcircle(self.origin, 300, (1, 0.5, 0), "<dev string:x38>", self);
                    #/
                    if (isdefined(self.enemy)) {
                        self setgoal(self.enemy);
                    }
                    [[ squad ]]->addsquadbreadcrumbs(self);
                } else {
                    /#
                        recordline(self.origin, squadleader.origin, (0, 1, 0), "<dev string:x38>", self);
                    #/
                    /#
                        recordenttext(self.squadname + "<dev string:x50>", self, (0, 1, 0), "<dev string:x38>");
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
            wait 1;
        }
    }
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x0
// Checksum 0x7502ffb3, Offset: 0xbb8
// Size: 0xba
function isfollowingsquadleader(ai) {
    if (ai ai::get_behavior_attribute("move_mode") != "squadmember") {
        return false;
    }
    squadmember = issquadmember(ai);
    currentsquadleader = getsquadleader(ai);
    isaisquadleader = isdefined(currentsquadleader) && currentsquadleader == ai;
    if (squadmember && !isaisquadleader) {
        return true;
    }
    return false;
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x1 linked
// Checksum 0x589cde66, Offset: 0xc80
// Size: 0x66
function issquadmember(ai) {
    if (isdefined(ai.squadname)) {
        squad = getsquad(ai.squadname);
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
    if (isdefined(ai.squadname)) {
        squad = getsquad(ai.squadname);
        if (isdefined(squad)) {
            squadleader = [[ squad ]]->getleader();
            return (isdefined(squadleader) && squadleader == ai);
        }
    }
    return false;
}

// Namespace aisquads/ai_squads
// Params 1, eflags: 0x1 linked
// Checksum 0x2dae9864, Offset: 0xd70
// Size: 0x56
function getsquadleader(ai) {
    if (isdefined(ai.squadname)) {
        squad = getsquad(ai.squadname);
        if (isdefined(squad)) {
            return [[ squad ]]->getleader();
        }
    }
    return undefined;
}


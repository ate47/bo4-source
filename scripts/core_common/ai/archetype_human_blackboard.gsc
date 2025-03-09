#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai_shared;

#namespace blackboard;

// Namespace blackboard/archetype_human_blackboard
// Params 0, eflags: 0x4
// Checksum 0x957a3b85, Offset: 0x178
// Size: 0x36
function private bb_getarrivaltype() {
    if (self ai::get_behavior_attribute("disablearrivals")) {
        return "dont_arrive_at_goal";
    }
    return "arrive_at_goal";
}

// Namespace blackboard/archetype_human_blackboard
// Params 0, eflags: 0x4
// Checksum 0x342c2bcc, Offset: 0x1b8
// Size: 0x3a
function private bb_gettacticalarrivalfacingyaw() {
    return angleclamp180(self.angles[1] - self.node.angles[1]);
}

// Namespace blackboard/archetype_human_blackboard
// Params 0, eflags: 0x4
// Checksum 0x2bb06922, Offset: 0x200
// Size: 0x1b6
function private bb_getlocomotionmovementtype() {
    if (!ai::getaiattribute(self, "disablesprint")) {
        if (ai::getaiattribute(self, "sprint")) {
            return "human_locomotion_movement_sprint";
        }
        if (!isdefined(self.nearbyfriendlycheck)) {
            self.nearbyfriendlycheck = 0;
        }
        now = gettime();
        if (now >= self.nearbyfriendlycheck) {
            self.nearbyfriendlycount = getactorteamcountradius(self.origin, 120, self.team, #"neutral");
            self.nearbyfriendlycheck = now + 500;
        }
        if (self.nearbyfriendlycount >= 3) {
            return "human_locomotion_movement_default";
        }
        if (isdefined(self.enemy) && isdefined(self.runandgundist)) {
            if (distancesquared(self.origin, self lastknownpos(self.enemy)) > self.runandgundist * self.runandgundist) {
                return "human_locomotion_movement_sprint";
            }
        } else if (isdefined(self.goalpos) && isdefined(self.runandgundist)) {
            if (distancesquared(self.origin, self.goalpos) > self.runandgundist * self.runandgundist) {
                return "human_locomotion_movement_sprint";
            }
        }
    }
    return "human_locomotion_movement_default";
}

// Namespace blackboard/archetype_human_blackboard
// Params 0, eflags: 0x4
// Checksum 0x5fe81fd7, Offset: 0x3c0
// Size: 0x1fa
function private bb_getcoverflankability() {
    if (self asmistransitionrunning()) {
        return "unflankable";
    }
    if (!isdefined(self.node)) {
        return "unflankable";
    }
    covermode = self getblackboardattribute("_cover_mode");
    if (isdefined(covermode)) {
        covernode = self.node;
        if (covermode == "cover_alert" || covermode == "cover_mode_none") {
            return "flankable";
        }
        if (covernode.type == #"cover pillar") {
            return (covermode == "cover_blind");
        } else if (covernode.type == #"cover left" || covernode.type == #"cover right") {
            return (covermode == "cover_blind" || covermode == "cover_over");
        } else if (covernode.type == #"cover stand" || covernode.type == #"conceal stand" || covernode.type == #"cover crouch" || covernode.type == #"cover crouch window" || covernode.type == #"conceal crouch") {
            return "flankable";
        }
    }
    return "unflankable";
}


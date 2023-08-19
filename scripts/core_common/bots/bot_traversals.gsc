// Atian COD Tools GSC decompiler test
#include scripts/core_common/bots/bot_action.gsc;
#include scripts/core_common/bots/bot.gsc;
#include scripts/core_common/bots/bot_animation.gsc;

#namespace bot;

// Namespace bot/bot_traversals
// Params 6, eflags: 0x1 linked
// Checksum 0x6a27ef3c, Offset: 0xf0
// Size: 0x254
function callback_botentereduseredge(startnode, endnode, mantlenode, startpos, endpos, var_2a1f4ab7) {
    if (self isplayinganimscripted()) {
        /#
            self botprinterror("<unknown string>");
        #/
        waitframe(1);
        self botreleasemanualcontrol();
        return;
    }
    var_75e8e8e8 = startnode.type !== "Volume";
    if (var_75e8e8e8) {
        if ((startnode.type === "Begin" || startnode.type === "End") && isdefined(startnode.spawnflags) && startnode.spawnflags & 134217728) {
            var_75e8e8e8 = 0;
        }
    }
    if (var_75e8e8e8) {
        /#
            self botprinterror("<unknown string>");
        #/
        self thread fallback_traversal(endpos);
        return;
    }
    params = spawnstruct();
    params.startnode = startnode;
    params.endnode = endnode;
    params.mantlenode = mantlenode;
    params.startpos = startpos;
    params.endpos = endpos;
    params.var_2a1f4ab7 = var_2a1f4ab7;
    if (isdefined(startnode) && isdefined(startnode.script_parameters) && startnode.script_parameters == "botIgnoreHeightCheck") {
        params.var_bccf04e7 = 1;
    }
    self analyze(params);
    self thread volume_traversal(params);
}

// Namespace bot/bot_traversals
// Params 0, eflags: 0x0
// Checksum 0x249f206b, Offset: 0x350
// Size: 0x16
function cancel() {
    self notify(#"hash_a729d7d4c6847f6");
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0x9c1d251d, Offset: 0x370
// Size: 0xbc
function fallback_traversal(endpos) {
    self endon(#"death", #"hash_a729d7d4c6847f6", #"hash_37fc5d1ffce4acaf");
    self endoncallback(&release_control, #"entering_last_stand", #"new_shot");
    level endon(#"game_ended");
    self teleport(endpos, "Legacy fallback");
    self botreleasemanualcontrol();
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0xcaee8b3a, Offset: 0x438
// Size: 0xc4
function function_c3452ef9(params) {
    self.traversestartnode = params.startnode;
    self.traversalstartpos = params.startpos;
    self.traverseendnode = params.endnode;
    self.traversalendpos = params.endpos;
    self.traversemantlenode = params.mantlenode;
    bot_animation::play_animation("parametric_traverse@traversal");
    self.traversestartnode = undefined;
    self.traversalstartpos = undefined;
    self.traverseendnode = undefined;
    self.traversalendpos = undefined;
    self.traversemantlenode = undefined;
    self release_control();
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0x4a8a7855, Offset: 0x508
// Size: 0x41c
function volume_traversal(params) {
    self endon(#"death", #"hash_a729d7d4c6847f6", #"hash_37fc5d1ffce4acaf");
    self endoncallback(&release_control, #"entering_last_stand", #"new_shot");
    level endon(#"game_ended");
    self.bot.traversal = params;
    self bot_action::reset();
    self thread traversal_timeout(params);
    if (params.var_b8915580) {
        self function_fc004e60(params);
    } else if (params.dist2d > 30 && params.var_5aacf42 >= 0) {
        /#
            self botprinterror("<unknown string>");
        #/
        self thread function_c3452ef9(params);
        return;
    } else if (abs(params.targetheight) <= 18) {
        self walk_traversal(params);
    } else if (params.targetheight > 0) {
        if (params.var_5aacf42 < 0) {
            /#
                self botprinterror("<unknown string>");
            #/
            self thread function_c3452ef9(params);
            return;
        } else {
            self mantle_traversal(params);
        }
    } else if (params.targetheight < -72 && !(isdefined(params.var_bccf04e7) && params.var_bccf04e7)) {
        /#
            self botprinterror("<unknown string>");
        #/
        self thread function_c3452ef9(params);
        return;
    } else if (params.targetheight < 0) {
        self fall_traversal(params.endpos);
    } else {
        /#
            self botprinterror("<unknown string>" + params.startnode.origin);
        #/
        self thread function_c3452ef9(params);
        return;
    }
    if (!ispointonnavmesh(self.origin, self)) {
        /#
            self botprinterror("<unknown string>" + params.startnode.origin);
        #/
        self thread function_c3452ef9(params);
        return;
    } else if (distancesquared(self.origin, params.endpos) > distancesquared(self.origin, params.startpos)) {
        /#
            self botprinterror("<unknown string>");
        #/
        self thread function_c3452ef9(params);
        return;
    }
    self release_control();
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0xc6a08843, Offset: 0x930
// Size: 0x5c
function release_control(notifyhash) {
    self notify(#"hash_612231aa5def85e2");
    if (!isbot(self)) {
        return;
    }
    self.bot.traversal = undefined;
    self botreleasemanualcontrol();
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0xf9d9bd6b, Offset: 0x998
// Size: 0xdc
function traversal_timeout(params) {
    self endon(#"death", #"hash_a729d7d4c6847f6", #"hash_612231aa5def85e2");
    level endon(#"game_ended");
    wait(3.5);
    /#
        self botprinterror("<unknown string>" + params.startnode.origin);
    #/
    self notify(#"hash_37fc5d1ffce4acaf");
    self thread function_c3452ef9(params);
    self.bot.traversal = undefined;
    self botreleasemanualcontrol();
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0x5ea6fb39, Offset: 0xa80
// Size: 0x374
function analyze(params) {
    params.starttrace = checknavmeshdirection(params.startpos, params.endpos - params.startpos, 512, 0);
    params.endtrace = checknavmeshdirection(params.endpos, params.startpos - params.endpos, 512, 0);
    params.targetpos = isdefined(params.var_2a1f4ab7) ? params.var_2a1f4ab7 : params.endtrace;
    params.targetheight = params.targetpos[2] - params.starttrace[2];
    normal = params.startpos - params.endpos;
    params.normal = vectornormalize((normal[0], normal[1], 0));
    if (distance2dsquared(params.starttrace, params.targetpos) == 0) {
        params.var_5aacf42 = 0;
    } else {
        params.var_5aacf42 = vectordot(params.starttrace - params.targetpos, params.normal);
    }
    params.dist2d = distance2d(params.starttrace, params.targetpos);
    params.var_b8915580 = function_51cbae24(params);
    /#
        if (self should_record("<unknown string>")) {
            var_47d2875c = (params.targetpos[0], params.targetpos[1], params.starttrace[2]);
            var_b03d274a = params.dist2d < 30 ? (1, 0, 0) : (0, 1, 0);
            recordline(params.starttrace, var_47d2875c, var_b03d274a, "<unknown string>", self);
            recordsphere(var_47d2875c, 3, var_b03d274a, "<unknown string>", self);
            recordsphere(params.starttrace, 3, (0, 1, 0), "<unknown string>", self);
            recordsphere(params.targetpos, 3, (1, 0, 1), "<unknown string>", self);
        }
    #/
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0x18bcc96f, Offset: 0xe00
// Size: 0xbc
function function_51cbae24(params) {
    if (params.targetheight < 18) {
        return 0;
    }
    dir = vectornormalize(params.endpos - params.startpos);
    result = bullettrace(params.startpos, params.startpos + dir * 512, 0, self);
    if (result[#"surfacetype"] == "ladder") {
        return 1;
    }
    return 0;
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0x638308e2, Offset: 0xec8
// Size: 0xc4
function mantle_traversal(params) {
    /#
        if (self should_record("<unknown string>")) {
            record3dtext("<unknown string>", self.origin, (1, 1, 1), "<unknown string>", undefined, 0.5);
        }
    #/
    edge_approach(params.starttrace, params.normal, 20);
    jump(params.targetpos);
    mantle(params.targetpos);
}

// Namespace bot/bot_traversals
// Params 3, eflags: 0x0
// Checksum 0xaaf243e0, Offset: 0xf98
// Size: 0x1ba
function ledge_traversal(endpos, ledgetop, normal) {
    /#
        if (self should_record("<unknown string>")) {
            record3dtext("<unknown string>", self.origin, (1, 1, 1), "<unknown string>", undefined, 0.5);
        }
    #/
    trace = bullettrace(ledgetop, ledgetop - vectorscale((0, 0, 1), 1024), 0, self);
    var_82c7381e = trace[#"position"];
    self botsetmovepoint(endpos);
    var_ccaaa590 = vectordot(self.origin - var_82c7381e, normal);
    while (var_ccaaa590 > 20) {
        waitframe(1);
        var_ccaaa590 = vectordot(self.origin - var_82c7381e, normal);
    }
    self botsetmovemagnitude(0);
    self bottapbutton(10);
    waitframe(1);
    while (!self isonground() || self ismantling()) {
        waitframe(1);
    }
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x0
// Checksum 0xaeab866e, Offset: 0x1160
// Size: 0xc4
function jump_traversal(params) {
    /#
        if (self should_record("<unknown string>")) {
            record3dtext("<unknown string>", self.origin, (1, 1, 0), "<unknown string>", undefined, 0.5);
        }
    #/
    self edge_approach(params.starttrace, params.normal);
    self jump(params.targetpos);
    self fall();
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0x411f12b2, Offset: 0x1230
// Size: 0xb4
function fall_traversal(endpos) {
    /#
        if (self should_record("<unknown string>")) {
            record3dtext("<unknown string>", self.origin, (1, 1, 1), "<unknown string>", undefined, 0.5);
        }
    #/
    self botsetmovemagnitude(1);
    self botsetmovepoint(endpos);
    self fall();
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0xa46815c6, Offset: 0x12f0
// Size: 0x132
function walk_traversal(params) {
    /#
        if (self should_record("<unknown string>")) {
            record3dtext("<unknown string>", self.origin, (1, 1, 1), "<unknown string>", undefined, 0.5);
        }
    #/
    self botsetmovemagnitude(1);
    self botsetmovepoint(params.endpos);
    dist = distance2dsquared(self.origin, params.endpos);
    prev_dist = dist;
    while (dist > 256 && prev_dist >= dist) {
        waitframe(1);
        prev_dist = dist;
        dist = distance2dsquared(self.origin, params.endpos);
    }
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0xeb8e9e2f, Offset: 0x1430
// Size: 0x50
function function_fc004e60(params) {
    self botsetmovepoint(params.endpos);
    while (!self isonground()) {
        waitframe(1);
    }
}

// Namespace bot/bot_traversals
// Params 2, eflags: 0x1 linked
// Checksum 0x24d19001, Offset: 0x1488
// Size: 0xaa
function teleport(endpos, reason) {
    /#
        if (self should_record("<unknown string>")) {
            record3dtext("<unknown string>" + reason, self.origin, (1, 1, 1), "<unknown string>", undefined, 0.5);
        }
    #/
    self setorigin(endpos);
    self dontinterpolate();
    waitframe(1);
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0x94b7af26, Offset: 0x1540
// Size: 0xe2
function mantle(var_2a1f4ab7) {
    self botsetmovemagnitude(1);
    /#
        if (self should_record("<unknown string>")) {
            record3dtext("<unknown string>", var_2a1f4ab7, (1, 1, 1), "<unknown string>", undefined, 0.5);
            recordsphere(var_2a1f4ab7, 3, (1, 1, 0), "<unknown string>", self);
        }
    #/
    while (!self isonground() || self ismantling()) {
        waitframe(1);
    }
}

// Namespace bot/bot_traversals
// Params 3, eflags: 0x1 linked
// Checksum 0x8c91a923, Offset: 0x1630
// Size: 0x172
function edge_approach(edgepos, normal, dist = 0) {
    /#
        if (self should_record("<unknown string>")) {
            recordtext = "<unknown string>";
            if (dist > 0) {
                recordtext = recordtext + "<unknown string>" + dist;
            }
            record3dtext(recordtext, edgepos, (1, 1, 1), "<unknown string>", undefined, 0.5);
            recordsphere(edgepos, 3, (0, 1, 0), "<unknown string>", self);
        }
    #/
    self botsetmovepoint(edgepos);
    self botsetmovemagnitude(1);
    var_459ca70 = vectordot(self.origin - edgepos, normal);
    while (var_459ca70 > dist) {
        waitframe(1);
        var_459ca70 = vectordot(self.origin - edgepos, normal);
    }
}

// Namespace bot/bot_traversals
// Params 1, eflags: 0x1 linked
// Checksum 0xd3b6286d, Offset: 0x17b0
// Size: 0xa2
function jump(var_75f5c2cb) {
    /#
        if (self should_record("<unknown string>")) {
            record3dtext("<unknown string>", var_75f5c2cb, (1, 1, 1), "<unknown string>", undefined, 0.5);
            recordsphere(var_75f5c2cb, 3, (1, 1, 1), "<unknown string>", self);
        }
    #/
    self bottapbutton(10);
    waitframe(1);
}

// Namespace bot/bot_traversals
// Params 0, eflags: 0x1 linked
// Checksum 0xee5814e2, Offset: 0x1860
// Size: 0xa0
function fall() {
    /#
        if (self should_record("<unknown string>")) {
            record3dtext("<unknown string>", self.origin, (1, 1, 1), "<unknown string>", undefined, 0.5);
        }
    #/
    while (self isonground()) {
        waitframe(1);
    }
    while (!self isonground()) {
        waitframe(1);
    }
}


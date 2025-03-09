#using scripts\core_common\ai_shared;
#using scripts\core_common\bots\bot;
#using scripts\core_common\system_shared;

#namespace bot_stance;

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x2
// Checksum 0x75f1303c, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"bot_stance", &__init__, undefined, undefined);
}

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x0
// Checksum 0x2428f69d, Offset: 0x118
// Size: 0x31c
function __init__() {
    level.var_17a3a139 = [];
    level.botstances = [];
    register_handler(#"default", &handle_default);
    register_handler(#"hash_2405aec12988c1f7", &function_7857357b);
    register_handler(#"hash_ca2f8909b847c6f", &function_f1b497ec);
    register_handler(#"hash_7a468797a3a33424", &function_41d967fe);
    register_handler(#"hash_2ebb09bf5581043d", &function_f71302f4);
    register_handler(#"hash_3173f482acc24ec8", &function_821cce69);
    register_handler(#"sprint_set", &function_5485fc7b);
    register_handler(#"sprint_set", &function_5485fc7b);
    register_handler(#"hash_59db68c04af7aab5", &function_e4f752b9);
    register_handler(#"hash_51f609ea675fecde", &function_d22ff818);
    register_handler(#"hash_21f619ce507cec96", &function_1989cfaf);
    register_stance(#"stand", &stand);
    register_stance(#"sprint", &sprint);
    register_stance(#"crouch", &crouch);
    register_stance(#"prone", &prone);
    register_stance(#"slide", &slide);
}

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x0
// Checksum 0xb1b010e7, Offset: 0x440
// Size: 0x42
function start() {
    self thread handle_path_success();
    self thread handle_goal_reached();
    self.bot.var_9bd97adb = undefined;
}

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x0
// Checksum 0xb39c8a71, Offset: 0x490
// Size: 0x16
function stop() {
    self notify(#"hash_399ca08ed5c94410");
}

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x0
// Checksum 0x77301edc, Offset: 0x4b0
// Size: 0x16
function reset() {
    self.bot.var_857c5ea8 = 0;
}

// Namespace bot_stance/bot_stance
// Params 1, eflags: 0x0
// Checksum 0x93236b1a, Offset: 0x4d0
// Size: 0x92
function update(tacbundle) {
    if (self.bot.var_857c5ea8 > gettime()) {
        return;
    }
    /#
        self bot::record_text("<dev string:x38>", (1, 1, 0), "<dev string:x4c>");
    #/
    self function_7beea81f(tacbundle);
    self.bot.var_857c5ea8 = bot::function_7aeb27f1(0.4, 1);
}

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x0
// Checksum 0xaf4f1c92, Offset: 0x570
// Size: 0x86
function handle_path_success() {
    self endon(#"death", #"hash_399ca08ed5c94410");
    level endon(#"game_ended");
    while (isdefined(self.bot)) {
        self waittill(#"bot_path_success");
        if (!isbot(self)) {
            return;
        }
        self.bot.var_857c5ea8 = 0;
    }
}

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x0
// Checksum 0x2240f145, Offset: 0x600
// Size: 0x86
function handle_goal_reached() {
    self endon(#"death", #"hash_399ca08ed5c94410");
    level endon(#"game_ended");
    while (isdefined(self.bot)) {
        self waittill(#"bot_goal_reached");
        if (!isbot(self)) {
            return;
        }
        self.bot.var_857c5ea8 = 0;
    }
}

// Namespace bot_stance/bot_stance
// Params 2, eflags: 0x0
// Checksum 0x32f7c8c8, Offset: 0x690
// Size: 0x2a
function register_handler(name, func) {
    level.var_17a3a139[name] = func;
}

// Namespace bot_stance/bot_stance
// Params 2, eflags: 0x0
// Checksum 0xc9504e68, Offset: 0x6c8
// Size: 0x2a
function register_stance(name, func) {
    level.botstances[name] = func;
}

// Namespace bot_stance/bot_stance
// Params 1, eflags: 0x0
// Checksum 0xfe238835, Offset: 0x700
// Size: 0x1a4
function function_7beea81f(tacbundle) {
    var_f307a84d = tacbundle.stationarystancehandlerlist;
    if (self haspath()) {
        var_f307a84d = tacbundle.movingstancehandlerlist;
    }
    if (!isdefined(var_f307a84d)) {
        /#
            self bot::record_text("<dev string:x5f>", (1, 0, 0), "<dev string:x4c>");
        #/
        return;
    }
    pixbeginevent(#"bot_stance_update");
    aiprofile_beginentry("bot_stance_update");
    handled = 0;
    node = self bot::get_position_node();
    foreach (params in var_f307a84d) {
        if (self function_ab5be907(tacbundle, params, node)) {
            self.bot.var_9bd97adb = params.name;
            handled = 1;
            break;
        }
    }
    pixendevent();
    aiprofile_endentry();
}

// Namespace bot_stance/bot_stance
// Params 3, eflags: 0x0
// Checksum 0x45bafe56, Offset: 0x8b0
// Size: 0x168
function function_ab5be907(tacbundle, params, node) {
    if (!isdefined(params)) {
        return 0;
    }
    func = level.var_17a3a139[params.name];
    if (!isdefined(func)) {
        /#
            self botprinterror("<dev string:x76>" + function_9e72a96(params.name));
        #/
        return 0;
    }
    /#
        self bot::record_text(function_9e72a96(params.name), (1, 1, 1), "<dev string:x4c>");
    #/
    pixbeginevent("bot_stance_handler: " + params.name);
    aiprofile_beginentry("bot_stance_handler: " + params.name);
    handled = self [[ func ]](tacbundle, params, node);
    pixendevent();
    aiprofile_endentry();
    return handled;
}

// Namespace bot_stance/bot_stance
// Params 1, eflags: 0x0
// Checksum 0x13b1b17d, Offset: 0xa20
// Size: 0xbe
function g_stop_player_too_many_weapons_monitor(name) {
    if (!isdefined(name)) {
        return false;
    }
    func = level.botstances[name];
    if (!isdefined(func)) {
        /#
            self botprinterror("<dev string:x98>" + function_9e72a96(name));
        #/
        return false;
    }
    /#
        self bot::record_text("<dev string:xb2>" + function_9e72a96(name), (1, 1, 0), "<dev string:x4c>");
    #/
    self [[ func ]]();
    return true;
}

// Namespace bot_stance/bot_stance
// Params 3, eflags: 0x0
// Checksum 0x1e1f5f2c, Offset: 0xae8
// Size: 0x3a
function handle_default(tacbundle, params, node) {
    return self g_stop_player_too_many_weapons_monitor(params.stance);
}

// Namespace bot_stance/bot_stance
// Params 3, eflags: 0x0
// Checksum 0x1a77624d, Offset: 0xb30
// Size: 0x11a
function function_7857357b(tacbundle, params, node) {
    if (!isdefined(node)) {
        /#
            self bot::record_text("<dev string:xb7>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (!iscrouchcovernode(node)) {
        /#
            self bot::record_text("<dev string:xc7>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (self bot::in_combat() && !self iscovervalid(node)) {
        /#
            self bot::record_text("<dev string:xdf>", (1, 0, 0), "<dev string:x4c>");
        #/
    }
    return self g_stop_player_too_many_weapons_monitor(params.stance);
}

// Namespace bot_stance/bot_stance
// Params 3, eflags: 0x0
// Checksum 0xffc1fac5, Offset: 0xc58
// Size: 0x11a
function function_f1b497ec(tacbundle, params, node) {
    if (!isdefined(node)) {
        /#
            self bot::record_text("<dev string:xb7>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (!isstandcovernode(node)) {
        /#
            self bot::record_text("<dev string:xf2>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (self bot::in_combat() && !self iscovervalid(node)) {
        /#
            self bot::record_text("<dev string:xdf>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    return self g_stop_player_too_many_weapons_monitor(params.stance);
}

// Namespace bot_stance/bot_stance
// Params 3, eflags: 0x0
// Checksum 0xe0351493, Offset: 0xd80
// Size: 0x11a
function function_41d967fe(tacbundle, params, node) {
    if (!isdefined(node)) {
        /#
            self bot::record_text("<dev string:xb7>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (!isfullcovernode(node)) {
        /#
            self bot::record_text("<dev string:x109>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (self bot::in_combat() && !self iscovervalid(node)) {
        /#
            self bot::record_text("<dev string:xdf>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    return self g_stop_player_too_many_weapons_monitor(params.stance);
}

// Namespace bot_stance/bot_stance
// Params 3, eflags: 0x0
// Checksum 0xa5a903ac, Offset: 0xea8
// Size: 0x182
function function_f71302f4(tacbundle, params, node) {
    if (!isdefined(self.enemy)) {
        /#
            self bot::record_text("<dev string:x11f>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (!isdefined(node)) {
        /#
            self bot::record_text("<dev string:xb7>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (!isstandcovernode(node)) {
        /#
            self bot::record_text("<dev string:xf2>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (self bot::in_combat() && !self iscovervalid(node)) {
        /#
            self bot::record_text("<dev string:xdf>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (!self bot::function_e0aceb0c(tacbundle, "bot_recordStance")) {
        return 0;
    }
    return self g_stop_player_too_many_weapons_monitor(params.stance);
}

// Namespace bot_stance/bot_stance
// Params 3, eflags: 0x0
// Checksum 0x398a6ba8, Offset: 0x1038
// Size: 0x162
function function_821cce69(tacbundle, params, node) {
    if (!isdefined(node)) {
        /#
            self bot::record_text("<dev string:xb7>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (!(node.spawnflags & 8)) {
        /#
            self bot::record_text("<dev string:x12c>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (node.spawnflags & 4) {
        /#
            self bot::record_text("<dev string:x147>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (self bot::in_combat() && !self iscovervalid(node)) {
        /#
            self bot::record_text("<dev string:xdf>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    return self g_stop_player_too_many_weapons_monitor(params.stance);
}

// Namespace bot_stance/bot_stance
// Params 3, eflags: 0x0
// Checksum 0x9661fab9, Offset: 0x11a8
// Size: 0xda
function function_5485fc7b(tacbundle, params, node) {
    if (!self ai::has_behavior_attribute("sprint")) {
        /#
            self bot::record_text("<dev string:x15d>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (!self ai::get_behavior_attribute("sprint")) {
        /#
            self bot::record_text("<dev string:x175>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    return self g_stop_player_too_many_weapons_monitor(params.stance);
}

// Namespace bot_stance/bot_stance
// Params 3, eflags: 0x0
// Checksum 0xd7fe67fb, Offset: 0x1290
// Size: 0x212
function function_e4f752b9(tacbundle, params, node) {
    if (self issprinting()) {
        /#
            self bot::record_text("<dev string:x192>", (1, 1, 0), "<dev string:x4c>");
        #/
        return 1;
    }
    if (isdefined(tacbundle.sprintdist)) {
        var_8be65bb9 = self function_f04bd922();
        movepoint = self.goalpos;
        if (isdefined(var_8be65bb9) && isdefined(var_8be65bb9.var_2cfdc66d)) {
            movepoint = var_8be65bb9.var_2cfdc66d;
        } else if (isdefined(self.overridegoalpos)) {
            movepoint = self.overridegoalpos;
        }
        distsq = distance2dsquared(self.origin, movepoint);
        var_ce946146 = tacbundle.sprintdist * tacbundle.sprintdist;
        if (distsq < var_ce946146) {
            /#
                self bot::record_text("<dev string:x1a5>", (1, 0, 0), "<dev string:x4c>");
            #/
            return 0;
        }
    }
    dir = self getnormalizedmovement();
    if (vectordot(dir, (1, 0, 0)) < 0.82) {
        /#
            self bot::record_text("<dev string:x1c2>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    return self g_stop_player_too_many_weapons_monitor(params.stance);
}

// Namespace bot_stance/bot_stance
// Params 3, eflags: 0x0
// Checksum 0x65e04662, Offset: 0x14b0
// Size: 0x31a
function function_d22ff818(tacbundle, params, node) {
    if (!self ai::get_behavior_attribute("slide")) {
        /#
            self bot::record_text("<dev string:x1d9>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (self issliding()) {
        /#
            self bot::record_text("<dev string:x1f5>", (1, 1, 0), "<dev string:x4c>");
        #/
        return 1;
    }
    if (!self issprinting()) {
        /#
            self bot::record_text("<dev string:x206>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (isdefined(tacbundle.var_1f5429aa) && isdefined(tacbundle.var_48aa05a1)) {
        var_8be65bb9 = self function_f04bd922();
        movepoint = self.goalpos;
        if (isdefined(var_8be65bb9) && isdefined(var_8be65bb9.var_2cfdc66d)) {
            movepoint = var_8be65bb9.var_2cfdc66d;
        } else if (isdefined(self.overridegoalpos)) {
            movepoint = self.overridegoalpos;
        }
        distsq = distance2dsquared(self.origin, movepoint);
        var_d6ff7b1b = tacbundle.var_1f5429aa * tacbundle.var_1f5429aa;
        var_e70d67bc = tacbundle.var_48aa05a1 * tacbundle.var_48aa05a1;
        if (distsq < var_d6ff7b1b) {
            /#
                self bot::record_text("<dev string:x1a5>", (1, 0, 0), "<dev string:x4c>");
            #/
            return 0;
        }
        if (distsq > var_e70d67bc) {
            /#
                self bot::record_text("<dev string:x218>", (1, 0, 0), "<dev string:x4c>");
            #/
            return 0;
        }
    }
    dir = self getnormalizedmovement();
    if (vectordot(dir, (1, 0, 0)) < 0.82) {
        /#
            self bot::record_text("<dev string:x1c2>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    return self g_stop_player_too_many_weapons_monitor(params.stance);
}

// Namespace bot_stance/bot_stance
// Params 3, eflags: 0x0
// Checksum 0xc5b30d43, Offset: 0x17d8
// Size: 0x39a
function function_1989cfaf(tacbundle, params, node) {
    if (!self ai::get_behavior_attribute("slide")) {
        /#
            self bot::record_text("<dev string:x1d9>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (self issliding()) {
        /#
            self bot::record_text("<dev string:x1f5>", (1, 1, 0), "<dev string:x4c>");
        #/
        return 1;
    }
    if (!self issprinting()) {
        /#
            self bot::record_text("<dev string:x206>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (!isdefined(node) || !iscovernode(node)) {
        /#
            self bot::record_text("<dev string:x235>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    if (isdefined(self function_f04bd922())) {
        /#
            self bot::record_text("<dev string:x251>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    distsq = distance2dsquared(self.origin, node.origin);
    mindistsq = isdefined(tacbundle.var_1f5429aa) ? tacbundle.var_1f5429aa : 0;
    mindistsq *= mindistsq;
    if (distsq < mindistsq) {
        /#
            self bot::record_text("<dev string:x272>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    maxdistsq = isdefined(tacbundle.var_48aa05a1) ? tacbundle.var_48aa05a1 : 0;
    maxdistsq *= maxdistsq;
    if (distsq > maxdistsq) {
        /#
            self bot::record_text("<dev string:x288>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    mindot = isdefined(tacbundle.var_f58a14bd) ? tacbundle.var_f58a14bd : 0;
    dir = vectornormalize(node.origin - self.origin);
    if (vectordot(dir, anglestoforward(node.angles)) <= mindot) {
        /#
            self bot::record_text("<dev string:x29e>", (1, 0, 0), "<dev string:x4c>");
        #/
        return 0;
    }
    return self g_stop_player_too_many_weapons_monitor(params.stance);
}

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x0
// Checksum 0x7f313680, Offset: 0x1b80
// Size: 0x64
function sprint() {
    self botpressbutton(1);
    self botreleasebutton(9);
    self botreleasebutton(8);
    self botreleasebutton(39);
}

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x0
// Checksum 0x8d004f98, Offset: 0x1bf0
// Size: 0x64
function stand() {
    self botreleasebutton(1);
    self botreleasebutton(9);
    self botreleasebutton(8);
    self botreleasebutton(39);
}

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x0
// Checksum 0x1452a7fc, Offset: 0x1c60
// Size: 0x64
function crouch() {
    self botreleasebutton(1);
    self botpressbutton(9);
    self botreleasebutton(8);
    self botreleasebutton(39);
}

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x0
// Checksum 0xb89449c2, Offset: 0x1cd0
// Size: 0x64
function prone() {
    self botreleasebutton(1);
    self botreleasebutton(9);
    self botpressbutton(8);
    self botreleasebutton(39);
}

// Namespace bot_stance/bot_stance
// Params 0, eflags: 0x0
// Checksum 0x604ffb37, Offset: 0x1d40
// Size: 0x64
function slide() {
    self botreleasebutton(1);
    self botreleasebutton(9);
    self botreleasebutton(8);
    self bottapbutton(39);
}


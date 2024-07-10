#using scripts\core_common\struct.gsc;
#using scripts\core_common\bots\bot_chain.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace bot_util;

// Namespace bot_util/bot_util
// Params 4, eflags: 0x1 linked
// Checksum 0x5c703f81, Offset: 0xb8
// Size: 0x1b2
function function_23cbc6c1(goal, b_force = 0, n_radius, n_height) {
    assert(isbot(self), "<dev string:x38>" + "<dev string:x56>");
    assert(isdefined(goal), "<dev string:x38>" + "<dev string:x77>");
    if (!isbot(self) || !isdefined(goal)) {
        return;
    }
    self ai::set_behavior_attribute("control", "autonomous");
    if (self bot_chain::function_58b429fb()) {
        self bot_chain::function_73d1cfe6();
    }
    if (isdefined(n_radius)) {
        if (isdefined(n_height)) {
            self setgoal(goal, b_force, n_radius, n_height);
        } else {
            self setgoal(goal, b_force, n_radius);
        }
    } else {
        self setgoal(goal, b_force);
    }
    self.bot.var_bd883a25 = goal;
    self.bot.var_4e3a654 = b_force;
}

// Namespace bot_util/bot_util
// Params 0, eflags: 0x1 linked
// Checksum 0x63106721, Offset: 0x278
// Size: 0xd2
function function_33834a13() {
    assert(isbot(self), "<dev string:x9b>" + "<dev string:x56>");
    if (!isbot(self) || !isdefined(self.bot.var_bd883a25)) {
        return;
    }
    self clearforcedgoal();
    self ai::set_behavior_attribute("control", "commander");
    self.bot.var_bd883a25 = undefined;
    self.bot.var_4e3a654 = undefined;
}

// Namespace bot_util/bot_util
// Params 1, eflags: 0x0
// Checksum 0x3e140912, Offset: 0x358
// Size: 0xbc
function function_e449b57(gameobject) {
    assert(isbot(self), "<dev string:xbb>" + "<dev string:x56>");
    assert(isdefined(gameobject), "<dev string:xbb>" + "<dev string:xe0>");
    if (!isbot(self) || !isdefined(gameobject)) {
        return;
    }
    self bot::set_interact(gameobject);
}

// Namespace bot_util/bot_util
// Params 1, eflags: 0x0
// Checksum 0xd3cfd6d4, Offset: 0x420
// Size: 0x2c4
function function_cf70f2fe(startstruct) {
    self endon(#"disconnect");
    level endon(#"game_ended");
    self notify(#"hash_5efbaef0ca9e2136");
    self endon(#"hash_5efbaef0ca9e2136");
    assert(isbot(self), "<dev string:x10a>" + "<dev string:x56>");
    assert(isstruct(startstruct) || isstring(startstruct), "<dev string:x10a>" + "<dev string:x127>");
    if (isstring(startstruct)) {
        assert(isdefined(struct::get(startstruct)), "<dev string:x10a>" + "<dev string:x15d>" + startstruct);
    }
    if (!isbot(self)) {
        return;
    }
    if (!isstruct(startstruct) && !isstring(startstruct)) {
        return;
    } else if (isstring(startstruct) && !isdefined(struct::get(startstruct))) {
        return;
    }
    if (self bot_chain::function_58b429fb()) {
        self bot_chain::function_73d1cfe6();
    }
    self.bot.var_bd883a25 = undefined;
    self.bot.var_4e3a654 = undefined;
    self ai::set_behavior_attribute("control", "autonomous");
    self thread bot_chain::function_cf70f2fe(startstruct);
    while (self bot_chain::function_58b429fb()) {
        self waittill(#"hash_382a628dad5ecbb5");
    }
    if (!isdefined(self.bot.var_bd883a25)) {
        self ai::set_behavior_attribute("control", "commander");
    }
}

// Namespace bot_util/bot_util
// Params 0, eflags: 0x0
// Checksum 0x3d4c01d3, Offset: 0x6f0
// Size: 0x34
function function_f89d0427() {
    if (!self bot_chain::function_58b429fb()) {
        return;
    }
    self bot_chain::function_73d1cfe6();
}

// Namespace bot_util/bot_util
// Params 0, eflags: 0x0
// Checksum 0x9adbb26e, Offset: 0x730
// Size: 0x1c
function function_cae2c3ac() {
    self bot_action::function_ee2eaccc(0);
}

// Namespace bot_util/bot_util
// Params 0, eflags: 0x0
// Checksum 0xb51814f1, Offset: 0x758
// Size: 0x1c
function function_de6c5bcb() {
    self bot_action::function_ee2eaccc(1);
}

// Namespace bot_util/bot_util
// Params 0, eflags: 0x0
// Checksum 0xe076cfbb, Offset: 0x780
// Size: 0x1c
function function_f1f5be0f() {
    self bot_action::function_ee2eaccc(2);
}


#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\systems\shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\colors_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace ai;

// Namespace ai/ai_shared
// Params 1, eflags: 0x0
// Checksum 0x4332bd5e, Offset: 0x2f8
// Size: 0x4a
function set_pacifist(val) {
    assert(issentient(self), "<dev string:x38>");
    self.pacifist = val;
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x3db0a3eb, Offset: 0x350
// Size: 0x3e
function disable_pain() {
    assert(isalive(self), "<dev string:x57>");
    self.allowpain = 0;
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x167e16cb, Offset: 0x398
// Size: 0x42
function enable_pain() {
    assert(isalive(self), "<dev string:x7b>");
    self.allowpain = 1;
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x2384f092, Offset: 0x3e8
// Size: 0x3a
function gun_remove() {
    self shared::placeweaponon(self.weapon, "none");
    self.gun_removed = 1;
}

// Namespace ai/ai_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3b8d4cbf, Offset: 0x430
// Size: 0x2c
function gun_switchto(weapon, whichhand) {
    self shared::placeweaponon(weapon, whichhand);
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5af21ec7, Offset: 0x468
// Size: 0x36
function gun_recall() {
    self shared::placeweaponon(self.primaryweapon, "right");
    self.gun_removed = undefined;
}

// Namespace ai/ai_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x84462ff5, Offset: 0x4a8
// Size: 0xac
function set_behavior_attribute(attribute, value) {
    if (isdefined(level.b_gmodifier_only_humans) && level.b_gmodifier_only_humans || isdefined(level.b_gmodifier_only_robots) && level.b_gmodifier_only_robots) {
        if (has_behavior_attribute(attribute)) {
            setaiattribute(self, attribute, value);
        }
        return;
    }
    setaiattribute(self, attribute, value);
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x2dacfb20, Offset: 0x560
// Size: 0x22
function get_behavior_attribute(attribute) {
    return getaiattribute(self, attribute);
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe8915617, Offset: 0x590
// Size: 0x22
function has_behavior_attribute(attribute) {
    return hasaiattribute(self, attribute);
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x69588695, Offset: 0x5c0
// Size: 0x48
function is_dead_sentient() {
    if (issentient(self) && !isalive(self)) {
        return 1;
    }
    return 0;
}

// Namespace ai/ai_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x2cce341b, Offset: 0x610
// Size: 0x1f8
function waittill_dead(guys, num, timeoutlength) {
    allalive = 1;
    for (i = 0; i < guys.size; i++) {
        if (isalive(guys[i])) {
            continue;
        }
        allalive = 0;
        break;
    }
    assert(allalive, "<dev string:x9e>");
    if (!allalive) {
        newarray = [];
        for (i = 0; i < guys.size; i++) {
            if (isalive(guys[i])) {
                newarray[newarray.size] = guys[i];
            }
        }
        guys = newarray;
    }
    ent = spawnstruct();
    if (isdefined(timeoutlength)) {
        ent endon(#"thread_timed_out");
        ent thread waittill_dead_timeout(timeoutlength);
    }
    ent.count = guys.size;
    if (isdefined(num) && num < ent.count) {
        ent.count = num;
    }
    array::thread_all(guys, &waittill_dead_thread, ent);
    while (ent.count > 0) {
        ent waittill(#"waittill_dead guy died");
    }
}

// Namespace ai/ai_shared
// Params 3, eflags: 0x0
// Checksum 0x30728a53, Offset: 0x810
// Size: 0x178
function waittill_dead_or_dying(guys, num, timeoutlength) {
    newarray = [];
    for (i = 0; i < guys.size; i++) {
        if (isalive(guys[i])) {
            newarray[newarray.size] = guys[i];
        }
    }
    guys = newarray;
    ent = spawnstruct();
    if (isdefined(timeoutlength)) {
        ent endon(#"thread_timed_out");
        ent thread waittill_dead_timeout(timeoutlength);
    }
    ent.count = guys.size;
    if (isdefined(num) && num < ent.count) {
        ent.count = num;
    }
    array::thread_all(guys, &waittill_dead_or_dying_thread, ent);
    while (ent.count > 0) {
        ent waittill(#"waittill_dead_guy_dead_or_dying");
    }
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x942b5254, Offset: 0x990
// Size: 0x48
function private waittill_dead_thread(ent) {
    self waittill(#"death");
    ent.count--;
    ent notify(#"waittill_dead guy died");
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb08f5631, Offset: 0x9e0
// Size: 0x58
function waittill_dead_or_dying_thread(ent) {
    self util::waittill_either("death", "pain_death");
    ent.count--;
    ent notify(#"waittill_dead_guy_dead_or_dying");
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x413a5c28, Offset: 0xa40
// Size: 0x26
function waittill_dead_timeout(timeoutlength) {
    wait timeoutlength;
    self notify(#"thread_timed_out");
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x3973e06d, Offset: 0xa70
// Size: 0x8e
function private wait_for_shoot() {
    self endon(#"stop_shoot_at_target", #"death");
    if (isvehicle(self) || isbot(self)) {
        self waittill(#"weapon_fired");
    } else {
        self waittill(#"shoot");
    }
    self.start_duration_comp = 1;
}

// Namespace ai/ai_shared
// Params 6, eflags: 0x0
// Checksum 0x227037bf, Offset: 0xb08
// Size: 0x3e4
function shoot_at_target(mode, target, tag, duration, sethealth, ignorefirstshotwait) {
    self endon(#"death", #"stop_shoot_at_target");
    assert(isdefined(target), "<dev string:xfb>");
    assert(isdefined(mode), "<dev string:x12c>");
    mode_flag = mode === "normal" || mode === "shoot_until_target_dead" || mode === "kill_within_time";
    assert(mode_flag, "<dev string:x167>");
    if (isdefined(duration)) {
        assert(duration >= 0, "<dev string:x1c2>");
    } else {
        duration = 0;
    }
    if (isdefined(sethealth) && isdefined(target)) {
        target.health = sethealth;
    }
    if (!isdefined(target) || mode === "shoot_until_target_dead" && target.health <= 0) {
        return;
    }
    if (isdefined(tag) && tag != "") {
        self setentitytarget(target, 1, tag);
    } else {
        self setentitytarget(target, 1);
    }
    self.start_duration_comp = 0;
    switch (mode) {
    case #"normal":
        break;
    case #"shoot_until_target_dead":
        duration = -1;
        break;
    case #"kill_within_time":
        target damagemode("next_shot_kills");
        break;
    }
    if (isvehicle(self)) {
        self util::clearallcooldowns();
    }
    if (ignorefirstshotwait === 1) {
        self.start_duration_comp = 1;
    } else {
        self thread wait_for_shoot();
    }
    if (isdefined(duration) && isdefined(target) && target.health > 0) {
        if (duration >= 0) {
            elapsed = 0;
            while (isdefined(target) && target.health > 0 && elapsed <= duration) {
                elapsed += 0.05;
                if (!(isdefined(self.start_duration_comp) && self.start_duration_comp)) {
                    elapsed = 0;
                }
                waitframe(1);
            }
            if (isdefined(target) && mode == "kill_within_time") {
                self.perfectaim = 1;
                self.aim_set_by_shoot_at_target = 1;
                target waittill(#"death");
            }
        } else if (duration == -1) {
            target waittill(#"death");
        }
    }
    stop_shoot_at_target();
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x8eb3dcdb, Offset: 0xef8
// Size: 0x5e
function stop_shoot_at_target() {
    self clearentitytarget();
    if (isdefined(self.aim_set_by_shoot_at_target) && self.aim_set_by_shoot_at_target) {
        self.perfectaim = 0;
        self.aim_set_by_shoot_at_target = 0;
    }
    self notify(#"stop_shoot_at_target");
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x0
// Checksum 0x97c39a68, Offset: 0xf60
// Size: 0x2c
function wait_until_done_speaking() {
    self endon(#"death");
    while (self.isspeaking) {
        waitframe(1);
    }
}

// Namespace ai/ai_shared
// Params 3, eflags: 0x0
// Checksum 0xacd6e858, Offset: 0xf98
// Size: 0x120
function set_goal(value, key = "targetname", b_force = 0) {
    goal = getnode(value, key);
    if (isdefined(goal)) {
        self setgoal(goal, b_force);
    } else {
        goal = getent(value, key);
        if (isdefined(goal)) {
            self setgoal(goal, b_force);
        } else {
            goal = struct::get(value, key);
            if (isdefined(goal)) {
                self setgoal(goal.origin, b_force);
            }
        }
    }
    return goal;
}

// Namespace ai/ai_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xb2dd8a3f, Offset: 0x10c0
// Size: 0xcc
function force_goal(goto, b_shoot = 1, str_end_on, b_keep_colors = 0, b_should_sprint = 0) {
    self endon(#"death");
    s_tracker = spawnstruct();
    self thread _force_goal(s_tracker, goto, b_shoot, str_end_on, b_keep_colors, b_should_sprint);
    s_tracker waittill(#"done");
}

// Namespace ai/ai_shared
// Params 6, eflags: 0x1 linked
// Checksum 0xe2045a01, Offset: 0x1198
// Size: 0x4a0
function _force_goal(s_tracker, goto, b_shoot = 1, str_end_on, b_keep_colors = 0, b_should_sprint = 0) {
    self endon(#"death");
    self notify(#"new_force_goal");
    flagsys::wait_till_clear("force_goal");
    flagsys::set(#"force_goal");
    color_enabled = 0;
    if (!b_keep_colors) {
        if (isdefined(colors::get_force_color())) {
            color_enabled = 1;
            self colors::disable();
        }
    }
    allowpain = self.allowpain;
    ignoresuppression = self.ignoresuppression;
    grenadeawareness = self.grenadeawareness;
    if (!b_shoot) {
        self val::set(#"ai_forcegoal", "ignoreall", 1);
    } else if (self has_behavior_attribute("move_mode")) {
        var_a5151bf = self get_behavior_attribute("move_mode");
        self set_behavior_attribute("move_mode", "rambo");
    }
    if (b_should_sprint && self has_behavior_attribute("sprint")) {
        self set_behavior_attribute("sprint", 1);
    }
    self.ignoresuppression = 1;
    self.grenadeawareness = 0;
    self val::set(#"ai_forcegoal", "ignoreme", 1);
    self disable_pain();
    if (!isplayer(self)) {
        self pushplayer(1);
    }
    if (isdefined(goto)) {
        self setgoal(goto, 1);
    }
    self waittill(#"goal", #"new_force_goal", str_end_on);
    if (color_enabled) {
        colors::enable();
    }
    if (!isplayer(self)) {
        self pushplayer(0);
    }
    self clearforcedgoal();
    self val::reset(#"ai_forcegoal", "ignoreme");
    self val::reset(#"ai_forcegoal", "ignoreall");
    if (isdefined(allowpain) && allowpain) {
        self enable_pain();
    }
    if (self has_behavior_attribute("sprint")) {
        self set_behavior_attribute("sprint", 0);
    }
    if (isdefined(var_a5151bf)) {
        self set_behavior_attribute("move_mode", var_a5151bf);
    }
    self.ignoresuppression = ignoresuppression;
    self.grenadeawareness = grenadeawareness;
    flagsys::clear(#"force_goal");
    s_tracker notify(#"done");
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x0
// Checksum 0x72e6f44a, Offset: 0x1640
// Size: 0x16
function stoppainwaitinterval() {
    self notify(#"painwaitintervalremove");
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x5 linked
// Checksum 0xc9ef83ad, Offset: 0x1660
// Size: 0x46
function private _allowpainrestore() {
    self endon(#"death");
    self waittill(#"painwaitintervalremove", #"painwaitinterval");
    self.allowpain = 1;
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x0
// Checksum 0x6e1a3a4c, Offset: 0x16b0
// Size: 0xf6
function painwaitinterval(msec) {
    self endon(#"death");
    self notify(#"painwaitinterval");
    self endon(#"painwaitinterval", #"painwaitintervalremove");
    self thread _allowpainrestore();
    if (!isdefined(msec) || msec < 20) {
        msec = 20;
    }
    while (isalive(self)) {
        self waittill(#"pain");
        self.allowpain = 0;
        wait float(msec) / 1000;
        self.allowpain = 1;
    }
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x0
// Checksum 0xd0d28e47, Offset: 0x17b0
// Size: 0x598
function patrol(start_path_node) {
    self endon(#"death", #"stop_patrolling");
    assert(isdefined(start_path_node), self.targetname + "<dev string:x1f3>");
    if (start_path_node.type === #"bad node") {
        /#
            errormsg = "<dev string:x24f>" + start_path_node.targetname + "<dev string:x266>" + int(start_path_node.origin[0]) + "<dev string:x26c>" + int(start_path_node.origin[1]) + "<dev string:x26c>" + int(start_path_node.origin[2]) + "<dev string:x270>";
            iprintln(errormsg);
        #/
        return;
    }
    assert(start_path_node.type === #"path" || isdefined(start_path_node.scriptbundlename), "<dev string:x282>" + start_path_node.targetname + "<dev string:x299>");
    self notify(#"go_to_spawner_target");
    self.target = undefined;
    self.old_goal_radius = self.goalradius;
    self.goalradius = 16;
    self thread end_patrol_on_enemy_targetting();
    self.currentgoal = start_path_node;
    self.patroller = 1;
    while (true) {
        if (isdefined(self.currentgoal.type) && self.currentgoal.type == "Path") {
            if (self has_behavior_attribute("patrol")) {
                self set_behavior_attribute("patrol", 1);
            }
            self setgoal(self.currentgoal, 1);
            self waittill(#"goal");
            if (isdefined(self.currentgoal.script_notify)) {
                self notify(self.currentgoal.script_notify);
                level notify(self.currentgoal.script_notify);
            }
            if (isdefined(self.currentgoal.script_flag_set)) {
                flag = self.currentgoal.script_flag_set;
                if (!isdefined(level.flag[flag])) {
                    level flag::init(flag);
                }
                level flag::set(flag);
            }
            if (isdefined(self.currentgoal.script_flag_wait)) {
                flag = self.currentgoal.script_flag_wait;
                assert(isdefined(level.flag[flag]), "<dev string:x2d9>" + flag);
                level flag::wait_till(flag);
            }
            if (!isdefined(self.currentgoal.script_wait_min)) {
                self.currentgoal.script_wait_min = 0;
            }
            if (!isdefined(self.currentgoal.script_wait_max)) {
                self.currentgoal.script_wait_max = 0;
            }
            assert(self.currentgoal.script_wait_min <= self.currentgoal.script_wait_max, "<dev string:x310>" + self.currentgoal.targetname);
            if (!isdefined(self.currentgoal.scriptbundlename)) {
                wait_variability = self.currentgoal.script_wait_max - self.currentgoal.script_wait_min;
                wait_time = self.currentgoal.script_wait_min + randomfloat(wait_variability);
                self notify(#"patrol_goal", {#node:self.currentgoal});
                wait wait_time;
            } else {
                self scene::play(self.currentgoal.scriptbundlename, self);
            }
        } else if (isdefined(self.currentgoal.scriptbundlename)) {
            self.currentgoal scene::play(self.currentgoal.scriptbundlename, self);
        }
        self patrol_next_node();
    }
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x20df654, Offset: 0x1d50
// Size: 0x10a
function patrol_next_node() {
    target_nodes = [];
    target_scenes = [];
    if (isdefined(self.currentgoal.target)) {
        target_nodes = getnodearray(self.currentgoal.target, "targetname");
        target_scenes = struct::get_array(self.currentgoal.target, "targetname");
    }
    if (target_nodes.size == 0 && target_scenes.size == 0) {
        self end_and_clean_patrol_behaviors();
        return;
    }
    if (target_nodes.size != 0) {
        self.currentgoal = array::random(target_nodes);
        return;
    }
    self.currentgoal = array::random(target_scenes);
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xdfdc3ed1, Offset: 0x1e68
// Size: 0x68
function end_patrol_on_enemy_targetting() {
    self endon(#"death", #"alerted");
    while (true) {
        if (isdefined(self.should_stop_patrolling) && self.should_stop_patrolling) {
            self end_and_clean_patrol_behaviors();
        }
        wait 0.1;
    }
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x9abf254f, Offset: 0x1ed8
// Size: 0xd6
function end_and_clean_patrol_behaviors() {
    if (isdefined(self.currentgoal) && isdefined(self.currentgoal.scriptbundlename)) {
        self stopanimscripted();
    }
    if (self has_behavior_attribute("patrol")) {
        self set_behavior_attribute("patrol", 0);
    }
    if (isdefined(self.old_goal_radius)) {
        self.goalradius = self.old_goal_radius;
    }
    self clearforcedgoal();
    self notify(#"stop_patrolling");
    self.patroller = undefined;
    self notify(#"alerted");
}

// Namespace ai/ai_shared
// Params 2, eflags: 0x0
// Checksum 0x16151b6d, Offset: 0x1fb8
// Size: 0x2bc
function bloody_death(n_delay, hit_loc) {
    self endon(#"death");
    if (!isdefined(self)) {
        return;
    }
    assert(isactor(self));
    assert(isalive(self));
    if (isdefined(self.__bloody_death) && self.__bloody_death) {
        return;
    }
    self.__bloody_death = 1;
    if (isdefined(n_delay)) {
        wait n_delay;
    }
    if (!isdefined(self) || !isalive(self)) {
        return;
    }
    if (isdefined(hit_loc)) {
        assert(isinarray(array("<dev string:x340>", "<dev string:x349>", "<dev string:x350>", "<dev string:x357>", "<dev string:x365>", "<dev string:x371>", "<dev string:x37f>", "<dev string:x391>", "<dev string:x3a2>", "<dev string:x3b4>", "<dev string:x3c5>", "<dev string:x3d2>", "<dev string:x3de>", "<dev string:x3f0>", "<dev string:x401>", "<dev string:x413>", "<dev string:x424>", "<dev string:x431>", "<dev string:x43d>", "<dev string:x443>"), hit_loc), "<dev string:x450>");
    } else {
        hit_loc = array::random(array("helmet", "head", "neck", "torso_upper", "torso_mid", "torso_lower", "right_arm_upper", "left_arm_upper", "right_arm_lower", "left_arm_lower", "right_hand", "left_hand", "right_leg_upper", "left_leg_upper", "right_leg_lower", "left_leg_lower", "right_foot", "left_foot", "gun", "riotshield"));
    }
    self dodamage(self.health + 100, self.origin, undefined, undefined, hit_loc);
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1a2b21e0, Offset: 0x2280
// Size: 0x52
function shouldregisterclientfieldforarchetype(archetype) {
    if (isdefined(level.clientfieldaicheck) && level.clientfieldaicheck && !isarchetypeloaded(archetype)) {
        return false;
    }
    return true;
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x23548fd5, Offset: 0x22e0
// Size: 0xcc
function set_protect_ent(entity) {
    if (!isdefined(entity.protect_tactical_influencer) && sessionmodeiscampaigngame()) {
        teammask = util::getteammask(self.team);
        entity.protect_tactical_influencer = createtacticalinfluencer("protect_entity_influencer_def", entity, teammask);
    }
    self.protectent = entity;
    if (isactor(self)) {
        self setblackboardattribute("_defend", "defend_enabled");
    }
}

// Namespace ai/ai_shared
// Params 2, eflags: 0x0
// Checksum 0xd1954c28, Offset: 0x23b8
// Size: 0x10c
function set_group_protect_ent(e_ent_to_protect, defend_volume_name_or_ent) {
    a_defenders = self;
    if (!isdefined(a_defenders)) {
        a_defenders = [];
    } else if (!isarray(a_defenders)) {
        a_defenders = array(a_defenders);
    }
    if (isstring(defend_volume_name_or_ent)) {
        vol_defend = getent(defend_volume_name_or_ent, "targetname");
    } else if (isentity(defend_volume_name_or_ent)) {
        vol_defend = defend_volume_name_or_ent;
    }
    array::run_all(a_defenders, &setgoal, vol_defend, 1);
    array::thread_all(a_defenders, &set_protect_ent, e_ent_to_protect);
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x0
// Checksum 0x8f0a619f, Offset: 0x24d0
// Size: 0x4c
function remove_protect_ent() {
    self.protectent = undefined;
    if (isactor(self)) {
        self setblackboardattribute("_defend", "defend_disabled");
    }
}

// Namespace ai/ai_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x641da8bc, Offset: 0x2528
// Size: 0x9a
function t_cylinder(origin, radius, halfheight) {
    struct = spawnstruct();
    struct.type = 1;
    struct.origin = origin;
    struct.radius = float(radius);
    struct.halfheight = float(halfheight);
    return struct;
}

// Namespace ai/ai_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x5cdba6b9, Offset: 0x25d0
// Size: 0xf2
function function_470c0597(center, halfsize, angles) {
    assert(isvec(center));
    assert(isvec(halfsize));
    assert(isvec(angles));
    struct = spawnstruct();
    struct.type = 2;
    struct.center = center;
    struct.halfsize = halfsize;
    struct.angles = angles;
    return struct;
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x0
// Checksum 0xb08ec032, Offset: 0x26d0
// Size: 0x19c
function function_c2ee22a3(active) {
    self endon(#"death");
    if (active === 1) {
        self clearenemy();
        self.var_62376916 = 1;
        if (self has_behavior_attribute("patrol")) {
            self set_behavior_attribute("patrol", 1);
        }
        fov = 0.7;
        var_672a1bab = 1000000;
        self function_aa4579e2(fov, var_672a1bab);
        while (isdefined(self) && self.var_62376916 === 1 && !isdefined(self.enemy)) {
            wait 0.25;
        }
    }
    self.var_62376916 = 0;
    if (self has_behavior_attribute("patrol")) {
        self set_behavior_attribute("patrol", 0);
    }
    fov = 0;
    var_672a1bab = 64000000;
    if (isdefined(self.sightdistance)) {
        var_672a1bab = self.sightdistance * self.sightdistance;
    }
    self function_aa4579e2(0, 64000000);
}

// Namespace ai/ai_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x5370a5cd, Offset: 0x2878
// Size: 0x2e
function function_aa4579e2(fovcosine, maxsightdistsqrd) {
    self.fovcosine = fovcosine;
    self.maxsightdistsqrd = maxsightdistsqrd;
}

// Namespace ai/ai_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xf0da50e8, Offset: 0x28b0
// Size: 0x270
function function_1628d95b(cansee = 0, var_9a21f98d = 1, overrideorigin = self.origin) {
    var_56203bf4 = function_4d8c71ce(util::get_enemy_team(self.team), #"team3");
    nearesttarget = undefined;
    var_46e1d165 = undefined;
    foreach (target in var_56203bf4) {
        if (!isalive(target) || isdefined(target.var_becd4d91) && target.var_becd4d91 || target function_41b04632()) {
            continue;
        }
        if (cansee && var_9a21f98d) {
            if (!self cansee(target)) {
                continue;
            }
        } else if (cansee && !var_9a21f98d) {
            targetpoint = isdefined(target.var_88f8feeb) ? target.var_88f8feeb : target getcentroid();
            if (!sighttracepassed(self geteye(), targetpoint, 0, target)) {
                continue;
            }
        }
        distsq = distancesquared(overrideorigin, target.origin);
        if (!isdefined(nearesttarget) || distsq < var_46e1d165) {
            nearesttarget = target;
            var_46e1d165 = distsq;
        }
    }
    return nearesttarget;
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf4c0a12e, Offset: 0x2b28
// Size: 0x32
function function_31a31a25(var_9a21f98d = 1) {
    return function_1628d95b(1, var_9a21f98d);
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x501dba3f, Offset: 0x2b68
// Size: 0x48
function function_41b04632() {
    return isdefined(self.targetname) && self.targetname == "destructible" && !isdefined(getent(self.target, "targetname"));
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x4ce51463, Offset: 0x2bb8
// Size: 0x110
function function_63734291(enemy) {
    if (!isdefined(enemy)) {
        return false;
    }
    var_aba9ee4c = 1;
    if (isdefined(self.var_ffa507cd)) {
        var_e1ea86de = self.var_ffa507cd;
        if (var_e1ea86de < randomfloat(1)) {
            var_aba9ee4c = 0;
        }
    }
    if (var_aba9ee4c && isvehicle(enemy) && !(isdefined(enemy.var_c95dcb15) && enemy.var_c95dcb15)) {
        dist_squared = distancesquared(self.origin, enemy.origin);
        if (dist_squared >= 562500) {
            enemy notify(#"hash_4853a85e5ddc4a47");
            return true;
        }
    }
    return false;
}

// Namespace ai/ai_shared
// Params 1, eflags: 0x0
// Checksum 0x67c7fda9, Offset: 0x2cd0
// Size: 0xd6
function stun(duration = self.var_95d94ac4) {
    if (!isdefined(duration) || !(isdefined(self.var_28aab32a) && self.var_28aab32a) || isdefined(self.var_c2986b66) && self.var_c2986b66 || isdefined(self.var_b736fc8b) && self.var_b736fc8b) {
        return;
    }
    end_time = gettime() + int(duration * 1000);
    if (isdefined(self.var_3d461e6f) && self.var_3d461e6f > end_time) {
        return;
    }
    self.var_3d461e6f = end_time;
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x0
// Checksum 0x69b5623a, Offset: 0x2db0
// Size: 0x1e
function is_stunned() {
    return isdefined(self.var_3d461e6f) && gettime() < self.var_3d461e6f;
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x0
// Checksum 0x7a8993c3, Offset: 0x2dd8
// Size: 0xe
function clear_stun() {
    self.var_3d461e6f = undefined;
}

// Namespace ai/ai_shared
// Params 0, eflags: 0x0
// Checksum 0x431d9df1, Offset: 0x2df0
// Size: 0x144
function function_9139c839() {
    if (!isdefined(self.var_76167463)) {
        if (isdefined(self.aisettingsbundle)) {
            settingsbundle = self.aisettingsbundle;
        } else if (isspawner(self) && isdefined(self.aitype)) {
            settingsbundle = function_edf479a3(self.aitype);
        } else if (isvehicle(self) && isdefined(self.scriptbundlesettings)) {
            settingsbundle = getscriptbundle(self.scriptbundlesettings).aisettingsbundle;
        }
        if (!isdefined(settingsbundle)) {
            return undefined;
        }
        self.var_76167463 = settingsbundle;
        if (!isdefined(level.var_e3a467cf)) {
            level.var_e3a467cf = [];
        }
        if (!isdefined(level.var_e3a467cf[self.var_76167463])) {
            level.var_e3a467cf[self.var_76167463] = getscriptbundle(self.var_76167463);
        }
    }
    return level.var_e3a467cf[self.var_76167463];
}

// Namespace ai/ai_shared
// Params 2, eflags: 0x0
// Checksum 0x2be5a6af, Offset: 0x2f40
// Size: 0x9e
function function_71919555(var_45302432, fieldname) {
    if (!isdefined(level.var_e3a467cf)) {
        level.var_e3a467cf = [];
    }
    if (!isdefined(level.var_e3a467cf[var_45302432])) {
        level.var_e3a467cf[var_45302432] = getscriptbundle(var_45302432);
    }
    if (isdefined(level.var_e3a467cf[var_45302432])) {
        return level.var_e3a467cf[var_45302432].(fieldname);
    }
    return undefined;
}


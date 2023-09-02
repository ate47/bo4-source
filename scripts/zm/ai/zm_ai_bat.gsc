// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\blackboard_vehicle.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\statemachine_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace bat;

// Namespace bat
// Method(s) 2 Total 2
class class_726d8173 {

    // Namespace class_726d8173/zm_ai_bat
    // Params 0, eflags: 0x9 linked
    // Checksum 0x45eeffaf, Offset: 0xf10
    // Size: 0x26
    __constructor() {
        self.origin = undefined;
        self.mover = undefined;
        self.healthmultiplier = undefined;
    }

    // Namespace class_726d8173/zm_ai_bat
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0xf40
    // Size: 0x4
    __destructor() {
        
    }

}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x2
// Checksum 0xee82e95d, Offset: 0x278
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"bat", &__init__, undefined, undefined);
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0x7209ed3f, Offset: 0x2c0
// Size: 0x1a4
function __init__() {
    vehicle::add_main_callback("bat", &function_6c223039);
    spawner::function_89a2cd87(#"bat", &function_141c342b);
    zm_transform::function_cfca77a7(#"spawner_zm_nosferatu", #"hash_791d597ac0457860", undefined, 0, undefined, undefined);
    level thread function_1b029905();
    zm_round_spawning::register_archetype(#"bat", &function_84cd2223, &function_9471b7f9, &function_2e37549f, 25);
    zm_score::function_e5d6e6dd(#"bat", 60);
    clientfield::register("vehicle", "bat_transform_fx", 8000, 1, "int");
    level.bat_spawners = getentarray("zombie_bat_spawner", "script_noteworthy");
    /#
        zm_devgui::function_c7dd7a17("<unknown string>");
    #/
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0xbad5b947, Offset: 0x470
// Size: 0x26c
function function_6c223039() {
    self useanimtree("generic");
    initblackboard();
    self.b_ignore_cleanup = 1;
    self.var_5dd07a80 = 1;
    self.var_232915af = 1;
    self.var_68139d12 = 1;
    self.nodamagefeedback = 1;
    self vehicle::friendly_fire_shield();
    self enableaimassist();
    self setneargoalnotifydist(25);
    self setdrawinfrared(1);
    self.fovcosine = 0;
    self.fovcosinebusy = 0;
    self.vehaircraftcollisionenabled = 1;
    /#
        assert(isdefined(self.scriptbundlesettings));
    #/
    self.settings = struct::get_script_bundle("vehiclecustomsettings", self.scriptbundlesettings);
    self.goalradius = 999999;
    self.goalheight = 512;
    self.var_ec0d66ce = 0.5 * (self.settings.engagementdistmin + self.settings.engagementdistmax);
    self.var_ff6d7c88 = self.var_ec0d66ce * self.var_ec0d66ce;
    self thread vehicle_ai::nudge_collision();
    var_134ac8f9 = int(zm_ai_utility::function_8d44707e(0));
    var_134ac8f9 = var_134ac8f9 * (isdefined(level.var_570d178a) ? level.var_570d178a : 1);
    self.health = int(var_134ac8f9);
    self.maxhealth = int(var_134ac8f9);
    defaultrole();
    target_set(self);
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0x927e09a5, Offset: 0x6e8
// Size: 0xbc
function function_141c342b() {
    var_134ac8f9 = int(zm_ai_utility::function_8d44707e(0));
    var_134ac8f9 = var_134ac8f9 * (isdefined(level.var_570d178a) ? level.var_570d178a : 1);
    self.health = int(var_134ac8f9);
    self.maxhealth = int(var_134ac8f9);
    self disableaimassist();
    self zm_score::function_82732ced();
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0xdf98b135, Offset: 0x7b0
// Size: 0x8e
function function_ab7568e0() {
    self endon(#"change_state", #"death");
    while (1) {
        if (self function_c48c2d66() && self vehicle_ai::get_current_state() != "transform") {
            self thread vehicle_ai::set_state("transform");
        }
        waitframe(1);
    }
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x5 linked
// Checksum 0xd3035048, Offset: 0x848
// Size: 0xc8
function private istargetvalid(target) {
    if (!isdefined(target) || !isalive(target)) {
        return 0;
    }
    if (isplayer(target) && (target.sessionstate == "spectator" || target.sessionstate == "intermission")) {
        return 0;
    }
    if (isdefined(target.ignoreme) && target.ignoreme || target isnotarget()) {
        return 0;
    }
    return 1;
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x5 linked
// Checksum 0xb89f49de, Offset: 0x918
// Size: 0x10c
function private gettarget() {
    targets = getplayers();
    leasthunted = targets[0];
    for (i = 0; i < targets.size; i++) {
        if (!isdefined(targets[i].hunted_by)) {
            targets[i].hunted_by = 0;
        }
        if (!istargetvalid(targets[i])) {
            continue;
        }
        if (!istargetvalid(leasthunted) || targets[i].hunted_by < leasthunted.hunted_by) {
            leasthunted = targets[i];
        }
    }
    if (istargetvalid(leasthunted)) {
        return leasthunted;
    }
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x5 linked
// Checksum 0xe5f1119e, Offset: 0xa30
// Size: 0x120
function private function_1076a2e0() {
    self endon(#"change_state", #"death");
    while (1) {
        if (isdefined(self.ignoreall) && self.ignoreall) {
            wait(0.5);
            continue;
        }
        if (istargetvalid(self.var_c4e19d3)) {
            wait(0.5);
            continue;
        }
        target = gettarget();
        if (!isdefined(target)) {
            self.var_c4e19d3 = undefined;
        } else {
            self.var_c4e19d3 = target;
            self.var_c4e19d3.hunted_by = self.var_c4e19d3.hunted_by + 1;
            self vehlookat(self.var_c4e19d3);
            self turretsettarget(0, self.var_c4e19d3);
        }
        wait(0.5);
    }
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x4
// Checksum 0x48e2cf49, Offset: 0xb58
// Size: 0x1e8
function private function_776e45e5() {
    self endon(#"change_state", #"death");
    self waittilltimeout(10, #"reached_end_node");
    while (1) {
        players = getplayers();
        var_3ada9d08 = 0;
        foreach (player in players) {
            if (self seerecently(player, 30)) {
                var_3ada9d08 = 1;
                break;
            }
        }
        if (gettime() - self.spawn_time > 10000 && !var_3ada9d08 && !(isdefined(self.var_894194a9) && self.var_894194a9)) {
            self.var_d880e556 = 1;
            if (!level flag::get("special_round")) {
                ai = function_2e37549f(1);
                while (!isdefined(ai)) {
                    waitframe(1);
                    ai = function_2e37549f(1);
                }
                ai.health = self.health;
            }
            self zm_cleanup::cleanup_zombie();
            return;
        }
        wait(1);
    }
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x5 linked
// Checksum 0x3084b4ae, Offset: 0xd48
// Size: 0x4c
function private initblackboard() {
    blackboard::createblackboardforentity(self);
    self blackboard::registervehicleblackboardattributes();
    ai::createinterfaceforentity(self);
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0xbede9c32, Offset: 0xda0
// Size: 0x134
function defaultrole() {
    statemachine = self vehicle_ai::init_state_machine_for_role("default");
    self vehicle_ai::get_state_callbacks("combat").enter_func = &state_combat_enter;
    self vehicle_ai::get_state_callbacks("combat").update_func = &state_combat_update;
    self vehicle_ai::get_state_callbacks("death").update_func = &state_death_update;
    statemachine statemachine::add_state("transform", &function_9071e5a9, &function_47c795bc, &function_db99ddec);
    self vehicle_ai::call_custom_add_state_callbacks();
    vehicle_ai::startinitialstate("combat");
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x0
// Checksum 0x80508c2a, Offset: 0xee0
// Size: 0x22
function function_9122b0e5() {
    return self ai::get_behavior_attribute("firing_rate");
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x1 linked
// Checksum 0x541c5390, Offset: 0xfe0
// Size: 0x2c4
function function_607df9c6(ai) {
    if (isdefined(level.var_45827161) && isdefined(level.var_45827161[level.round_number])) {
        ai.var_ba75c6dc = 1;
    }
    if (isdefined(ai.var_e21c1964) && ai.var_e21c1964) {
        return;
    }
    actors = getentitiesinradius(ai.origin, 80, 15);
    foreach (actor in actors) {
        if (actor.team !== level.zombie_team || actor.archetype !== #"zombie") {
            continue;
        }
        actor zombie_utility::setup_zombie_knockdown(ai);
    }
    ai.var_e21c1964 = 1;
    var_cd1cfeed = ai animmappingsearch(#"hash_605e435c80f0d33b");
    pos = physicstrace(ai.origin, ai.origin + vectorscale((0, 0, -1), 10000), vectorscale((-1, -1, -1), 2), vectorscale((1, 1, 1), 2), ai, 1);
    pos = pos[#"position"];
    if (isdefined(level.var_84b2907f)) {
        level thread [[ level.var_84b2907f ]](ai);
    }
    if (isdefined(var_cd1cfeed)) {
        if (isdefined(pos)) {
            ai animation::play(var_cd1cfeed, pos, ai.angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
        } else {
            ai animation::play(var_cd1cfeed, ai.origin, ai.angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
        }
    }
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x5 linked
// Checksum 0x1fdcf8d2, Offset: 0x12b0
// Size: 0xd4
function private function_1b029905() {
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"transformation_complete");
        if (waitresult.id === #"hash_791d597ac0457860" && isdefined(waitresult.data)) {
            newai = waitresult.var_944250d2[0];
            newai.maxhealth = newai.maxhealth * waitresult.data.healthmultiplier;
            newai.health = newai.maxhealth;
        }
        wait(0.1);
    }
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0x31212ad8, Offset: 0x1390
// Size: 0x2ae
function function_1fff2d() {
    pos = physicstrace(self.origin, self.origin + vectorscale((0, 0, -1), 10000), vectorscale((-1, -1, -1), 2), vectorscale((1, 1, 1), 2), self, 1);
    if (isdefined(pos) && isdefined(pos[#"position"]) && !isdefined(pos[#"entity"])) {
        pos = pos[#"position"];
        /#
            recordline(self.origin, pos, (0, 1, 1), "<unknown string>");
            recordsphere(pos, 8, (0, 1, 1), "<unknown string>");
        #/
        posonnavmesh = getclosestpointonnavmesh(pos, 256, 30);
        if (isdefined(posonnavmesh)) {
            pos = physicstrace(posonnavmesh + vectorscale((0, 0, 1), 70), posonnavmesh + vectorscale((0, 0, -1), 70), vectorscale((-1, -1, -1), 2), vectorscale((1, 1, 1), 2), self, 1);
            pos = pos[#"position"];
            /#
                recordline(pos, posonnavmesh, (0, 0, 1), "<unknown string>");
                recordsphere(posonnavmesh, 8, (0, 0, 1), "<unknown string>");
            #/
            if (isdefined(pos)) {
                scriptmodel = util::spawn_model("tag_origin", self.origin, self.angles);
                if (isdefined(scriptmodel)) {
                    self.ai.var_15916e52 = new class_726d8173();
                    self.ai.var_15916e52.pos = pos;
                    self.ai.var_15916e52.mover = scriptmodel;
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0x1a402b88, Offset: 0x1648
// Size: 0xd4
function function_c48c2d66() {
    if (isdefined(self.var_d880e556) && self.var_d880e556) {
        return 0;
    }
    if (zm_transform::function_abf1dcb4(#"hash_791d597ac0457860")) {
        return 0;
    }
    if (!isdefined(self.spawn_time)) {
        return 0;
    }
    if (gettime() - self.spawn_time < 3500) {
        return 0;
    }
    if (self isplayinganimscripted()) {
        return 0;
    }
    if (function_1fff2d()) {
        /#
            assert(isdefined(self.ai.var_15916e52));
        #/
        return 1;
    }
    return 0;
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x1 linked
// Checksum 0x23043e2f, Offset: 0x1728
// Size: 0x22
function function_9071e5a9(params) {
    self.takedamage = 0;
    self.var_894194a9 = 1;
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x1 linked
// Checksum 0xd97c57b5, Offset: 0x1758
// Size: 0x92
function function_630752f6(notifyhash) {
    if (isdefined(self) && isdefined(self.ai) && isdefined(self.ai.var_15916e52) && isdefined(self.ai.var_15916e52.mover)) {
        self.ai.var_15916e52.mover delete();
        self.ai.var_15916e52 = undefined;
    }
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x5 linked
// Checksum 0xffb23779, Offset: 0x17f8
// Size: 0x34
function private function_88d81715() {
    self endon(#"death");
    wait(1.5);
    self ghost();
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x1 linked
// Checksum 0xd0778b10, Offset: 0x1838
// Size: 0x374
function function_47c795bc(params) {
    self endoncallback(&function_630752f6, #"death", #"state_change");
    /#
        assert(isdefined(self.ai.var_15916e52));
    #/
    self.ai.var_15916e52.healthmultiplier = self.var_b008e588;
    movepos = self.ai.var_15916e52.pos;
    mover = self.ai.var_15916e52.mover;
    tagorigin = self.origin;
    var_4edd9b4 = self gettagorigin("j_spine4");
    offset = var_4edd9b4 - tagorigin;
    timescale = 0.4;
    movetime = getanimlength(self animmappingsearch(#"par_transform")) * timescale;
    mover enablelinkto();
    self linkto(mover, "tag_origin", offset, (0, 0, 0));
    self asmrequestsubstate(#"hash_4bea3500eb31dd8b");
    self thread function_88d81715();
    acceleration = 0.3;
    mover moveto(self.origin + vectorscale((0, 0, 1), 30), 0.6, acceleration);
    mover waittill(#"movedone");
    waittime = 0.1;
    wait(waittime);
    acceleration = 0.6;
    mover moveto(movepos, movetime, acceleration);
    mover waittill(#"movedone");
    self clientfield::set("bat_transform_fx", 1);
    self.overridevehicledamage = undefined;
    zm_transform::function_9acf76e6(self, #"hash_791d597ac0457860", &function_607df9c6, 0);
    radiusdamage(self.origin, 200, 15, 5, self);
    self.ai.var_15916e52 = undefined;
    if (isdefined(mover)) {
        mover delete();
    }
    wait(1);
    self delete();
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x1 linked
// Checksum 0x3243027f, Offset: 0x1bb8
// Size: 0xc
function function_db99ddec(params) {
    
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x1 linked
// Checksum 0xabb40d8, Offset: 0x1bd0
// Size: 0xdc
function state_death_update(params) {
    self endon(#"death");
    self asmrequestsubstate(#"hash_49ca75b66bd55529");
    if (isdefined(self.var_c4e19d3) && isdefined(self.var_c4e19d3.hunted_by)) {
        self.var_c4e19d3.hunted_by--;
    }
    self vehicle_death::death_fx();
    self val::set(#"zm_ai_bat", #"hide", 2);
    wait(1);
    self delete();
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x1 linked
// Checksum 0x1d8280fa, Offset: 0x1cb8
// Size: 0x6c
function state_combat_enter(params) {
    self thread function_1076a2e0();
    self thread function_2b369c9f();
    self thread function_ab7568e0();
    /#
        self thread function_66d3e7c2();
    #/
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0x92d02b8f, Offset: 0x1d30
// Size: 0x96
function function_2b369c9f() {
    self endon(#"change_state", #"death");
    self.ai.var_e7d26c0f = 0;
    while (1) {
        if (self.ai.var_e7d26c0f > 3) {
            if (isdefined(level.var_d9f4b654)) {
                self.ai.var_e7d26c0f = 0;
                [[ level.var_d9f4b654 ]](self);
            }
        }
        wait(1);
    }
}

// Namespace bat/zm_ai_bat
// Params 6, eflags: 0x1 linked
// Checksum 0x9872faa2, Offset: 0x1dd0
// Size: 0x2d6
function function_1c4cd527(origin, owner, innerradius, outerradius, halfheight, spacing) {
    queryresult = positionquery_source_navigation(origin, innerradius, outerradius, halfheight, spacing, "navvolume_small", spacing);
    positionquery_filter_sight(queryresult, origin, self geteye() - self.origin, self, 0, owner);
    foreach (point in queryresult.data) {
        if (!point.visibility) {
            /#
                if (!isdefined(point._scoredebug)) {
                    point._scoredebug = [];
                }
                if (!isdefined(point._scoredebug[#"no visibility"])) {
                    point._scoredebug[#"no visibility"] = spawnstruct();
                }
                point._scoredebug[#"no visibility"].score = -5000;
                point._scoredebug[#"no visibility"].scorename = "<unknown string>";
            #/
            point.score = point.score + -5000;
        }
    }
    if (queryresult.data.size > 0) {
        vehicle_ai::positionquery_postprocess_sortscore(queryresult);
        self vehicle_ai::positionquery_debugscores(queryresult);
        foreach (point in queryresult.data) {
            if (isdefined(point.origin)) {
                goal = point.origin;
                break;
            }
        }
    }
    return goal;
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x1 linked
// Checksum 0xa9f866cd, Offset: 0x20b0
// Size: 0x136
function function_8550e9be(enemy) {
    protectdest = undefined;
    if (isdefined(enemy)) {
        groundpos = getclosestpointonnavmesh(enemy.origin, 10000);
        if (isdefined(groundpos)) {
            self.var_d6acaac4 = groundpos;
            pos = groundpos + (0, 0, randomintrange(100, 150));
            pos = getclosestpointonnavvolume(pos, "navvolume_small", 2000);
            if (isdefined(pos)) {
                var_3a364b6c = distance(self.origin, pos);
                if (var_3a364b6c > 500) {
                    protectdest = function_1c4cd527(pos, enemy, 200, 350, 24, 48);
                    if (isdefined(protectdest)) {
                        self.var_c8c5a7d3 = protectdest;
                    }
                }
            }
        }
    }
    return protectdest;
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x0
// Checksum 0x87a4dfc7, Offset: 0x21f0
// Size: 0xce
function function_66d3e7c2() {
    self endon(#"death");
    while (1) {
        if (isdefined(self.var_c8c5a7d3)) {
            /#
                recordsphere(self.var_c8c5a7d3, 8, (0, 0, 1), "<unknown string>");
            #/
            if (isdefined(self.var_d6acaac4)) {
                /#
                    recordsphere(self.var_c8c5a7d3, 8, (0, 1, 0), "<unknown string>");
                    recordline(self.var_c8c5a7d3, self.var_d6acaac4, (0, 1, 0), "<unknown string>");
                #/
            }
        }
        waitframe(1);
    }
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x1 linked
// Checksum 0xa812e480, Offset: 0x22c8
// Size: 0x1e8
function state_combat_update(params) {
    self endon(#"change_state", #"death");
    self asmrequestsubstate(#"locomotion@movement");
    for (;;) {
        for (;;) {
            if (isdefined(self.ignoreall) && self.ignoreall) {
                wait(1);
                continue;
            }
            if (!ispointinnavvolume(self.origin, "navvolume_small")) {
                var_f524eafc = getclosestpointonnavvolume(self.origin, "navvolume_small", 2000);
                if (isdefined(var_f524eafc)) {
                    self.origin = var_f524eafc;
                }
            }
            if (!isdefined(self.var_c4e19d3)) {
                self function_a57c34b7(self.origin, 1, 1);
            }
            protectdest = function_8550e9be(self.var_c4e19d3);
            if (isdefined(protectdest)) {
                path = function_ae7a8634(self.origin, protectdest, self);
                if (isdefined(path) && path.status === "succeeded") {
                    self.ai.var_e7d26c0f = 0;
                    self function_a57c34b7(protectdest, 1, 1);
                } else {
                    self.ai.var_e7d26c0f++;
                }
            }
        }
    }
}

// Namespace bat/zm_ai_bat
// Params 1, eflags: 0x1 linked
// Checksum 0x329eb9ba, Offset: 0x24b8
// Size: 0x7a
function function_84cd2223(var_dbce0c44) {
    var_a87aeae6 = 30;
    var_a1737466 = randomfloatrange(0.02, 0.03);
    return min(var_a87aeae6, int(level.zombie_total * var_a1737466));
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0x427b4020, Offset: 0x2540
// Size: 0x3c
function function_9471b7f9() {
    ai = function_2e37549f();
    if (isdefined(ai)) {
        level.zombie_total--;
        return 1;
    }
    return 0;
}

// Namespace bat/zm_ai_bat
// Params 3, eflags: 0x1 linked
// Checksum 0x56aadb1d, Offset: 0x2588
// Size: 0x1dc
function function_2e37549f(b_force_spawn = 0, var_eb3a8721, n_round_number) {
    if (!b_force_spawn && !function_96578f39()) {
        return undefined;
    }
    if (isdefined(var_eb3a8721)) {
        s_spawn_loc = var_eb3a8721;
    } else if (isdefined(level.var_29a8e07)) {
        s_spawn_loc = [[ level.var_29a8e07 ]]();
    } else if (isdefined(level.zm_loc_types[#"bat_location"]) && level.zm_loc_types[#"bat_location"].size > 0) {
        s_spawn_loc = array::random(level.zm_loc_types[#"bat_location"]);
    }
    if (!isdefined(s_spawn_loc)) {
        return undefined;
    }
    ai = zombie_utility::spawn_zombie(level.bat_spawners[0], undefined, undefined, n_round_number);
    if (isdefined(ai)) {
        ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
        ai thread zombie_utility::round_spawn_failsafe();
        ai.origin = s_spawn_loc.origin;
        if (isdefined(s_spawn_loc.angles)) {
            ai.angles = s_spawn_loc.angles;
        }
        if (isdefined(level.var_d9334d8b)) {
            ai thread [[ level.var_d9334d8b ]](s_spawn_loc);
        }
    }
    return ai;
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0xd0bc2ba6, Offset: 0x2770
// Size: 0xba
function function_96578f39() {
    var_7d706b3f = function_2ffae59e();
    var_1a68bbce = function_133e1e25();
    if (!(isdefined(level.var_2b94ce72) && level.var_2b94ce72) && isdefined(level.var_15747fb1) && level.var_15747fb1 || var_7d706b3f >= var_1a68bbce || !level flag::get("spawn_zombies")) {
        return 0;
    }
    return 1;
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0xbdfe9a14, Offset: 0x2838
// Size: 0xaa
function function_133e1e25() {
    n_player_count = zm_utility::function_a2541519(level.players.size);
    switch (n_player_count) {
    case 1:
        return 3;
        break;
    case 2:
        return 5;
        break;
    case 3:
        return 7;
        break;
    case 4:
        return 10;
        break;
    }
}

// Namespace bat/zm_ai_bat
// Params 0, eflags: 0x1 linked
// Checksum 0xc5ae7340, Offset: 0x28f0
// Size: 0xbc
function function_2ffae59e() {
    var_e7a26429 = getaiarchetypearray(#"bat");
    var_7d706b3f = var_e7a26429.size;
    foreach (ai_bat in var_e7a26429) {
        if (!isalive(ai_bat)) {
            var_7d706b3f--;
        }
    }
    return var_7d706b3f;
}


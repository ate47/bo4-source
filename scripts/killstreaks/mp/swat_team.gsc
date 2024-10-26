#using scripts\core_common\ai\archetype_human_interface.gsc;
#using scripts\core_common\ai\archetype_human.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\path.gsc;
#using scripts\killstreaks\ai\tracking.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\targetting_delay.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using script_52d2de9b438adc78;
#using scripts\killstreaks\helicopter_shared.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\entityheadicons_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using script_3819e7a1427df6d2;

#namespace swat_team;

// Namespace swat_team
// Method(s) 2 Total 2
class class_60aca60a {

    var currentstate;
    var var_85a7b7d2;

    // Namespace class_60aca60a/swat_team
    // Params 0, eflags: 0x9 linked
    // Checksum 0xfbb6faf9, Offset: 0x2120
    // Size: 0x1e
    constructor() {
        currentstate = "engage_center";
        var_85a7b7d2 = gettime();
    }

}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x2
// Checksum 0x762b3a43, Offset: 0x9d8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"swat_team", &__init__, undefined, #"killstreaks");
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x1 linked
// Checksum 0xa9dedfad, Offset: 0xa28
// Size: 0x3dc
function __init__() {
    ir_strobe::init_shared();
    if (!isdefined(level.var_1e18ffa0)) {
        level.var_1e18ffa0 = [];
        level.var_1e18ffa0[#"allies"] = [];
        level.var_1e18ffa0[#"allies"][0] = "spawner_mp_swat_buddy_team1_male";
        level.var_1e18ffa0[#"allies"][1] = "spawner_mp_swat_buddy_team1_female";
        level.var_1e18ffa0[#"allies"][2] = "spawner_mp_swat_buddy_team1_male";
        level.var_1e18ffa0[#"axis"] = [];
        level.var_1e18ffa0[#"axis"][0] = "spawner_mp_swat_buddy_team2_male";
        level.var_1e18ffa0[#"axis"][1] = "spawner_mp_swat_buddy_team2_female";
        level.var_1e18ffa0[#"axis"][2] = "spawner_mp_swat_buddy_team2_male";
    }
    loadsentienteventparameters("sentientevents_mp");
    spawner::add_archetype_spawn_function(#"human", &function_48d57bc8);
    callback::on_actor_damage(&function_493691bc);
    callback::on_ai_killed(&function_6f7a6cbc);
    callback::on_actor_killed(&on_swat_kill);
    callback::on_player_killed_with_params(&on_swat_kill);
    callback::on_finalize_initialization(&function_3675de8b);
    clientfield::register("actor", "swat_light_strobe", 1, 1, "int");
    clientfield::register("scriptmover", "swat_light_strobe", 1, 1, "int");
    clientfield::register("actor", "swat_shocked", 1, 1, "int");
    clientfield::register("vehicle", "swat_helicopter_death_fx", 1, getminbitcountfornum(2), "int");
    clientfield::register("actor", "swat_rob_state", 1, 1, "int");
    killstreaks::register_killstreak("killstreak_swat_team", &function_87bf6422);
    killstreaks::register_alt_weapon("swat_team", getweapon(#"ar_accurate_t8_swat"));
    player::function_3c5cc656(&function_610d3790);
    registerbehaviorscriptfunctions();
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x1 linked
// Checksum 0x2020bf22, Offset: 0xe10
// Size: 0x48
function function_3675de8b() {
    if (isdefined(level.var_1b900c1d)) {
        [[ level.var_1b900c1d ]](getweapon("player_air_vehicle1_main_turret_3rd_person_swat"), &function_fe5b1120);
    }
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0xc36137ec, Offset: 0xe60
// Size: 0x6c
function function_fe5b1120(helicopter, attackingplayer) {
    helicopter notify(#"hash_216c905d79c8bbea");
    if (isdefined(helicopter.rope)) {
        function_d4331865(helicopter.rope);
    }
    helicopter thread swat_helicopter_explode(helicopter);
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x191e57e5, Offset: 0xed8
// Size: 0x21e
function createremoteweapontrigger(hintstring) {
    player = self;
    assert(isplayer(player));
    weapon = spawnstruct();
    weapon.remoteowner = player;
    weapon.inittime = gettime();
    weapon.usetrigger = spawn("trigger_radius_use", player.origin, 0, 32, 32);
    weapon.usetrigger enablelinkto();
    weapon.usetrigger linkto(player);
    weapon.usetrigger sethintlowpriority(1);
    weapon.usetrigger setcursorhint("HINT_NOICON");
    weapon.usetrigger sethintstring(hintstring);
    weapon.usetrigger setteamfortrigger(player.team);
    weapon.usetrigger.team = player.team;
    player clientclaimtrigger(weapon.usetrigger);
    player.remotecontroltrigger = weapon.usetrigger;
    player.activeremotecontroltriggers[player.activeremotecontroltriggers.size] = weapon.usetrigger;
    weapon.usetrigger.claimedby = player;
    return weapon;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x85cf7077, Offset: 0x1100
// Size: 0x44
function function_944f0911(hintstring) {
    assert(isdefined(self.usetrigger));
    self.usetrigger sethintstring(hintstring);
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0xc57dc7a9, Offset: 0x1150
// Size: 0xc0
function function_ab9a9770(player) {
    results = groundtrace(player.origin + (0, 0, 70), player.origin + (0, 0, -100), 0, player);
    if (isdefined(results) && isdefined(results[#"entity"]) && results[#"entity"] ismovingplatform()) {
        return true;
    }
    return false;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0xa859b47c, Offset: 0x1218
// Size: 0x350
function function_87bf6422(killstreak) {
    player = self;
    context = spawnstruct();
    context.radius = level.killstreakcorebundle.ksairdropsupplydropradius;
    context.dist_from_boundary = 100;
    context.max_dist_from_location = 4;
    context.perform_physics_trace = 1;
    context.islocationgood = &islocationgood;
    context.objective = #"hash_1b5a86007f598bbc";
    context.validlocationsound = level.killstreakcorebundle.ksvalidcarepackagelocationsound;
    context.tracemask = 1;
    context.droptag = "tag_attach";
    context.droptagoffset = (-32, 0, 23);
    context.killstreaktype = killstreak;
    context.killstreakref = "swat_team";
    context.var_597ac911 = &stopkillstreak;
    context.var_43dc1011 = player.team;
    killstreak_id = killstreakrules::killstreakstart("swat_team", self.team, 0, 1);
    context.killstreak_id = killstreak_id;
    ksbundle = killstreak_bundles::get_bundle(context);
    if (isdefined(ksbundle)) {
        context.time = ksbundle.kstime;
        context.fx_name = ksbundle.var_3af79d7e;
    }
    waterdepth = self depthofplayerinwater();
    if (!self isonground() || self util::isusingremote() || waterdepth > 2 || self function_ab9a9770(self)) {
        self iprintlnbold(#"hash_7b15978f7b8174f7");
        return false;
    }
    player notify(#"hash_6e666a0689c3fd62");
    player thread function_6936559a(context);
    player thread spawn_swat_team(player, context, player.origin);
    util::function_5a68c330(21, player.team, player getentitynumber(), level.killstreaks[#"swat_team"].uiname);
    return true;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x3c72c7a4, Offset: 0x1570
// Size: 0x18c
function function_6936559a(context) {
    trace = groundtrace(self.origin + (0, 0, 50), self.origin + (0, 0, -100000), 0, self);
    if (isdefined(trace[#"position"]) && isdefined(trace[#"normal"])) {
        origin = trace[#"position"];
        angles = vectortoangles(trace[#"normal"]);
        ir_model = util::spawn_model("wpn_t8_eqp_ir_strobe_world", origin, angles);
        if (isdefined(ir_model)) {
            context.ir_model = ir_model;
            ir_model clientfield::set("swat_light_strobe", 1);
            ir_model waittilltimeout(10, #"hash_1e4c945d50deb21d");
            ir_model clientfield::set("swat_light_strobe", 0);
            waitframe(2);
            ir_model delete();
        }
    }
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x5 linked
// Checksum 0x38b04275, Offset: 0x1708
// Size: 0x45c
function private registerbehaviorscriptfunctions() {
    assert(isscriptfunctionptr(&function_7b12237f));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_521ce9363e228cec", &function_7b12237f);
    assert(isscriptfunctionptr(&function_e3151f98));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_62335a0608a02309", &function_e3151f98);
    assert(isscriptfunctionptr(&function_e5f59cf0));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4a938922d1af0c4d", &function_e5f59cf0);
    assert(isscriptfunctionptr(&function_3c677dcd));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4cc583c8bb841d4c", &function_3c677dcd);
    assert(isscriptfunctionptr(&function_994477c0));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3861dc092e2bcf88", &function_994477c0, 1);
    assert(isscriptfunctionptr(&function_fb9f1f3b));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_48334fe2b83169f2", &function_fb9f1f3b, 1);
    assert(isscriptfunctionptr(&function_5bc83fac));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_44cbd2652f2bcafb", &function_5bc83fac);
    assert(isscriptfunctionptr(&function_5e207da3));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_37de1d651cda8ede", &function_5e207da3);
    assert(isscriptfunctionptr(&swatshouldmelee));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"swatshouldmelee", &swatshouldmelee);
    assert(isscriptfunctionptr(&swatshouldmelee));
    behaviorstatemachine::registerbsmscriptapiinternal(#"swatshouldmelee", &swatshouldmelee);
    animationstatenetwork::registeranimationmocomp("mocomp_swat_team_pain", &function_6edff1e1, undefined, &function_8acd749d);
}

// Namespace swat_team/swat_team
// Params 5, eflags: 0x1 linked
// Checksum 0x68891cfc, Offset: 0x1b70
// Size: 0xa2
function function_6edff1e1(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity orientmode("face angle", self.angles[1]);
    entity animmode("zonly_physics", 1);
    entity pathmode("dont move");
    entity.blockingpain = 1;
}

// Namespace swat_team/swat_team
// Params 5, eflags: 0x1 linked
// Checksum 0x9b1cace2, Offset: 0x1c20
// Size: 0x5a
function function_8acd749d(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    entity pathmode("move allowed");
    entity.blockingpain = 0;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0xefabca69, Offset: 0x1c88
// Size: 0x44
function private function_7b12237f(entity) {
    if (isdefined(entity.ai.var_f185cb34) && entity.ai.var_f185cb34) {
        return true;
    }
    return false;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0xd42b68c, Offset: 0x1cd8
// Size: 0x44
function private function_e3151f98(entity) {
    if (isdefined(entity.ai.swat_gunner) && entity.ai.swat_gunner) {
        return true;
    }
    return false;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x7d633122, Offset: 0x1d28
// Size: 0x24
function private function_e5f59cf0(entity) {
    entity unlink();
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x9d5447fd, Offset: 0x1d58
// Size: 0x9e
function private function_3c677dcd(entity) {
    if (isdefined(entity.enemy) && !(isdefined(entity.ignoreall) && entity.ignoreall)) {
        if (util::within_fov(entity.origin, entity.angles, entity.enemy.origin, cos(90))) {
            return true;
        }
    }
    return false;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0xf3dcfe85, Offset: 0x1e00
// Size: 0x44
function private function_5bc83fac(entity) {
    if (entity.var_40543c03 === "electrical") {
        clientfield::set("swat_shocked", 1);
    }
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x40475ae6, Offset: 0x1e50
// Size: 0x296
function private swatshouldmelee(entity) {
    if (isdefined(entity.ai.lastshouldmeleeresult) && !entity.ai.lastshouldmeleeresult && entity.ai.lastshouldmeleechecktime + 200 >= gettime()) {
        return false;
    }
    entity.lastshouldmeleechecktime = gettime();
    entity.lastshouldmeleeresult = 0;
    if (!isdefined(entity.enemy)) {
        return false;
    }
    if (!entity.enemy.allowdeath) {
        return false;
    }
    if (!isalive(entity.enemy)) {
        return false;
    }
    if (!issentient(entity.enemy)) {
        return false;
    }
    if (!isactor(entity.enemy) && !isplayer(entity.enemy)) {
        return false;
    }
    if (isplayer(entity.enemy) && entity.enemy getstance() == "prone") {
        return false;
    }
    if (isactor(entity.enemy)) {
        if (!isdefined(entity.enemy.archetype)) {
            return false;
        }
        if (entity.enemy.archetype != #"human") {
            return false;
        }
    }
    if (distancesquared(entity.origin, entity.enemy.origin) > 140 * 140) {
        return false;
    }
    if (!aiutility::shouldmutexmelee(entity)) {
        return false;
    }
    if (aiutility::shouldnormalmelee(entity) || aiutility::shouldchargemelee(entity)) {
        entity.ai.lastshouldmeleeresult = 1;
        return true;
    }
    return false;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x10141e33, Offset: 0x20f0
// Size: 0x24
function private function_5e207da3(entity) {
    clientfield::set("swat_shocked", 0);
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x24d4573a, Offset: 0x21e8
// Size: 0x64
function private function_91228fe2(entity) {
    if (isdefined(entity.ai.var_5cb410bc)) {
        entity.ai.var_5cb410bc = undefined;
        if (isdefined(entity.goalpos)) {
            entity function_a57c34b7(entity.goalpos);
        }
    }
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x5 linked
// Checksum 0x8e0033ab, Offset: 0x2258
// Size: 0x74
function private function_a72ef6ce(entity, newspot) {
    assert(isdefined(newspot));
    if (isdefined(entity.goalpos) && isdefined(entity.goalradius)) {
        if (entity isingoal(newspot)) {
            return true;
        }
        return false;
    }
    return true;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0xcce0f367, Offset: 0x22d8
// Size: 0x6e
function private function_f046ec67(entity) {
    function_91228fe2(entity);
    entity.ai.var_5cb410bc = new class_60aca60a();
    entity.ai.var_5cb410bc.centerpos = entity.origin;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x774a518d, Offset: 0x2350
// Size: 0x6e
function private function_615dc1b2(entity) {
    assert(isdefined(entity.ai.var_5cb410bc));
    entity.ai.var_5cb410bc.var_85a7b7d2 = gettime() + randomintrange(1200, 2200);
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0xf80bb84a, Offset: 0x23c8
// Size: 0x920
function private function_fb9f1f3b(entity) {
    if (isdefined(entity.reacquire_state) && entity.reacquire_state > 0) {
        function_91228fe2(entity);
        return false;
    }
    if (!isdefined(entity.enemy) || !entity seerecently(entity.enemy, 8)) {
        function_91228fe2(entity);
        return false;
    }
    if (!issentient(entity.enemy) || !isplayer(entity.enemy)) {
        function_91228fe2(entity);
        return false;
    }
    var_1438a751 = distancesquared(entity.origin, entity.enemy.origin);
    if (var_1438a751 < 100 * 100) {
        function_91228fe2(entity);
        return false;
    }
    if (var_1438a751 > 1000 * 1000) {
        function_91228fe2(entity);
        return false;
    }
    seerecently = entity seerecently(entity.enemy, 8);
    var_245760b8 = entity attackedrecently(entity.enemy, 4);
    var_a199aab8 = seerecently && var_245760b8;
    if (!var_a199aab8) {
        function_91228fe2(entity);
        return false;
    }
    if (!isdefined(entity.ai.var_5cb410bc)) {
        entity thread registerrein_amb("swat_engaging");
        function_f046ec67(entity);
    }
    if (gettime() < entity.ai.var_5cb410bc.var_85a7b7d2) {
        return false;
    }
    assert(isdefined(entity.ai.var_5cb410bc));
    nextstate = "engage_center";
    switch (entity.ai.var_5cb410bc.currentstate) {
    case #"engage_center":
        random = randomint(100);
        if (random < 33) {
            nextstate = "engage_left";
        } else if (random < 66) {
            nextstate = "engage_right";
        }
        break;
    case #"engage_left":
    case #"engage_right":
        nextstate = "engage_center";
        break;
    default:
        break;
    }
    if (nextstate != entity.ai.var_5cb410bc.currentstate) {
        dirtoenemy = vectornormalize(entity.enemy.origin - entity.origin);
        angles = vectortoangles(dirtoenemy);
        angles = (0, angles[1], 0);
        newspot = undefined;
        direction = undefined;
        if (nextstate == "engage_left") {
            var_5612239e = anglestoright(angles) * -1;
            movepos = entity.origin + vectorscale(var_5612239e, randomintrange(60, 200));
            tacpoint = getclosesttacpoint(movepos);
            if (isdefined(tacpoint) && tracepassedonnavmesh(entity.origin, tacpoint.origin, 18)) {
                newspot = tacpoint.origin;
                direction = "engage_left";
            }
        } else if (nextstate == "engage_right") {
            var_c254b075 = anglestoright(angles);
            movepos = entity.origin + vectorscale(var_c254b075, randomintrange(60, 200));
            tacpoint = getclosesttacpoint(movepos);
            if (isdefined(tacpoint) && tracepassedonnavmesh(entity.origin, tacpoint.origin, 18)) {
                newspot = tacpoint.origin;
                direction = "engage_right";
            }
        } else {
            newspot = entity.ai.var_5cb410bc.centerpos;
            direction = "engage_center";
        }
        if (isdefined(newspot) && isdefined(direction) && function_a72ef6ce(entity, newspot)) {
            entity function_a57c34b7(newspot);
            function_615dc1b2(entity);
            /#
                record3dtext("<dev string:x38>" + direction, newspot + (0, 0, 10), (0, 0, 1), "<dev string:x3b>");
                recordline(entity.origin, newspot, (0, 0, 1), "<dev string:x3b>");
                recordcircle(newspot, 8, (0, 0, 1), "<dev string:x3b>");
            #/
        } else {
            cylinder = ai::t_cylinder(entity.ai.var_5cb410bc.centerpos, entity.goalradius, 40);
            var_c5139037 = ai::t_cylinder(entity.ai.var_5cb410bc.centerpos, 60, 40);
            enemypos = entity.enemy.origin;
            tacpoints = tacticalquery("swat_engage_enemy", cylinder, entity, enemypos, var_c5139037);
            if (isdefined(tacpoints) && tacpoints.size) {
                tacpoint = array::random(tacpoints);
                entity function_a57c34b7(tacpoint.origin);
                function_615dc1b2(entity);
                /#
                    record3dtext("<dev string:x44>", tacpoint.origin + (0, 0, 10), (0, 0, 1), "<dev string:x3b>");
                    recordline(entity.origin, tacpoint.origin, (0, 0, 1), "<dev string:x3b>");
                    recordcircle(tacpoint.origin, 8, (0, 0, 1), "<dev string:x3b>");
                #/
            }
        }
    }
    return true;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x61cc6931, Offset: 0x2cf0
// Size: 0x2ba
function private function_994477c0(entity) {
    if (!isdefined(entity.reacquire_state)) {
        entity.reacquire_state = 0;
    }
    if (!isdefined(entity.enemy)) {
        entity.reacquire_state = 0;
        return false;
    }
    if (entity haspath()) {
        entity.reacquire_state = 0;
        return false;
    }
    if (entity seerecently(entity.enemy, 4)) {
        entity.reacquire_state = 0;
        return false;
    }
    dirtoenemy = vectornormalize(entity.enemy.origin - entity.origin);
    forward = anglestoforward(entity.angles);
    if (vectordot(dirtoenemy, forward) < 0.5) {
        entity.reacquire_state = 0;
        return false;
    }
    switch (entity.reacquire_state) {
    case 0:
    case 1:
    case 2:
        step_size = 32 + entity.reacquire_state * 32;
        reacquirepos = entity reacquirestep(step_size);
        break;
    case 4:
        if (!entity cansee(entity.enemy) || !entity canshootenemy()) {
            entity flagenemyunattackable();
        }
        break;
    default:
        if (entity.reacquire_state > 15) {
            entity.reacquire_state = 0;
            return false;
        }
        break;
    }
    if (isvec(reacquirepos)) {
        entity function_a57c34b7(reacquirepos);
        return true;
    }
    entity.reacquire_state++;
    return false;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x1074fb05, Offset: 0x2fb8
// Size: 0x9c
function private on_swat_kill(params) {
    if (isdefined(params.einflictor) && isactor(params.einflictor) && isdefined(params.einflictor.ai.var_ac89e6f6) && params.einflictor.ai.var_ac89e6f6) {
        params.einflictor thread registerrein_amb("swat_kill");
    }
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x5 linked
// Checksum 0xb383a05e, Offset: 0x3060
// Size: 0xc4
function private function_493691bc() {
    if (isdefined(self.ai.var_ac89e6f6) && self.ai.var_ac89e6f6) {
        var_af5a02c6 = int(1 * 1000);
        self.ai.var_b6554c59 = gettime() + var_af5a02c6;
        if (isdefined(self.var_134eefb9)) {
            maxhealth = self.maxhealth;
            health_percent = self.health / maxhealth;
            objective_setprogress(self.var_134eefb9, health_percent);
        }
    }
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0xa3ad0b90, Offset: 0x3130
// Size: 0x2f4
function private function_6f7a6cbc(params) {
    if (!(isdefined(self.ai.var_ac89e6f6) && self.ai.var_ac89e6f6)) {
        return;
    }
    clientfield::set("swat_light_strobe", 0);
    if (isdefined(self.script_owner) && isdefined(self.script_owner.swat_team)) {
        arrayremovevalue(self.script_owner.swat_team, self);
    }
    self laseroff();
    if (isdefined(self.var_134eefb9)) {
        objective_delete(self.var_134eefb9);
        gameobjects::release_obj_id(self.var_134eefb9);
    }
    if (isdefined(params.eattacker)) {
        if (isplayer(params.eattacker)) {
            luinotifyevent(#"player_callout", 2, #"hash_4fb540af669c6500", params.eattacker.entnum);
            params.eattacker battlechatter::function_dd6a6012("swat_team", params.weapon);
            self killstreaks::function_73566ec7(params.eattacker, params.weapon, self.script_owner);
            params.eattacker challenges::destroyscorestreak(params.weapon, 0, 1, 0);
        }
    }
    self function_b4f4603e();
    if (isdefined(self.script_owner) && isdefined(self.script_owner.swat_team)) {
        foreach (swat in self.script_owner.swat_team) {
            if (isdefined(swat) && isalive(swat) && swat != self) {
                swat thread registerrein_amb("swat_destroyed");
                break;
            }
        }
    }
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x2d1bea3a, Offset: 0x3430
// Size: 0x20e
function function_416a0a80(owner) {
    self endon(#"death");
    if (getdvarint(#"hash_667dcfb9f4060f0c", 0)) {
        self.var_134eefb9 = gameobjects::get_next_obj_id();
        objective_add(self.var_134eefb9, "active", self, #"hash_6cff9cefb99a67d1");
        objective_setprogress(self.var_134eefb9, 1);
        function_da7940a3(self.var_134eefb9, 1);
        objective_setinvisibletoall(self.var_134eefb9);
        objective_setvisibletoplayer(self.var_134eefb9, owner);
    }
    self.ai.var_b6554c59 = gettime();
    maxhealth = self.maxhealth;
    while (true) {
        var_d350f9d0 = gettime() >= self.ai.var_b6554c59;
        var_e057e12a = self.health >= self.maxhealth;
        if (var_d350f9d0 && !var_e057e12a) {
            newhealth = self.health + 300;
            if (newhealth <= maxhealth) {
                self.health = newhealth;
            } else {
                self.health = maxhealth;
            }
            health_percent = self.health / maxhealth;
            if (isdefined(self.var_134eefb9)) {
                objective_setprogress(self.var_134eefb9, health_percent);
            }
        }
        wait 1;
    }
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x99ea5da3, Offset: 0x3648
// Size: 0x92
function function_3863cd9(swat) {
    goalinfo = swat function_4794d6a3();
    if (isdefined(goalinfo.node)) {
        var_7a0aa83f = goalinfo.node.origin + vectorscale(anglestoforward(goalinfo.node.angles), 400);
        return var_7a0aa83f;
    }
    return undefined;
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x5 linked
// Checksum 0x12367313, Offset: 0x36e8
// Size: 0x4c
function private function_b4f4603e() {
    removeallinfluencersfromentity(self);
    level influencers::create_friendly_influencer("friend_dead", self.origin, self.team);
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x5 linked
// Checksum 0x89f50d71, Offset: 0x3740
// Size: 0x1a2
function private function_e69272bf() {
    assert(isdefined(self.script_owner));
    if (!level.teambased) {
        team_mask = level.spawnsystem.ispawn_teammask_free;
        enemy_teams_mask = level.spawnsystem.ispawn_teammask_free;
    } else if (isdefined(self.script_owner.pers[#"team"])) {
        team = self.script_owner.pers[#"team"];
        team_mask = util::getteammask(team);
        enemy_teams_mask = util::getotherteamsmask(team);
    } else {
        team_mask = 0;
        enemy_teams_mask = 0;
    }
    angles = self.angles;
    origin = self.origin;
    up = (0, 0, 1);
    forward = (1, 0, 0);
    self influencers::create_entity_influencer("enemy", enemy_teams_mask);
    if (level.teambased) {
        self influencers::create_entity_influencer("friend", team_mask);
    }
    self.influencers_created = 1;
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x5 linked
// Checksum 0x3921f24b, Offset: 0x38f0
// Size: 0x356
function private function_ace0a9bc() {
    self endon(#"death");
    self.ai.var_ac89e6f6 = 1;
    self.health = 1500;
    self.maxhealth = 1500;
    self.enableterrainik = 1;
    self.ai.var_7c61677c = 1;
    self.highlyawareradius = 3000;
    self.script_accuracy = 1;
    self.var_b6eabf3b = 600;
    self.goalradius = 350;
    self.ai.var_54b19f55 = 1;
    self.sightlatency = 0;
    self.fovcosine = 0;
    self.fovcosinebusy = 0;
    self.ai.var_3af1add3 = &function_3863cd9;
    self laseron();
    self collidewithactors(0);
    self setplayercollision(0);
    self ai::set_behavior_attribute("useGrenades", 0);
    self function_e69272bf();
    while (true) {
        if (getdvarint(#"hash_6f66ef2c6ab70226", 0)) {
            if (isdefined(self.likelyenemyposition)) {
                /#
                    recordline(self.origin, self.likelyenemyposition, (0, 0, 1), "<dev string:x3b>");
                    recordcircle(self.likelyenemyposition, 8, (0, 0, 1), "<dev string:x3b>");
                #/
            }
            if (isdefined(self.enemy)) {
                /#
                    recordline(self.origin + (0, 0, 70), self.enemy.origin + (0, 0, 70), (1, 0, 0), "<dev string:x3b>");
                    recordcircle(self.enemy.origin + (0, 0, 70), 8, (1, 0, 0), "<dev string:x3b>");
                    if (isplayer(self.enemy)) {
                        pathdata = generatenavmeshpath(self.origin, self.enemy.origin, self);
                        pathdistance = pathdata.pathdistance;
                        path = pathdata.pathpoints;
                        path::function_3c367117(path, (0, 0, 1), (1, 0, 0), (1, 0.5, 0));
                    }
                #/
            }
        }
        waitframe(1);
    }
}

// Namespace swat_team/swat_team
// Params 3, eflags: 0x5 linked
// Checksum 0x5c563560, Offset: 0x3c50
// Size: 0x1d0
function private function_8fa2faa5(swat, helicopter, position) {
    swat endon(#"death", #"stop_riding");
    helicopter endon(#"death", #"hash_216c905d79c8bbea");
    level endon(#"game_ended");
    ride_anim = undefined;
    switch (position) {
    case 0:
        ride_anim = "ai_swat_rifle_ent_litlbird_rappel_stn_base_01_idle";
        break;
    case 1:
        ride_anim = "ai_swat_rifle_ent_litlbird_rappel_stn_base_02_idle";
        break;
    case 2:
        ride_anim = "ai_swat_rifle_ent_litlbird_rappel_stn_base_03_idle";
        break;
    default:
        assertmsg("<dev string:x4d>");
        break;
    }
    assert(isdefined(ride_anim));
    if (isdefined(ride_anim)) {
        while (true) {
            if (isalive(swat) && swat hasanimtree()) {
                swat animation::play(ride_anim, helicopter, "tag_origin", 1, 0.2, 0.1, undefined, undefined, undefined, 0);
            }
        }
    }
}

// Namespace swat_team/swat_team
// Params 3, eflags: 0x5 linked
// Checksum 0xcb373088, Offset: 0x3e28
// Size: 0x244
function private function_67260255(swat, helicopter, killstreak_id) {
    swat endon(#"swat_landed", #"death");
    helicopter endon(#"death");
    params = helicopter waittill(#"hash_216c905d79c8bbea");
    if (isdefined(swat.script_owner)) {
        swat.script_owner notify(#"hash_216c905d79c8bbea");
        swat.script_owner notify(#"payload_fail");
    }
    if (isdefined(swat.ai) && !(swat.ai.var_f185cb34 === 1) && !isdefined(helicopter.var_7faf41b4)) {
        helicopter.var_7faf41b4 = 1;
        if (isdefined(helicopter.owner)) {
            helicopter.owner globallogic_audio::play_taacom_dialog("destroyed", "swat_team");
        }
        if (isdefined(params) && isplayer(params.attacker)) {
            luinotifyevent(#"player_callout", 2, #"hash_6aba3ca683926a75", params.attacker.entnum);
        }
    }
    swat unlink();
    swat startragdoll();
    swat kill(swat.origin, undefined, undefined, undefined, 0, 1);
    function_d4331865(helicopter.rope);
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0xd146112, Offset: 0x4078
// Size: 0x8c
function private function_ab6f69a1(swat) {
    swat endon(#"swat_landed");
    swat waittill(#"death");
    if (isdefined(swat) && !function_3132f113(swat)) {
        swat unlink();
        swat startragdoll();
    }
}

// Namespace swat_team/swat_team
// Params 5, eflags: 0x1 linked
// Checksum 0x136414f5, Offset: 0x4110
// Size: 0x388
function swat_deploy(swat, helicopter, position, var_a298d55b, var_eead001f) {
    swat endon(#"death");
    level endon(#"game_ended");
    deploy_anim = undefined;
    switch (position) {
    case 0:
        deploy_anim = "ai_swat_rifle_ent_litlbird_rappel_stn_base_01";
        break;
    case 1:
        deploy_anim = "ai_swat_rifle_ent_litlbird_rappel_stn_base_02";
        break;
    case 2:
        deploy_anim = "ai_swat_rifle_ent_litlbird_rappel_stn_base_03";
        break;
    default:
        assertmsg("<dev string:x85>");
        break;
    }
    assert(isdefined(deploy_anim));
    swat notify(#"stop_riding");
    swat pathmode("dont move");
    if (isalive(swat) && swat hasanimtree() && isdefined(deploy_anim)) {
        swat animation::play(deploy_anim, helicopter.origin, helicopter.angles, 1.2, 0.2, 0.3, undefined, undefined, undefined, 0);
    }
    swat unlink();
    if (var_eead001f) {
        swat thread registerrein_amb("swat_arrive");
    }
    aiutility::removeaioverridedamagecallback(swat, &function_e588f057);
    aiutility::addaioverridedamagecallback(swat, &function_47cf421e);
    if (!ispointonnavmesh(self.origin, self)) {
        point = getclosestpointonnavmesh(swat.origin, 100);
        if (isdefined(point)) {
            swat forceteleport(point);
        }
    }
    swat.ignoreall = 0;
    swat.ignoreme = 0;
    swat pathmode("move allowed");
    if (isdefined(var_a298d55b)) {
        if (ispathnode(var_a298d55b)) {
            swat setgoal(var_a298d55b);
            swat usecovernode(var_a298d55b);
        } else if (isvec(var_a298d55b)) {
            swat setgoal(var_a298d55b);
        }
    }
    swat notify(#"swat_landed");
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x9e9da71e, Offset: 0x44a0
// Size: 0x166
function private function_8de67419(leavenode) {
    self endon(#"death");
    radius = distance(self.origin, leavenode.origin);
    var_a9a839e2 = getclosestpointonnavvolume(leavenode.origin, "navvolume_big", radius);
    if (isdefined(var_a9a839e2)) {
        self function_9ffc1856(var_a9a839e2, 0);
        while (true) {
            /#
                recordsphere(var_a9a839e2, 8, (0, 0, 1), "<dev string:x3b>");
            #/
            var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
            if (!var_baa92af9) {
                self function_60d50ea4();
                self notify(#"hash_2bf34763927dd61b");
                break;
            }
            waitframe(1);
        }
        return;
    }
    self function_60d50ea4();
    self notify(#"hash_2bf34763927dd61b");
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x4d388118, Offset: 0x4610
// Size: 0x484
function function_9fe56d0b(helicopter) {
    helicopter notify(#"leaving");
    helicopter notify(#"heli_leave");
    helicopter.leaving = 1;
    if (isdefined(level.var_14151f16)) {
        [[ level.var_14151f16 ]](helicopter, 0);
    }
    leavenode = helicopter::getvalidrandomleavenode(helicopter.origin);
    var_b4c35bb7 = leavenode.origin;
    heli_reset();
    helicopter vehclearlookat();
    exitangles = vectortoangles(var_b4c35bb7 - helicopter.origin);
    helicopter setgoalyaw(exitangles[1]);
    var_e60e2941 = helicopter.var_e60e2941;
    if (isdefined(level.var_e071ed64) && level.var_e071ed64) {
        if (!ispointinnavvolume(helicopter.origin, "navvolume_big")) {
            if (issentient(helicopter)) {
                helicopter function_60d50ea4();
            }
            radius = distance(self.origin, leavenode.origin);
            var_a9a839e2 = getclosestpointonnavvolume(helicopter.origin, "navvolume_big", radius);
            if (isdefined(var_a9a839e2)) {
                helicopter function_9ffc1856(var_a9a839e2, 0);
                while (true) {
                    /#
                        recordsphere(var_a9a839e2, 8, (0, 0, 1), "<dev string:x3b>");
                    #/
                    var_baa92af9 = ispointinnavvolume(helicopter.origin, "navvolume_big");
                    if (var_baa92af9) {
                        helicopter makesentient();
                        break;
                    }
                    waitframe(1);
                }
            }
        }
        if (!ispointinnavvolume(leavenode.origin, "navvolume_big")) {
            helicopter thread function_8de67419(leavenode);
            helicopter waittill(#"hash_2bf34763927dd61b", #"death");
        }
    }
    if (isdefined(helicopter)) {
        helicopter function_9ffc1856(var_b4c35bb7, 1);
        helicopter waittilltimeout(20, #"near_goal", #"death");
    }
    if (isdefined(var_e60e2941)) {
        for (i = var_e60e2941.size; i >= 0; i--) {
            if (isdefined(var_e60e2941[i]) && isalive(var_e60e2941[i])) {
                var_e60e2941[i] delete();
            }
        }
    }
    if (isdefined(helicopter)) {
        helicopter stoploopsound(1);
        helicopter util::death_notify_wrapper();
        if (isdefined(helicopter.alarm_snd_ent)) {
            helicopter.alarm_snd_ent stoploopsound();
            helicopter.alarm_snd_ent delete();
            helicopter.alarm_snd_ent = undefined;
        }
        helicopter delete();
    }
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x5 linked
// Checksum 0xe90ad22e, Offset: 0x4aa0
// Size: 0x160
function private function_5ca48510(helicopter, var_1c996690) {
    helicopter endon(#"death", #"heli_leave");
    level endon(#"game_ended");
    namesstruct_n = var_1c996690;
    lerp_duration = max((helicopter.origin[2] - var_1c996690[2] - 600) / 625, 0.8);
    helicopter animation::play("ai_swat_rifle_ent_litlbird_rappel_stn_vehicle2", namesstruct_n, (0, helicopter.angles[1], 0), 1, 0.1, 0.2, lerp_duration);
    while (true) {
        helicopter animation::play("ai_swat_rifle_ent_litlbird_rappel_stn_vehicle2", namesstruct_n, (0, helicopter.angles[1], 0), 1, 0.1, 0.2, 0.8);
    }
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x1 linked
// Checksum 0xb9725a44, Offset: 0x4c08
// Size: 0x74
function heli_reset() {
    self cleartargetyaw();
    self cleargoalyaw();
    self setyawspeed(75, 45, 45);
    self setmaxpitchroll(30, 30);
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x1 linked
// Checksum 0xcd884d5d, Offset: 0x4c88
// Size: 0x10c
function function_656691ab() {
    self endon(#"death", #"abandoned");
    while (true) {
        var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
        if (var_baa92af9) {
            heli_reset();
            self makepathfinder();
            self util::make_sentient();
            self.ignoreme = 1;
            if (isdefined(self.heligoalpos)) {
                self function_9ffc1856(self.heligoalpos, 1);
            }
            self notify(#"hash_340ab3c2b94ff86a");
            break;
        }
        waitframe(1);
    }
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0x21fb270f, Offset: 0x4da0
// Size: 0x114
function function_9ffc1856(goalpos, stop) {
    self.heligoalpos = goalpos;
    if (isdefined(level.var_e071ed64) && level.var_e071ed64) {
        if (issentient(self) && ispathfinder(self) && ispointinnavvolume(self.origin, "navvolume_big")) {
            self setgoal(goalpos, stop);
            self function_a57c34b7(goalpos, stop, 1);
        } else {
            self function_a57c34b7(goalpos, stop, 0);
        }
        return;
    }
    self setgoal(goalpos, stop);
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x5 linked
// Checksum 0x80056bd7, Offset: 0x4ec0
// Size: 0x3a8
function private function_67c394f2(helicopter, destination) {
    helicopter endon(#"death");
    var_7f4a508d = destination;
    if (isdefined(level.var_e071ed64) && level.var_e071ed64) {
        helicopter thread function_656691ab();
        if (!ispointinnavvolume(var_7f4a508d, "navvolume_big")) {
            var_a9a839e2 = getclosestpointonnavvolume(destination, "navvolume_big", 10000);
            var_7f4a508d = (var_a9a839e2[0], var_a9a839e2[1], destination[2]);
            if (isdefined(var_7f4a508d)) {
                helicopter function_9ffc1856(var_7f4a508d, 1);
                helicopter.var_7f4a508d = var_7f4a508d;
                if (!ispointinnavvolume(var_7f4a508d, "navvolume_big")) {
                    self waittilltimeout(10, #"hash_340ab3c2b94ff86a");
                }
            }
        }
        self function_9ffc1856(var_7f4a508d, 1);
        self waittill(#"near_goal");
    } else {
        helicopter thread airsupport::setgoalposition(destination, "swat_heli_reached", 1);
        helicopter waittill(#"swat_heli_reached");
    }
    last_distance_from_goal_squared = 1e+07 * 1e+07;
    continue_waiting = 1;
    for (remaining_tries = 30; continue_waiting && remaining_tries > 0; remaining_tries--) {
        current_distance_from_goal_squared = distance2dsquared(helicopter.origin, destination);
        continue_waiting = current_distance_from_goal_squared < last_distance_from_goal_squared && current_distance_from_goal_squared > 4 * 4;
        last_distance_from_goal_squared = current_distance_from_goal_squared;
        /#
            if (getdvarint(#"swat_debug", 0)) {
                sphere(destination, 8, (1, 0, 0), 0.9, 0, 20, 1);
            }
        #/
        if (continue_waiting) {
            /#
                if (getdvarint(#"swat_debug", 0)) {
                    iprintln("<dev string:xbe>" + distance2d(helicopter.origin, destination));
                }
            #/
            waitframe(1);
        }
    }
    /#
        if (getdvarint(#"swat_debug", 0)) {
            iprintln("<dev string:xd8>" + distance2d(helicopter.origin, destination));
        }
    #/
    helicopter notify(#"reached_destination");
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x42b00f43, Offset: 0x5270
// Size: 0x4c
function swat_helicopter_explode(helicopter) {
    helicopter helicopter::function_e1058a3e();
    wait 0.1;
    if (isdefined(helicopter)) {
        helicopter delete();
    }
}

// Namespace swat_team/swat_team
// Params 4, eflags: 0x5 linked
// Checksum 0x668830dd, Offset: 0x52c8
// Size: 0x2a0
function private spawn_swat_helicopter(owner, origin, angles, context) {
    helicopter = spawnvehicle("vehicle_t8_mil_helicopter_swat_transport", origin, angles, "swat_helicopter");
    helicopter setowner(owner);
    helicopter thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile("crashing", "death");
    helicopter.spawntime = gettime();
    helicopter clientfield::set("enemyvehicle", 1);
    helicopter.attackers = [];
    helicopter.attackerdata = [];
    helicopter.attackerdamage = [];
    helicopter.flareattackerdamage = [];
    helicopter.killstreak_id = context.killstreak_id;
    helicopter setdrawinfrared(1);
    helicopter.allowcontinuedlockonafterinvis = 1;
    helicopter.soundmod = "heli";
    helicopter.identifier_weapon = getweapon("player_air_vehicle1_main_turret_3rd_person_swat");
    var_9a1bcc5b = 128;
    helicopter setneargoalnotifydist(var_9a1bcc5b);
    helicopter.maxhealth = level.heli_maxhealth;
    helicopter.health = level.heli_maxhealth;
    helicopter.overridevehicledamage = &function_11038a4a;
    helicopter killstreaks::configure_team("swat_team", context.killstreak_id, owner);
    context.helicopter = helicopter;
    helicopter.numflares = 1;
    helicopter thread helicopter::create_flare_ent((0, 0, -100));
    helicopter.target_offset = (0, 0, -25);
    target_set(helicopter, (0, 0, -25));
    helicopter setrotorspeed(1);
    return helicopter;
}

// Namespace swat_team/swat_team
// Params 15, eflags: 0x1 linked
// Checksum 0x8a78537b, Offset: 0x5570
// Size: 0x1c0
function function_11038a4a(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    helicopter = self;
    if (smeansofdeath == "MOD_TRIGGER_HURT") {
        return 0;
    }
    idamage = self killstreaks::ondamageperweapon("swat_team", eattacker, idamage, idflags, smeansofdeath, weapon, self.maxhealth, undefined, self.lowhealth, undefined, 0, undefined, 1, 1);
    /#
        if (getdvarint(#"hash_2272264bb18906ce", 0)) {
            idamage = self.health + 1;
        }
    #/
    if (idamage >= self.health) {
        self.health = idamage + 1;
        helicopter.overridevehicledamage = undefined;
        helicopter notify(#"hash_216c905d79c8bbea", {#attacker:eattacker});
        function_d4331865(helicopter.rope);
        helicopter thread swat_helicopter_explode(helicopter);
    }
    return idamage;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x74b033d, Offset: 0x5738
// Size: 0x10c
function private function_ab26fd70(helicopter) {
    assert(!isdefined(helicopter.rope));
    helicopter.rope = spawn("script_model", helicopter.origin);
    assert(isdefined(helicopter.rope));
    helicopter.rope useanimtree("generic");
    helicopter.rope setmodel("p8_fxanim_gp_vehicle_lb_swat_rappel_mod");
    helicopter.rope linkto(helicopter, "tag_origin");
    helicopter.rope hide();
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x2f228a00, Offset: 0x5850
// Size: 0x104
function private function_61baa879(helicopter) {
    if (!isdefined(helicopter.rope)) {
        return;
    }
    helicopter endon(#"hash_216c905d79c8bbea", #"death");
    helicopter.rope endon(#"death");
    helicopter.rope show();
    helicopter endon(#"hash_216c905d79c8bbea", #"death");
    level endon(#"game_ended");
    helicopter.rope animation::play("p8_fxanim_gp_vehicle_lb_swat_rappel_start_anim", helicopter, "tag_origin", 1, 0.2, 0.1, undefined, undefined, undefined, 0);
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x4
// Checksum 0x4c8f5ae0, Offset: 0x5960
// Size: 0x3c
function private function_b7ec43e(rope) {
    rope endon(#"death");
    if (isdefined(rope)) {
        rope delete();
    }
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x9c8bfd7d, Offset: 0x59a8
// Size: 0x114
function private function_21f27c75(helicopter) {
    level endon(#"game_ended");
    if (!isdefined(helicopter.rope)) {
        return;
    }
    helicopter endon(#"hash_216c905d79c8bbea", #"death");
    helicopter.rope endon(#"death");
    rope = helicopter.rope;
    helicopter notify(#"hash_6d5d50a125188a1b");
    helicopter.rope thread animation::play("p8_fxanim_gp_vehicle_lb_swat_rappel_drop_anim", helicopter, "tag_origin", 1, 0.2, 0.1, undefined, undefined, undefined, 0);
    wait 0.5;
    function_d4331865(rope);
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x630caa71, Offset: 0x5ac8
// Size: 0x2e
function private function_d4331865(rope) {
    if (isdefined(rope)) {
        rope delete();
        return;
    }
}

// Namespace swat_team/swat_team
// Params 12, eflags: 0x1 linked
// Checksum 0xea980cf2, Offset: 0x5b00
// Size: 0x120
function function_47cf421e(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    bundle = getscriptbundle("killstreak_swat_team");
    chargelevel = 0;
    weapon_damage = killstreak_bundles::get_weapon_damage("swat_team", self.maxhealth, attacker, weapon, meansofdeath, damage, idflags, chargelevel);
    if (!isdefined(weapon_damage)) {
        weapon_damage = killstreaks::get_old_damage(attacker, weapon, meansofdeath, damage, 1);
    }
    self thread function_2765a1f0(meansofdeath);
    return weapon_damage;
}

// Namespace swat_team/swat_team
// Params 3, eflags: 0x1 linked
// Checksum 0x163bf8c0, Offset: 0x5c28
// Size: 0x52
function function_cc3b1643(weapon, shitloc, smeansofdeath) {
    if (!isdefined(shitloc)) {
        return false;
    }
    if (shitloc != "head" && shitloc != "helmet") {
        return false;
    }
    return true;
}

// Namespace swat_team/swat_team
// Params 12, eflags: 0x1 linked
// Checksum 0x64a80124, Offset: 0x5c88
// Size: 0x142
function function_e588f057(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    if (isdefined(attacker) && attacker.team != self.team) {
        var_b25a1274 = function_cc3b1643(weapon, hitloc, meansofdeath);
        if (var_b25a1274) {
            damage *= 1.2;
        } else {
            damage *= 0.3;
        }
        if (damage < 0) {
            damage = 0;
        }
    }
    damage = self killstreaks::ondamageperweapon("swat_team", attacker, damage, idflags, meansofdeath, weapon, self.maxhealth, undefined, self.lowhealth, undefined, 0, undefined, 1, 1);
    return damage;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x8f2ab0cc, Offset: 0x5dd8
// Size: 0x3e
function function_7fac6670(swat_gunner) {
    swat_gunner.blindaim = 1;
    swat_gunner.script_accuracy = 0.99;
    swat_gunner.var_b6eabf3b = 400;
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0xe580c2d, Offset: 0x5e20
// Size: 0x334
function function_ab667e1c(owner, helicopter) {
    assert(isdefined(owner.swat_team));
    assert(isdefined(helicopter));
    aitypes = level.var_1e18ffa0[#"axis"];
    if (isdefined(owner.team) && owner.team == #"allies") {
        aitypes = level.var_1e18ffa0[#"allies"];
    }
    owner.var_e60e2941 = [];
    helicopter.var_e60e2941 = [];
    swat_gunner = spawnactor(aitypes[0], helicopter.origin, (0, 0, 0), "swat_gunner");
    swat_gunner linkto(helicopter, "tag_driver", (0, 0, 0), (0, 0, 0));
    swat_gunner.ai.var_f185cb34 = 1;
    if (!isdefined(owner.var_e60e2941)) {
        owner.var_e60e2941 = [];
    } else if (!isarray(owner.var_e60e2941)) {
        owner.var_e60e2941 = array(owner.var_e60e2941);
    }
    owner.var_e60e2941[owner.var_e60e2941.size] = swat_gunner;
    if (!isdefined(helicopter.var_e60e2941)) {
        helicopter.var_e60e2941 = [];
    } else if (!isarray(helicopter.var_e60e2941)) {
        helicopter.var_e60e2941 = array(helicopter.var_e60e2941);
    }
    helicopter.var_e60e2941[helicopter.var_e60e2941.size] = swat_gunner;
    swat_gunner setentityowner(self);
    swat_gunner setteam(owner.team);
    swat_gunner.ignoreall = 1;
    swat_gunner.ignoreme = 1;
    swat_gunner.ai.swat_gunner = 1;
    swat_gunner ai::gun_remove();
    swat_gunner function_7fac6670(swat_gunner);
    swat_gunner thread function_416a0a80(owner);
    swat_gunner thread function_67260255(swat_gunner, helicopter);
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x78a9b2a9, Offset: 0x6160
// Size: 0x22e
function function_a543b380(player) {
    if (!isalive(player) || player.sessionstate != "playing") {
        return false;
    }
    if (self.owner === player) {
        return false;
    }
    if (player.team == self.team) {
        return false;
    }
    if (player.team == #"spectator") {
        return false;
    }
    if (!player playerads()) {
        return false;
    }
    weapon = player getcurrentweapon();
    if (!isdefined(weapon) || !isdefined(weapon.rootweapon)) {
        return false;
    }
    if (weapon.rootweapon != getweapon(#"shotgun_semiauto_t8")) {
        return false;
    }
    if (!weaponhasattachment(weapon, "uber")) {
        return false;
    }
    distsq = distancesquared(self.origin, player.origin);
    if (distsq > 900 * 900) {
        return false;
    }
    if (!util::within_fov(self.origin, self.angles, player.origin, cos(45))) {
        return false;
    }
    if (!util::within_fov(player.origin, player getplayerangles(), self.origin, cos(45))) {
        return false;
    }
    return true;
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x1 linked
// Checksum 0xa8339232, Offset: 0x6398
// Size: 0x1d4
function function_18a9058c() {
    self endon(#"death");
    self.ai.var_e90b47c1 = gettime();
    while (isalive(self)) {
        if (isdefined(self.ai.var_e90b47c1) && gettime() <= self.ai.var_e90b47c1) {
            wait 1;
            continue;
        }
        players = getplayers();
        foreach (player in players) {
            if (!function_a543b380(player)) {
                continue;
            }
            if (self cansee(player)) {
                self.health += 1;
                self dodamage(1, player.origin, undefined, undefined, "torso_lower", "MOD_UNKNOWN", 0, getweapon("eq_swat_grenade"), 0, 1);
                self.ai.var_e90b47c1 = gettime() + randomintrange(6000, 13000);
                break;
            }
        }
        wait 1;
    }
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x5 linked
// Checksum 0x91e7b93f, Offset: 0x6578
// Size: 0x96
function private function_75277c27(tacpoint, context) {
    if (tacpoint.ceilingheight >= 4000) {
        /#
            recordsphere(tacpoint.origin, 2, (0, 1, 0), "<dev string:x3b>");
        #/
        return true;
    }
    /#
        recordsphere(tacpoint.origin, 2, (1, 0, 0), "<dev string:x3b>");
    #/
    return false;
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x5 linked
// Checksum 0x8506c091, Offset: 0x6618
// Size: 0xa6
function private function_7d90f954(origin, context) {
    if (ispointonnavmesh(origin, 45)) {
        /#
            recordsphere(origin + (0, 0, 10), 2, (0, 1, 0), "<dev string:x3b>");
        #/
        return true;
    }
    /#
        recordsphere(origin + (0, 0, 10), 2, (1, 0, 0), "<dev string:x3b>");
    #/
    return false;
}

// Namespace swat_team/swat_team
// Params 3, eflags: 0x5 linked
// Checksum 0x87eca7a4, Offset: 0x66c8
// Size: 0x104
function private function_9153c267(origin, context, verticaloffset) {
    if (isdefined(level.var_e071ed64) && level.var_e071ed64) {
        destination = origin + (0, 0, verticaloffset);
        var_baa92af9 = ispointinnavvolume(destination, "navvolume_big");
        if (var_baa92af9) {
            /#
                recordsphere(origin + (0, 0, 20), 2, (0, 1, 0), "<dev string:x3b>");
            #/
            return true;
        }
        /#
            recordsphere(origin + (0, 0, 20), 2, (1, 0, 0), "<dev string:x3b>");
        #/
        return false;
    }
    return true;
}

// Namespace swat_team/swat_team
// Params 3, eflags: 0x5 linked
// Checksum 0x73103d18, Offset: 0x67d8
// Size: 0x160
function private function_accec5c5(origin, context, verticaloffset) {
    if (!function_d15dd929(origin)) {
        return false;
    }
    mask = 1;
    radius = 30;
    trace = physicstrace(origin + (0, 0, verticaloffset), origin + (0, 0, 10), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), mask);
    if (trace[#"fraction"] < 1) {
        /#
            recordsphere(origin + (0, 0, 20), 2, (1, 0, 0), "<dev string:x3b>");
        #/
        return false;
    }
    /#
        recordsphere(origin + (0, 0, 20), 2, (0, 1, 0), "<dev string:x3b>");
    #/
    return true;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x4873cb77, Offset: 0x6940
// Size: 0x9e
function function_d15dd929(origin) {
    result = function_9cc082d2(origin + (0, 0, 100), 200);
    if (isdefined(result[#"materialflags"]) && result[#"materialflags"] & 2) {
        return false;
    }
    if (!ispointonnavmesh(origin, 16, 1)) {
        return false;
    }
    return true;
}

/#

    // Namespace swat_team/swat_team
    // Params 1, eflags: 0x0
    // Checksum 0xbb2d6b3c, Offset: 0x69e8
    // Size: 0xbc
    function debug_water(tpoint) {
        if (!function_d15dd929(tpoint.origin)) {
            /#
                record3dtext("<dev string:xf5>", tpoint.origin + (0, 0, 40), (1, 1, 1), "<dev string:x3b>");
            #/
            /#
                recordline(tpoint.origin + (0, 0, 40), tpoint.origin, (1, 1, 1), "<dev string:x3b>");
            #/
        }
    }

#/

// Namespace swat_team/swat_team
// Params 3, eflags: 0x1 linked
// Checksum 0xbdab3cfc, Offset: 0x6ab0
// Size: 0xf2
function function_6dc6bc6b(origins, context, verticaloffset) {
    assert(isdefined(origins) && origins.size);
    filteredpoints = [];
    foreach (origin in origins) {
        if (function_accec5c5(origin, context, verticaloffset)) {
            filteredpoints[filteredpoints.size] = origin;
            break;
        }
        waitframe(1);
    }
    return filteredpoints;
}

// Namespace swat_team/swat_team
// Params 3, eflags: 0x5 linked
// Checksum 0x4907b75a, Offset: 0x6bb0
// Size: 0x148
function private function_fc826e6(tacpoints, context, verticaloffset) {
    assert(isdefined(tacpoints) && tacpoints.size);
    filteredpoints = [];
    foreach (tacpoint in tacpoints) {
        /#
            debug_water(tacpoint);
        #/
        if (function_75277c27(tacpoint, context) && function_7d90f954(tacpoint.origin, context) && function_9153c267(tacpoint.origin, context, verticaloffset)) {
            filteredpoints[filteredpoints.size] = tacpoint.origin;
        }
    }
    return filteredpoints;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0xd8e3cd62, Offset: 0x6d00
// Size: 0xbc
function private function_187f6d8f(tacpoints) {
    assert(isdefined(tacpoints) && tacpoints.size);
    points = [];
    foreach (tacpoint in tacpoints) {
        points[points.size] = tacpoint.origin;
    }
    return points;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x5679455d, Offset: 0x6dc8
// Size: 0x4e
function function_3b759619(var_1c996690) {
    result = function_9cc082d2(var_1c996690 + (0, 0, 100), 200);
    if (isdefined(result)) {
        return true;
    }
    return false;
}

// Namespace swat_team/swat_team
// Params 4, eflags: 0x1 linked
// Checksum 0xd3b896b3, Offset: 0x6e20
// Size: 0x3f8
function function_263d3e9e(var_1c996690, context, owner, secondattempt = 0) {
    if (getdvarint(#"hash_60d47d611bbc3bed", 1)) {
        if (!function_3b759619(var_1c996690)) {
            var_986a13c3 = getclosesttacpoint(var_1c996690);
            if (isdefined(var_986a13c3)) {
                var_1c996690 = var_986a13c3.origin;
            }
        }
        verticaloffset = getstartorigin(var_1c996690, (0, 0, 0), "ai_swat_rifle_ent_litlbird_rappel_stn_vehicle2")[2] - var_1c996690[2];
        if (function_7d90f954(var_1c996690, context) && function_9153c267(var_1c996690, context, verticaloffset)) {
            if (function_accec5c5(var_1c996690, context, verticaloffset)) {
                return var_1c996690;
            }
        }
        cylinder = ai::t_cylinder(var_1c996690, 2000, 200);
        var_68860686 = ai::t_cylinder(var_1c996690, 100, 200);
        tacpoints = tacticalquery("swat_team_deploy", var_1c996690, cylinder, var_68860686);
        var_c65dd8e7 = undefined;
        if (isdefined(tacpoints) && tacpoints.size) {
            var_c65dd8e7 = arraycopy(tacpoints);
            tacpoints = function_fc826e6(tacpoints, context, verticaloffset);
            waitframe(1);
            if (tacpoints.size) {
                tacpoints = arraysortclosest(tacpoints, var_1c996690);
                filteredpoints = function_6dc6bc6b(tacpoints, context, verticaloffset);
                if (isdefined(filteredpoints[0])) {
                    /#
                        recordsphere(filteredpoints[0] + (0, 0, 70), 4, (1, 0.5, 0), "<dev string:x3b>");
                    #/
                    return filteredpoints[0];
                } else {
                    var_c71b63fa = arraygetclosest(var_1c996690, tacpoints);
                    /#
                        recordsphere(var_c71b63fa + (0, 0, 70), 4, (0, 1, 1), "<dev string:x3b>");
                    #/
                    return var_c71b63fa;
                }
            }
        }
        if (!secondattempt && isdefined(var_c65dd8e7) && var_c65dd8e7.size) {
            points = function_187f6d8f(var_c65dd8e7);
            if (isdefined(points)) {
                var_54746e33 = arraygetfarthest(var_1c996690, points);
                if (isdefined(var_54746e33)) {
                    /#
                        recordsphere(var_54746e33, 4, (0, 1, 1), "<dev string:x3b>");
                    #/
                    return function_263d3e9e(var_54746e33, context, owner, 1);
                }
            }
        }
    }
    return var_1c996690;
}

// Namespace swat_team/swat_team
// Params 3, eflags: 0x0
// Checksum 0xd525e474, Offset: 0x7220
// Size: 0xf6
function function_fe13a227(helicopter, var_1c996690, destination) {
    helicopter endon(#"death", #"payload_delivered", #"hash_216c905d79c8bbea");
    while (true) {
        /#
            recordsphere(var_1c996690, 4, (1, 0.5, 0), "<dev string:x3b>");
            recordsphere(destination, 4, (1, 0.5, 0), "<dev string:x3b>");
            recordline(var_1c996690, destination, (1, 0.5, 0), "<dev string:x3b>");
        #/
        waitframe(1);
    }
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0x85877a5f, Offset: 0x7320
// Size: 0x2c6
function function_2bade425(owner, helicopter) {
    aitypes = level.var_1e18ffa0[#"axis"];
    if (isdefined(owner.team) && owner.team == #"allies") {
        aitypes = level.var_1e18ffa0[#"allies"];
    }
    for (i = 0; i < 2; i++) {
        swat = spawnactor(aitypes[i], (-1000, 0, 0), (0, 0, 0), "swat");
        if (!isdefined(self.swat_team)) {
            self.swat_team = [];
        } else if (!isarray(self.swat_team)) {
            self.swat_team = array(self.swat_team);
        }
        self.swat_team[self.swat_team.size] = swat;
        swat setentityowner(self);
        swat setteam(self.team);
        swat.ignoreall = 1;
        swat.ignoreme = 1;
        swat clientfield::set("enemyvehicle", 1);
        obj_set("swat_member", swat);
        swat.ai.var_2b570fa6 = "parametric_traverse@traversal";
        if (self.team == #"allies") {
            if (i == 0) {
                swat.voxid = 2;
            } else {
                swat.voxid = 3;
            }
        } else if (i == 0) {
            swat.voxid = 1;
        } else {
            swat.voxid = 4;
        }
        swat pathmode("dont move");
        swat callback::function_d8abfc3d(#"on_ai_killed", &function_d86da2e8);
    }
}

// Namespace swat_team/swat_team
// Params 4, eflags: 0x5 linked
// Checksum 0xdb9c47f0, Offset: 0x75f0
// Size: 0x600
function private function_820e7c92(owner, var_1c996690, nodes, context) {
    owner endoncallback(&function_d524c2b8, #"disconnect", #"joined_team", #"joined_spectators");
    level endon(#"game_ended");
    assert(isdefined(var_1c996690));
    var_1c996690 = function_263d3e9e(var_1c996690, context, owner);
    destination = getstartorigin(var_1c996690, (0, 0, 0), "ai_swat_rifle_ent_litlbird_rappel_stn_vehicle2");
    var_6aa266d6 = helicopter::getvalidrandomstartnode(destination).origin;
    helicopter = spawn_swat_helicopter(owner, var_6aa266d6, vectortoangles(owner.origin - var_6aa266d6), context);
    helicopter endon(#"death", #"hash_216c905d79c8bbea");
    helicopter.hardpointtype = "swat_team";
    /#
        helicopter thread function_fe13a227(helicopter, var_1c996690, destination);
    #/
    function_ab667e1c(owner, helicopter);
    function_2bade425(owner, helicopter);
    function_ab26fd70(helicopter);
    assert(isdefined(owner.swat_team));
    position = 0;
    foreach (swat in owner.swat_team) {
        if (isdefined(swat) && !function_3132f113(swat)) {
            aiutility::addaioverridedamagecallback(swat, &function_e588f057);
            swat linkto(helicopter, "tag_origin", (0, 0, 0), (0, 0, 0));
            swat thread function_8fa2faa5(swat, helicopter, position);
            swat thread function_ab6f69a1(swat);
            swat thread function_18a9058c();
            owner thread function_67260255(swat, helicopter, context.killstreak_id);
            position++;
        }
    }
    helicopter thread function_67c394f2(helicopter, destination);
    helicopter waittill(#"reached_destination");
    if (isdefined(context.ir_model)) {
        context.ir_model notify(#"hash_1e4c945d50deb21d");
    }
    helicopter thread function_5ca48510(helicopter, var_1c996690);
    wait_start = gettime();
    while (helicopter.origin[2] - var_1c996690[2] > 620 && gettime() - wait_start < 1000) {
        wait 0.1;
    }
    level thread function_61baa879(helicopter);
    position = 0;
    foreach (swat in owner.swat_team) {
        if (isdefined(swat) && !function_3132f113(swat) && isalive(swat)) {
            if (position == 0) {
                swat thread swat_deploy(swat, helicopter, position, nodes[position], 1);
            } else {
                swat thread swat_deploy(swat, helicopter, position, nodes[position], 0);
            }
        }
        position++;
    }
    wait 6.4;
    helicopter thread function_21f27c75(helicopter);
    context.deployed = 1;
    helicopter thread function_9fe56d0b(helicopter);
    helicopter notify(#"payload_delivered");
    owner notify(#"payload_delivered");
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0x8a164c00, Offset: 0x7bf8
// Size: 0xc4
function function_5479b133(team, killstreak_id) {
    self endon(#"payload_delivered", #"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist");
    self waittill(#"payload_fail");
    if (isdefined(self.var_6c0553ea.deployed) && self.var_6c0553ea.deployed) {
        return;
    }
    self stopkillstreak(self.var_6c0553ea);
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0xdfb7aa51, Offset: 0x7cc8
// Size: 0x152
function function_2765a1f0(meansofdeath) {
    if (!isdefined(self.ai.var_826ef4c7)) {
        self.ai.var_826ef4c7 = gettime();
    }
    vo_type = "generic_pain";
    if (meansofdeath === "MOD_MELEE" || meansofdeath === "MOD_MELEE_WEAPON_BUTT") {
        vo_type = "stab_pain";
    } else if (isdefined(self.var_40543c03)) {
        switch (self.var_40543c03) {
        case #"fire":
            vo_type = "fire_pain";
            break;
        case #"flash":
        case #"emp":
        case #"electrical":
            vo_type = "flash_pain";
            break;
        }
    }
    if (gettime() >= self.ai.var_826ef4c7) {
        self thread registerrein_amb(vo_type);
        self.ai.var_826ef4c7 = randomintrange(2000, 3500);
    }
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0xa1ea40ef, Offset: 0x7e28
// Size: 0x60a
function private registerrein_amb(type) {
    self endon(#"death");
    if (!isdefined(level.var_bf13c7cf)) {
        level.var_bf13c7cf = [];
        array::add(level.var_bf13c7cf, #"hash_2416186b2c2fd1a8");
        array::add(level.var_bf13c7cf, #"hash_5ed736ce5677e90");
        array::add(level.var_bf13c7cf, #"hash_6ac3aef794ea4b07");
    }
    if (!isdefined(level.var_afebcc7e)) {
        level.var_afebcc7e = [];
        array::add(level.var_afebcc7e, #"hash_310164c2facacc31");
        array::add(level.var_afebcc7e, #"hash_c3ec7c69991c32d");
        array::add(level.var_afebcc7e, #"hash_44db3e21d3c99dd6");
    }
    if (!isdefined(level.var_6254ffb6)) {
        level.var_6254ffb6 = [];
        array::add(level.var_6254ffb6, #"hash_656973028d759c26");
        array::add(level.var_6254ffb6, #"hash_1239ec12044b3fd6");
        array::add(level.var_6254ffb6, #"hash_590e7ce5d23bd0f5");
    }
    if (!isdefined(level.var_383a6948)) {
        level.var_383a6948 = [];
        array::add(level.var_383a6948, #"hash_44e29c9d2df27e17");
        array::add(level.var_383a6948, #"hash_25c2538c4892d193");
        array::add(level.var_383a6948, #"hash_1af511ba5412916c");
    }
    if (!isdefined(self.voxid)) {
        return;
    }
    switch (type) {
    case #"swat_arrive":
        self playsound("vox_swa" + self.voxid + "_ult_swat_arrive");
        break;
    case #"swat_destroyed":
        self playsound("vox_swa" + self.voxid + "_ult_swat_destroyed");
        break;
    case #"swat_engaging":
        self playsound("vox_swa" + self.voxid + "_ult_swat_engaging");
        break;
    case #"swat_kill":
        self playsound("vox_swa" + self.voxid + "_ult_swat_kill");
        break;
    case #"swat_ready":
        self playsound("vox_swa" + self.voxid + "_ult_swat_ready");
    case #"generic_pain":
        if (self.voxid == 1) {
            self playsound(array::random(level.var_bf13c7cf));
        } else if (self.voxid == 2) {
            self playsound(array::random(level.var_afebcc7e));
        } else if (self.voxid == 3) {
            self playsound(array::random(level.var_6254ffb6));
        } else if (self.voxid == 4) {
            self playsound(array::random(level.var_383a6948));
        }
        break;
    case #"flash_pain":
        if (randomint(100) > 50) {
            self playsound("vox_swa" + self.voxid + "_ult_swat_electro");
        } else {
            self playsound("vox_swa" + self.voxid + "_ult_swat_blind");
        }
        break;
    case #"fire_pain":
        self playsound("vox_swa" + self.voxid + "_ult_swat_burn_dead");
        break;
    case #"stab_pain":
        self playsound("vox_swa" + self.voxid + "_ult_swat_stabbed");
        break;
    default:
        break;
    }
}

// Namespace swat_team/swat_team
// Params 3, eflags: 0x1 linked
// Checksum 0xdd755b55, Offset: 0x8440
// Size: 0x2a4
function spawn_swat_team(owner, context, origin) {
    if (!isdefined(owner.swat_team)) {
        self.swat_team = [];
    } else {
        owner swat_cleanup();
        owner notify(#"hash_71a1db99eb99dcff");
    }
    owner.var_6c0553ea = context;
    owner.var_6c0553ea.kills = 0;
    owner.var_6c0553ea.clear_kills = 0;
    zone = function_5615237b(origin);
    var_1c996690 = undefined;
    nodes = [];
    owner killstreaks::play_killstreak_start_dialog("swat_team", self.team, context.killstreak_id);
    owner thread function_5479b133(owner.team, context.killstreak_id);
    if (isdefined(zone)) {
        nodes = getnodearray(zone.target, "targetname");
        for (i = 0; i < nodes.size; i++) {
            if (nodes[i].type == "BAD NODE") {
                nodes = function_b777d194(origin);
                break;
            }
        }
    } else {
        nodes = function_b777d194(origin);
    }
    if (!isdefined(nodes)) {
        nodes = [];
        for (i = 0; i < 2; i++) {
            if (!isdefined(nodes)) {
                nodes = [];
            } else if (!isarray(nodes)) {
                nodes = array(nodes);
            }
            nodes[nodes.size] = (0, 0, 0);
        }
    }
    var_1c996690 = origin;
    owner thread swat_loop(context.killstreak_id);
    owner function_820e7c92(owner, var_1c996690, nodes, context);
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x5 linked
// Checksum 0x45c7f47c, Offset: 0x86f0
// Size: 0xb0
function private function_d1c52e08() {
    self endon(#"death");
    while (true) {
        waittillframeend();
        if (isdefined(self.enemy) && isplayer(self.enemy) && self cansee(self.enemy)) {
            self.holdfire = !self targetting_delay::function_1c169b3a(self.enemy);
        } else {
            self.holdfire = 0;
        }
        waitframe(1);
    }
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x1 linked
// Checksum 0x54449ccc, Offset: 0x87a8
// Size: 0x1ae
function function_48d57bc8() {
    self endon(#"death");
    if (isdefined(level.var_a6a32c8a) && level.var_a6a32c8a) {
        return;
    }
    if (isactor(self) && self.archetype === #"human") {
        laser_weapon = getweapon(self.weapon.name, "steadyaim");
        self ai::gun_remove();
        self ai::gun_switchto(laser_weapon, "right");
        wait 2;
        if (isdefined(self.var_e09b732c) && self.var_e09b732c) {
            return;
        }
        clientfield::set("swat_light_strobe", 1);
        self.var_ab84134 = function_60d95f53() / 1000;
        self thread targetting_delay::function_7e1a12ce();
        self thread function_d1c52e08();
        self thread function_ace0a9bc();
        self thread function_416a0a80(self.script_owner);
        self.killstreaktype = "swat_team";
        self.var_259f6c17 = 1;
    }
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0xbe5ed369, Offset: 0x8960
// Size: 0x5fe
function function_8821879c(killstreak_id) {
    self endon(#"hash_71a1db99eb99dcff", #"disconnect", #"joined_team");
    if (!isdefined(self.var_6c0553ea)) {
        return;
    }
    if (!isdefined(self.var_6c0553ea.remoteweapon)) {
        return;
    }
    if (!isdefined(self.var_6c0553ea.remoteweapon.usetrigger)) {
        return;
    }
    self.var_6c0553ea.remoteweapon.usetrigger endon(#"death");
    while (isdefined(self.var_6c0553ea) && isdefined(self.var_6c0553ea.remoteweapon)) {
        if (!isdefined(self.var_6c0553ea.remoteweapon.usetrigger)) {
            break;
        }
        res = self.var_6c0553ea.remoteweapon.usetrigger waittill(#"trigger", #"death");
        if (res._notify == "death") {
            break;
        }
        if (self.var_976238cf == #"swat_team") {
            waitframe(1);
            if (!self function_55acff10() && !(isdefined(self.is_capturing_own_supply_drop) && self.is_capturing_own_supply_drop)) {
                ordering = 1;
                timer = gettime() + 50;
                self notify(#"hash_388d15e349a6a017");
                if (self.var_5f43fa0c == "swat_escort") {
                    self.var_5f43fa0c = "swat_guard";
                    self swat_guard();
                    if (isdefined(self.var_6c0553ea.remoteweapon)) {
                        self.var_6c0553ea.remoteweapon function_944f0911("");
                    }
                    wait 3;
                    if (isdefined(self.var_6c0553ea.remoteweapon)) {
                        if (!self gamepadusedlast()) {
                            self.var_6c0553ea.remoteweapon function_944f0911(#"hash_600af0ac4af0b090");
                        } else {
                            self.var_6c0553ea.remoteweapon function_944f0911(#"hash_60c7465070c7985c");
                        }
                    }
                } else {
                    self.var_5f43fa0c = "swat_escort";
                    self gestures::function_56e00fbf(#"gestable_order_follow", undefined, 0);
                    self function_d738127f();
                    self thread swat_escort();
                    if (isdefined(self.var_6c0553ea.remoteweapon)) {
                        self.var_6c0553ea.remoteweapon function_944f0911("");
                    }
                    wait 3;
                    if (isdefined(self.var_6c0553ea.remoteweapon)) {
                        if (!self gamepadusedlast()) {
                            self.var_6c0553ea.remoteweapon function_944f0911(#"hash_167e638f51287532");
                        } else {
                            self.var_6c0553ea.remoteweapon function_944f0911(#"hash_6800108794068996");
                        }
                    }
                }
            }
        } else if (isdefined(ordering) && ordering && !self util::use_button_held()) {
            ordering = 0;
        }
        if (isdefined(self.is_capturing_own_supply_drop) && self.is_capturing_own_supply_drop) {
            if (isdefined(self.var_6c0553ea.remoteweapon)) {
                self.var_6c0553ea.remoteweapon function_944f0911("");
            }
            wait 5;
            if (isdefined(self.var_6c0553ea.remoteweapon)) {
                if (self.var_5f43fa0c == "swat_guard") {
                    if (!self gamepadusedlast()) {
                        self.var_6c0553ea.remoteweapon function_944f0911(#"hash_600af0ac4af0b090");
                    } else {
                        self.var_6c0553ea.remoteweapon function_944f0911(#"hash_60c7465070c7985c");
                    }
                    continue;
                }
                if (!self gamepadusedlast()) {
                    self.var_6c0553ea.remoteweapon function_944f0911(#"hash_600af0ac4af0b090");
                    continue;
                }
                self.var_6c0553ea.remoteweapon function_944f0911(#"hash_60c7465070c7985c");
            }
        }
    }
    waitframe(1);
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x1 linked
// Checksum 0x7c933ae8, Offset: 0x8f68
// Size: 0xaa
function function_47e16e28() {
    self endon(#"hash_71a1db99eb99dcff", #"disconnect", #"joined_team");
    while (self.var_976238cf == #"swat_team") {
        waitframe(1);
    }
    if (isdefined(self.var_6c0553ea.remoteweapon)) {
        self.var_6c0553ea.remoteweapon.usetrigger delete();
        self.var_6c0553ea.remoteweapon = undefined;
    }
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0xc2ba34ea, Offset: 0x9020
// Size: 0x300
function swat_loop(killstreak_id) {
    self endon(#"hash_71a1db99eb99dcff");
    self endoncallback(&function_d524c2b8, #"disconnect", #"joined_team");
    endtime = gettime() + self.var_6c0553ea.time;
    self.var_976238cf = #"swat_team";
    self.var_5f43fa0c = "swat_escort";
    function_4c2ed78d(self, 1);
    self thread swat_escort(0);
    self waittill(#"payload_delivered");
    if (isplayer(self)) {
        if (!self gamepadusedlast()) {
            self.var_6c0553ea.remoteweapon = self createremoteweapontrigger(#"hash_167e638f51287532");
        } else {
            self.var_6c0553ea.remoteweapon = self createremoteweapontrigger(#"hash_6800108794068996");
        }
    }
    self thread function_47e16e28();
    self thread function_8821879c(killstreak_id);
    while (isdefined(self.var_6c0553ea)) {
        alldead = 1;
        for (i = 0; i < 2; i++) {
            if (!isdefined(self.swat_team[i])) {
                continue;
            }
            alldead = 0;
            break;
        }
        if (alldead || gettime() > endtime) {
            if (alldead) {
                self globallogic_audio::flush_killstreak_dialog_on_player(killstreak_id);
                self globallogic_audio::play_taacom_dialog("destroyed", "swat_team");
            } else if (gettime() > endtime) {
                self globallogic_audio::play_taacom_dialog("timeout", "swat_team");
            }
            self function_d738127f();
            start_swat_team_leave();
            if (isdefined(self.var_6c0553ea.remoteweapon)) {
                self.var_6c0553ea.remoteweapon.usetrigger delete();
                self.var_6c0553ea.remoteweapon = undefined;
            }
            break;
        }
        waitframe(1);
    }
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0x13e26faa, Offset: 0x9328
// Size: 0x2c
function sort_by_score(left, right) {
    return left.score > right.score;
}

// Namespace swat_team/swat_team
// Params 3, eflags: 0x5 linked
// Checksum 0xc9f11016, Offset: 0x9360
// Size: 0x162
function private function_2d44c54f(var_eca4744a, var_56bd1bef, nodes) {
    tacpoint = getclosesttacpoint(var_56bd1bef);
    foreach (node in nodes) {
        withinfov = vectordot(var_eca4744a, vectornormalize(node.origin - var_56bd1bef) > cos(30));
        if (withinfov && function_96c81b85(tacpoint, node.origin)) {
            node.score = 100;
            continue;
        }
        node.score = 0;
    }
    return array::merge_sort(nodes, &sort_by_score);
}

// Namespace swat_team/swat_team
// Params 5, eflags: 0x1 linked
// Checksum 0xa5db7e44, Offset: 0x94d0
// Size: 0x2f6
function function_a4ab9672(swat, owner, var_eca4744a, var_56bd1bef, forced = 0) {
    /#
        recordsphere(var_56bd1bef, 8, (0, 1, 1), "<dev string:x3b>");
    #/
    nodes = getnodesinradiussorted(var_56bd1bef, 600, 64, 300, "Path");
    if (nodes.size) {
        if (!forced) {
            nodes_sorted = function_2d44c54f(var_eca4744a, var_56bd1bef, nodes);
        } else {
            nodes_sorted = nodes;
        }
        foreach (node in nodes_sorted) {
            if (canclaimnode(node, owner.team) && !isdefined(node.owner)) {
                /#
                    recordsphere(node.origin, 4, (1, 0.5, 0), "<dev string:x3b>");
                    recordline(owner.origin, node.origin, (1, 0.5, 0), "<dev string:x3b>");
                #/
                if (!swat.keepclaimednode) {
                    swat setgoal(node);
                    swat usecovernode(node);
                    swat.var_ecdaf39 = node.origin;
                    swat.var_1824dd22 = node;
                }
                break;
            }
        }
        return;
    }
    points = function_b777d194(var_56bd1bef);
    for (i = 0; i < 2; i++) {
        if (owner.swat_team[i] == swat) {
            swat setgoal(points[i]);
            swat.var_ecdaf39 = points[i];
            return;
        }
    }
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0xc3575684, Offset: 0x97d0
// Size: 0xaa
function function_7b3ad3fe(swat, location) {
    iterationlimit = getdvarint(#"hkai_pathfinditerationlimit", 1800);
    path = generatenavmeshpath(swat.origin, location, swat, undefined, undefined, iterationlimit);
    if (isdefined(path) && path.status === "succeeded") {
        return true;
    }
    return false;
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0x54fd0d94, Offset: 0x9888
// Size: 0x78e
function function_4c2ed78d(owner, forced = 0) {
    result = function_9cc082d2(owner.origin, 1000);
    if (!isdefined(result)) {
        return;
    }
    owner_origin = result[#"point"];
    if (!isdefined(owner_origin)) {
        return;
    }
    enemies = getplayers();
    potentialenemies = [];
    foreach (enemy in enemies) {
        if (owner.team != enemy.team) {
            array::add(potentialenemies, enemy);
        }
    }
    if (!forced) {
        velocity = owner getvelocity();
        if (length(velocity) >= 20) {
            velocity = vectornormalize(velocity);
            owner.var_546b8137 = velocity;
        }
        if (isdefined(owner.var_546b8137)) {
            var_56bd1bef = owner_origin + vectorscale(vectornormalize(owner.var_546b8137), 200);
        } else {
            var_56bd1bef = owner_origin + vectorscale(anglestoforward(owner.angles), 200);
        }
    } else {
        var_56bd1bef = owner_origin;
    }
    result = function_9cc082d2(var_56bd1bef, 1000);
    if (isdefined(result)) {
        var_56bd1bef = result[#"point"];
    }
    if (!isdefined(var_56bd1bef) && (!isdefined(potentialenemies) || !potentialenemies.size)) {
        waitframe(1);
        return;
    }
    for (i = 0; i < 2; i++) {
        if (!isdefined(owner.swat_team[i])) {
            continue;
        }
        swat = owner.swat_team[i];
        if (isdefined(swat.ai.var_5cb410bc)) {
            continue;
        }
        if (!isdefined(swat.ai.var_b3e4c4fe)) {
            swat.ai.var_b3e4c4fe = gettime();
        }
        potentialenemies = array::remove_undefined(potentialenemies);
        if (isdefined(potentialenemies) && potentialenemies.size) {
            if (isdefined(swat.enemy)) {
                nearbyplayer = swat.enemy;
            } else {
                nearbyplayer = arraygetclosest(swat.origin, potentialenemies);
            }
            if (!isdefined(nearbyplayer)) {
                waitframe(1);
                continue;
            }
            var_470b2385 = distancesquared(swat.origin, nearbyplayer.origin);
            if (swat cansee(nearbyplayer) || var_470b2385 < 300 * 300) {
                waitframe(1);
                continue;
            }
            if (isdefined(nearbyplayer)) {
                if (gettime() < swat.ai.var_b3e4c4fe) {
                    waitframe(1);
                    continue;
                }
                tacpoint = getclosesttacpoint(nearbyplayer.origin);
                if (isdefined(tacpoint)) {
                    newpos = getclosestpointonnavmesh(tacpoint.origin, 200, self getpathfindingradius(), 1);
                    if (isdefined(newpos) && function_7b3ad3fe(swat, newpos)) {
                        swat setgoal(newpos, 1);
                        swat.ai.var_b3e4c4fe = randomintrange(4500, 6500);
                        continue;
                    } else {
                        cylinder = ai::t_cylinder(swat.origin, 1200, 200);
                        var_8f3583cf = ai::t_cylinder(swat.origin, 150, 200);
                        var_5af32875 = ai::t_cylinder(swat.origin, 300, 200);
                        tacpoints = tacticalquery("swat_tacquery_seek", swat.origin, cylinder, swat, var_8f3583cf, tacpoint.origin, var_5af32875);
                        if (isdefined(tacpoints) && tacpoints.size) {
                            swat setgoal(tacpoints[0].origin, 1);
                            swat.ai.var_b3e4c4fe = randomintrange(4500, 6500);
                            continue;
                        }
                    }
                }
            }
        }
        if (!isdefined(var_56bd1bef)) {
            waitframe(1);
            continue;
        }
        var_eca4744a = vectornormalize(var_56bd1bef - owner_origin);
        tacpoint = getclosesttacpoint(var_56bd1bef);
        shouldmove = 0;
        if (isdefined(tacpoint)) {
            if (forced) {
                shouldmove = 1;
            } else if (isdefined(swat.var_ecdaf39)) {
                shouldmove = distancesquared(var_56bd1bef, swat.var_ecdaf39) >= 600 * 600;
            } else {
                shouldmove = distancesquared(var_56bd1bef, swat.origin) >= 600 * 600;
            }
        }
        if (shouldmove) {
            function_a4ab9672(swat, owner, var_eca4744a, var_56bd1bef, forced);
        }
    }
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x47ca5c6c, Offset: 0xa020
// Size: 0x13e
function swat_escort(playgesture = 1) {
    owner = self;
    owner endon(#"hash_71a1db99eb99dcff", #"disconnect", #"joined_team");
    owner waittill(#"payload_delivered");
    owner function_d738127f();
    if (isdefined(owner) && playgesture) {
        owner gestures::function_56e00fbf(#"gestable_order_follow", undefined, 0);
    }
    while (true) {
        if (isdefined(owner) && owner.var_5f43fa0c == "swat_escort") {
            if (isdefined(level.var_6cfbe5a)) {
                [[ level.var_6cfbe5a ]]->waitinqueue(owner);
            }
            function_4c2ed78d(owner);
        }
        wait 1;
    }
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x1 linked
// Checksum 0x3339cada, Offset: 0xa168
// Size: 0x386
function swat_guard() {
    direction = self getplayerangles();
    direction_vec = anglestoforward(direction);
    eye = self geteye();
    direction_vec = (direction_vec[0] * 2000, direction_vec[1] * 2000, direction_vec[2] * 2000);
    trace = bullettrace(eye, eye + direction_vec, 0, self);
    position = getclosestpointonnavmesh(trace[#"position"]);
    if (!isdefined(position)) {
        var_2b4c258c = trace[#"position"] - eye;
        for (i = 0; i < 8; i++) {
            testpos = eye + vectorscale(var_2b4c258c, (8 - i) / 8);
            position = function_9cc082d2(testpos, 800);
            if (isdefined(position)) {
                position = position[#"point"];
                break;
            }
        }
    }
    if (!isdefined(position)) {
        return;
    }
    zone = function_5615237b(position);
    if (isdefined(zone)) {
        nodes = getnodearray(zone.target, "targetname");
        for (i = 0; i < nodes.size; i++) {
            if (nodes[i].type == "BAD NODE") {
                nodes = function_b777d194(position);
                break;
            }
        }
    } else {
        nodes = function_b777d194(position);
    }
    if (!isdefined(nodes)) {
        waitframe(1);
        return;
    }
    self function_59f58b93(position);
    self gestures::function_56e00fbf(#"gestable_battle_cry", undefined, 0);
    for (i = 0; i < 2; i++) {
        if (!isdefined(self.swat_team[i])) {
            return;
        }
        if (i == 0) {
            self.swat_team[i] thread registerrein_amb("swat_ready");
        }
        self.swat_team[i] setgoal(nodes[i]);
    }
    self.var_6c0553ea.clear_kills = 0;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0xf3fd7eeb, Offset: 0xa4f8
// Size: 0x1c
function function_d524c2b8(str_notify) {
    swat_cleanup();
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x81cb3c08, Offset: 0xa520
// Size: 0xbe
function function_a38d2d73(tacpoint) {
    players = getplayers();
    foreach (player in players) {
        if (distancesquared(tacpoint.origin, player.origin) <= 200 * 200) {
            return true;
        }
    }
    return false;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0xcd21ca94, Offset: 0xa5e8
// Size: 0xaa
function function_4670789f(tacpoint) {
    players = getplayers();
    foreach (player in players) {
        if (function_96c81b85(tacpoint, player.origin)) {
            return true;
        }
    }
    return false;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0xe571af60, Offset: 0xa6a0
// Size: 0xec
function private function_9cb166cd(tacpoints) {
    assert(isdefined(tacpoints) && tacpoints.size);
    filteredpoints = [];
    foreach (tacpoint in tacpoints) {
        if (!function_4670789f(tacpoint) && !function_a38d2d73(tacpoint)) {
            filteredpoints[filteredpoints.size] = tacpoint;
        }
    }
    return filteredpoints;
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0x7028a855, Offset: 0xa798
// Size: 0x218
function private function_e74b21de(owner) {
    if (isdefined(owner)) {
        origin = owner.origin;
        angles = owner getplayerangles();
    } else {
        origin = self.origin;
        angles = self.angles;
    }
    cylinder = ai::t_cylinder(self.origin, 1500, 250);
    var_84e7232 = origin;
    var_441c6196 = ai::t_cylinder(origin, 100, 250);
    tacpoints = tacticalquery("swat_team_leave", origin, self, cylinder, var_441c6196, var_84e7232);
    if (isdefined(tacpoints) && tacpoints.size) {
        tacpoints = function_9cb166cd(tacpoints);
        if (tacpoints.size) {
            tacpoint = array::random(tacpoints);
            return {#origin:tacpoint.origin, #angles:angles};
        }
    }
    tacpoints = tacticalquery("swat_team_leave_fallback", origin, self, cylinder, var_441c6196, var_84e7232);
    if (isdefined(tacpoints) && tacpoints.size) {
        tacpoints = function_9cb166cd(tacpoints);
        if (tacpoints.size) {
            tacpoint = array::random(tacpoints);
            return {#origin:tacpoint.origin, #angles:angles};
        }
    }
    return undefined;
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x1 linked
// Checksum 0x65c6f54a, Offset: 0xa9b8
// Size: 0x86
function start_swat_team_leave() {
    for (i = 0; i < 2; i++) {
        if (!isdefined(self.swat_team[i])) {
            continue;
        }
        if (isdefined(self.owner)) {
            self.owner notify(#"hash_71a1db99eb99dcff");
        }
        self.swat_team[i] thread swat_leave();
    }
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x1 linked
// Checksum 0xecb7773e, Offset: 0xaa48
// Size: 0x160
function function_ac0e6696() {
    self endon(#"death");
    level endon(#"game_ended");
    while (true) {
        players = getplayers();
        canbeseen = 0;
        foreach (player in players) {
            if (sighttracepassed(self geteye(), player geteye(), 0, undefined)) {
                canbeseen = 1;
                break;
            }
        }
        if (!canbeseen) {
            function_a00c5973("swat_member", self);
            util::wait_network_frame();
            self delete();
        }
        wait 0.5;
    }
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x1 linked
// Checksum 0x93c432b7, Offset: 0xabb0
// Size: 0x184
function swat_leave() {
    self endon(#"death");
    level endon(#"game_ended");
    if (isdefined(level.var_6cfbe5a)) {
        [[ level.var_6cfbe5a ]]->waitinqueue(self);
    }
    self.exit_spawn = function_e74b21de(self.script_owner);
    self clientfield::set("swat_rob_state", 1);
    if (isdefined(self.exit_spawn)) {
        self thread function_ac0e6696();
        self function_d4c687c9();
        self pathmode("move allowed");
        self.goalradius = 20;
        self setgoal(self.exit_spawn.origin, 0);
        self waittilltimeout(10, #"goal");
    }
    waittillframeend();
    function_a00c5973("swat_member", self);
    util::wait_network_frame();
    self delete();
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0xcaef932, Offset: 0xad40
// Size: 0x2f8
function swat_cleanup(destroy_heli) {
    if (gamestate::is_game_over()) {
        return;
    }
    if (!isdefined(destroy_heli)) {
        destroy_heli = 1;
    }
    self notify(#"hash_71a1db99eb99dcff");
    profilestart();
    if (isdefined(self.var_6c0553ea)) {
        for (i = self.swat_team.size; i >= 0; i--) {
            if (isdefined(self.swat_team[i]) && isalive(self.swat_team[i])) {
                self.swat_team[i] kill(self.swat_team[i].origin, undefined, undefined, undefined, 0, 1);
            }
        }
        if (isdefined(self.var_e60e2941)) {
            for (i = self.var_e60e2941.size; i >= 0; i--) {
                if (isdefined(self.var_e60e2941[i]) && isalive(self.var_e60e2941[i])) {
                    self.var_e60e2941[i] kill(self.var_e60e2941[i].origin, undefined, undefined, undefined, 0, 1);
                }
            }
        }
        if (isdefined(self.var_6c0553ea.helicopter)) {
            function_d4331865(self.var_6c0553ea.helicopter.rope);
            if (destroy_heli) {
                thread swat_helicopter_explode(self.var_6c0553ea.helicopter);
            }
        }
        if (isdefined(self.var_6c0553ea.ir_model)) {
            self.var_6c0553ea.ir_model notify(#"hash_1e4c945d50deb21d");
        }
        self function_d738127f();
        if (isdefined(self.var_6c0553ea.killstreak_id) && isdefined(self.var_6c0553ea.var_43dc1011)) {
            stopkillstreak(self.var_6c0553ea);
        }
        if (isdefined(self.var_6c0553ea.remoteweapon)) {
            self.var_6c0553ea.remoteweapon.usetrigger delete();
            self.var_6c0553ea.remoteweapon = undefined;
        }
        self.var_6c0553ea = undefined;
    }
    self.swat_team = [];
    profilestop();
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0x602f793d, Offset: 0xb040
// Size: 0x24
function function_d86da2e8(params) {
    function_a00c5973("swat_member", self);
}

// Namespace swat_team/swat_team
// Params 4, eflags: 0x1 linked
// Checksum 0x84243a75, Offset: 0xb070
// Size: 0x2d2
function function_610d3790(einflictor, victim, idamage, weapon) {
    attacker = self;
    if (!isdefined(attacker.var_6c0553ea)) {
        return;
    }
    if (isactor(einflictor)) {
        attacker.var_6c0553ea.kills++;
        if (attacker.var_6c0553ea.kills == 3) {
            scoreevents::processscoreevent(#"hash_7caba8ab83b5373f", attacker, victim, getweapon(#"swat_team"));
        }
        if (einflictor isatgoal()) {
            scoreevents::processscoreevent(#"hash_69a40144e52332f9", attacker, victim, getweapon(#"swat_team"));
        } else {
            attacker.var_6c0553ea.clear_kills++;
            if (attacker.var_6c0553ea.clear_kills == 2) {
                scoreevents::processscoreevent(#"hash_7e7146503217ca9c", attacker, victim, getweapon(#"swat_team"));
            }
        }
        return;
    }
    foreach (swat in attacker.swat_team) {
        if (isdefined(swat) && isdefined(swat.enemy) && swat.enemy == victim && swat attackedrecently(victim, 3)) {
            scoreevents::processscoreevent(#"hash_1f0ecf369a09e682", attacker, victim, getweapon(#"swat_team"));
            return;
        }
    }
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x5 linked
// Checksum 0xda02d73c, Offset: 0xb350
// Size: 0x21c
function private function_59f58b93(origin) {
    self function_d738127f();
    if (isdefined(self.var_6c0553ea.marker)) {
        self.var_6c0553ea.marker.origin = origin;
        self.var_6c0553ea.marker.team = self.team;
        self.var_6c0553ea.marker entityheadicons::setentityheadicon(self.pers[#"team"], self, self.var_6c0553ea.objective);
        objid = self.var_6c0553ea.marker.entityheadobjectives[self.var_6c0553ea.marker.entityheadobjectives.size - 1];
        objective_setinvisibletoall(objid);
        objective_setvisibletoplayer(objid, self);
    }
    self.var_6c0553ea.fx_marker = spawnfx(self.var_6c0553ea.fx_name, origin + (0, 0, 3), (0, 0, 1), (1, 0, 0));
    self.var_6c0553ea.fx_marker.team = self.team;
    triggerfx(self.var_6c0553ea.fx_marker);
    self.var_6c0553ea.fx_marker setinvisibletoall();
    self.var_6c0553ea.fx_marker setvisibletoplayer(self);
    self playsoundtoplayer(#"uin_mp_combat_bot_guard", self);
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x5 linked
// Checksum 0x681ff101, Offset: 0xb578
// Size: 0x92
function private function_d738127f() {
    if (!isdefined(self.var_6c0553ea)) {
        return;
    }
    if (isdefined(self.var_6c0553ea.marker)) {
        self.var_6c0553ea.marker entityheadicons::destroyentityheadicons();
    }
    if (isdefined(self.var_6c0553ea.fx_marker)) {
        self.var_6c0553ea.fx_marker delete();
        self.var_6c0553ea.fx_marker = undefined;
    }
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0xd019d469, Offset: 0xb618
// Size: 0x132
function function_5615237b(origin) {
    structs = struct::get_array("swat_zone", "variantname");
    if (!structs.size) {
        return undefined;
    }
    shortest = distancesquared(origin, structs[0].origin);
    best = structs[0];
    foreach (struct in structs) {
        newdist = distancesquared(origin, struct.origin);
        if (newdist < shortest) {
            shortest = newdist;
            best = struct;
        }
    }
    return best;
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0x723de26c, Offset: 0xb758
// Size: 0x236
function function_4c0ed253(location, context) {
    foreach (droplocation in level.droplocations) {
        if (distance2dsquared(droplocation, location) < 3600) {
            return false;
        }
    }
    if (context.perform_physics_trace === 1) {
        mask = 1;
        if (isdefined(context.tracemask)) {
            mask = context.tracemask;
        }
        radius = context.radius;
        trace = physicstrace(location + (0, 0, 5000), location + (0, 0, 10), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), undefined, mask);
        if (trace[#"fraction"] < 1) {
            if (!(isdefined(level.var_66da9c3c) && level.var_66da9c3c)) {
                return false;
            }
        }
    }
    result = function_9cc082d2(location + (0, 0, 100), 170);
    if (!isdefined(result)) {
        return false;
    }
    if (context.check_same_floor === 1 && abs(location[2] - self.origin[2]) > 96) {
        return false;
    }
    return true;
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0xac0101d2, Offset: 0xb998
// Size: 0x490
function islocationgood(location, context) {
    if (getdvarint(#"hash_60d47d611bbc3bed", 1)) {
        return function_4c0ed253(location, context);
    }
    foreach (droplocation in level.droplocations) {
        if (distance2dsquared(droplocation, location) < 3600) {
            return 0;
        }
    }
    if (context.perform_physics_trace === 1) {
        mask = 1;
        if (isdefined(context.tracemask)) {
            mask = context.tracemask;
        }
        radius = context.radius;
        trace = physicstrace(location + (0, 0, 5000), location + (0, 0, 10), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), undefined, mask);
        if (trace[#"fraction"] < 1) {
            if (!(isdefined(level.var_66da9c3c) && level.var_66da9c3c)) {
                return 0;
            }
        }
    }
    closestpoint = getclosestpointonnavmesh(location, max(context.max_dist_from_location, 24), context.dist_from_boundary);
    isvalidpoint = isdefined(closestpoint);
    if (isvalidpoint && context.check_same_floor === 1 && abs(location[2] - closestpoint[2]) > 96) {
        isvalidpoint = 0;
    }
    if (isvalidpoint && distance2dsquared(location, closestpoint) > context.max_dist_from_location * context.max_dist_from_location) {
        isvalidpoint = 0;
    }
    if (isdefined(level.var_e071ed64) && level.var_e071ed64) {
        destination = getstartorigin(location, (0, 0, 0), "ai_swat_rifle_ent_litlbird_rappel_stn_vehicle2");
        var_baa92af9 = ispointinnavvolume(destination, "navvolume_big");
        if (!var_baa92af9) {
            isvalidpoint = 0;
        }
    }
    /#
        if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
            if (!isvalidpoint) {
                otherclosestpoint = getclosestpointonnavmesh(location, getdvarfloat(#"scr_supply_drop_valid_location_radius_debug", 96), context.dist_from_boundary);
                if (isdefined(otherclosestpoint)) {
                    sphere(otherclosestpoint, context.max_dist_from_location, (1, 0, 0), 0.8, 0, 20, 1);
                }
            } else {
                sphere(closestpoint, context.max_dist_from_location, (0, 1, 0), 0.8, 0, 20, 1);
                util::drawcylinder(closestpoint, context.radius, 8000, 0.0166667, undefined, (0, 0.9, 0), 0.7);
            }
        }
    #/
    return isvalidpoint;
}

// Namespace swat_team/swat_team
// Params 0, eflags: 0x0
// Checksum 0xf67ae681, Offset: 0xbe30
// Size: 0x8c
function checkforemp() {
    self endon(#"hash_27be2db04a0908d5", #"spawned_player", #"disconnect", #"weapon_change", #"death", #"trigger_weapon_shutdown");
    self waittill(#"emp_jammed");
    self killstreaks::switch_to_last_non_killstreak_weapon();
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x0
// Checksum 0x986c971b, Offset: 0xbec8
// Size: 0xa6
function checkweaponchange(team, killstreak_id) {
    self endon(#"hash_27be2db04a0908d5", #"spawned_player", #"disconnect", #"trigger_weapon_shutdown", #"death");
    self waittill(#"weapon_change");
    stopkillstreak(self.var_6c0553ea);
    self notify(#"cleanup_marker");
}

// Namespace swat_team/swat_team
// Params 1, eflags: 0x1 linked
// Checksum 0xfbcf28c6, Offset: 0xbf78
// Size: 0x6a
function stopkillstreak(context) {
    if (isdefined(context.var_45453b2a) && context.var_45453b2a) {
        return;
    }
    killstreakrules::killstreakstop("swat_team", context.var_43dc1011, context.killstreak_id);
    context.var_45453b2a = 1;
}

// Namespace swat_team/swat_team
// Params 3, eflags: 0x0
// Checksum 0xb18bb5c5, Offset: 0xbff0
// Size: 0x78
function addoffsetontopoint(point, direction, offset) {
    angles = vectortoangles((direction[0], direction[1], 0));
    offset_world = rotatepoint(offset, angles);
    return point + offset_world;
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0x42ad41a7, Offset: 0xc070
// Size: 0x18c
function obj_set(str_objective, e_target) {
    n_obj_id = gameobjects::get_next_obj_id();
    if (!isdefined(e_target.a_n_objective_ids)) {
        e_target.a_n_objective_ids = [];
    }
    e_target.a_n_objective_ids[str_objective] = n_obj_id;
    objective_add(n_obj_id, "active", e_target, str_objective);
    function_3ae6fa3(n_obj_id, e_target.team, 1);
    objective_setteam(n_obj_id, e_target.team);
    n_obj_id = gameobjects::get_next_obj_id();
    e_target.a_n_objective_ids[str_objective + "_enemy"] = n_obj_id;
    objective_add(n_obj_id, "active", e_target, str_objective + "_enemy");
    function_da7940a3(n_obj_id, 1);
    function_3ae6fa3(n_obj_id, e_target.team, 0);
    objective_setteam(n_obj_id, e_target.team);
}

// Namespace swat_team/swat_team
// Params 2, eflags: 0x1 linked
// Checksum 0xc829de04, Offset: 0xc208
// Size: 0x104
function function_a00c5973(str_objective, e_target) {
    if (isdefined(e_target.a_n_objective_ids) && isdefined(e_target.a_n_objective_ids[str_objective])) {
        n_obj_id = e_target.a_n_objective_ids[str_objective];
        e_target.a_n_objective_ids[str_objective] = undefined;
        objective_setstate(n_obj_id, "done");
        gameobjects::release_obj_id(n_obj_id);
        n_obj_id = e_target.a_n_objective_ids[str_objective + "_enemy"];
        e_target.a_n_objective_ids[str_objective + "_enemy"] = undefined;
        objective_setstate(n_obj_id, "done");
        gameobjects::release_obj_id(n_obj_id);
    }
}


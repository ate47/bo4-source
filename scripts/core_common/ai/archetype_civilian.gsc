#using scripts\core_common\ai\archetype_civilian_interface;
#using scripts\core_common\ai\archetype_human_cover;
#using scripts\core_common\ai\archetype_utility;
#using scripts\core_common\ai\systems\ai_blackboard;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\systems\animation_state_machine_utility;
#using scripts\core_common\ai\systems\behavior_state_machine;
#using scripts\core_common\ai\systems\behavior_tree_utility;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\util_shared;

#namespace archetype_civilian;

// Namespace archetype_civilian/archetype_civilian
// Params 0, eflags: 0x2
// Checksum 0x5c8e6eea, Offset: 0x3b8
// Size: 0x24
function autoexec main() {
    archetypecivilian::registerbehaviorscriptfunctions();
    civilianinterface::registercivilianinterfaceattributes();
}

#namespace archetypecivilian;

// Namespace archetypecivilian/archetype_civilian
// Params 0, eflags: 0x0
// Checksum 0x4a23957c, Offset: 0x3e8
// Size: 0x7cc
function registerbehaviorscriptfunctions() {
    spawner::add_archetype_spawn_function(#"civilian", &civilianblackboardinit);
    spawner::add_archetype_spawn_function(#"civilian", &civilianinit);
    assert(!isdefined(&civilianmoveactioninitialize) || isscriptfunctionptr(&civilianmoveactioninitialize));
    assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
    assert(!isdefined(&civilianmoveactionfinalize) || isscriptfunctionptr(&civilianmoveactionfinalize));
    behaviortreenetworkutility::registerbehaviortreeaction("civilianMoveAction", &civilianmoveactioninitialize, undefined, &civilianmoveactionfinalize);
    assert(isscriptfunctionptr(&civilianwanderservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi("civilianWanderService", &civilianwanderservice, 1);
    assert(isscriptfunctionptr(&civilianpanicescapechooseposition));
    behaviortreenetworkutility::registerbehaviortreescriptapi("civilianPanicEscapeChoosePosition", &civilianpanicescapechooseposition, 1);
    assert(isscriptfunctionptr(&rioterchoosepositionservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi("rioterChoosePositionService", &rioterchoosepositionservice, 1);
    assert(isscriptfunctionptr(&civilianfollowservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi("civilianFollowService", &civilianfollowservice, 1);
    assert(isscriptfunctionptr(&civiliancanthrowmolotovgrenade));
    behaviortreenetworkutility::registerbehaviortreescriptapi("civilianCanThrowMolotovGrenade", &civiliancanthrowmolotovgrenade);
    assert(isscriptfunctionptr(&civilianpreparetothrowgrenade));
    behaviortreenetworkutility::registerbehaviortreescriptapi("civilianPrepareToThrowGrenade", &civilianpreparetothrowgrenade);
    assert(isscriptfunctionptr(&civiliancleanuptothrowgrenade));
    behaviortreenetworkutility::registerbehaviortreescriptapi("civilianCleanUpToThrowGrenade", &civiliancleanuptothrowgrenade);
    assert(isscriptfunctionptr(&civilianispanicked));
    behaviortreenetworkutility::registerbehaviortreescriptapi("civilianIsPanicked", &civilianispanicked);
    assert(isscriptfunctionptr(&civilianarrivalallowed));
    behaviorstatemachine::registerbsmscriptapiinternal("civilianArrivalAllowed", &civilianarrivalallowed);
    assert(isscriptfunctionptr(&civilianareturnsallowed));
    behaviorstatemachine::registerbsmscriptapiinternal("civilianAreTurnsAllowed", &civilianareturnsallowed);
    assert(isscriptfunctionptr(&civilianisrioter));
    behaviorstatemachine::registerbsmscriptapiinternal("civilianIsRioter", &civilianisrioter);
    assert(isscriptfunctionptr(&civilianisrioter));
    behaviortreenetworkutility::registerbehaviortreescriptapi("civilianIsRioter", &civilianisrioter);
    assert(isscriptfunctionptr(&rioterreaquireservice));
    behaviortreenetworkutility::registerbehaviortreescriptapi("rioterReaquireService", &rioterreaquireservice);
    /#
        mapname = util::get_map_name();
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x48>" + "<dev string:x5f>" + "<dev string:x66>" + "<dev string:x5f>" + "<dev string:x83>");
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x48>" + "<dev string:x88>" + "<dev string:x90>" + "<dev string:x88>" + "<dev string:x83>");
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x48>" + "<dev string:xad>" + "<dev string:xb4>" + "<dev string:xad>" + "<dev string:x83>");
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x48>" + "<dev string:xd1>" + "<dev string:xd7>" + "<dev string:xd1>" + "<dev string:x83>");
        level thread function_686ab596();
    #/
}

// Namespace archetypecivilian/archetype_civilian
// Params 0, eflags: 0x4
// Checksum 0x3586dca1, Offset: 0xbc0
// Size: 0x21c
function private function_686ab596() {
    wait 5;
    while (true) {
        debug_civ_mode = getdvarstring(#"debug_civ_mode", "");
        ais = getaiarchetypearray(#"civilian");
        foreach (ai in ais) {
            switch (debug_civ_mode) {
            case #"riot":
                ai::setaiattribute(ai, #"_civ_mode", "riot");
                ai setteam(#"team3");
                break;
            case #"panic":
                ai::setaiattribute(ai, #"_civ_mode", "panic");
                break;
            case #"calm":
                ai::setaiattribute(ai, #"_civ_mode", "calm");
                break;
            case #"run":
                ai::setaiattribute(ai, #"_civ_mode", "run");
                break;
            default:
                break;
            }
        }
        wait 0.05;
    }
}

// Namespace archetypecivilian/archetype_civilian
// Params 0, eflags: 0x4
// Checksum 0x9aee720c, Offset: 0xde8
// Size: 0x4a
function private civilianblackboardinit() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &civilianonanimscriptedcallback;
}

// Namespace archetypecivilian/archetype_civilian
// Params 4, eflags: 0x0
// Checksum 0x2828501b, Offset: 0xe40
// Size: 0x6c
function function_49d80e54(civilian, attribute, oldvalue, value) {
    assert(issentient(civilian));
    civilian setblackboardattribute("follow", value);
}

// Namespace archetypecivilian/archetype_civilian
// Params 0, eflags: 0x4
// Checksum 0x66fe35bc, Offset: 0xeb8
// Size: 0xda
function private civilianinit() {
    entity = self;
    locomotiontypes = array("alt1", "alt2", "alt3");
    altindex = entity getentitynumber() % locomotiontypes.size;
    entity setblackboardattribute("_human_locomotion_variation", locomotiontypes[altindex]);
    entity setavoidancemask("avoid none");
    entity disableaimassist();
    entity.ignorepathenemyfightdist = 1;
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0x20eb2bbb, Offset: 0xfa0
// Size: 0x2c
function private civilianonanimscriptedcallback(entity) {
    entity.__blackboard = undefined;
    entity civilianblackboardinit();
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0x2acc7cc8, Offset: 0xfd8
// Size: 0xa6
function private function_ebea502e(entity) {
    if (entity asmistransitionrunning() || entity getbehaviortreestatus() != 5 || entity asmissubstatepending() || entity asmistransdecrunning()) {
        return true;
    }
    if (entity getpathmode() == "dont move") {
        return false;
    }
    return false;
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0xf652606e, Offset: 0x1088
// Size: 0x42c
function private rioterchoosepositionservice(entity) {
    if (entity getblackboardattribute(#"_civ_mode") != "riot") {
        return false;
    }
    if (!isdefined(entity.enemy)) {
        return false;
    }
    if (function_ebea502e(entity)) {
        return false;
    }
    goalinfo = entity function_4794d6a3();
    forcedgoal = isdefined(goalinfo.goalforced) && goalinfo.goalforced;
    isatscriptgoal = entity isatgoal() || entity isapproachinggoal();
    itsbeenawhile = gettime() > entity.nextfindbestcovertime;
    isinbadplace = entity isinanybadplace();
    lastknownpos = entity lastknownpos(entity.enemy);
    dist = distance2d(entity.origin, lastknownpos);
    shouldfindbetterposition = itsbeenawhile || !isatscriptgoal || isinbadplace;
    if (!shouldfindbetterposition) {
        return false;
    }
    if (forcedgoal) {
        assert(isdefined(goalinfo.goalpos));
        entity function_a57c34b7(goalinfo.goalpos);
        aiutility::setnextfindbestcovertime(entity, undefined);
        return true;
    }
    center = entity.origin;
    if (isdefined(entity.goalpos)) {
        center = entity.goalpos;
    }
    cylinder = ai::t_cylinder(center, entity.goalradius, entity.goalheight);
    pixbeginevent("rioter_tacquery_combat");
    aiprofile_beginentry("rioter_tacquery_combat");
    tacpoints = tacticalquery("rioter_tacquery_combat", center, entity, cylinder);
    pixendevent();
    aiprofile_endentry();
    pickedpoint = undefined;
    if (isdefined(tacpoints)) {
        tacpoints = array::randomize(tacpoints);
        foreach (tacpoint in tacpoints) {
            if (self isingoal(tacpoint.origin)) {
                if (isdefined(entity.pathgoalpos) && entity.pathgoalpos == tacpoint.origin) {
                    continue;
                }
                pickedpoint = tacpoint;
                break;
            }
        }
    }
    if (isdefined(pickedpoint)) {
        entity function_a57c34b7(pickedpoint.origin);
        aiutility::setnextfindbestcovertime(entity, undefined);
        return true;
    }
    return false;
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0x7fc8fbae, Offset: 0x14c0
// Size: 0x122
function private civilianpanicescapechooseposition(entity) {
    if (entity getblackboardattribute(#"_civ_mode") == "riot") {
        return 0;
    }
    if (isdefined(entity.ai.escaping) && entity.ai.escaping) {
        return 0;
    }
    if (!ai::getaiattribute(entity, "auto_escape")) {
        return 0;
    }
    escape_nodes = getnodearray("civ_escape", "targetname");
    if (escape_nodes.size) {
        var_cc364bf7 = arraygetclosest(entity.origin, escape_nodes);
        entity function_a57c34b7(var_cc364bf7.origin);
        entity.ai.escaping = 1;
    }
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0x2bfc3290, Offset: 0x15f0
// Size: 0x43c
function private civilianwanderservice(entity) {
    if (isentity(entity getblackboardattribute("follow"))) {
        return false;
    }
    if (entity getblackboardattribute(#"_civ_mode") == "riot") {
        return false;
    }
    if (entity getblackboardattribute(#"_civ_mode") == "panic" && ai::getaiattribute(entity, "auto_escape")) {
        return false;
    }
    if (!ai::getaiattribute(entity, "auto_wander")) {
        return false;
    }
    if (function_ebea502e(entity)) {
        return false;
    }
    goalinfo = entity function_4794d6a3();
    forcedgoal = isdefined(goalinfo.goalforced) && goalinfo.goalforced;
    isatscriptgoal = entity isatgoal() || entity isapproachinggoal();
    itsbeenawhile = gettime() > entity.nextfindbestcovertime;
    shouldfindbetterposition = itsbeenawhile || !isatscriptgoal;
    if (!shouldfindbetterposition) {
        return false;
    }
    if (forcedgoal) {
        assert(isdefined(goalinfo.goalpos));
        entity function_a57c34b7(goalinfo.goalpos);
        aiutility::setnextfindbestcovertime(entity, undefined);
        return true;
    }
    cylinder = ai::t_cylinder(entity.goalpos, entity.goalradius, entity.goalheight);
    pixbeginevent("civilian_wander_tacquery");
    aiprofile_beginentry("civilian_wander_tacquery");
    tacpoints = tacticalquery("civilian_wander_tacquery", entity.goalpos, entity, cylinder);
    pixendevent();
    aiprofile_endentry();
    pickedpoint = undefined;
    if (isdefined(tacpoints)) {
        tacpoints = array::randomize(tacpoints);
        foreach (tacpoint in tacpoints) {
            if (!self isposinclaimedlocation(tacpoint.origin) && self isingoal(tacpoint.origin)) {
                if (isdefined(entity.pathgoalpos) && entity.pathgoalpos == tacpoint.origin) {
                    continue;
                }
                pickedpoint = tacpoint;
                break;
            }
        }
    }
    if (isdefined(pickedpoint)) {
        entity function_a57c34b7(pickedpoint.origin);
        aiutility::setnextfindbestcovertime(entity, undefined);
        return true;
    }
    return false;
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0x25229b37, Offset: 0x1a38
// Size: 0x3fc
function private civilianfollowservice(entity) {
    followradiussq = 300 * 300;
    followent = entity getblackboardattribute("follow");
    if (!isentity(followent)) {
        return false;
    }
    if (entity getblackboardattribute(#"_civ_mode") == "panic" && ai::getaiattribute(entity, "auto_escape")) {
        return false;
    }
    if (function_ebea502e(entity)) {
        return false;
    }
    goalinfo = entity function_4794d6a3();
    distsq = isdefined(entity.overridegoalpos) ? distancesquared(entity.overridegoalpos, followent.origin) : -1;
    forcedgoal = isdefined(goalinfo.goalforced) && goalinfo.goalforced;
    isatscriptgoal = entity isatgoal() || entity isapproachinggoal();
    itsbeenawhile = gettime() > entity.nextfindbestcovertime;
    shouldfindbetterposition = itsbeenawhile || !isatscriptgoal || distsq < 0 || distsq > followradiussq;
    if (!shouldfindbetterposition) {
        return false;
    }
    pixbeginevent("civilian_follow_tacquery");
    aiprofile_beginentry("civilian_follow_tacquery");
    tacpoints = tacticalquery("civilian_follow_tacquery", followent, entity, followent);
    pixendevent();
    aiprofile_endentry();
    pickedpoint = undefined;
    if (isdefined(tacpoints)) {
        tacpoints = array::randomize(tacpoints);
        if (tacpoints.size == 0) {
            pickedpoint = followent;
        } else {
            foreach (tacpoint in tacpoints) {
                if (!self isposinclaimedlocation(tacpoint.origin) && self isingoal(tacpoint.origin)) {
                    if (isdefined(entity.pathgoalpos) && entity.pathgoalpos == tacpoint.origin) {
                        continue;
                    }
                    pickedpoint = tacpoint;
                    break;
                }
            }
        }
    }
    if (isdefined(pickedpoint)) {
        entity function_a57c34b7(pickedpoint.origin);
        aiutility::setnextfindbestcovertime(entity, undefined);
        return true;
    }
    return false;
}

// Namespace archetypecivilian/archetype_civilian
// Params 2, eflags: 0x4
// Checksum 0xb1079006, Offset: 0x1e40
// Size: 0x58
function private civilianmoveactioninitialize(entity, asmstatename) {
    entity setblackboardattribute("_desired_stance", "stand");
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace archetypecivilian/archetype_civilian
// Params 2, eflags: 0x4
// Checksum 0x79dad227, Offset: 0x1ea0
// Size: 0x68
function private civilianmoveactionfinalize(entity, asmstatename) {
    if (entity getblackboardattribute("_stance") != "stand") {
        entity setblackboardattribute("_desired_stance", "stand");
    }
    return 4;
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0xae6917cf, Offset: 0x1f10
// Size: 0x34
function private civilianispanicked(entity) {
    return entity getblackboardattribute(#"_civ_mode") == "panic";
}

// Namespace archetypecivilian/archetype_civilian
// Params 0, eflags: 0x4
// Checksum 0x4dedc785, Offset: 0x1f50
// Size: 0x22
function private function_e27d2a1b() {
    return ai::getaiattribute(self, #"_civ_mode");
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0xf885d8bc, Offset: 0x1f80
// Size: 0x36
function private civilianarrivalallowed(entity) {
    if (ai::getaiattribute(entity, "disablearrivals")) {
        return false;
    }
    return true;
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0x20f720f, Offset: 0x1fc0
// Size: 0x40
function private civilianareturnsallowed(entity) {
    if (entity getblackboardattribute(#"_civ_mode") == "calm") {
        return false;
    }
    return true;
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x0
// Checksum 0x12bf3473, Offset: 0x2008
// Size: 0x40
function civilianisrioter(entity) {
    if (entity getblackboardattribute(#"_civ_mode") == "riot") {
        return true;
    }
    return false;
}

// Namespace archetypecivilian/archetype_civilian
// Params 2, eflags: 0x0
// Checksum 0x372237da, Offset: 0x2050
// Size: 0x586
function civiliancanthrowmolotovgrenade(behaviortreeentity, throwifpossible = 0) {
    if (!isdefined(behaviortreeentity.enemy)) {
        return false;
    }
    if (!issentient(behaviortreeentity.enemy)) {
        return false;
    }
    if (isvehicle(behaviortreeentity.enemy) && behaviortreeentity.enemy.vehicleclass === "helicopter") {
        return false;
    }
    if (!ai::getaiattribute(behaviortreeentity, "useGrenades")) {
        return false;
    }
    entityangles = behaviortreeentity.angles;
    toenemy = behaviortreeentity.enemy.origin - behaviortreeentity.origin;
    toenemy = vectornormalize((toenemy[0], toenemy[1], 0));
    entityforward = anglestoforward(entityangles);
    entityforward = vectornormalize((entityforward[0], entityforward[1], 0));
    if (vectordot(toenemy, entityforward) < 0.5) {
        return false;
    }
    if (!throwifpossible) {
        foreach (player in level.players) {
            if (player laststand::player_is_in_laststand() && distancesquared(behaviortreeentity.enemy.origin, player.origin) <= 640000) {
                return false;
            }
        }
        grenadethrowinfos = blackboard::getblackboardevents("team_grenade_throw");
        foreach (grenadethrowinfo in grenadethrowinfos) {
            if (grenadethrowinfo.data.grenadethrowerteam === behaviortreeentity.team) {
                return false;
            }
        }
        grenadethrowinfos = blackboard::getblackboardevents("riot_grenade_throw");
        foreach (grenadethrowinfo in grenadethrowinfos) {
            if (isdefined(grenadethrowinfo.data.grenadethrownat) && isalive(grenadethrowinfo.data.grenadethrownat)) {
                if (grenadethrowinfo.data.grenadethrower == behaviortreeentity) {
                    return false;
                }
                if (isdefined(grenadethrowinfo.data.grenadethrownat) && grenadethrowinfo.data.grenadethrownat == behaviortreeentity.enemy) {
                    return false;
                }
                if (isdefined(grenadethrowinfo.data.grenadethrownposition) && isdefined(behaviortreeentity.grenadethrowposition) && distancesquared(grenadethrowinfo.data.grenadethrownposition, behaviortreeentity.grenadethrowposition) <= 1440000) {
                    return false;
                }
            }
        }
    }
    throw_dist = distance2dsquared(behaviortreeentity.origin, behaviortreeentity lastknownpos(behaviortreeentity.enemy));
    if (throw_dist < 300 * 300 || throw_dist > 1250 * 1250) {
        return false;
    }
    arm_offset = archetype_human_cover::temp_get_arm_offset(behaviortreeentity, behaviortreeentity lastknownpos(behaviortreeentity.enemy));
    throw_vel = behaviortreeentity canthrowgrenadepos(arm_offset, behaviortreeentity lastknownpos(behaviortreeentity.enemy));
    if (!isdefined(throw_vel)) {
        return false;
    }
    return true;
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0xb498d46e, Offset: 0x25e0
// Size: 0x16a
function private civilianpreparetothrowgrenade(behaviortreeentity) {
    aiutility::keepclaimnode(behaviortreeentity);
    if (isdefined(behaviortreeentity.enemy)) {
        behaviortreeentity.grenadethrowposition = behaviortreeentity lastknownpos(behaviortreeentity.enemy);
    }
    grenadethrowinfo = spawnstruct();
    grenadethrowinfo.grenadethrower = behaviortreeentity;
    grenadethrowinfo.grenadethrownat = behaviortreeentity.enemy;
    grenadethrowinfo.grenadethrownposition = behaviortreeentity.grenadethrowposition;
    blackboard::addblackboardevent("riot_grenade_throw", grenadethrowinfo, randomintrange(15000, 20000));
    grenadethrowinfo = spawnstruct();
    grenadethrowinfo.grenadethrowerteam = behaviortreeentity.team;
    blackboard::addblackboardevent("team_grenade_throw", grenadethrowinfo, randomintrange(8000, 12000));
    behaviortreeentity.preparegrenadeammo = behaviortreeentity.grenadeammo;
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0x10ddecd9, Offset: 0x2758
// Size: 0x20c
function private civiliancleanuptothrowgrenade(behaviortreeentity) {
    aiutility::releaseclaimnode(behaviortreeentity);
    if (behaviortreeentity.preparegrenadeammo == behaviortreeentity.grenadeammo) {
        if (behaviortreeentity.health <= 0) {
            grenade = undefined;
            if (isactor(behaviortreeentity.enemy) && isdefined(behaviortreeentity.grenadeweapon)) {
                grenade = behaviortreeentity.enemy magicgrenadetype(behaviortreeentity.grenadeweapon, behaviortreeentity gettagorigin("j_wrist_ri"), (0, 0, 0), float(behaviortreeentity.grenadeweapon.aifusetime) / 1000);
            } else if (isplayer(behaviortreeentity.enemy) && isdefined(behaviortreeentity.grenadeweapon)) {
                grenade = behaviortreeentity.enemy magicgrenadeplayer(behaviortreeentity.grenadeweapon, behaviortreeentity gettagorigin("j_wrist_ri"), (0, 0, 0));
            }
            if (isdefined(grenade)) {
                grenade.owner = behaviortreeentity;
                grenade.team = behaviortreeentity.team;
                grenade setcontents(grenade setcontents(0) & ~(32768 | 67108864 | 8388608 | 33554432));
            }
        }
    }
}

// Namespace archetypecivilian/archetype_civilian
// Params 1, eflags: 0x4
// Checksum 0xbc4e7368, Offset: 0x2970
// Size: 0x2e6
function private rioterreaquireservice(entity) {
    if (entity getblackboardattribute(#"_civ_mode") != "riot") {
        return false;
    }
    if (!isdefined(entity.reacquire_state)) {
        entity.reacquire_state = 0;
    }
    if (!isdefined(entity.enemy)) {
        entity.reacquire_state = 0;
        return false;
    }
    if (entity haspath()) {
        return false;
    }
    if (entity seerecently(entity.enemy, 3)) {
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
        entity.reacquire_state = 0;
        return true;
    }
    entity.reacquire_state++;
    return false;
}


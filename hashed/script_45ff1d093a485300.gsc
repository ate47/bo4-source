// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai_shared.gsc;
#include script_4c5c4a64a59247a2;
#include script_35598499769dbb3d;
#include script_4d85e8de54b02198;
#include scripts/core_common/ai/archetype_utility.gsc;
#include scripts/core_common/ai/archetype_human_cover.gsc;

#namespace animationstatenetwork;

// Namespace animationstatenetwork/namespace_467800e2
// Params 0, eflags: 0x2
// Checksum 0x4048dcc2, Offset: 0x330
// Size: 0x4dc
function autoexec registerdefaultnotetrackhandlerfunctions() {
    registernotetrackhandlerfunction("fire", &notetrackfirebullet);
    registernotetrackhandlerfunction("gib_disable", &notetrackgibdisable);
    registernotetrackhandlerfunction("gib = "head"", &gibserverutils::gibhead);
    registernotetrackhandlerfunction("gib = "arm_left"", &gibserverutils::gibleftarm);
    registernotetrackhandlerfunction("gib = "arm_right"", &gibserverutils::gibrightarm);
    registernotetrackhandlerfunction("gib = "leg_left"", &gibserverutils::gibleftleg);
    registernotetrackhandlerfunction("gib = "leg_right"", &gibserverutils::gibrightleg);
    registernotetrackhandlerfunction("dropgun", &notetrackdropgun);
    registernotetrackhandlerfunction("gun drop", &notetrackdropgun);
    registernotetrackhandlerfunction("drop_shield", &notetrackdropshield);
    registernotetrackhandlerfunction("hide_weapon", &notetrackhideweapon);
    registernotetrackhandlerfunction("show_weapon", &notetrackshowweapon);
    registernotetrackhandlerfunction("hide_ai", &notetrackhideai);
    registernotetrackhandlerfunction("show_ai", &notetrackshowai);
    registernotetrackhandlerfunction("attach_knife", &notetrackattachknife);
    registernotetrackhandlerfunction("detach_knife", &notetrackdetachknife);
    registernotetrackhandlerfunction("grenade_throw", &notetrackgrenadethrow);
    registernotetrackhandlerfunction("start_ragdoll", &notetrackstartragdoll);
    registernotetrackhandlerfunction("ragdoll_nodeath", &notetrackstartragdollnodeath);
    registernotetrackhandlerfunction("unsync", &notetrackmeleeunsync);
    registernotetrackhandlerfunction("step1", &notetrackstaircasestep1);
    registernotetrackhandlerfunction("step2", &notetrackstaircasestep2);
    registernotetrackhandlerfunction("anim_movement = "stop"", &notetrackanimmovementstop);
    registerblackboardnotetrackhandler("anim_pose = \"stand\"", "_stance", "stand");
    registerblackboardnotetrackhandler("anim_pose = \"crouch\"", "_stance", "crouch");
    registerblackboardnotetrackhandler("anim_pose = \"prone_front\"", "_stance", "prone_front");
    registerblackboardnotetrackhandler("anim_pose = \"prone_back\"", "_stance", "prone_back");
    registerblackboardnotetrackhandler("anim_pose = stand", "_stance", "stand");
    registerblackboardnotetrackhandler("anim_pose = crouch", "_stance", "crouch");
    registerblackboardnotetrackhandler("anim_pose = prone_front", "_stance", "prone_front");
    registerblackboardnotetrackhandler("anim_pose = prone_back", "_stance", "prone_back");
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0x3e4d3297, Offset: 0x818
// Size: 0x64
function private notetrackanimmovementstop(entity) {
    if (entity haspath()) {
        entity pathmode("move delayed", 1, randomfloatrange(2, 4));
    }
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0xa8ac4f65, Offset: 0x888
// Size: 0x5c
function private notetrackstaircasestep1(entity) {
    numsteps = entity getblackboardattribute("_staircase_num_steps");
    numsteps++;
    entity setblackboardattribute("_staircase_num_steps", numsteps);
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0x704a9fbc, Offset: 0x8f0
// Size: 0x64
function private notetrackstaircasestep2(entity) {
    numsteps = entity getblackboardattribute("_staircase_num_steps");
    numsteps = numsteps + 2;
    entity setblackboardattribute("_staircase_num_steps", numsteps);
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0xb80adabb, Offset: 0x960
// Size: 0xf4
function private notetrackdropguninternal(entity) {
    if (!isdefined(entity.weapon) || entity.weapon === level.weaponnone) {
        return;
    }
    if (isdefined(entity.ai) && isdefined(entity.ai.var_7c61677c) && entity.ai.var_7c61677c) {
        if (isalive(entity)) {
            return;
        }
    }
    entity.lastweapon = entity.weapon;
    primaryweapon = entity.primaryweapon;
    secondaryweapon = entity.secondaryweapon;
    entity thread shared::dropaiweapon();
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0x8f3f8dee, Offset: 0xa60
// Size: 0x62
function private notetrackattachknife(entity) {
    if (!(isdefined(entity._ai_melee_attachedknife) && entity._ai_melee_attachedknife)) {
        entity attach(#"wpn_t7_knife_combat_prop", "TAG_WEAPON_LEFT");
        entity._ai_melee_attachedknife = 1;
    }
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0xb795c619, Offset: 0xad0
// Size: 0x62
function private notetrackdetachknife(entity) {
    if (isdefined(entity._ai_melee_attachedknife) && entity._ai_melee_attachedknife) {
        entity detach(#"wpn_t7_knife_combat_prop", "TAG_WEAPON_LEFT");
        entity._ai_melee_attachedknife = 0;
    }
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0xcd9dd06f, Offset: 0xb40
// Size: 0x24
function private notetrackhideweapon(entity) {
    entity ai::gun_remove();
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0x955c6e73, Offset: 0xb70
// Size: 0x24
function private notetrackshowweapon(entity) {
    entity ai::gun_recall();
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0x18993492, Offset: 0xba0
// Size: 0x24
function private notetrackhideai(entity) {
    entity hide();
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0x2c7378c9, Offset: 0xbd0
// Size: 0x24
function private notetrackshowai(entity) {
    entity show();
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0x515a52c4, Offset: 0xc00
// Size: 0xac
function private notetrackstartragdoll(entity) {
    if (isactor(entity) && entity isinscriptedstate()) {
        entity.overrideactordamage = undefined;
        entity.allowdeath = 1;
        entity.skipdeath = 1;
        entity kill();
    }
    notetrackdropguninternal(entity);
    entity startragdoll();
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x1 linked
// Checksum 0x958b0975, Offset: 0xcb8
// Size: 0x4c
function _delayedragdoll(entity) {
    wait(0.25);
    if (isdefined(entity) && !entity isragdoll()) {
        entity startragdoll();
    }
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x1 linked
// Checksum 0xed1ae924, Offset: 0xd10
// Size: 0x4c
function notetrackstartragdollnodeath(entity) {
    if (isdefined(entity._ai_melee_opponent)) {
        entity._ai_melee_opponent unlink();
    }
    entity thread _delayedragdoll(entity);
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0xb09a64df, Offset: 0xd68
// Size: 0x148
function private notetrackfirebullet(animationentity) {
    if (isactor(animationentity) && animationentity isinscriptedstate()) {
        if (animationentity.weapon != level.weaponnone) {
            animationentity notify(#"about_to_shoot");
            startpos = animationentity gettagorigin("tag_flash");
            endpos = startpos + vectorscale(animationentity getweaponforwarddir(), 100);
            magicbullet(animationentity.weapon, startpos, endpos, animationentity);
            animationentity notify(#"shoot");
            if (!isdefined(animationentity.ai.bulletsinclip)) {
                animationentity.ai.bulletsinclip = 0;
            } else {
                animationentity.ai.bulletsinclip--;
            }
        }
    }
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0x6adfe170, Offset: 0xeb8
// Size: 0x24
function private notetrackdropgun(animationentity) {
    notetrackdropguninternal(animationentity);
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0x86b49cef, Offset: 0xee8
// Size: 0x24
function private notetrackdropshield(animationentity) {
    aiutility::dropriotshield(animationentity);
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0x55f32b60, Offset: 0xf18
// Size: 0xc4
function private notetrackgrenadethrow(animationentity) {
    if (archetype_human_cover::shouldthrowgrenadeatcovercondition(animationentity, 1)) {
        animationentity grenadethrow();
    } else if (isdefined(animationentity.grenadethrowposition)) {
        arm_offset = archetype_human_cover::temp_get_arm_offset(animationentity, animationentity.grenadethrowposition);
        throw_vel = animationentity canthrowgrenadepos(arm_offset, animationentity.grenadethrowposition);
        if (isdefined(throw_vel)) {
            animationentity grenadethrow();
        }
    }
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0xd5dc8e65, Offset: 0xfe8
// Size: 0x6c
function private notetrackmeleeunsync(animationentity) {
    if (isdefined(animationentity) && isdefined(animationentity.enemy)) {
        if (isdefined(animationentity.enemy._ai_melee_markeddead) && animationentity.enemy._ai_melee_markeddead) {
            animationentity unlink();
        }
    }
}

// Namespace animationstatenetwork/namespace_467800e2
// Params 1, eflags: 0x5 linked
// Checksum 0x37c65a0f, Offset: 0x1060
// Size: 0x4c
function private notetrackgibdisable(animationentity) {
    if (animationentity ai::has_behavior_attribute("can_gib")) {
        animationentity ai::set_behavior_attribute("can_gib", 0);
    }
}


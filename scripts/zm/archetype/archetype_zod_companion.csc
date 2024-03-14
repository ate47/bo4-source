// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\ai\systems\gib.csc;
#using scripts\core_common\ai\systems\fx_character.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace zodcompanionclientutils;

// Namespace zodcompanionclientutils/archetype_zod_companion
// Params 0, eflags: 0x2
// Checksum 0xd370c438, Offset: 0x160
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_zod_companion", &__init__, undefined, undefined);
}

// Namespace zodcompanionclientutils/archetype_zod_companion
// Params 0, eflags: 0x1 linked
// Checksum 0x407db045, Offset: 0x1a8
// Size: 0x124
function __init__() {
    clientfield::register("allplayers", "being_robot_revived", 1, 1, "int", &play_revival_fx, 0, 0);
    ai::add_archetype_spawn_function(#"zod_companion", &zodcompanionspawnsetup);
    level._effect[#"fx_dest_robot_head_sparks"] = "destruct/fx_dest_robot_head_sparks";
    level._effect[#"fx_dest_robot_body_sparks"] = "destruct/fx_dest_robot_body_sparks";
    level._effect[#"companion_revive_effect"] = "zombie/fx_robot_helper_revive_player_zod_zmb";
    ai::add_archetype_spawn_function(#"robot", &zodcompanionspawnsetup);
}

// Namespace zodcompanionclientutils/archetype_zod_companion
// Params 1, eflags: 0x5 linked
// Checksum 0xa916eb4a, Offset: 0x2d8
// Size: 0x12c
function private zodcompanionspawnsetup(localclientnum) {
    entity = self;
    gibclientutils::addgibcallback(localclientnum, entity, 8, &zodcompanionheadgibfx);
    gibclientutils::addgibcallback(localclientnum, entity, 8, &_gibcallback);
    gibclientutils::addgibcallback(localclientnum, entity, 16, &_gibcallback);
    gibclientutils::addgibcallback(localclientnum, entity, 32, &_gibcallback);
    gibclientutils::addgibcallback(localclientnum, entity, 128, &_gibcallback);
    gibclientutils::addgibcallback(localclientnum, entity, 256, &_gibcallback);
    fxclientutils::playfxbundle(localclientnum, entity, entity.fxdef);
}

// Namespace zodcompanionclientutils/archetype_zod_companion
// Params 3, eflags: 0x1 linked
// Checksum 0xfd825a4b, Offset: 0x410
// Size: 0x10c
function zodcompanionheadgibfx(localclientnum, entity, gibflag) {
    if (!isdefined(entity) || !entity isai() || !isalive(entity)) {
        return;
    }
    if (isdefined(entity.mindcontrolheadfx)) {
        stopfx(localclientnum, entity.mindcontrolheadfx);
        entity.mindcontrolheadfx = undefined;
    }
    entity.headgibfx = util::playfxontag(localclientnum, level._effect[#"fx_dest_robot_head_sparks"], entity, "j_neck");
    playsound(0, #"prj_bullet_impact_robot_headshot", entity.origin);
}

// Namespace zodcompanionclientutils/archetype_zod_companion
// Params 2, eflags: 0x0
// Checksum 0xc41cca11, Offset: 0x528
// Size: 0x9e
function zodcompaniondamagedfx(localclientnum, entity) {
    if (!isdefined(entity) || !entity isai() || !isalive(entity)) {
        return;
    }
    entity.damagedfx = util::playfxontag(localclientnum, level._effect[#"fx_dest_robot_body_sparks"], entity, "j_spine4");
}

// Namespace zodcompanionclientutils/archetype_zod_companion
// Params 2, eflags: 0x0
// Checksum 0xc5ae02e2, Offset: 0x5d0
// Size: 0x3c
function zodcompanionclearfx(localclientnum, entity) {
    if (!isdefined(entity) || !entity isai()) {
        return;
    }
}

// Namespace zodcompanionclientutils/archetype_zod_companion
// Params 3, eflags: 0x5 linked
// Checksum 0x52e182ee, Offset: 0x618
// Size: 0xba
function private _gibcallback(localclientnum, entity, gibflag) {
    if (!isdefined(entity) || !entity isai()) {
        return;
    }
    switch (gibflag) {
    case 8:
        break;
    case 16:
        break;
    case 32:
        break;
    case 128:
        break;
    case 256:
        break;
    }
}

// Namespace zodcompanionclientutils/archetype_zod_companion
// Params 7, eflags: 0x1 linked
// Checksum 0x80816e53, Offset: 0x6e0
// Size: 0xf2
function play_revival_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self.robot_revival_fx) && oldval == 1 && newval == 0) {
        stopfx(localclientnum, self.robot_revival_fx);
    }
    if (newval === 1) {
        self playsound(0, #"evt_civil_protector_revive_plr");
        self.robot_revival_fx = util::playfxontag(localclientnum, level._effect[#"companion_revive_effect"], self, "j_spineupper");
    }
}


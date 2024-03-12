// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\ai\systems\gib.csc;
#using scripts\core_common\ai\systems\fx_character.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zombie;

// Namespace zombie/zombie
// Params 0, eflags: 0x2
// Checksum 0xa68abfb0, Offset: 0xd0
// Size: 0x124
function autoexec main() {
    level._effect[#"zombie_special_day_effect"] = #"hash_7a37324c1988abb5";
    ai::add_archetype_spawn_function(#"zombie", &zombieclientutils::zombie_override_burn_fx);
    ai::add_archetype_spawn_function(#"zombie", &zombieclientutils::zombiespawnsetup);
    clientfield::register("actor", "zombie", 1, 1, "int", &zombieclientutils::zombiehandler, 0, 0);
    clientfield::register("actor", "zombie_special_day", 1, 1, "counter", &zombieclientutils::zombiespecialdayeffectshandler, 0, 0);
}

#namespace zombieclientutils;

// Namespace zombieclientutils/zombie
// Params 7, eflags: 0x0
// Checksum 0xcdedfa01, Offset: 0x200
// Size: 0x17c
function zombiehandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    entity = self;
    if (isdefined(entity.archetype) && entity.archetype != #"zombie") {
        return;
    }
    if (!isdefined(entity.initializedgibcallbacks) || !entity.initializedgibcallbacks) {
        entity.initializedgibcallbacks = 1;
        gibclientutils::addgibcallback(localclientnum, entity, 8, &_gibcallback);
        gibclientutils::addgibcallback(localclientnum, entity, 16, &_gibcallback);
        gibclientutils::addgibcallback(localclientnum, entity, 32, &_gibcallback);
        gibclientutils::addgibcallback(localclientnum, entity, 128, &_gibcallback);
        gibclientutils::addgibcallback(localclientnum, entity, 256, &_gibcallback);
    }
}

// Namespace zombieclientutils/zombie
// Params 3, eflags: 0x4
// Checksum 0xfbc568ae, Offset: 0x388
// Size: 0xfa
function private _gibcallback(localclientnum, entity, gibflag) {
    switch (gibflag) {
    case 8:
        playsound(0, #"zmb_zombie_head_gib", self.origin + vectorscale((0, 0, 1), 60));
        return;
    case 16:
    case 32:
    case 128:
    case 256:
        playsound(0, #"zmb_death_gibs", self.origin + vectorscale((0, 0, 1), 30));
        return;
    }
}

// Namespace zombieclientutils/zombie
// Params 7, eflags: 0x0
// Checksum 0xea329a1b, Offset: 0x490
// Size: 0x104
function zombiespecialdayeffectshandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    entity = self;
    if (isdefined(entity.archetype) && entity.archetype != #"zombie") {
        return;
    }
    origin = entity gettagorigin("j_spine4");
    fx = playfx(localclientnum, level._effect[#"zombie_special_day_effect"], origin);
    setfxignorepause(localclientnum, fx, 1);
}

// Namespace zombieclientutils/zombie
// Params 1, eflags: 0x0
// Checksum 0x7d3e8ba9, Offset: 0x5a0
// Size: 0x212
function zombie_override_burn_fx(localclientnum) {
    if (sessionmodeiszombiesgame()) {
        if (!isdefined(self._effect)) {
            self._effect = [];
        }
        level._effect[#"fire_zombie_j_elbow_le_loop"] = #"fire/fx_fire_ai_human_arm_left_loop";
        level._effect[#"fire_zombie_j_elbow_ri_loop"] = #"fire/fx_fire_ai_human_arm_right_loop";
        level._effect[#"fire_zombie_j_shoulder_le_loop"] = #"fire/fx_fire_ai_human_arm_left_loop";
        level._effect[#"fire_zombie_j_shoulder_ri_loop"] = #"fire/fx_fire_ai_human_arm_right_loop";
        level._effect[#"fire_zombie_j_spine4_loop"] = #"fire/fx_fire_ai_human_torso_loop";
        level._effect[#"fire_zombie_j_hip_le_loop"] = #"fire/fx_fire_ai_human_hip_left_loop";
        level._effect[#"fire_zombie_j_hip_ri_loop"] = #"fire/fx_fire_ai_human_hip_right_loop";
        level._effect[#"fire_zombie_j_knee_le_loop"] = #"fire/fx_fire_ai_human_leg_left_loop";
        level._effect[#"fire_zombie_j_knee_ri_loop"] = #"fire/fx_fire_ai_human_leg_right_loop";
        level._effect[#"fire_zombie_j_head_loop"] = #"fire/fx_fire_ai_human_head_loop";
    }
}

// Namespace zombieclientutils/zombie
// Params 1, eflags: 0x0
// Checksum 0xb30c59d2, Offset: 0x7c0
// Size: 0x2c
function zombiespawnsetup(localclientnum) {
    fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
}


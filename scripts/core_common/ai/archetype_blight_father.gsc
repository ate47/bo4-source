// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/ai/archetype_blight_father_interface.gsc;
#include script_59f07c660e6710a5;
#include script_522aeb6ae906391e;
#include scripts/core_common/spawner_shared.gsc;

#namespace archetypeblightfather;

// Namespace archetypeblightfather/archetype_blight_father
// Params 0, eflags: 0x2
// Checksum 0xede555fe, Offset: 0x90
// Size: 0x54
function autoexec main() {
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function(#"blight_father", &function_a27b7fcf);
    blightfatherinterface::registerblightfatherinterfaceattributes();
}

// Namespace archetypeblightfather/archetype_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0x235879c2, Offset: 0xf0
// Size: 0x4a
function private function_a27b7fcf() {
    blackboard::createblackboardforentity(self);
    ai::createinterfaceforentity(self);
    self.___archetypeonanimscriptedcallback = &function_aefef9ae;
}

// Namespace archetypeblightfather/archetype_blight_father
// Params 1, eflags: 0x5 linked
// Checksum 0x96cd0307, Offset: 0x148
// Size: 0xae
function private function_aefef9ae(entity) {
    entity.__blackboard = undefined;
    entity function_a27b7fcf();
    if (isdefined(entity.var_506922ab)) {
        foreach (callback in entity.var_506922ab) {
            [[ callback ]](entity);
        }
    }
}

// Namespace archetypeblightfather/archetype_blight_father
// Params 0, eflags: 0x5 linked
// Checksum 0x80f724d1, Offset: 0x200
// Size: 0x4
function private registerbehaviorscriptfunctions() {
    
}

// Namespace archetypeblightfather/archetype_blight_father
// Params 2, eflags: 0x0
// Checksum 0x2a8fb14, Offset: 0x210
// Size: 0xa8
function spawnblightfather(spawner, location) {
    spawner.script_forcespawn = 1;
    entity = zombie_utility::spawn_zombie(spawner, undefined, location);
    if (!isdefined(entity)) {
        return;
    }
    if (!isdefined(location.angles)) {
        angles = (0, 0, 0);
    } else {
        angles = location.angles;
    }
    entity forceteleport(location.origin, angles);
    return entity;
}

// Namespace archetypeblightfather/archetype_blight_father
// Params 1, eflags: 0x4
// Checksum 0x1a135272, Offset: 0x2c0
// Size: 0x24
function private function_ac921de9(entity) {
    entity melee();
}

// Namespace archetypeblightfather/archetype_blight_father
// Params 4, eflags: 0x1 linked
// Checksum 0x62c880c1, Offset: 0x2f0
// Size: 0x58
function function_3e8300e9(entity, attribute, oldvalue, value) {
    if (isdefined(entity.var_80cf70fb)) {
        entity [[ entity.var_80cf70fb ]](entity, attribute, oldvalue, value);
    }
}

// Namespace archetypeblightfather/archetype_blight_father
// Params 4, eflags: 0x1 linked
// Checksum 0xc200d225, Offset: 0x350
// Size: 0x58
function function_b95978a7(entity, attribute, oldvalue, value) {
    if (isdefined(entity.var_11a49434)) {
        entity [[ entity.var_11a49434 ]](entity, attribute, oldvalue, value);
    }
}


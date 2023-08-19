// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/system_shared.csc;
#include script_14d2d89964cae0b1;
#include script_ac6a30f1991e105;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/ai_shared.csc;

#namespace archetype_robot;

// Namespace archetype_robot/archetype_robot
// Params 0, eflags: 0x2
// Checksum 0x55ead7b9, Offset: 0x160
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"robot", &__init__, undefined, undefined);
}

// Namespace archetype_robot/archetype_robot
// Params 0, eflags: 0x2
// Checksum 0x4ea84d0, Offset: 0x1a8
// Size: 0x52
function autoexec precache() {
    level._effect[#"hash_3dd84b09afe6fab5"] = "electric/fx8_surge_short_robot";
    level._effect[#"fx_exp_robot_stage3_evb"] = "explosions/fx_exp_robot_stage3_evb";
}

// Namespace archetype_robot/archetype_robot
// Params 0, eflags: 0x1 linked
// Checksum 0x88d8f69f, Offset: 0x208
// Size: 0x174
function __init__() {
    if (ai::shouldregisterclientfieldforarchetype(#"robot")) {
        clientfield::register("actor", "robot_mind_control", 1, 2, "int", &namespace_38e62668::function_eeafa1cb, 0, 1);
        clientfield::register("actor", "robot_mind_control_explosion", 1, 1, "int", &namespace_38e62668::function_2777cb4, 0, 0);
        clientfield::register("actor", "robot_lights", 1, 3, "int", &namespace_38e62668::function_b97989d2, 0, 0);
        clientfield::register("actor", "robot_EMP", 1, 1, "int", &namespace_38e62668::function_d52da56b, 0, 0);
    }
    ai::add_archetype_spawn_function(#"robot", &namespace_38e62668::function_4fca472);
}

#namespace namespace_38e62668;

// Namespace namespace_38e62668/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x824ce6de, Offset: 0x388
// Size: 0x1a
function private function_4fca472(localclientnum) {
    entity = self;
}

// Namespace namespace_38e62668/archetype_robot
// Params 4, eflags: 0x5 linked
// Checksum 0x23cb0d24, Offset: 0x3b0
// Size: 0x302
function private function_f6a5ab9c(localclientnum, entity, var_9184a23a, var_aee760b9) {
    switch (var_aee760b9) {
    case 0:
        if (var_9184a23a) {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef3);
        } else {
            fxclientutils::playfxbundle(localclientnum, entity, entity.fxdef);
        }
        break;
    case 1:
        fxclientutils::stopallfxbundles(localclientnum, entity);
        if (var_9184a23a) {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef4);
        } else {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef1);
        }
        if (!gibclientutils::isgibbed(localclientnum, entity, 8)) {
            entity playsound(localclientnum, #"hash_27e8c11b200ca16", entity.origin);
        }
        break;
    case 2:
        fxclientutils::stopallfxbundles(localclientnum, entity);
        if (var_9184a23a) {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef4);
        } else {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef1);
        }
        if (!gibclientutils::isgibbed(localclientnum, entity, 8)) {
            entity playsound(localclientnum, #"hash_76bcb5720d06ade3", entity.origin);
        }
        break;
    case 3:
        fxclientutils::stopallfxbundles(localclientnum, entity);
        if (var_9184a23a) {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef5);
        } else {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef2);
        }
        entity playsound(localclientnum, #"hash_38baca3bb1c34534", entity.origin);
        break;
    }
}

// Namespace namespace_38e62668/archetype_robot
// Params 7, eflags: 0x5 linked
// Checksum 0x3d85f3e9, Offset: 0x6c0
// Size: 0x164
function private function_b97989d2(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    entity = self;
    if (!isdefined(entity) || !entity isai() || isdefined(entity.archetype) && entity.archetype != "robot") {
        return;
    }
    fxclientutils::stopallfxbundles(localclientnum, entity);
    var_9184a23a = newvalue == 1;
    if (newvalue == 0 || newvalue == 3 || var_9184a23a) {
        function_f6a5ab9c(localclientnum, entity, var_9184a23a, clientfield::get("robot_mind_control"));
    } else if (newvalue == 4) {
        fxclientutils::playfxbundle(localclientnum, entity, entity.deathfxdef);
    }
}

// Namespace namespace_38e62668/archetype_robot
// Params 7, eflags: 0x5 linked
// Checksum 0x2d38e85f, Offset: 0x830
// Size: 0x152
function private function_d52da56b(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    entity = self;
    if (!isdefined(entity) || !entity isai() || isdefined(entity.archetype) && entity.archetype != "robot") {
        return;
    }
    if (isdefined(entity.var_4e1d598a)) {
        stopfx(localclientnum, entity.var_4e1d598a);
    }
    switch (newvalue) {
    case 0:
        break;
    case 1:
        entity.var_4e1d598a = util::playfxontag(localclientnum, level._effect[#"hash_3dd84b09afe6fab5"], entity, "j_spine4");
        break;
    }
}

// Namespace namespace_38e62668/archetype_robot
// Params 7, eflags: 0x5 linked
// Checksum 0x72848aa9, Offset: 0x990
// Size: 0x114
function private function_eeafa1cb(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    entity = self;
    if (!isdefined(entity) || !entity isai() || isdefined(entity.archetype) && entity.archetype != "robot") {
        return;
    }
    lights = clientfield::get("robot_lights");
    var_9184a23a = lights == 1;
    if (lights == 0 || var_9184a23a) {
        function_f6a5ab9c(localclientnum, entity, var_9184a23a, newvalue);
    }
}

// Namespace namespace_38e62668/archetype_robot
// Params 7, eflags: 0x1 linked
// Checksum 0x87968798, Offset: 0xab0
// Size: 0x112
function function_2777cb4(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    entity = self;
    if (!isdefined(entity) || !entity isai() || isdefined(entity.archetype) && entity.archetype != "robot") {
        return;
    }
    switch (newvalue) {
    case 1:
        entity.var_3ba90967 = util::playfxontag(localclientnum, level._effect[#"fx_exp_robot_stage3_evb"], entity, "j_spineupper");
        break;
    }
}


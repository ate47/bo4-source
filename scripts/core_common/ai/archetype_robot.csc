// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\ai\systems\gib.csc;
#using scripts\core_common\ai\systems\fx_character.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

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
    level._effect[#"fx_ability_elec_surge_short_robot"] = "electric/fx8_surge_short_robot";
    level._effect[#"fx_exp_robot_stage3_evb"] = "explosions/fx_exp_robot_stage3_evb";
}

// Namespace archetype_robot/archetype_robot
// Params 0, eflags: 0x1 linked
// Checksum 0x88d8f69f, Offset: 0x208
// Size: 0x174
function __init__() {
    if (ai::shouldregisterclientfieldforarchetype(#"robot")) {
        clientfield::register("actor", "robot_mind_control", 1, 2, "int", &robotclientutils::robotmindcontrolhandler, 0, 1);
        clientfield::register("actor", "robot_mind_control_explosion", 1, 1, "int", &robotclientutils::robotmindcontrolexplosionhandler, 0, 0);
        clientfield::register("actor", "robot_lights", 1, 3, "int", &robotclientutils::robotlightshandler, 0, 0);
        clientfield::register("actor", "robot_EMP", 1, 1, "int", &robotclientutils::robotemphandler, 0, 0);
    }
    ai::add_archetype_spawn_function(#"robot", &robotclientutils::robotsoldierspawnsetup);
}

#namespace robotclientutils;

// Namespace robotclientutils/archetype_robot
// Params 1, eflags: 0x5 linked
// Checksum 0x824ce6de, Offset: 0x388
// Size: 0x1a
function private robotsoldierspawnsetup(localclientnum) {
    entity = self;
}

// Namespace robotclientutils/archetype_robot
// Params 4, eflags: 0x5 linked
// Checksum 0x23cb0d24, Offset: 0x3b0
// Size: 0x302
function private robotlighting(localclientnum, entity, flicker, mindcontrolstate) {
    switch (mindcontrolstate) {
    case 0:
        if (flicker) {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef3);
        } else {
            fxclientutils::playfxbundle(localclientnum, entity, entity.fxdef);
        }
        break;
    case 1:
        fxclientutils::stopallfxbundles(localclientnum, entity);
        if (flicker) {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef4);
        } else {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef1);
        }
        if (!gibclientutils::isgibbed(localclientnum, entity, 8)) {
            entity playsound(localclientnum, #"fly_bot_ctrl_lvl_01_start", entity.origin);
        }
        break;
    case 2:
        fxclientutils::stopallfxbundles(localclientnum, entity);
        if (flicker) {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef4);
        } else {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef1);
        }
        if (!gibclientutils::isgibbed(localclientnum, entity, 8)) {
            entity playsound(localclientnum, #"fly_bot_ctrl_lvl_02_start", entity.origin);
        }
        break;
    case 3:
        fxclientutils::stopallfxbundles(localclientnum, entity);
        if (flicker) {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef5);
        } else {
            fxclientutils::playfxbundle(localclientnum, entity, entity.altfxdef2);
        }
        entity playsound(localclientnum, #"fly_bot_ctrl_lvl_03_start", entity.origin);
        break;
    }
}

// Namespace robotclientutils/archetype_robot
// Params 7, eflags: 0x5 linked
// Checksum 0x3d85f3e9, Offset: 0x6c0
// Size: 0x164
function private robotlightshandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    entity = self;
    if (!isdefined(entity) || !entity isai() || isdefined(entity.archetype) && entity.archetype != "robot") {
        return;
    }
    fxclientutils::stopallfxbundles(localclientnum, entity);
    flicker = newvalue == 1;
    if (newvalue == 0 || newvalue == 3 || flicker) {
        robotlighting(localclientnum, entity, flicker, clientfield::get("robot_mind_control"));
    } else if (newvalue == 4) {
        fxclientutils::playfxbundle(localclientnum, entity, entity.deathfxdef);
    }
}

// Namespace robotclientutils/archetype_robot
// Params 7, eflags: 0x5 linked
// Checksum 0x2d38e85f, Offset: 0x830
// Size: 0x152
function private robotemphandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    entity = self;
    if (!isdefined(entity) || !entity isai() || isdefined(entity.archetype) && entity.archetype != "robot") {
        return;
    }
    if (isdefined(entity.empfx)) {
        stopfx(localclientnum, entity.empfx);
    }
    switch (newvalue) {
    case 0:
        break;
    case 1:
        entity.empfx = util::playfxontag(localclientnum, level._effect[#"fx_ability_elec_surge_short_robot"], entity, "j_spine4");
        break;
    }
}

// Namespace robotclientutils/archetype_robot
// Params 7, eflags: 0x5 linked
// Checksum 0x72848aa9, Offset: 0x990
// Size: 0x114
function private robotmindcontrolhandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    entity = self;
    if (!isdefined(entity) || !entity isai() || isdefined(entity.archetype) && entity.archetype != "robot") {
        return;
    }
    lights = clientfield::get("robot_lights");
    flicker = lights == 1;
    if (lights == 0 || flicker) {
        robotlighting(localclientnum, entity, flicker, newvalue);
    }
}

// Namespace robotclientutils/archetype_robot
// Params 7, eflags: 0x1 linked
// Checksum 0x87968798, Offset: 0xab0
// Size: 0x112
function robotmindcontrolexplosionhandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    entity = self;
    if (!isdefined(entity) || !entity isai() || isdefined(entity.archetype) && entity.archetype != "robot") {
        return;
    }
    switch (newvalue) {
    case 1:
        entity.explosionfx = util::playfxontag(localclientnum, level._effect[#"fx_exp_robot_stage3_evb"], entity, "j_spineupper");
        break;
    }
}


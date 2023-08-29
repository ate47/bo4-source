// Atian COD Tools GSC decompiler test
#include scripts/core_common/flagsys_shared.gsc;
#include scripts/mp_common/item_world.gsc;
#include scripts/core_common/player/player_stats.gsc;

#namespace namespace_9723fa3;

// Namespace namespace_9723fa3/namespace_9723fa3
// Params 0, eflags: 0x2
// Checksum 0x3d117121, Offset: 0xe8
// Size: 0xb2
function autoexec __init() {
    level.var_65f7ae17 = isdefined(getgametypesetting(#"hash_270230afc32e5549")) ? getgametypesetting(#"hash_270230afc32e5549") : 0;
    level.var_7b65cb7 = isdefined(getgametypesetting(#"hash_2e25d475b271a700")) ? getgametypesetting(#"hash_2e25d475b271a700") : 0;
}

// Namespace namespace_9723fa3/level_init
// Params 1, eflags: 0x40
// Checksum 0xe6ec58b4, Offset: 0x1a8
// Size: 0x54
function event_handler[level_init] main(eventstruct) {
    level thread function_c5d0e538();
    level thread function_68b9a530();
    level thread function_af9a5cd8();
}

// Namespace namespace_9723fa3/namespace_9723fa3
// Params 0, eflags: 0x1 linked
// Checksum 0xf1658058, Offset: 0x208
// Size: 0x1e8
function function_af9a5cd8() {
    if (level.var_7b65cb7) {
        chests = getdynentarray("world_dynent_stash_supply");
        ammo = getdynentarray("world_dynent_stash_ammo");
        health = getdynentarray("world_dynent_stash_health");
        foreach (dynent in chests) {
            add_helico(dynent, #"hash_3904843a3766b7f0");
        }
        foreach (dynent in ammo) {
            add_helico(dynent, #"hash_2f2a5c17b72fb1e9");
        }
        foreach (dynent in health) {
            add_helico(dynent, #"hash_44278e5311d869f1");
        }
    }
}

// Namespace namespace_9723fa3/namespace_9723fa3
// Params 0, eflags: 0x1 linked
// Checksum 0xcd29c471, Offset: 0x3f8
// Size: 0xe8
function function_68b9a530() {
    level endon(#"game_ended");
    level flagsys::wait_till(#"hash_507a4486c4a79f1d");
    waitframe(1);
    if (!level.var_65f7ae17) {
        dynents = getdynentarray("wz_holiday_props");
        foreach (dynent in dynents) {
            function_e2a06860(dynent, 1);
        }
    }
}

// Namespace namespace_9723fa3/namespace_9723fa3
// Params 0, eflags: 0x1 linked
// Checksum 0xaf1b33ee, Offset: 0x4e8
// Size: 0x6fc
function function_c5d0e538() {
    dynents = getdynentarray("wz_holiday_props");
    if (!level.var_65f7ae17) {
        foreach (dynent in dynents) {
            function_e2a06860(dynent, 1);
        }
        hidemiscmodels("wz_holiday_props");
    } else {
        chests = getdynentarray("world_dynent_stash_supply");
        ammo = getdynentarray("world_dynent_stash_ammo");
        health = getdynentarray("world_dynent_stash_health");
        foreach (dynent in chests) {
            add_helico(dynent, #"hash_34dd887cca7fc6e8");
        }
        foreach (dynent in ammo) {
            add_helico(dynent, #"hash_192aa37d3cdeacd1");
        }
        foreach (dynent in health) {
            add_helico(dynent, #"hash_2a9abddabd506fa5");
        }
        var_76c1a919 = getdynent(#"hospital_stash");
        if (isdefined(var_76c1a919)) {
            add_helico(var_76c1a919, #"hash_5e132c061625eb87");
        }
        var_80d7570e = getdynent(#"hash_ca8b234ad1fea38");
        if (isdefined(var_80d7570e)) {
            add_helico(var_80d7570e, #"hash_5e132c061625eb87");
        }
        var_e6c8e160 = getdynent(#"zombie_stash_graveyard");
        if (isdefined(var_e6c8e160)) {
            add_helico(var_e6c8e160, #"hash_5e132c061625eb87");
        }
        var_726be3fe = getdynent(#"zombie_stash_graveyard_quest");
        if (isdefined(var_726be3fe)) {
            add_helico(var_726be3fe, #"hash_5e132c061625eb87");
        }
        var_e18572a7 = getdynent(#"hash_678a1efded2b597a");
        if (isdefined(var_e18572a7)) {
            add_helico(var_e18572a7, #"hash_5e132c061625eb87");
        }
        var_676cdb27 = getdynent(#"hash_33f7121f70c3065f");
        if (isdefined(var_676cdb27)) {
            add_helico(var_676cdb27, #"hash_5e132c061625eb87");
        }
        var_275d4dfc = getdynent(#"hash_2141ecb8d2d86b22");
        if (isdefined(var_275d4dfc)) {
            add_helico(var_275d4dfc, #"hash_5e132c061625eb87");
        }
        var_667d5645 = getdynent(#"hash_2b546c0315159617");
        if (isdefined(var_667d5645)) {
            add_helico(var_667d5645, #"hash_5e132c061625eb87");
        }
        var_6d0e8b71 = getdynent(#"hash_1b83b702bbaae298");
        if (isdefined(var_6d0e8b71)) {
            add_helico(var_6d0e8b71, #"hash_5e132c061625eb87");
        }
        var_b9d1e3a4 = getdynent(#"hash_6a0d13acf3e5687d");
        if (isdefined(var_b9d1e3a4)) {
            add_helico(var_b9d1e3a4, #"hash_5e132c061625eb87");
        }
        var_facd88e0 = getdynent(#"hash_43d72946b8b0dcb2");
        if (isdefined(var_facd88e0)) {
            add_helico(var_facd88e0, #"hash_5e132c061625eb87");
        }
        var_cd5ee6fb = getdynent(#"hash_183c9fe8af52fac7");
        if (isdefined(var_cd5ee6fb)) {
            add_helico(var_cd5ee6fb, #"hash_5e132c061625eb87");
        }
        var_d3db07bc = getdynent(#"hash_468067e2be6e3cfd");
        if (isdefined(var_d3db07bc)) {
            add_helico(var_d3db07bc, #"hash_5e132c061625eb87");
        }
        var_955bd1d9 = getdynent(#"hash_49e8a607ea22e650");
        if (isdefined(var_955bd1d9)) {
            add_helico(var_955bd1d9, #"hash_5e132c061625eb87");
        }
    }
}


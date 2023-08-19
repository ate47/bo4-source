// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace prototype_hud;

// Namespace prototype_hud
// Method(s) 22 Total 28
class cprototype_hud : cluielem {

    // Namespace cprototype_hud/prototype_hud
    // Params 0, eflags: 0x8
    // Checksum 0x8ad7fa37, Offset: 0x6f0
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x6bbacb80, Offset: 0x1050
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x83443c4, Offset: 0x1018
    // Size: 0x30
    function set_deploy_prompt_visibility(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "deploy_prompt_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x35f7fed4, Offset: 0xfe0
    // Size: 0x30
    function set_fail_fanfare_visibility(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "fail_fanfare_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x63172253, Offset: 0xfa8
    // Size: 0x30
    function set_fanfare_visibility(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "fanfare_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x2a074ed0, Offset: 0xf70
    // Size: 0x30
    function set_objective3_strike(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "objective3_strike", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xbcf5371d, Offset: 0xf38
    // Size: 0x30
    function set_objective2_strike(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "objective2_strike", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xc13d27e2, Offset: 0xf00
    // Size: 0x30
    function set_objective1_strike(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "objective1_strike", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xe57d23f1, Offset: 0xec8
    // Size: 0x30
    function set_objective_prompt_visibility(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "objective_prompt_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xba28cf0e, Offset: 0xe90
    // Size: 0x30
    function set_objective3_string(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "objective3_string", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x8382105, Offset: 0xe58
    // Size: 0x30
    function set_objective2_string(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "objective2_string", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xcc57aed, Offset: 0xe20
    // Size: 0x30
    function set_objective1_string(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "objective1_string", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xb0024386, Offset: 0xde8
    // Size: 0x30
    function set_active_objective_string(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "active_objective_string", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x575562d, Offset: 0xdb0
    // Size: 0x30
    function set_craft_progress(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "craft_progress", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x65d5fa3f, Offset: 0xd78
    // Size: 0x30
    function set_resource_count_visibility(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "resource_count_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x36368d7f, Offset: 0xd40
    // Size: 0x30
    function set_defense_resource_count(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "defense_resource_count", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xb55b386d, Offset: 0xd08
    // Size: 0x30
    function set_upgrade_resource_count(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "upgrade_resource_count", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x345ec1ca, Offset: 0xcd0
    // Size: 0x30
    function set_barrier_prompt_visibility(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "barrier_prompt_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 1, eflags: 0x0
    // Checksum 0x9ed57063, Offset: 0xc98
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"prototype_hud");
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 1, eflags: 0x0
    // Checksum 0xa9e2b35c, Offset: 0xa70
    // Size: 0x220
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "barrier_prompt_visibility", 0);
        [[ self ]]->set_data(localclientnum, "upgrade_resource_count", 0);
        [[ self ]]->set_data(localclientnum, "defense_resource_count", 0);
        [[ self ]]->set_data(localclientnum, "resource_count_visibility", 0);
        [[ self ]]->set_data(localclientnum, "craft_progress", 0);
        [[ self ]]->set_data(localclientnum, "active_objective_string", #"hash_0");
        [[ self ]]->set_data(localclientnum, "objective1_string", #"hash_0");
        [[ self ]]->set_data(localclientnum, "objective2_string", #"hash_0");
        [[ self ]]->set_data(localclientnum, "objective3_string", #"hash_0");
        [[ self ]]->set_data(localclientnum, "objective_prompt_visibility", 0);
        [[ self ]]->set_data(localclientnum, "objective1_strike", 0);
        [[ self ]]->set_data(localclientnum, "objective2_strike", 0);
        [[ self ]]->set_data(localclientnum, "objective3_strike", 0);
        [[ self ]]->set_data(localclientnum, "fanfare_visibility", 0);
        [[ self ]]->set_data(localclientnum, "fail_fanfare_visibility", 0);
        [[ self ]]->set_data(localclientnum, "deploy_prompt_visibility", 0);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 1, eflags: 0x0
    // Checksum 0x9255c0e2, Offset: 0xa40
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 11, eflags: 0x0
    // Checksum 0x14be2db8, Offset: 0x710
    // Size: 0x324
    function setup_clientfields(uid, var_fdf544c8, var_33c5c30f, var_96284758, var_bde1ea58, var_9a41cc6b, var_532cdc1a, var_3e5d22, var_61c0f0c1, var_5dd927bd, var_7a99f2e1, var_f3632296, var_d59bef9f, var_be5884c9, var_b5ae72b8, var_2b966169, var_83a9258) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("barrier_prompt_visibility", 4000, 1, "int", var_fdf544c8);
        cluielem::add_clientfield("upgrade_resource_count", 4000, 8, "int", var_33c5c30f);
        cluielem::add_clientfield("defense_resource_count", 4000, 8, "int", var_96284758);
        cluielem::add_clientfield("resource_count_visibility", 4000, 1, "int", var_bde1ea58);
        cluielem::add_clientfield("craft_progress", 4000, 5, "float", var_9a41cc6b);
        cluielem::function_dcb34c80("string", "active_objective_string", 4000);
        cluielem::function_dcb34c80("string", "objective1_string", 4000);
        cluielem::function_dcb34c80("string", "objective2_string", 4000);
        cluielem::function_dcb34c80("string", "objective3_string", 4000);
        cluielem::add_clientfield("objective_prompt_visibility", 4000, 1, "int", var_7a99f2e1);
        cluielem::add_clientfield("objective1_strike", 4000, 1, "int", var_f3632296);
        cluielem::add_clientfield("objective2_strike", 4000, 1, "int", var_d59bef9f);
        cluielem::add_clientfield("objective3_strike", 4000, 1, "int", var_be5884c9);
        cluielem::add_clientfield("fanfare_visibility", 4000, 1, "int", var_b5ae72b8);
        cluielem::add_clientfield("fail_fanfare_visibility", 4000, 1, "int", var_2b966169);
        cluielem::add_clientfield("deploy_prompt_visibility", 4000, 1, "int", var_83a9258);
    }

}

// Namespace prototype_hud/prototype_hud
// Params 17, eflags: 0x0
// Checksum 0x15f92ce7, Offset: 0x228
// Size: 0x100
function register(uid, var_fdf544c8, var_33c5c30f, var_96284758, var_bde1ea58, var_9a41cc6b, var_532cdc1a, var_3e5d22, var_61c0f0c1, var_5dd927bd, var_7a99f2e1, var_f3632296, var_d59bef9f, var_be5884c9, var_b5ae72b8, var_2b966169, var_83a9258) {
    elem = new cprototype_hud();
    [[ elem ]]->setup_clientfields(uid, var_fdf544c8, var_33c5c30f, var_96284758, var_bde1ea58, var_9a41cc6b, var_532cdc1a, var_3e5d22, var_61c0f0c1, var_5dd927bd, var_7a99f2e1, var_f3632296, var_d59bef9f, var_be5884c9, var_b5ae72b8, var_2b966169, var_83a9258);
    return elem;
}

// Namespace prototype_hud/prototype_hud
// Params 1, eflags: 0x0
// Checksum 0x6ecba657, Offset: 0x330
// Size: 0x40
function register_clientside(uid) {
    elem = new cprototype_hud();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace prototype_hud/prototype_hud
// Params 1, eflags: 0x0
// Checksum 0xfb258825, Offset: 0x378
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace prototype_hud/prototype_hud
// Params 1, eflags: 0x0
// Checksum 0xd92c2363, Offset: 0x3a0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace prototype_hud/prototype_hud
// Params 1, eflags: 0x0
// Checksum 0xee1d3d72, Offset: 0x3c8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xe5752ec5, Offset: 0x3f0
// Size: 0x28
function set_barrier_prompt_visibility(localclientnum, value) {
    [[ self ]]->set_barrier_prompt_visibility(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xbe7bd400, Offset: 0x420
// Size: 0x28
function set_upgrade_resource_count(localclientnum, value) {
    [[ self ]]->set_upgrade_resource_count(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xa152ab90, Offset: 0x450
// Size: 0x28
function set_defense_resource_count(localclientnum, value) {
    [[ self ]]->set_defense_resource_count(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x8b5c8fa3, Offset: 0x480
// Size: 0x28
function set_resource_count_visibility(localclientnum, value) {
    [[ self ]]->set_resource_count_visibility(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xc34a08c2, Offset: 0x4b0
// Size: 0x28
function set_craft_progress(localclientnum, value) {
    [[ self ]]->set_craft_progress(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x8c5053c2, Offset: 0x4e0
// Size: 0x28
function set_active_objective_string(localclientnum, value) {
    [[ self ]]->set_active_objective_string(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xbed05bd8, Offset: 0x510
// Size: 0x28
function set_objective1_string(localclientnum, value) {
    [[ self ]]->set_objective1_string(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xced478e0, Offset: 0x540
// Size: 0x28
function set_objective2_string(localclientnum, value) {
    [[ self ]]->set_objective2_string(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x71e995f9, Offset: 0x570
// Size: 0x28
function set_objective3_string(localclientnum, value) {
    [[ self ]]->set_objective3_string(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x6c55145, Offset: 0x5a0
// Size: 0x28
function set_objective_prompt_visibility(localclientnum, value) {
    [[ self ]]->set_objective_prompt_visibility(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xd0218f88, Offset: 0x5d0
// Size: 0x28
function set_objective1_strike(localclientnum, value) {
    [[ self ]]->set_objective1_strike(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x23a72b1c, Offset: 0x600
// Size: 0x28
function set_objective2_strike(localclientnum, value) {
    [[ self ]]->set_objective2_strike(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x3b052135, Offset: 0x630
// Size: 0x28
function set_objective3_strike(localclientnum, value) {
    [[ self ]]->set_objective3_strike(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x16c785e, Offset: 0x660
// Size: 0x28
function set_fanfare_visibility(localclientnum, value) {
    [[ self ]]->set_fanfare_visibility(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x16fc2e60, Offset: 0x690
// Size: 0x28
function set_fail_fanfare_visibility(localclientnum, value) {
    [[ self ]]->set_fail_fanfare_visibility(localclientnum, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x412797db, Offset: 0x6c0
// Size: 0x28
function set_deploy_prompt_visibility(localclientnum, value) {
    [[ self ]]->set_deploy_prompt_visibility(localclientnum, value);
}


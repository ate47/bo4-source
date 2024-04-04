// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace prototype_hud;

// Namespace prototype_hud
// Method(s) 21 Total 28
class cprototype_hud : cluielem {

    var var_47e79fc;

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x9bd15039, Offset: 0xda0
    // Size: 0x3c
    function set_deploy_prompt_visibility(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "deploy_prompt_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xa9bbffbd, Offset: 0xd58
    // Size: 0x3c
    function set_fail_fanfare_visibility(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "fail_fanfare_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xca916871, Offset: 0xd10
    // Size: 0x3c
    function set_fanfare_visibility(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "fanfare_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xfbd1de33, Offset: 0xcc8
    // Size: 0x3c
    function set_objective3_strike(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "objective3_strike", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xcf9d1bd0, Offset: 0xc80
    // Size: 0x3c
    function set_objective2_strike(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "objective2_strike", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x7b924f7f, Offset: 0xc38
    // Size: 0x3c
    function set_objective1_strike(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "objective1_strike", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x38273724, Offset: 0xbf0
    // Size: 0x3c
    function set_objective_prompt_visibility(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "objective_prompt_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xf6f0374e, Offset: 0xba8
    // Size: 0x3c
    function set_objective3_string(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "objective3_string", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xcbdac031, Offset: 0xb60
    // Size: 0x3c
    function set_objective2_string(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "objective2_string", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x2becf7c4, Offset: 0xb18
    // Size: 0x3c
    function set_objective1_string(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "objective1_string", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xba7a32eb, Offset: 0xad0
    // Size: 0x3c
    function set_active_objective_string(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "active_objective_string", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xe2c4bf8, Offset: 0xa88
    // Size: 0x3c
    function set_craft_progress(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "craft_progress", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x1c66732b, Offset: 0xa40
    // Size: 0x3c
    function set_resource_count_visibility(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "resource_count_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xa007f782, Offset: 0x9f8
    // Size: 0x3c
    function set_defense_resource_count(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "defense_resource_count", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xb7aeb639, Offset: 0x9b0
    // Size: 0x3c
    function set_upgrade_resource_count(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "upgrade_resource_count", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0x91ad8421, Offset: 0x968
    // Size: 0x3c
    function set_barrier_prompt_visibility(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "barrier_prompt_visibility", value);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 1, eflags: 0x0
    // Checksum 0xd42aee95, Offset: 0x938
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 2, eflags: 0x0
    // Checksum 0xb70060fa, Offset: 0x8e8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "prototype_hud", persistent);
    }

    // Namespace cprototype_hud/prototype_hud
    // Params 1, eflags: 0x0
    // Checksum 0x900faa92, Offset: 0x638
    // Size: 0x2a4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("barrier_prompt_visibility", 4000, 1, "int");
        cluielem::add_clientfield("upgrade_resource_count", 4000, 8, "int");
        cluielem::add_clientfield("defense_resource_count", 4000, 8, "int");
        cluielem::add_clientfield("resource_count_visibility", 4000, 1, "int");
        cluielem::add_clientfield("craft_progress", 4000, 5, "float");
        cluielem::function_dcb34c80("string", "active_objective_string", 4000);
        cluielem::function_dcb34c80("string", "objective1_string", 4000);
        cluielem::function_dcb34c80("string", "objective2_string", 4000);
        cluielem::function_dcb34c80("string", "objective3_string", 4000);
        cluielem::add_clientfield("objective_prompt_visibility", 4000, 1, "int");
        cluielem::add_clientfield("objective1_strike", 4000, 1, "int");
        cluielem::add_clientfield("objective2_strike", 4000, 1, "int");
        cluielem::add_clientfield("objective3_strike", 4000, 1, "int");
        cluielem::add_clientfield("fanfare_visibility", 4000, 1, "int");
        cluielem::add_clientfield("fail_fanfare_visibility", 4000, 1, "int");
        cluielem::add_clientfield("deploy_prompt_visibility", 4000, 1, "int");
    }

}

// Namespace prototype_hud/prototype_hud
// Params 1, eflags: 0x0
// Checksum 0xf9bf629c, Offset: 0x240
// Size: 0x40
function register(uid) {
    elem = new cprototype_hud();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x8720b9f4, Offset: 0x288
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace prototype_hud/prototype_hud
// Params 1, eflags: 0x0
// Checksum 0xa34a2964, Offset: 0x2c8
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace prototype_hud/prototype_hud
// Params 1, eflags: 0x0
// Checksum 0xc3f00b51, Offset: 0x2f0
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xf5e16b7b, Offset: 0x318
// Size: 0x28
function set_barrier_prompt_visibility(player, value) {
    [[ self ]]->set_barrier_prompt_visibility(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x37efdfa4, Offset: 0x348
// Size: 0x28
function set_upgrade_resource_count(player, value) {
    [[ self ]]->set_upgrade_resource_count(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x9a52cf9c, Offset: 0x378
// Size: 0x28
function set_defense_resource_count(player, value) {
    [[ self ]]->set_defense_resource_count(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xcd246604, Offset: 0x3a8
// Size: 0x28
function set_resource_count_visibility(player, value) {
    [[ self ]]->set_resource_count_visibility(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x107c6edf, Offset: 0x3d8
// Size: 0x28
function set_craft_progress(player, value) {
    [[ self ]]->set_craft_progress(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xec2383fe, Offset: 0x408
// Size: 0x28
function set_active_objective_string(player, value) {
    [[ self ]]->set_active_objective_string(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xa21d1015, Offset: 0x438
// Size: 0x28
function set_objective1_string(player, value) {
    [[ self ]]->set_objective1_string(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xfe8fa60b, Offset: 0x468
// Size: 0x28
function set_objective2_string(player, value) {
    [[ self ]]->set_objective2_string(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x30e73db1, Offset: 0x498
// Size: 0x28
function set_objective3_string(player, value) {
    [[ self ]]->set_objective3_string(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x90749bb7, Offset: 0x4c8
// Size: 0x28
function set_objective_prompt_visibility(player, value) {
    [[ self ]]->set_objective_prompt_visibility(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x5195e9ef, Offset: 0x4f8
// Size: 0x28
function set_objective1_strike(player, value) {
    [[ self ]]->set_objective1_strike(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x9b00b84a, Offset: 0x528
// Size: 0x28
function set_objective2_strike(player, value) {
    [[ self ]]->set_objective2_strike(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xaa6c1924, Offset: 0x558
// Size: 0x28
function set_objective3_strike(player, value) {
    [[ self ]]->set_objective3_strike(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xabacbbca, Offset: 0x588
// Size: 0x28
function set_fanfare_visibility(player, value) {
    [[ self ]]->set_fanfare_visibility(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0x6a6d29b5, Offset: 0x5b8
// Size: 0x28
function set_fail_fanfare_visibility(player, value) {
    [[ self ]]->set_fail_fanfare_visibility(player, value);
}

// Namespace prototype_hud/prototype_hud
// Params 2, eflags: 0x0
// Checksum 0xf608c7ab, Offset: 0x5e8
// Size: 0x28
function set_deploy_prompt_visibility(player, value) {
    [[ self ]]->set_deploy_prompt_visibility(player, value);
}


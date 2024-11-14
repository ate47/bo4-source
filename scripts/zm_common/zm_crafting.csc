#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_progress;
#using scripts\zm_common\zm_items;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;

#namespace zm_crafting;

// Namespace zm_crafting/zm_crafting
// Params 0, eflags: 0x2
// Checksum 0xba45476a, Offset: 0xd0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_crafting", &__init__, &__main__, undefined);
}

// Namespace zm_crafting/zm_crafting
// Params 0, eflags: 0x1 linked
// Checksum 0x7aa1e174, Offset: 0x120
// Size: 0x1e
function __init__() {
    level.var_5df2581a = [];
    level.crafting_components = [];
}

// Namespace zm_crafting/zm_crafting
// Params 0, eflags: 0x1 linked
// Checksum 0xeda5e7a6, Offset: 0x148
// Size: 0x14
function __main__() {
    function_60a6c623();
}

// Namespace zm_crafting/zm_crafting
// Params 0, eflags: 0x1 linked
// Checksum 0x3c4db8b9, Offset: 0x168
// Size: 0x98
function function_60a6c623() {
    foundries = getscriptbundles("craftfoundry");
    foreach (foundry in foundries) {
        setup_craftfoundry(foundry);
    }
}

// Namespace zm_crafting/zm_crafting
// Params 1, eflags: 0x1 linked
// Checksum 0xcfcef004, Offset: 0x208
// Size: 0x262
function setup_craftfoundry(craftfoundry) {
    if (isdefined(craftfoundry)) {
        if (!(isdefined(craftfoundry.loaded) && craftfoundry.loaded)) {
            craftfoundry.loaded = 1;
            craftfoundry.blueprints = [];
            switch (craftfoundry.var_2a2adea3) {
            case 8:
                craftfoundry.blueprints[7] = function_b18074d0(craftfoundry.blueprint08);
            case 7:
                craftfoundry.blueprints[6] = function_b18074d0(craftfoundry.blueprint07);
            case 6:
                craftfoundry.blueprints[5] = function_b18074d0(craftfoundry.blueprint06);
            case 5:
                craftfoundry.blueprints[4] = function_b18074d0(craftfoundry.blueprint05);
            case 4:
                craftfoundry.blueprints[3] = function_b18074d0(craftfoundry.blueprint04);
            case 3:
                craftfoundry.blueprints[2] = function_b18074d0(craftfoundry.blueprint03);
            case 2:
                craftfoundry.blueprints[1] = function_b18074d0(craftfoundry.blueprint02);
            case 1:
                craftfoundry.blueprints[0] = function_b18074d0(craftfoundry.blueprint01);
                break;
            }
        }
    }
}

// Namespace zm_crafting/zm_crafting
// Params 1, eflags: 0x1 linked
// Checksum 0x27c0d754, Offset: 0x478
// Size: 0x328
function function_b18074d0(name) {
    blueprint = getscriptbundle(name);
    if (isdefined(blueprint)) {
        if (!(isdefined(blueprint.loaded) && blueprint.loaded)) {
            blueprint.loaded = 1;
            blueprint.name = name;
            blueprint.components = [];
            switch (blueprint.componentcount) {
            case 8:
                blueprint.components[7] = get_component(blueprint.var_f4d434cb);
            case 7:
                blueprint.components[6] = get_component(blueprint.var_e71f1961);
            case 6:
                blueprint.components[5] = get_component(blueprint.registerperk_packa_seepainterminate);
            case 5:
                blueprint.components[4] = get_component(blueprint.var_4282502a);
            case 4:
                blueprint.components[3] = get_component(blueprint.var_7b8e4241);
            case 3:
                blueprint.components[2] = get_component(blueprint.var_2e0a273a);
            case 2:
                blueprint.components[1] = get_component(blueprint.var_670f9944);
            case 1:
                blueprint.components[0] = get_component(blueprint.var_99577dd3);
                break;
            }
            blueprint.var_54a97edd = get_component(blueprint.result);
            level.var_5df2581a[name] = blueprint;
            if (!isdefined(blueprint.var_4dbc4aee)) {
                blueprint.var_4dbc4aee = "ERROR: Missing Prompt String";
            }
        }
    } else {
        assertmsg("<dev string:x38>" + name);
    }
    return blueprint;
}

// Namespace zm_crafting/zm_crafting
// Params 1, eflags: 0x1 linked
// Checksum 0xd23d3877, Offset: 0x7a8
// Size: 0x5c
function get_component(component) {
    if (!isdefined(level.crafting_components[component.name])) {
        level.crafting_components[component.name] = component;
    }
    return level.crafting_components[component.name];
}


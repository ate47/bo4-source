// Atian COD Tools GSC decompiler test
#using scripts\mp_common\item_world.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace wz_buoy_stash;

// Namespace wz_buoy_stash/wz_buoy_stash
// Params 0, eflags: 0x2
// Checksum 0x89e5b7e1, Offset: 0xf0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"wz_buoy_stash", &__init__, &__main__, undefined);
}

// Namespace wz_buoy_stash/wz_buoy_stash
// Params 0, eflags: 0x2
// Checksum 0xb0722ece, Offset: 0x140
// Size: 0xae
function autoexec __init() {
    level.var_f45d4bf5 = (isdefined(getgametypesetting(#"hash_3778ec3bd924f17c")) ? getgametypesetting(#"hash_3778ec3bd924f17c") : 0) && (isdefined(getgametypesetting(#"hash_1f840366731cc3e")) ? getgametypesetting(#"hash_1f840366731cc3e") : 0);
}

// Namespace wz_buoy_stash/wz_buoy_stash
// Params 0, eflags: 0x1 linked
// Checksum 0x732a532d, Offset: 0x1f8
// Size: 0x34
function __init__() {
    clientfield::register("scriptmover", "buoy_light_fx_changed", 1, 2, "int");
}

// Namespace wz_buoy_stash/wz_buoy_stash
// Params 0, eflags: 0x1 linked
// Checksum 0x4af9dd2d, Offset: 0x238
// Size: 0x1c
function __main__() {
    level thread function_c621758a();
}

// Namespace wz_buoy_stash/wz_buoy_stash
// Params 0, eflags: 0x1 linked
// Checksum 0xcec92413, Offset: 0x260
// Size: 0x298
function function_c621758a() {
    var_90b35a6a = struct::get_array("buoy_stash", "targetname");
    foreach (scene in var_90b35a6a) {
        wait(randomint(4));
        scene thread scene::play(#"p8_fxanim_wz_floating_buoy_bundle");
    }
    if (!level.var_f45d4bf5) {
        var_3d8e32a8 = getdynent("dock_yard_stash_2");
        item_world::function_4de3ca98();
        if (isdefined(var_3d8e32a8)) {
            item_world::function_160294c7(var_3d8e32a8);
        }
        return;
    }
    item_world::function_4de3ca98();
    foreach (scene in var_90b35a6a) {
        var_3d8e32a8 = getdynent("dock_yard_stash_2");
        if (isdefined(var_3d8e32a8)) {
            var_e052e788 = distance2d(var_3d8e32a8.origin, scene.origin);
            if (var_e052e788 < 200) {
                scene.scene_ents[#"prop 1"] clientfield::set("buoy_light_fx_changed", 2);
                scene.scene_ents[#"prop 1"] function_5a6d95();
                continue;
            }
            scene.scene_ents[#"prop 1"] clientfield::set("buoy_light_fx_changed", 1);
        }
    }
}

// Namespace wz_buoy_stash/wz_buoy_stash
// Params 0, eflags: 0x1 linked
// Checksum 0x989a476c, Offset: 0x500
// Size: 0xa4
function function_5a6d95() {
    buoy_stash = getdynent("dock_yard_stash_2");
    var_63ee2ffd = 0;
    if (isdefined(buoy_stash)) {
        while (!var_63ee2ffd && isdefined(self)) {
            if (function_ffdbe8c2(buoy_stash) == 2) {
                var_63ee2ffd = 1;
                self clientfield::set("buoy_light_fx_changed", 1);
                break;
            }
            wait(1);
        }
    }
}


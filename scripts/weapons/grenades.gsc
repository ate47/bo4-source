// Atian COD Tools GSC decompiler test
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace grenades;

// Namespace grenades/grenades
// Params 0, eflags: 0x1 linked
// Checksum 0x87b60f9, Offset: 0x88
// Size: 0xac
function init_shared() {
    weaponobjects::function_e6400478(#"eq_sticky_grenade", &creategrenadewatcher, 1);
    weaponobjects::function_e6400478(#"concussion_grenade", &creategrenadewatcher, 1);
    weaponobjects::function_e6400478(#"hash_5825488ac68418af", &creategrenadewatcher, 1);
}

// Namespace grenades/grenades
// Params 1, eflags: 0x1 linked
// Checksum 0xa8974499, Offset: 0x140
// Size: 0x26
function creategrenadewatcher(watcher) {
    watcher.onspawn = &function_aa95d684;
}

// Namespace grenades/grenades
// Params 2, eflags: 0x1 linked
// Checksum 0x72b8e77d, Offset: 0x170
// Size: 0x4c
function function_aa95d684(watcher, player) {
    self clientfield::set("enemyequip", 1);
    self thread function_5f86757d();
}

// Namespace grenades/grenades
// Params 0, eflags: 0x1 linked
// Checksum 0xaaea4cd2, Offset: 0x1c8
// Size: 0x6c
function function_5f86757d() {
    level endon(#"game_ended");
    self waittill(#"explode", #"death");
    if (!isdefined(self)) {
        return;
    }
    self clientfield::set("enemyequip", 0);
}


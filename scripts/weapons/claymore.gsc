// Atian COD Tools GSC decompiler test
#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\proximity_grenade.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace claymore;

// Namespace claymore/claymore
// Params 0, eflags: 0x2
// Checksum 0xf6fd6a84, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"claymore", &init_shared, undefined, undefined);
}

// Namespace claymore/claymore
// Params 0, eflags: 0x0
// Checksum 0x2cffcf19, Offset: 0xf8
// Size: 0x2c
function init_shared() {
    weaponobjects::function_e6400478("claymore", &createclaymorewatcher, 0);
}

// Namespace claymore/claymore
// Params 1, eflags: 0x0
// Checksum 0xe57c47fe, Offset: 0x130
// Size: 0x18e
function createclaymorewatcher(watcher) {
    watcher.watchforfire = 1;
    watcher.activatesound = #"wpn_claymore_alert";
    watcher.hackable = 1;
    watcher.hackertoolradius = level.equipmenthackertoolradius;
    watcher.hackertooltimems = level.equipmenthackertooltimems;
    watcher.ownergetsassist = 1;
    watcher.ignoredirection = undefined;
    watcher.immediatedetonation = 1;
    watcher.immunespecialty = "specialty_immunetriggerbetty";
    watcher.deleteonplayerspawn = 0;
    watcher.detectiondot = cos(70);
    watcher.detectionmindist = 20;
    watcher.detectiongraceperiod = 0.6;
    watcher.stuntime = 1;
    watcher.ondetonatecallback = &proximity_grenade::proximitydetonate;
    watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
    watcher.onspawn = &function_c9893179;
    watcher.stun = &weaponobjects::weaponstun;
    watcher.var_994b472b = &function_aeb91d3;
}

// Namespace claymore/claymore
// Params 1, eflags: 0x0
// Checksum 0x2cc35c54, Offset: 0x2c8
// Size: 0x24
function function_aeb91d3(player) {
    self weaponobjects::weaponobjectfizzleout();
}

// Namespace claymore/claymore
// Params 2, eflags: 0x0
// Checksum 0xa03511a5, Offset: 0x2f8
// Size: 0x52
function function_c9893179(watcher, player) {
    proximity_grenade::onspawnproximitygrenadeweaponobject(watcher, player);
    self.weapon = getweapon(#"claymore");
}


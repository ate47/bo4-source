// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_placeable_mine.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\bouncingbetty.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace bouncingbetty;

// Namespace bouncingbetty/zm_weap_bouncingbetty
// Params 0, eflags: 0x2
// Checksum 0xd351979f, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"bouncingbetty", &__init__, undefined, undefined);
}

// Namespace bouncingbetty/zm_weap_bouncingbetty
// Params 0, eflags: 0x0
// Checksum 0xf46f800b, Offset: 0x100
// Size: 0x11c
function __init__() {
    level._proximityweaponobjectdetonation_override = &proximityweaponobjectdetonation_override;
    init_shared();
    zm_placeable_mine::add_mine_type("bouncingbetty", #"zombie/betty_pickup");
    level.bettyjumpheight = 55;
    level.bettydamagemax = 1000;
    level.bettydamagemin = 800;
    level.bettydamageheight = level.bettyjumpheight;
    /#
        setdvar(#"betty_damage_max", level.bettydamagemax);
        setdvar(#"betty_damage_min", level.bettydamagemin);
        setdvar(#"betty_jump_height_onground", level.bettyjumpheight);
    #/
}

// Namespace bouncingbetty/zm_weap_bouncingbetty
// Params 1, eflags: 0x0
// Checksum 0xcc7a5c69, Offset: 0x228
// Size: 0x170
function proximityweaponobjectdetonation_override(watcher) {
    self endon(#"death", #"hacked", #"kill_target_detection");
    weaponobjects::proximityweaponobject_activationdelay(watcher);
    damagearea = weaponobjects::proximityweaponobject_createdamagearea(watcher);
    up = anglestoup(self.angles);
    traceorigin = self.origin + up;
    while (true) {
        waitresult = undefined;
        waitresult = damagearea waittill(#"trigger");
        ent = waitresult.activator;
        if (!weaponobjects::proximityweaponobject_validtriggerentity(watcher, ent)) {
            continue;
        }
        if (weaponobjects::proximityweaponobject_isspawnprotected(watcher, ent)) {
            continue;
        }
        if (ent damageconetrace(traceorigin, self) > 0) {
            thread weaponobjects::proximityweaponobject_dodetonation(watcher, ent, traceorigin);
        }
    }
}


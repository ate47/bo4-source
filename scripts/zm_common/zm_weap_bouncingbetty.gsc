// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_placeable_mine.gsc;
#include scripts/zm_common/util.gsc;
#include scripts/weapons/weaponobjects.gsc;
#include scripts/weapons/bouncingbetty.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/struct.gsc;

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
    zm_placeable_mine::add_mine_type("bouncingbetty", #"hash_613df6d5f8eddffd");
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
    while (1) {
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


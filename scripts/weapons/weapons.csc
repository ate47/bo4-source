// Atian COD Tools GSC decompiler test
#using scripts\core_common\clientfield_shared.csc;

#namespace weapons;

// Namespace weapons/weapons
// Params 0, eflags: 0x1 linked
// Checksum 0xc65c21, Offset: 0xa8
// Size: 0x64
function init_shared() {
    level.weaponnone = getweapon(#"none");
    clientfield::register("clientuimodel", "hudItems.pickupHintWeaponIndex", 1, 10, "int", undefined, 0, 0);
}


// Atian COD Tools GSC decompiler test
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;

#namespace zm_weap_spknifeork;

// Namespace zm_weap_spknifeork/zm_weap_spknifeork
// Params 0, eflags: 0x2
// Checksum 0x8ab58af2, Offset: 0xb8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"spknifeork", &__init__, &__main__, undefined);
}

// Namespace zm_weap_spknifeork/zm_weap_spknifeork
// Params 0, eflags: 0x5 linked
// Checksum 0x37f6a7e0, Offset: 0x108
// Size: 0x7c
function private __init__() {
    zm_melee_weapon::init(#"spknifeork", #"spknifeork_flourish", 1000, "spknifeork", undefined, "spknifeork", undefined);
    zm::function_84d343d(#"spknifeork", &function_958c4578);
}

// Namespace zm_weap_spknifeork/zm_weap_spknifeork
// Params 0, eflags: 0x5 linked
// Checksum 0xf4e7fea8, Offset: 0x190
// Size: 0x24
function private __main__() {
    callback::on_connect(&function_3b1ba6c7);
}

// Namespace zm_weap_spknifeork/zm_weap_spknifeork
// Params 0, eflags: 0x1 linked
// Checksum 0x257edd45, Offset: 0x1c0
// Size: 0x24
function function_3b1ba6c7() {
    self callback::function_33f0ddd3(&function_c6b2d4d8);
}

// Namespace zm_weap_spknifeork/zm_weap_spknifeork
// Params 1, eflags: 0x5 linked
// Checksum 0x9807e251, Offset: 0x1f0
// Size: 0x10c
function private function_c6b2d4d8(s_event) {
    if (s_event.event === "give_weapon") {
        if (s_event.weapon === getweapon(#"golden_knife")) {
            level.var_bdba6ee8[s_event.weapon] = 0.1;
            self thread aat::acquire(s_event.weapon);
            return;
        }
        if (s_event.weapon === getweapon(#"spknifeork")) {
            level.var_bdba6ee8[s_event.weapon] = 0.2;
            self thread aat::acquire(s_event.weapon);
        }
    }
}

// Namespace zm_weap_spknifeork/zm_weap_spknifeork
// Params 12, eflags: 0x1 linked
// Checksum 0x1198360a, Offset: 0x308
// Size: 0x6a
function function_958c4578(einflictor, eattacker, idamage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    return 75809;
}


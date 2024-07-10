#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;

#namespace zm_weap_golden_knife;

// Namespace zm_weap_golden_knife/zm_weap_golden_knife
// Params 0, eflags: 0x2
// Checksum 0x322f13d6, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"golden_knife", &__init__, &__main__, undefined);
}

// Namespace zm_weap_golden_knife/zm_weap_golden_knife
// Params 0, eflags: 0x5 linked
// Checksum 0x3d8a8586, Offset: 0xe0
// Size: 0x44
function private __init__() {
    zm_melee_weapon::init(#"golden_knife", #"golden_knife_flourish", 1000, "golden_knife", undefined, undefined, undefined);
}

// Namespace zm_weap_golden_knife/zm_weap_golden_knife
// Params 0, eflags: 0x5 linked
// Checksum 0x80f724d1, Offset: 0x130
// Size: 0x4
function private __main__() {
    
}


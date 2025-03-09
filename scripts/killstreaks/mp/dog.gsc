#using scripts\abilities\ability_power;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\killstreaks\dog_shared;
#using scripts\killstreaks\killstreaks_shared;

#namespace dog;

// Namespace dog/dog
// Params 0, eflags: 0x2
// Checksum 0xc6881507, Offset: 0xc0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"killstreak_dog", &__init__, undefined, #"killstreaks");
}

// Namespace dog/dog
// Params 0, eflags: 0x0
// Checksum 0xdf48a33a, Offset: 0x110
// Size: 0x11c
function __init__() {
    init_shared();
    bundle = struct::get_script_bundle("killstreak", #"killstreak_dog");
    if (isdefined(bundle)) {
        bundle.var_32f64ba3 = "actor_spawner_boct_mp_dog";
    }
    killstreaks::register_bundle(bundle, &spawned);
    killstreaks::allow_assists(bundle.kstype, 1);
    level.var_e2174183 = getweapon(#"ability_dog");
    level.var_da7fa0b = getweapon(#"dog_ai_defaultmelee");
    ability_power::function_9d78823f(level.var_e2174183, level.var_da7fa0b);
}


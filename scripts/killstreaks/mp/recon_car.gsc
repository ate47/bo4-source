#using scripts\mp_common\player\player_utils.gsc;
#using scripts\killstreaks\mp\killstreak_vehicle.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\killstreaks\remote_weapons.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_detect.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace recon_car;

// Namespace recon_car/recon_car
// Params 0, eflags: 0x2
// Checksum 0x6346270c, Offset: 0x130
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"recon_car", &__init__, undefined, #"killstreaks");
}

// Namespace recon_car/recon_car
// Params 0, eflags: 0x1 linked
// Checksum 0xe0b3a074, Offset: 0x180
// Size: 0x44
function __init__() {
    killstreak_detect::init_shared();
    remote_weapons::init_shared();
    killstreaks::function_b5b6ef3e(&init_killstreak);
}

// Namespace recon_car/recon_car
// Params 0, eflags: 0x1 linked
// Checksum 0xdbb1c576, Offset: 0x1d0
// Size: 0xec
function init_killstreak() {
    bundle = struct::get_script_bundle("killstreak", sessionmodeiswarzonegame() ? "killstreak_recon_car_wz" : "killstreak_recon_car");
    killstreak_vehicle::init_killstreak(bundle);
    killstreaks::register_alt_weapon("recon_car", getweapon(#"hash_38ffd09564931482"));
    callback::on_connect(&onplayerconnect);
    vehicle::add_main_callback("vehicle_t8_drone_recon", &function_d1661ada);
}

// Namespace recon_car/recon_car
// Params 0, eflags: 0x1 linked
// Checksum 0x2bf02ad8, Offset: 0x2c8
// Size: 0x22
function onplayerconnect() {
    self.entnum = self getentitynumber();
}

// Namespace recon_car/recon_car
// Params 0, eflags: 0x1 linked
// Checksum 0x77d0f50b, Offset: 0x2f8
// Size: 0x74
function function_d1661ada() {
    self killstreak_vehicle::init_vehicle();
    self util::make_sentient();
    self.var_7d4f75e = 1;
    self.ignore_death_jolt = 1;
    self.var_92043a49 = 1;
    self disabledriverfiring(1);
}


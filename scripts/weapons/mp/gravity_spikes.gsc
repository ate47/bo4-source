#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\weapons\gravity_spikes.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\abilities\ability_player.gsc;

#namespace gravity_spikes;

// Namespace gravity_spikes/gravity_spikes
// Params 0, eflags: 0x2
// Checksum 0xaa1f75a, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gravity_spikes", &__init__, undefined, undefined);
}

// Namespace gravity_spikes/gravity_spikes
// Params 0, eflags: 0x0
// Checksum 0x33cc2cc0, Offset: 0x100
// Size: 0x34
function __init__() {
    init_shared();
    ability_player::register_gadget_activation_callbacks(7, &function_20bb376d, undefined);
}

// Namespace gravity_spikes/gravity_spikes
// Params 2, eflags: 0x0
// Checksum 0x6cf4a9b7, Offset: 0x140
// Size: 0xe2
function function_20bb376d(abilityslot, weapon) {
    self battlechatter::function_bd715920(weapon, undefined, self geteye(), self);
    playfx("weapon/fx8_hero_grvity_slam_takeoff_3p", self.origin);
    if (isdefined(self.var_ea1458aa)) {
        self.var_ea1458aa.var_6799f1da = 0;
        if (!self isonground() && isdefined(self.var_700a5910) && isdefined(self.challenge_jump_begin) && self.var_700a5910 > self.challenge_jump_begin) {
            self.var_ea1458aa.var_6799f1da = 1;
        }
    }
}


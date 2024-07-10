#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_901adecc;

// Namespace namespace_901adecc/namespace_901adecc
// Params 0, eflags: 0x2
// Checksum 0xc9ec024b, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_5e733914ebbc17f7", &__init__, undefined, undefined);
}

// Namespace namespace_901adecc/namespace_901adecc
// Params 0, eflags: 0x0
// Checksum 0x470fd6fe, Offset: 0xd0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_293a2fd65ffe0222", &on_begin, &on_end);
}

// Namespace namespace_901adecc/namespace_901adecc
// Params 0, eflags: 0x4
// Checksum 0xb71b3757, Offset: 0x138
// Size: 0x90
function private on_begin() {
    foreach (player in getplayers()) {
        player callback::on_player_damage(&on_player_damage);
    }
}

// Namespace namespace_901adecc/namespace_901adecc
// Params 1, eflags: 0x4
// Checksum 0x6033ba9a, Offset: 0x1d0
// Size: 0x98
function private on_end(round_reset) {
    foreach (player in getplayers()) {
        player callback::remove_on_player_damage(&on_player_damage);
    }
}

// Namespace namespace_901adecc/namespace_901adecc
// Params 1, eflags: 0x4
// Checksum 0xd1f5e8a8, Offset: 0x270
// Size: 0xc4
function private on_player_damage(params) {
    if ((isai(params.eattacker) || isai(params.einflictor)) && (params.idamage > 0 || isdefined(self.armor) && self.armor > 0)) {
        var_57807cdc = [];
        array::add(var_57807cdc, self, 0);
        zm_trial::fail(#"hash_41122a695bc6065d", var_57807cdc);
    }
}


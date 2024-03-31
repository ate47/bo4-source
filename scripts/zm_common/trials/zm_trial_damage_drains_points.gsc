// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_trial_damage_drains_points;

// Namespace zm_trial_damage_drains_points/zm_trial_damage_drains_points
// Params 0, eflags: 0x2
// Checksum 0x221b3701, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_damage_drains_points", &__init__, undefined, undefined);
}

// Namespace zm_trial_damage_drains_points/zm_trial_damage_drains_points
// Params 0, eflags: 0x1 linked
// Checksum 0x75cf35fe, Offset: 0xe0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"damage_drains_points", &on_begin, &on_end);
}

// Namespace zm_trial_damage_drains_points/zm_trial_damage_drains_points
// Params 2, eflags: 0x5 linked
// Checksum 0x105ec22c, Offset: 0x148
// Size: 0xba
function private on_begin(var_66fe7443, var_ec90b685) {
    if (isdefined(var_ec90b685)) {
        self.var_ec90b685 = 1;
        callback::on_ai_killed(&function_8e0401ab);
        level.var_a58dc99e = zm_trial::function_5769f26a(var_66fe7443);
        return;
    }
    var_620e7dea = zm_trial::function_5769f26a(var_66fe7443) / 100;
    level.var_baf7ae7f = level.var_a2d8b7eb;
    level.var_a2d8b7eb = var_620e7dea;
}

// Namespace zm_trial_damage_drains_points/zm_trial_damage_drains_points
// Params 1, eflags: 0x5 linked
// Checksum 0x9ad735, Offset: 0x210
// Size: 0x7a
function private on_end(round_reset) {
    if (isdefined(self.var_ec90b685) && self.var_ec90b685) {
        callback::remove_on_ai_killed(&function_8e0401ab);
        level.var_a58dc99e = undefined;
        self.var_ec90b685 = undefined;
        return;
    }
    level.var_a2d8b7eb = level.var_baf7ae7f;
    level.var_baf7ae7f = undefined;
}

// Namespace zm_trial_damage_drains_points/zm_trial_damage_drains_points
// Params 1, eflags: 0x1 linked
// Checksum 0x3b4f273, Offset: 0x298
// Size: 0x88
function is_active(var_a32bbdd = 0) {
    s_challenge = zm_trial::function_a36e8c38(#"damage_drains_points");
    if (var_a32bbdd) {
        if (isdefined(s_challenge) && isdefined(s_challenge.var_ec90b685) && s_challenge.var_ec90b685) {
            return true;
        }
        return false;
    }
    return isdefined(s_challenge);
}

// Namespace zm_trial_damage_drains_points/zm_trial_damage_drains_points
// Params 1, eflags: 0x5 linked
// Checksum 0xcab3b737, Offset: 0x328
// Size: 0xec
function private function_8e0401ab(params) {
    if (isdefined(self.nuked) && self.nuked) {
        a_players = util::get_active_players();
        var_fc97ca4d = array::random(a_players);
        if (isplayer(var_fc97ca4d)) {
            var_fc97ca4d zm_score::minus_to_player_score(level.var_a58dc99e, 1);
        }
        return;
    }
    if (isplayer(params.eattacker)) {
        params.eattacker zm_score::minus_to_player_score(level.var_a58dc99e, 1);
    }
}


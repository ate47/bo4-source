// Atian COD Tools GSC decompiler test
#using scripts\zm\perk\zm_perk_death_perception.csc;
#using scripts\zm_common\zm.csc;
#using scripts\zm_common\zm_trial.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_trial_disable_hud;

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 0, eflags: 0x2
// Checksum 0xf7b74a4, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_disable_hud", &__init__, undefined, undefined);
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 0, eflags: 0x0
// Checksum 0x60f54e8e, Offset: 0xd0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"disable_hud", &on_begin, &on_end);
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 2, eflags: 0x4
// Checksum 0x2fa80ff9, Offset: 0x138
// Size: 0x2c
function private on_begin(local_client_num, params) {
    level thread function_40349f7c();
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 1, eflags: 0x0
// Checksum 0xb04260e7, Offset: 0x170
// Size: 0x1a2
function function_40349f7c(localclientnum) {
    level endon(#"hash_38932f8deb28b470", #"end_game");
    wait(12);
    level.var_dc60105c = 1;
    maxclients = getmaxlocalclients();
    for (localclientnum = 0; localclientnum < maxclients; localclientnum++) {
        if (isdefined(function_5c10bd79(localclientnum))) {
            foreach (player in getplayers(localclientnum)) {
                player zm::function_92f0c63(localclientnum);
            }
            foreach (player in getplayers(localclientnum)) {
                player zm_perk_death_perception::function_25410869(localclientnum);
            }
        }
    }
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 1, eflags: 0x4
// Checksum 0xf81c5bdc, Offset: 0x320
// Size: 0x18a
function private on_end(local_client_num) {
    level notify(#"hash_38932f8deb28b470");
    level.var_dc60105c = undefined;
    maxclients = getmaxlocalclients();
    for (localclientnum = 0; localclientnum < maxclients; localclientnum++) {
        if (isdefined(function_5c10bd79(localclientnum))) {
            foreach (player in getplayers(localclientnum)) {
                player zm::function_92f0c63(localclientnum);
            }
            foreach (player in getplayers(localclientnum)) {
                player zm_perk_death_perception::function_25410869(localclientnum);
            }
        }
    }
}


// Atian COD Tools GSC decompiler test
#include script_2595527427ea71eb;
#include scripts/zm_common/zm_trial_util.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace zm_trial_purchase_rush;

// Namespace zm_trial_purchase_rush/zm_trial_purchase_rush
// Params 0, eflags: 0x2
// Checksum 0xf305a062, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_purchase_rush", &__init__, undefined, undefined);
}

// Namespace zm_trial_purchase_rush/zm_trial_purchase_rush
// Params 0, eflags: 0x1 linked
// Checksum 0x5e63c76a, Offset: 0xe8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"purchase_rush", &on_begin, &on_end);
}

// Namespace zm_trial_purchase_rush/zm_trial_purchase_rush
// Params 1, eflags: 0x5 linked
// Checksum 0x7c21ee17, Offset: 0x150
// Size: 0x108
function private on_begin(n_timer) {
    n_timer = zm_trial::function_5769f26a(n_timer);
    level.var_63c017bd = n_timer;
    callback::on_spawned(&on_player_spawned);
    callback::add_callback(#"on_host_migration_end", &function_ff66b979);
    foreach (player in getplayers()) {
        player thread function_2e2a518(n_timer);
    }
}

// Namespace zm_trial_purchase_rush/zm_trial_purchase_rush
// Params 1, eflags: 0x5 linked
// Checksum 0xb1732b09, Offset: 0x260
// Size: 0xe0
function private on_end(round_reset) {
    level.var_63c017bd = undefined;
    callback::remove_on_spawned(&on_player_spawned);
    callback::remove_callback(#"on_host_migration_end", &function_ff66b979);
    foreach (player in getplayers()) {
        player stop_timer();
    }
}

// Namespace zm_trial_purchase_rush/zm_trial_purchase_rush
// Params 2, eflags: 0x5 linked
// Checksum 0xfbc2ea30, Offset: 0x348
// Size: 0x184
function private function_2e2a518(n_timer, var_f97d1a30) {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656", #"hash_76fb373d2d71c744", #"host_migration_begin");
    if (!(isdefined(var_f97d1a30) && var_f97d1a30)) {
        wait(12);
    }
    while (1) {
        while (!isalive(self)) {
            self waittill(#"spawned");
            wait(2);
        }
        self start_timer(n_timer, var_f97d1a30);
        s_waitresult = undefined;
        s_waitresult = self waittilltimeout(n_timer, #"spent_points", #"hash_14b0ad44336160bc");
        self stop_timer();
        if (s_waitresult._notify == "timeout") {
            zm_trial::fail(#"hash_1a444a987e075837", array(self));
            level notify(#"hash_76fb373d2d71c744");
            return;
        }
        wait(3);
    }
}

// Namespace zm_trial_purchase_rush/zm_trial_purchase_rush
// Params 0, eflags: 0x5 linked
// Checksum 0x5b2c53bf, Offset: 0x4d8
// Size: 0x5c
function private on_player_spawned() {
    self endon(#"disconnect");
    level endon(#"host_migration_begin");
    wait(2);
    if (isdefined(self.n_time_remaining)) {
        self start_timer(self.n_time_remaining);
    }
}

// Namespace zm_trial_purchase_rush/zm_trial_purchase_rush
// Params 2, eflags: 0x5 linked
// Checksum 0x92f5c193, Offset: 0x540
// Size: 0xcc
function private start_timer(timeout, var_f97d1a30) {
    if (!level.var_f995ece6 zm_trial_timer::is_open(self)) {
        level.var_f995ece6 zm_trial_timer::open(self);
        level.var_f995ece6 zm_trial_timer::set_timer_text(self, #"hash_424e01ea2299eec0");
        level.var_f995ece6 zm_trial_timer::set_under_round_rules(self, 1);
        self zm_trial_util::start_timer(timeout);
        self thread function_a0f0109f(timeout, var_f97d1a30);
    }
}

// Namespace zm_trial_purchase_rush/zm_trial_purchase_rush
// Params 2, eflags: 0x1 linked
// Checksum 0x3a613c17, Offset: 0x618
// Size: 0xc8
function function_a0f0109f(timeout, var_f97d1a30) {
    if (isdefined(self.n_time_remaining) && !(isdefined(var_f97d1a30) && var_f97d1a30)) {
        return;
    }
    self endon(#"disconnect", #"hash_2a79adac1fd03c09");
    level endon(#"hash_7646638df88a3656", #"end_game", #"host_migration_begin");
    if (!isdefined(self.n_time_remaining)) {
        self.n_time_remaining = timeout;
    }
    while (self.n_time_remaining > 0) {
        wait(1);
        self.n_time_remaining--;
    }
}

// Namespace zm_trial_purchase_rush/zm_trial_purchase_rush
// Params 0, eflags: 0x5 linked
// Checksum 0xf78ae29e, Offset: 0x6e8
// Size: 0x76
function private stop_timer() {
    if (level.var_f995ece6 zm_trial_timer::is_open(self)) {
        level.var_f995ece6 zm_trial_timer::close(self);
        self zm_trial_util::stop_timer();
    }
    self notify(#"hash_2a79adac1fd03c09");
    self.n_time_remaining = undefined;
}

// Namespace zm_trial_purchase_rush/zm_trial_purchase_rush
// Params 0, eflags: 0x5 linked
// Checksum 0xc8fca87c, Offset: 0x768
// Size: 0x198
function private function_ff66b979() {
    level endon(#"end_round", #"host_migration_begin");
    foreach (player in getplayers()) {
        if (level.var_f995ece6 zm_trial_timer::is_open(player)) {
            level.var_f995ece6 zm_trial_timer::close(player);
            player zm_trial_util::stop_timer();
        }
    }
    wait(5);
    foreach (player in getplayers()) {
        player thread function_2e2a518(isdefined(player.n_time_remaining) ? player.n_time_remaining : level.var_63c017bd, 1);
    }
}


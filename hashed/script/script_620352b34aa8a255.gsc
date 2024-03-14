// Atian COD Tools GSC decompiler test
#using script_2595527427ea71eb;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_c401fb8b;

// Namespace namespace_c401fb8b/namespace_c401fb8b
// Params 0, eflags: 0x2
// Checksum 0xe8e9da10, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_262f628396f811df", &__init__, undefined, undefined);
}

// Namespace namespace_c401fb8b/namespace_c401fb8b
// Params 0, eflags: 0x1 linked
// Checksum 0xd34d2bd7, Offset: 0x100
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"teleporter_timeout", &on_begin, &on_end);
}

// Namespace namespace_c401fb8b/namespace_c401fb8b
// Params 2, eflags: 0x5 linked
// Checksum 0x8a8123dc, Offset: 0x168
// Size: 0x108
function private on_begin(timeout_time, var_b2c60867) {
    callback::add_callback(#"on_host_migration_end", &function_ff66b979);
    self.timeout_time = zm_trial::function_5769f26a(timeout_time);
    foreach (player in getplayers()) {
        player thread function_ad32d69(var_b2c60867, self.timeout_time, 0, 1);
        player thread damage_monitor(1);
    }
}

// Namespace namespace_c401fb8b/namespace_c401fb8b
// Params 1, eflags: 0x5 linked
// Checksum 0xae4dad0d, Offset: 0x278
// Size: 0x108
function private on_end(round_reset) {
    callback::remove_callback(#"on_host_migration_end", &function_ff66b979);
    foreach (player in getplayers()) {
        player.var_b2c60867 = undefined;
        player.var_e14296de = undefined;
        player.n_timeout_time = undefined;
        player.var_60fa6139 = undefined;
        player zm_trial_util::stop_timer();
        level.var_f995ece6 zm_trial_timer::close(player);
    }
}

// Namespace namespace_c401fb8b/namespace_c401fb8b
// Params 4, eflags: 0x5 linked
// Checksum 0x553ef01a, Offset: 0x388
// Size: 0x248
function private function_ad32d69(var_b2c60867, timeout, var_ca735ce8, var_a4a28ac7) {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656", #"host_migration_begin");
    if (isdefined(var_a4a28ac7) && var_a4a28ac7) {
        wait(12);
    }
    self.var_b2c60867 = var_b2c60867;
    self.var_e14296de = level.time;
    self.n_timeout_time = timeout;
    self.var_60fa6139 = level.time + timeout * 1000 - var_ca735ce8 * 1000;
    self.b_teleporting = 0;
    level.var_f995ece6 zm_trial_timer::open(self);
    level.var_f995ece6 zm_trial_timer::set_timer_text(self, var_b2c60867);
    self zm_trial_util::start_timer(timeout - var_ca735ce8);
    while (true) {
        self waittill(#"teleporting");
        self.b_teleporting = 1;
        if (level.var_f995ece6 zm_trial_timer::is_open(self)) {
            level.var_f995ece6 zm_trial_timer::close(self);
        }
        self zm_trial_util::stop_timer();
        wait(3.75);
        self zm_trial_util::start_timer(timeout);
        self.var_e14296de = level.time;
        self.var_60fa6139 = level.time + timeout * 1000;
        self.b_teleporting = 0;
        if (!level.var_f995ece6 zm_trial_timer::is_open(self)) {
            level.var_f995ece6 zm_trial_timer::open(self);
        }
    }
}

// Namespace namespace_c401fb8b/namespace_c401fb8b
// Params 1, eflags: 0x5 linked
// Checksum 0x65b4a0aa, Offset: 0x5d8
// Size: 0x1f0
function private damage_monitor(var_a4a28ac7) {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656", #"host_migration_begin");
    if (isdefined(var_a4a28ac7) && var_a4a28ac7) {
        wait(12);
    }
    while (true) {
        if (self.var_60fa6139 < level.time && self.b_teleporting === 0 && self.sessionstate != "spectator" && !self laststand::player_is_in_laststand() && !(isdefined(self.var_eb319d10) && self.var_eb319d10)) {
            if (level.var_f995ece6 zm_trial_timer::is_open(self)) {
                level.var_f995ece6 zm_trial_timer::close(self);
            }
            var_16e6b8ea = int(self.maxhealth * 0.0667);
            if (self.health <= var_16e6b8ea) {
                if (zm_utility::is_magic_bullet_shield_enabled(self)) {
                    self util::stop_magic_bullet_shield();
                }
                self dodamage(self.health + 1000, self.origin);
                waitframe(1);
            } else {
                self dodamage(var_16e6b8ea, self.origin);
                wait(1);
            }
            continue;
        }
        waitframe(1);
    }
}

// Namespace namespace_c401fb8b/namespace_c401fb8b
// Params 0, eflags: 0x5 linked
// Checksum 0x75766abb, Offset: 0x7d0
// Size: 0x1d8
function private function_ff66b979() {
    level endon(#"end_of_round");
    foreach (player in getplayers()) {
        if (level.var_f995ece6 zm_trial_timer::is_open(player)) {
            level.var_f995ece6 zm_trial_timer::close(player);
        }
        player zm_trial_util::stop_timer();
    }
    var_a0328dd5 = gettime();
    wait(5);
    foreach (player in getplayers()) {
        timer_delta = var_a0328dd5 - player.var_e14296de;
        player thread function_ad32d69(player.var_b2c60867, player.n_timeout_time, int(float(timer_delta) / 1000), 0);
        player thread damage_monitor(0);
    }
}


// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;

#namespace zm_trial_repair_boards;

// Namespace zm_trial_repair_boards/zm_trial_repair_boards
// Params 0, eflags: 0x2
// Checksum 0x215eb841, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_repair_boards", &__init__, undefined, undefined);
}

// Namespace zm_trial_repair_boards/zm_trial_repair_boards
// Params 0, eflags: 0x0
// Checksum 0x30f7963f, Offset: 0xd8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"repair_boards", &on_begin, &on_end);
}

// Namespace zm_trial_repair_boards/zm_trial_repair_boards
// Params 5, eflags: 0x4
// Checksum 0xde84642f, Offset: 0x140
// Size: 0x1f4
function private on_begin(var_60bdad5f, var_36c3cc24, var_4ee27b15, var_3bc46181, var_1f6e1e99) {
    switch (level.players.size) {
    case 1:
        self.var_28433a54 = zm_trial::function_5769f26a(var_36c3cc24);
        break;
    case 2:
        self.var_28433a54 = zm_trial::function_5769f26a(var_4ee27b15);
        break;
    case 3:
        self.var_28433a54 = zm_trial::function_5769f26a(var_3bc46181);
        break;
    case 4:
        self.var_28433a54 = zm_trial::function_5769f26a(var_1f6e1e99);
        break;
    }
    self.var_358e6a29 = self.var_28433a54;
    self.var_e6e7a65d = isdefined(zombie_utility::get_zombie_var(#"rebuild_barrier_cap_per_round")) ? zombie_utility::get_zombie_var(#"rebuild_barrier_cap_per_round") : 0;
    zombie_utility::set_zombie_var(#"rebuild_barrier_cap_per_round", self.var_28433a54);
    self.var_a84ac7c8 = var_60bdad5f;
    zm_trial_util::function_2976fa44(self.var_358e6a29);
    zm_trial_util::function_dace284(0);
    self thread function_738e3a43();
}

// Namespace zm_trial_repair_boards/zm_trial_repair_boards
// Params 1, eflags: 0x4
// Checksum 0xbd37ae61, Offset: 0x340
// Size: 0x74
function private on_end(round_reset) {
    if (!round_reset) {
        if (self.var_28433a54 > 0) {
            zm_trial::fail(self.var_a84ac7c8);
        }
    }
    zm_trial_util::function_f3dbeda7();
    zombie_utility::set_zombie_var(#"rebuild_barrier_cap_per_round", self.var_e6e7a65d);
}

// Namespace zm_trial_repair_boards/zm_trial_repair_boards
// Params 0, eflags: 0x4
// Checksum 0xa73d7211, Offset: 0x3c0
// Size: 0x190
function private function_738e3a43() {
    level endon(#"hash_7646638df88a3656");
    var_812095a3 = 0;
    while (self.var_28433a54) {
        waitresult = level waittill(#"rebuild_board");
        var_c7ff10eb = 0;
        var_812095a3++;
        if (var_812095a3 >= 5) {
            var_c7ff10eb = 1;
            var_812095a3 = 0;
        }
        if (self.var_358e6a29 > zombie_utility::get_zombie_var(#"rebuild_barrier_cap_per_round")) {
            self.var_e6e7a65d = zombie_utility::get_zombie_var(#"rebuild_barrier_cap_per_round");
            zombie_utility::set_zombie_var(#"rebuild_barrier_cap_per_round", self.var_358e6a29);
        }
        if (isdefined(waitresult.points)) {
            self.var_28433a54 -= waitresult.points;
        }
        self.var_28433a54 = math::clamp(self.var_28433a54, 0, 1000);
        zm_trial_util::function_dace284(int(self.var_358e6a29 - self.var_28433a54));
    }
}


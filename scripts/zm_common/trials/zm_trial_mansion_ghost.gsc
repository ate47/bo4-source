// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_mansion_pap_quest.gsc;
#include script_2595527427ea71eb;
#include scripts/zm_common/zm_trial_util.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/laststand_shared.gsc;
#include scripts/core_common/gameobjects_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace zm_trial_mansion_ghost;

// Namespace zm_trial_mansion_ghost/zm_trial_mansion_ghost
// Params 0, eflags: 0x2
// Checksum 0x3e9fe866, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_mansion_ghost", &__init__, undefined, undefined);
}

// Namespace zm_trial_mansion_ghost/zm_trial_mansion_ghost
// Params 0, eflags: 0x1 linked
// Checksum 0xf002faaa, Offset: 0x158
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_bbf349c22f69752", &on_begin, &on_end);
}

// Namespace zm_trial_mansion_ghost/zm_trial_mansion_ghost
// Params 0, eflags: 0x5 linked
// Checksum 0x7c663439, Offset: 0x1c0
// Size: 0x1c
function private on_begin() {
    level thread function_eb301e1b();
}

// Namespace zm_trial_mansion_ghost/zm_trial_mansion_ghost
// Params 1, eflags: 0x5 linked
// Checksum 0x81f6360b, Offset: 0x1e8
// Size: 0x1cc
function private on_end(round_reset) {
    gameobjects::release_obj_id(level.var_591d982c.n_obj_id);
    mansion_pap::function_1ae44836(level.var_591d982c.var_c176969a);
    if (isdefined(level.var_591d982c.e_mover)) {
        level.var_591d982c.e_mover scene::stop(#"hash_1d324e9f967f0848");
        level.var_591d982c.e_mover scene::stop(#"hash_d278eff0ca38301");
        if (isdefined(level.var_591d982c.e_mover)) {
            level.var_591d982c.e_mover delete();
        }
    }
    if (isdefined(level.var_591d982c)) {
        level.var_591d982c scene::stop(#"hash_1d324e9f967f0848");
        level.var_591d982c scene::stop(#"hash_d278eff0ca38301");
        if (isdefined(level.var_591d982c.mdl_head)) {
            level.var_591d982c.mdl_head delete();
        }
        if (isdefined(level.var_591d982c)) {
            level.var_591d982c delete();
        }
    }
    function_1c6eef6d();
}

// Namespace zm_trial_mansion_ghost/zm_trial_mansion_ghost
// Params 0, eflags: 0x5 linked
// Checksum 0xe0185a0f, Offset: 0x3c0
// Size: 0x1be
function private function_889abd74() {
    level endon(#"hash_7646638df88a3656", #"end_game");
    self endon(#"disconnect");
    level.var_591d982c endon(#"death");
    var_da67715 = 20;
    var_9faecc20 = 0;
    while (1) {
        n_distance = distance(self.origin, level.var_591d982c.origin);
        if (!var_9faecc20 && (n_distance <= 200 || var_da67715 <= 0)) {
            var_9faecc20 = 1;
        }
        if (var_9faecc20 && !(isdefined(self.var_30f75b88) && self.var_30f75b88) && isalive(self) && !self laststand::player_is_in_laststand() && n_distance > 200) {
            self dodamage(2, self.origin);
            wait(1);
        }
        waitframe(1);
        if (var_da67715 > 0) {
            var_da67715 = var_da67715 - float(function_60d95f53()) / 1000;
        }
    }
}

// Namespace zm_trial_mansion_ghost/zm_trial_mansion_ghost
// Params 0, eflags: 0x5 linked
// Checksum 0xa59d9fc0, Offset: 0x588
// Size: 0x5a0
function private function_eb301e1b() {
    level endon(#"hash_7646638df88a3656");
    wait(randomintrange(0, 3));
    var_c98c4943 = array::random(array("monkey_loc", "bull_loc", "dl_loc"));
    nd_start = getvehiclenode(var_c98c4943 + "_trail_start_node", "targetname");
    level.var_591d982c = util::spawn_model("tag_origin", nd_start.origin, nd_start.angles);
    level.var_591d982c endon(#"death");
    level.var_591d982c.n_obj_id = gameobjects::get_next_obj_id();
    objective_add(level.var_591d982c.n_obj_id, "active", level.var_591d982c, #"hash_228d7ebefd8c2600");
    function_da7940a3(level.var_591d982c.n_obj_id, 1);
    level.var_591d982c thread mansion_pap::function_7ff450ae();
    foreach (player in getplayers()) {
        player thread function_889abd74();
    }
    while (1) {
        if (isdefined(level.var_591d982c.e_mover)) {
            level.var_591d982c.e_mover delete();
        }
        level.var_591d982c mansion_pap::show_trail(nd_start);
        level.var_591d982c.e_mover = util::spawn_model("tag_origin", level.var_591d982c.origin, level.var_591d982c.angles);
        level.var_591d982c linkto(level.var_591d982c.e_mover);
        level.var_591d982c.e_mover thread scene::play(#"hash_1d324e9f967f0848", level.var_591d982c);
        level.var_591d982c thread scene::play(#"hash_1d324e9f967f0848", level.var_591d982c.mdl_head);
        wait(5);
        var_c98c4943 = array::random(array("monkey_loc", "bull_loc", "dl_loc"));
        nd_start = getvehiclenode(var_c98c4943 + "_trail_start_node", "targetname");
        level.var_591d982c.e_mover thread scene::play(#"hash_1d324e9f967f0848", level.var_591d982c);
        level.var_591d982c thread scene::play(#"hash_1d324e9f967f0848", level.var_591d982c.mdl_head);
        function_1aa8f593(20);
        level.var_591d982c.e_mover thread scene::play(#"hash_d278eff0ca38301", level.var_591d982c);
        level.var_591d982c thread scene::play(#"hash_d278eff0ca38301", level.var_591d982c.mdl_head);
        level.var_591d982c.e_mover moveto(nd_start.origin, 20);
        level.var_591d982c.e_mover rotateto(nd_start.angles, 20);
        wait(20);
        function_1c6eef6d();
        level.var_591d982c.e_mover scene::stop(#"hash_d278eff0ca38301");
        level.var_591d982c scene::stop(#"hash_d278eff0ca38301");
    }
}

// Namespace zm_trial_mansion_ghost/zm_trial_mansion_ghost
// Params 1, eflags: 0x1 linked
// Checksum 0x3c903e38, Offset: 0xb30
// Size: 0xfe
function function_1aa8f593(n_timer) {
    foreach (player in getplayers()) {
        if (!level.var_f995ece6 zm_trial_timer::is_open(player)) {
            level.var_f995ece6 zm_trial_timer::open(player);
            level.var_f995ece6 zm_trial_timer::set_timer_text(player, #"hash_2cf8dfaf82a4082a");
        }
        player zm_trial_util::start_timer(n_timer);
        player.var_30f75b88 = 1;
    }
}

// Namespace zm_trial_mansion_ghost/zm_trial_mansion_ghost
// Params 0, eflags: 0x1 linked
// Checksum 0x741de54a, Offset: 0xc38
// Size: 0xca
function function_1c6eef6d() {
    foreach (player in getplayers()) {
        if (level.var_f995ece6 zm_trial_timer::is_open(player)) {
            level.var_f995ece6 zm_trial_timer::close(player);
            player zm_trial_util::stop_timer();
        }
        player.var_30f75b88 = undefined;
    }
}

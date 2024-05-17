// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_bgb_board_games;

// Namespace zm_bgb_board_games/zm_bgb_board_games
// Params 0, eflags: 0x2
// Checksum 0xfa430eb5, Offset: 0x110
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_board_games", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_board_games/zm_bgb_board_games
// Params 0, eflags: 0x1 linked
// Checksum 0x99f2830e, Offset: 0x160
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_board_games", "time", 300, &enable, &disable, undefined);
}

// Namespace zm_bgb_board_games/zm_bgb_board_games
// Params 0, eflags: 0x1 linked
// Checksum 0x8d654f86, Offset: 0x1e0
// Size: 0x1c
function enable() {
    self thread function_202a3d22();
}

// Namespace zm_bgb_board_games/zm_bgb_board_games
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x208
// Size: 0x4
function disable() {
    
}

// Namespace zm_bgb_board_games/zm_bgb_board_games
// Params 0, eflags: 0x1 linked
// Checksum 0xe920dd05, Offset: 0x218
// Size: 0xa8
function function_202a3d22() {
    self endon(#"disconnect", #"bled_out", #"bgb_update");
    while (true) {
        waitresult = self waittill(#"boarding_window");
        s_window = waitresult;
        self bgb::do_one_shot_use();
        self thread function_c2342058(s_window);
    }
}

// Namespace zm_bgb_board_games/zm_bgb_board_games
// Params 1, eflags: 0x1 linked
// Checksum 0x29b9cf47, Offset: 0x2c8
// Size: 0x32c
function function_c2342058(s_window) {
    carp_ent = spawn("script_origin", (0, 0, 0));
    carp_ent playloopsound(#"evt_carpenter");
    num_chunks_checked = 0;
    while (true) {
        if (zm_utility::all_chunks_intact(s_window, s_window.barrier_chunks)) {
            break;
        }
        chunk = zm_utility::get_random_destroyed_chunk(s_window, s_window.barrier_chunks);
        if (!isdefined(chunk)) {
            break;
        }
        s_window thread zm_blockers::replace_chunk(s_window, chunk, undefined, 1);
        self.rebuild_barrier_reward += 10;
        if (self.rebuild_barrier_reward < zombie_utility::get_zombie_var(#"rebuild_barrier_cap_per_round")) {
            self zm_score::player_add_points("rebuild_board", 10);
            self zm_utility::play_sound_on_ent("purchase");
        }
        last_repaired_chunk = chunk;
        if (isdefined(s_window.clip)) {
            s_window.clip triggerenable(1);
            s_window.clip disconnectpaths();
        } else {
            zm_blockers::blocker_disconnect_paths(s_window.neg_start, s_window.neg_end);
        }
        util::wait_network_frame();
        num_chunks_checked++;
        if (num_chunks_checked >= 20) {
            break;
        }
    }
    if (isdefined(s_window.zbarrier)) {
        if (isdefined(last_repaired_chunk)) {
            while (s_window.zbarrier getzbarrierpiecestate(last_repaired_chunk) == "closing") {
                waitframe(1);
            }
            if (isdefined(s_window._post_carpenter_callback)) {
                s_window [[ s_window._post_carpenter_callback ]]();
            }
        }
    } else {
        while (isdefined(last_repaired_chunk) && last_repaired_chunk.state == "mid_repair") {
            waitframe(1);
        }
    }
    carp_ent stoploopsound(1);
    carp_ent playsoundwithnotify("evt_carpenter_end", "sound_done");
    carp_ent waittill(#"sound_done");
    carp_ent delete();
}


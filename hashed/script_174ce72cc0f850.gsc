// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_hms_util.gsc;
#include script_3e5ec44cfab7a201;
#include scripts/core_common/exploder_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/flag_shared.gsc;

#namespace namespace_bd74bbd2;

// Namespace namespace_bd74bbd2/namespace_bd74bbd2
// Params 5, eflags: 0x1 linked
// Checksum 0x944ade8b, Offset: 0xb8
// Size: 0x116
function register(id, version, script_noteworthy, var_92f252fd, var_af245552) {
    namespace_617a54f4::function_d8383812(id, version, script_noteworthy, &is_soul_capture, &soul_captured, 1);
    s_sc = struct::get(script_noteworthy, "script_noteworthy");
    s_sc.var_f929d531 = getent(s_sc.var_5ca82ce, "targetname");
    s_sc.var_f929d531.id = id;
    s_sc.var_92f252fd = var_92f252fd;
    s_sc.var_af245552 = var_af245552;
    level.var_345df07[id] = s_sc;
}

// Namespace namespace_bd74bbd2/namespace_bd74bbd2
// Params 1, eflags: 0x1 linked
// Checksum 0x7d6bd70c, Offset: 0x1d8
// Size: 0xa4
function start(id) {
    if (level.var_d2540500[id].active !== 1) {
        s_sc = level.var_345df07[id];
        s_sc.var_7944be4a = 0;
        exploder::exploder(s_sc.var_915be716);
        namespace_617a54f4::function_3f808d3d(id);
        s_sc.var_f929d531 thread function_fab8c488();
    }
}

// Namespace namespace_bd74bbd2/namespace_bd74bbd2
// Params 1, eflags: 0x1 linked
// Checksum 0x85982695, Offset: 0x288
// Size: 0x98
function end(id) {
    if (level.var_d2540500[id].active === 1) {
        s_sc = level.var_345df07[id];
        exploder::stop_exploder(s_sc.var_915be716);
        namespace_617a54f4::function_2a94055d(id);
        s_sc.var_f929d531 notify(#"event_end");
    }
}

// Namespace namespace_bd74bbd2/namespace_bd74bbd2
// Params 2, eflags: 0x5 linked
// Checksum 0xde189d4f, Offset: 0x328
// Size: 0xf0
function private is_soul_capture(var_88206a50, ent) {
    if (isdefined(ent)) {
        b_killed_by_player = 0;
        if (isdefined(ent.attacker) && isplayer(ent.attacker)) {
            e_player = ent.attacker;
            b_killed_by_player = 1;
        } else if (isdefined(ent.damageinflictor) && isplayer(ent.damageinflictor)) {
            e_player = ent.damageinflictor;
            b_killed_by_player = 1;
        }
        if (b_killed_by_player && e_player istouching(var_88206a50.var_f929d531)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_bd74bbd2/namespace_bd74bbd2
// Params 2, eflags: 0x5 linked
// Checksum 0x99a80de, Offset: 0x420
// Size: 0xd8
function private soul_captured(var_f0e6c7a2, ent) {
    n_souls_required = 12;
    if (getplayers().size > 2) {
        n_souls_required = 24;
    } else if (getplayers().size > 1) {
        n_souls_required = 18;
    }
    var_f0e6c7a2.var_7944be4a++;
    /#
        if (level flag::get(#"soul_fill")) {
            var_f0e6c7a2.var_7944be4a = n_souls_required;
        }
    #/
    if (var_f0e6c7a2.var_7944be4a >= n_souls_required) {
        var_f0e6c7a2 thread [[ var_f0e6c7a2.var_92f252fd ]]();
    }
}

// Namespace namespace_bd74bbd2/namespace_bd74bbd2
// Params 0, eflags: 0x5 linked
// Checksum 0x2b8f053b, Offset: 0x500
// Size: 0x7c
function private function_fab8c488() {
    self endon(#"death", #"event_end");
    while (self zm_hms_util::function_b8a27acc()) {
        wait(0.1);
    }
    self thread player_enter_watcher();
    self thread function_b1e6482f();
}

// Namespace namespace_bd74bbd2/namespace_bd74bbd2
// Params 0, eflags: 0x5 linked
// Checksum 0xd9f028a6, Offset: 0x588
// Size: 0x74
function private player_enter_watcher() {
    self endon(#"death", #"event_end");
    while (!self zm_hms_util::function_b8a27acc()) {
        wait(0.1);
    }
    self notify(#"player_enter");
    self thread function_fab8c488();
}

// Namespace namespace_bd74bbd2/namespace_bd74bbd2
// Params 0, eflags: 0x5 linked
// Checksum 0x8e642d1b, Offset: 0x608
// Size: 0x7c
function private function_b1e6482f() {
    self endon(#"death", #"player_enter", #"event_end");
    wait(5);
    level thread [[ level.var_345df07[self.id].var_af245552 ]]();
    end(self.id);
}


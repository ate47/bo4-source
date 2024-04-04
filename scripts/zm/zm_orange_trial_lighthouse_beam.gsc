// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_orange_pap.gsc;
#using scripts\zm\zm_orange_lighthouse.gsc;
#using scripts\zm_common\zm_pack_a_punch.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_orange_trial_lighthouse_beam;

// Namespace zm_orange_trial_lighthouse_beam/zm_orange_trial_lighthouse_beam
// Params 0, eflags: 0x2
// Checksum 0xbc44ea1, Offset: 0x1d0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_orange_trial_lighthouse_beam", &__init__, undefined, undefined);
}

// Namespace zm_orange_trial_lighthouse_beam/zm_orange_trial_lighthouse_beam
// Params 0, eflags: 0x1 linked
// Checksum 0xbb6b959e, Offset: 0x218
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"lighthouse_beam", &on_begin, &on_end);
}

// Namespace zm_orange_trial_lighthouse_beam/zm_orange_trial_lighthouse_beam
// Params 0, eflags: 0x5 linked
// Checksum 0x98be9a42, Offset: 0x280
// Size: 0xe0
function private on_begin() {
    str_targetname = "trials_lighthouse_beam";
    level setup_lighthouse();
    callback::function_33f0ddd3(&function_33f0ddd3);
    level zm_trial::function_25ee130(1);
    foreach (player in getplayers()) {
        player thread function_1e902f3b();
    }
}

// Namespace zm_orange_trial_lighthouse_beam/zm_orange_trial_lighthouse_beam
// Params 1, eflags: 0x5 linked
// Checksum 0x2ac6bc5a, Offset: 0x368
// Size: 0x12c
function private on_end(round_reset) {
    level notify(#"hash_2b53ed06a97eb26c");
    level.var_ab11c23d function_f223e16f(round_reset);
    callback::function_824d206(&function_33f0ddd3);
    level zm_trial::function_25ee130(0);
    foreach (player in getplayers()) {
        player thread zm_trial_util::function_dc0859e();
        player thread zm_trial_util::function_73ff0096();
    }
    level.var_7f31a12d = undefined;
    level zm_orange_lighthouse::function_d85bd834();
}

// Namespace zm_orange_trial_lighthouse_beam/zm_orange_trial_lighthouse_beam
// Params 0, eflags: 0x5 linked
// Checksum 0x68ca260f, Offset: 0x4a0
// Size: 0x394
function private setup_lighthouse() {
    level notify(#"hash_661044fd7c7faa55");
    if (level.var_7d8bf93f zm_pack_a_punch::is_on()) {
        if (level.var_7d8bf93f flag::get("Pack_A_Punch_on")) {
            level.var_7d8bf93f flag::wait_till("pap_waiting_for_user");
        }
        var_611e46b7 = undefined;
        foreach (var_143bf55a in level.var_9f657597) {
            if (var_143bf55a.script_noteworthy == level.var_7d8bf93f.script_noteworthy + "_debris") {
                var_611e46b7 = var_143bf55a;
                break;
            }
        }
        level.var_7d8bf93f zm_pack_a_punch::function_bb629351(0, "initial");
        if (level.var_7d8bf93f == level.var_9d121dce) {
            exploder::exploder_stop("fxexp_pap_light_icefloe");
        }
        if (isdefined(var_611e46b7)) {
            while (var_611e46b7 scene::is_playing("melt")) {
                wait(0.25);
            }
            var_611e46b7 thread zm_orange_pap::function_69a4b74b(1);
            if (isdefined(var_611e46b7.target)) {
                clip_brush = getent(var_611e46b7.target, "targetname");
                clip_brush thread zm_orange_pap::function_4d7320f5(1);
            }
        }
    }
    if (level.var_ab11c23d.var_58df9892 == 3 || level.var_ab11c23d.var_58df9892 == 8) {
        level.var_ab11c23d notify(#"hash_1aa56851d9d4ec0d");
        if (isdefined(level.var_ab11c23d.vh_target)) {
            level.var_ab11c23d.vh_target.b_moving = 0;
            level.var_ab11c23d.vh_target clientfield::set("" + #"hash_19bce46b8ab82440", 0);
            waitframe(1);
            level.var_ab11c23d.vh_target delete();
        }
        if (isdefined(level.var_ab11c23d.t_trap)) {
            level.var_ab11c23d.t_trap notify(#"trap_done");
            waitframe(1);
            level.var_ab11c23d.t_trap delete();
        }
    }
    level thread zm_orange_lighthouse::function_ad646ef8(0);
    level.var_ab11c23d thread function_dbad2f5a();
}

// Namespace zm_orange_trial_lighthouse_beam/zm_orange_trial_lighthouse_beam
// Params 0, eflags: 0x1 linked
// Checksum 0x59d30458, Offset: 0x840
// Size: 0x2dc
function function_dbad2f5a() {
    self endon(#"death", #"hash_2b53ed06a97eb26c");
    level.var_ab11c23d notify(#"hash_78fc5bbd712046b0");
    for (vh_target = spawner::simple_spawn_single(getent("virgil", "targetname")); !isdefined(vh_target); vh_target = spawner::simple_spawn_single(getent("virgil", "targetname"))) {
        waitframe(1);
    }
    self.var_da138ae4 = getvehiclenode("trials_lighthouse_start", "targetname");
    vh_target.origin = self.var_da138ae4.origin;
    vh_target.b_moving = 0;
    vh_target val::set(#"lighthouse_target", "takedamage", 0);
    self.vh_target = vh_target;
    self zm_orange_lighthouse::function_1b488412(vh_target.origin, 1);
    self.vh_target.e_spotlight = util::spawn_model("tag_origin", self.vh_target.origin);
    self.vh_target.e_spotlight enablelinkto();
    self.vh_target.e_spotlight linkto(self.vh_target, "tag_origin", (0, 0, 390), (90, 0, 0));
    self waittill(#"rotatedone");
    level.var_ab11c23d clientfield::set("lighthouse_on", 3);
    self.vh_target.e_spotlight clientfield::set("" + #"trials_lighthouse_beam", 2);
    self.vh_target thread zm_orange_lighthouse::function_18f63949();
    self zm_orange_lighthouse::function_2b2f2a7f();
    wait(1);
    self.vh_target thread function_b502c51(self.var_da138ae4);
}

// Namespace zm_orange_trial_lighthouse_beam/zm_orange_trial_lighthouse_beam
// Params 1, eflags: 0x5 linked
// Checksum 0x4808db5c, Offset: 0xb28
// Size: 0x96
function private function_b502c51(nd_start) {
    self endon(#"death", #"hash_2b53ed06a97eb26c");
    while (true) {
        self thread vehicle::get_on_and_go_path(nd_start);
        self setspeed(4);
        self.b_moving = 1;
        self waittill(#"reached_end_node");
    }
}

// Namespace zm_orange_trial_lighthouse_beam/zm_orange_trial_lighthouse_beam
// Params 1, eflags: 0x1 linked
// Checksum 0x2e265467, Offset: 0xbc8
// Size: 0x13a
function function_f223e16f(round_reset) {
    self endon(#"death");
    self.vh_target.b_moving = 0;
    wait(2);
    self.vh_target clientfield::set("" + #"hash_19bce46b8ab82440", 0);
    self.vh_target.e_spotlight delete();
    self.vh_target delete();
    if (round_reset !== 1) {
        level thread zm_orange_lighthouse::function_ad646ef8(1);
        switch (level.var_98138d6b) {
        case 2:
            level thread zm_orange_pap::function_56db9cdc();
            break;
        case 3:
            level thread zm_orange_pap::function_56db9cdc();
            break;
        }
    }
}

// Namespace zm_orange_trial_lighthouse_beam/zm_orange_trial_lighthouse_beam
// Params 0, eflags: 0x5 linked
// Checksum 0xf302a899, Offset: 0xd10
// Size: 0x10e
function private function_1e902f3b() {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    var_407eb07 = 0;
    while (true) {
        var_f2b6fe6e = 0;
        n_distance = distancesquared(level.var_ab11c23d.vh_target.origin, self.origin);
        if (n_distance < 30000) {
            var_f2b6fe6e = 1;
        }
        if (var_f2b6fe6e && var_407eb07) {
            self zm_trial_util::function_dc0859e();
            var_407eb07 = 0;
        } else if (!var_f2b6fe6e && !var_407eb07) {
            self zm_trial_util::function_bf710271();
            var_407eb07 = 1;
        }
        waitframe(1);
    }
}

// Namespace zm_orange_trial_lighthouse_beam/zm_orange_trial_lighthouse_beam
// Params 0, eflags: 0x1 linked
// Checksum 0x85955ade, Offset: 0xe28
// Size: 0x58
function function_91f0d131() {
    n_distance = distancesquared(level.var_ab11c23d.vh_target.origin, self.origin);
    if (n_distance < 30000) {
        return 1;
    }
    return 0;
}

// Namespace zm_orange_trial_lighthouse_beam/zm_orange_trial_lighthouse_beam
// Params 1, eflags: 0x5 linked
// Checksum 0x3cc6df86, Offset: 0xe88
// Size: 0xa4
function private function_33f0ddd3(s_event) {
    if (s_event.event === "give_weapon") {
        var_f2b6fe6e = 0;
        if (self.b_in_water === 1) {
            var_f2b6fe6e = 1;
            return;
        }
        if (!var_f2b6fe6e && !zm_loadout::function_2ff6913(s_event.weapon)) {
            self lockweapon(s_event.weapon, 1, 1);
        }
    }
}


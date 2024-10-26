#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_trial_restrict_controls;

// Namespace zm_trial_restrict_controls/zm_trial_restrict_controls
// Params 0, eflags: 0x2
// Checksum 0xa38454fa, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_restrict_controls", &__init__, undefined, undefined);
}

// Namespace zm_trial_restrict_controls/zm_trial_restrict_controls
// Params 0, eflags: 0x0
// Checksum 0x55ecae43, Offset: 0x140
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"restrict_controls", &on_begin, &on_end);
}

// Namespace zm_trial_restrict_controls/zm_trial_restrict_controls
// Params 1, eflags: 0x4
// Checksum 0xcfbeabf8, Offset: 0x1a8
// Size: 0x2fa
function private on_begin(var_bd9d962 = #"invert") {
    level endon(#"hash_7646638df88a3656");
    wait 5;
    level.var_2439365b = var_bd9d962;
    switch (level.var_2439365b) {
    case #"invert":
        foreach (player in getplayers()) {
            player clientfield::set_to_player("" + #"hash_6536ca4fb2858a9f", 1);
        }
        break;
    case #"turret":
        foreach (player in getplayers()) {
            player bgb_pack::function_59004002(#"zm_bgb_anywhere_but_here", 1);
            player bgb_pack::function_59004002(#"zm_bgb_nowhere_but_there", 1);
            player thread function_3d8fa20a();
        }
        callback::on_ai_spawned(&function_a5b02a07);
        callback::on_spawned(&function_eaba7c6f);
        break;
    case #"half_speed":
        foreach (player in getplayers()) {
            player setmovespeedscale(0.5);
            player allowsprint(0);
            player allowslide(0);
        }
        break;
    }
}

// Namespace zm_trial_restrict_controls/zm_trial_restrict_controls
// Params 1, eflags: 0x4
// Checksum 0xd894b862, Offset: 0x4b0
// Size: 0x306
function private on_end(round_reset) {
    switch (level.var_2439365b) {
    case #"invert":
        foreach (player in getplayers()) {
            player clientfield::set_to_player("" + #"hash_6536ca4fb2858a9f", 0);
        }
        break;
    case #"turret":
        foreach (player in getplayers()) {
            player bgb_pack::function_59004002(#"zm_bgb_anywhere_but_here", 0);
            player bgb_pack::function_59004002(#"zm_bgb_nowhere_but_there", 0);
            player setmovespeedscale(1);
            player allowjump(1);
            player allowprone(1);
            player allowsprint(1);
        }
        callback::remove_on_ai_spawned(&function_a5b02a07);
        callback::remove_on_spawned(&function_eaba7c6f);
        break;
    case #"half_speed":
        foreach (player in getplayers()) {
            player setmovespeedscale(1);
            player allowsprint(1);
            player allowslide(1);
        }
        break;
    }
    level.var_2439365b = undefined;
}

// Namespace zm_trial_restrict_controls/zm_trial_restrict_controls
// Params 0, eflags: 0x4
// Checksum 0x48140072, Offset: 0x7c0
// Size: 0x1c
function private function_eaba7c6f() {
    self thread function_3d8fa20a();
}

// Namespace zm_trial_restrict_controls/zm_trial_restrict_controls
// Params 0, eflags: 0x4
// Checksum 0xe62260d0, Offset: 0x7e8
// Size: 0x108
function private function_3d8fa20a() {
    self notify("63943c3872eb77bc");
    self endon("63943c3872eb77bc");
    self endon(#"death");
    level endon(#"hash_7646638df88a3656");
    wait 5;
    while (self zm_utility::is_jumping()) {
        waitframe(1);
    }
    self setmovespeedscale(0);
    self thread function_dc856fd8();
    while (true) {
        self waittill(#"player_downed");
        self setmovespeedscale(1);
        self waittill(#"player_revived");
        self setmovespeedscale(0);
    }
}

// Namespace zm_trial_restrict_controls/zm_trial_restrict_controls
// Params 0, eflags: 0x4
// Checksum 0xd3974d2d, Offset: 0x8f8
// Size: 0x128
function private function_dc856fd8() {
    self notify("4becff0e4eba900e");
    self endon("4becff0e4eba900e");
    level endon(#"hash_7646638df88a3656");
    self endon(#"disconnect");
    self allowjump(0);
    self allowprone(0);
    self allowsprint(0);
    while (true) {
        self waittill(#"crafting_fail", #"crafting_success", #"bgb_update");
        if (isalive(self)) {
            self allowjump(0);
            self allowprone(0);
            self allowsprint(0);
        }
    }
}

// Namespace zm_trial_restrict_controls/zm_trial_restrict_controls
// Params 0, eflags: 0x4
// Checksum 0x8a6637de, Offset: 0xa28
// Size: 0x184
function private function_a5b02a07() {
    self endon(#"death");
    wait 0.5;
    n_players = getplayers().size;
    switch (n_players) {
    case 1:
        var_e0e5e1ab = 0;
        break;
    case 2:
        var_e0e5e1ab = 40;
        break;
    case 3:
        var_e0e5e1ab = 75;
        break;
    case 4:
        var_e0e5e1ab = 100;
        break;
    }
    if (math::cointoss(var_e0e5e1ab)) {
        self zombie_utility::set_zombie_run_cycle("sprint");
        return;
    }
    if (n_players > 1) {
        self zombie_utility::set_zombie_run_cycle("run");
        return;
    }
    if (math::cointoss()) {
        self zombie_utility::set_zombie_run_cycle("run");
        return;
    }
    self zombie_utility::set_zombie_run_cycle("walk");
}


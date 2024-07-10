#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_arcade_timer;

// Namespace zm_arcade_timer
// Method(s) 9 Total 16
class czm_arcade_timer : cluielem {

    var var_47e79fc;

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 2, eflags: 0x1 linked
    // Checksum 0x8bbb9c26, Offset: 0xa88
    // Size: 0x3c
    function set_title(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "title", value);
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 2, eflags: 0x1 linked
    // Checksum 0x34526399, Offset: 0xa40
    // Size: 0x3c
    function set_minutes(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "minutes", value);
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 2, eflags: 0x1 linked
    // Checksum 0xcd47130b, Offset: 0x9f8
    // Size: 0x3c
    function set_seconds(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "seconds", value);
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 2, eflags: 0x1 linked
    // Checksum 0xbd19b725, Offset: 0x9b0
    // Size: 0x3c
    function set_showzero(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "showzero", value);
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 1, eflags: 0x1 linked
    // Checksum 0x872d923b, Offset: 0x980
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 2, eflags: 0x1 linked
    // Checksum 0xe8579891, Offset: 0x930
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_arcade_timer", persistent);
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 1, eflags: 0x1 linked
    // Checksum 0xc65aff21, Offset: 0x860
    // Size: 0xc4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("showzero", 1, 1, "int");
        cluielem::add_clientfield("seconds", 1, 6, "int");
        cluielem::add_clientfield("minutes", 1, 4, "int");
        cluielem::function_dcb34c80("string", "title", 1);
    }

}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 3, eflags: 0x1 linked
// Checksum 0xa3c38329, Offset: 0xf0
// Size: 0x134
function set_timer(player, var_c895e25d, var_b1100790) {
    self open_timer(player);
    n_minutes = int(floor(var_c895e25d / 60));
    n_seconds = int(var_c895e25d - n_minutes * 60);
    self set_minutes(player, n_minutes);
    self set_seconds(player, n_seconds);
    if (n_seconds < 10) {
        self set_showzero(player, 1);
    } else {
        self set_showzero(player, 0);
    }
    if (isdefined(var_b1100790)) {
        self set_title(player, var_b1100790);
    }
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 1, eflags: 0x1 linked
// Checksum 0xecb9ee29, Offset: 0x230
// Size: 0xc0
function function_e7a1c8a4(str_notify) {
    foreach (player in level.players) {
        if (isdefined(level.var_f5682bb8) && level.var_f5682bb8 is_open(player)) {
            level.var_f5682bb8 close(player);
        }
    }
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 4, eflags: 0x0
// Checksum 0x3464498c, Offset: 0x2f8
// Size: 0x19c
function function_88df772a(player, var_c895e25d, var_b1100790, var_f0996295 = 0) {
    player endon(#"disconnect", #"hash_660dedc4af5b4336");
    level endoncallback(&function_e7a1c8a4, #"end_game");
    if (!var_f0996295) {
        player endoncallback(&function_57490fd5, #"hash_2a4a6c3c411261d8");
    }
    self function_ecffd525(player);
    if (var_f0996295 || !isdefined(player.var_26b0547b)) {
        player.var_26b0547b = var_b1100790;
    }
    while (var_c895e25d >= 0) {
        if (player.var_26b0547b === var_b1100790) {
            self set_timer(player, var_c895e25d, var_b1100790);
        }
        wait(1);
        var_c895e25d--;
        if (!isdefined(player.var_26b0547b)) {
            player.var_26b0547b = var_b1100790;
        }
    }
    if (player.var_26b0547b === var_b1100790) {
        player.var_26b0547b = undefined;
    }
    self function_9bab3960(player, 0, var_b1100790);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 1, eflags: 0x1 linked
// Checksum 0x386de5, Offset: 0x4a0
// Size: 0x3c
function function_57490fd5(str_notify) {
    if (!isdefined(self.var_e325b124)) {
        self.var_e325b124 = 0;
    }
    if (self.var_e325b124 > 0) {
        self.var_e325b124--;
    }
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 1, eflags: 0x1 linked
// Checksum 0xd5044ae, Offset: 0x4e8
// Size: 0x4c
function function_ecffd525(player) {
    if (!isdefined(player.var_e325b124)) {
        player.var_e325b124 = 0;
    }
    player.var_e325b124++;
    self open_timer(player);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 1, eflags: 0x1 linked
// Checksum 0xa228a17d, Offset: 0x540
// Size: 0x44
function open_timer(player) {
    if (!self is_open(player)) {
        self open(player, 1);
    }
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 3, eflags: 0x1 linked
// Checksum 0x188a17f1, Offset: 0x590
// Size: 0x110
function function_9bab3960(player, b_force_close = 0, var_b1100790) {
    if (!isdefined(player.var_e325b124)) {
        player.var_e325b124 = 0;
    }
    player.var_e325b124--;
    if (player.var_26b0547b === var_b1100790) {
        player.var_26b0547b = undefined;
    }
    if (self is_open(player) && (player.var_e325b124 <= 0 || b_force_close)) {
        player.var_e325b124 = 0;
        self close(player);
        player notify(#"hash_2a4a6c3c411261d8");
        player.var_26b0547b = undefined;
        if (b_force_close) {
            player notify(#"hash_660dedc4af5b4336");
        }
    }
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 1, eflags: 0x0
// Checksum 0x5717f973, Offset: 0x6a8
// Size: 0x40
function register(uid) {
    elem = new czm_arcade_timer();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 2, eflags: 0x1 linked
// Checksum 0xcb6369ef, Offset: 0x6f0
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 1, eflags: 0x1 linked
// Checksum 0xf4887803, Offset: 0x730
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 1, eflags: 0x1 linked
// Checksum 0x28d2ac, Offset: 0x758
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 2, eflags: 0x1 linked
// Checksum 0xd29cf038, Offset: 0x780
// Size: 0x28
function set_showzero(player, value) {
    [[ self ]]->set_showzero(player, value);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 2, eflags: 0x1 linked
// Checksum 0x3a57678a, Offset: 0x7b0
// Size: 0x28
function set_seconds(player, value) {
    [[ self ]]->set_seconds(player, value);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 2, eflags: 0x1 linked
// Checksum 0x69818f45, Offset: 0x7e0
// Size: 0x28
function set_minutes(player, value) {
    [[ self ]]->set_minutes(player, value);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 2, eflags: 0x1 linked
// Checksum 0xd188f9c8, Offset: 0x810
// Size: 0x28
function set_title(player, value) {
    [[ self ]]->set_title(player, value);
}


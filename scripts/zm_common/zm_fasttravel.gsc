#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\zm_common\trials\zm_trial_disable_buys;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_challenges;
#using scripts\zm_common\zm_contracts;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;

#namespace zm_fasttravel;

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x2
// Checksum 0x78c5bfe7, Offset: 0x448
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_fasttravel", &__init__, &__main__, undefined);
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0x916a215a, Offset: 0x498
// Size: 0xbc
function __init__() {
    init_clientfields();
    function_44a82004("power_on");
    level flag::init(#"disable_fast_travel");
    /#
        zm_devgui::add_custom_devgui_callback(&function_dd6276f3);
        adddebugcommand("<dev string:x38>");
        adddebugcommand("<dev string:x8b>");
        adddebugcommand("<dev string:xdc>");
    #/
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0xf248480d, Offset: 0x560
// Size: 0x194
function init_clientfields() {
    clientfield::register("world", "fasttravel_exploder", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"wormhole_fx", 1, 2, "int");
    clientfield::register("toplayer", "player_stargate_fx", 1, 1, "int");
    clientfield::register("toplayer", "player_chaos_light_rail_fx", 1, 1, "int");
    clientfield::register("toplayer", "fasttravel_teleport_sfx", 1, 1, "int");
    clientfield::register("allplayers", "fasttravel_start_fx", 1, 1, "counter");
    clientfield::register("allplayers", "fasttravel_end_fx", 1, 1, "counter");
    clientfield::register("allplayers", "fasttravel_rail_fx", 1, 2, "int");
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0xfcd0697b, Offset: 0x700
// Size: 0x2a
function function_44a82004(str_flag) {
    if (!isdefined(level.var_5bfd847e)) {
        level.var_5bfd847e = str_flag;
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0xbcf4042c, Offset: 0x738
// Size: 0x306
function __main__() {
    var_7b5d3a70 = &function_2d4bda34;
    if (isdefined(level.var_a5689564)) {
        var_7b5d3a70 = level.var_a5689564;
    }
    var_1d1bbd52 = struct::get_array("fasttravel_trigger", "targetname");
    foreach (s_loc in var_1d1bbd52) {
        level thread [[ var_7b5d3a70 ]](s_loc);
    }
    callback::on_connect(&function_cdbbf1ee);
    level.var_f410ef3b = [];
    for (i = 0; i < 4; i++) {
        level.var_f410ef3b[i] = 0;
    }
    var_a3101e2f = getentarray("fasttravel_dropout", "targetname");
    foreach (var_d70a9989 in var_a3101e2f) {
        var_d70a9989 sethintstring(#"hash_499c3242364f1755");
        var_d70a9989 thread function_5165d69();
    }
    if (!(isdefined(level.var_d0fafce1) && level.var_d0fafce1)) {
        level thread function_1ab837f6();
    }
    s_room = struct::get("s_teleport_room_1", "targetname");
    if (isdefined(s_room)) {
        level.var_16fecec8 = 1;
        scene::add_scene_func("p8_fxanim_zm_zod_wormhole_bundle", &wormhole_fx);
        scene::add_scene_func("p8_fxanim_zm_office_wormhole_bundle", &wormhole_fx);
    }
    level.var_d03afa3 = [];
    level.var_1dbf5163 = &function_d06e636b;
    level.var_3c84697b = &function_b9c7ccbb;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0x4a161d90, Offset: 0xa48
// Size: 0xa4
function wormhole_fx(a_ents) {
    e_wormhole = a_ents[getfirstarraykey(a_ents)];
    do {
        util::wait_network_frame();
    } while (!e_wormhole isplayinganimscripted());
    e_wormhole clientfield::set("" + #"wormhole_fx", zm_utility::get_story());
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0x15ab617c, Offset: 0xaf8
// Size: 0xe
function function_cdbbf1ee() {
    self.var_9c7b96ed = [];
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0xb30a98b2, Offset: 0xb10
// Size: 0x274
function function_2d4bda34(s_loc) {
    s_loc.unitrigger_stub = spawnstruct();
    s_loc.unitrigger_stub.origin = s_loc.origin;
    s_loc.unitrigger_stub.angles = s_loc.angles;
    s_loc.unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
    s_loc.unitrigger_stub.cursor_hint = "HINT_NOICON";
    s_loc.unitrigger_stub.require_look_at = 0;
    s_loc.unitrigger_stub.script_string = s_loc.script_string;
    s_loc.unitrigger_stub.script_noteworthy = s_loc.script_noteworthy;
    s_loc.unitrigger_stub.var_7b3e65fe = s_loc.var_7b3e65fe;
    s_loc.unitrigger_stub.var_a4134e51 = s_loc.var_a4134e51;
    s_loc.unitrigger_stub.zombie_cost = s_loc.zombie_cost;
    s_loc.unitrigger_stub.var_8d5d092c = s_loc.unitrigger_stub.script_string;
    s_loc.unitrigger_stub.delay = s_loc.delay;
    s_loc.unitrigger_stub.used = 0;
    if (isdefined(s_loc.unitrigger_stub.delay)) {
        s_loc.unitrigger_stub flag::init("delayed");
    }
    if (isdefined(level.var_829d6a97)) {
        s_loc [[ level.var_829d6a97 ]]();
    }
    s_loc.unitrigger_stub.prompt_and_visibility_func = &function_5c18a7f4;
    zm_unitrigger::unitrigger_force_per_player_triggers(s_loc.unitrigger_stub, 1);
    zm_unitrigger::register_static_unitrigger(s_loc.unitrigger_stub, &function_6cde5436);
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0x17767766, Offset: 0xd90
// Size: 0x280
function function_5c18a7f4(player) {
    if (!isdefined(self.hint_string)) {
        self.hint_string = [];
    }
    n_player_index = player getentitynumber();
    if (!(isdefined(player.var_16735873) && player.var_16735873)) {
        self setvisibletoplayer(player);
    } else {
        self setinvisibletoplayer(player);
    }
    if (isdefined(level.var_e9737821)) {
        var_235457fd = self [[ level.var_e9737821 ]](player, self.stub.var_8d5d092c);
    } else {
        var_235457fd = self function_c52e8ba(player, self.stub.var_8d5d092c);
    }
    if (!(isdefined(player.var_9c7b96ed[self.stub.var_8d5d092c]) && player.var_9c7b96ed[self.stub.var_8d5d092c])) {
        if (isdefined(player.var_d883eecd)) {
            n_cost = player.var_d883eecd;
        } else if (isdefined(self.stub)) {
            n_cost = self.stub.zombie_cost;
        } else {
            n_cost = self.zombie_cost;
        }
    }
    if (isdefined(self.hint_string[n_player_index]) && self.hint_string[n_player_index] !== " ") {
        if (zm_trial_disable_buys::is_active() && !isdefined(level.var_a29299fb)) {
            self sethintstringforplayer(player, #"hash_55d25caf8f7bbb2f");
        } else if (isdefined(n_cost)) {
            self sethintstringforplayer(player, self.hint_string[n_player_index], n_cost);
        } else {
            self sethintstringforplayer(player, self.hint_string[n_player_index]);
        }
    }
    return var_235457fd;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 2, eflags: 0x1 linked
// Checksum 0x3f4de565, Offset: 0x1018
// Size: 0x21e
function function_c52e8ba(player, var_8d5d092c) {
    b_result = 0;
    if (!isdefined(self.hint_string)) {
        self.hint_string = [];
    }
    n_player_index = player getentitynumber();
    if (!self function_d06e636b(player)) {
        self.hint_string[n_player_index] = #"";
    } else if (isdefined(self.stub.var_a4134e51) && !level flag::get(self.stub.var_a4134e51)) {
        self.hint_string[n_player_index] = #"zombie/fasttravel_locked";
        b_result = 1;
    } else if (isdefined(player.var_9c7b96ed[var_8d5d092c]) && player.var_9c7b96ed[var_8d5d092c]) {
        self.hint_string[n_player_index] = #"hash_7667bd0f83307360";
        b_result = 1;
    } else if (isdefined(self.stub.delay) && !self.stub flag::get("delayed")) {
        self.hint_string[n_player_index] = #"zombie/fasttravel_delay";
        b_result = 1;
    } else {
        if (function_8b1a219a()) {
            self.hint_string[n_player_index] = #"hash_47b20f457b370888";
        } else {
            self.hint_string[n_player_index] = #"hash_2731cc5c1208e2e4";
        }
        b_result = 1;
    }
    return b_result;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0x6f9ce352, Offset: 0x1240
// Size: 0x13e
function function_d06e636b(player) {
    if (!level flag::get(level.var_5bfd847e)) {
        return false;
    } else if (!zombie_utility::is_player_valid(player)) {
        return false;
    } else if (isdefined(player.var_16735873) && player.var_16735873 && isdefined(self.stub) && self.stub.script_string !== "dropout") {
        return false;
    } else if (isdefined(player.var_564dec14) && player.var_564dec14) {
        return false;
    } else if (player isthrowinggrenade() || player isusingoffhand()) {
        return false;
    } else if (level flag::get(#"disable_fast_travel")) {
        return false;
    }
    return true;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0xc522014b, Offset: 0x1388
// Size: 0x400
function function_6cde5436() {
    level endon(#"end_game");
    var_8d5d092c = self.stub.var_8d5d092c;
    while (true) {
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (player zm_utility::in_revive_trigger()) {
            continue;
        }
        if (player zm_utility::is_drinking()) {
            continue;
        }
        if (player isthrowinggrenade() || player isusingoffhand()) {
            continue;
        }
        if (zm_trial_disable_buys::is_active() && !isdefined(level.var_a29299fb)) {
            continue;
        }
        if (isdefined(player.var_564dec14) && player.var_564dec14) {
            continue;
        }
        if (isdefined(player.var_16735873) && player.var_16735873) {
            continue;
        }
        if (!zm_utility::is_player_valid(player)) {
            continue;
        }
        if (isdefined(self.stub.var_a4134e51) && !level flag::get(self.stub.var_a4134e51)) {
            continue;
        }
        if (isdefined(player.var_9c7b96ed[var_8d5d092c]) && player.var_9c7b96ed[var_8d5d092c]) {
            continue;
        }
        if (isdefined(self.stub.delay) && !self.stub flag::get("delayed")) {
            continue;
        }
        if (isdefined(player.var_d883eecd)) {
            n_cost = player.var_d883eecd;
        } else if (isdefined(self.stub)) {
            n_cost = self.stub.zombie_cost;
        } else {
            n_cost = self.zombie_cost;
        }
        if (isdefined(level.var_91171ae5)) {
            n_cost = player [[ level.var_91171ae5 ]](self);
        }
        if (!player zm_score::can_player_purchase(n_cost)) {
            /#
                player iprintln("<dev string:x127>");
            #/
            player zm_audio::create_and_play_dialog(#"general", #"outofmoney");
            continue;
        }
        player zm_score::minus_to_player_score(n_cost);
        level notify(#"fasttravel_bought", {#player:player});
        player notify(#"fasttravel_bought");
        if (isdefined(level.var_352c9e03)) {
            player [[ level.var_352c9e03 ]](self);
        }
        if (isdefined(self.stub)) {
            player thread function_b9c7ccbb(self.stub, self.stub.var_7b3e65fe);
            continue;
        }
        player thread function_b9c7ccbb(self);
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 2, eflags: 0x1 linked
// Checksum 0x91debcb4, Offset: 0x1790
// Size: 0x536
function function_b9c7ccbb(var_12230d08, var_829a20a8 = 0) {
    level endon(#"end_game");
    self endon(#"death");
    n_index = get_player_index(self);
    var_f80635c = var_12230d08.script_string;
    self.var_388ee880 = var_f80635c;
    self.var_3011d31c = 0;
    var_4500bf3f = var_12230d08.script_noteworthy;
    var_8d5d092c = var_12230d08.var_8d5d092c;
    var_12230d08.used = 1;
    switch (var_4500bf3f) {
    case #"traverse":
        if (var_829a20a8) {
            if (var_f80635c === "dropout") {
                n_idx = self.var_85c91ccc;
            } else {
                n_idx = function_de173abb(var_f80635c);
                if (!isdefined(n_idx)) {
                    return;
                }
                self.var_85c91ccc = n_idx;
            }
            nd_path_start = getvehiclenode("fasttravel_" + var_f80635c + "_start_" + n_idx, "targetname");
            var_384528 = getvehiclenode("fasttravel_" + var_f80635c + "_zipline_end_" + n_idx, "targetname");
            str_notify = "fasttravel_" + var_f80635c + "_zipline_end_" + n_idx;
        } else {
            nd_path_start = getvehiclenode("fasttravel_" + var_f80635c + "_start", "targetname");
            str_notify = var_f80635c + "_end";
        }
        var_5314bd63 = getent("veh_fasttravel_cam", "targetname");
        self function_66d020b0(var_5314bd63, nd_path_start, undefined, str_notify, undefined, var_12230d08, undefined, undefined);
        break;
    case #"flinger":
    case #"teleport":
        n_idx = function_de173abb(var_f80635c);
        if (!isdefined(n_idx)) {
            return;
        }
        self.var_85c91ccc = n_idx;
        str_notify = "fasttravel_" + var_f80635c + "_end_" + n_idx;
        self function_66d020b0(undefined, undefined, undefined, str_notify, undefined, var_12230d08, undefined, undefined);
        break;
    }
    if (!var_829a20a8) {
        if (self.var_3011d31c) {
            var_6a4c362c = function_7a74dbfd(var_f80635c + "_dropdown_end_");
            var_f0bbde5 = self function_d4fbc062(var_6a4c362c);
        } else {
            var_6a4c362c = function_7a74dbfd(var_f80635c + "_end_");
            var_f0bbde5 = self function_d4fbc062(var_6a4c362c);
        }
    }
    var_f499ccef = 1;
    if (var_4500bf3f == "traverse") {
        util::wait_network_frame();
        if (isdefined(level.var_9d19ea6d) && level.var_9d19ea6d) {
            var_f499ccef = 0;
        }
    } else if (var_4500bf3f == "flinger") {
        var_f499ccef = 0;
    }
    self function_2aed1d83(var_f0bbde5, var_f499ccef);
    if (isdefined(level.var_1e47389a)) {
        self thread [[ level.var_1e47389a ]]();
    }
    if (isdefined(self.var_a5a050c1)) {
        n_cooldown_timer = self.var_a5a050c1;
    } else if (isdefined(level.var_a5a050c1)) {
        n_cooldown_timer = level.var_a5a050c1;
    } else {
        n_cooldown_timer = 30;
    }
    self function_c1f603e(var_12230d08, n_cooldown_timer, var_8d5d092c);
    self notify(#"hash_178a3d0115bc972e", {#var_9fa6220c:var_12230d08});
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 2, eflags: 0x1 linked
// Checksum 0x9bc169b1, Offset: 0x1cd0
// Size: 0xbc
function function_2aed1d83(var_f0bbde5, var_b3733073 = 1) {
    self dontinterpolate();
    self setorigin(var_f0bbde5.origin);
    if (var_b3733073) {
        self setplayerangles(var_f0bbde5.angles);
    }
    self function_e61d152a();
    self.var_16735873 = 0;
    self thread function_f86439bc();
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0xab538a65, Offset: 0x1d98
// Size: 0x196
function function_f86439bc() {
    level endon(#"end_game");
    self endon(#"death");
    var_e9a9a32a = 1;
    do {
        util::wait_network_frame();
        var_e9a9a32a = 0;
        players = getplayers();
        foreach (e_player in players) {
            if (!isdefined(e_player)) {
                continue;
            }
            n_distance_squared = distance2dsquared(e_player.origin, self.origin);
            if (self != e_player && !(isdefined(e_player.var_16735873) && e_player.var_16735873) && n_distance_squared <= 4096) {
                /#
                    iprintlnbold("<dev string:x13b>");
                #/
                var_e9a9a32a = 1;
                break;
            }
        }
    } while (var_e9a9a32a);
    self.var_f4e33249 = undefined;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0x1af28446, Offset: 0x1f38
// Size: 0x9c
function function_de173abb(str_loc) {
    var_33c06362 = level.var_f410ef3b.size;
    for (i = 0; i < var_33c06362; i++) {
        n_idx = randomint(var_33c06362);
        if (level.var_f410ef3b[n_idx] == 0) {
            level.var_f410ef3b[n_idx] = 1;
            return n_idx;
        }
    }
    return undefined;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0x1adc29d1, Offset: 0x1fe0
// Size: 0x6e
function get_player_index(e_player) {
    a_players = getplayers(e_player.team);
    for (i = 0; i < a_players.size; i++) {
        if (e_player == a_players[i]) {
            return i;
        }
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0x84f1b495, Offset: 0x2058
// Size: 0xe6
function function_7a74dbfd(str_targetname) {
    var_6a4c362c = [];
    for (i = 0; i < 4; i++) {
        var_f0bbde5 = struct::get(str_targetname + i);
        assert(isdefined(var_f0bbde5), "<dev string:x162>" + str_targetname + i);
        if (!isdefined(var_6a4c362c)) {
            var_6a4c362c = [];
        } else if (!isarray(var_6a4c362c)) {
            var_6a4c362c = array(var_6a4c362c);
        }
        var_6a4c362c[var_6a4c362c.size] = var_f0bbde5;
    }
    return var_6a4c362c;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 9, eflags: 0x1 linked
// Checksum 0x835eab21, Offset: 0x2148
// Size: 0x87c
function function_66d020b0(var_5314bd63, nd_path_start, var_384528, str_notify, var_6c365dbf, var_12230d08, var_5817f611, var_8f1ba730 = 0, var_6e7468ee = 1) {
    level endon(#"end_game");
    self endoncallback(&function_79766c56, #"bled_out", #"death");
    self.var_16735873 = 1;
    self function_7a607f29(var_12230d08);
    self.var_f4e33249 = 1;
    self val::set(#"fasttravel", "freezecontrols", 1);
    if (isdefined(var_12230d08)) {
        var_5817f611 = var_12230d08.script_string;
        self.var_5817f611 = var_5817f611;
        var_44c6df03 = var_12230d08.var_cafe149c;
    }
    if (!var_8f1ba730) {
        while (level.var_d03afa3[var_5817f611] === 1) {
            util::wait_network_frame();
        }
        level thread function_78e3c2ba(var_5817f611);
    }
    foreach (e_player in getplayers()) {
        e_player clientfield::set_player_uimodel("WorldSpaceIndicators.bleedOutModel" + self getentitynumber() + ".hide", 1);
    }
    if (!self laststand::player_is_in_laststand()) {
        str_stance = self getstance();
        switch (str_stance) {
        case #"crouch":
            self setstance("stand");
            wait 0.2;
            break;
        case #"prone":
            self setstance("stand");
            wait 1;
            break;
        }
    }
    if (isdefined(var_6c365dbf)) {
        if (isarray(var_6c365dbf)) {
            self util::create_streamer_hint(var_6c365dbf[0].origin, var_6c365dbf[0].angles, 1);
        } else {
            self util::create_streamer_hint(var_6c365dbf.origin, var_6c365dbf.angles, 1);
        }
    }
    self notify(#"hash_1c35eb15aa210d6", {#var_9fa6220c:var_12230d08});
    /#
        self zm_challenges::debug_print("<dev string:x185>");
    #/
    self zm_stats::increment_challenge_stat(#"fast_travels");
    self contracts::increment_zm_contract(#"contract_zm_fast_travel");
    if (!(isdefined(self.var_472e3448) && self.var_472e3448)) {
        self stopsounds();
    }
    if (!isdefined(var_12230d08) || isdefined(var_12230d08) && !(isdefined(var_12230d08.var_694cbc6f) && var_12230d08.var_694cbc6f)) {
        self ghost();
    }
    self thread function_946fc2d6();
    self clientfield::increment("fasttravel_start_fx", 1);
    if (isdefined(var_5314bd63)) {
        self thread fasttravel_spline(var_5314bd63, nd_path_start, var_384528);
    } else if (isdefined(var_12230d08) && var_12230d08.script_noteworthy === "flinger") {
        self thread fasttravel_flinger(var_6c365dbf, var_12230d08);
    } else if (isdefined(level.var_16fecec8) && level.var_16fecec8) {
        self thread function_a78584c0(var_6c365dbf);
    } else {
        self thread function_62686dda(var_6c365dbf);
    }
    self waittill(#"fasttravel_over");
    if (isdefined(var_5314bd63)) {
        self clientfield::set("fasttravel_rail_fx", 0);
        self clientfield::set_to_player("player_chaos_light_rail_fx", 0);
        util::wait_network_frame();
        self allowcrouch(1);
        self allowprone(1);
    } else {
        self val::reset(#"fasttravel", "freezecontrols");
    }
    if (isdefined(var_44c6df03)) {
        self clientfield::increment(var_44c6df03, 1);
    } else {
        self clientfield::increment("fasttravel_end_fx", 1);
    }
    self show();
    if (isdefined(self.var_85c91ccc)) {
        level.var_f410ef3b[self.var_85c91ccc] = 0;
    }
    if (isdefined(str_notify)) {
        level notify(str_notify);
    }
    if (isdefined(var_6c365dbf)) {
        self util::clear_streamer_hint();
    }
    self.var_5817f611 = undefined;
    self notify(#"fasttravel_finished", {#var_9fa6220c:var_12230d08});
    foreach (e_player in getplayers()) {
        e_player clientfield::set_player_uimodel("WorldSpaceIndicators.bleedOutModel" + self getentitynumber() + ".hide", 0);
    }
    if (isdefined(var_6e7468ee) && var_6e7468ee && isdefined(level.var_34eb792d)) {
        thread [[ level.var_34eb792d ]](self, var_12230d08);
    }
    self util::delay(0.3, undefined, &zm_audio::create_and_play_dialog, #"fast_travel", #"end");
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0xaf2a0d08, Offset: 0x29d0
// Size: 0x64
function function_78e3c2ba(var_5817f611) {
    level endon(#"end_game");
    level.var_d03afa3[var_5817f611] = 1;
    util::wait_network_frame(2);
    level.var_d03afa3[var_5817f611] = undefined;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0xc8a930eb, Offset: 0x2a40
// Size: 0x134
function function_7a607f29(var_12230d08) {
    self.var_f22c83f5 = 1;
    self.var_e75517b1 = 1;
    self val::set(#"fasttravel", "ignoreme", 1);
    b_disable_weapons = 1;
    if (isdefined(var_12230d08) && isdefined(var_12230d08.var_638d9008) && var_12230d08.var_638d9008) {
        b_disable_weapons = 0;
    }
    if (b_disable_weapons) {
        if (self isusingoffhand()) {
            self forceoffhandend();
        }
        self val::set(#"fasttravel", "disable_weapons", 1);
    }
    self bgb::suspend_weapon_cycling();
    self.bgb_disabled = 1;
    self util::magic_bullet_shield();
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0x748d27af, Offset: 0x2b80
// Size: 0xa4
function function_e61d152a() {
    self.var_f22c83f5 = 0;
    self.var_e75517b1 = 0;
    self val::reset(#"fasttravel", "ignoreme");
    self val::reset(#"fasttravel", "disable_weapons");
    self.bgb_disabled = 0;
    self bgb::resume_weapon_cycling();
    self util::stop_magic_bullet_shield();
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0x2dc5c67, Offset: 0x2c30
// Size: 0xba
function function_79766c56(str_notify) {
    switch (str_notify) {
    case #"bled_out":
        self function_e61d152a();
        self val::reset(#"fasttravel", "freezecontrols");
        self allowcrouch(1);
        self allowprone(1);
        self.var_f4e33249 = undefined;
        self.var_16735873 = 0;
        break;
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 3, eflags: 0x1 linked
// Checksum 0xe1b6b71b, Offset: 0x2cf8
// Size: 0x41c
function fasttravel_spline(var_5314bd63, nd_path_start, var_384528) {
    self endon(#"death");
    while (true) {
        self.var_2790fd8b = spawner::simple_spawn_single(var_5314bd63);
        if (isdefined(self.var_2790fd8b)) {
            break;
        }
        waitframe(1);
    }
    self.var_2790fd8b val::set("fasttravel_spline", "takedamage", 0);
    self.var_2790fd8b val::set("fasttravel_spline", "allowdeath", 0);
    self.var_2790fd8b setignorepauseworld(1);
    if (isdefined(level.var_a38d293a)) {
        self.var_2790fd8b setacceleration(level.var_a38d293a);
    } else {
        self.var_2790fd8b setacceleration(40);
    }
    if (isdefined(level.var_ce0f67cf)) {
        self.var_2790fd8b setspeed(level.var_ce0f67cf);
    } else {
        self.var_2790fd8b setspeed(55);
    }
    self.var_2790fd8b setturningability(0.03);
    self.var_2790fd8b.origin = nd_path_start.origin;
    self.var_2790fd8b.angles = nd_path_start.angles;
    self dontinterpolate();
    self setorigin(nd_path_start.origin);
    if (!(isdefined(level.var_9d19ea6d) && level.var_9d19ea6d)) {
        self setplayerangles(nd_path_start.angles);
    }
    self.var_2790fd8b.e_parent = self;
    if (isdefined(level.var_dfd49265) && level.var_dfd49265) {
        self playerlinktodelta(self.var_2790fd8b, undefined, 0.5, 0, 0, 0, 0);
    } else if (isdefined(level.var_9d19ea6d) && level.var_9d19ea6d) {
        self playerlinktodelta(self.var_2790fd8b, undefined, 0.5, 180, 180, 180, 180, 1, 0);
    } else {
        self playerlinktodelta(self.var_2790fd8b, undefined, 0.5, 30, 30, 15, 30);
    }
    self val::reset(#"fasttravel", "freezecontrols");
    self allowcrouch(0);
    self allowprone(0);
    self.var_2790fd8b vehicle::get_on_path(nd_path_start);
    util::wait_network_frame();
    self clientfield::set("fasttravel_rail_fx", 1);
    self clientfield::set_to_player("player_chaos_light_rail_fx", 1);
    self thread function_ab80021(var_384528);
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0x5fac069d, Offset: 0x3120
// Size: 0x186
function function_62686dda(var_6c365dbf) {
    var_a16f5b07 = self.origin;
    self playrumbleonentity(#"hash_5d8a1a68b12dfb24");
    wait 0.5;
    self clientfield::set_to_player("player_stargate_fx", 1);
    self clientfield::set_to_player("fasttravel_teleport_sfx", 1);
    if (isdefined(var_6c365dbf)) {
        if (isarray(var_6c365dbf)) {
            var_f0bbde5 = self function_d4fbc062(var_6c365dbf);
        } else {
            var_f0bbde5 = var_6c365dbf;
        }
        self function_2aed1d83(var_f0bbde5);
    }
    playsoundatposition(#"hash_3388d9809bf60b12", var_a16f5b07);
    wait 0.5;
    self clientfield::set_to_player("player_stargate_fx", 0);
    self clientfield::set_to_player("fasttravel_teleport_sfx", 0);
    self playsound(#"hash_52aaa9a4a2e71c73");
    self notify(#"fasttravel_over");
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0x92bcc5b, Offset: 0x32b0
// Size: 0x180
function function_946fc2d6() {
    level endon(#"end_game");
    self endon(#"death");
    self waittill(#"fasttravel_over");
    a_enemies = level.ai[#"axis"];
    if (isdefined(a_enemies) && a_enemies.size) {
        a_potential_targets = array::get_all_closest(self.origin, a_enemies, undefined, undefined, 640);
        var_ecfe5e20 = array::filter(a_potential_targets, 0, &function_6c856fde);
        if (var_ecfe5e20.size > 0) {
            foreach (zombie in var_ecfe5e20) {
                if (isdefined(zombie.completed_emerging_into_playable_area) && zombie.completed_emerging_into_playable_area) {
                    zombie zombie_utility::setup_zombie_knockdown(self);
                }
            }
        }
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0xf9d5285a, Offset: 0x3438
// Size: 0x52
function function_6c856fde(e_zombie) {
    if (e_zombie.var_6f84b820 == #"basic" || e_zombie.var_6f84b820 == #"enhanced") {
        return true;
    }
    return false;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 3, eflags: 0x1 linked
// Checksum 0xdc6a2ca8, Offset: 0x3498
// Size: 0xde
function function_c1f603e(var_12230d08, n_cooldown, var_8d5d092c) {
    level endon(#"end_game");
    self endon(#"death");
    if (var_8d5d092c == "no_cooldown") {
        return;
    }
    self.var_9c7b96ed[var_8d5d092c] = 1;
    if (self hasperk(#"specialty_cooldown")) {
        n_cooldown *= 0.5;
    }
    if (isdefined(var_12230d08)) {
        var_12230d08 waittilltimeout(n_cooldown, #"cancel_fasttravel_cooldown");
    } else {
        wait n_cooldown;
    }
    self.var_9c7b96ed[var_8d5d092c] = 0;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0x5788b96c, Offset: 0x3580
// Size: 0x238
function function_5165d69() {
    level endon(#"end_game");
    while (true) {
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!isdefined(player)) {
            assert(0, "<dev string:x1af>");
            continue;
        }
        var_616025ba = getvehiclenode("fasttravel_dropdown_" + player.var_388ee880 + "_start", "targetname");
        if (!isdefined(var_616025ba)) {
            assert(0, "<dev string:x1f1>");
            continue;
        }
        if (!isdefined(player.var_2790fd8b)) {
            assert(0, "<dev string:x215>");
            continue;
        }
        player endon(#"death");
        player.var_3011d31c = 1;
        player notify(#"switch_rail");
        player.var_2790fd8b vehicle::detach_path();
        player.var_2790fd8b vehicle::get_on_path(var_616025ba);
        player clientfield::set("fasttravel_rail_fx", 2);
        player.var_2790fd8b vehicle::go_path();
        player notify(#"fasttravel_over");
        player unlink();
        wait 0.3;
        if (isdefined(player.var_2790fd8b)) {
            player.var_2790fd8b delete();
        }
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0x9068ba15, Offset: 0x37c0
// Size: 0x150
function function_1ab837f6() {
    level endon(#"end_game");
    level waittill(#"all_players_spawned");
    level flag::wait_till(level.var_5bfd847e);
    level clientfield::set("fasttravel_exploder", 1);
    var_1d1bbd52 = struct::get_array("fasttravel_trigger", "targetname");
    foreach (s_loc in var_1d1bbd52) {
        if (isdefined(s_loc.unitrigger_stub.delay)) {
            s_loc.unitrigger_stub flag::delay_set(s_loc.unitrigger_stub.delay, "delayed");
        }
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0x3ae620d0, Offset: 0x3918
// Size: 0x184
function function_ab80021(var_384528) {
    level endon(#"end_game");
    self endon(#"disconnect", #"switch_rail");
    if (isdefined(self.var_2790fd8b)) {
        self.var_2790fd8b vehicle::go_path();
    }
    if (isdefined(var_384528)) {
        if (isdefined(self.var_2790fd8b)) {
            self.var_2790fd8b.origin = var_384528.origin;
        }
        self dontinterpolate();
        self setorigin(var_384528.origin);
        self setplayerangles(var_384528.angles);
        if (isdefined(self.var_2790fd8b)) {
            self.var_2790fd8b vehicle::get_on_path(var_384528);
            self.var_2790fd8b vehicle::go_path();
        }
    }
    self notify(#"fasttravel_over");
    self unlink();
    wait 0.3;
    if (isdefined(self.var_2790fd8b)) {
        self.var_2790fd8b delete();
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0xc9b4c97c, Offset: 0x3aa8
// Size: 0x40e
function function_a78584c0(var_6c365dbf) {
    level endon(#"end_game");
    self endoncallback(&function_9ff6bcf6, #"death");
    var_a16f5b07 = self.origin;
    self allowcrouch(0);
    self allowprone(0);
    var_1e1e92e9 = [];
    for (i = 0; i < 4; i++) {
        str_name = "s_teleport_room_" + i + 1;
        var_1e1e92e9[i] = struct::get(str_name, "targetname");
    }
    if (!isdefined(level.var_98b11ed9)) {
        level.var_98b11ed9 = 0;
    }
    s_teleport_room = var_1e1e92e9[level.var_98b11ed9];
    level.var_98b11ed9++;
    if (level.var_98b11ed9 >= var_1e1e92e9.size) {
        level.var_98b11ed9 = 0;
    }
    util::wait_network_frame();
    self dontinterpolate();
    self setorigin(s_teleport_room.origin);
    self setplayerangles(s_teleport_room.angles);
    self clientfield::set_to_player("fasttravel_teleport_sfx", 1);
    playsoundatposition(#"hash_3388d9809bf60b12", var_a16f5b07);
    println("<dev string:x25f>" + self getplayercamerapos());
    self.var_805b8325 = spawn("script_origin", self.origin);
    self.var_805b8325.angles = self.angles;
    self linkto(self.var_805b8325);
    waittillframeend();
    self playrumbleonentity(#"hash_5d8a1a68b12dfb24");
    self function_82c1415f();
    if (isdefined(self.var_805b8325)) {
        self.var_805b8325 delete();
        self.var_805b8325 = undefined;
    }
    if (isdefined(var_6c365dbf)) {
        if (isarray(var_6c365dbf)) {
            var_f0bbde5 = self function_d4fbc062(var_6c365dbf);
        } else {
            var_f0bbde5 = var_6c365dbf;
        }
        self function_2aed1d83(var_f0bbde5);
    }
    self clientfield::set_to_player("fasttravel_teleport_sfx", 0);
    self playsound(#"hash_52aaa9a4a2e71c73");
    self allowcrouch(1);
    self allowprone(1);
    self notify(#"fasttravel_over", {#str_type:#"vortex"});
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0xc0f84aca, Offset: 0x3ec0
// Size: 0x3c
function function_9ff6bcf6(var_c34665fc) {
    if (isdefined(self) && isdefined(self.var_805b8325)) {
        self.var_805b8325 delete();
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0x8022aed5, Offset: 0x3f08
// Size: 0x244
function function_82c1415f() {
    level endon(#"end_game");
    if (self laststand::player_is_in_laststand()) {
        v_offset = (0, 0, 12);
    } else {
        v_offset = (0, 0, 60);
    }
    var_cfda6c19 = self.origin + v_offset;
    v_loc = var_cfda6c19 + anglestoforward(self.angles) * 1000;
    s_wormhole = struct::spawn(v_loc, (self.angles[0], self.angles[1] - 90, self.angles[2]));
    if (!isdefined(level.var_f3901984)) {
        if (zm_utility::get_story() == 1) {
            s_wormhole scene::play("p8_fxanim_zm_office_wormhole_bundle");
        } else {
            s_wormhole scene::play("p8_fxanim_zm_zod_wormhole_bundle");
        }
    } else {
        if (zm_utility::get_story() == 1) {
            s_wormhole thread scene::play("p8_fxanim_zm_office_wormhole_bundle");
            wait level.var_f3901984;
            s_wormhole thread scene::stop("p8_fxanim_zm_office_wormhole_bundle");
        } else {
            s_wormhole thread scene::play("p8_fxanim_zm_zod_wormhole_bundle");
            wait level.var_f3901984;
            s_wormhole thread scene::stop("p8_fxanim_zm_zod_wormhole_bundle");
        }
        self stoprumble(#"hash_5d8a1a68b12dfb24");
    }
    s_wormhole struct::delete();
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0x246172e9, Offset: 0x4158
// Size: 0x11a
function function_d4fbc062(var_6a4c362c) {
    n_index = get_player_index(self);
    a_e_players = getplayers();
    if (self function_60d91d03(var_6a4c362c[n_index], a_e_players)) {
        return var_6a4c362c[n_index];
    }
    foreach (var_f0bbde5 in var_6a4c362c) {
        if (var_f0bbde5 == var_6a4c362c[n_index]) {
            continue;
        }
        if (self function_60d91d03(var_f0bbde5, a_e_players)) {
            return var_f0bbde5;
        }
    }
    return var_6a4c362c[n_index];
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 2, eflags: 0x1 linked
// Checksum 0x2df56d23, Offset: 0x4280
// Size: 0x13c
function function_60d91d03(var_f0bbde5, a_e_players) {
    b_safe = 1;
    foreach (e_player in a_e_players) {
        if (isdefined(e_player.var_16735873) && e_player.var_16735873) {
            continue;
        }
        if (abs(var_f0bbde5.origin[2] - e_player.origin[2]) > 60) {
            continue;
        }
        if (distance2dsquared(var_f0bbde5.origin, e_player.origin) > 4096) {
            continue;
        }
        b_safe = 0;
        break;
    }
    return b_safe;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 2, eflags: 0x1 linked
// Checksum 0xf5b76070, Offset: 0x43c8
// Size: 0x19c
function fasttravel_flinger(var_6c365dbf, var_12230d08) {
    level endon(#"end_game");
    self endoncallback(&function_672d56c7, #"death");
    self.var_46e13a5f = util::spawn_model("tag_origin", self.origin, self.angles);
    self playerlinkto(self.var_46e13a5f);
    if (isdefined(var_6c365dbf)) {
        if (isarray(var_6c365dbf)) {
            var_f0bbde5 = self function_d4fbc062(var_6c365dbf);
        } else {
            var_f0bbde5 = var_6c365dbf;
        }
        var_c9a46783 = var_f0bbde5;
    } else {
        var_c9a46783 = struct::get(var_12230d08.var_5d8fb38b, "targetname");
    }
    n_time = self.var_46e13a5f zm_utility::fake_physicslaunch(var_c9a46783.origin, var_12230d08.var_152a43e0);
    wait n_time;
    self notify(#"fasttravel_over");
    if (isdefined(self.var_46e13a5f)) {
        self.var_46e13a5f delete();
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x1 linked
// Checksum 0x4d736738, Offset: 0x4570
// Size: 0x2c
function function_672d56c7() {
    if (isdefined(self.var_46e13a5f)) {
        self.var_46e13a5f delete();
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x0
// Checksum 0xe19083de, Offset: 0x45a8
// Size: 0x11a
function function_dd6276f3(cmd) {
    switch (cmd) {
    case #"start_looping":
        if (!(isdefined(level.var_2a40310c) && level.var_2a40310c)) {
            level.var_2a40310c = 1;
            level thread function_8d419972(0);
        }
        break;
    case #"stop_looping":
        if (isdefined(level.var_2a40310c) && level.var_2a40310c) {
            level.var_2a40310c = 0;
        }
        break;
    case #"play_once":
        if (!(isdefined(level.var_2a40310c) && level.var_2a40310c)) {
            level.var_2a40310c = 1;
            level thread function_8d419972(1);
        }
        break;
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 1, eflags: 0x1 linked
// Checksum 0x9ebb83b4, Offset: 0x46d0
// Size: 0x12c
function function_8d419972(b_play_once) {
    level endon(#"end_game");
    s_loc = struct::spawn((0, 0, 0));
    player = level.players[0];
    player endon(#"disconnect");
    var_78e5d9d1 = player.origin;
    v_start_angles = player.angles;
    while (isdefined(level.var_2a40310c) && level.var_2a40310c) {
        player function_a78584c0(s_loc);
        if (isdefined(b_play_once) && b_play_once) {
            level.var_2a40310c = 0;
        }
    }
    player setorigin(var_78e5d9d1);
    player setplayerangles(v_start_angles);
}


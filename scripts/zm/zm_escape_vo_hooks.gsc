// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_escape_paschal.gsc;
#using scripts\zm\zm_escape_travel.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_escape_vo_hooks;

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x2
// Checksum 0x56a55e21, Offset: 0x240
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_escape_vo_hooks", &__init__, &__main__, undefined);
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0x5c4588f2, Offset: 0x290
// Size: 0x54
function __init__() {
    callback::on_connect(&on_player_connect);
    level init_flags();
    level thread init_announcer();
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0xbbfc86c4, Offset: 0x2f0
// Size: 0x12c
function __main__() {
    level flag::wait_till(#"all_players_spawned");
    level thread function_f1da2bd5();
    level thread function_bdc25d1b();
    level thread function_35491a0e();
    level thread function_49189399();
    level thread function_3deb7fb0();
    level thread function_a78a3261();
    level thread function_f34169e8();
    level thread function_22101968();
    level thread function_4e68b0f4();
    level thread function_29543c();
    level thread function_963edada();
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0xadc2fe3f, Offset: 0x428
// Size: 0x84
function init_flags() {
    level flag::init(#"hash_20ac26ecda866c45");
    level flag::init(#"hash_59cfca3c898df56d");
    level flag::init(#"hash_779398f97110e7b8");
    level flag::init(#"hash_732657441f7793dc");
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0x83c7422c, Offset: 0x4b8
// Size: 0x34
function init_announcer() {
    zm_audio::sndannouncervoxadd(#"hash_180baca4b791b352", #"hash_53687fb8d75cd0d");
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0xd77a5f0f, Offset: 0x4f8
// Size: 0x3c
function on_player_connect() {
    self flag::init(#"hash_1308e79a11093c1e");
    self thread function_9af564c();
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0x606d2643, Offset: 0x540
// Size: 0xa4
function function_4e68b0f4() {
    var_baa069fa = getent("t_v_o_exam", "targetname");
    s_info = undefined;
    s_info = var_baa069fa waittill(#"trigger");
    e_player = s_info.activator;
    e_player thread zm_audio::create_and_play_dialog(#"exam_room", #"react", undefined, 1);
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0x80f51943, Offset: 0x5f0
// Size: 0x294
function function_29543c() {
    var_baa069fa = getent("t_v_o_docks", "targetname");
    s_info = undefined;
    s_info = var_baa069fa waittill(#"trigger");
    e_player = s_info.activator;
    b_say = e_player zm_audio::create_and_play_dialog(#"zone_dock", #"react_0", undefined, 1);
    if (isdefined(b_say) && b_say && e_player zm_characters::is_character(array(#"hash_1aa57ef704f24fa5", #"hash_36bc80636f0fdac4"))) {
        wait(soundgetplaybacktime(#"hash_6598db6cd61c4aad") / 1000);
        e_nikolai = undefined;
        foreach (var_a7cf1037 in level.players) {
            if (var_a7cf1037 zm_characters::is_character(array(#"hash_22e6f7e13c3a99ef", #"hash_46b92e1337b43236"))) {
                e_nikolai = var_a7cf1037;
                break;
            }
        }
        if (isalive(e_nikolai) && isalive(e_player)) {
            if (distancesquared(e_nikolai.origin, e_player.origin) < 589824) {
                var_9a0250b7 = #"hash_465a6e7feb94a61d";
                e_nikolai zm_vo::vo_say(var_9a0250b7, 0, 0, 9999);
            }
        }
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0x88c6058d, Offset: 0x890
// Size: 0x68
function function_9af564c() {
    self endon(#"disconnect");
    while (1) {
        self waittill(#"hash_1413599b710f10bd");
        self thread zm_audio::create_and_play_dialog(#"brutus", #"helm_off", undefined);
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x5 linked
// Checksum 0xd1d6b10f, Offset: 0x900
// Size: 0xc4
function private function_f34169e8() {
    level endon(#"end_game");
    s_escape_plan_vo_react = struct::get("s_map_react_vo_rich_lab");
    s_escape_plan_vo_react.s_unitrigger_stub = s_escape_plan_vo_react zm_unitrigger::create(undefined, 64, &function_65a374eb);
    if (level flag::exists(#"hash_40e9ad323fe8402a")) {
        level flag::wait_till(#"hash_40e9ad323fe8402a");
        zm_unitrigger::unregister_unitrigger(s_escape_plan_vo_react.s_unitrigger_stub);
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0x9277d66d, Offset: 0x9d0
// Size: 0x90
function function_65a374eb() {
    level endon(#"hash_40e9ad323fe8402a");
    while (1) {
        s_result = undefined;
        s_result = self waittill(#"trigger");
        e_player = s_result.activator;
        e_player thread zm_audio::create_and_play_dialog(#"map", #"react");
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x5 linked
// Checksum 0xa792cf2f, Offset: 0xa68
// Size: 0x178
function private function_f1da2bd5() {
    var_44e6a82b = struct::get_array("s_pods_react");
    foreach (s_pod in var_44e6a82b) {
        s_pod.s_unitrigger_stub = s_pod zm_unitrigger::create(&function_480ec8c, 96, &function_4f89089b);
    }
    if (level flag::exists(#"hash_379fc22ed85f0dbc")) {
        level flag::wait_till(#"hash_379fc22ed85f0dbc");
        foreach (s_pod in var_44e6a82b) {
            zm_unitrigger::unregister_unitrigger(s_pod.s_unitrigger_stub);
        }
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 1, eflags: 0x1 linked
// Checksum 0x7af09238, Offset: 0xbe8
// Size: 0x5a
function function_480ec8c(player) {
    if (!(isdefined(player.var_b5fbfab4) && player.var_b5fbfab4)) {
        self sethintstring(#"");
        return 1;
    }
    return 0;
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0x4af1df75, Offset: 0xc50
// Size: 0x13e
function function_4f89089b() {
    while (1) {
        s_result = undefined;
        s_result = self waittill(#"trigger");
        if (isplayer(s_result.activator) && isalive(s_result.activator)) {
            b_played = s_result.activator zm_audio::create_and_play_dialog(#"vpods", #"react");
            if (isdefined(b_played) && b_played) {
                s_result.activator.var_b5fbfab4 = 1;
                if (isdefined(self.stub.related_parent.script_string) && self.stub.related_parent.script_string == "stuh") {
                    s_result.activator.var_59dde2f6 = 1;
                }
            }
        }
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0xcc6198ff, Offset: 0xd98
// Size: 0x128
function function_963edada() {
    level endoncallback(&function_19af3d1b, #"hash_59cfca3c898df56d", #"hash_732657441f7793dc", #"end_game");
    var_d98d7f94 = getent("t_cell_block_vista_vo", "targetname");
    while (isdefined(var_d98d7f94)) {
        s_result = undefined;
        s_result = var_d98d7f94 waittill(#"trigger");
        b_play = s_result.activator zm_audio::create_and_play_dialog(#"vista", #"react");
        if (isdefined(b_play) && b_play) {
            level flag::set(#"hash_59cfca3c898df56d");
        }
        wait(0.1);
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 1, eflags: 0x1 linked
// Checksum 0xcd6d09d4, Offset: 0xec8
// Size: 0x54
function function_19af3d1b(str_notify) {
    var_d98d7f94 = getent("t_cell_block_vista_vo", "targetname");
    if (isdefined(var_d98d7f94)) {
        var_d98d7f94 delete();
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x5 linked
// Checksum 0xf931b205, Offset: 0xf28
// Size: 0xac
function private function_bdc25d1b() {
    var_73707aab = getent("power_house_power_switch", "script_noteworthy");
    var_73707aab endon(#"death");
    s_info = undefined;
    s_info = var_73707aab waittill(#"trigger");
    e_player = s_info.activator;
    e_player thread zm_audio::create_and_play_dialog(#"powerplant", #"turn_on");
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0xf7e38b4, Offset: 0xfe0
// Size: 0x84
function function_350029c6() {
    self endon(#"death");
    s_info = undefined;
    s_info = self waittill(#"trigger");
    e_player = s_info.activator;
    e_player thread zm_audio::create_and_play_dialog(#"build_64", #"turn_on");
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x5 linked
// Checksum 0xb5a3295f, Offset: 0x1070
// Size: 0xa4
function private function_35491a0e() {
    s_catwalk_lava_exp = struct::get("s_catwalk_lava_exp");
    s_catwalk_lava_exp.var_ef66d35a = s_catwalk_lava_exp zm_unitrigger::create(&function_58813027, s_catwalk_lava_exp.radius, &function_f118f554, 0, 0);
    level flag::wait_till(#"hash_779398f97110e7b8");
    zm_unitrigger::unregister_unitrigger(s_catwalk_lava_exp.var_ef66d35a);
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 1, eflags: 0x1 linked
// Checksum 0xd43d02a0, Offset: 0x1120
// Size: 0x2c
function function_58813027(e_player) {
    return !level flag::get(#"hash_779398f97110e7b8");
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0xef94ad28, Offset: 0x1158
// Size: 0xbc
function function_f118f554() {
    self endon(#"death");
    s_info = undefined;
    s_info = self waittill(#"trigger");
    e_player = s_info.activator;
    exploder::exploder("fxexplo_catwalk_lava_burst");
    level clientfield::set("" + #"hash_24deaa9795e06d41", 1);
    e_player thread function_5860fce9();
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x5 linked
// Checksum 0x86cba5b0, Offset: 0x1220
// Size: 0x144
function private function_5860fce9() {
    self endon(#"disconnect");
    wait(10);
    if (isalive(self)) {
        b_say = self zm_vo::function_a2bd5a0c(#"hash_227bd68a057f7198", 0, 1);
        if (b_say && isalive(self) && level.activeplayers.size > 1) {
            e_richtofen = paschal::function_b1203924();
            if (isdefined(e_richtofen) && self != e_richtofen && distancesquared(self.origin, e_richtofen.origin) < 1000000) {
                e_richtofen zm_vo::function_a2bd5a0c(#"hash_227bd68a057f7198");
            }
        }
    }
    level flag::set(#"hash_779398f97110e7b8");
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x5 linked
// Checksum 0x137a37b0, Offset: 0x1370
// Size: 0x17c
function private function_49189399() {
    var_e5bf9843 = getent("t_reached_cellbock_vo", "targetname");
    var_e5bf9843 endon(#"death");
    while (1) {
        s_info = undefined;
        s_info = var_e5bf9843 waittill(#"trigger");
        e_player = s_info.activator;
        if (isplayer(e_player)) {
            break;
        }
    }
    if (level.players.size > 1) {
        e_player thread zm_audio::create_and_play_dialog(#"cell_block", #"react", undefined, 1);
    } else {
        e_richtofen = paschal::function_b1203924();
        if (isalive(e_richtofen)) {
            e_richtofen thread zm_audio::create_and_play_dialog(#"cell_block", #"react", undefined, 1);
        }
    }
    level flag::set(#"hash_732657441f7793dc");
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0xab7322db, Offset: 0x14f8
// Size: 0x13c
function function_22101968() {
    var_d756a0b4 = getent("t_infir_full_react", "targetname");
    var_d756a0b4 endon(#"death");
    while (1) {
        s_info = undefined;
        s_info = var_d756a0b4 waittill(#"trigger");
        e_player = s_info.activator;
        if (isplayer(e_player) && e_player flag::get(#"hash_30ae3926b2d211db")) {
            break;
        }
    }
    if (!level flag::get(#"hash_1a367a4a0dfb0471")) {
        e_player zm_audio::create_and_play_dialog(#"bathtub", #"react", undefined, 1);
        var_d756a0b4 delete();
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x5 linked
// Checksum 0x1aa64bf1, Offset: 0x1640
// Size: 0x54
function private function_3deb7fb0() {
    s_escape_plan_vo_react = struct::get("s_escape_plan_vo_react");
    s_escape_plan_vo_react zm_unitrigger::create(undefined, 64, &function_db185b3, 1);
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0x81c79c2f, Offset: 0x16a0
// Size: 0x90
function function_db185b3() {
    self endon(#"death");
    while (1) {
        s_info = undefined;
        s_info = self waittill(#"trigger");
        e_player = s_info.activator;
        e_player thread zm_audio::create_and_play_dialog(#"escape_plan", #"react");
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x5 linked
// Checksum 0x4bf17b94, Offset: 0x1738
// Size: 0x14e
function private function_a78a3261() {
    for (var_12d0accd = 0; var_12d0accd < 3; var_12d0accd++) {
        while (1) {
            level waittill(#"gondola_moving");
            var_be632f74 = 1;
            foreach (player in getplayers()) {
                if (player zm_escape_travel::function_9a8ab327()) {
                    var_be632f74 = 0;
                    break;
                }
            }
            if (var_be632f74 == 0) {
                continue;
            }
            break;
        }
        if (isdefined(level.var_105462b6)) {
            level.var_105462b6 thread zm_audio::create_and_play_dialog(#"gondola", #"call");
        }
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0xdd425265, Offset: 0x1890
// Size: 0xe4
function function_818b85eb() {
    self endon(#"death", #"disconnect");
    wait(1);
    if (!isdefined(self)) {
        return;
    }
    if (!self flag::get(#"hash_1308e79a11093c1e")) {
        self flag::set(#"hash_1308e79a11093c1e");
        self thread zm_audio::create_and_play_dialog(#"hellhole", #"enter_first");
        return;
    }
    self thread zm_audio::create_and_play_dialog(#"hellhole", #"enter");
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x1 linked
// Checksum 0x748e0074, Offset: 0x1980
// Size: 0xfc
function function_c179111e() {
    level endon(#"hash_dd62a8822ea4a38", #"end_game");
    level waittill(#"hash_231c2abba527e2e4");
    a_e_players = zm_zonemgr::get_players_in_zone("zone_citadel_stairs", 1);
    if (isarray(a_e_players) && a_e_players.size > 0) {
        e_player = array::random(a_e_players);
        if (isalive(e_player)) {
            e_player thread zm_audio::create_and_play_dialog(#"elev_crash", #"react");
        }
    }
}

// Namespace zm_escape_vo_hooks/zm_escape_vo_hooks
// Params 0, eflags: 0x0
// Checksum 0x170ba816, Offset: 0x1a88
// Size: 0x2a
function function_d62aaf66() {
    e_player = array::random(level.activeplayers);
    return e_player;
}


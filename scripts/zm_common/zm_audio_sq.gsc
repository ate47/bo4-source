#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_sq;

#namespace zm_audio_sq;

// Namespace zm_audio_sq/zm_audio_sq
// Params 0, eflags: 0x0
// Checksum 0xe3c30ea8, Offset: 0xd8
// Size: 0xb4
function init() {
    clientfield::register("scriptmover", "medallion_fx", 1, 1, "int");
    zm_sq::register(#"music_sq", #"first_location", #"hash_3531cfab5aa57f4b", &function_fe4dc0ff, &function_3f739fed);
    zm_sq::start(#"music_sq");
}

// Namespace zm_audio_sq/zm_audio_sq
// Params 1, eflags: 0x4
// Checksum 0x10ab5fda, Offset: 0x198
// Size: 0x74
function private function_fe4dc0ff(var_a276c861) {
    level endon(#"end_game");
    if (!isdefined(level.var_c5c448d)) {
        level.var_c5c448d = 0;
    }
    level.var_c5c448d++;
    if (!var_a276c861) {
        function_9e3ff948();
        function_9310fe45();
    }
}

// Namespace zm_audio_sq/zm_audio_sq
// Params 2, eflags: 0x4
// Checksum 0x765e92e7, Offset: 0x218
// Size: 0x34
function private function_3f739fed(var_a276c861, var_19e802fa) {
    if (!var_a276c861) {
        if (var_19e802fa) {
            music_sq_cleanup();
        }
    }
}

// Namespace zm_audio_sq/zm_audio_sq
// Params 0, eflags: 0x0
// Checksum 0x41d4b9d7, Offset: 0x258
// Size: 0x3c
function function_9310fe45() {
    level thread zm_audio::sndmusicsystem_stopandflush();
    waitframe(1);
    level thread zm_audio::sndmusicsystem_playstate("ee_song");
}

// Namespace zm_audio_sq/zm_audio_sq
// Params 0, eflags: 0x0
// Checksum 0xb22a1ac, Offset: 0x2a0
// Size: 0x128
function function_9e3ff948() {
    var_1a2e422e = 0;
    var_2361f0ab = struct::get_array(#"s_music_sq_location", "targetname");
    foreach (s_music_sq_location in var_2361f0ab) {
        if (isdefined(s_music_sq_location.script_int) && s_music_sq_location.script_int == level.var_c5c448d) {
            s_music_sq_location thread function_c0862b9e();
            util::wait_network_frame();
        }
    }
    while (true) {
        level waittill(#"hash_71162ec98b670d92");
        var_1a2e422e++;
        if (var_1a2e422e >= 4) {
            break;
        }
    }
}

// Namespace zm_audio_sq/zm_audio_sq
// Params 0, eflags: 0x0
// Checksum 0x5861525a, Offset: 0x3d0
// Size: 0x1be
function function_c0862b9e() {
    self.var_6522085c = util::spawn_model(self.model, self.origin, self.angles);
    self.var_6522085c setcandamage(1);
    self.var_6522085c.health = 1000000;
    if (isdefined(level.var_35d6e654)) {
        self thread [[ level.var_35d6e654 ]]();
    }
    while (true) {
        waitresult = self.var_6522085c waittill(#"damage");
        if (!isdefined(waitresult.attacker) || !isplayer(waitresult.attacker)) {
            continue;
        }
        if (isdefined(level.musicsystemoverride) && level.musicsystemoverride) {
            continue;
        }
        waitresult.attacker playsoundtoplayer(#"hash_3ffdc84cf43cae2b", waitresult.attacker);
        level notify(#"hash_71162ec98b670d92");
        break;
    }
    self.var_6522085c clientfield::set("medallion_fx", 1);
    util::wait_network_frame();
    self.var_6522085c delete();
    self.var_6522085c = undefined;
}

// Namespace zm_audio_sq/zm_audio_sq
// Params 0, eflags: 0x0
// Checksum 0x17f9c667, Offset: 0x598
// Size: 0xd0
function music_sq_cleanup() {
    var_2361f0ab = struct::get_array(#"s_music_sq_location", "targetname");
    foreach (s_music_sq_location in var_2361f0ab) {
        if (isdefined(s_music_sq_location.var_6522085c)) {
            s_music_sq_location.var_6522085c delete();
            util::wait_network_frame();
        }
    }
}


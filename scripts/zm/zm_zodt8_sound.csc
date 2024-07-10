#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_zodt8_sound;

// Namespace zm_zodt8_sound/zm_zodt8_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x3de38d16, Offset: 0x118
// Size: 0x34
function main() {
    level thread startzmbspawnersoundloops();
    level thread function_9466dec0();
}

// Namespace zm_zodt8_sound/zm_zodt8_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x4cd73f6c, Offset: 0x158
// Size: 0x15c
function startzmbspawnersoundloops() {
    loopers = struct::get_array("spawn_location", "script_noteworthy");
    if (isdefined(loopers) && loopers.size > 0) {
        delay = 0;
        /#
            if (getdvarint(#"debug_audio", 0) > 0) {
                println("<dev string:x38>" + loopers.size + "<dev string:x72>");
            }
        #/
        for (i = 0; i < loopers.size; i++) {
            loopers[i] thread soundloopthink();
            delay += 1;
            if (delay % 20 == 0) {
                waitframe(1);
            }
        }
        return;
    }
    /#
        if (getdvarint(#"debug_audio", 0) > 0) {
            println("<dev string:x7f>");
        }
    #/
}

// Namespace zm_zodt8_sound/zm_zodt8_sound
// Params 0, eflags: 0x1 linked
// Checksum 0xa348c19, Offset: 0x2c0
// Size: 0x18a
function soundloopthink() {
    if (!isdefined(self.origin)) {
        return;
    }
    if (!isdefined(self.script_sound)) {
        self.script_sound = "zmb_spawn_walla";
    }
    notifyname = "";
    assert(isdefined(notifyname));
    if (isdefined(self.script_string)) {
        notifyname = self.script_string;
    }
    assert(isdefined(notifyname));
    started = 1;
    if (isdefined(self.script_int)) {
        started = self.script_int != 0;
    }
    if (started) {
        soundloopemitter(self.script_sound, self.origin + (0, 0, 60));
    }
    if (notifyname != "") {
        for (;;) {
            level waittill(notifyname);
            if (started) {
                soundstoploopemitter(self.script_sound, self.origin + (0, 0, 60));
            } else {
                soundloopemitter(self.script_sound, self.origin + (0, 0, 60));
            }
            started = !started;
        }
    }
}

// Namespace zm_zodt8_sound/zm_zodt8_sound
// Params 0, eflags: 0x0
// Checksum 0xf413fe2, Offset: 0x458
// Size: 0x34
function function_a6e35dcd() {
    wait(3);
    audio::playloopat("amb_iceberg_cracking_loop", (-863, 5324, 1451));
}

// Namespace zm_zodt8_sound/zm_zodt8_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x20b9e932, Offset: 0x498
// Size: 0x266
function function_9466dec0() {
    var_7a522422 = struct::get_array("sndWoodRattles", "targetname");
    var_c5cacee = struct::get_array("sndPipeRattles", "targetname");
    var_61bc8796 = struct::get_array("sndWoodStress", "targetname");
    level waittill(#"hash_1fc99aa6e862afbd");
    playsound(0, #"hash_36a95d08ed4998f6", (20, -5248, 1196));
    foreach (rattle in var_7a522422) {
        playsound(0, #"hash_565a94625021a254", rattle.origin);
        waitframe(1);
    }
    foreach (rattle in var_c5cacee) {
        playsound(0, #"hash_2dbe3a174b1c934c", rattle.origin);
        waitframe(1);
    }
    foreach (rattle in var_61bc8796) {
        playsound(0, #"hash_3d14ed72726a475a", rattle.origin);
        waitframe(1);
    }
}


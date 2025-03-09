#using scripts\core_common\audio_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;

#namespace zm_office_sound;

// Namespace zm_office_sound/zm_office_sound
// Params 0, eflags: 0x0
// Checksum 0x3a83571c, Offset: 0xc0
// Size: 0x34
function main() {
    level thread startzmbspawnersoundloops();
    level thread function_6e0048f1();
}

// Namespace zm_office_sound/zm_office_sound
// Params 0, eflags: 0x0
// Checksum 0xda192bd2, Offset: 0x100
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

// Namespace zm_office_sound/zm_office_sound
// Params 0, eflags: 0x0
// Checksum 0x5dfe1345, Offset: 0x268
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

// Namespace zm_office_sound/zm_office_sound
// Params 0, eflags: 0x0
// Checksum 0xe1be1901, Offset: 0x400
// Size: 0xe4
function function_6e0048f1() {
    wait 0.1;
    level waittill(#"poa");
    audio::playloopat(#"hash_441952a4718e4f31", (-720, 3949, -608));
    audio::playloopat(#"hash_441952a4718e4f31", (-729, 5238, -608));
    audio::playloopat(#"hash_441952a4718e4f31", (-1616, 5252, -562));
    audio::playloopat(#"hash_441952a4718e4f31", (-1602, 3860, -608));
}


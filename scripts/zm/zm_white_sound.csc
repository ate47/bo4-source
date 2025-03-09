#using scripts\core_common\audio_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;

#namespace zm_white_sound;

// Namespace zm_white_sound/zm_white_sound
// Params 0, eflags: 0x0
// Checksum 0xc1d03995, Offset: 0xc0
// Size: 0x1c
function main() {
    level thread startzmbspawnersoundloops();
}

// Namespace zm_white_sound/zm_white_sound
// Params 0, eflags: 0x0
// Checksum 0xb10cebb1, Offset: 0xe8
// Size: 0x174
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
            if (isdefined(loopers[i].script_sound)) {
                continue;
            }
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

// Namespace zm_white_sound/zm_white_sound
// Params 0, eflags: 0x0
// Checksum 0x286f7926, Offset: 0x268
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


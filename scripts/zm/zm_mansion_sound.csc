#using scripts\core_common\callbacks_shared;
#using scripts\core_common\audio_shared;
#using scripts\core_common\struct;

#namespace zm_mansion_sound;

// Namespace zm_mansion_sound/zm_mansion_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x9a54727d, Offset: 0xc0
// Size: 0x14
function main() {
    thread startzmbspawnersoundloops();
}

// Namespace zm_mansion_sound/zm_mansion_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x973614a4, Offset: 0xe0
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

// Namespace zm_mansion_sound/zm_mansion_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x2bd61ad5, Offset: 0x248
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


// Atian COD Tools GSC decompiler test
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/audio_shared.csc;
#include scripts/core_common/struct.csc;

#namespace zm_orange_sound;

// Namespace zm_orange_sound/zm_orange_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x10a2a725, Offset: 0xc0
// Size: 0x1c
function main() {
    level thread startzmbspawnersoundloops();
}

// Namespace zm_orange_sound/zm_orange_sound
// Params 0, eflags: 0x1 linked
// Checksum 0xb23241fb, Offset: 0xe8
// Size: 0x174
function startzmbspawnersoundloops() {
    loopers = struct::get_array("spawn_location", "script_noteworthy");
    if (isdefined(loopers) && loopers.size > 0) {
        delay = 0;
        /#
            if (getdvarint(#"debug_audio", 0) > 0) {
                println("<unknown string>" + loopers.size + "<unknown string>");
            }
        #/
        for (i = 0; i < loopers.size; i++) {
            if (isdefined(loopers[i].script_sound)) {
                continue;
            }
            loopers[i] thread soundloopthink();
            delay = delay + 1;
            if (delay % 20 == 0) {
                waitframe(1);
            }
        }
    } else {
        /#
            if (getdvarint(#"debug_audio", 0) > 0) {
                println("<unknown string>");
            }
        #/
    }
}

// Namespace zm_orange_sound/zm_orange_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x6822661e, Offset: 0x268
// Size: 0x18a
function soundloopthink() {
    if (!isdefined(self.origin)) {
        return;
    }
    if (!isdefined(self.script_sound)) {
        self.script_sound = "zmb_spawn_walla";
    }
    notifyname = "";
    /#
        assert(isdefined(notifyname));
    #/
    if (isdefined(self.script_string)) {
        notifyname = self.script_string;
    }
    /#
        assert(isdefined(notifyname));
    #/
    started = 1;
    if (isdefined(self.script_int)) {
        started = self.script_int != 0;
    }
    if (started) {
        soundloopemitter(self.script_sound, self.origin + vectorscale((0, 0, 1), 60));
    }
    if (notifyname != "") {
        for (;;) {
            level waittill(notifyname);
            if (started) {
                soundstoploopemitter(self.script_sound, self.origin + vectorscale((0, 0, 1), 60));
            } else {
                soundloopemitter(self.script_sound, self.origin + vectorscale((0, 0, 1), 60));
            }
            started = !started;
        }
    }
}


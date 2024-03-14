// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_office_sound;

// Namespace zm_office_sound/zm_office_sound
// Params 0, eflags: 0x1 linked
// Checksum 0xb5d78733, Offset: 0xe0
// Size: 0x34
function main() {
    level thread function_b72b5f36();
    level thread function_7624a4cd();
}

// Namespace zm_office_sound/zm_office_sound
// Params 0, eflags: 0x1 linked
// Checksum 0xd52ea851, Offset: 0x120
// Size: 0x64
function function_7624a4cd() {
    a_structs = struct::get_array("snd_morse_code", "targetname");
    array::thread_all(a_structs, &function_f71796ca);
    level thread function_bc327ddf();
}

// Namespace zm_office_sound/zm_office_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x5e07d4cb, Offset: 0x190
// Size: 0x15a
function function_f71796ca() {
    level endon(#"hash_2bfc849b35affc0c", #"end_game");
    self thread function_e856acd2();
    str_alias = #"hash_716d417cfe416a4d" + self.script_int;
    n_wait = float(soundgetplaybacktime(str_alias)) / 1000;
    if (!isdefined(n_wait)) {
        n_wait = 1;
    }
    if (n_wait <= 0) {
        n_wait = 1;
    }
    self zm_unitrigger::create(undefined, 40);
    while (true) {
        s_notify = undefined;
        s_notify = self waittill(#"trigger_activated");
        playsoundatposition(str_alias, self.origin);
        level notify(#"hash_66f9802695ce6503", {#var_6831e121:self.script_int});
        wait(n_wait);
    }
}

// Namespace zm_office_sound/zm_office_sound
// Params 0, eflags: 0x1 linked
// Checksum 0xc66ca105, Offset: 0x2f8
// Size: 0x78
function function_e856acd2() {
    level endon(#"hash_2bfc849b35affc0c", #"end_game");
    while (true) {
        wait(randomintrange(20, 60));
        playsoundatposition(#"hash_2c5321deab41da10", self.origin);
    }
}

// Namespace zm_office_sound/zm_office_sound
// Params 0, eflags: 0x1 linked
// Checksum 0xf612772b, Offset: 0x378
// Size: 0x1ee
function function_bc327ddf() {
    level endon(#"end_game");
    var_f0f25516 = array(1, 2, 3, 4, 5);
    for (var_5ffc6bcc = 0; true; var_5ffc6bcc = 0) {
        s_result = undefined;
        s_result = level waittill(#"hash_66f9802695ce6503");
        if (s_result.var_6831e121 === var_f0f25516[var_5ffc6bcc]) {
            if (var_5ffc6bcc >= 4) {
                level notify(#"hash_2bfc849b35affc0c");
                waitframe(1);
                a_structs = struct::get_array("snd_morse_code", "targetname");
                foreach (struct in a_structs) {
                    zm_unitrigger::unregister_unitrigger(struct.s_unitrigger);
                }
                wait(5);
                level thread zm_audio::sndmusicsystem_stopandflush();
                waitframe(1);
                level thread zm_audio::sndmusicsystem_playstate("ee_song_2");
                return;
            } else {
                var_5ffc6bcc++;
            }
            continue;
        }
        if (s_result.var_6831e121 == 1) {
            var_5ffc6bcc = 1;
            continue;
        }
    }
}

// Namespace zm_office_sound/zm_office_sound
// Params 0, eflags: 0x1 linked
// Checksum 0xcdc8d5bb, Offset: 0x570
// Size: 0x4c
function function_b72b5f36() {
    a_structs = struct::get_array("mus_ee", "targetname");
    array::thread_all(a_structs, &function_43e2a503);
}

// Namespace zm_office_sound/zm_office_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x5072b0c6, Offset: 0x5c8
// Size: 0x154
function function_43e2a503() {
    if (zm_utility::is_standard() || zm_utility::is_trials()) {
        return;
    }
    var_26d86758 = spawn("script_origin", self.origin);
    var_26d86758 playloopsound(#"hash_368d31ed538206b0");
    e_activator = self zm_unitrigger::function_fac87205(undefined, 40);
    if (!isdefined(level.var_ec4c747a)) {
        level.var_ec4c747a = 0;
    }
    playsoundatposition(#"hash_58a7d90061e86ced", self.origin);
    var_26d86758 delete();
    level.var_ec4c747a++;
    if (level.var_ec4c747a >= 3) {
        level thread zm_audio::sndmusicsystem_stopandflush();
        waitframe(1);
        level thread zm_audio::sndmusicsystem_playstate("ee_song");
    }
}


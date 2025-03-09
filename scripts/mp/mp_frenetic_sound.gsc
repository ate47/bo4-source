#namespace mp_frenetic_sound;

// Namespace mp_frenetic_sound/mp_frenetic_sound
// Params 0, eflags: 0x0
// Checksum 0xad6f04db, Offset: 0x68
// Size: 0x34
function main() {
    level thread snd_alarms();
    level thread function_2878f9d1();
}

// Namespace mp_frenetic_sound/mp_frenetic_sound
// Params 0, eflags: 0x0
// Checksum 0x5b1c5aeb, Offset: 0xa8
// Size: 0xa8
function snd_alarms() {
    while (true) {
        wait 300;
        playsoundatposition(#"hash_4eb7a29f1b1a264", (905, 50, 1091));
        playsoundatposition(#"hash_44f8b894cb0ec41e", (1053, 975, 304));
        playsoundatposition(#"hash_44f8b794cb0ec26b", (1218, -1599, 270));
    }
}

// Namespace mp_frenetic_sound/mp_frenetic_sound
// Params 0, eflags: 0x0
// Checksum 0xf6fc2ed3, Offset: 0x158
// Size: 0x58
function function_2878f9d1() {
    while (true) {
        level waittill(#"snd_solar_alarm");
        playsoundatposition(#"hash_119425eb77c9699a", (905, 50, 1091));
    }
}


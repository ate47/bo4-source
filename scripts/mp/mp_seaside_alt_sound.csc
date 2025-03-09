#namespace mp_seaside_alt_sound;

// Namespace mp_seaside_alt_sound/mp_seaside_alt_sound
// Params 0, eflags: 0x0
// Checksum 0x947aff1d, Offset: 0x68
// Size: 0x14
function main() {
    thread church_bells();
}

// Namespace mp_seaside_alt_sound/mp_seaside_alt_sound
// Params 0, eflags: 0x0
// Checksum 0x84cb1318, Offset: 0x88
// Size: 0x48
function church_bells() {
    while (true) {
        wait 300;
        playsound(0, #"hash_5727281a9dcec94e", (-587, 2988, 1901));
    }
}


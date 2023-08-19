// Atian COD Tools GSC decompiler test
#namespace mp_silo_sound;

// Namespace mp_silo_sound/mp_silo_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x44c5a69b, Offset: 0x68
// Size: 0x34
function main() {
    level thread function_10156cf8();
    level thread function_448f6f5d();
}

// Namespace mp_silo_sound/mp_silo_sound
// Params 0, eflags: 0x1 linked
// Checksum 0x62576f82, Offset: 0xa8
// Size: 0x58
function function_10156cf8() {
    while (1) {
        level waittill(#"hash_388057c56b2acf4c");
        playsoundatposition(#"hash_3eeefdf762713cfa", (-7169, -4858, 547));
    }
}

// Namespace mp_silo_sound/mp_silo_sound
// Params 0, eflags: 0x1 linked
// Checksum 0xbcb46dab, Offset: 0x108
// Size: 0x88
function function_448f6f5d() {
    while (1) {
        level waittill(#"hash_771bf8874446d6f6");
        playsoundatposition(#"hash_3ca0f0298d34aa6a", (-5364, -10363, 608));
        playsoundatposition(#"hash_3ca0f0298d34aa6a", (-7397, 8858, 1244));
    }
}


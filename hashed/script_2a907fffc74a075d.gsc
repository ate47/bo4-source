// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_zodt8_sound.csc;
#include scripts/zm/zm_zodt8_gamemodes.csc;
#include scripts/zm_common/zm_characters.csc;
#include scripts/zm_common/zm_weapons.csc;
#include scripts/zm_common/zm_utility.csc;
#include scripts/zm_common/zm_pack_a_punch.csc;
#include scripts/zm_common/zm_fasttravel.csc;
#include scripts/zm_common/zm_audio_sq.csc;
#include scripts/zm_common/zm.csc;
#include scripts/zm_common/load.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/flag_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/callbacks_shared.csc;
#include scripts/core_common/audio_shared.csc;

#namespace namespace_57873b62;

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x40155fe7, Offset: 0x128
// Size: 0x2c
function init() {
    init_clientfields();
    level thread init_decals();
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x88035008, Offset: 0x160
// Size: 0xb0
function init_decals() {
    wait(0.1);
    if (!zm_utility::is_ee_enabled()) {
        var_c85b91c4 = findvolumedecalindexarray("freerangeanimalcrackers");
        foreach (n_index in var_c85b91c4) {
            hidevolumedecal(n_index);
        }
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x5af1d5ba, Offset: 0x218
// Size: 0x5c
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"morse_star", 1, 1, "int", &function_3653f153, 0, 0);
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 7, eflags: 0x1 linked
// Checksum 0xfc4f40d9, Offset: 0x280
// Size: 0xcd8
function function_3653f153(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self util::waittill_dobj(localclientnum);
        while (1) {
            wait(10);
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_ca7f5c75();
            function_5200214e(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_ca7f5c75();
            function_5200214e(localclientnum);
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
            function_ca7f5c75();
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_ca7f5c75();
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_ca7f5c75();
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_ca7f5c75();
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_ca7f5c75();
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_ca7f5c75();
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_ca7f5c75();
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_ca7f5c75();
            function_5200214e(localclientnum);
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_5200214e(localclientnum);
            function_bbf9723b();
            function_d11e8e8d(localclientnum);
            function_d11e8e8d(localclientnum);
            function_5200214e(localclientnum);
        }
    }
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 1, eflags: 0x1 linked
// Checksum 0x390d1f3d, Offset: 0xf60
// Size: 0x74
function function_d11e8e8d(localclientnum) {
    var_a4f5395a = util::playfxontag(localclientnum, #"hash_431dfa76576eb899", self, "tag_origin");
    wait(0.25);
    if (isdefined(var_a4f5395a)) {
        killfx(localclientnum, var_a4f5395a);
    }
    wait(0.25);
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 1, eflags: 0x1 linked
// Checksum 0x157dc659, Offset: 0xfe0
// Size: 0x74
function function_5200214e(localclientnum) {
    var_a4f5395a = util::playfxontag(localclientnum, #"hash_431dfa76576eb899", self, "tag_origin");
    wait(0.75);
    if (isdefined(var_a4f5395a)) {
        killfx(localclientnum, var_a4f5395a);
    }
    wait(0.25);
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0xad93b051, Offset: 0x1060
// Size: 0xc
function function_bbf9723b() {
    wait(0.5);
}

// Namespace namespace_57873b62/namespace_8125d942
// Params 0, eflags: 0x1 linked
// Checksum 0x4f863f83, Offset: 0x1078
// Size: 0xc
function function_ca7f5c75() {
    wait(1.5);
}


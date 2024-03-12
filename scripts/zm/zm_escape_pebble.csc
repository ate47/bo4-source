// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_escape_pebble;

// Namespace zm_escape_pebble/zm_escape_pebble
// Params 0, eflags: 0x2
// Checksum 0x8e251982, Offset: 0x120
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_escape_pebble", &__init__, undefined, undefined);
}

// Namespace zm_escape_pebble/zm_escape_pebble
// Params 0, eflags: 0x1 linked
// Checksum 0x53a431dd, Offset: 0x168
// Size: 0x35a
function __init__() {
    clientfield::register("actor", "" + #"hash_7792af358100c735", 1, 1, "int", &function_33f1dd99, 0, 0);
    clientfield::register("toplayer", "" + #"hash_f2d0b920043dbbd", 1, 1, "counter", &function_87d68f99, 0, 0);
    clientfield::register("world", "" + #"attic_room", 1, 1, "int", &attic_room, 0, 0);
    clientfield::register("world", "" + #"narrative_room", 1, 1, "int", &narrative_room, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_46dbc12bdc275121", 1, 1, "int", &glyph_fx, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_59623b8b4fc694c8", 1, 2, "int", &function_db9b47b5, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_ce418c45d804842", 1, 1, "counter", &function_2f00e842, 0, 0);
    level._effect[#"hash_7184fc7d78dcf1c0"] = #"hash_73000f9a6abd5658";
    level._effect[#"hash_20080a107a8533e"] = #"hash_7965ec9e0938553f";
    level._effect[#"walnut_teleport"] = #"hash_2844b7026fd0f451";
    level._effect[#"hash_7792af358100c735"] = #"hash_3d18884453d39646";
    level._effect[#"light_red"] = #"hash_6fdf0d26a4ab7a7";
}

// Namespace zm_escape_pebble/zm_escape_pebble
// Params 7, eflags: 0x1 linked
// Checksum 0x988b7df9, Offset: 0x4d0
// Size: 0x84
function function_87d68f99(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self thread postfx::playpostfxbundle(#"hash_114ea20734e794cf");
    playsound(localclientnum, #"hash_307805bbe1d946b", (0, 0, 0));
}

// Namespace zm_escape_pebble/zm_escape_pebble
// Params 7, eflags: 0x1 linked
// Checksum 0x35a2e68a, Offset: 0x560
// Size: 0x74
function function_33f1dd99(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_7792af358100c735"], self, "j_spine_4");
}

// Namespace zm_escape_pebble/zm_escape_pebble
// Params 7, eflags: 0x1 linked
// Checksum 0x8ebc1be4, Offset: 0x5e0
// Size: 0x84
function narrative_room(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        function_a5777754(localclientnum, "broom_closet");
        return;
    }
    function_73b1f242(localclientnum, "broom_closet");
}

// Namespace zm_escape_pebble/zm_escape_pebble
// Params 7, eflags: 0x1 linked
// Checksum 0x645089df, Offset: 0x670
// Size: 0x84
function attic_room(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        function_a5777754(localclientnum, "back_room");
        return;
    }
    function_73b1f242(localclientnum, "back_room");
}

// Namespace zm_escape_pebble/zm_escape_pebble
// Params 7, eflags: 0x1 linked
// Checksum 0xdc56d60, Offset: 0x700
// Size: 0x74
function glyph_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_7184fc7d78dcf1c0"], self, "tag_origin");
}

// Namespace zm_escape_pebble/zm_escape_pebble
// Params 7, eflags: 0x1 linked
// Checksum 0x9bfd671f, Offset: 0x780
// Size: 0x1c6
function function_db9b47b5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        self.var_2d6d5baa = util::playfxontag(localclientnum, level._effect[#"light_red"], self, "tag_eye_rt");
        self.var_ab585fc = util::playfxontag(localclientnum, level._effect[#"light_red"], self, "tag_eye_lt");
        return;
    }
    if (newval == 2) {
        self.var_a25a09ff = util::playfxontag(localclientnum, level._effect[#"hash_20080a107a8533e"], self, "tag_origin");
        return;
    }
    if (isdefined(self.var_2d6d5baa)) {
        killfx(localclientnum, self.var_2d6d5baa);
        self.var_2d6d5baa = undefined;
    }
    if (isdefined(self.var_ab585fc)) {
        killfx(localclientnum, self.var_ab585fc);
        self.var_ab585fc = undefined;
    }
    if (isdefined(self.var_a25a09ff)) {
        stopfx(localclientnum, self.var_a25a09ff);
        self.var_a25a09ff = undefined;
    }
}

// Namespace zm_escape_pebble/zm_escape_pebble
// Params 7, eflags: 0x1 linked
// Checksum 0x19dbaa89, Offset: 0x950
// Size: 0x74
function function_2f00e842(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"walnut_teleport"], self, "tag_origin");
}


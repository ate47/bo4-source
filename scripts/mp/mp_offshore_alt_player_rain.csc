// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace mp_offshore_alt_player_rain;

// Namespace mp_offshore_alt_player_rain/mp_offshore_alt_player_rain
// Params 0, eflags: 0x2
// Checksum 0xc247a8b0, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_offshore_alt_player_rain", &__init__, undefined, undefined);
}

// Namespace mp_offshore_alt_player_rain/mp_offshore_alt_player_rain
// Params 0, eflags: 0x1 linked
// Checksum 0xb961a2a4, Offset: 0x118
// Size: 0x4c
function __init__() {
    clientfield::register("toplayer", "toggle_player_rain", 1, 1, "counter", &toggle_player_rain, 0, 0);
}

// Namespace mp_offshore_alt_player_rain/mp_offshore_alt_player_rain
// Params 7, eflags: 0x1 linked
// Checksum 0x40d4d99f, Offset: 0x170
// Size: 0xe4
function toggle_player_rain(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (self !== function_5c10bd79(localclientnum)) {
        return;
    }
    if (isdefined(self.var_8401c7bc) && self.var_8401c7bc) {
        self.var_8401c7bc = 0;
        self postfx::stoppostfxbundle("pstfx_sprite_rain_loop_offshore");
        return;
    }
    self.var_8401c7bc = 1;
    if (!self postfx::function_556665f2("pstfx_sprite_rain_loop_offshore")) {
        self postfx::playpostfxbundle("pstfx_sprite_rain_loop_offshore");
    }
}


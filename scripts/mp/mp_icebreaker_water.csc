#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace mp_icebreaker_water;

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 0, eflags: 0x2
// Checksum 0xf4018ac2, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_icebreaker_water", &__init__, undefined, undefined);
}

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 0, eflags: 0x1 linked
// Checksum 0x96523a35, Offset: 0x130
// Size: 0x6c
function __init__() {
    clientfield::register("toplayer", "toggle_player_freezing_water", 1, 1, "counter", &toggle_player_freezing_water, 0, 0);
    callback::on_spawned(&on_player_spawned);
}

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 1, eflags: 0x1 linked
// Checksum 0x3ee3c98a, Offset: 0x1a8
// Size: 0x7c
function on_player_spawned(localclientnum) {
    if (self === function_5c10bd79(localclientnum)) {
        self.var_b5c65495 = 0;
        self.var_f809ca21 = 0;
        if (self postfx::function_556665f2("pstfx_frost_loop_fullscreen")) {
            self postfx::stoppostfxbundle("pstfx_frost_loop_fullscreen");
        }
    }
}

// Namespace mp_icebreaker_water/mp_icebreaker_water
// Params 7, eflags: 0x1 linked
// Checksum 0x8da5f46f, Offset: 0x230
// Size: 0x2c6
function toggle_player_freezing_water(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isalive(self) || self !== function_5c10bd79(localclientnum)) {
        return;
    }
    if (isdefined(self.var_b5c65495) && self.var_b5c65495) {
        self.var_b5c65495 = 0;
        wait(1);
        while (isalive(self) && !(isdefined(self.var_b5c65495) && self.var_b5c65495) && isdefined(self.var_f809ca21) && self.var_f809ca21 > 0) {
            self.var_f809ca21 -= 0.2;
            if (self.var_f809ca21 < 0) {
                self.var_f809ca21 = 0;
            }
            self postfx::function_c8b5f318("pstfx_frost_loop_fullscreen", #"reveal threshold", self.var_f809ca21);
            wait(5 * 0.2);
        }
        if (isalive(self) && !self.var_b5c65495) {
            self postfx::stoppostfxbundle("pstfx_frost_loop_fullscreen");
        }
        return;
    }
    self.var_b5c65495 = 1;
    if (!self postfx::function_556665f2("pstfx_frost_loop_fullscreen")) {
        self postfx::playpostfxbundle("pstfx_frost_loop_fullscreen");
    }
    while (isalive(self) && isdefined(self.var_b5c65495) && self.var_b5c65495 && isdefined(self.var_f809ca21) && self.var_f809ca21 < 1) {
        self.var_f809ca21 += 0.1;
        if (self.var_f809ca21 > 1) {
            self.var_f809ca21 = 1;
        }
        self postfx::function_c8b5f318("pstfx_frost_loop_fullscreen", #"reveal threshold", self.var_f809ca21);
        wait(10 * 0.1);
    }
}


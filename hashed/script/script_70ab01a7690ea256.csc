#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_trial;

#namespace namespace_a6aea2c6;

// Namespace namespace_a6aea2c6/namespace_a6aea2c6
// Params 0, eflags: 0x2
// Checksum 0x318946e3, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_2c983afcd92a9970", &__init__, undefined, undefined);
}

// Namespace namespace_a6aea2c6/namespace_a6aea2c6
// Params 0, eflags: 0x1 linked
// Checksum 0xb4783cd8, Offset: 0x110
// Size: 0x15c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    clientfield::register("toplayer", "" + #"hash_b905d796914b710", 14000, 1, "int", &function_1e14a14e, 0, 0);
    clientfield::register("toplayer", "" + #"hash_1b9477ddcf30191f", 16000, 1, "int", &function_b5ea67f1, 0, 0);
    clientfield::register("toplayer", "" + #"hash_52347bec3f1339fd", 16000, 4, "int", &function_cc4c5d4b, 0, 0);
    zm_trial::register_challenge(#"hash_6c768f3c15d55377", &on_begin, &on_end);
}

// Namespace namespace_a6aea2c6/namespace_a6aea2c6
// Params 2, eflags: 0x5 linked
// Checksum 0xd4f01d93, Offset: 0x278
// Size: 0xb2
function private on_begin(localclientnum, a_params) {
    level.var_4ecf5754 = isdefined(a_params[0]) ? a_params[0] : #"silent_film";
    switch (level.var_4ecf5754) {
    case #"silent_film":
        break;
    case #"hash_5a202c5d6f53d672":
        break;
    case #"perk_drunk":
        level thread function_777d7ba2();
        break;
    }
}

// Namespace namespace_a6aea2c6/namespace_a6aea2c6
// Params 1, eflags: 0x5 linked
// Checksum 0x63219c4, Offset: 0x338
// Size: 0x5e
function private on_end(localclientnum) {
    switch (level.var_4ecf5754) {
    case #"silent_film":
        break;
    case #"hash_5a202c5d6f53d672":
        break;
    }
    level.var_4ecf5754 = undefined;
}

// Namespace namespace_a6aea2c6/namespace_a6aea2c6
// Params 0, eflags: 0x1 linked
// Checksum 0xd48e4947, Offset: 0x3a0
// Size: 0xb4
function function_777d7ba2() {
    self notify("7b33eb8d5a1768f6");
    self endon("7b33eb8d5a1768f6");
    setdvar(#"slide_blur_enabled", 0);
    while (true) {
        level waittill(#"end_game", #"hash_7646638df88a3656");
        if (level.var_a2859227 != 1) {
            setdvar(#"slide_blur_enabled", 1);
            break;
        }
    }
}

// Namespace namespace_a6aea2c6/namespace_a6aea2c6
// Params 1, eflags: 0x1 linked
// Checksum 0x93a5568d, Offset: 0x460
// Size: 0x72
function is_active(var_4ecf5754 = #"silent_film") {
    s_challenge = zm_trial::function_a36e8c38(#"hash_6c768f3c15d55377");
    if (isdefined(s_challenge) && level.var_4ecf5754 === var_4ecf5754) {
        return true;
    }
    return false;
}

// Namespace namespace_a6aea2c6/namespace_a6aea2c6
// Params 7, eflags: 0x5 linked
// Checksum 0x914532cd, Offset: 0x4e0
// Size: 0x8c
function private function_1e14a14e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self postfx::playpostfxbundle(#"hash_2caf3cb56ac5fd8f");
        return;
    }
    self postfx::stoppostfxbundle(#"hash_2caf3cb56ac5fd8f");
}

// Namespace namespace_a6aea2c6/namespace_a6aea2c6
// Params 7, eflags: 0x1 linked
// Checksum 0x183f9c85, Offset: 0x578
// Size: 0x114
function function_b5ea67f1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval) {
        if (self util::function_50ed1561(localclientnum)) {
            self thread function_9cf0edbf(localclientnum, 0);
            self playsound(localclientnum, #"hash_2b366662bb232751");
        }
        return;
    }
    if (self util::function_50ed1561(localclientnum)) {
        self thread function_9cf0edbf(localclientnum, 1);
        self playsound(localclientnum, #"hash_499fa328163cfa80");
    }
}

// Namespace namespace_a6aea2c6/namespace_a6aea2c6
// Params 2, eflags: 0x1 linked
// Checksum 0x2facf0fb, Offset: 0x698
// Size: 0x1b2
function function_9cf0edbf(localclientnum, b_show) {
    self notify(#"hash_3dec19d02cb07e9b");
    self endon(#"hash_3dec19d02cb07e9b", #"death");
    level endon(#"hash_7646638df88a3656");
    while (true) {
        a_ai = getentarraybytype(localclientnum, 15);
        a_vh = getentarraybytype(localclientnum, 12);
        a_ai = arraycombine(a_ai, a_vh, 0, 0);
        foreach (ai in a_ai) {
            if (ai.team == #"axis") {
                if (b_show && !(isdefined(ai.var_d8b9c4bf) && ai.var_d8b9c4bf)) {
                    ai show();
                    continue;
                }
                ai hide();
            }
        }
        waitframe(1);
    }
}

// Namespace namespace_a6aea2c6/namespace_a6aea2c6
// Params 7, eflags: 0x1 linked
// Checksum 0xdfed682e, Offset: 0x858
// Size: 0x1e6
function function_cc4c5d4b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        var_f18c8464 = math::clamp(newval, 1, 7);
        n_blur_amount = var_f18c8464 / 16;
        n_inner_radius = var_f18c8464 / 16;
        n_outer_radius = 1 - var_f18c8464 / 16;
        enablespeedblur(localclientnum, n_blur_amount, n_inner_radius, n_outer_radius);
        self setblur(var_f18c8464 * 2, 1);
        if (!isdefined(self.var_7c82d805)) {
            self playsound(localclientnum, #"hash_1fa4be2474b0c451");
            self.var_7c82d805 = self playloopsound(#"hash_509328253e0c2b81");
        }
        return;
    }
    disablespeedblur(localclientnum);
    self setblur(0, 0);
    if (isdefined(self.var_7c82d805)) {
        self playsound(localclientnum, #"hash_4b8d428c3bccb4d4");
        self stoploopsound(self.var_7c82d805);
        self.var_7c82d805 = undefined;
    }
}


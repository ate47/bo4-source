#using script_cb847e6c2204e74;
#using script_6409d04aa560106c;
#using script_3b8f43c68572f06;
#using script_70ab01a7690ea256;
#using scripts\zm_common\zm_hero_weapon.csc;
#using scripts\zm_common\util.csc;
#using scripts\zm_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_laststand;

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2
// Checksum 0x736c82c1, Offset: 0x250
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_laststand", &__init__, undefined, undefined);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0x40d9fb9a, Offset: 0x298
// Size: 0x214
function __init__() {
    revive_hud::register("revive_hud");
    level.laststands = [];
    level.var_ff482f76 = zm_laststand_client::register("zm_laststand_client");
    level.var_1c957023 = self_revive_visuals::register("self_revive_visuals");
    level.var_16af4504 = [];
    clientfield::register("clientuimodel", "ZMInventoryPersonal.self_revive_count", 1, 7, "int", undefined, 0, 0);
    clientfield::register("allplayers", "zm_last_stand_postfx", 1, 1, "int", &function_50d4c00a, 0, 1);
    for (i = 0; i < 4; i++) {
        level.laststands[i] = spawnstruct();
        level.laststands[i].laststand_update_clientfields = "laststand_update" + i;
        clientfield::register("world", level.laststands[i].laststand_update_clientfields, 1, 5, "float", &update_bleedout_timer, 0, 0);
        clientfield::register("clientuimodel", "WorldSpaceIndicators.bleedOutModel" + i + ".hide", 1, 1, "int", undefined, 0, 0);
    }
    level thread wait_and_set_revive_shader_constant();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x1 linked
// Checksum 0xd8bddb93, Offset: 0x4b8
// Size: 0xd6
function wait_and_set_revive_shader_constant() {
    while (true) {
        waitresult = level waittillmatch({#notetrack:"revive_shader_constant"}, #"notetrack");
        player = function_5c10bd79(waitresult.localclientnum);
        player mapshaderconstant(waitresult.localclientnum, 0, "scriptVector2", 0, 1, 0, getservertime(waitresult.localclientnum) / 1000);
        waitframe(1);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 7, eflags: 0x1 linked
// Checksum 0x715b3fe5, Offset: 0x598
// Size: 0xe4
function update_bleedout_timer(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    substr = getsubstr(fieldname, 16);
    playernum = int(substr);
    model = getuimodel(getuimodelforcontroller(localclientnum), "WorldSpaceIndicators.bleedOutModel" + playernum + ".bleedOutPercent");
    if (isdefined(model)) {
        setuimodelvalue(model, newval);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 7, eflags: 0x1 linked
// Checksum 0x30f9e5b2, Offset: 0x688
// Size: 0x170
function function_50d4c00a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(level.var_629da31e)) {
        return;
    }
    if (newval) {
        var_32c41440 = self getentitynumber();
        if (!isdefined(level.var_16af4504[var_32c41440])) {
            level.var_16af4504[var_32c41440] = getservertime(localclientnum);
        }
        if (self == function_5c10bd79(localclientnum)) {
            var_d2c301e0 = level.var_16af4504[var_32c41440];
            self thread function_be34e28f(localclientnum, var_d2c301e0);
        }
        return;
    }
    if (self == function_5c10bd79(localclientnum)) {
        self notify(#"hash_2f1dc2ea83ba9e2");
        self postfx::exitpostfxbundle("pstfx_zm_last_stand");
    }
    level.var_16af4504[self getentitynumber()] = undefined;
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x1 linked
// Checksum 0xdc99d92d, Offset: 0x800
// Size: 0x266
function function_be34e28f(localclientnum, var_d2c301e0) {
    self endoncallback(&function_ac994c83, #"death", #"hash_2f1dc2ea83ba9e2");
    self postfx::playpostfxbundle("pstfx_zm_last_stand");
    var_6c2f58e2 = var_d2c301e0 + int(level.var_629da31e * 1000);
    if (util::function_cd6c95db(localclientnum) || namespace_a6aea2c6::is_active(#"silent_film")) {
        self postfx::function_c8b5f318("pstfx_zm_last_stand", "Desaturation", 1);
    } else {
        self postfx::function_c8b5f318("pstfx_zm_last_stand", "Enable Tint", 1);
        self postfx::function_c8b5f318("pstfx_zm_last_stand", "Tint Color R", 0.9);
        self postfx::function_c8b5f318("pstfx_zm_last_stand", "Tint Color G", 0.2);
    }
    while (true) {
        n_current_time = getservertime(localclientnum);
        if (n_current_time >= var_6c2f58e2) {
            self postfx::function_c8b5f318("pstfx_zm_last_stand", "Opacity", 0.25);
            return;
        }
        n_opacity = mapfloat(var_d2c301e0, var_6c2f58e2, 0, 0.25, n_current_time);
        self postfx::function_c8b5f318("pstfx_zm_last_stand", "Opacity", n_opacity);
        waitframe(1);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x1 linked
// Checksum 0x85ab02c, Offset: 0xa70
// Size: 0x44
function function_ac994c83(var_c34665fc) {
    if (var_c34665fc == "death" && isdefined(self)) {
        self postfx::exitpostfxbundle("pstfx_zm_last_stand");
    }
}


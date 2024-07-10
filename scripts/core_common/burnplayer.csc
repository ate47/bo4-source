#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace burnplayer;

// Namespace burnplayer/burnplayer
// Params 0, eflags: 0x2
// Checksum 0x7cc68c0f, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"burnplayer", &__init__, undefined, undefined);
}

// Namespace burnplayer/burnplayer
// Params 0, eflags: 0x1 linked
// Checksum 0xf161ddb7, Offset: 0x158
// Size: 0xe4
function __init__() {
    clientfield::register("allplayers", "burn", 1, 1, "int", &burning_callback, 0, 1);
    clientfield::register("playercorpse", "burned_effect", 1, 1, "int", &burning_corpse_callback, 0, 1);
    loadeffects();
    callback::on_localplayer_spawned(&on_localplayer_spawned);
    callback::on_localclient_connect(&on_local_client_connect);
}

// Namespace burnplayer/burnplayer
// Params 0, eflags: 0x1 linked
// Checksum 0x4bfb0ca4, Offset: 0x248
// Size: 0x12
function loadeffects() {
    level.burntags = [];
}

// Namespace burnplayer/burnplayer
// Params 1, eflags: 0x1 linked
// Checksum 0x7e073bbb, Offset: 0x268
// Size: 0xc
function on_local_client_connect(localclientnum) {
    
}

// Namespace burnplayer/burnplayer
// Params 1, eflags: 0x1 linked
// Checksum 0xd0d0ce5, Offset: 0x280
// Size: 0x6c
function on_localplayer_spawned(localclientnum) {
    if (self function_21c0fa55() && self clientfield::get("burn") == 0) {
        self postfx::stoppostfxbundle("pstfx_burn_loop");
    }
}

// Namespace burnplayer/burnplayer
// Params 7, eflags: 0x1 linked
// Checksum 0x5b1856f1, Offset: 0x2f8
// Size: 0xa4
function burning_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self function_a6cb96f(localclientnum);
        self function_adae7d84(localclientnum);
        return;
    }
    self function_8227cec3(localclientnum);
    self function_68a11df6(localclientnum);
}

// Namespace burnplayer/burnplayer
// Params 7, eflags: 0x1 linked
// Checksum 0x54bd2557, Offset: 0x3a8
// Size: 0x8c
function burning_corpse_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self set_corpse_burning(localclientnum);
        return;
    }
    self function_8227cec3(localclientnum);
    self function_68a11df6(localclientnum);
}

// Namespace burnplayer/burnplayer
// Params 1, eflags: 0x1 linked
// Checksum 0x1936403e, Offset: 0x440
// Size: 0x2c
function set_corpse_burning(localclientnum) {
    self thread _burnbody(localclientnum, 1);
}

// Namespace burnplayer/burnplayer
// Params 1, eflags: 0x1 linked
// Checksum 0x7d2e7a42, Offset: 0x478
// Size: 0x64
function function_8227cec3(localclientnum) {
    if (self function_21c0fa55()) {
        self postfx::stoppostfxbundle("pstfx_burn_loop");
        self playsound(0, #"hash_41520794c2fd8aa");
    }
}

// Namespace burnplayer/burnplayer
// Params 1, eflags: 0x1 linked
// Checksum 0x162a21e, Offset: 0x4e8
// Size: 0x1e
function function_68a11df6(localclientnum) {
    self notify(#"burn_off");
}

// Namespace burnplayer/burnplayer
// Params 1, eflags: 0x1 linked
// Checksum 0x301dce57, Offset: 0x510
// Size: 0x74
function function_a6cb96f(localclientnum) {
    if (self function_21c0fa55() && !isthirdperson(localclientnum) && !self isremotecontrolling(localclientnum)) {
        self thread burn_on_postfx();
    }
}

// Namespace burnplayer/burnplayer
// Params 1, eflags: 0x1 linked
// Checksum 0xb12ff0a8, Offset: 0x590
// Size: 0x54
function function_adae7d84(localclientnum) {
    if (!self function_21c0fa55() || isthirdperson(localclientnum)) {
        self thread _burnbody(localclientnum);
    }
}

// Namespace burnplayer/burnplayer
// Params 0, eflags: 0x1 linked
// Checksum 0xe45b3d6f, Offset: 0x5f0
// Size: 0x94
function burn_on_postfx() {
    self endon(#"burn_off");
    self endon(#"death");
    self notify(#"burn_on_postfx");
    self endon(#"burn_on_postfx");
    self playsound(0, #"hash_791f349cb716e078");
    self thread postfx::playpostfxbundle(#"pstfx_burn_loop");
}

// Namespace burnplayer/burnplayer
// Params 3, eflags: 0x5 linked
// Checksum 0xb01534f1, Offset: 0x690
// Size: 0x9c
function private _burntag(localclientnum, tag, postfix) {
    if (isdefined(self) && self hasdobj(localclientnum)) {
        fxname = "burn_" + tag + postfix;
        if (isdefined(level._effect[fxname])) {
            return util::playfxontag(localclientnum, level._effect[fxname], self, tag);
        }
    }
}

// Namespace burnplayer/burnplayer
// Params 3, eflags: 0x5 linked
// Checksum 0x7e246fda, Offset: 0x738
// Size: 0x1b4
function private _burntagson(localclientnum, tags, use_tagfxset) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    self endon(#"burn_off");
    self notify(#"burn_tags_on");
    self endon(#"burn_tags_on");
    if (use_tagfxset) {
        self util::waittill_dobj(localclientnum);
        activefx = playtagfxset(localclientnum, "weapon_hero_molotov_fire_3p", self);
    } else {
        activefx = [];
        for (i = 0; i < tags.size; i++) {
            activefx[activefx.size] = self _burntag(localclientnum, tags[i], "_loop");
        }
    }
    playsound(0, #"chr_ignite", self.origin);
    burnsound = self playloopsound(#"chr_burn_loop_overlay", 0.5);
    self thread _burntagswatchend(localclientnum, activefx, burnsound);
    self thread _burntagswatchclear(localclientnum, activefx, burnsound);
}

// Namespace burnplayer/burnplayer
// Params 2, eflags: 0x5 linked
// Checksum 0x65c83e85, Offset: 0x8f8
// Size: 0x5c
function private _burnbody(localclientnum, use_tagfxset = 0) {
    self endon(#"death");
    self thread _burntagson(localclientnum, level.burntags, use_tagfxset);
}

// Namespace burnplayer/burnplayer
// Params 3, eflags: 0x5 linked
// Checksum 0x41882148, Offset: 0x960
// Size: 0xf0
function private _burntagswatchend(localclientnum, fxarray, burnsound) {
    self waittill(#"burn_off", #"death");
    if (isdefined(self) && isdefined(burnsound)) {
        self stoploopsound(burnsound, 1);
    }
    if (isdefined(fxarray)) {
        foreach (fx in fxarray) {
            stopfx(localclientnum, fx);
        }
    }
}

// Namespace burnplayer/burnplayer
// Params 3, eflags: 0x5 linked
// Checksum 0x7ee5d735, Offset: 0xa58
// Size: 0xd8
function private _burntagswatchclear(localclientnum, fxarray, burnsound) {
    self endon(#"burn_off");
    self waittill(#"death");
    if (isdefined(burnsound)) {
        stopsound(burnsound);
    }
    if (isdefined(fxarray)) {
        foreach (fx in fxarray) {
            stopfx(localclientnum, fx);
        }
    }
}


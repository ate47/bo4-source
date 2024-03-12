// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\struct.csc;

#namespace acid_bomb;

// Namespace acid_bomb/acid_bomb
// Params 0, eflags: 0x2
// Checksum 0x5a0ae5bf, Offset: 0xb0
// Size: 0x34
function autoexec __init__system__() {
    system::register(#"acid_bomb", undefined, &__main__, undefined);
}

// Namespace acid_bomb/acid_bomb
// Params 0, eflags: 0x1 linked
// Checksum 0x8b417aab, Offset: 0xf0
// Size: 0x32
function __main__() {
    level._effect[#"grenade_light"] = #"weapon/fx8_equip_light_os";
}

// Namespace acid_bomb/acid_bomb
// Params 1, eflags: 0x1 linked
// Checksum 0xebfa2943, Offset: 0x130
// Size: 0x3c
function spawned(localclientnum) {
    if (self isgrenadedud()) {
        return;
    }
    self thread fx_think(localclientnum);
}

// Namespace acid_bomb/acid_bomb
// Params 1, eflags: 0x1 linked
// Checksum 0x296b27b4, Offset: 0x178
// Size: 0x142
function fx_think(localclientnum) {
    self notify(#"light_disable");
    self endon(#"death", #"light_disable");
    self util::waittill_dobj(localclientnum);
    var_18407835 = self.origin;
    for (interval = 0.3; ; interval = math::clamp(interval / 1.2, 0.08, 0.3)) {
        self stop_light_fx(localclientnum);
        self start_light_fx(localclientnum);
        self fullscreen_fx(localclientnum);
        playsound(localclientnum, #"hash_2bb4a8b02a0d697", var_18407835);
        util::server_wait(localclientnum, interval, 0.01, "player_switch");
    }
}

// Namespace acid_bomb/acid_bomb
// Params 1, eflags: 0x1 linked
// Checksum 0x562baca0, Offset: 0x2c8
// Size: 0x4a
function start_light_fx(localclientnum) {
    self.fx = util::playfxontag(localclientnum, level._effect[#"grenade_light"], self, "tag_fx");
}

// Namespace acid_bomb/acid_bomb
// Params 1, eflags: 0x1 linked
// Checksum 0x50844a07, Offset: 0x320
// Size: 0x4e
function stop_light_fx(localclientnum) {
    if (isdefined(self.fx) && self.fx != 0) {
        stopfx(localclientnum, self.fx);
        self.fx = undefined;
    }
}

// Namespace acid_bomb/acid_bomb
// Params 1, eflags: 0x1 linked
// Checksum 0xfecf4061, Offset: 0x378
// Size: 0xc4
function fullscreen_fx(localclientnum) {
    if (function_1cbf351b(localclientnum)) {
        return;
    } else if (util::is_player_view_linked_to_entity(localclientnum)) {
        return;
    }
    if (self function_83973173()) {
        return;
    }
    parent = self getparententity();
    if (isdefined(parent) && parent function_21c0fa55()) {
        parent playrumbleonentity(localclientnum, "buzz_high");
    }
}


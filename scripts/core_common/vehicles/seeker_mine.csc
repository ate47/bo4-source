// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace seeker_mine;

// Namespace seeker_mine/seeker_mine
// Params 0, eflags: 0x2
// Checksum 0x5e8d8198, Offset: 0x100
// Size: 0xbc
function autoexec main() {
    clientfield::register("vehicle", "seeker_mine_fx", 1, 1, "int", &fxhandler, 0, 0);
    clientfield::register("vehicle", "seeker_mine_light_fx", 1, 1, "int", &lightfxhandler, 0, 0);
    ai::add_archetype_spawn_function("seeker_mine", &spawned);
}

// Namespace seeker_mine/seeker_mine
// Params 1, eflags: 0x0
// Checksum 0xc435e582, Offset: 0x1c8
// Size: 0xac
function spawned(localclientnum) {
    localplayer = function_5c10bd79(localclientnum);
    if (self.team === localplayer.team) {
        setsoundcontext("team", "ally");
    } else {
        setsoundcontext("team", "enemy");
    }
    self thread update_light(localclientnum);
}

// Namespace seeker_mine/seeker_mine
// Params 1, eflags: 0x4
// Checksum 0x600d58fb, Offset: 0x280
// Size: 0xb8
function private update_light(localclientnum) {
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    while (1) {
        self.light_fx = util::playfxontag(localclientnum, #"hash_69272c24309abc33", self, "tag_fx_front");
        if (isdefined(self.attacking) && self.attacking) {
            wait(0.25);
        } else {
            wait(1);
        }
        stopfx(localclientnum, self.light_fx);
    }
}

// Namespace seeker_mine/seeker_mine
// Params 7, eflags: 0x4
// Checksum 0xd0c75bcf, Offset: 0x340
// Size: 0x84
function private fxhandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newvalue) {
        self thread play_seeker_mine_fx(localclientnum);
    } else {
        self function_5aa8d239(localclientnum, self.fxloop);
    }
}

// Namespace seeker_mine/seeker_mine
// Params 1, eflags: 0x0
// Checksum 0x7326d3a6, Offset: 0x3d0
// Size: 0xc4
function play_seeker_mine_fx(localclientnum) {
    self endon(#"death");
    playsound(0, #"hash_153d2d19a99f3a29", self.origin);
    sound = self playloopsound(#"hash_40039ac740a9f96e");
    self.fxloop = util::playfxontag(localclientnum, #"hash_180b04db9cd1ee12", self, "tag_body_animate");
    level thread function_cece47d2(localclientnum, self, self.fxloop);
}

// Namespace seeker_mine/seeker_mine
// Params 3, eflags: 0x0
// Checksum 0xfb1605d, Offset: 0x4a0
// Size: 0x54
function function_cece47d2(localclientnum, entity, fx) {
    entity waittill(#"death");
    level function_5aa8d239(localclientnum, fx);
}

// Namespace seeker_mine/seeker_mine
// Params 2, eflags: 0x0
// Checksum 0x30cf29e, Offset: 0x500
// Size: 0x34
function function_5aa8d239(localclientnum, fx) {
    if (isdefined(fx)) {
        stopfx(localclientnum, fx);
    }
}

// Namespace seeker_mine/seeker_mine
// Params 7, eflags: 0x4
// Checksum 0x39623459, Offset: 0x540
// Size: 0x62
function private lightfxhandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump) {
    if (newvalue) {
        self.attacking = 1;
    } else {
        self.attacking = 0;
    }
}


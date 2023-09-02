// Atian COD Tools GSC decompiler test
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\killstreaks\mp\killstreak_vehicle.csc;
#using scripts\mp_common\laststand.csc;
#using scripts\mp_common\dynamic_loadout.csc;

#namespace bounty;

// Namespace bounty/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x4b57d996, Offset: 0x128
// Size: 0x13c
function event_handler[gametype_init] main(eventstruct) {
    level.var_ea696257 = 1;
    level.var_fd6018ca = 1;
    clientfield::register("allplayers", "bountymoneytrail", 1, 1, "int", &function_44cacd61, 0, 1);
    clientfield::register("toplayer", "realtime_multiplay", 1, 1, "int", &function_a1b40aa4, 0, 1);
    bundle = struct::get_script_bundle("killstreak", "killstreak_cold");
    level.var_c80088b7 = bundle;
    killstreak_vehicle::init_killstreak(bundle);
    vehicle::add_vehicletype_callback(#"vehicle_t8_mil_helicopter_swat_transport", &spawned);
}

// Namespace bounty/bounty
// Params 7, eflags: 0x4
// Checksum 0x80bda9ef, Offset: 0x270
// Size: 0x74
function private function_44cacd61(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self function_cf7d552d(localclientnum);
    } else {
        self function_3a4e5f28();
    }
}

// Namespace bounty/bounty
// Params 1, eflags: 0x0
// Checksum 0xd14fa2bd, Offset: 0x2f0
// Size: 0x54
function function_cf7d552d(localclientnum) {
    if (!self function_21c0fa55() || isthirdperson(localclientnum)) {
        self thread function_f7842f51(localclientnum);
    }
}

// Namespace bounty/bounty
// Params 0, eflags: 0x0
// Checksum 0x85b854a0, Offset: 0x350
// Size: 0x16
function function_3a4e5f28() {
    self notify(#"hash_eca936d9bc271de");
}

// Namespace bounty/bounty
// Params 1, eflags: 0x4
// Checksum 0x407e47be, Offset: 0x370
// Size: 0x94
function private function_f7842f51(localclientnum) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    self endon(#"hash_eca936d9bc271de");
    self util::waittill_dobj(localclientnum);
    activefx = playtagfxset(localclientnum, "gametype_heist_money_trail", self);
    self thread function_bd48b229(localclientnum, activefx);
}

// Namespace bounty/bounty
// Params 2, eflags: 0x4
// Checksum 0xfc554124, Offset: 0x410
// Size: 0xb8
function private function_bd48b229(localclientnum, fxarray) {
    self waittill(#"hash_eca936d9bc271de", #"death");
    if (isdefined(fxarray)) {
        foreach (fx in fxarray) {
            stopfx(localclientnum, fx);
        }
    }
}

// Namespace bounty/bounty
// Params 7, eflags: 0x0
// Checksum 0xb4140ac4, Offset: 0x4d0
// Size: 0x74
function function_a1b40aa4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        function_9e9a0604(localclientnum);
    } else {
        function_3f258626(localclientnum);
    }
}

// Namespace bounty/bounty
// Params 2, eflags: 0x0
// Checksum 0x4e6f1a3c, Offset: 0x550
// Size: 0x4a
function spawned(localclientnum, killstreak_duration) {
    if (localclientnum === 0) {
        if (self.team === #"neutral") {
            self.var_22a05c26 = level.var_c80088b7;
        }
    }
}


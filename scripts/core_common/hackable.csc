// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\duplicaterender_mgr.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace hackable;

// Namespace hackable/hackable
// Params 0, eflags: 0x2
// Checksum 0xc09ce515, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hackable", &init, undefined, undefined);
}

// Namespace hackable/hackable
// Params 0, eflags: 0x0
// Checksum 0xcc5d58a8, Offset: 0x100
// Size: 0x24
function init() {
    callback::on_localclient_connect(&on_player_connect);
}

// Namespace hackable/hackable
// Params 1, eflags: 0x0
// Checksum 0xaad347e8, Offset: 0x130
// Size: 0x44
function on_player_connect(localclientnum) {
    duplicate_render::set_dr_filter_offscreen("hacking", 75, "being_hacked", undefined, 2, "mc/hud_keyline_orange", 1);
}

// Namespace hackable/hackable
// Params 2, eflags: 0x0
// Checksum 0x4c61d571, Offset: 0x180
// Size: 0x94
function set_hacked_ent(local_client_num, ent) {
    if (!(ent === self.hacked_ent)) {
        if (isdefined(self.hacked_ent)) {
            self.hacked_ent duplicate_render::change_dr_flags(local_client_num, undefined, "being_hacked");
        }
        self.hacked_ent = ent;
        if (isdefined(self.hacked_ent)) {
            self.hacked_ent duplicate_render::change_dr_flags(local_client_num, "being_hacked", undefined);
        }
    }
}


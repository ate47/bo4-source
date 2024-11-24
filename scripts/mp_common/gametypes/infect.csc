#using script_5978de81803f618a;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\renderoverridebundle;
#using scripts\core_common\struct;
#using scripts\mp_common\player\player;

#namespace infect;

// Namespace infect/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x94b6240b, Offset: 0xd8
// Size: 0x74
function event_handler[gametype_init] main(eventstruct) {
    level.infect_timer = mp_infect_timer::register("InfectTimer");
    clientfield::register("allplayers", "Infected.player_infected", 15000, 1, "int", &function_fd78da38, 0, 0);
}

// Namespace infect/infect
// Params 7, eflags: 0x0
// Checksum 0xc07f80a, Offset: 0x158
// Size: 0x1fc
function function_fd78da38(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (self getlocalclientnumber() === localclientnum) {
            foreach (player in getplayers(localclientnum)) {
                if (player.team !== self.team && !player function_21c0fa55()) {
                    if (player flag::exists(#"friendly")) {
                        player renderoverridebundle::stop_bundle(#"friendly", sessionmodeiscampaigngame() ? #"hash_1cbf6d26721c59a7" : #"hash_1c90592671f4c6e9", 0);
                    }
                }
            }
            return;
        }
        if (self flag::exists(#"friendly")) {
            self renderoverridebundle::stop_bundle(#"friendly", sessionmodeiscampaigngame() ? #"hash_1cbf6d26721c59a7" : #"hash_1c90592671f4c6e9", 0);
        }
    }
}

// Namespace infect/infect
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x360
// Size: 0x4
function onprecachegametype() {
    
}

// Namespace infect/infect
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x370
// Size: 0x4
function onstartgametype() {
    
}


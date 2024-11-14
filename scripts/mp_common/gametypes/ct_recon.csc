#using scripts\mp_common\gametypes\ct_ai_blight_father;
#using scripts\mp_common\gametypes\ct_ai_zombie;
#using script_4293197b43dc9fef;
#using script_6d7c7d238494d395;
#using scripts\core_common\clientfield_shared;
#using scripts\mp_common\gametypes\ct_core;

#namespace ct_recon;

// Namespace ct_recon/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xf685e6c9, Offset: 0x118
// Size: 0xb6
function event_handler[gametype_init] main(eventstruct) {
    ct_core::function_46e95cc7();
    ct_core::function_fa03fc55();
    clientfield::register("scriptmover", "blood_splat", 1, 1, "int", &function_8bca10ba, 0, 0);
    level.ct_recon_enemy_reinforcement = ct_recon_enemy_reinforcement::register("ct_recon_enemy_reinforcement");
    level.ct_recon_melee_vip = ct_recon_melee_vip::register("ct_recon_melee_vip");
}

// Namespace ct_recon/ct_recon
// Params 7, eflags: 0x0
// Checksum 0x7de9111, Offset: 0x1d8
// Size: 0x80
function function_8bca10ba(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    while (true) {
        fx = playfx(localclientnum, "blood/fx8_blood_cam_impact_spray_zm", self.origin);
        wait 2;
    }
}


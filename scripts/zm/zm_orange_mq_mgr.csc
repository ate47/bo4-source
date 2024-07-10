#using scripts\zm\zm_orange_mq_sendoff.csc;
#using script_6fdaa897ed596805;
#using scripts\zm\zm_orange_mq_fuse.csc;
#using scripts\zm\zm_orange_mq_hell.csc;
#using scripts\zm\zm_orange_mq_campfire.csc;
#using scripts\zm\zm_orange_mq_blood.csc;
#using scripts\zm\perk\zm_perk_death_perception.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_orange_mq_mgr;

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 0, eflags: 0x1 linked
// Checksum 0xd8ecad75, Offset: 0xd8
// Size: 0xbc
function preload() {
    zm_orange_mq_blood::preload();
    zm_orange_mq_campfire::preload();
    zm_orange_mq_hell::preload();
    zm_orange_mq_fuse::preload();
    namespace_4b68b2b3::preload();
    zm_orange_mq_sendoff::preload();
    clientfield::register("toplayer", "" + #"hash_668f474410d5c1d0", 24000, 1, "int", &clear_hud, 0, 0);
}

// Namespace zm_orange_mq_mgr/zm_orange_mq_mgr
// Params 7, eflags: 0x1 linked
// Checksum 0x71d1a945, Offset: 0x1a0
// Size: 0x6c
function clear_hud(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self zm::function_92f0c63(localclientnum);
    self zm_perk_death_perception::function_25410869(localclientnum);
}


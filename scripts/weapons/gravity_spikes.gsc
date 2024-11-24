#using scripts\abilities\ability_player;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\scoreevents_shared;

#namespace gravity_spikes;

// Namespace gravity_spikes/gravity_spikes
// Params 0, eflags: 0x1 linked
// Checksum 0x1d90fafa, Offset: 0x98
// Size: 0x3c
function init_shared() {
    ability_player::register_gadget_should_notify(7, 1);
    callback::on_connect(&function_aaef50a);
}

// Namespace gravity_spikes/gravity_spikes
// Params 0, eflags: 0x1 linked
// Checksum 0x28675e50, Offset: 0xe0
// Size: 0x14
function function_aaef50a() {
    thread function_263a039();
}

// Namespace gravity_spikes/gravity_spikes
// Params 0, eflags: 0x1 linked
// Checksum 0xd1234cad, Offset: 0x100
// Size: 0xb0
function function_263a039() {
    self endon(#"death");
    while (true) {
        waitresult = self waittill(#"projectile_impact");
        self clientfield::increment("sndRattle", 1);
        scoreevents::processscoreevent(#"hash_5814e5b2ee30cc5a", self, undefined, waitresult.weapon);
        self notify(#"hash_5814e5b2ee30cc5a");
        waitframe(1);
    }
}


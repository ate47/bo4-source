// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace mp_maldives_scripted;

// Namespace mp_maldives_scripted/mp_maldives_scripted
// Params 0, eflags: 0x2
// Checksum 0x162b1b3c, Offset: 0x170
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_maldives_scripted", &__main__, undefined, undefined);
}

// Namespace mp_maldives_scripted/mp_maldives_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x17b59de8, Offset: 0x1b8
// Size: 0xce
function __main__() {
    callback::on_game_playing(&on_game_playing);
    level scene::add_scene_func(#"hash_7e871fdecf584a8", &function_62a2843c);
    level scene::add_scene_func(#"hash_6775dfcf844ce40f", &function_62a2843c);
    level scene::add_scene_func(#"hash_61f7fce38b25cb7e", &function_62a2843c);
    level.var_f3e25805 = &function_c3c859e1;
}

// Namespace mp_maldives_scripted/mp_maldives_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x356cc2, Offset: 0x290
// Size: 0x184
function on_game_playing() {
    var_64c54a7d = getent("laser_kill_trig", "targetname");
    var_64c54a7d triggerenable(0);
    var_64c54a7d callback::on_trigger(&function_7da97cb5);
    var_b8169a3f = struct::get("laser_button");
    var_b8169a3f.mdl_gameobject gameobjects::set_onuse_event(&function_bc78a4d0);
    var_b8169a3f.mdl_gameobject.var_64c54a7d = var_64c54a7d;
    if (!getgametypesetting(#"hash_5e5bd42399148b51")) {
        var_b8169a3f.mdl_gameobject gameobjects::disable_object();
        return;
    }
    if (util::isfirstround()) {
        level scene::play(#"hash_1ba21337161d02dc", "Shot " + randomintrange(1, 3));
        level thread scene::skipto_end(#"hash_1ba21337161d02dc");
    }
}

// Namespace mp_maldives_scripted/mp_maldives_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x420
// Size: 0x4
function function_c3c859e1() {
    
}

// Namespace mp_maldives_scripted/mp_maldives_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x63c72636, Offset: 0x430
// Size: 0x9c
function function_7da97cb5(var_ad3d227e) {
    player = var_ad3d227e.activator;
    if (isalive(player)) {
        mod = "MOD_BURNED";
        if (isvehicle(player)) {
            mod = "MOD_EXPLOSIVE";
        }
        player dodamage(player.health, player.origin, undefined, undefined, undefined, mod);
    }
}

// Namespace mp_maldives_scripted/mp_maldives_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0xe33644ed, Offset: 0x4d8
// Size: 0x134
function function_bc78a4d0(activator) {
    level endon(#"game_ended");
    self gameobjects::disable_object();
    self playsound("evt_laser_button");
    activator gestures::function_56e00fbf("gestable_door_interact", undefined, 0);
    self thread function_8e65b1f2();
    level scene::play(#"hash_1ba21337161d02dc", "Shot " + randomintrange(1, 3));
    level scene::play(#"hash_1ba21337161d02dc", "recharge");
    self playsound("evt_laser_ready");
    self gameobjects::enable_object();
}

// Namespace mp_maldives_scripted/mp_maldives_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x9a29d697, Offset: 0x618
// Size: 0x64
function function_8e65b1f2() {
    level endon(#"game_ended");
    wait(3.5);
    self.var_64c54a7d triggerenable(1);
    wait(7);
    self.var_64c54a7d triggerenable(0);
}

// Namespace mp_maldives_scripted/mp_maldives_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0xbfd91039, Offset: 0x688
// Size: 0x10c
function function_62a2843c(a_ents) {
    shark = a_ents[#"prop 1"];
    trigger = spawn("trigger_radius_new", shark gettagorigin("head_jnt") + (0, 0, -20), 0, 34, 38);
    trigger.shark = shark;
    trigger triggerignoreteam();
    trigger enablelinkto();
    trigger linkto(shark);
    trigger callback::on_trigger(&function_9534b46c);
}

// Namespace mp_maldives_scripted/mp_maldives_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x4b43614a, Offset: 0x7a0
// Size: 0x94
function function_9534b46c(var_95057a9a) {
    shark = self.shark;
    player = var_95057a9a.activator;
    if (isalive(player) && isdefined(shark)) {
        player dodamage(player.maxhealth, shark.origin, undefined, undefined, undefined, "MOD_IMPACT");
    }
}


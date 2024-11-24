#using scripts\core_common\callbacks_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_utility;

#namespace zm_bgb_quacknarok;

// Namespace zm_bgb_quacknarok/zm_bgb_quacknarok
// Params 0, eflags: 0x2
// Checksum 0x7544483c, Offset: 0xe0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_quacknarok", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_quacknarok/zm_bgb_quacknarok
// Params 0, eflags: 0x1 linked
// Checksum 0x56d793a0, Offset: 0x130
// Size: 0xcc
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_quacknarok", "time", 300, &activation, &deactivation);
    bgb::register_actor_death_override(#"zm_bgb_quacknarok", &actor_death_override);
    level.var_5bf2be84 = gettime();
    callback::on_ai_spawned(&on_ai_spawned);
}

// Namespace zm_bgb_quacknarok/zm_bgb_quacknarok
// Params 0, eflags: 0x1 linked
// Checksum 0xda01067f, Offset: 0x208
// Size: 0x18
function activation() {
    self endon(#"disconnect");
}

// Namespace zm_bgb_quacknarok/zm_bgb_quacknarok
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x228
// Size: 0x4
function deactivation() {
    
}

// Namespace zm_bgb_quacknarok/zm_bgb_quacknarok
// Params 0, eflags: 0x1 linked
// Checksum 0xe7ce8359, Offset: 0x238
// Size: 0x10a
function on_ai_spawned() {
    if (self.archetype === #"zombie") {
        var_85574d7a = 0;
        foreach (player in getplayers()) {
            if (player bgb::is_enabled(#"zm_bgb_quacknarok")) {
                var_85574d7a = 1;
            }
        }
        if (var_85574d7a) {
            self attach("p8_zm_red_floatie_duck", "j_spinelower", 1);
            self.bgb_quacknarok = 1;
        }
    }
}

// Namespace zm_bgb_quacknarok/zm_bgb_quacknarok
// Params 1, eflags: 0x1 linked
// Checksum 0x5e9bc96, Offset: 0x350
// Size: 0x14c
function actor_death_override(s_data) {
    if (isdefined(self) && isdefined(self.bgb_quacknarok) && self.bgb_quacknarok) {
        if (gettime() >= level.var_5bf2be84 && randomint(100) < 40) {
            duckie = util::spawn_model("p8_zm_red_floatie_duck", self gettagorigin("j_spinelower"), self gettagangles("j_spinelower"));
            if (isdefined(duckie)) {
                self detach("p8_zm_red_floatie_duck", "j_spinelower");
                level.var_5bf2be84 = gettime() + randomintrange(2000, 5000);
                duckie physicslaunch(self.origin, (0, 0, 64));
                duckie thread function_645efd58();
            }
        }
    }
}

// Namespace zm_bgb_quacknarok/zm_bgb_quacknarok
// Params 0, eflags: 0x1 linked
// Checksum 0x12c69633, Offset: 0x4a8
// Size: 0x3c
function function_645efd58() {
    wait randomintrange(15, 25);
    if (isdefined(self)) {
        self delete();
    }
}


#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace gadget_cymbal_monkey;

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 0, eflags: 0x2
// Checksum 0x5eed4850, Offset: 0xc0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"cymbal_monkey", &__init__, &__main__, undefined);
}

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 0, eflags: 0x4
// Checksum 0x6a4ddb87, Offset: 0x110
// Size: 0x64
function private __init__() {
    level.var_7d95e1ed = [];
    level.var_7c5c96dc = &function_4f90c4c2;
    level thread function_a23699fe();
    callback::on_finalize_initialization(&function_1c601b99);
}

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 0, eflags: 0x0
// Checksum 0x3286f94b, Offset: 0x180
// Size: 0x50
function function_1c601b99() {
    if (isdefined(level.var_a5dacbea)) {
        [[ level.var_a5dacbea ]](getweapon(#"cymbal_monkey"), &function_127fb8f3);
    }
}

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 0, eflags: 0x4
// Checksum 0xe4d4a6e4, Offset: 0x1d8
// Size: 0x32
function private __main__() {
    level._effect[#"monkey_glow"] = #"zm_weapons/fx8_cymbal_monkey_light";
}

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 0, eflags: 0x4
// Checksum 0x76a067e7, Offset: 0x218
// Size: 0x140
function private function_a23699fe() {
    level endon(#"game_ended");
    var_cf4e80a7 = 250;
    while (true) {
        for (i = 0; i < level.var_7d95e1ed.size; i++) {
            monkey = level.var_7d95e1ed[i];
            if (!isdefined(monkey) || isdefined(monkey.fuse_lit) && monkey.fuse_lit) {
                continue;
            }
            if (!isdefined(monkey.var_38af96b9)) {
                monkey delete();
                continue;
            }
            if (function_7e60533f(monkey, var_cf4e80a7)) {
                monkey thread function_b9934c1d();
            }
            waitframe(1);
        }
        level.var_7d95e1ed = array::remove_undefined(level.var_7d95e1ed);
        waitframe(1);
    }
}

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 2, eflags: 0x4
// Checksum 0x8755c9b3, Offset: 0x360
// Size: 0x17a
function private function_7e60533f(monkey, radius) {
    nearby_players = getentitiesinradius(monkey.origin, radius, 1);
    foreach (player in nearby_players) {
        if (function_17c51c94(monkey, player)) {
            return true;
        }
    }
    var_b1de6a06 = getentitiesinradius(monkey.origin, radius, 15);
    foreach (actor in var_b1de6a06) {
        if (function_17c51c94(monkey, actor)) {
            return true;
        }
    }
    return false;
}

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 2, eflags: 0x4
// Checksum 0x76a2c3ba, Offset: 0x4e8
// Size: 0x80
function private function_17c51c94(monkey, ent) {
    if (!isdefined(ent)) {
        return false;
    }
    if ((isplayer(ent) || isactor(ent)) && util::function_fbce7263(ent.team, monkey.team)) {
        return true;
    }
    return false;
}

// Namespace gadget_cymbal_monkey/grenade_fire
// Params 1, eflags: 0x44
// Checksum 0x53e28474, Offset: 0x570
// Size: 0x244
function private event_handler[grenade_fire] function_4776caf4(eventstruct) {
    if (eventstruct.weapon.name == #"cymbal_monkey") {
        e_grenade = eventstruct.projectile;
        e_grenade ghost();
        e_grenade.angles = self.angles;
        mdl_monkey = util::spawn_model(e_grenade.model, e_grenade.origin, e_grenade.angles);
        e_grenade.mdl_monkey = mdl_monkey;
        e_grenade.mdl_monkey linkto(e_grenade);
        e_grenade.mdl_monkey.var_38af96b9 = e_grenade;
        e_grenade.mdl_monkey.team = e_grenade.team;
        e_grenade.mdl_monkey clientfield::set("enemyequip", 1);
        e_grenade waittill(#"stationary", #"death");
        if (!isdefined(e_grenade) && isdefined(mdl_monkey)) {
            mdl_monkey delete();
        }
        if (isdefined(self) && isdefined(e_grenade) && isdefined(e_grenade.mdl_monkey)) {
            e_grenade.mdl_monkey.var_acdc8d71 = getclosestpointonnavmesh(e_grenade.mdl_monkey.origin, 360, 15.1875);
            array::add(level.var_7d95e1ed, e_grenade.mdl_monkey);
            self callback::callback(#"hash_3c09ead7e9d8a968", e_grenade.mdl_monkey);
        }
    }
}

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 0, eflags: 0x0
// Checksum 0xba240dda, Offset: 0x7c0
// Size: 0x154
function function_b9934c1d() {
    self endon(#"death");
    if (isdefined(level.var_2746aef8)) {
        [[ level.var_2746aef8 ]](self);
    }
    self.fuse_lit = 1;
    self playsound(#"hash_4509539f9e7954e2");
    playfxontag(level._effect[#"monkey_glow"], self, "tag_weapon");
    self thread scene::play(#"cin_t8_monkeybomb_dance", self);
    self thread util::delay(6.5, "death", &function_4e61e1d);
    var_de3026af = gettime() + int(8 * 1000);
    while (gettime() < var_de3026af) {
        if (!isdefined(self.var_38af96b9)) {
            break;
        }
        waitframe(1);
    }
    self function_4f90c4c2();
}

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 0, eflags: 0x0
// Checksum 0xf9b466bf, Offset: 0x920
// Size: 0x24
function function_4e61e1d() {
    self playsound(#"zmb_vox_monkey_explode");
}

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 0, eflags: 0x0
// Checksum 0x97373d5c, Offset: 0x950
// Size: 0x8c
function function_4f90c4c2() {
    if (isdefined(self.var_38af96b9)) {
        self callback::callback(#"hash_6aa0232dd3c8376a");
        playsoundatposition(#"wpn_claymore_alert", self.origin);
        self.var_38af96b9 detonate();
    }
    self delete();
}

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 1, eflags: 0x0
// Checksum 0x77d4cac8, Offset: 0x9e8
// Size: 0x144
function function_4a5dff80(zombie) {
    var_2d9e38fc = 360 * 360;
    var_128c12c9 = undefined;
    best_monkey = undefined;
    foreach (monkey in level.var_7d95e1ed) {
        if (!isdefined(monkey)) {
            continue;
        }
        dist_sq = distancesquared(zombie.origin, monkey.origin);
        if (isdefined(monkey) && isdefined(monkey.fuse_lit) && monkey.fuse_lit && dist_sq < var_2d9e38fc) {
            if (!isdefined(var_128c12c9) || dist_sq < var_128c12c9) {
                var_128c12c9 = dist_sq;
                best_monkey = monkey;
            }
        }
    }
    return best_monkey;
}

// Namespace gadget_cymbal_monkey/gadget_cymbal_monkey
// Params 2, eflags: 0x0
// Checksum 0x79897743, Offset: 0xb38
// Size: 0x11c
function function_127fb8f3(cymbal_monkey, attackingplayer) {
    cymbal_monkey endon(#"death");
    randangle = randomfloat(360);
    if (isdefined(level._equipment_emp_destroy_fx)) {
        playfx(level._equipment_emp_destroy_fx, cymbal_monkey.origin + (0, 0, 5), (cos(randangle), sin(randangle), 0), anglestoup(cymbal_monkey.angles));
    }
    wait 1.1;
    playfx(#"hash_65c5042becfbaa7d", cymbal_monkey.origin);
    cymbal_monkey function_4f90c4c2();
}


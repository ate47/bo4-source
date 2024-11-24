#using scripts\core_common\ai\systems\fx_character;
#using scripts\core_common\ai_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\footsteps_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace wz_ai_brutus;

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x2
// Checksum 0x42408c7d, Offset: 0x1c8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_brutus", &__init__, undefined, undefined);
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 0, eflags: 0x1 linked
// Checksum 0x3394dc3f, Offset: 0x210
// Size: 0x13c
function __init__() {
    clientfield::register("actor", "brutus_shock_attack", 15000, 1, "counter", &brutus_shock_attack_fx, 0, 0);
    clientfield::register("actor", "brutus_spawn_clientfield", 15000, 1, "int", &function_80adaab1, 0, 0);
    clientfield::register("toplayer", "brutus_shock_attack_player", 15000, 1, "counter", &brutus_shock_attack_player, 0, 0);
    footsteps::registeraitypefootstepcb(#"brutus", &function_6e2a738c);
    ai::add_archetype_spawn_function(#"brutus", &function_c7251e62);
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x1 linked
// Checksum 0xdc76e51, Offset: 0x358
// Size: 0x2c
function function_c7251e62(localclientnum) {
    self callback::on_shutdown(&on_entity_shutdown);
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 1, eflags: 0x1 linked
// Checksum 0xccddc171, Offset: 0x390
// Size: 0xc
function on_entity_shutdown(localclientnum) {
    
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 7, eflags: 0x1 linked
// Checksum 0x2dd74acb, Offset: 0x3a8
// Size: 0x10c
function function_80adaab1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    if (newval) {
        self.lightfx = util::playfxontag(localclientnum, "light/fx8_light_spot_brutus_flicker", self, "tag_spotlight");
        playfx(localclientnum, "maps/zm_escape/fx8_alcatraz_brut_spawn", self.origin);
        return;
    }
    if (isdefined(self.lightfx)) {
        stopfx(localclientnum, self.lightfx);
    }
    playfx(localclientnum, "maps/zm_escape/fx8_alcatraz_brut_spawn", self.origin);
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 7, eflags: 0x1 linked
// Checksum 0x7fea24bf, Offset: 0x4c0
// Size: 0xfc
function brutus_shock_attack_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    self util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    radius = self ai::function_9139c839().var_1709a39;
    if (!isdefined(radius)) {
        radius = 512;
    }
    playfx(localclientnum, "maps/zm_escape/fx8_alcatraz_brut_shock", self.origin, anglestoup(self.angles));
    earthquake(localclientnum, 1, 1, self.origin, radius);
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 7, eflags: 0x1 linked
// Checksum 0x2bbb7f82, Offset: 0x5c8
// Size: 0x5c
function brutus_shock_attack_player(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    function_36e4ebd4(localclientnum, "damage_heavy");
}

// Namespace wz_ai_brutus/wz_ai_brutus
// Params 5, eflags: 0x1 linked
// Checksum 0xf6fcdf6a, Offset: 0x630
// Size: 0x12e
function function_6e2a738c(localclientnum, pos, surface, notetrack, bone) {
    a_players = getlocalplayers();
    for (i = 0; i < a_players.size; i++) {
        if (abs(self.origin[2] - a_players[i].origin[2]) < 128) {
            var_ed2e93e5 = a_players[i] getlocalclientnumber();
            if (isdefined(var_ed2e93e5)) {
                earthquake(var_ed2e93e5, 0.2, 0.1, self.origin, 1500);
                playrumbleonposition(var_ed2e93e5, "wz_brutus_footsteps", self.origin);
            }
        }
    }
}


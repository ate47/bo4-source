// Atian COD Tools GSC decompiler test
#include scripts/core_common/weapons_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/weapons/weaponobjects.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/globallogic/globallogic_score.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/killcam_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace collapsegrenade;

// Namespace collapsegrenade/collapse_grenade
// Params 0, eflags: 0x2
// Checksum 0xd1e50653, Offset: 0x160
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"collapsegrenade", &init_shared, undefined, undefined);
}

// Namespace collapsegrenade/collapse_grenade
// Params 0, eflags: 0x1 linked
// Checksum 0xae1169a4, Offset: 0x1a8
// Size: 0x9c
function init_shared() {
    weaponobjects::function_e6400478(#"eq_collapse_grenade", &function_41625261, 1);
    clientfield::register("scriptmover", "collapsesphereflag", 1, 1, "int");
    clientfield::register("toplayer", "playerincollapsegrenade", 1, 1, "int");
}

// Namespace collapsegrenade/collapse_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0x9a6e9510, Offset: 0x250
// Size: 0x3e
function function_41625261(watcher) {
    watcher.onspawn = &function_5df80e43;
    watcher.ondamage = &on_damage;
}

// Namespace collapsegrenade/collapse_grenade
// Params 2, eflags: 0x1 linked
// Checksum 0x67e26bc8, Offset: 0x298
// Size: 0x3e4
function function_5df80e43(watcher, player) {
    self endon(#"death");
    grenade = self;
    grenade waittill(#"stationary");
    grenade setcandamage(1);
    grenade.maxhealth = 10000;
    grenade.health = grenade.maxhealth;
    grenade setmaxhealth(grenade.maxhealth);
    var_5ff47c38 = spawn("script_model", grenade.origin);
    var_5ff47c38 setmodel(#"p8_big_sphere");
    var_5ff47c38 setscale(0.0225);
    var_5ff47c38 linkto(grenade);
    var_5ff47c38 clientfield::set("collapsesphereflag", 1);
    grenade thread function_adc9aab9(var_5ff47c38);
    var_80994c8c = 225 * 225;
    grenade_weapon = getweapon(#"eq_collapse_grenade");
    var_f4d9a132 = gettime() + 1000;
    while (1) {
        time = gettime();
        a_players = getplayers();
        foreach (player in a_players) {
            eye_pos = player gettagorigin("tag_eye");
            if (!(isdefined(player.outsidedeathcircle) && player.outsidedeathcircle) && distancesquared(eye_pos, grenade.origin) <= var_80994c8c) {
                if (!isdefined(player.var_fd6d6c7b) || player.var_fd6d6c7b != var_5ff47c38) {
                    player clientfield::set_to_player("playerincollapsegrenade", 1);
                }
                player.var_fd6d6c7b = var_5ff47c38;
                if (time >= var_f4d9a132) {
                    player dodamage(5, grenade.origin, grenade.owner, grenade, undefined, "MOD_DEATH_CIRCLE", 0, grenade_weapon);
                }
            } else if (isdefined(player.var_fd6d6c7b) && player.var_fd6d6c7b == var_5ff47c38) {
                player.var_fd6d6c7b = undefined;
                player clientfield::set_to_player("playerincollapsegrenade", 0);
            }
        }
        if (time >= var_f4d9a132) {
            var_f4d9a132 = gettime() + 1000;
        }
        waitframe(1);
    }
}

// Namespace collapsegrenade/collapse_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0x16dc28ca, Offset: 0x688
// Size: 0x114
function function_adc9aab9(var_5ff47c38) {
    self waittill(#"explode", #"death");
    a_players = getplayers();
    foreach (player in a_players) {
        if (isdefined(player.var_fd6d6c7b) && player.var_fd6d6c7b == var_5ff47c38) {
            player.var_fd6d6c7b = undefined;
            player clientfield::set_to_player("playerincollapsegrenade", 0);
        }
    }
    var_5ff47c38 delete();
}

// Namespace collapsegrenade/collapse_grenade
// Params 1, eflags: 0x1 linked
// Checksum 0xf594f8c5, Offset: 0x7a8
// Size: 0x1aa
function on_damage(watcher) {
    self endon(#"death");
    damagemax = 50;
    self.damagetaken = 0;
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"damage");
        damage = waitresult.amount;
        type = waitresult.mod;
        weapon = waitresult.weapon;
        if (!isdefined(self.damagetaken)) {
            self.damagetaken = 0;
        }
        attacker = self [[ level.figure_out_attacker ]](waitresult.attacker);
        damage = weapons::function_74bbb3fa(damage, weapon, self.weapon);
        if (type == "MOD_MELEE" || type == "MOD_MELEE_WEAPON_BUTT" || weapon.isemp || weapon.destroysequipment) {
            self.damagetaken = damagemax;
        } else {
            self.damagetaken = self.damagetaken + damage;
        }
        if (self.damagetaken >= damagemax) {
            self detonate();
            return;
        }
    }
}


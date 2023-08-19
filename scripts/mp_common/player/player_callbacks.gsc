// Atian COD Tools GSC decompiler test
#include scripts/mp_common/player/player_damage.gsc;
#include scripts/mp_common/gametypes/globallogic_ui.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/status_effects/status_effect_util.gsc;

#namespace player;

// Namespace player/player_callbacks
// Params 8, eflags: 0x1 linked
// Checksum 0xe36fdaed, Offset: 0xa8
// Size: 0xd4
function callback_playermelee(eattacker, idamage, weapon, vorigin, vdir, boneindex, shieldhit, frombehind) {
    hit = 1;
    if (level.teambased && !self util::isenemyteam(eattacker.team)) {
        if (level.friendlyfire == 0) {
            hit = 0;
        }
    }
    self finishmeleehit(eattacker, weapon, vorigin, vdir, boneindex, shieldhit, hit, frombehind);
}

// Namespace player/player_callbacks
// Params 5, eflags: 0x1 linked
// Checksum 0x52ca70b2, Offset: 0x188
// Size: 0x15c
function function_74b6d714(attacker, effectname, var_894859a2, var_ab5b905e, weapon) {
    var_20df3f41 = function_1115bceb(effectname);
    if (isdefined(var_ab5b905e) && var_ab5b905e > 0) {
        duration = var_ab5b905e;
    } else {
        duration = undefined;
    }
    attackerishittingteammate = isplayer(attacker) && self util::isenemyplayer(attacker) == 0 && self != attacker;
    attackerishittingself = isplayer(attacker) && self == attacker;
    if (attackerishittingself && weapon.var_50d2316b) {
        return;
    }
    if (attackerishittingteammate && !function_1727a023(0, attacker)) {
        return;
    }
    self status_effect::status_effect_apply(var_20df3f41, weapon, attacker, undefined, duration, var_894859a2);
}

// Namespace player/player_callbacks
// Params 1, eflags: 0x1 linked
// Checksum 0x11011243, Offset: 0x2f0
// Size: 0x84
function callback_playershielddamageblocked(damage) {
    previous_shield_damage = self.shielddamageblocked;
    self.shielddamageblocked = self.shielddamageblocked + damage;
    if (self.shielddamageblocked % 200 < previous_shield_damage % 200) {
        score_event = "shield_blocked_damage";
        scoreevents::processscoreevent(score_event, self, undefined, self.currentweapon);
    }
}

// Namespace player/player_callbacks
// Params 0, eflags: 0x1 linked
// Checksum 0x9ef73803, Offset: 0x380
// Size: 0xd0
function callback_playermigrated() {
    /#
        println("<unknown string>" + self.name + "<unknown string>" + gettime());
    #/
    if (isdefined(self.connected) && self.connected) {
        self globallogic_ui::updateobjectivetext();
    }
    level.hostmigrationreturnedplayercount++;
    if (level.hostmigrationreturnedplayercount >= level.players.size * 2 / 3) {
        /#
            println("<unknown string>");
        #/
        level notify(#"hostmigration_enoughplayers");
    }
}

// Namespace player/player_callbacks
// Params 9, eflags: 0x1 linked
// Checksum 0x9e8fa8fd, Offset: 0x458
// Size: 0x90
function callback_playerlaststand(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (isdefined(level.var_97c6ee7c)) {
        [[ level.var_97c6ee7c ]](einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
    }
}


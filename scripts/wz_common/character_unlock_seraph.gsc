// Atian COD Tools GSC decompiler test
#using scripts\wz_common\wz_firing_range.gsc;
#using scripts\wz_common\character_unlock_seraph_fixup.gsc;
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\item_world.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_seraph;

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 0, eflags: 0x2
// Checksum 0x7900179e, Offset: 0xe0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_seraph", &__init__, undefined, #"character_unlock_seraph_fixup");
}

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 0, eflags: 0x0
// Checksum 0xdefee43, Offset: 0x130
// Size: 0x54
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"seraph_unlock", &function_2613aeec);
    callback::on_finalize_initialization(&on_finalize_initialization);
}

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 0, eflags: 0x0
// Checksum 0xbe611744, Offset: 0x190
// Size: 0x24
function on_finalize_initialization() {
    waitframe(1);
    level function_75097bb5();
}

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 1, eflags: 0x0
// Checksum 0x3f71d156, Offset: 0x1c0
// Size: 0xf4
function function_2613aeec(enabled) {
    if (enabled) {
        callback::on_player_killed(&on_player_killed);
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_team_eliminated", &function_4ac25840);
        wz_firing_range::init_targets(#"hash_3af83a27a707345a");
        level.var_d27ee2e7 = 1;
        level thread function_211772b5();
        return;
    }
    level thread function_1e3aca52();
}

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 0, eflags: 0x0
// Checksum 0x741e4637, Offset: 0x2c0
// Size: 0x1ae
function function_211772b5() {
    item_world::function_4de3ca98();
    var_b2425612 = getdynentarray(#"hash_81ef4f75cff4919");
    if (isdefined(var_b2425612) && var_b2425612.size > 1) {
        var_65688262 = array::random(var_b2425612);
        arrayremovevalue(var_b2425612, var_65688262);
        foreach (box in var_b2425612) {
            if (isdefined(box)) {
                setdynentenabled(box, 0);
            }
        }
        var_590fbce8 = function_91b29d2a(#"annihilator_spawn");
        if (isdefined(var_590fbce8) && var_590fbce8.size > 1) {
            var_590fbce8 = arraysortclosest(var_590fbce8, var_65688262.origin);
            for (i = 1; i < var_590fbce8.size; i++) {
                item_world::consume_item(var_590fbce8[i]);
            }
        }
    }
}

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 0, eflags: 0x0
// Checksum 0x330fb361, Offset: 0x478
// Size: 0x2c
function function_1e3aca52() {
    item_world::function_4de3ca98();
    level function_75097bb5();
}

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 0, eflags: 0x0
// Checksum 0x3f4464ba, Offset: 0x4b0
// Size: 0x100
function function_75097bb5() {
    var_1c9468df = getdynent(#"hash_3af83a27a707345a");
    if (isdefined(var_1c9468df)) {
        setdynentenabled(var_1c9468df, 0);
    }
    var_b2425612 = getdynentarray(#"hash_81ef4f75cff4919");
    if (isdefined(var_b2425612)) {
        foreach (box in var_b2425612) {
            if (isdefined(box)) {
                setdynentenabled(box, 0);
            }
        }
    }
}

// Namespace character_unlock_seraph/event_cf200f34
// Params 1, eflags: 0x44
// Checksum 0xb6332976, Offset: 0x5b8
// Size: 0x2e4
function private event_handler[event_cf200f34] function_209450ae(eventstruct) {
    if (!(isdefined(level.var_d27ee2e7) && level.var_d27ee2e7)) {
        return;
    }
    if (!level character_unlock::function_b3681acb()) {
        return;
    }
    if (level.inprematchperiod) {
        return;
    }
    dynent = eventstruct.ent;
    if (dynent.targetname !== #"hash_3af83a27a707345a") {
        return;
    }
    attacker = eventstruct.attacker;
    weapon = eventstruct.weapon;
    position = eventstruct.position;
    direction = eventstruct.dir;
    if (!isplayer(attacker) || !isdefined(weapon) || !isdefined(position) || !isdefined(direction)) {
        return;
    }
    if (weapon.weapclass != "pistol" && weapon.weapclass != "pistol spread") {
        return;
    }
    if (distancesquared(attacker.origin, dynent.origin) < 200 * 200) {
        return;
    }
    if (attacker character_unlock::function_d7e6fa92(#"seraph_unlock")) {
        return;
    }
    targetangles = dynent.angles + (0, 90, 0);
    var_2bbc9717 = anglestoforward(targetangles);
    if (vectordot(var_2bbc9717, direction) >= 0) {
        return;
    }
    var_f748425e = dynent.origin + (0, 0, 60);
    if (distance2dsquared(var_f748425e, position) > 5 * 5) {
        return;
    }
    var_bbe521bc = getdynent(#"hash_81ef4f75cff4919");
    if (function_ffdbe8c2(var_bbe521bc) != 1) {
        function_e2a06860(var_bbe521bc, 1);
    }
}

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 0, eflags: 0x0
// Checksum 0x3edf6764, Offset: 0x8a8
// Size: 0x10c
function on_player_killed() {
    if (!isdefined(self.laststandparams)) {
        return;
    }
    attacker = self.laststandparams.attacker;
    weapon = self.laststandparams.sweapon;
    if (!isplayer(attacker) || !isdefined(weapon)) {
        return;
    }
    if (weapon.name != #"hero_annihilator") {
        return;
    }
    if (!attacker util::isenemyteam(self.team)) {
        return;
    }
    if (!attacker character_unlock::function_f0406288(#"seraph_unlock")) {
        return;
    }
    attacker character_unlock::function_c8beca5e(#"seraph_unlock", #"hash_633d185cd2140f1a", 1);
}

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 1, eflags: 0x0
// Checksum 0xc025fa7c, Offset: 0x9c0
// Size: 0xd4
function function_1c4b5097(item) {
    if (isdefined(item.itementry) && item.itementry.name === #"annihilator_wz_item") {
        var_c503939b = globallogic::function_e9e52d05();
        if (var_c503939b <= function_c816ea5b()) {
            if (self character_unlock::function_f0406288(#"seraph_unlock")) {
                self character_unlock::function_c8beca5e(#"seraph_unlock", #"hash_633d175cd2140d67", 1);
            }
        }
    }
}

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 1, eflags: 0x0
// Checksum 0x1676ebb6, Offset: 0xaa0
// Size: 0x1e2
function function_4ac25840(dead_team) {
    if (isdefined(level.var_3227278c) && level.var_3227278c) {
        return;
    }
    var_c503939b = globallogic::function_e9e52d05();
    if (var_c503939b <= function_c816ea5b()) {
        foreach (team in level.teams) {
            if (teams::function_9dd75dad(team) && !teams::is_all_dead(team)) {
                players = getplayers(team);
                foreach (player in players) {
                    if (player character_unlock::function_f0406288(#"seraph_unlock")) {
                        player character_unlock::function_c8beca5e(#"seraph_unlock", #"hash_633d175cd2140d67", 1);
                    }
                }
            }
        }
        level.var_3227278c = 1;
    }
}

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 0, eflags: 0x4
// Checksum 0xd7fea55f, Offset: 0xc90
// Size: 0x80
function private function_c816ea5b() {
    maxteamplayers = isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1;
    switch (maxteamplayers) {
    case 1:
        return 15;
    case 2:
        return 8;
    case 4:
    default:
        return 4;
    case 5:
        return 4;
    }
}

// Namespace character_unlock_seraph/character_unlock_seraph
// Params 0, eflags: 0x0
// Checksum 0xf9efa1ba, Offset: 0xd78
// Size: 0x5e
function function_f6dc1aa9() {
    /#
        while (true) {
            var_f748425e = self.origin + (0, 0, 60);
            sphere(var_f748425e, 5, (1, 1, 0));
            waitframe(1);
        }
    #/
}


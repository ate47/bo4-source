#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\item_world.gsc;
#using scripts\mp_common\item_drop.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_takeo;

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 0, eflags: 0x2
// Checksum 0xd6fd166f, Offset: 0xc8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_takeo", &__init__, undefined, #"character_unlock_takeo_fixup");
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 0, eflags: 0x0
// Checksum 0x714e680b, Offset: 0x118
// Size: 0x54
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"takeo_unlock", &function_2613aeec);
    callback::on_finalize_initialization(&on_finalize_initialization);
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 1, eflags: 0x0
// Checksum 0xa0da2ab3, Offset: 0x178
// Size: 0x174
function function_2613aeec(enabled) {
    if (enabled) {
        callback::on_item_use(&on_item_use);
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_team_eliminated", &function_4ac25840);
        a_dynents = getdynentarray(#"hash_7b220e1de3a2000d");
        if (isdefined(a_dynents) && isarray(a_dynents)) {
            foreach (ent in a_dynents) {
                ent.onuse = &function_d5cd583a;
            }
        }
        return;
    }
    level thread function_279880b1();
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 0, eflags: 0x0
// Checksum 0xc1ac5180, Offset: 0x2f8
// Size: 0x24
function on_finalize_initialization() {
    waitframe(1);
    level function_552910e9();
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 0, eflags: 0x0
// Checksum 0x17882275, Offset: 0x328
// Size: 0x2c
function function_279880b1() {
    item_world::function_4de3ca98();
    level function_552910e9();
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 0, eflags: 0x0
// Checksum 0x79e225f3, Offset: 0x360
// Size: 0xc8
function function_552910e9() {
    a_dynents = getdynentarray(#"hash_7b220e1de3a2000d");
    if (isdefined(a_dynents) && isarray(a_dynents)) {
        foreach (dynent in a_dynents) {
            setdynentenabled(dynent, 0);
        }
    }
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 3, eflags: 0x0
// Checksum 0xd9f13f61, Offset: 0x430
// Size: 0x136
function function_d5cd583a(activator, laststate, state) {
    if (!level character_unlock::function_b3681acb()) {
        return;
    }
    if (level.inprematchperiod) {
        return;
    }
    spawnpos = struct::get(self.target, "targetname");
    if (!isdefined(spawnpos)) {
        return;
    }
    point = function_4ba8fde(#"cu18_item");
    if (isdefined(point) && isdefined(point.itementry)) {
        dropitem = self item_drop::drop_item(point.itementry.weapon, 1, point.itementry.amount, point.id, spawnpos.origin, spawnpos.angles);
    }
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 1, eflags: 0x0
// Checksum 0xf10ad1fc, Offset: 0x570
// Size: 0x12c
function function_1c4b5097(item) {
    itementry = item.itementry;
    if (itementry.name === #"cu18_item") {
        if (self character_unlock::function_f0406288(#"takeo_unlock")) {
            self function_895b40e4();
            self character_unlock::function_c8beca5e(#"takeo_unlock", #"hash_56b5eb94fb75cbed", 1);
            self.var_b5d833a4 = 1;
            var_c503939b = globallogic::function_e9e52d05();
            if (var_c503939b <= function_c816ea5b()) {
                self character_unlock::function_c8beca5e(#"takeo_unlock", #"hash_56b5e894fb75c6d4", 1);
            }
        }
    }
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 1, eflags: 0x0
// Checksum 0x51cf489a, Offset: 0x6a8
// Size: 0xfa
function on_item_use(params) {
    if (!(isdefined(self.var_b5d833a4) && self.var_b5d833a4)) {
        return;
    }
    if (isdefined(self.var_979273e3) && self.var_979273e3) {
        return;
    }
    item = params.item;
    if (isdefined(item.itementry) && item.itementry.itemtype === #"equipment") {
        if (self character_unlock::function_c70bcc7a(#"takeo_unlock")) {
            self character_unlock::function_c8beca5e(#"takeo_unlock", #"hash_56b5eb94fb75cbed", 2);
            self.var_979273e3 = 1;
        }
    }
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 1, eflags: 0x0
// Checksum 0x7edec844, Offset: 0x7b0
// Size: 0x1e2
function function_4ac25840(dead_team) {
    if (isdefined(level.var_2dd7bbb7) && level.var_2dd7bbb7) {
        return;
    }
    var_c503939b = globallogic::function_e9e52d05();
    if (var_c503939b <= function_c816ea5b()) {
        foreach (team in level.teams) {
            if (teams::function_9dd75dad(team) && !teams::is_all_dead(team)) {
                players = getplayers(team);
                foreach (player in players) {
                    if (player character_unlock::function_f0406288(#"takeo_unlock")) {
                        player character_unlock::function_c8beca5e(#"takeo_unlock", #"hash_56b5e894fb75c6d4", 1);
                    }
                }
            }
        }
        level.var_2dd7bbb7 = 1;
    }
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 0, eflags: 0x4
// Checksum 0xccc5836f, Offset: 0x9a0
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
        return 3;
    case 5:
        return 3;
    }
}

// Namespace character_unlock_takeo/character_unlock_takeo
// Params 0, eflags: 0x4
// Checksum 0x99e31a61, Offset: 0xa88
// Size: 0x24
function private function_895b40e4() {
    self playsoundtoplayer(#"hash_1c5c27cafefddb2f", self);
}


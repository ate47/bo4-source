// Atian COD Tools GSC decompiler test
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\item_world_fixup.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_torque;

// Namespace character_unlock_torque/character_unlock_torque
// Params 0, eflags: 0x2
// Checksum 0xbbb30659, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_torque", &__init__, undefined, #"character_unlock_torque_fixup");
}

// Namespace character_unlock_torque/character_unlock_torque
// Params 0, eflags: 0x0
// Checksum 0x531f34bc, Offset: 0xf0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"torque_unlock", &function_2613aeec);
}

// Namespace character_unlock_torque/character_unlock_torque
// Params 1, eflags: 0x0
// Checksum 0x1071bed2, Offset: 0x130
// Size: 0x14c
function function_2613aeec(enabled) {
    if (enabled) {
        callback::on_item_use(&function_a2877194);
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_team_eliminated", &function_4ac25840);
        if (isdefined(getgametypesetting(#"hash_17f17e92c2654659")) && getgametypesetting(#"hash_17f17e92c2654659")) {
            item_world_fixup::function_e70fa91c(#"ammo_stash_parent_dlc1", #"supply_drop_stash_cu02", 2);
            return;
        }
        item_world_fixup::function_e70fa91c(#"ammo_stash_parent_dlc1", #"supply_drop_stash_cu02", 6);
    }
}

// Namespace character_unlock_torque/character_unlock_torque
// Params 1, eflags: 0x0
// Checksum 0xa78d0808, Offset: 0x288
// Size: 0xe4
function function_1c4b5097(item) {
    itementry = item.itementry;
    if (itementry.name === #"cu02_item") {
        self.var_cadd241b = 1;
        var_c503939b = globallogic::function_e9e52d05();
        if (var_c503939b <= function_c816ea5b()) {
            if (self character_unlock::function_f0406288(#"torque_unlock")) {
                self character_unlock::function_c8beca5e(#"torque_unlock", #"hash_b47463756c6a60f", 1);
            }
        }
    }
}

// Namespace character_unlock_torque/character_unlock_torque
// Params 1, eflags: 0x0
// Checksum 0xb6613b47, Offset: 0x378
// Size: 0x16c
function function_a2877194(params) {
    if (!(isdefined(self.var_cadd241b) && self.var_cadd241b)) {
        return;
    }
    if (!self character_unlock::function_f0406288(#"torque_unlock")) {
        return;
    }
    item_name = params.item.itementry.name;
    if (item_name === #"concertina_wire_wz_item") {
        if (!isdefined(self.var_41ae08e8)) {
            self.var_41ae08e8 = 0;
        }
        self.var_41ae08e8++;
        if (self.var_41ae08e8 == 2) {
            self character_unlock::function_c8beca5e(#"torque_unlock", #"hash_a9ec4883fd0293d", 1);
        }
        return;
    }
    if (item_name === #"barricade_wz_item") {
        if (!isdefined(self.var_c0bc1135)) {
            self.var_c0bc1135 = 0;
        }
        self.var_c0bc1135++;
        if (self.var_c0bc1135 == 1) {
            self character_unlock::function_c8beca5e(#"torque_unlock", #"hash_3843c83850f09a08", 1);
        }
    }
}

// Namespace character_unlock_torque/character_unlock_torque
// Params 1, eflags: 0x0
// Checksum 0xf62cab56, Offset: 0x4f0
// Size: 0x1e2
function function_4ac25840(dead_team) {
    if (isdefined(level.var_93eb15f7) && level.var_93eb15f7) {
        return;
    }
    var_c503939b = globallogic::function_e9e52d05();
    if (var_c503939b <= function_c816ea5b()) {
        foreach (team in level.teams) {
            if (teams::function_9dd75dad(team) && !teams::is_all_dead(team)) {
                players = getplayers(team);
                foreach (player in players) {
                    if (player character_unlock::function_f0406288(#"torque_unlock")) {
                        player character_unlock::function_c8beca5e(#"torque_unlock", #"hash_b47463756c6a60f", 1);
                    }
                }
            }
        }
        level.var_93eb15f7 = 1;
    }
}

// Namespace character_unlock_torque/character_unlock_torque
// Params 0, eflags: 0x4
// Checksum 0x16a3c628, Offset: 0x6e0
// Size: 0x80
function private function_c816ea5b() {
    maxteamplayers = isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1;
    switch (maxteamplayers) {
    case 1:
        return 30;
    case 2:
        return 15;
    case 4:
    default:
        return 7;
    case 5:
        return 7;
    }
}


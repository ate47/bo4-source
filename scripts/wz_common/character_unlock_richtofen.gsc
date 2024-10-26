#using scripts\wz_common\character_unlock_richtofen_fixup.gsc;
#using scripts\wz_common\character_unlock_fixup.gsc;
#using scripts\wz_common\character_unlock.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\item_inventory.gsc;
#using scripts\mp_common\item_drop.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock_richtofen;

// Namespace character_unlock_richtofen/character_unlock_richtofen
// Params 0, eflags: 0x2
// Checksum 0xbd8bb707, Offset: 0x110
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_richtofen", &__init__, undefined, #"character_unlock_richtofen_fixup");
}

// Namespace character_unlock_richtofen/character_unlock_richtofen
// Params 0, eflags: 0x0
// Checksum 0xd26120fb, Offset: 0x160
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"richtofen_unlock", &function_2613aeec);
}

// Namespace character_unlock_richtofen/character_unlock_richtofen
// Params 1, eflags: 0x0
// Checksum 0x89199f56, Offset: 0x1a0
// Size: 0x264
function function_2613aeec(enabled) {
    if (enabled) {
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
        callback::add_callback(#"on_team_eliminated", &function_4ac25840);
        spawn_struct = struct::get("cu17_trigger_struct", "targetname");
        if (!isdefined(spawn_struct)) {
            return;
        }
        radius = isdefined(spawn_struct.radius) ? spawn_struct.radius : 200;
        height = isdefined(spawn_struct.height) ? spawn_struct.height : 125;
        trigger = spawn("trigger_radius_use", spawn_struct.origin, 0, radius, height, 1);
        if (!isdefined(trigger)) {
            return;
        }
        trigger triggerignoreteam();
        trigger setinvisibletoall();
        trigger setteamfortrigger(#"none");
        trigger setcursorhint("HINT_NOICON");
        trigger usetriggerignoreuseholdtime();
        trigger function_4bf6de9a(1);
        trigger usetriggerrequirelookat();
        trigger sethintstring(#"hash_5082ca83a4dd1416");
        trigger callback::on_trigger(&function_2043936c);
        trigger thread update_trigger_visibility();
    }
}

// Namespace character_unlock_richtofen/character_unlock_richtofen
// Params 0, eflags: 0x0
// Checksum 0x7d0c3579, Offset: 0x410
// Size: 0xc8
function function_80635b6f() {
    foreach (item_name in array(#"cu15_item", #"cu16_item", #"cu18_item")) {
        item = self item_inventory::function_7fe4ce88(item_name);
        if (isdefined(item)) {
            return item;
        }
    }
}

// Namespace character_unlock_richtofen/character_unlock_richtofen
// Params 1, eflags: 0x0
// Checksum 0xa0ac46a7, Offset: 0x4e0
// Size: 0x24c
function function_1c4b5097(item) {
    itementry = item.itementry;
    if (itementry.name == #"cu15_item" || itementry.name == #"cu16_item" || itementry.name == #"cu18_item") {
        characterassetname = getcharacterassetname(self getcharacterbodytype(), currentsessionmode());
        if (characterassetname !== #"hash_f66f1d73b4acc45" && characterassetname !== #"hash_29e6a0007c925dd4" && characterassetname !== #"hash_22648ce3a4423d8f") {
            return;
        }
        if (!isdefined(level.var_ca57a3b8)) {
            level.var_ca57a3b8 = [];
        } else if (!isarray(level.var_ca57a3b8)) {
            level.var_ca57a3b8 = array(level.var_ca57a3b8);
        }
        level.var_ca57a3b8[level.var_ca57a3b8.size] = self;
        return;
    }
    if (itementry.name == #"cu17_item") {
        var_c503939b = globallogic::function_e9e52d05();
        if (var_c503939b <= function_c816ea5b()) {
            if (self character_unlock::function_f0406288(#"richtofen_unlock")) {
                self character_unlock::function_c8beca5e(#"richtofen_unlock", #"hash_418312990213bc41", 1);
            }
        }
    }
}

// Namespace character_unlock_richtofen/character_unlock_richtofen
// Params 1, eflags: 0x0
// Checksum 0xcddda5e2, Offset: 0x738
// Size: 0x1e2
function function_4ac25840(dead_team) {
    if (isdefined(level.var_b3fe1248) && level.var_b3fe1248) {
        return;
    }
    var_c503939b = globallogic::function_e9e52d05();
    if (var_c503939b <= function_c816ea5b()) {
        foreach (team in level.teams) {
            if (teams::function_9dd75dad(team) && !teams::is_all_dead(team)) {
                players = getplayers(team);
                foreach (player in players) {
                    if (player character_unlock::function_f0406288(#"richtofen_unlock")) {
                        player character_unlock::function_c8beca5e(#"richtofen_unlock", #"hash_418312990213bc41", 1);
                    }
                }
            }
        }
        level.var_b3fe1248 = 1;
    }
}

// Namespace character_unlock_richtofen/character_unlock_richtofen
// Params 0, eflags: 0x0
// Checksum 0xba50340f, Offset: 0x928
// Size: 0x174
function update_trigger_visibility() {
    self endon(#"death");
    level endon(#"game_ended");
    level.var_ca57a3b8 = [];
    while (true) {
        foreach (player in level.var_ca57a3b8) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(player.var_b60fee90) && player.var_b60fee90) {
                continue;
            }
            if (distancesquared(player.origin, self.origin) > 250 * 250) {
                continue;
            }
            item = player function_80635b6f();
            if (isdefined(item)) {
                self setvisibletoplayer(player);
                continue;
            }
            self setinvisibletoplayer(player);
        }
        wait 0.5;
    }
}

// Namespace character_unlock_richtofen/character_unlock_richtofen
// Params 1, eflags: 0x0
// Checksum 0x134379b7, Offset: 0xaa8
// Size: 0x1dc
function function_2043936c(trigger_struct) {
    player = trigger_struct.activator;
    if (!isplayer(player)) {
        return;
    }
    item = player function_80635b6f();
    if (isdefined(item)) {
        point = function_4ba8fde(#"cu17_item");
        if (isdefined(point) && isdefined(point.itementry)) {
            forward = anglestoforward(player.angles);
            droppos = player get_item_spawn_point();
            dropitem = player item_drop::drop_item(point.itementry.weapon, 1, point.itementry.amount, point.id, droppos, player.angles);
            player item_inventory::remove_inventory_item(item.networkid);
            var_129fa609 = player function_80635b6f();
            player.var_b60fee90 = 1;
            if (!isdefined(var_129fa609)) {
                arrayremovevalue(level.var_ca57a3b8, player);
            }
        }
        self setinvisibletoplayer(player);
    }
}

// Namespace character_unlock_richtofen/character_unlock_richtofen
// Params 0, eflags: 0x4
// Checksum 0xfee3fee6, Offset: 0xc90
// Size: 0xda
function private get_item_spawn_point() {
    var_6e5341fb = struct::get_array("cu17_drop_point", "targetname");
    if (isdefined(var_6e5341fb) && isarray(var_6e5341fb)) {
        var_2e4ef4d0 = arraysortclosest(var_6e5341fb, self.origin);
        if (isdefined(var_2e4ef4d0[0])) {
            return var_2e4ef4d0[0].origin;
        }
    }
    forward = anglestoforward(self.angles);
    return self.origin + 36 * forward + (0, 0, 10);
}

// Namespace character_unlock_richtofen/character_unlock_richtofen
// Params 0, eflags: 0x4
// Checksum 0xa69042be, Offset: 0xd78
// Size: 0x80
function private function_c816ea5b() {
    maxteamplayers = isdefined(getgametypesetting(#"maxteamplayers")) ? getgametypesetting(#"maxteamplayers") : 1;
    switch (maxteamplayers) {
    case 1:
        return 5;
    case 2:
        return 3;
    case 4:
    default:
        return 2;
    case 5:
        return 2;
    }
}


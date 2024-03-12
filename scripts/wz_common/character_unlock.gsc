// Atian COD Tools GSC decompiler test
#using script_71e26f08f03b7a7a;
#using scripts\mp_common\item_world_fixup.gsc;
#using scripts\mp_common\item_inventory.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace character_unlock;

// Namespace character_unlock/character_unlock
// Params 0, eflags: 0x2
// Checksum 0xd6b9c97d, Offset: 0x98
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock", &__init__, undefined, #"character_unlock_fixup");
}

// Namespace character_unlock/character_unlock
// Params 0, eflags: 0x0
// Checksum 0xc1c314a8, Offset: 0xe8
// Size: 0xfc
function __init__() {
    level.var_b3681acb = isdefined(getgametypesetting(#"hash_50b1121aee76a7e4")) ? getgametypesetting(#"hash_50b1121aee76a7e4") : 1;
    callback::on_item_pickup(&function_6e8037ca);
    callback::add_callback(#"on_drop_inventory", &on_drop_inventory);
    callback::add_callback(#"on_end_game", &on_end_game);
    callback::on_disconnect(&on_player_disconnect);
}

// Namespace character_unlock/character_unlock
// Params 0, eflags: 0x0
// Checksum 0xd4574436, Offset: 0x1f0
// Size: 0x82
function function_b3681acb() {
    /#
        if (getdvar(#"hash_62fbe70d500712c1", 0) == 1) {
            return 1;
        }
    #/
    return level.var_b3681acb && isdefined(level.onlinegame) && level.onlinegame && isdefined(level.rankedmatch) && level.rankedmatch;
}

// Namespace character_unlock/character_unlock
// Params 1, eflags: 0x0
// Checksum 0x78f0270f, Offset: 0x280
// Size: 0xa4
function function_d89ef6af(unlock_name) {
    switch (unlock_name) {
    case #"hash_178221dd8299137b":
        return 1;
    case #"hash_8c7045e78561cf4":
        return 1;
    case #"hash_3532d912b12917c9":
        return 1;
    case #"hash_517bb26004a9c12b":
        return 1;
    case #"hash_263de5e9fa6d16ea":
        return 1;
    case #"hash_74709eb5a08139fb":
        return 1;
    }
    return 0;
}

// Namespace character_unlock/character_unlock
// Params 1, eflags: 0x0
// Checksum 0xbe17b8ba, Offset: 0x330
// Size: 0x178
function function_d7e6fa92(unlock_name) {
    var_9ba1646c = level.var_7d8da246[unlock_name];
    /#
        /#
            assert(isdefined(var_9ba1646c), "<unknown string>" + function_9e72a96(unlock_name) + "<unknown string>");
        #/
    #/
    if (!isdefined(var_9ba1646c)) {
        return 0;
    }
    var_2b469a7d = var_9ba1646c.var_2b469a7d;
    if (function_d89ef6af(unlock_name)) {
        if (isdefined(stats::get_stat(#"unlockedtags", var_2b469a7d)) && stats::get_stat(#"unlockedtags", var_2b469a7d)) {
            return 1;
        }
        return 0;
    }
    if (isdefined(stats::get_stat(#"characters", var_2b469a7d, #"unlocked")) && stats::get_stat(#"characters", var_2b469a7d, #"unlocked")) {
        return 1;
    }
    return 0;
}

// Namespace character_unlock/character_unlock
// Params 1, eflags: 0x0
// Checksum 0x5541ee5, Offset: 0x4b0
// Size: 0xe6
function function_f0406288(unlock_name) {
    if (!level function_b3681acb()) {
        return 0;
    }
    if (self function_d7e6fa92(unlock_name)) {
        return 0;
    }
    if (isdefined(self.var_474dff5e) && isdefined(self.var_474dff5e[unlock_name]) && self.var_474dff5e[unlock_name]) {
        return 1;
    }
    var_9ba1646c = level.var_7d8da246[unlock_name];
    item_name = var_9ba1646c.required_item;
    required_item = self item_inventory::function_7fe4ce88(item_name);
    if (isdefined(required_item)) {
        return 1;
    }
    return 0;
}

// Namespace character_unlock/character_unlock
// Params 1, eflags: 0x0
// Checksum 0x3e1b7301, Offset: 0x5a0
// Size: 0x7a
function function_c70bcc7a(unlock_name) {
    if (!level function_b3681acb()) {
        return 0;
    }
    if (self function_d7e6fa92(unlock_name)) {
        return 0;
    }
    if (!isdefined(self.var_c53589da) || !isdefined(self.var_c53589da[unlock_name])) {
        return 0;
    }
    return 1;
}

// Namespace character_unlock/character_unlock
// Params 1, eflags: 0x0
// Checksum 0x69828968, Offset: 0x628
// Size: 0x2d4
function function_6e8037ca(params) {
    if (!level function_b3681acb()) {
        return;
    }
    if (level.inprematchperiod) {
        return;
    }
    var_a6762160 = params.item.var_a6762160;
    if (!isdefined(var_a6762160)) {
        return;
    }
    if (!isdefined(var_a6762160.unlockableitemref)) {
        return;
    }
    foreach (unlock_name, var_9ba1646c in level.var_7d8da246) {
        if (self function_d7e6fa92(unlock_name)) {
            itembundle = getscriptbundle(var_9ba1646c.required_item);
            if (!isdefined(itembundle) || !isdefined(itembundle.unlockableitemref)) {
                continue;
            }
            itemindex = getitemindexfromref(itembundle.unlockableitemref);
            if (itemindex == 0) {
                continue;
            }
            self luinotifyevent(#"character_unlock_update", 2, 1, itemindex);
            continue;
        }
        item_name = var_9ba1646c.required_item;
        if (var_a6762160.name === item_name) {
            if (!isdefined(self.var_c53589da)) {
                self.var_c53589da = [];
            }
            if (!isdefined(self.var_c53589da[unlock_name])) {
                var_c5c8fd39 = {#var_e7e238a4:[]};
                foreach (condition in var_9ba1646c.var_3845495) {
                    var_c5c8fd39.var_e7e238a4[condition] = 0;
                }
                self.var_c53589da[unlock_name] = var_c5c8fd39;
            }
            break;
        }
    }
    self callback::callback(#"hash_48bcdfea6f43fecb", params.item);
}

// Namespace character_unlock/character_unlock
// Params 3, eflags: 0x0
// Checksum 0x88da6d99, Offset: 0x908
// Size: 0x2b4
function function_c8beca5e(unlock_name, var_1d208aea, state) {
    if (!level function_b3681acb()) {
        return;
    }
    if (level.inprematchperiod) {
        return;
    }
    var_9ba1646c = level.var_7d8da246[unlock_name];
    /#
        /#
            assert(isdefined(var_9ba1646c), "<unknown string>" + function_9e72a96(unlock_name) + "<unknown string>");
        #/
        /#
            assert(isinarray(var_9ba1646c.var_3845495, var_1d208aea), "<unknown string>" + function_9e72a96(var_1d208aea) + "<unknown string>" + function_9e72a96(unlock_name));
        #/
        /#
            assert(isinarray(array(0, 1, 2), state), "<unknown string>" + function_9e72a96(var_1d208aea) + "<unknown string>" + function_9e72a96(unlock_name));
        #/
    #/
    if (!self function_c70bcc7a(unlock_name)) {
        /#
            assertmsg("<unknown string>" + unlock_name + "<unknown string>");
        #/
        return;
    }
    current_state = self.var_c53589da[unlock_name].var_e7e238a4[var_1d208aea];
    if (current_state == 2) {
        return;
    }
    self.var_c53589da[unlock_name].var_e7e238a4[var_1d208aea] = state;
    self function_20b0ca2e(unlock_name);
    if (var_1d208aea != #"hash_3f07579f66b464e8") {
        if (!isalive(self) || isdefined(level.gameended) && level.gameended) {
            self function_fb689837();
        }
    }
}

// Namespace character_unlock/character_unlock
// Params 1, eflags: 0x0
// Checksum 0xa4a10712, Offset: 0xbc8
// Size: 0x462
function function_20b0ca2e(unlock_name) {
    var_9ba1646c = level.var_7d8da246[unlock_name];
    /#
        /#
            assert(isdefined(var_9ba1646c), "<unknown string>" + function_9e72a96(unlock_name) + "<unknown string>");
        #/
    #/
    itembundle = getscriptbundle(var_9ba1646c.required_item);
    if (!isdefined(itembundle.unlockableitemref)) {
        return;
    }
    itemindex = getitemindexfromref(itembundle.unlockableitemref);
    if (itemindex == 0) {
        return;
    }
    var_93e871fc = var_9ba1646c.var_3845495;
    switch (var_9ba1646c.var_3845495.size) {
    case 1:
        self luinotifyevent(#"character_unlock_update", var_9ba1646c.var_3845495.size + 2, 0, itemindex, self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[0]]);
        return;
    case 2:
        self luinotifyevent(#"character_unlock_update", var_9ba1646c.var_3845495.size + 2, 0, itemindex, self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[0]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[1]]);
        return;
    case 3:
        self luinotifyevent(#"character_unlock_update", var_9ba1646c.var_3845495.size + 2, 0, itemindex, self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[0]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[1]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[2]]);
        return;
    case 4:
        self luinotifyevent(#"character_unlock_update", var_9ba1646c.var_3845495.size + 2, 0, itemindex, self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[0]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[1]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[2]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[3]]);
        return;
    case 5:
        self luinotifyevent(#"character_unlock_update", var_9ba1646c.var_3845495.size + 2, 0, itemindex, self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[0]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[1]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[2]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[3]], self.var_c53589da[unlock_name].var_e7e238a4[var_93e871fc[4]]);
        return;
    default:
        return;
    }
}

// Namespace character_unlock/character_unlock
// Params 2, eflags: 0x0
// Checksum 0x859a1f1, Offset: 0x1038
// Size: 0xfc
function function_54fc60f5(player, character) {
    if (isdefined(player) && isplayer(player) && isdefined(character)) {
        player_xuid = player getxuid(1);
        if (isdefined(player_xuid)) {
            data = {#character:character, #player_xuid:int(player_xuid), #game_time:function_f8d53445()};
            function_92d1707f(#"hash_17e83c78e2a73ed1", data);
        }
    }
}

// Namespace character_unlock/character_unlock
// Params 0, eflags: 0x0
// Checksum 0xced5c2e8, Offset: 0x1140
// Size: 0x2a8
function function_fb689837() {
    if (!isdefined(self.var_c53589da)) {
        return;
    }
    foreach (unlock_name, var_c5c8fd39 in self.var_c53589da) {
        if (!self function_f0406288(unlock_name)) {
            continue;
        }
        var_b3895a2 = 1;
        foreach (var_1d208aea, var_b7ed23ab in var_c5c8fd39.var_e7e238a4) {
            if (var_1d208aea != #"hash_3f07579f66b464e8" && var_b7ed23ab != 1) {
                var_b3895a2 = 0;
                break;
            }
        }
        if (!var_b3895a2) {
            continue;
        }
        self function_c8beca5e(unlock_name, #"hash_3f07579f66b464e8", 1);
        var_9ba1646c = level.var_7d8da246[unlock_name];
        if (isdefined(var_9ba1646c)) {
            var_2b469a7d = var_9ba1646c.var_2b469a7d;
        }
        if (isdefined(var_2b469a7d)) {
            if (function_d89ef6af(unlock_name)) {
                self stats::set_stat(#"unlockedtags", var_2b469a7d, 1);
            } else {
                self stats::set_stat(#"characters", var_2b469a7d, #"unlocked", 1);
                self stats::function_d40764f3(#"character_quests_completed", 1);
            }
            function_54fc60f5(self, var_2b469a7d);
            var_ade8d0e9 = {#character:var_2b469a7d};
            self callback::callback(#"on_character_unlock", var_ade8d0e9);
        }
    }
}

// Namespace character_unlock/character_unlock
// Params 1, eflags: 0x0
// Checksum 0x587a3808, Offset: 0x13f0
// Size: 0x12c
function on_drop_inventory(player) {
    if (!isplayer(player)) {
        return;
    }
    if (!isdefined(player.var_474dff5e)) {
        player.var_474dff5e = [];
    }
    foreach (unlock_name, var_9ba1646c in level.var_7d8da246) {
        item_name = var_9ba1646c.required_item;
        required_item = player item_inventory::function_7fe4ce88(item_name);
        if (isdefined(required_item)) {
            player.var_474dff5e[unlock_name] = 1;
        }
    }
    if (!isalive(player)) {
        player function_fb689837();
    }
}

// Namespace character_unlock/character_unlock
// Params 0, eflags: 0x0
// Checksum 0x7aae97ee, Offset: 0x1528
// Size: 0x34
function on_player_disconnect() {
    if (!isplayer(self)) {
        return;
    }
    self function_fb689837();
}

// Namespace character_unlock/character_unlock
// Params 0, eflags: 0x0
// Checksum 0x38cf098, Offset: 0x1568
// Size: 0x90
function on_end_game() {
    players = getplayers();
    foreach (player in players) {
        player function_fb689837();
    }
}

// Namespace character_unlock/character_unlock
// Params 3, eflags: 0x0
// Checksum 0xd9dfb244, Offset: 0x1600
// Size: 0x8c
function function_d2294476(var_2ab9d3bd, replacementcount, var_3afaa57b) {
    if (isdefined(getgametypesetting(#"hash_17f17e92c2654659")) && getgametypesetting(#"hash_17f17e92c2654659")) {
        replacementcount = 1;
    }
    namespace_3d2704b3::function_f0297225(var_2ab9d3bd, replacementcount, var_3afaa57b);
}


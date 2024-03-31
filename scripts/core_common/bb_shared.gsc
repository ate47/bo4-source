// Atian COD Tools GSC decompiler test
#using scripts\core_common\callbacks_shared.gsc;

#namespace bb;

// Namespace bb/bb_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xfb638f6b, Offset: 0x70
// Size: 0x64
function init_shared() {
    callback::on_start_gametype(&init);
    callback::on_joined_team(&player_joined_team);
    callback::on_spawned(&on_player_spawned);
}

// Namespace bb/bb_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xe0
// Size: 0x4
function init() {
    
}

// Namespace bb/bb_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xeace06c7, Offset: 0xf0
// Size: 0x86
function on_player_spawned() {
    self._bbdata = [];
    self._bbdata[#"score"] = 0;
    self._bbdata[#"momentum"] = 0;
    self._bbdata[#"spawntime"] = gettime();
    self._bbdata[#"shots"] = 0;
    self._bbdata[#"hits"] = 0;
}

// Namespace bb/bb_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xc0f9c291, Offset: 0x180
// Size: 0x236
function commit_weapon_data(spawnid, currentweapon, time0) {
    if (isbot(self)) {
        return;
    }
    /#
        /#
            assert(isdefined(self._bbdata));
        #/
    #/
    if (!isdefined(self._bbdata)) {
        return;
    }
    time1 = gettime();
    blackboxeventname = #"mpweapons";
    eventname = #"hash_41cc1afc10e99541";
    if (sessionmodeiscampaigngame()) {
        blackboxeventname = #"cpweapons";
        eventname = #"hash_474292d3118817ab";
    } else if (sessionmodeiszombiesgame()) {
        blackboxeventname = #"zmweapons";
        eventname = #"hash_67140d84a7660909";
    } else if (sessionmodeiswarzonegame()) {
        blackboxeventname = #"wzweapons";
        eventname = #"hash_63ec5305e1ef1335";
    }
    event_data = {#spawnid:spawnid, #name:currentweapon.name, #duration:time1 - time0, #shots:self._bbdata[#"shots"], #hits:self._bbdata[#"hits"]};
    function_92d1707f(eventname, blackboxeventname, event_data);
    self._bbdata[#"shots"] = 0;
    self._bbdata[#"hits"] = 0;
}

// Namespace bb/bb_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x8d35305b, Offset: 0x3c0
// Size: 0x72
function add_to_stat(statname, delta) {
    if (isbot(self)) {
        return;
    }
    if (isdefined(self._bbdata) && isdefined(self._bbdata[statname])) {
        self._bbdata[statname] = self._bbdata[statname] + delta;
    }
}

// Namespace bb/bb_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x9c71db45, Offset: 0x440
// Size: 0x44
function function_a7ba460f(reason) {
    function_92d1707f(#"hash_28b295eb3b8e189", {#reason:reason});
}

// Namespace bb/bb_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x4078b50b, Offset: 0x490
// Size: 0x94
function function_afcc007d(name, clientnum, xuid) {
    var_bd8c7087 = int(xuid);
    function_92d1707f(#"hash_3e5070f3289e386c", {#name:name, #clientnum:clientnum, #xuid:var_bd8c7087});
}

// Namespace bb/bb_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x785d6c9b, Offset: 0x530
// Size: 0x94
function function_e0dfa262(name, clientnum, xuid) {
    var_bd8c7087 = int(xuid);
    function_92d1707f(#"hash_557aae9aaddeac22", {#name:name, #clientnum:clientnum, #xuid:var_bd8c7087});
}

// Namespace bb/bb_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd37b290, Offset: 0x5d0
// Size: 0x3a
function player_joined_team(params) {
    if (!isdefined(self.team) || isdefined(self.startingteam)) {
        return;
    }
    self.startingteam = self.team;
}


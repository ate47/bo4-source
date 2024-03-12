// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace util;

// Namespace util/util
// Params 0, eflags: 0x0
// Checksum 0x980990f2, Offset: 0x118
// Size: 0x114
function brush_delete() {
    num = self.v[#"exploder"];
    if (isdefined(self.v[#"delay"])) {
        wait(self.v[#"delay"]);
    } else {
        wait(0.05);
    }
    if (!isdefined(self.model)) {
        return;
    }
    /#
        assert(isdefined(self.model));
    #/
    if (!isdefined(self.v[#"fxid"]) || self.v[#"fxid"] == "No FX") {
        self.v[#"exploder"] = undefined;
    }
    waittillframeend();
    self.model delete();
}

// Namespace util/util
// Params 0, eflags: 0x0
// Checksum 0x6b0bf62d, Offset: 0x238
// Size: 0x8c
function brush_show() {
    if (isdefined(self.v[#"delay"])) {
        wait(self.v[#"delay"]);
    }
    /#
        assert(isdefined(self.model));
    #/
    self.model show();
    self.model solid();
}

// Namespace util/util
// Params 0, eflags: 0x0
// Checksum 0x77acf63a, Offset: 0x2d0
// Size: 0x224
function brush_throw() {
    if (isdefined(self.v[#"delay"])) {
        wait(self.v[#"delay"]);
    }
    ent = undefined;
    if (isdefined(self.v[#"target"])) {
        ent = getent(self.v[#"target"], "targetname");
    }
    if (!isdefined(ent)) {
        self.model delete();
        return;
    }
    self.model show();
    startorg = self.v[#"origin"];
    startang = self.v[#"angles"];
    org = ent.origin;
    temp_vec = org - self.v[#"origin"];
    x = temp_vec[0];
    y = temp_vec[1];
    z = temp_vec[2];
    self.model rotatevelocity((x, y, z), 12);
    self.model movegravity((x, y, z), 12);
    self.v[#"exploder"] = undefined;
    wait(6);
    self.model delete();
}

// Namespace util/util
// Params 2, eflags: 0x1 linked
// Checksum 0x3f4ea379, Offset: 0x500
// Size: 0x17e
function playsoundonplayers(sound, team) {
    /#
        assert(isdefined(level.players));
    #/
    if (level.splitscreen) {
        if (isdefined(level.players[0])) {
            level.players[0] playlocalsound(sound);
        }
        return;
    }
    if (isdefined(team)) {
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == team) {
                player playlocalsound(sound);
            }
        }
        return;
    }
    for (i = 0; i < level.players.size; i++) {
        level.players[i] playlocalsound(sound);
    }
}

// Namespace util/util
// Params 0, eflags: 0x0
// Checksum 0x80afec6d, Offset: 0x688
// Size: 0xa
function get_player_height() {
    return 70;
}

// Namespace util/util
// Params 1, eflags: 0x0
// Checksum 0xe14d56c2, Offset: 0x6a0
// Size: 0x3e
function isbulletimpactmod(smeansofdeath) {
    return issubstr(smeansofdeath, "BULLET") || smeansofdeath == "MOD_HEAD_SHOT";
}

// Namespace util/util
// Params 0, eflags: 0x0
// Checksum 0xb754e01b, Offset: 0x6e8
// Size: 0x4e
function waitrespawnbutton() {
    self endon(#"disconnect", #"end_respawn");
    while (self usebuttonpressed() != 1) {
        waitframe(1);
    }
}

// Namespace util/util
// Params 2, eflags: 0x0
// Checksum 0x9426be9a, Offset: 0x740
// Size: 0xd6
function printonteam(text, team) {
    /#
        assert(isdefined(level.players));
    #/
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == team) {
            player iprintln(text);
        }
    }
}

// Namespace util/util
// Params 2, eflags: 0x0
// Checksum 0x38781a1c, Offset: 0x820
// Size: 0xd6
function printboldonteam(text, team) {
    /#
        assert(isdefined(level.players));
    #/
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == team) {
            player iprintlnbold(text);
        }
    }
}

// Namespace util/util
// Params 3, eflags: 0x0
// Checksum 0xd42ba54e, Offset: 0x900
// Size: 0xe6
function printboldonteamarg(text, team, arg) {
    /#
        assert(isdefined(level.players));
    #/
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == team) {
            player iprintlnbold(text, arg);
        }
    }
}

// Namespace util/util
// Params 3, eflags: 0x0
// Checksum 0x662d9776, Offset: 0x9f0
// Size: 0x1c
function printonteamarg(text, team, arg) {
    
}

// Namespace util/util
// Params 2, eflags: 0x0
// Checksum 0xda1a1433, Offset: 0xa18
// Size: 0xe6
function printonplayers(text, team) {
    players = level.players;
    for (i = 0; i < players.size; i++) {
        if (isdefined(team)) {
            if (isdefined(players[i].pers[#"team"]) && players[i].pers[#"team"] == team) {
                players[i] iprintln(text);
            }
            continue;
        }
        players[i] iprintln(text);
    }
}

// Namespace util/util
// Params 7, eflags: 0x0
// Checksum 0xc6d9277b, Offset: 0xb08
// Size: 0x4fe
function printandsoundoneveryone(team, enemyteam, printfriendly, printenemy, soundfriendly, soundenemy, printarg) {
    shoulddosounds = isdefined(soundfriendly);
    shoulddoenemysounds = 0;
    if (isdefined(soundenemy)) {
        /#
            assert(shoulddosounds);
        #/
        shoulddoenemysounds = 1;
    }
    if (!isdefined(printarg)) {
        printarg = "";
    }
    if (level.splitscreen || !shoulddosounds) {
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            playerteam = player.pers[#"team"];
            if (isdefined(playerteam)) {
                if (playerteam == team && isdefined(printfriendly) && printfriendly != #"") {
                    player iprintln(printfriendly, printarg);
                    continue;
                }
                if (isdefined(printenemy) && printenemy != #"") {
                    if (isdefined(enemyteam) && playerteam == enemyteam) {
                        player iprintln(printenemy, printarg);
                        continue;
                    }
                    if (!isdefined(enemyteam) && playerteam != team) {
                        player iprintln(printenemy, printarg);
                    }
                }
            }
        }
        if (shoulddosounds) {
            /#
                assert(level.splitscreen);
            #/
            level.players[0] playlocalsound(soundfriendly);
        }
        return;
    }
    /#
        assert(shoulddosounds);
    #/
    if (shoulddoenemysounds) {
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            playerteam = player.pers[#"team"];
            if (isdefined(playerteam)) {
                if (playerteam == team) {
                    if (isdefined(printfriendly) && printfriendly != #"") {
                        player iprintln(printfriendly, printarg);
                    }
                    player playlocalsound(soundfriendly);
                    continue;
                }
                if (isdefined(enemyteam) && playerteam == enemyteam || !isdefined(enemyteam) && playerteam != team) {
                    if (isdefined(printenemy) && printenemy != #"") {
                        player iprintln(printenemy, printarg);
                    }
                    player playlocalsound(soundenemy);
                }
            }
        }
        return;
    }
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        playerteam = player.pers[#"team"];
        if (isdefined(playerteam)) {
            if (playerteam == team) {
                if (isdefined(printfriendly) && printfriendly != #"") {
                    player iprintln(printfriendly, printarg);
                }
                player playlocalsound(soundfriendly);
                continue;
            }
            if (isdefined(printenemy) && printenemy != #"") {
                if (isdefined(enemyteam) && playerteam == enemyteam) {
                    player iprintln(printenemy, printarg);
                    continue;
                }
                if (!isdefined(enemyteam) && playerteam != team) {
                    player iprintln(printenemy, printarg);
                }
            }
        }
    }
}

// Namespace util/util
// Params 1, eflags: 0x0
// Checksum 0x2989033, Offset: 0x1010
// Size: 0x4c
function _playlocalsound(soundalias) {
    if (level.splitscreen && !self ishost()) {
        return;
    }
    self playlocalsound(soundalias);
}

// Namespace util/util
// Params 1, eflags: 0x1 linked
// Checksum 0xc4f06fd0, Offset: 0x1068
// Size: 0x8c
function getotherteam(team) {
    if (team == #"allies") {
        return #"axis";
    } else if (team == #"axis") {
        return #"allies";
    } else {
        return #"allies";
    }
    /#
        assertmsg("<unknown string>" + team);
    #/
}

// Namespace util/util
// Params 1, eflags: 0x1 linked
// Checksum 0xd8f79c65, Offset: 0x1100
// Size: 0x74
function getteammask(team) {
    if (!level.teambased || !isdefined(team) || !isdefined(level.spawnsystem.ispawn_teammask[team])) {
        return level.spawnsystem.ispawn_teammask_free;
    }
    return level.spawnsystem.ispawn_teammask[team];
}

// Namespace util/util
// Params 1, eflags: 0x1 linked
// Checksum 0xda2b51c, Offset: 0x1180
// Size: 0xb0
function getotherteamsmask(skip_team) {
    mask = 0;
    foreach (team, _ in level.teams) {
        if (team == skip_team) {
            continue;
        }
        mask = mask | getteammask(team);
    }
    return mask;
}

// Namespace util/util
// Params 1, eflags: 0x0
// Checksum 0x312832a5, Offset: 0x1238
// Size: 0x5c
function getfx(fx) {
    /#
        assert(isdefined(level._effect[fx]), "<unknown string>" + fx + "<unknown string>");
    #/
    return level._effect[fx];
}

// Namespace util/util
// Params 2, eflags: 0x0
// Checksum 0x85dedad4, Offset: 0x12a0
// Size: 0x38
function isstrstart(string1, substr) {
    return getsubstr(string1, 0, substr.size) == substr;
}

// Namespace util/util
// Params 0, eflags: 0x0
// Checksum 0x68846a2d, Offset: 0x12e0
// Size: 0x20
function iskillstreaksenabled() {
    return isdefined(level.killstreaksenabled) && level.killstreaksenabled;
}

// Namespace util/util
// Params 0, eflags: 0x0
// Checksum 0x28e3e234, Offset: 0x1308
// Size: 0x32
function getremotename() {
    /#
        assert(self isusingremote());
    #/
    return self.usingremote;
}

// Namespace util/util
// Params 2, eflags: 0x0
// Checksum 0xb0bc432d, Offset: 0x1348
// Size: 0x3e
function setobjectivetext(team, text) {
    game.strings["objective_" + level.teams[team]] = text;
}

// Namespace util/util
// Params 2, eflags: 0x0
// Checksum 0x9807b345, Offset: 0x1390
// Size: 0x3e
function setobjectivescoretext(team, text) {
    game.strings["objective_score_" + level.teams[team]] = text;
}

// Namespace util/util
// Params 1, eflags: 0x0
// Checksum 0xa52d0cca, Offset: 0x13d8
// Size: 0x2c
function getobjectivetext(team) {
    return game.strings["objective_" + level.teams[team]];
}

// Namespace util/util
// Params 1, eflags: 0x0
// Checksum 0xf0a83c6, Offset: 0x1410
// Size: 0x2c
function getobjectivescoretext(team) {
    return game.strings["objective_score_" + level.teams[team]];
}

// Namespace util/util
// Params 1, eflags: 0x0
// Checksum 0x5753bc4b, Offset: 0x1448
// Size: 0x2c
function getobjectivehinttext(team) {
    return game.strings["objective_hint_" + level.teams[team]];
}

// Namespace util/util
// Params 2, eflags: 0x0
// Checksum 0xe7639935, Offset: 0x1480
// Size: 0x76
function registerroundswitch(minvalue, maxvalue) {
    level.roundswitch = math::clamp(getgametypesetting(#"roundswitch"), minvalue, maxvalue);
    level.roundswitchmin = minvalue;
    level.roundswitchmax = maxvalue;
}

// Namespace util/util
// Params 2, eflags: 0x1 linked
// Checksum 0x98ce0799, Offset: 0x1500
// Size: 0x76
function registerroundlimit(minvalue, maxvalue) {
    level.roundlimit = math::clamp(getgametypesetting(#"roundlimit"), minvalue, maxvalue);
    level.roundlimitmin = minvalue;
    level.roundlimitmax = maxvalue;
}

// Namespace util/util
// Params 2, eflags: 0x1 linked
// Checksum 0x802e31a0, Offset: 0x1580
// Size: 0x76
function registerroundwinlimit(minvalue, maxvalue) {
    level.roundwinlimit = math::clamp(getgametypesetting(#"roundwinlimit"), minvalue, maxvalue);
    level.roundwinlimitmin = minvalue;
    level.roundwinlimitmax = maxvalue;
}

// Namespace util/util
// Params 2, eflags: 0x1 linked
// Checksum 0xcd75b8e3, Offset: 0x1600
// Size: 0x76
function registerscorelimit(minvalue, maxvalue) {
    level.scorelimit = math::clamp(getgametypesetting(#"scorelimit"), minvalue, maxvalue);
    level.scorelimitmin = minvalue;
    level.scorelimitmax = maxvalue;
}

// Namespace util/util
// Params 2, eflags: 0x1 linked
// Checksum 0x781041fc, Offset: 0x1680
// Size: 0x76
function registertimelimit(minvalue, maxvalue) {
    level.timelimit = math::clamp(getgametypesetting(#"timelimit"), minvalue, maxvalue);
    level.timelimitmin = minvalue;
    level.timelimitmax = maxvalue;
}

// Namespace util/util
// Params 2, eflags: 0x1 linked
// Checksum 0x52c195c7, Offset: 0x1700
// Size: 0x76
function registernumlives(minvalue, maxvalue) {
    level.numlives = math::clamp(getgametypesetting(#"playernumlives"), minvalue, maxvalue);
    level.numlivesmin = minvalue;
    level.numlivesmax = maxvalue;
}

// Namespace util/util
// Params 1, eflags: 0x0
// Checksum 0xa844d8aa, Offset: 0x1780
// Size: 0x82
function getplayerfromclientnum(clientnum) {
    if (clientnum < 0) {
        return undefined;
    }
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] getentitynumber() == clientnum) {
            return level.players[i];
        }
    }
    return undefined;
}

// Namespace util/util
// Params 0, eflags: 0x0
// Checksum 0x4d67bc18, Offset: 0x1810
// Size: 0x52
function ispressbuild() {
    buildtype = getdvarstring(#"buildtype");
    if (isdefined(buildtype) && buildtype == "press") {
        return 1;
    }
    return 0;
}

// Namespace util/util
// Params 0, eflags: 0x0
// Checksum 0x9dc6d26b, Offset: 0x1870
// Size: 0x1e
function isflashbanged() {
    return isdefined(self.flashendtime) && gettime() < self.flashendtime;
}

// Namespace util/util
// Params 5, eflags: 0x0
// Checksum 0xfd62208a, Offset: 0x1898
// Size: 0xbc
function domaxdamage(origin, attacker, inflictor, headshot, mod) {
    if (isdefined(self.damagedtodeath) && self.damagedtodeath) {
        return;
    }
    if (isdefined(self.maxhealth)) {
        damage = self.maxhealth + 1;
    } else {
        damage = self.health + 1;
    }
    self.damagedtodeath = 1;
    self dodamage(damage, origin, attacker, inflictor, headshot, mod);
}

// Namespace util/util
// Params 5, eflags: 0x1 linked
// Checksum 0xc864e37e, Offset: 0x1960
// Size: 0x2f0
function get_array_of_closest(org, array, excluders = [], max = array.size, maxdist) {
    maxdists2rd = undefined;
    if (isdefined(maxdist)) {
        maxdists2rd = maxdist * maxdist;
    }
    dist = [];
    index = [];
    for (i = 0; i < array.size; i++) {
        if (!isdefined(array[i])) {
            continue;
        }
        if (isinarray(excluders, array[i])) {
            continue;
        }
        if (isvec(array[i])) {
            length = distancesquared(org, array[i]);
        } else {
            length = distancesquared(org, array[i].origin);
        }
        if (isdefined(maxdists2rd) && maxdists2rd < length) {
            continue;
        }
        dist[dist.size] = length;
        index[index.size] = i;
    }
    for (;;) {
        change = 0;
        for (i = 0; i < dist.size - 1; i++) {
            if (dist[i] <= dist[i + 1]) {
                continue;
            }
            change = 1;
            temp = dist[i];
            dist[i] = dist[i + 1];
            dist[i + 1] = temp;
            temp = index[i];
            index[i] = index[i + 1];
            index[i + 1] = temp;
        }
        if (!change) {
            break;
        }
    }
    newarray = [];
    if (max > dist.size) {
        max = dist.size;
    }
    for (i = 0; i < max; i++) {
        newarray[i] = array[index[i]];
    }
    return newarray;
}


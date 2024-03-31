// Atian COD Tools GSC decompiler test
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\killstreaks\emp_shared.gsc;

#namespace killstreakrules;

// Namespace killstreakrules/killstreakrules_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5864209b, Offset: 0xa0
// Size: 0xae
function init_shared() {
    val::register(#"killstreaksdisabled", 1, "$self", &function_4a433a3f, "$value");
    if (!isdefined(level.var_ef447a73)) {
        level.var_ef447a73 = {};
        level.killstreakrules = [];
        level.killstreaktype = [];
        level.killstreaks_triggered = [];
        level.matchrecorderkillstreakkills = [];
        if (!isdefined(level.globalkillstreakscalled)) {
            level.globalkillstreakscalled = 0;
        }
    }
}

// Namespace killstreakrules/killstreakrules_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x7d255c2e, Offset: 0x158
// Size: 0x24
function function_4a433a3f(value) {
    self function_fe89725a(value);
}

// Namespace killstreakrules/killstreakrules_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x8cccb887, Offset: 0x188
// Size: 0xae
function createrule(rule, maxallowable, maxallowableperteam) {
    level.killstreakrules[rule] = spawnstruct();
    level.killstreakrules[rule].cur = 0;
    level.killstreakrules[rule].curteam = [];
    level.killstreakrules[rule].max = maxallowable;
    level.killstreakrules[rule].maxperteam = maxallowableperteam;
}

// Namespace killstreakrules/killstreakrules_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x5697270c, Offset: 0x240
// Size: 0x174
function addkillstreaktorule(killstreak, rule, counttowards, checkagainst, inventoryvariant) {
    if (!isdefined(level.killstreaktype[killstreak])) {
        level.killstreaktype[killstreak] = [];
    }
    keys = getarraykeys(level.killstreaktype[killstreak]);
    /#
        assert(isdefined(level.killstreakrules[rule]));
    #/
    if (!isdefined(level.killstreaktype[killstreak][rule])) {
        level.killstreaktype[killstreak][rule] = spawnstruct();
    }
    level.killstreaktype[killstreak][rule].counts = counttowards;
    level.killstreaktype[killstreak][rule].checks = checkagainst;
    if (!(isdefined(inventoryvariant) && inventoryvariant)) {
        addkillstreaktorule("inventory_" + killstreak, rule, counttowards, checkagainst, 1);
    }
}

// Namespace killstreakrules/killstreakrules_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x2d87a369, Offset: 0x3c0
// Size: 0x3b8
function killstreakstart(hardpointtype, team, hacked, displayteammessage) {
    /#
        /#
            assert(isdefined(team), "<unknown string>");
        #/
    #/
    if (self iskillstreakallowed(hardpointtype, team) == 0) {
        return -1;
    }
    /#
        assert(isdefined(hardpointtype));
    #/
    if (!isdefined(hacked)) {
        hacked = 0;
    }
    if (!isdefined(displayteammessage)) {
        displayteammessage = 1;
    }
    if (displayteammessage == 1) {
        if (!hacked) {
            self displaykillstreakstartteammessagetoall(hardpointtype);
        }
    }
    keys = getarraykeys(level.killstreaktype[hardpointtype]);
    foreach (key in keys) {
        if (!level.killstreaktype[hardpointtype][key].counts) {
            continue;
        }
        /#
            assert(isdefined(level.killstreakrules[key]));
        #/
        level.killstreakrules[key].cur++;
        if (level.teambased) {
            if (!isdefined(level.killstreakrules[key].curteam[team])) {
                level.killstreakrules[key].curteam[team] = 0;
            }
            level.killstreakrules[key].curteam[team]++;
        }
    }
    level notify(#"killstreak_started", {#hardpoint_type:hardpointtype, #team:team, #attacker:self});
    killstreak_id = level.globalkillstreakscalled;
    level.globalkillstreakscalled++;
    killstreak_data = [];
    killstreak_data[#"caller"] = self getxuid();
    killstreak_data[#"spawnid"] = getplayerspawnid(self);
    killstreak_data[#"starttime"] = gettime();
    killstreak_data[#"type"] = hardpointtype;
    killstreak_data[#"endtime"] = 0;
    level.matchrecorderkillstreakkills[killstreak_id] = 0;
    level.killstreaks_triggered[killstreak_id] = killstreak_data;
    /#
        killstreak_debug_text("<unknown string>" + hardpointtype + "<unknown string>" + team + "<unknown string>" + killstreak_id);
    #/
    return killstreak_id;
}

// Namespace killstreakrules/killstreakrules_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x42bf052d, Offset: 0x780
// Size: 0x5c
function displaykillstreakstartteammessagetoall(hardpointtype) {
    if (isdefined(level.killstreaks[hardpointtype]) && isdefined(level.killstreaks[hardpointtype].var_43279ec9)) {
        level thread popups::displaykillstreakteammessagetoall(hardpointtype, self);
    }
}

// Namespace killstreakrules/killstreakrules_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x8f60b00b, Offset: 0x7e8
// Size: 0x5c
function recordkillstreakenddirect(eventindex, recordstreakindex, totalkills) {
    player = self;
    player recordkillstreakendevent(eventindex, recordstreakindex, totalkills);
    player.killstreakevents[recordstreakindex] = undefined;
}

// Namespace killstreakrules/killstreakrules_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc54441d9, Offset: 0x850
// Size: 0xd6
function recordkillstreakend(recordstreakindex, totalkills) {
    player = self;
    if (!isplayer(player)) {
        return;
    }
    if (!isdefined(totalkills)) {
        totalkills = 0;
    }
    if (!isdefined(player.killstreakevents)) {
        player.killstreakevents = associativearray();
    }
    eventindex = player.killstreakevents[recordstreakindex];
    if (isdefined(eventindex)) {
        player recordkillstreakenddirect(eventindex, recordstreakindex, totalkills);
        return;
    }
    player.killstreakevents[recordstreakindex] = totalkills;
}

// Namespace killstreakrules/killstreakrules_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x38cce0fa, Offset: 0x930
// Size: 0x5a4
function killstreakstop(hardpointtype, team, id) {
    /#
        /#
            assert(isdefined(team), "<unknown string>");
        #/
    #/
    /#
        assert(isdefined(hardpointtype));
    #/
    /#
        idstr = "<unknown string>";
        if (isdefined(id)) {
            idstr = id;
        }
        killstreak_debug_text("<unknown string>" + hardpointtype + "<unknown string>" + team + "<unknown string>" + idstr);
    #/
    keys = getarraykeys(level.killstreaktype[hardpointtype]);
    foreach (key in keys) {
        if (!level.killstreaktype[hardpointtype][key].counts) {
            continue;
        }
        /#
            assert(isdefined(level.killstreakrules[key]));
        #/
        if (isdefined(level.killstreakrules[key].cur)) {
            level.killstreakrules[key].cur--;
        }
        /#
            assert(level.killstreakrules[key].cur >= 0);
        #/
        if (level.teambased) {
            /#
                assert(isdefined(team));
            #/
            /#
                assert(isdefined(level.killstreakrules[key].curteam[team]));
            #/
            if (isdefined(team) && isdefined(level.killstreakrules[key].curteam[team])) {
                level.killstreakrules[key].curteam[team]--;
            }
            /#
                assert(level.killstreakrules[key].curteam[team] >= 0);
            #/
        }
    }
    if (!isdefined(id) || id == -1) {
        /#
            killstreak_debug_text("<unknown string>" + hardpointtype);
        #/
        if (sessionmodeismultiplayergame()) {
            function_92d1707f(#"hash_710b205b26e46446", {#starttime:0, #endtime:gettime(), #name:hardpointtype, #team:team});
        }
        return;
    }
    level.killstreaks_triggered[id][#"endtime"] = gettime();
    totalkillswiththiskillstreak = level.matchrecorderkillstreakkills[id];
    if (sessionmodeismultiplayergame()) {
        mpkillstreakuses = {#starttime:level.killstreaks_triggered[id][#"starttime"], #endtime:level.killstreaks_triggered[id][#"endtime"], #spawnid:level.killstreaks_triggered[id][#"spawnid"], #name:hardpointtype, #team:team};
        function_92d1707f(#"hash_710b205b26e46446", mpkillstreakuses);
    }
    level.killstreaks_triggered[id] = undefined;
    level.matchrecorderkillstreakkills[id] = undefined;
    if (isdefined(level.killstreaks[hardpointtype].menuname)) {
        recordstreakindex = level.killstreakindices[level.killstreaks[hardpointtype].menuname];
        if (isdefined(self) && isdefined(recordstreakindex) && (!isdefined(self.activatingkillstreak) || !self.activatingkillstreak)) {
            entity = self;
            if (isdefined(entity.owner)) {
                entity = entity.owner;
            }
            entity recordkillstreakend(recordstreakindex, totalkillswiththiskillstreak);
        }
    }
}

// Namespace killstreakrules/killstreakrules_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x3deb3a7f, Offset: 0xee0
// Size: 0x448
function iskillstreakallowed(hardpointtype, team, var_1d8339ae) {
    if (level.var_7aa0d894 === 1) {
        return 0;
    }
    /#
        /#
            assert(isdefined(team), "<unknown string>");
        #/
    #/
    /#
        assert(isdefined(hardpointtype));
    #/
    isallowed = 1;
    keys = getarraykeys(level.killstreaktype[hardpointtype]);
    foreach (key in keys) {
        if (!level.killstreaktype[hardpointtype][key].checks) {
            continue;
        }
        if (level.killstreakrules[key].max != 0) {
            if (level.killstreakrules[key].cur >= level.killstreakrules[key].max) {
                /#
                    killstreak_debug_text("<unknown string>" + key + "<unknown string>");
                #/
                isallowed = 0;
                break;
            }
        }
        if (level.teambased && level.killstreakrules[key].maxperteam != 0) {
            if (!isdefined(level.killstreakrules[key].curteam[team])) {
                level.killstreakrules[key].curteam[team] = 0;
            }
            if (level.killstreakrules[key].curteam[team] >= level.killstreakrules[key].maxperteam) {
                isallowed = 0;
                /#
                    killstreak_debug_text("<unknown string>" + key + "<unknown string>");
                #/
                break;
            }
        }
    }
    if (isdefined(self.laststand) && self.laststand) {
        /#
            killstreak_debug_text("<unknown string>");
        #/
        isallowed = 0;
    }
    isemped = 0;
    if (self isempjammed()) {
        /#
            killstreak_debug_text("<unknown string>");
        #/
        isallowed = 0;
        isemped = 1;
        if (self emp::enemyempactive()) {
            if (isdefined(level.empendtime)) {
                secondsleft = int(float(level.empendtime - gettime()) / 1000);
                if (secondsleft > 0) {
                    self iprintlnbold(#"hash_2ce2d6e10e74ed97", secondsleft);
                    return 0;
                }
            }
        }
    }
    if (isdefined(level.var_7b151daa) && [[ level.var_7b151daa ]](self)) {
        /#
            killstreak_debug_text("<unknown string>");
        #/
        isallowed = 0;
    }
    if (!(isdefined(var_1d8339ae) && var_1d8339ae)) {
        if (isallowed == 0) {
            if (isdefined(level.var_956bde25)) {
                self [[ level.var_956bde25 ]](hardpointtype, team, isemped);
            }
        }
    }
    return isallowed;
}

// Namespace killstreakrules/killstreakrules_shared
// Params 1, eflags: 0x0
// Checksum 0x9a7f35f6, Offset: 0x1330
// Size: 0xcc
function killstreak_debug_text(text) {
    /#
        level.killstreak_rule_debug = getdvarint(#"scr_killstreak_rule_debug", 0);
        if (isdefined(level.killstreak_rule_debug)) {
            if (level.killstreak_rule_debug == 1) {
                iprintln("<unknown string>" + text + "<unknown string>");
                return;
            }
            if (level.killstreak_rule_debug == 2) {
                iprintlnbold("<unknown string>" + text);
            }
        }
    #/
}


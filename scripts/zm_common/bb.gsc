// Atian COD Tools GSC decompiler test
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace bb;

// Namespace bb/bb
// Params 0, eflags: 0x2
// Checksum 0xf4329ba1, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"bb", &__init__, undefined, undefined);
}

// Namespace bb/bb
// Params 0, eflags: 0x1 linked
// Checksum 0x40798d8d, Offset: 0xe8
// Size: 0x14
function __init__() {
    init_shared();
}

// Namespace bb/bb
// Params 8, eflags: 0x1 linked
// Checksum 0xee4ae9e7, Offset: 0x108
// Size: 0x44
function logdamage(attacker, victim, weapon, damage, damagetype, hitlocation, victimkilled, victimdowned) {
    
}

// Namespace bb/bb
// Params 2, eflags: 0x1 linked
// Checksum 0x318f46c2, Offset: 0x158
// Size: 0x14
function logaispawn(aient, spawner) {
    
}

// Namespace bb/bb
// Params 2, eflags: 0x1 linked
// Checksum 0xe68f87de, Offset: 0x178
// Size: 0x23c
function logplayerevent(player, eventname) {
    currentweapon = "";
    beastmodeactive = 0;
    if (isdefined(player.currentweapon)) {
        currentweapon = player.currentweapon.name;
    }
    if (isdefined(player.beastmode)) {
        beastmodeactive = player.beastmode;
    }
    zmplayerevents = {};
    zmplayerevents.gametime = function_f8d53445();
    zmplayerevents.roundnumber = level.round_number;
    zmplayerevents.eventname = eventname;
    zmplayerevents.spawnid = getplayerspawnid(player);
    zmplayerevents.username = player.name;
    zmplayerevents.originx = player.origin[0];
    zmplayerevents.originy = player.origin[1];
    zmplayerevents.originz = player.origin[2];
    zmplayerevents.health = player.health;
    zmplayerevents.beastlives = player.beastlives;
    zmplayerevents.currentweapon = currentweapon;
    zmplayerevents.kills = player.kills;
    zmplayerevents.zone_name = player.zone_name;
    zmplayerevents.sessionstate = player.sessionstate;
    zmplayerevents.currentscore = player.score;
    zmplayerevents.totalscore = player.score_total;
    zmplayerevents.beastmodeon = beastmodeactive;
    function_92d1707f(#"hash_5bd2a2e3f75111c8", zmplayerevents);
}

// Namespace bb/bb
// Params 1, eflags: 0x1 linked
// Checksum 0x655366ba, Offset: 0x3c0
// Size: 0x118
function logroundevent(eventname) {
    zmroundevents = {#eventname:eventname, #roundnumber:level.round_number, #gametime:function_f8d53445()};
    function_92d1707f(#"hash_1f42d237e3407165", zmroundevents);
    if (isdefined(level.players)) {
        foreach (player in level.players) {
            logplayerevent(player, eventname);
        }
    }
}

// Namespace bb/bb
// Params 7, eflags: 0x1 linked
// Checksum 0xd600a792, Offset: 0x4e0
// Size: 0x22c
function logpurchaseevent(player, sellerent, cost, itemname, itemupgraded, itemtype, eventname) {
    zmpurchases = {};
    zmpurchases.gametime = function_f8d53445();
    zmpurchases.roundnumber = level.round_number;
    zmpurchases.playerspawnid = getplayerspawnid(player);
    zmpurchases.username = player.name;
    zmpurchases.itemname = itemname;
    zmpurchases.isupgraded = itemupgraded;
    zmpurchases.itemtype = itemtype;
    zmpurchases.purchasecost = cost;
    zmpurchases.playeroriginx = player.origin[0];
    zmpurchases.playeroriginy = player.origin[1];
    zmpurchases.playeroriginz = player.origin[2];
    zmpurchases.selleroriginx = sellerent.origin[0];
    zmpurchases.selleroriginy = sellerent.origin[1];
    zmpurchases.selleroriginz = sellerent.origin[2];
    zmpurchases.playerkills = player.kills;
    zmpurchases.playerhealth = player.health;
    zmpurchases.playercurrentscore = player.score;
    zmpurchases.playertotalscore = player.score_total;
    zmpurchases.zone_name = player.zone_name;
    function_92d1707f(#"hash_22cb254982ca97dc", zmpurchases);
}

// Namespace bb/bb
// Params 3, eflags: 0x1 linked
// Checksum 0x553619a, Offset: 0x718
// Size: 0x218
function logpowerupevent(powerup, optplayer, eventname) {
    playerspawnid = -1;
    playername = "";
    if (isdefined(optplayer) && isplayer(optplayer)) {
        playerspawnid = getplayerspawnid(optplayer);
        playername = optplayer.name;
    }
    zmpowerups = {};
    zmpowerups.gametime = function_f8d53445();
    zmpowerups.roundnumber = level.round_number;
    zmpowerups.powerupname = powerup.powerup_name;
    zmpowerups.powerupx = powerup.origin[0];
    zmpowerups.powerupy = powerup.origin[1];
    zmpowerups.powerupz = powerup.origin[2];
    zmpowerups.eventname = eventname;
    zmpowerups.playerspawnid = playerspawnid;
    zmpowerups.playername = playername;
    function_92d1707f(#"hash_7edbd2a2dee992e9", zmpowerups);
    foreach (player in level.players) {
        logplayerevent(player, "powerup_" + powerup.powerup_name + "_" + eventname);
    }
}


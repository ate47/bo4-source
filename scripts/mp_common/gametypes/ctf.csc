// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\shoutcaster.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace ctf;

// Namespace ctf/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xa5143e0a, Offset: 0x1e0
// Size: 0x2f4
function event_handler[gametype_init] main(eventstruct) {
    callback::on_localclient_connect(&on_localclient_connect);
    clientfield::register("scriptmover", "ctf_flag_away", 17000, 1, "int", &setctfaway, 0, 0);
    clientfield::register("allplayers", "ctf_flag_carried", 17000, 1, "int", &function_4db33d0, 0, 1);
    clientfield::register("worlduimodel", "CTFLevelInfo.bestTimeAllies", 17000, 9, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "CTFLevelInfo.bestTimeAxis", 17000, 9, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "CTFLevelInfo.flagCarrierAllies", 17000, 7, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "CTFLevelInfo.flagCarrierAxis", 17000, 7, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "CTFLevelInfo.flagStateAllies", 17000, 2, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "CTFLevelInfo.flagStateAxis", 17000, 2, "int", undefined, 0, 0);
    clientfield::register("worlduimodel", "ctf_reset_score", 17000, 1, "int", &ctf_reset_score, 0, 0);
    forcestreamxmodel(#"p8_mp_flag_pole_1_blackops", 8, -1);
    forcestreamxmodel(#"hash_5569a00a8fe22d03", 8, -1);
    forcestreamxmodel(#"p8_mp_flag_pole_1_mercs", 8, -1);
    forcestreamxmodel(#"hash_62818f90d175c02c", 8, -1);
}

// Namespace ctf/ctf
// Params 7, eflags: 0x0
// Checksum 0xb4a22b5d, Offset: 0x4e0
// Size: 0xf4
function ctf_reset_score(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    gamescoremodel = getuimodel(getuimodelforcontroller(localclientnum), "GameScore");
    playerscoremodel = getuimodel(gamescoremodel, "playerScore");
    enemyscoremodel = getuimodel(gamescoremodel, "enemyScore");
    setuimodelvalue(playerscoremodel, 0);
    setuimodelvalue(enemyscoremodel, 0);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x859dccb0, Offset: 0x5e0
// Size: 0xac
function on_localclient_connect(localclientnum) {
    level.var_8b7ba196[localclientnum] = util::getnextobjid(localclientnum);
    objective_add(localclientnum, level.var_8b7ba196[localclientnum], "invisible", #"flag_taken", (0, 0, 0), util::get_other_team(function_9b3f0ed1(localclientnum)));
    level thread function_27ecd662(localclientnum);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x89e443de, Offset: 0x698
// Size: 0x21e
function function_27ecd662(localclientnum) {
    player = function_27673a7(localclientnum);
    player endon(#"disconnect");
    while (1) {
        enemies = getplayers(localclientnum);
        player = function_27673a7(localclientnum);
        var_3b68ee3f = undefined;
        foreach (enemy in enemies) {
            if (enemy.team == player.team) {
                continue;
            }
            if (isdefined(enemy.var_b0256c7b) && enemy.var_b0256c7b) {
                var_3b68ee3f = enemy.origin;
                break;
            }
        }
        if (isdefined(var_3b68ee3f)) {
            var_b13a6419 = gettime();
            objective_setstate(localclientnum, level.var_8b7ba196[localclientnum], "active");
            objective_setposition(localclientnum, level.var_8b7ba196[localclientnum], var_3b68ee3f);
            while (var_b13a6419 + 2000 > gettime() && isdefined(enemy) && enemy.var_b0256c7b) {
                waitframe(1);
            }
        } else {
            objective_setstate(localclientnum, level.var_8b7ba196[localclientnum], "invisible");
            waitframe(1);
        }
    }
}

// Namespace ctf/ctf
// Params 7, eflags: 0x0
// Checksum 0x14eba08c, Offset: 0x8c0
// Size: 0x84
function setctfaway(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    team = self.team;
    setflagasaway(localclientnum, team, newval);
    self thread clearctfaway(localclientnum, team);
}

// Namespace ctf/ctf
// Params 2, eflags: 0x0
// Checksum 0xff96442f, Offset: 0x950
// Size: 0x44
function clearctfaway(localclientnum, team) {
    self waittill(#"death");
    setflagasaway(localclientnum, team, 0);
}

// Namespace ctf/ctf
// Params 7, eflags: 0x0
// Checksum 0x4bff13c1, Offset: 0x9a0
// Size: 0x4a
function function_4db33d0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.var_b0256c7b = newval;
}


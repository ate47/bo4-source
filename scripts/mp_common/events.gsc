// Atian COD Tools GSC decompiler test
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace events;

// Namespace events/events
// Params 3, eflags: 0x0
// Checksum 0x3195c866, Offset: 0x78
// Size: 0x6c
function add_timed_event(seconds, notify_string, client_notify_string) {
    /#
        assert(seconds >= 0);
    #/
    if (level.timelimit > 0) {
        level thread timed_event_monitor(seconds, notify_string, client_notify_string);
    }
}

// Namespace events/events
// Params 3, eflags: 0x0
// Checksum 0xa996d7da, Offset: 0xf0
// Size: 0xaa
function timed_event_monitor(seconds, notify_string, client_notify_string) {
    for (;;) {
        wait(0.5);
        if (!isdefined(level.starttime)) {
            continue;
        }
        millisecs_remaining = globallogic_utils::gettimeremaining();
        seconds_remaining = float(millisecs_remaining) / 1000;
        if (seconds_remaining <= seconds) {
            event_notify(notify_string, client_notify_string);
            return;
        }
    }
}

// Namespace events/events
// Params 3, eflags: 0x0
// Checksum 0x54d97af9, Offset: 0x1a8
// Size: 0xa4
function add_score_event(score, notify_string, client_notify_string) {
    /#
        assert(score >= 0);
    #/
    if (level.scorelimit > 0) {
        if (level.teambased) {
            level thread score_team_event_monitor(score, notify_string, client_notify_string);
            return;
        }
        level thread score_event_monitor(score, notify_string, client_notify_string);
    }
}

// Namespace events/events
// Params 3, eflags: 0x0
// Checksum 0xa66af531, Offset: 0x258
// Size: 0xc4
function add_round_score_event(score, notify_string, client_notify_string) {
    /#
        assert(score >= 0);
    #/
    if (level.roundscorelimit > 0) {
        roundscoretobeat = level.roundscorelimit * game.roundsplayed + score;
        if (level.teambased) {
            level thread score_team_event_monitor(roundscoretobeat, notify_string, client_notify_string);
            return;
        }
        level thread score_event_monitor(roundscoretobeat, notify_string, client_notify_string);
    }
}

// Namespace events/events
// Params 1, eflags: 0x0
// Checksum 0x36486e56, Offset: 0x328
// Size: 0x9c
function any_team_reach_score(score) {
    foreach (team, _ in level.teams) {
        if (game.stat[#"teamscores"][team] >= score) {
            return true;
        }
    }
    return false;
}

// Namespace events/events
// Params 3, eflags: 0x0
// Checksum 0xcc9ba8a8, Offset: 0x3d0
// Size: 0x5a
function score_team_event_monitor(score, notify_string, client_notify_string) {
    for (;;) {
        wait(0.5);
        if (any_team_reach_score(score)) {
            event_notify(notify_string, client_notify_string);
            return;
        }
    }
}

// Namespace events/events
// Params 3, eflags: 0x0
// Checksum 0x826bc43f, Offset: 0x438
// Size: 0xb4
function score_event_monitor(score, notify_string, client_notify_string) {
    for (;;) {
        wait(0.5);
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            if (isdefined(players[i].score) && players[i].score >= score) {
                event_notify(notify_string, client_notify_string);
                return;
            }
        }
    }
}

// Namespace events/events
// Params 2, eflags: 0x0
// Checksum 0x972e85c5, Offset: 0x4f8
// Size: 0x44
function event_notify(notify_string, client_notify_string) {
    if (isdefined(notify_string)) {
        level notify(notify_string);
    }
    if (isdefined(client_notify_string)) {
        util::clientnotify(client_notify_string);
    }
}


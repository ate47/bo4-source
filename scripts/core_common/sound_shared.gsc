// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.gsc;

#namespace sound;

// Namespace sound/sound_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x6717a610, Offset: 0xa0
// Size: 0x94
function loop_fx_sound(alias, origin, ender) {
    org = spawn("script_origin", (0, 0, 0));
    if (isdefined(ender)) {
        thread loop_delete(ender, org);
        self endon(ender);
    }
    org.origin = origin;
    org playloopsound(alias);
}

// Namespace sound/sound_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x82f719f8, Offset: 0x140
// Size: 0x4c
function loop_delete(ender, ent) {
    ent endon(#"death");
    self waittill(ender);
    ent delete();
}

// Namespace sound/sound_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x9e5649d0, Offset: 0x198
// Size: 0xc4
function play_in_space(alias, origin, master) {
    org = spawn("script_origin", (0, 0, 1));
    if (!isdefined(origin)) {
        origin = self.origin;
    }
    org.origin = origin;
    org playsoundwithnotify(alias, "sounddone");
    org waittill(#"sounddone");
    if (isdefined(org)) {
        org delete();
    }
}

// Namespace sound/sound_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x3014f258, Offset: 0x268
// Size: 0x154
function loop_on_tag(alias, tag, bstopsoundondeath) {
    org = spawn("script_origin", (0, 0, 0));
    org endon(#"death");
    if (!isdefined(bstopsoundondeath)) {
        bstopsoundondeath = 1;
    }
    if (bstopsoundondeath) {
        thread util::delete_on_death(org);
    }
    if (isdefined(tag)) {
        org linkto(self, tag, (0, 0, 0), (0, 0, 0));
    } else {
        org.origin = self.origin;
        org.angles = self.angles;
        org linkto(self);
    }
    org playloopsound(alias);
    self waittill("stop sound" + alias);
    org stoploopsound(alias);
    org delete();
}

// Namespace sound/sound_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xe7f6addb, Offset: 0x3c8
// Size: 0x19c
function play_on_tag(alias, tag, ends_on_death) {
    org = spawn("script_origin", (0, 0, 0));
    org endon(#"death");
    thread delete_on_death_wait(org, "sounddone");
    if (isdefined(tag)) {
        org.origin = self gettagorigin(tag);
        org linkto(self, tag, (0, 0, 0), (0, 0, 0));
    } else {
        org.origin = self.origin;
        org.angles = self.angles;
        org linkto(self);
    }
    org playsoundwithnotify(alias, "sounddone");
    if (isdefined(ends_on_death)) {
        /#
            assert(ends_on_death, "<unknown string>");
        #/
        wait_for_sounddone_or_death(org);
        waitframe(1);
    } else {
        org waittill(#"sounddone");
    }
    org delete();
}

// Namespace sound/sound_shared
// Params 1, eflags: 0x0
// Checksum 0x731142e, Offset: 0x570
// Size: 0x24
function play_on_entity(alias) {
    play_on_tag(alias);
}

// Namespace sound/sound_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa5b9f5d, Offset: 0x5a0
// Size: 0x34
function wait_for_sounddone_or_death(org) {
    self endon(#"death");
    org waittill(#"sounddone");
}

// Namespace sound/sound_shared
// Params 1, eflags: 0x0
// Checksum 0x6ee192c8, Offset: 0x5e0
// Size: 0x20
function stop_loop_on_entity(alias) {
    self notify("stop sound" + alias);
}

// Namespace sound/sound_shared
// Params 2, eflags: 0x0
// Checksum 0x7e39a716, Offset: 0x608
// Size: 0x14c
function loop_on_entity(alias, offset) {
    org = spawn("script_origin", (0, 0, 0));
    org endon(#"death");
    thread util::delete_on_death(org);
    if (isdefined(offset)) {
        org.origin = self.origin + offset;
        org.angles = self.angles;
        org linkto(self);
    } else {
        org.origin = self.origin;
        org.angles = self.angles;
        org linkto(self);
    }
    org playloopsound(alias);
    self waittill("stop sound" + alias);
    org stoploopsound(0.1);
    org delete();
}

// Namespace sound/sound_shared
// Params 3, eflags: 0x0
// Checksum 0x3ab53778, Offset: 0x760
// Size: 0xc4
function loop_in_space(alias, origin, ender) {
    org = spawn("script_origin", (0, 0, 1));
    if (!isdefined(origin)) {
        origin = self.origin;
    }
    org.origin = origin;
    org playloopsound(alias);
    level waittill(ender);
    org stoploopsound();
    wait(0.1);
    org delete();
}

// Namespace sound/sound_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x16912007, Offset: 0x830
// Size: 0x5c
function delete_on_death_wait(ent, sounddone) {
    ent endon(#"death");
    self waittill(#"death");
    if (isdefined(ent)) {
        ent delete();
    }
}

// Namespace sound/sound_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xef994a01, Offset: 0x898
// Size: 0x17e
function play_on_players(sound, team) {
    /#
        assert(isdefined(level.players));
    #/
    if (level.splitscreen) {
        if (isdefined(level.players[0])) {
            level.players[0] playlocalsound(sound);
        }
    } else if (isdefined(team)) {
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == team) {
                player playlocalsound(sound);
            }
        }
    } else {
        for (i = 0; i < level.players.size; i++) {
            level.players[i] playlocalsound(sound);
        }
    }
}


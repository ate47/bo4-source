// Atian COD Tools GSC decompiler test
#include scripts/core_common/math_shared.gsc;

#namespace face;

// Namespace face/face
// Params 1, eflags: 0x0
// Checksum 0x29d674dd, Offset: 0x108
// Size: 0x144
function saygenericdialogue(typestring) {
    if (level.var_3e4a3623) {
        return;
    }
    switch (typestring) {
    case #"attack":
        var_5e9ce5ea = 0.5;
        break;
    case #"swing":
        var_5e9ce5ea = 0.5;
        typestring = "attack";
        break;
    case #"flashbang":
        var_5e9ce5ea = 0.7;
        break;
    case #"pain_small":
        var_5e9ce5ea = 0.4;
        break;
    case #"pain_bullet":
        wait(0.01);
        var_5e9ce5ea = 0.4;
        break;
    default:
        /#
            println("<unknown string>" + typestring);
        #/
        var_5e9ce5ea = 0.3;
        break;
    }
    saygenericdialoguewithimportance(typestring, var_5e9ce5ea);
}

// Namespace face/face
// Params 2, eflags: 0x1 linked
// Checksum 0xcaef3e10, Offset: 0x258
// Size: 0xb4
function saygenericdialoguewithimportance(typestring, var_5e9ce5ea) {
    soundalias = "dds_";
    if (isdefined(self.var_abab1ada)) {
        soundalias = soundalias + self.var_abab1ada;
    } else {
        /#
            println("<unknown string>");
        #/
        return;
    }
    soundalias = soundalias + "_" + typestring;
    if (soundexists(soundalias)) {
        self thread playfacethread(undefined, soundalias, var_5e9ce5ea);
    }
}

// Namespace face/face
// Params 1, eflags: 0x0
// Checksum 0xab2e56fd, Offset: 0x318
// Size: 0x1e
function setidlefacedelayed(var_abbb6232) {
    self.a.var_d73ad012 = var_abbb6232;
}

// Namespace face/face
// Params 1, eflags: 0x0
// Checksum 0xb91afa6d, Offset: 0x340
// Size: 0x44
function setidleface(var_abbb6232) {
    if (!anim.var_e6865324) {
        return;
    }
    self.a.var_d73ad012 = var_abbb6232;
    self playidleface();
}

// Namespace face/face
// Params 7, eflags: 0x0
// Checksum 0xb9a0d28f, Offset: 0x390
// Size: 0x6c
function sayspecificdialogue(facialanim, soundalias, var_5e9ce5ea, notifystring, var_484baed, timetowait, var_5249775f) {
    self thread playfacethread(facialanim, soundalias, var_5e9ce5ea, notifystring, var_484baed, timetowait, var_5249775f);
}

// Namespace face/face
// Params 0, eflags: 0x1 linked
// Checksum 0xb620a197, Offset: 0x408
// Size: 0x4
function playidleface() {
    
}

// Namespace face/face
// Params 7, eflags: 0x1 linked
// Checksum 0x9f881ce9, Offset: 0x418
// Size: 0x6fe
function playfacethread(facialanim, var_ec28e1e6, var_5e9ce5ea, notifystring, var_484baed, timetowait, var_5249775f) {
    self endon(#"death");
    if (!isdefined(var_ec28e1e6)) {
        wait(1);
        self notify(notifystring);
        return;
    }
    var_bf0d6a74 = var_ec28e1e6;
    if (!isdefined(level.var_51fbd9f0)) {
        level.var_51fbd9f0 = 0;
    }
    if (!isdefined(level.var_658dab08)) {
        level.var_658dab08 = 0;
    }
    if (!isdefined(notifystring)) {
        notifystring = "PlayFaceThread " + var_ec28e1e6;
    }
    if (!isdefined(self.a)) {
        self.a = spawnstruct();
    }
    if (!isdefined(self.a.var_fd4758db)) {
        self.a.var_fd4758db = 1;
    }
    if (!isdefined(self.istalking)) {
        self.istalking = 0;
    }
    if (self.istalking) {
        if (isdefined(self.a.var_76aa846e)) {
            if (var_5e9ce5ea < self.a.var_76aa846e) {
                wait(1);
                self notify(notifystring);
                return;
            } else if (var_5e9ce5ea == self.a.var_76aa846e) {
                if (self.a.var_1f781c9f == var_ec28e1e6) {
                    return;
                }
                /#
                    println("<unknown string>" + self.a.var_1f781c9f + "<unknown string>" + var_ec28e1e6);
                #/
                while (self.istalking) {
                    self waittill(#"done speaking");
                }
            }
        } else {
            /#
                println("<unknown string>" + self.a.var_1f781c9f + "<unknown string>" + var_ec28e1e6);
            #/
            self stopsound(self.a.var_1f781c9f);
            self notify(#"cancel speaking");
            while (self.istalking) {
                self waittill(#"done speaking");
            }
        }
    }
    /#
        assert(self.a.var_fd4758db);
    #/
    /#
        assert(self.a.var_1f781c9f == undefined);
    #/
    /#
        assert(self.a.var_610ae4e7 == undefined);
    #/
    /#
        assert(self.a.var_76aa846e == undefined);
    #/
    /#
        assert(!self.istalking);
    #/
    self notify(#"bc_interrupt");
    self.istalking = 1;
    self.a.var_fd4758db = 0;
    self.a.var_610ae4e7 = notifystring;
    self.a.var_1f781c9f = var_ec28e1e6;
    self.a.var_76aa846e = var_5e9ce5ea;
    if (var_5e9ce5ea == 1) {
        level.var_51fbd9f0 = level.var_51fbd9f0 + 1;
    }
    /#
        if (level.var_51fbd9f0 > 1) {
            println("<unknown string>" + var_ec28e1e6);
        }
    #/
    var_f2cca3b3 = notifystring + " " + level.var_658dab08;
    level.var_658dab08 = level.var_658dab08 + 1;
    if (isdefined(level.scr_sound) && isdefined(level.scr_sound[#"generic"])) {
        var_62b02f85 = level.scr_sound[#"generic"][var_ec28e1e6];
    }
    if (!isdefined(var_62b02f85) && soundexists(var_ec28e1e6)) {
        var_62b02f85 = var_ec28e1e6;
    }
    if (isdefined(var_62b02f85)) {
        if (soundexists(var_62b02f85)) {
            if (isdefined(var_5249775f)) {
                self thread _play_sound_to_player_with_notify(var_62b02f85, var_5249775f, var_f2cca3b3);
            } else if (isdefined(self gettagorigin("J_Head"))) {
                self playsoundwithnotify(var_62b02f85, var_f2cca3b3, "J_Head");
            } else {
                self playsoundwithnotify(var_62b02f85, var_f2cca3b3);
            }
        } else {
            /#
                println("<unknown string>" + var_ec28e1e6 + "<unknown string>");
                self thread _missing_dialog(var_ec28e1e6, var_62b02f85, var_f2cca3b3);
            #/
        }
    } else {
        self thread _temp_dialog(var_ec28e1e6, var_f2cca3b3);
    }
    self waittill(#"death", #"cancel speaking", var_f2cca3b3);
    if (var_5e9ce5ea == 1) {
        level.var_51fbd9f0 = level.var_51fbd9f0 - 1;
        level.var_5f8ccfc6 = gettime();
    }
    if (isdefined(self)) {
        self.istalking = 0;
        self.a.var_fd4758db = 1;
        self.a.var_610ae4e7 = undefined;
        self.a.var_1f781c9f = undefined;
        self.a.var_76aa846e = undefined;
        self.var_5339141b = gettime();
    }
    self notify(#"done speaking", {#var_42a7972a:var_bf0d6a74});
    self notify(notifystring);
}

// Namespace face/face
// Params 3, eflags: 0x1 linked
// Checksum 0x8d79f8ba, Offset: 0xb20
// Size: 0xfc
function _play_sound_to_player_with_notify(soundalias, var_5249775f, var_f2cca3b3) {
    self endon(#"death");
    if (isplayer(var_5249775f)) {
        var_5249775f endon(#"death");
        self playsoundtoplayer(soundalias, var_5249775f);
    } else if (isstring(var_5249775f)) {
        self playsoundtoteam(soundalias, var_5249775f);
    }
    var_5c3d2c04 = soundgetplaybacktime(soundalias);
    if (var_5c3d2c04 > 0) {
        wait(var_5c3d2c04 * 0.001);
    } else {
        wait(1);
    }
    self notify(var_f2cca3b3);
}

// Namespace face/face
// Params 3, eflags: 0x5 linked
// Checksum 0xc3e7d4ed, Offset: 0xc28
// Size: 0x33c
function private _temp_dialog(str_line, var_f2cca3b3, var_8f0541b2 = 0) {
    setdvar(#"bgcache_disablewarninghints", 1);
    if (!var_8f0541b2 && isdefined(self.propername)) {
        str_line = self.propername + ": " + str_line;
    }
    foreach (player in level.players) {
        if (!isdefined(player getluimenu("TempDialog"))) {
            player openluimenu("TempDialog");
        }
        player setluimenudata(player getluimenu("TempDialog"), #"dialogtext", str_line);
        if (var_8f0541b2) {
            player setluimenudata(player getluimenu("TempDialog"), #"title", "MISSING VO SOUND");
        } else {
            player setluimenudata(player getluimenu("TempDialog"), #"title", "TEMP VO");
        }
    }
    n_wait_time = (strtok(str_line, " ").size - 1) / 2;
    n_wait_time = math::clamp(n_wait_time, 2, 5);
    self waittilltimeout(n_wait_time, #"death", #"cancel speaking");
    foreach (player in level.players) {
        if (isdefined(player getluimenu("TempDialog"))) {
            player closeluimenu(player getluimenu("TempDialog"));
        }
    }
    setdvar(#"bgcache_disablewarninghints", 0);
    self notify(var_f2cca3b3);
}

// Namespace face/face
// Params 3, eflags: 0x4
// Checksum 0xb8554e4c, Offset: 0xf70
// Size: 0x54
function private _missing_dialog(var_ec28e1e6, var_62b02f85, var_f2cca3b3) {
    _temp_dialog("script id: " + var_ec28e1e6 + " sound alias: " + var_62b02f85, var_f2cca3b3, 1);
}

// Namespace face/face
// Params 3, eflags: 0x0
// Checksum 0x62164a60, Offset: 0xfd0
// Size: 0x5a
function playface_waitfornotify(var_e452e029, notifystring, killmestring) {
    self endon(#"death", killmestring);
    self waittill(var_e452e029);
    self.a.var_3efda316 = "notify";
    self notify(notifystring);
}

// Namespace face/face
// Params 3, eflags: 0x0
// Checksum 0x8d0ce4c9, Offset: 0x1038
// Size: 0x56
function playface_waitfortime(time, notifystring, killmestring) {
    self endon(#"death", killmestring);
    wait(time);
    self.a.var_3efda316 = "time";
    self notify(notifystring);
}


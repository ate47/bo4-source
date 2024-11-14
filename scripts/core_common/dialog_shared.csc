#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;

#namespace dialog_shared;

// Namespace dialog_shared/dialog_shared
// Params 0, eflags: 0x2
// Checksum 0xf531ac2, Offset: 0x2a8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"dialog_shared", &__init__, undefined, undefined);
}

// Namespace dialog_shared/dialog_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x272e127e, Offset: 0x2f0
// Size: 0x2c4
function __init__() {
    level.mpboostresponse = [];
    level.mpboostresponse[#"battery"] = "Battery";
    level.mpboostresponse[#"buffassault"] = "BuffAssault";
    level.mpboostresponse[#"engineer"] = "Engineer";
    level.mpboostresponse[#"firebreak"] = "Firebreak";
    level.mpboostresponse[#"nomad"] = "Nomad";
    level.mpboostresponse[#"prophet"] = "Prophet";
    level.mpboostresponse[#"recon"] = "Recon";
    level.mpboostresponse[#"ruin"] = "Ruin";
    level.mpboostresponse[#"seraph"] = "Seraph";
    level.mpboostresponse[#"swatpolice"] = "SwatPolice";
    level.mpboostresponse[#"spectre"] = "Spectre";
    level.mpboostresponse[#"reaper"] = "Reaper";
    level.mpboostresponse[#"outrider"] = "Outrider";
    level.clientvoicesetup = &client_voice_setup;
    clientfield::register("world", "boost_number", 1, 2, "int", &set_boost_number, 1, 1);
    clientfield::register("allplayers", "play_boost", 1, 2, "int", &play_boost_vox, 1, 0);
}

// Namespace dialog_shared/dialog_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xfcc20286, Offset: 0x5c0
// Size: 0x84
function client_voice_setup(localclientnum) {
    self thread snipervonotify(localclientnum, "playerbreathinsound", "exertSniperHold");
    self thread snipervonotify(localclientnum, "playerbreathoutsound", "exertSniperExhale");
    self thread snipervonotify(localclientnum, "playerbreathgaspsound", "exertSniperGasp");
}

// Namespace dialog_shared/dialog_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xd1c62d0c, Offset: 0x650
// Size: 0x98
function snipervonotify(localclientnum, notifystring, dialogkey) {
    self endon(#"death");
    for (;;) {
        self waittill(notifystring);
        if (isunderwater(localclientnum)) {
            return;
        }
        dialogalias = self get_player_dialog_alias(dialogkey);
        if (isdefined(dialogalias)) {
            self playsound(0, dialogalias);
        }
    }
}

// Namespace dialog_shared/dialog_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x859898c9, Offset: 0x6f0
// Size: 0x4a
function set_boost_number(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.boostnumber = newval;
}

// Namespace dialog_shared/dialog_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x721ff995, Offset: 0x748
// Size: 0x14c
function play_boost_vox(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    localplayerteam = function_73f4b33(localclientnum);
    entitynumber = self getentitynumber();
    if (newval == 0 || self.team != localplayerteam || level._sndnextsnapshot != "mpl_prematch" || level.booststartentnum === entitynumber || level.boostresponseentnum === entitynumber) {
        return;
    }
    if (newval == 1) {
        level.booststartentnum = entitynumber;
        self thread play_boost_start_vox(localclientnum);
        return;
    }
    if (newval == 2) {
        level.boostresponseentnum = entitynumber;
        self thread play_boost_start_response_vox(localclientnum);
    }
}

// Namespace dialog_shared/dialog_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x237922ff, Offset: 0x8a0
// Size: 0x124
function play_boost_start_vox(localclientnum) {
    self endon(#"death");
    wait 2;
    playbackid = self play_dialog("boostStart" + level.boostnumber, localclientnum);
    if (isdefined(playbackid) && playbackid >= 0) {
        while (soundplaying(playbackid)) {
            wait 0.05;
        }
    }
    wait 0.5;
    level.booststartresponse = "boostStartResp" + level.mpboostresponse[self getmpdialogname()] + level.boostnumber;
    if (isdefined(level.boostresponseentnum)) {
        responder = getentbynum(localclientnum, level.boostresponseentnum);
        if (isdefined(responder)) {
            responder thread play_boost_start_response_vox(localclientnum);
        }
    }
}

// Namespace dialog_shared/dialog_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x9e540cb7, Offset: 0x9d0
// Size: 0x6c
function play_boost_start_response_vox(localclientnum) {
    self endon(#"death");
    if (!isdefined(level.booststartresponse) || !self function_83973173()) {
        return;
    }
    self play_dialog(level.booststartresponse, localclientnum);
}

// Namespace dialog_shared/dialog_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x6fb5506e, Offset: 0xa48
// Size: 0x80
function dialog_chance(chancekey) {
    dialogchance = mpdialog_value(chancekey);
    if (!isdefined(dialogchance) || dialogchance <= 0) {
        return false;
    } else if (dialogchance >= 100) {
        return true;
    }
    return randomint(100) < dialogchance;
}

// Namespace dialog_shared/dialog_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xbfd7db35, Offset: 0xad0
// Size: 0x124
function function_ad01601e(characterindex) {
    characterfields = getcharacterfields(characterindex, currentsessionmode());
    if (isdefined(characterfields) && isdefined(characterfields.mpdialog)) {
        dialogbundle = struct::get_script_bundle("mpdialog_player", characterfields.mpdialog);
        alias = get_dialog_bundle_alias(dialogbundle, "characterSelect");
        if (isdefined(level.var_aefa616f) && level.var_aefa616f && dialog_chance("characterSelectMaldivesChance")) {
            alias = get_dialog_bundle_alias(dialogbundle, "maldivesCharacterSelectOverride");
        }
        if (isdefined(alias)) {
            self playsound(undefined, alias);
        }
    }
}

// Namespace dialog_shared/dialog_shared
// Params 2, eflags: 0x0
// Checksum 0x636a43e8, Offset: 0xc00
// Size: 0x5a
function get_commander_dialog_alias(commandername, dialogkey) {
    if (!isdefined(commandername)) {
        return;
    }
    commanderbundle = struct::get_script_bundle("mpdialog_commander", commandername);
    return get_dialog_bundle_alias(commanderbundle, dialogkey);
}

// Namespace dialog_shared/dialog_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x44927c66, Offset: 0xc68
// Size: 0x84
function get_dialog_bundle_alias(dialogbundle, dialogkey) {
    if (!isdefined(dialogbundle) || !isdefined(dialogkey)) {
        return undefined;
    }
    dialogalias = dialogbundle.(dialogkey);
    if (!isdefined(dialogalias)) {
        return;
    }
    voiceprefix = dialogbundle.("voiceprefix");
    if (isdefined(voiceprefix)) {
        dialogalias = voiceprefix + dialogalias;
    }
    return dialogalias;
}

// Namespace dialog_shared/dialog_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x66e5a3b3, Offset: 0xcf8
// Size: 0x86
function mpdialog_value(mpdialogkey, defaultvalue) {
    if (!isdefined(mpdialogkey)) {
        return defaultvalue;
    }
    mpdialog = struct::get_script_bundle("mpdialog", "mpdialog_default");
    if (!isdefined(mpdialog)) {
        return defaultvalue;
    }
    structvalue = mpdialog.(mpdialogkey);
    if (!isdefined(structvalue)) {
        return defaultvalue;
    }
    return structvalue;
}

// Namespace dialog_shared/dialog_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x19a2f629, Offset: 0xd88
// Size: 0x112
function get_player_dialog_alias(dialogkey, meansofdeath = undefined) {
    if (!isdefined(self)) {
        return undefined;
    }
    bundlename = self getmpdialogname();
    if (isdefined(meansofdeath) && meansofdeath == "MOD_META" && (isdefined(self.pers[#"changed_specialist"]) ? self.pers[#"changed_specialist"] : 0)) {
        bundlename = self.var_89c4a60f;
    }
    if (!isdefined(bundlename)) {
        return undefined;
    }
    playerbundle = struct::get_script_bundle("mpdialog_player", bundlename);
    if (!isdefined(playerbundle)) {
        return undefined;
    }
    return get_dialog_bundle_alias(playerbundle, dialogkey);
}

// Namespace dialog_shared/dialog_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xfc505bb5, Offset: 0xea8
// Size: 0x14a
function play_dialog(dialogkey, localclientnum) {
    if (!isdefined(dialogkey) || !isdefined(localclientnum)) {
        return -1;
    }
    dialogalias = self get_player_dialog_alias(dialogkey);
    if (!isdefined(dialogalias)) {
        return -1;
    }
    soundpos = (self.origin[0], self.origin[1], self.origin[2] + 60);
    if (!function_65b9eb0f(localclientnum)) {
        return self playsound(undefined, dialogalias, soundpos);
    }
    voicebox = spawn(localclientnum, self.origin, "script_model");
    self thread update_voice_origin(voicebox);
    voicebox thread delete_after(10);
    return voicebox playsound(undefined, dialogalias, soundpos);
}

// Namespace dialog_shared/dialog_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x57295727, Offset: 0x1000
// Size: 0x4a
function update_voice_origin(voicebox) {
    while (true) {
        wait 0.1;
        if (!isdefined(self) || !isdefined(voicebox)) {
            return;
        }
        voicebox.origin = self.origin;
    }
}

// Namespace dialog_shared/dialog_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x7ab4a552, Offset: 0x1058
// Size: 0x24
function delete_after(waittime) {
    wait waittime;
    self delete();
}


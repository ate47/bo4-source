#using scripts\weapons\weaponobjects;
#using scripts\core_common\util_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\damagefeedback_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\challenges_shared;

#namespace tacticalinsertion;

// Namespace tacticalinsertion/tacticalinsertion
// Params 0, eflags: 0x1 linked
// Checksum 0xa151324a, Offset: 0x190
// Size: 0x8c
function init_shared() {
    level.weapontacticalinsertion = getweapon(#"tactical_insertion");
    level._effect[#"tacticalinsertionfizzle"] = #"_t6/misc/fx_equip_tac_insert_exp";
    clientfield::register("scriptmover", "tacticalinsertion", 1, 1, "int");
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 2, eflags: 0x1 linked
// Checksum 0x5a3a4c78, Offset: 0x228
// Size: 0xd8
function istacspawntouchingcrates(origin, angles) {
    crate_ents = getentarray("care_package", "script_noteworthy");
    mins = (-17, -17, -40);
    maxs = (17, 17, 40);
    for (i = 0; i < crate_ents.size; i++) {
        if (crate_ents[i] istouchingvolume(origin + (0, 0, 40), mins, maxs)) {
            return true;
        }
    }
    return false;
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 1, eflags: 0x1 linked
// Checksum 0xda7af148, Offset: 0x308
// Size: 0x148
function overridespawn(ispredictedspawn) {
    if (!isdefined(self.tacticalinsertion)) {
        return false;
    }
    origin = self.tacticalinsertion.origin;
    angles = self.tacticalinsertion.angles;
    team = self.tacticalinsertion.team;
    if (!ispredictedspawn) {
        self.tacticalinsertion destroy_tactical_insertion();
    }
    if (team != self.team) {
        return false;
    }
    if (istacspawntouchingcrates(origin)) {
        return false;
    }
    if (!ispredictedspawn) {
        self.tacticalinsertiontime = gettime();
        self spawn(origin, angles, "tactical insertion");
        self setspawnclientflag("SCDFL_DISABLE_LOGGING");
        self stats::function_e24eec31(level.weapontacticalinsertion, #"used", 1);
    }
    return true;
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 1, eflags: 0x1 linked
// Checksum 0xc11b027d, Offset: 0x458
// Size: 0x3c
function waitanddelete(time) {
    self endon(#"death");
    waitframe(1);
    self delete();
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 1, eflags: 0x1 linked
// Checksum 0xf6df1823, Offset: 0x4a0
// Size: 0x6c
function watch(player) {
    if (isdefined(player.tacticalinsertion)) {
        player.tacticalinsertion destroy_tactical_insertion();
    }
    player thread spawntacticalinsertion();
    self waitanddelete(0.05);
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 4, eflags: 0x1 linked
// Checksum 0x22a518e6, Offset: 0x518
// Size: 0x1e0
function watchusetrigger(trigger, callback, playersoundonuse, npcsoundonuse) {
    self endon(#"delete");
    while (true) {
        waitresult = trigger waittill(#"trigger");
        player = waitresult.activator;
        if (!isalive(player)) {
            continue;
        }
        if (!player isonground()) {
            continue;
        }
        if (isdefined(trigger.triggerteam) && player.team != trigger.triggerteam) {
            continue;
        }
        if (isdefined(trigger.triggerteamignore) && player.team == trigger.triggerteamignore) {
            continue;
        }
        if (isdefined(trigger.claimedby) && player != trigger.claimedby) {
            continue;
        }
        if (player usebuttonpressed() && !player.throwinggrenade && !player meleebuttonpressed()) {
            if (isdefined(playersoundonuse)) {
                player playlocalsound(playersoundonuse);
            }
            if (isdefined(npcsoundonuse)) {
                player playsound(npcsoundonuse);
            }
            self thread [[ callback ]](player);
        }
    }
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 0, eflags: 0x1 linked
// Checksum 0x6c7f03bc, Offset: 0x700
// Size: 0x4c
function watchdisconnect() {
    self.tacticalinsertion endon(#"delete");
    self waittill(#"disconnect");
    self.tacticalinsertion thread destroy_tactical_insertion();
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 1, eflags: 0x1 linked
// Checksum 0xd13558c7, Offset: 0x758
// Size: 0x234
function destroy_tactical_insertion(attacker) {
    self.owner.tacticalinsertion = undefined;
    self notify(#"delete");
    self.owner notify(#"tactical_insertion_destroyed");
    self.friendlytrigger delete();
    self.enemytrigger delete();
    if (isdefined(attacker) && isdefined(attacker.pers[#"team"]) && isdefined(self.owner) && isdefined(self.owner.pers[#"team"])) {
        if (level.teambased) {
            if (attacker.pers[#"team"] != self.owner.pers[#"team"]) {
                attacker notify(#"destroyed_explosive");
                attacker challenges::destroyedequipment();
                attacker challenges::destroyedtacticalinsert();
                scoreevents::processscoreevent(#"destroyed_tac_insert", attacker, self.owner, undefined);
            }
        } else if (attacker != self.owner) {
            attacker notify(#"destroyed_explosive");
            attacker challenges::destroyedequipment();
            attacker challenges::destroyedtacticalinsert();
            scoreevents::processscoreevent(#"destroyed_tac_insert", attacker, self.owner, undefined);
        }
    }
    self delete();
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 1, eflags: 0x1 linked
// Checksum 0xb4ad2a4e, Offset: 0x998
// Size: 0xec
function fizzle(attacker) {
    if (isdefined(self.fizzle) && self.fizzle) {
        return;
    }
    self.fizzle = 1;
    playfx(level._effect[#"tacticalinsertionfizzle"], self.origin);
    self playsound(#"dst_tac_insert_break");
    if (isdefined(attacker) && attacker != self.owner) {
        if (isdefined(level.globallogic_audio_dialog_on_player_override)) {
            self.owner [[ level.globallogic_audio_dialog_on_player_override ]]("tact_destroyed", "item_destroyed");
        }
    }
    self destroy_tactical_insertion(attacker);
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 1, eflags: 0x1 linked
// Checksum 0x1b6bd20e, Offset: 0xa90
// Size: 0x74
function pickup(attacker) {
    player = self.owner;
    self destroy_tactical_insertion();
    player giveweapon(level.weapontacticalinsertion);
    player setweaponammoclip(level.weapontacticalinsertion, 1);
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 0, eflags: 0x1 linked
// Checksum 0x5dfa6685, Offset: 0xb10
// Size: 0x7d8
function spawntacticalinsertion() {
    self endon(#"disconnect");
    self.tacticalinsertion = spawn("script_model", self.origin + (0, 0, 1));
    self.tacticalinsertion setmodel(#"t6_wpn_tac_insert_world");
    self.tacticalinsertion.origin = self.origin + (0, 0, 1);
    self.tacticalinsertion.angles = self.angles;
    self.tacticalinsertion.team = self.team;
    self.tacticalinsertion setteam(self.team);
    self.tacticalinsertion.owner = self;
    self.tacticalinsertion setowner(self);
    self.tacticalinsertion setweapon(level.weapontacticalinsertion);
    self.tacticalinsertion thread weaponobjects::setupreconeffect();
    self.tacticalinsertion endon(#"delete");
    if (isdefined(level.var_96ee56b5)) {
        self.tacticalinsertion [[ level.var_96ee56b5 ]]();
    }
    triggerheight = 64;
    triggerradius = 128;
    self.tacticalinsertion.friendlytrigger = spawn("trigger_radius_use", self.tacticalinsertion.origin + (0, 0, 3));
    self.tacticalinsertion.friendlytrigger setcursorhint("HINT_NOICON", self.tacticalinsertion);
    self.tacticalinsertion.friendlytrigger sethintstring(#"hash_83435f76ff5897f");
    if (level.teambased) {
        self.tacticalinsertion.friendlytrigger setteamfortrigger(self.team);
        self.tacticalinsertion.friendlytrigger.triggerteam = self.team;
    }
    self clientclaimtrigger(self.tacticalinsertion.friendlytrigger);
    self.tacticalinsertion.friendlytrigger.claimedby = self;
    self.tacticalinsertion.enemytrigger = spawn("trigger_radius_use", self.tacticalinsertion.origin + (0, 0, 3));
    self.tacticalinsertion.enemytrigger setcursorhint("HINT_NOICON", self.tacticalinsertion);
    self.tacticalinsertion.enemytrigger sethintstring(#"hash_225043ec880f05f");
    self.tacticalinsertion.enemytrigger setinvisibletoplayer(self);
    if (level.teambased) {
        self.tacticalinsertion.enemytrigger setexcludeteamfortrigger(self.team);
        self.tacticalinsertion.enemytrigger.triggerteamignore = self.team;
    }
    self.tacticalinsertion clientfield::set("tacticalinsertion", 1);
    self thread watchdisconnect();
    watcher = weaponobjects::getweaponobjectwatcherbyweapon(level.weapontacticalinsertion);
    self.tacticalinsertion thread watchusetrigger(self.tacticalinsertion.friendlytrigger, &pickup, watcher.pickupsoundplayer, watcher.pickupsound);
    self.tacticalinsertion thread watchusetrigger(self.tacticalinsertion.enemytrigger, &fizzle);
    if (isdefined(self.tacticalinsertioncount)) {
        self.tacticalinsertioncount++;
    } else {
        self.tacticalinsertioncount = 1;
    }
    self.tacticalinsertion setcandamage(1);
    self.tacticalinsertion.health = 1;
    while (true) {
        waitresult = self.tacticalinsertion waittill(#"damage");
        attacker = waitresult.attacker;
        weapon = waitresult.weapon;
        if (level.teambased && (!isdefined(attacker) || !isplayer(attacker) || attacker.team == self.team) && attacker != self) {
            continue;
        }
        if (attacker != self) {
            attacker challenges::destroyedequipment(weapon);
            attacker challenges::destroyedtacticalinsert();
            scoreevents::processscoreevent(#"destroyed_tac_insert", attacker, self, weapon);
        }
        if (watcher.stuntime > 0 && weapon.dostun) {
            self thread weaponobjects::stunstart(watcher, watcher.stuntime);
        }
        if (weapon.dodamagefeedback) {
            if (level.teambased && self.tacticalinsertion.owner.team != attacker.team) {
                if (damagefeedback::dodamagefeedback(weapon, attacker)) {
                    attacker damagefeedback::update();
                }
            } else if (!level.teambased && self.tacticalinsertion.owner != attacker) {
                if (damagefeedback::dodamagefeedback(weapon, attacker)) {
                    attacker damagefeedback::update();
                }
            }
        }
        if (isdefined(attacker) && attacker != self) {
            if (isdefined(level.globallogic_audio_dialog_on_player_override)) {
                self [[ level.globallogic_audio_dialog_on_player_override ]]("tact_destroyed", "item_destroyed");
            }
        }
        self.tacticalinsertion thread fizzle();
    }
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 0, eflags: 0x1 linked
// Checksum 0x79f82cc6, Offset: 0x12f0
// Size: 0x114
function cancel_button_think() {
    if (!isdefined(self.tacticalinsertion)) {
        return;
    }
    /#
        text = cancel_text_create();
    #/
    self thread cancel_button_press();
    event = self waittill(#"tactical_insertion_destroyed", #"disconnect", #"end_killcam", #"abort_killcam", #"tactical_insertion_canceled", #"spawned");
    if (event._notify == "tactical_insertion_canceled") {
        self.tacticalinsertion destroy_tactical_insertion();
    }
    /#
        if (isdefined(text)) {
            text destroy();
        }
    #/
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 0, eflags: 0x1 linked
// Checksum 0x90370b3e, Offset: 0x1410
// Size: 0x3c
function canceltackinsertionbutton() {
    if (level.console) {
        return self changeseatbuttonpressed();
    }
    return self jumpbuttonpressed();
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 0, eflags: 0x1 linked
// Checksum 0xecea58ad, Offset: 0x1458
// Size: 0x76
function cancel_button_press() {
    self endon(#"disconnect", #"end_killcam", #"abort_killcam");
    while (true) {
        wait 0.05;
        if (self canceltackinsertionbutton()) {
            break;
        }
    }
    self notify(#"tactical_insertion_canceled");
}

/#

    // Namespace tacticalinsertion/tacticalinsertion
    // Params 0, eflags: 0x0
    // Checksum 0xf08075cf, Offset: 0x14d8
    // Size: 0x160
    function cancel_text_create() {
        text = newdebughudelem(self);
        text.archived = 0;
        text.y = -100;
        text.alignx = "<dev string:x38>";
        text.aligny = "<dev string:x41>";
        text.horzalign = "<dev string:x38>";
        text.vertalign = "<dev string:x4a>";
        text.sort = 10;
        text.font = "<dev string:x53>";
        text.foreground = 1;
        text.hidewheninmenu = 1;
        if (self issplitscreen()) {
            text.y = -80;
            text.fontscale = 1.2;
        } else {
            text.fontscale = 1.6;
        }
        text settext(#"hash_e0dad145a9829f1");
        text.alpha = 1;
        return text;
    }

#/

// Namespace tacticalinsertion/tacticalinsertion
// Params 0, eflags: 0x0
// Checksum 0xad0c5e97, Offset: 0x1640
// Size: 0xa0
function gettacticalinsertions() {
    tac_inserts = [];
    foreach (player in level.players) {
        if (isdefined(player.tacticalinsertion)) {
            tac_inserts[tac_inserts.size] = player.tacticalinsertion;
        }
    }
    return tac_inserts;
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 2, eflags: 0x1 linked
// Checksum 0xb8a0b011, Offset: 0x16e8
// Size: 0xe4
function tacticalinsertiondestroyedbytrophysystem(attacker, trophysystem) {
    owner = self.owner;
    if (isdefined(attacker)) {
        attacker challenges::destroyedequipment(trophysystem.name);
        attacker challenges::destroyedtacticalinsert();
    }
    self thread fizzle();
    if (isdefined(owner)) {
        owner endon(#"death", #"disconnect");
        waitframe(1);
        if (isdefined(level.globallogic_audio_dialog_on_player_override)) {
            owner [[ level.globallogic_audio_dialog_on_player_override ]]("tact_destroyed", "item_destroyed");
        }
    }
}

// Namespace tacticalinsertion/grenade_fire
// Params 1, eflags: 0x40
// Checksum 0xf6c26d00, Offset: 0x17d8
// Size: 0xac
function event_handler[grenade_fire] function_73648468(eventstruct) {
    if (!isplayer(self)) {
        return;
    }
    grenade = eventstruct.projectile;
    weapon = eventstruct.weapon;
    if (grenade util::ishacked()) {
        return;
    }
    if (isdefined(level.weapontacticalinsertion) && weapon == level.weapontacticalinsertion) {
        grenade thread watch(self);
    }
}


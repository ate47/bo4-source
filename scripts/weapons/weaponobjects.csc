// Atian COD Tools GSC decompiler test
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\duplicaterender_mgr.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace weaponobjects;

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xe1f9c24b, Offset: 0x168
// Size: 0x414
function init_shared(friendly_rob, var_4885f19e) {
    callback::on_localplayer_spawned(&on_localplayer_spawned);
    clientfield::register("toplayer", "proximity_alarm", 1, 3, "int", &proximity_alarm_changed, 0, 1);
    clientfield::register("missile", "retrievable", 1, 1, "int", &retrievable_changed, 0, 1);
    clientfield::register("scriptmover", "retrievable", 1, 1, "int", &retrievable_changed, 0, 0);
    clientfield::register("missile", "enemyequip", 1, 2, "int", &enemyequip_changed, 0, 1);
    clientfield::register("scriptmover", "enemyequip", 1, 2, "int", &enemyequip_changed, 0, 0);
    clientfield::register("missile", "teamequip", 1, 1, "int", &teamequip_changed, 0, 1);
    clientfield::register("clientuimodel", "hudItems.proximityAlarm", 1, 3, "int", undefined, 0, 0);
    clientfield::register("missile", "friendlyequip", 1, 1, "int", &friendly_outline, 0, 1);
    clientfield::register("scriptmover", "friendlyequip", 1, 1, "int", &friendly_outline, 0, 0);
    level._effect[#"powerlight"] = #"weapon/fx8_equip_light_os";
    if (getgametypesetting(#"hash_48670d9509071424")) {
        level.var_58253868 = friendly_rob;
    }
    level.var_420d7d7e = var_4885f19e;
    level.var_4de4699b = #"rob_sonar_set_enemy";
    if (!isdefined(level.retrievable)) {
        level.retrievable = [];
    }
    if (!isdefined(level.enemyequip)) {
        level.enemyequip = [];
    }
    if (isdefined(level.var_58253868)) {
        renderoverridebundle::function_f72f089c(#"hash_66ac79c57723c169", level.var_58253868, &function_6a5648dc, undefined, undefined, 1);
    }
    if (isdefined(level.var_420d7d7e)) {
        renderoverridebundle::function_f72f089c(#"hash_691f7dc47ae8aa08", level.var_420d7d7e, &function_232f3acf, undefined, level.var_4de4699b, 1);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xaaef2a2, Offset: 0x588
// Size: 0x3c
function on_localplayer_spawned(local_client_num) {
    if (!self function_21c0fa55()) {
        return;
    }
    self thread watch_perks_changed(local_client_num);
}

// Namespace weaponobjects/weaponobjects
// Params 7, eflags: 0x1 linked
// Checksum 0x7484ef78, Offset: 0x5d0
// Size: 0x5c
function proximity_alarm_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    update_sound(local_client_num, bnewent, newval, oldval);
}

// Namespace weaponobjects/weaponobjects
// Params 4, eflags: 0x1 linked
// Checksum 0xe3766b79, Offset: 0x638
// Size: 0xf4
function update_sound(local_client_num, bnewent, newval, oldval) {
    if (newval == 2) {
        if (!isdefined(self._proximity_alarm_snd_ent)) {
            self._proximity_alarm_snd_ent = spawn(local_client_num, self.origin, "script_origin");
            self thread sndproxalert_entcleanup(local_client_num, self._proximity_alarm_snd_ent);
        }
        return;
    }
    if (newval == 1) {
        return;
    }
    if (newval == 0 && isdefined(oldval) && oldval != newval) {
        if (isdefined(self._proximity_alarm_snd_ent)) {
            self._proximity_alarm_snd_ent stopallloopsounds(0.5);
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 7, eflags: 0x1 linked
// Checksum 0xed8c60ff, Offset: 0x738
// Size: 0x54
function teamequip_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self updateteamequipment(local_client_num, newval);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x44139af8, Offset: 0x798
// Size: 0x2c
function updateteamequipment(local_client_num, newval) {
    self checkteamequipment(local_client_num);
}

// Namespace weaponobjects/weaponobjects
// Params 7, eflags: 0x1 linked
// Checksum 0x9659d78f, Offset: 0x7d0
// Size: 0x74
function retrievable_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self util::add_remove_list(level.retrievable, newval);
    self updateretrievable(local_client_num, newval);
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xb7cc0390, Offset: 0x850
// Size: 0x74
function updateretrievable(local_client_num, newval) {
    if (self function_b9b8fbc7()) {
        self duplicate_render::set_item_retrievable(local_client_num, newval);
        return;
    }
    if (isdefined(self.currentdrfilter)) {
        self duplicate_render::set_item_retrievable(local_client_num, 0);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 0, eflags: 0x1 linked
// Checksum 0xbd028fae, Offset: 0x8d0
// Size: 0x72
function function_f89c4b81() {
    if (isdefined(self.weapon) && self.weapon.statname == #"ac130") {
        return 0;
    }
    if (isdefined(self.weapon) && self.weapon.statname == #"tr_flechette_t8") {
        return 0;
    }
    return 1;
}

// Namespace weaponobjects/weaponobjects
// Params 7, eflags: 0x1 linked
// Checksum 0xf344956b, Offset: 0x950
// Size: 0x94
function enemyequip_changed(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    newval = newval != 0;
    if (self function_f89c4b81()) {
        self util::add_remove_list(level.enemyequip, newval);
        self updateenemyequipment(local_client_num, newval);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x17009aa6, Offset: 0x9f0
// Size: 0xc4
function function_6a5648dc(local_client_num, bundle) {
    if (!self function_4e0ca360() || self.team === #"free") {
        return 0;
    }
    if (isdefined(level.vision_pulse[local_client_num]) && level.vision_pulse[local_client_num]) {
        return 0;
    }
    player = function_5c10bd79(local_client_num);
    if (self == player) {
        return 0;
    }
    if (player.var_33b61b6f === 1) {
        return 0;
    }
    return 1;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xea503793, Offset: 0xac0
// Size: 0x15c
function function_232f3acf(local_client_num, bundle) {
    if (self function_4e0ca360() && self.team !== #"free") {
        return 0;
    }
    if (self.var_6abc296 === 1) {
        return 1;
    }
    type = self.type;
    if ((type == "missile" || type == "scriptmover") && self clientfield::get("enemyequip") === 0) {
        return 0;
    }
    if (sessionmodeiswarzonegame()) {
        if (function_5778f82(local_client_num, #"specialty_showenemyequipment") && isdefined(self.var_f19b4afd) && self.var_f19b4afd) {
            return 1;
        }
    } else {
        if (function_5778f82(local_client_num, #"specialty_showenemyequipment")) {
            return 1;
        }
        bundle.var_1a5b7293 = 1;
    }
    return 0;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xfbd4d539, Offset: 0xc28
// Size: 0xa4
function updateenemyequipment(local_client_num, newval) {
    if (isdefined(level.var_58253868)) {
        self renderoverridebundle::function_c8d97b8e(local_client_num, #"friendly", #"hash_66ac79c57723c169");
    }
    if (isdefined(level.var_420d7d7e)) {
        self renderoverridebundle::function_c8d97b8e(local_client_num, #"enemy", #"hash_691f7dc47ae8aa08");
    }
}

// Namespace weaponobjects/weaponobjects
// Params 7, eflags: 0x1 linked
// Checksum 0xb958256a, Offset: 0xcd8
// Size: 0x3c
function friendly_outline(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xb7df6828, Offset: 0xd20
// Size: 0x10e
function watch_perks_changed(local_client_num) {
    self notify(#"watch_perks_changed");
    self endon(#"watch_perks_changed");
    self endon(#"death");
    self endon(#"disconnect");
    while (isdefined(self)) {
        waitframe(1);
        util::clean_deleted(level.retrievable);
        util::clean_deleted(level.enemyequip);
        array::thread_all(level.retrievable, &updateretrievable, local_client_num, 1);
        array::thread_all(level.enemyequip, &updateenemyequipment, local_client_num, 1);
        self waittill(#"perks_changed");
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x8db3261a, Offset: 0xe38
// Size: 0x11e
function checkteamequipment(localclientnum) {
    if (!isdefined(self.owner)) {
        return;
    }
    if (!isdefined(self.equipmentoldteam)) {
        self.equipmentoldteam = self.team;
    }
    if (!isdefined(self.equipmentoldownerteam)) {
        self.equipmentoldownerteam = self.owner.team;
    }
    var_fd9de919 = function_73f4b33(localclientnum);
    if (!isdefined(self.equipmentoldwatcherteam)) {
        self.equipmentoldwatcherteam = var_fd9de919;
    }
    if (self.equipmentoldteam != self.team || self.equipmentoldownerteam != self.owner.team || self.equipmentoldwatcherteam != var_fd9de919) {
        self.equipmentoldteam = self.team;
        self.equipmentoldownerteam = self.owner.team;
        self.equipmentoldwatcherteam = var_fd9de919;
        self notify(#"team_changed");
    }
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0xc837a9ed, Offset: 0xf60
// Size: 0xb4
function equipmentteamobject(localclientnum) {
    if (isdefined(level.disable_equipment_team_object) && level.disable_equipment_team_object) {
        return;
    }
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    waitframe(1);
    fx_handle = self thread playflarefx(localclientnum);
    self thread equipmentwatchteamfx(localclientnum, fx_handle);
    self thread equipmentwatchplayerteamchanged(localclientnum, fx_handle);
}

// Namespace weaponobjects/weaponobjects
// Params 1, eflags: 0x1 linked
// Checksum 0x8dd0e999, Offset: 0x1020
// Size: 0x122
function playflarefx(localclientnum) {
    self endon(#"death");
    level endon(#"player_switch");
    if (!isdefined(self.equipmenttagfx)) {
        self.equipmenttagfx = "tag_origin";
    }
    if (!isdefined(self.equipmentfriendfx)) {
        self.equipmenttagfx = level._effect[#"powerlightgreen"];
    }
    if (!isdefined(self.equipmentenemyfx)) {
        self.equipmenttagfx = level._effect[#"powerlight"];
    }
    if (self function_83973173()) {
        fx_handle = util::playfxontag(localclientnum, self.equipmentfriendfx, self, self.equipmenttagfx);
    } else {
        fx_handle = util::playfxontag(localclientnum, self.equipmentenemyfx, self, self.equipmenttagfx);
    }
    return fx_handle;
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xfe14d8a8, Offset: 0x1150
// Size: 0xbc
function equipmentwatchteamfx(localclientnum, fxhandle) {
    msg = undefined;
    msg = self waittill(#"death", #"team_changed", #"player_switch");
    if (isdefined(fxhandle)) {
        stopfx(localclientnum, fxhandle);
    }
    waittillframeend();
    if (msg._notify != "death" && isdefined(self)) {
        self thread equipmentteamobject(localclientnum);
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0xc945cee4, Offset: 0x1218
// Size: 0xea
function equipmentwatchplayerteamchanged(localclientnum, fxhandle) {
    self endon(#"death");
    self notify(#"team_changed_watcher");
    self endon(#"team_changed_watcher");
    watcherplayer = function_5c10bd79(localclientnum);
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"team_changed");
        player = function_5c10bd79(waitresult.localclientnum);
        if (watcherplayer == player) {
            self notify(#"team_changed");
        }
    }
}

// Namespace weaponobjects/weaponobjects
// Params 2, eflags: 0x1 linked
// Checksum 0x83514f6a, Offset: 0x1310
// Size: 0xac
function sndproxalert_entcleanup(localclientnum, ent) {
    level waittill(#"snddede", #"demo_jump", #"player_switch", #"killcam_begin", #"killcam_end");
    if (isdefined(ent)) {
        ent stopallloopsounds(0.5);
        ent delete();
    }
}


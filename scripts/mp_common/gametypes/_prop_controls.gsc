// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\killstreaks\mp\killstreaks.gsc;
#using scripts\mp_common\gametypes\prop.gsc;
#using scripts\mp_common\gametypes\spawnlogic.gsc;
#using scripts\mp_common\gametypes\spawning.gsc;
#using scripts\mp_common\gametypes\_prop_dev.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\dogtags.gsc;
#using scripts\mp_common\util.gsc;

#namespace prop_controls;

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0x66f47c57, Offset: 0x3f8
// Size: 0x54
function notifyonplayercommand(command, key) {
    assert(isplayer(self));
    self thread function_255e9614(command, key);
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0x39031341, Offset: 0x458
// Size: 0x2a
function notifyonplayercommandremove(command, key) {
    self notify(command + "_" + key);
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0x3ab317eb, Offset: 0x490
// Size: 0x43a
function function_255e9614(command, key) {
    self endon(#"disconnect");
    level endon(#"game_ended");
    self notify(command + "_" + key);
    self endon(command + "_" + key);
    switch (key) {
    case #"+attack":
        function_9024fce3(&attackbuttonpressed, command);
        break;
    case #"+toggleads_throw":
        function_9024fce3(&adsbuttonpressed, command);
        break;
    case #"+changeseat":
        function_9024fce3(&changeseatbuttonpressed, command);
        break;
    case #"+usereload":
        function_9024fce3(&usebuttonpressed, command);
        break;
    case #"+smoke":
        function_9024fce3(&secondaryoffhandbuttonpressed, command);
        break;
    case #"+frag":
        function_9024fce3(&fragbuttonpressed, command);
        break;
    case #"+actionslot 1":
        function_9024fce3(&actionslotonebuttonpressed, command);
        break;
    case #"+actionslot 2":
        function_9024fce3(&actionslottwobuttonpressed, command);
        break;
    case #"+actionslot 3":
        function_9024fce3(&actionslotthreebuttonpressed, command);
        break;
    case #"+actionslot 4":
        function_9024fce3(&actionslotfourbuttonpressed, command);
        break;
    case #"-actionslot 1":
        function_21e5a72f(&actionslotonebuttonpressed, command);
        break;
    case #"-actionslot 2":
        function_21e5a72f(&actionslottwobuttonpressed, command);
        break;
    case #"-actionslot 3":
        function_21e5a72f(&actionslotthreebuttonpressed, command);
        break;
    case #"-actionslot 4":
        function_21e5a72f(&actionslotfourbuttonpressed, command);
        break;
    case #"+stance":
        function_21e5a72f(&stancebuttonpressed, command);
        break;
    case #"+breath_sprint":
        function_21e5a72f(&sprintbuttonpressed, command);
        break;
    case #"+melee":
        function_21e5a72f(&meleebuttonpressed, command);
        break;
    }
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0x5670318a, Offset: 0x8d8
// Size: 0x5c
function function_9024fce3(buttonfunc, command) {
    while (true) {
        while (!self [[ buttonfunc ]]()) {
            waitframe(1);
        }
        self notify(command);
        while (self [[ buttonfunc ]]()) {
            waitframe(1);
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0x4b99ad1a, Offset: 0x940
// Size: 0x5c
function function_21e5a72f(buttonfunc, command) {
    while (true) {
        while (!self [[ buttonfunc ]]()) {
            waitframe(1);
        }
        while (self [[ buttonfunc ]]()) {
            waitframe(1);
        }
        self notify(command);
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xd352302d, Offset: 0x9a8
// Size: 0x134
function setupkeybindings() {
    if (isai(self)) {
        return;
    }
    self notifyonplayercommand("lock", "+attack");
    self notifyonplayercommand("spin", "+toggleads_throw");
    self notifyonplayercommand("changeProp", "+changeseat");
    self notifyonplayercommand("setToSlope", "+usereload");
    self notifyonplayercommand("propAbility", "+frag");
    self notifyonplayercommand("cloneProp", "+smoke");
    self notifyonplayercommand("hide", "+melee");
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x93f1c8d, Offset: 0xae8
// Size: 0x134
function function_1e25f968() {
    if (isai(self)) {
        return;
    }
    self notifyonplayercommandremove("lock", "+attack");
    self notifyonplayercommandremove("spin", "+toggleads_throw");
    self notifyonplayercommandremove("changeProp", "+changeseat");
    self notifyonplayercommandremove("setToSlope", "+usereload");
    self notifyonplayercommandremove("propAbility", "+frag");
    self notifyonplayercommandremove("cloneProp", "+smoke");
    self notifyonplayercommandremove("hide", "+melee");
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xd933eb58, Offset: 0xc28
// Size: 0x1a
function is_player_gamepad_enabled() {
    return self gamepadusedlast();
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x6d461b13, Offset: 0xc50
// Size: 0x1a
function setvalue(value) {
    self.value = value;
}

// Namespace prop_controls/_prop_controls
// Params 4, eflags: 0x0
// Checksum 0x6f65ee40, Offset: 0xc78
// Size: 0x1de
function addupperrighthudelem(label, value, text, labelpc) {
    hudelem = spawnstruct();
    hudelem.x = -15;
    hudelem.y = self.currenthudy;
    hudelem.alignx = "right";
    hudelem.aligny = "bottom";
    hudelem.horzalign = "right";
    hudelem.vertalign = "bottom";
    hudelem.archived = 1;
    hudelem.alpha = 1;
    hudelem.glowalpha = 0;
    hudelem.hidewheninmenu = 1;
    hudelem.hidewheninkillcam = 1;
    hudelem.startfontscale = hudelem.fontscale;
    if (isdefined(label) && isdefined(labelpc)) {
        if (self is_player_gamepad_enabled()) {
            hudelem.label = label;
        } else {
            hudelem.label = labelpc;
        }
    } else if (isdefined(label)) {
        hudelem.label = label;
    } else if (isdefined(text)) {
        /#
            hudelem settext(text);
        #/
    }
    if (isdefined(value)) {
        hudelem setvalue(value);
    }
    self.currenthudy = self.currenthudy - 20;
    return hudelem;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x55d18b1, Offset: 0xe60
// Size: 0x1e4
function propcontrolshud() {
    assert(!isdefined(self.changepropkey));
    if (self issplitscreen()) {
        self.currenthudy = -10;
    } else {
        self.currenthudy = -80;
    }
    self.abilitykey = addupperrighthudelem();
    self.clonekey = addupperrighthudelem(#"hash_2f560292a2fb7eab");
    self.changepropkey = addupperrighthudelem(#"mp_ph_change", 0);
    self.currenthudy = self.currenthudy - 20;
    self.var_8e3b5c8c = addupperrighthudelem(#"hash_fb73fdc2aff963f");
    self.matchslopekey = addupperrighthudelem(#"hash_7f59350f5f223501", undefined, undefined, #"hash_4c7fbb5c1ccd5107");
    self.lockpropkey = addupperrighthudelem(#"mp_ph_lock");
    self.spinpropkey = addupperrighthudelem(#"mp_ph_spin", undefined, undefined, #"hash_39e61050ab8d325e");
    self setnewabilityhud();
    self.zoomkey = addupperrighthudelem(#"mp_ph_zoom");
    self thread updatetextongamepadchange();
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x78213815, Offset: 0x1050
// Size: 0x6c
function cleanuppropcontrolshudondeath() {
    level endon(#"game_ended");
    self endon(#"disconnect");
    self waittill(#"death");
    self thread function_1e25f968();
    self thread cleanuppropcontrolshud();
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xc7d61f43, Offset: 0x10c8
// Size: 0x2c
function safedestroy(hudelem) {
    if (isdefined(hudelem)) {
        /#
            hudelem destroy();
        #/
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x20103fe6, Offset: 0x1100
// Size: 0x4e
function cleanuppropcontrolshud() {
    self.changepropkey = undefined;
    self.spinpropkey = undefined;
    self.lockpropkey = undefined;
    self.matchslopekey = undefined;
    self.abilitykey = undefined;
    self.zoomkey = undefined;
    self.spectatekey = undefined;
    self.clonekey = undefined;
    self.var_8e3b5c8c = undefined;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x131b0f2b, Offset: 0x1158
// Size: 0x1ac
function updatetextongamepadchange() {
    level endon(#"game_ended");
    self endon(#"disconnect", #"death");
    if (level.console) {
        return;
    }
    waittillframeend();
    var_8671d17 = self is_player_gamepad_enabled();
    while (true) {
        var_4084aa7 = self is_player_gamepad_enabled();
        if (var_4084aa7 != var_8671d17) {
            var_8671d17 = var_4084aa7;
            if (var_4084aa7) {
                if (!(isdefined(self.slopelocked) && self.slopelocked)) {
                    self.matchslopekey.label = #"hash_7f59350f5f223501";
                } else {
                    self.matchslopekey.label = #"hash_6ca8e1ea720ba9f";
                }
                self.spinpropkey.label = #"mp_ph_spin";
            } else {
                if (!(isdefined(self.slopelocked) && self.slopelocked)) {
                    self.matchslopekey.label = #"hash_4c7fbb5c1ccd5107";
                } else {
                    self.matchslopekey.label = #"hash_3cd8ecbf9f39b3e9";
                }
                self.spinpropkey.label = #"hash_39e61050ab8d325e";
            }
        }
        waitframe(1);
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x5e43d706, Offset: 0x1310
// Size: 0x280
function propinputwatch() {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    if (isai(self)) {
        return;
    }
    self.lock = 0;
    self.slopelocked = 0;
    prop::function_241f7953();
    self thread propmoveunlock();
    self thread propcamerazoom();
    self.debugnextpropindex = 1;
    while (true) {
        waitresult = self waittill(#"lock", #"spin", #"changeprop", #"settoslope", #"propability", #"cloneprop", #"hide");
        msg = waitresult._notify;
        if (!isdefined(msg)) {
            continue;
        }
        waittillframeend();
        if (msg == "lock") {
            self proplockunlock();
            continue;
        }
        if (msg == "spin") {
            self function_9bc7ac53();
            continue;
        }
        if (msg == "changeProp") {
            self propchange();
            continue;
        }
        if (msg == "setToSlope") {
            self propmatchslope();
            continue;
        }
        if (msg == "propAbility") {
            self propability();
            continue;
        }
        if (msg == "cloneProp") {
            self propclonepower();
            continue;
        }
        if (msg == "hide") {
            self function_2b14e8b1();
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x6d42ecd, Offset: 0x1598
// Size: 0x54
function proplockunlock() {
    if (self ismantling()) {
        return;
    }
    if (self.lock) {
        self unlockprop();
        return;
    }
    self lockprop();
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x8658091d, Offset: 0x15f8
// Size: 0xd4
function function_9bc7ac53() {
    self.propent unlink();
    self.propent.angles = self.propent.angles + (0, 45, 0);
    self.propent.origin = self.propanchor.origin;
    if (self.slopelocked && isdefined(self.lock) && self.lock) {
        self.propent set_pitch_roll_for_ground_normal(self.prop);
    }
    self.propent linkto(self.propanchor);
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xde69bb17, Offset: 0x16d8
// Size: 0x9a
function registerpreviousprop(inplayer) {
    var_d8171b71 = 3;
    if (!isdefined(inplayer.usedpropsindex)) {
        inplayer.usedpropsindex = 0;
    }
    inplayer.usedprops[inplayer.usedpropsindex] = inplayer.prop.info;
    inplayer.usedpropsindex++;
    if (inplayer.usedpropsindex >= var_d8171b71) {
        inplayer.usedpropsindex = 0;
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x9ad276d0, Offset: 0x1780
// Size: 0x2cc
function propchange() {
    if (!self prophaschangesleft()) {
        return;
    }
    if (!level.console) {
        var_17d6ea37 = 300;
        if (isdefined(self.lastpropchangetime) && gettime() - self.lastpropchangetime < var_17d6ea37) {
            return;
        }
        self.lastpropchangetime = gettime();
    }
    self notify(#"changed_prop");
    registerpreviousprop(self);
    self.prop.info = prop::getnextprop(self);
    /#
        if (getdvarint(#"hash_1463efb6c1a55cd3", 0) != 0) {
            self.prop.info = level.proplist[self.debugnextpropindex];
            self.debugnextpropindex++;
            if (self.debugnextpropindex >= level.proplist.size) {
                self.debugnextpropindex = 0;
            }
        }
    #/
    self propchangeto(self.prop.info);
    if (level.phsettings.var_bca517c5) {
        playfxontag("player/fx_plyr_clone_reaper_appear", self.prop, "tag_origin");
    }
    self prop::function_239d2233(int(prop::getprophealth(self.prop.info)));
    self setnormalhealth(1);
    self setnewabilitycount(self.currentability);
    self setnewabilitycount("CLONE");
    if (prop::useprophudserver()) {
        self.abilitykey.alpha = 1;
        self.clonekey.alpha = 1;
    }
    /#
        if (getdvarint(#"hash_1463efb6c1a55cd3", 0) != 0) {
            return;
        }
    #/
    self propdeductchange();
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x22e5723a, Offset: 0x1a58
// Size: 0x32
function prophaschangesleft() {
    /#
        if (isdefined(self.var_f18a4260) && self.var_f18a4260) {
            return true;
        }
    #/
    return self.changesleft > 0;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x5594c398, Offset: 0x1a98
// Size: 0x44
function propdeductchange() {
    /#
        if (isdefined(self.var_f18a4260) && self.var_f18a4260) {
            return;
        }
    #/
    propsetchangesleft(self.changesleft - 1);
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x544c2341, Offset: 0x1ae8
// Size: 0x94
function propsetchangesleft(newvalue) {
    self.changesleft = newvalue;
    if (prop::useprophudserver()) {
        self.changepropkey setvalue(self.changesleft);
        if (self.changesleft <= 0) {
            self.changepropkey.alpha = 0.5;
        }
        self clientfield::set_player_uimodel("hudItems.numPropChanges", self.changesleft);
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x226d8755, Offset: 0x1b88
// Size: 0x3ec
function propchangeto(info) {
    self.prop.info = info;
    self.propinfo = info;
    if (level.phsettings.var_bca517c5) {
        var_2b249f2c = self.propent.angles;
        var_c1de4a4e = self.prop.angles;
        var_fd85abcf = self.angles;
    }
    self.prop setmodel(info.modelname);
    self.prop.xyzoffset = info.xyzoffset;
    self.prop.anglesoffset = info.anglesoffset;
    self.prop setscale(info.propscale);
    self.prop unlink();
    self.propent unlink();
    self.propent.origin = self.propanchor.origin;
    self.prop.origin = self.propent.origin;
    self.propent.angles = (self.angles[0], self.propent.angles[1], self.angles[2]);
    self.prop.angles = self.propent.angles;
    if (isdefined(self.isangleoffset) && self.isangleoffset) {
        self.prop.angles = self.angles;
        self.isangleoffset = 0;
    }
    self prop::applyxyzoffset();
    self prop::applyanglesoffset();
    if (level.phsettings.var_bca517c5) {
        self.propent.angles = var_2b249f2c;
        self.prop.angles = var_c1de4a4e;
        self.angles = var_fd85abcf;
    }
    self.prop linkto(self.propent);
    if (self.slopelocked && isdefined(self.lock) && self.lock) {
        self.propent set_pitch_roll_for_ground_normal(self.prop);
    }
    self.propent linkto(self.propanchor);
    self.thirdpersonrange = info.proprange;
    self.thirdpersonheightoffset = info.propheight;
    self setclientthirdperson(1);
    clientfield::set_to_player("PROP.cameraRange", int(self.thirdpersonrange / 10));
    clientfield::set_to_player("PROP.cameraHeight", int(self.thirdpersonheightoffset / 10));
    clientfield::set_to_player("PROP.change_prop", !clientfield::get_to_player("PROP.change_prop"));
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x426196de, Offset: 0x1f80
// Size: 0x22a
function propmatchslope() {
    if (!(isdefined(self.slopelocked) && self.slopelocked)) {
        self.slopelocked = 1;
        if (isdefined(self.lock) && self.lock) {
            self.propent unlink();
            self.propent set_pitch_roll_for_ground_normal(self.prop);
            self.propent linkto(self.propanchor);
        }
        if (prop::useprophudserver()) {
            if (self is_player_gamepad_enabled()) {
                self.matchslopekey.label = #"hash_6ca8e1ea720ba9f";
            } else {
                self.matchslopekey.label = #"hash_3cd8ecbf9f39b3e9";
            }
        }
        return;
    }
    self.slopelocked = 0;
    if (isdefined(self.lock) && self.lock) {
        self.propent unlink();
        self.propent.angles = (self.angles[0], self.propent.angles[1], self.angles[2]);
        self.propent.origin = self.propanchor.origin;
        self.propent linkto(self.propanchor);
    }
    if (prop::useprophudserver()) {
        if (self is_player_gamepad_enabled()) {
            self.matchslopekey.label = #"hash_7f59350f5f223501";
            return;
        }
        self.matchslopekey.label = #"hash_4c7fbb5c1ccd5107";
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xc46dcf80, Offset: 0x21b8
// Size: 0x6c
function propability() {
    if (!level flag::get("props_hide_over")) {
        return;
    }
    if (self prophasflashesleft()) {
        self thread flashenemies();
        self propdeductflash();
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x99c7ee8, Offset: 0x2230
// Size: 0x44
function propclonepower() {
    if (prophasclonesleft()) {
        self thread cloneprop();
        self thread propdeductclonechange();
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x10676e4f, Offset: 0x2280
// Size: 0x32
function prophasclonesleft() {
    /#
        if (isdefined(self.var_7ddbf78d) && self.var_7ddbf78d) {
            return true;
        }
    #/
    return self.clonesleft > 0;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x5d670e89, Offset: 0x22c0
// Size: 0x44
function propdeductclonechange() {
    /#
        if (isdefined(self.var_7ddbf78d) && self.var_7ddbf78d) {
            return;
        }
    #/
    propsetclonesleft(self.clonesleft - 1);
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x37211b16, Offset: 0x2310
// Size: 0xdc
function propsetclonesleft(newvalue) {
    self.clonesleft = newvalue;
    if (prop::useprophudserver() && isdefined(self) && isalive(self) && isdefined(self.clonekey)) {
        self.clonekey setvalue(self.clonesleft);
        if (self.clonesleft <= 0) {
            self.clonekey.alpha = 0.5;
        } else {
            self.clonekey.alpha = 1;
        }
        self clientfield::set_player_uimodel("hudItems.numPropDecoys", self.clonesleft);
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x2129fe4e, Offset: 0x23f8
// Size: 0x32
function prophasflashesleft() {
    /#
        if (isdefined(self.var_d0e95c44) && self.var_d0e95c44) {
            return true;
        }
    #/
    return self.abilityleft > 0;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xe39a22e4, Offset: 0x2438
// Size: 0x44
function propdeductflash() {
    /#
        if (isdefined(self.var_d0e95c44) && self.var_d0e95c44) {
            return;
        }
    #/
    propsetflashesleft(self.abilityleft - 1);
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x2bbd444f, Offset: 0x2488
// Size: 0x94
function propsetflashesleft(newvalue) {
    self.abilityleft = newvalue;
    if (prop::useprophudserver()) {
        self.abilitykey setvalue(self.abilityleft);
        if (self.abilityleft <= 0) {
            self.abilitykey.alpha = 0.5;
        }
        self clientfield::set_player_uimodel("hudItems.numPropConcusses", self.abilityleft);
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x7c3e1cf0, Offset: 0x2528
// Size: 0x1ba
function set_pitch_roll_for_ground_normal(traceignore) {
    groundnormal = get_ground_normal(traceignore, 0);
    if (!isdefined(groundnormal)) {
        return;
    }
    var_bcd5e04 = anglestoforward(self.angles);
    ovr = anglestoright(self.angles);
    new_angles = vectortoangles(groundnormal);
    pitch = angleclamp180(new_angles[0] + 90);
    new_angles = (0, new_angles[1], 0);
    var_c13d4c82 = anglestoforward(new_angles);
    mod = vectordot(var_c13d4c82, ovr);
    if (mod < 0) {
        mod = -1;
    } else {
        mod = 1;
    }
    dot = vectordot(var_c13d4c82, var_bcd5e04);
    newpitch = dot * pitch;
    newroll = (1 - abs(dot)) * pitch * mod;
    self.angles = (newpitch, self.angles[1], newroll);
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xa5608ec1, Offset: 0x26f0
// Size: 0xc0
function function_c0665212(shouldignore) {
    foreach (player in level.players) {
        if (isdefined(player.prop)) {
            if (shouldignore) {
                player.prop notsolid();
                continue;
            }
            player.prop solid();
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xf185ba9f, Offset: 0x27b8
// Size: 0x124
function function_5b73beef(shouldignore) {
    foreach (player in level.players) {
        if (isdefined(player.propclones)) {
            foreach (clone in player.propclones) {
                if (isdefined(clone)) {
                    if (shouldignore) {
                        clone notsolid();
                        continue;
                    }
                    clone solid();
                }
            }
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0x8490755f, Offset: 0x28e8
// Size: 0x3c0
function get_ground_normal(traceignore, debug) {
    if (!isdefined(traceignore)) {
        ignore = self;
    } else {
        ignore = traceignore;
    }
    tracepoints = array(self.origin);
    if (getdvarint(#"hash_32aee631b4444f90", 1)) {
        for (i = -1; i <= 1; i = i + 2) {
            for (j = -1; j <= 1; j = j + 2) {
                corner = ignore getpointinbounds(i, j, 0);
                corner = (corner[0], corner[1], self.origin[2]);
                tracepoints[tracepoints.size] = corner;
            }
        }
    }
    function_c0665212(1);
    avgnormal = (0, 0, 0);
    tracehitcount = 0;
    foreach (point in tracepoints) {
        trace = bullettrace(point + (0, 0, 4), point + (0, 0, -16), 0, ignore);
        tracehit = trace[#"fraction"] > 0 && trace[#"fraction"] < 1;
        if (tracehit) {
            avgnormal = avgnormal + trace[#"normal"];
            tracehitcount++;
        }
        /#
            if (debug) {
                if (tracehit) {
                    line(point, point + trace[#"normal"] * 30, (0, 1, 0));
                    continue;
                }
                sphere(point, 3, (1, 0, 0));
            }
        #/
    }
    function_c0665212(0);
    if (tracehitcount > 0) {
        avgnormal = avgnormal / tracehitcount;
        /#
            if (debug) {
                line(self.origin, self.origin + avgnormal * 20, (1, 1, 1));
            }
        #/
        return avgnormal;
    }
    /#
        if (debug) {
            sphere(self.origin, 5, (1, 0, 0));
        }
    #/
    return undefined;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x6732728b, Offset: 0x2cb0
// Size: 0x192
function propmoveunlock() {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    var_554b8919 = 0;
    var_cd6d7e01 = 0;
    var_de410ab8 = 0;
    while (true) {
        waitframe(1);
        movement = self getnormalizedmovement();
        jumping = self jumpbuttonpressed();
        if (!isdefined(movement)) {
            continue;
        }
        ismoving = movement[0] != 0 || movement[1] != 0 || jumping;
        if (self.lock && var_de410ab8 && !ismoving) {
            var_de410ab8 = 0;
        } else if (self.lock && !var_554b8919 && ismoving) {
            var_de410ab8 = 1;
        } else if (self.lock && ismoving && !var_de410ab8) {
            self unlockprop();
        }
        var_554b8919 = self.lock;
        var_cd6d7e01 = ismoving;
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x49f318f5, Offset: 0x2e50
// Size: 0x214
function unlockprop() {
    if (isdefined(self.var_fb6d3a39) && abs(self.var_fb6d3a39 - gettime()) <= 100) {
        return;
    }
    self.var_fb6d3a39 = gettime();
    self unlink();
    self resetdoublejumprechargetime();
    offset = self.propanchor.origin - self.origin;
    offsetangles = self.propanchor.angles - self.angles;
    if (self.slopelocked) {
        self.propent unlink();
        self.propent.angles = (self.angles[0], self.propent.angles[1], self.angles[2]);
        self.propent.origin = self.propanchor.origin;
        self.propent linkto(self.propanchor);
    }
    waitframe(1);
    if (isdefined(self)) {
        if (isdefined(self.propanchor)) {
            self.propanchor.angles = self.angles + offsetangles;
            self.propanchor.origin = self.origin + offset;
            self.propanchor linkto(self);
        }
        self.lock = 0;
        if (prop::useprophudserver()) {
            self.lockpropkey.label = #"mp_ph_lock";
            self thread flashlockpropkey();
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x54cd4e, Offset: 0x3070
// Size: 0x144
function lockprop() {
    if (!canlock()) {
        return;
    }
    self.propanchor unlink();
    self.propanchor.origin = self.origin;
    self playerlinkto(self.propanchor);
    if (self.slopelocked) {
        self.propent unlink();
        self.propent set_pitch_roll_for_ground_normal(self.prop);
        self.propent.origin = self.origin;
        self.propent linkto(self.propanchor);
    }
    self.lock = 1;
    self notify(#"locked");
    if (prop::useprophudserver()) {
        self.lockpropkey.label = #"mp_ph_locked";
        self thread flashlockpropkey();
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xd7e8357d, Offset: 0x31c0
// Size: 0xf6
function flashlockpropkey() {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    self notify(#"flashlockpropkey");
    self endon(#"flashlockpropkey");
    if (!isdefined(self.lockpropkey.startfontscale)) {
        self.lockpropkey.startfontscale = 1;
    }
    newscale = self.lockpropkey.startfontscale + 0.75;
    self.lockpropkey.fontscale = newscale;
    wait(0.1);
    if (isdefined(self.lockpropkey)) {
        self.lockpropkey.fontscale = self.lockpropkey.startfontscale;
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x7c115f50, Offset: 0x32c0
// Size: 0x72
function function_56cae8fa() {
    assert(isplayer(self));
    start = self.origin;
    end = start + (0, 0, -2000);
    return playerphysicstrace(start, end);
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xb2a4e3da, Offset: 0x3340
// Size: 0x92
function function_97f02d5c() {
    assert(isplayer(self));
    start = self.origin;
    end = start + (0, 0, -2000);
    trace = bullettrace(start, end, 0, self.prop);
    return trace;
}

// Namespace prop_controls/_prop_controls
// Params 9, eflags: 0x0
// Checksum 0x4edd1b26, Offset: 0x33e0
// Size: 0x19a
function function_6de7bc19(success, type, player, origin1, text1, origin2, text2, origin3, text3) {
    /#
        if (!isdefined(level.var_f8f7808e)) {
            level.var_f8f7808e = spawnstruct();
        }
        level.var_f8f7808e.success = success;
        level.var_f8f7808e.type = type;
        level.var_f8f7808e.playerorg = player.origin;
        level.var_f8f7808e.playerangles = player.angles;
        level.var_f8f7808e.playermins = player getmins();
        level.var_f8f7808e.playermaxs = player getmaxs();
        level.var_f8f7808e.origin1 = origin1;
        level.var_f8f7808e.text1 = text1;
        level.var_f8f7808e.origin2 = origin2;
        level.var_f8f7808e.text2 = text2;
        level.var_f8f7808e.origin3 = origin3;
        level.var_f8f7808e.text3 = text3;
    #/
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x9aec46f6, Offset: 0x3588
// Size: 0x672
function canlock() {
    killtriggers = getentarray("trigger_hurt", "classname");
    oobtriggers = getentarray("trigger_out_of_bounds", "classname");
    triggers = arraycombine(killtriggers, oobtriggers, 0, 0);
    var_1bc5fbd6 = getentarray("prop_no_lock", "targetname");
    if (var_1bc5fbd6.size > 0) {
        triggers = arraycombine(triggers, var_1bc5fbd6, 0, 0);
    }
    foreach (trigger in triggers) {
        if (trigger istouchingvolume(self.origin, self getmins(), self getmaxs())) {
            /#
                function_6de7bc19(0, "<unknown string>", self, trigger.origin, trigger.classname);
            #/
            return 0;
        }
    }
    if (self isplayerswimming()) {
        /#
            function_6de7bc19(1, "<unknown string>", self);
        #/
        return 1;
    }
    if (!self isonground() || self iswallrunning()) {
        trace1 = self function_97f02d5c();
        frac = trace1[#"fraction"];
        org1 = trace1[#"position"];
        if (frac == 1) {
            /#
                function_6de7bc19(0, "<unknown string>", self, org1, "<unknown string>");
            #/
            return 0;
        }
        foreach (trigger in triggers) {
            if (trigger istouchingvolume(org1, self getmins(), self getmaxs())) {
                /#
                    function_6de7bc19(0, "<unknown string>", self, trigger.origin, trigger.classname);
                #/
                return 0;
            }
        }
        point = getnearestpathpoint(org1, 256);
        if (!isdefined(point)) {
            /#
                function_6de7bc19(0, "<unknown string>", self, org1);
            #/
            return 0;
        }
        var_734faed8 = point[2] - org1[2];
        if (var_734faed8 > 50) {
            point2 = getnearestpathpoint(org1, 50);
            if (!isdefined(point2)) {
                /#
                    function_6de7bc19(0, "<unknown string>", self, org1, "<unknown string>", point, "<unknown string>");
                #/
                return 0;
            }
        }
        dist2d = distance2d(point, org1);
        if (dist2d > 100) {
            /#
                function_6de7bc19(0, "<unknown string>", self, org1, "<unknown string>", point, "<unknown string>");
            #/
            return 0;
        }
        org2 = self function_56cae8fa();
        foreach (trigger in triggers) {
            if (trigger istouchingvolume(org2, self getmins(), self getmaxs())) {
                /#
                    function_6de7bc19(0, "<unknown string>", self, trigger.origin, trigger.classname);
                #/
                return 0;
            }
        }
        /#
            function_6de7bc19(1, "<unknown string>", self, org1, "<unknown string>", org2, "<unknown string>", point, "<unknown string>" + distance(org1, point));
        #/
        return 1;
    }
    /#
        function_6de7bc19(1, "<unknown string>", self);
    #/
    return 1;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xbf4d826f, Offset: 0x3c08
// Size: 0x1c0
function propcamerazoom() {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    var_fc464c9b = 10;
    self.thirdpersonrange = self.prop.info.proprange;
    while (true) {
        waitresult = self waittill(#"zoomin", #"zoomout");
        zoom = waitresult._notify;
        if (!isdefined(zoom)) {
            continue;
        }
        if (zoom == "zoomin") {
            if (self.thirdpersonrange - var_fc464c9b < 50) {
                continue;
            }
            self.thirdpersonrange = self.thirdpersonrange - var_fc464c9b;
            self setclientthirdperson(1);
            continue;
        }
        if (zoom == "zoomout") {
            var_70fc228b = math::clamp(self.prop.info.proprange + 50, 50, 360);
            if (self.thirdpersonrange + var_fc464c9b > var_70fc228b) {
                continue;
            }
            self.thirdpersonrange = self.thirdpersonrange + var_fc464c9b;
            self setclientthirdperson(1);
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x70fb9d38, Offset: 0x3dd0
// Size: 0x82
function setnewabilityhud() {
    switch (self.currentability) {
    case #"flash":
        self.abilitykey.label = #"mp_ph_flash";
        break;
    default:
        assertmsg("<unknown string>");
        break;
    }
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0xaa9f3a78, Offset: 0x3e60
// Size: 0xea
function setnewabilitycount(var_8c8fd413, count) {
    switch (var_8c8fd413) {
    case #"flash":
        if (!isdefined(count)) {
            count = level.phsettings.propnumflashes;
        }
        propsetflashesleft(count);
        break;
    case #"clone":
        if (!isdefined(count)) {
            count = level.phsettings.propnumclones;
        }
        propsetclonesleft(count);
        break;
    default:
        assertmsg("<unknown string>" + var_8c8fd413);
        break;
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xd92fafc, Offset: 0x3f58
// Size: 0x2e
function endondeath() {
    self waittill(#"death");
    waittillframeend();
    self notify(#"end_explode");
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x9e5e107d, Offset: 0x3f90
// Size: 0xbc
function flashtheprops(var_c8c9bf0f) {
    level endon(#"game_ended");
    var_c8c9bf0f endon(#"disconnect");
    self thread endondeath();
    self endon(#"end_explode");
    res = self waittill(#"explode");
    position = res.position;
    if (!isdefined(var_c8c9bf0f)) {
        return;
    }
    flashenemies(var_c8c9bf0f, position);
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0xb88bf913, Offset: 0x4058
// Size: 0x10e
function flashenemies(var_c8c9bf0f = self, position = self.origin) {
    fwd = anglestoforward(var_c8c9bf0f getplayerangles());
    fwd = vectornormalize((fwd[0], fwd[1], 0));
    var_ec24ae95 = fwd * 60;
    spawn_pos = position + (0, 0, 10) + fwd * 30;
    concuss = var_c8c9bf0f magicmissile(getweapon(#"hash_25d3ed64dda487d"), spawn_pos, var_ec24ae95);
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xeb6e1ea2, Offset: 0x4170
// Size: 0x1ba
function deletepropsifatmax() {
    var_5c6eb952 = 9;
    if (level.phsettings.var_5b677bf1) {
        var_5c6eb952 = 27;
    }
    if (self.propclones.size + 1 <= var_5c6eb952) {
        return;
    }
    var_a78751de = 0;
    foreach (clone in self.propclones) {
        if (isdefined(clone)) {
            var_a78751de++;
        }
    }
    if (var_a78751de + 1 <= var_5c6eb952) {
        return;
    }
    clones = [];
    var_ccb1dd7 = undefined;
    for (i = 0; i < self.propclones.size; i++) {
        clone = self.propclones[i];
        if (!isdefined(clone)) {
            continue;
        }
        if (!isdefined(var_ccb1dd7)) {
            var_ccb1dd7 = clone;
            continue;
        }
        clones[clones.size] = clone;
    }
    assert(isdefined(var_ccb1dd7));
    var_ccb1dd7 notify(#"maxdelete");
    var_ccb1dd7 delete();
    self.propclones = clones;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xed66effe, Offset: 0x4338
// Size: 0x23e
function cloneprop() {
    if (!isdefined(self.propclones)) {
        self.propclones = [];
    } else {
        deletepropsifatmax();
    }
    var_6e55957c = spawn("script_model", self.prop.origin);
    var_6e55957c.targetname = "propClone";
    var_6e55957c setmodel(self.prop.model);
    var_6e55957c setscale(self.prop.info.propscale);
    var_6e55957c.angles = self.prop.angles;
    var_6e55957c setcandamage(1);
    var_6e55957c.fakehealth = 50;
    var_6e55957c.health = 99999;
    var_6e55957c.maxhealth = 99999;
    var_6e55957c.playerowner = self;
    var_6e55957c thread prop::function_aa8db165(&damageclonewatch);
    var_6e55957c setplayercollision(0);
    var_6e55957c makesentient();
    var_6e55957c clientfield::set("enemyequip", 2);
    if (prop::function_5a6214bd()) {
        var_6e55957c hidefromteam(game.attackers);
        var_6e55957c notsolid();
    }
    if (level.phsettings.var_5b677bf1) {
        var_6e55957c.fakehealth = 100;
    }
    self.propclones[self.propclones.size] = var_6e55957c;
}

// Namespace prop_controls/_prop_controls
// Params 10, eflags: 0x0
// Checksum 0x6f3e980e, Offset: 0x4580
// Size: 0x17e
function damageclonewatch(damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, weapon, idflags) {
    if (!isdefined(attacker)) {
        return;
    }
    if (isplayer(attacker)) {
        if (isdefined(self.isdying) && self.isdying) {
            return;
        }
        if (isdefined(weapon) && weapon.rootweapon.name == "concussion_grenade" && isdefined(meansofdeath) && meansofdeath != "MOD_IMPACT") {
            function_d04b961(attacker, undefined, meansofdeath, damage, point, weapon);
        }
        attacker thread damagefeedback::update();
        self.lastattacker = attacker;
        self.fakehealth = self.fakehealth - damage;
        if (self.fakehealth <= 0) {
            self function_d1a1cc8d();
            return;
        }
    }
    self.health = self.health + damage;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x7b0cf19c, Offset: 0x4708
// Size: 0x10c
function function_d1a1cc8d() {
    if (isdefined(self.lastattacker)) {
        scoreevents::processscoreevent("clone_destroyed", self.lastattacker);
        if (isdefined(self.playerowner)) {
            scoreevents::processscoreevent("clone_was_destroyed", self.playerowner);
        }
    }
    if (!isdefined(self.isdying)) {
        self.isdying = 1;
    }
    playsoundatposition("wpn_flash_grenade_explode", self.origin + (0, 0, 4));
    playfx(fx::get("propDeathFX"), self.origin + (0, 0, 4));
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace prop_controls/_prop_controls
// Params 3, eflags: 0x0
// Checksum 0x68f2db73, Offset: 0x4820
// Size: 0x212
function function_d8b858d4(var_2953b091, fade_in_time, fade_out_time) {
    level endon(#"game_ended");
    self endon(#"disconnect");
    if (!isdefined(var_2953b091)) {
        var_2953b091 = 5;
    }
    if (!isdefined(fade_in_time)) {
        fade_in_time = 1;
    }
    if (!isdefined(fade_out_time)) {
        fade_out_time = 1;
    }
    overlay = spawnstruct();
    overlay.foreground = 0;
    overlay.x = 0;
    overlay.y = 0;
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = 0;
    waitframe(1);
    if (fade_in_time < 0) {
    }
    overlay.alpha = 1;
    self prop::function_1ee6f124(fade_in_time);
    self useservervisionset(1);
    self setvisionsetforplayer("blackout_ph", fade_in_time);
    self prop::function_1ee6f124(var_2953b091 - fade_out_time - fade_in_time);
    if (fade_out_time < 0) {
    }
    overlay.alpha = 0;
    self useservervisionset(0);
    self setvisionsetforplayer("blackout_ph", fade_out_time);
    self prop::function_1ee6f124(fade_out_time);
    waitframe(1);
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xeeedc4ab, Offset: 0x4a40
// Size: 0xee
function watchspecialgrenadethrow() {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    self notify(#"watchspecialgrenadethrow");
    self endon(#"watchspecialgrenadethrow");
    while (true) {
        res = self waittill(#"grenade_fire");
        grenade = res.projectile;
        weapon = res.weapon;
        self thread trackgrenade(grenade, weapon);
        self.thrownspecialcount = self.thrownspecialcount + 1;
    }
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0x26aefc5b, Offset: 0x4b38
// Size: 0x124
function trackgrenade(grenade, weapon) {
    level endon(#"game_ended");
    self endon(#"disconnect");
    res = grenade waittill(#"explode");
    damageorigin = res.position;
    if (!isdefined(level.var_fe458fef)) {
        level.var_fe458fef = [];
    }
    index = function_5d3e918a(damageorigin);
    if (!isdefined(index)) {
        index = function_7278d508(self, damageorigin, weapon, 1, "MOD_GRENADE_SPLASH");
    }
    waitframe(1);
    waitframe(1);
    self function_58699cee(index);
    waitframe(1);
    level.var_fe458fef[index] = undefined;
}

// Namespace prop_controls/_prop_controls
// Params 5, eflags: 0x0
// Checksum 0x111b0f57, Offset: 0x4c68
// Size: 0x112
function function_7278d508(attacker, damageorigin, weapon, damage, meansofdeath) {
    index = level.var_fe458fef.size;
    level.var_fe458fef[index] = spawnstruct();
    level.var_fe458fef[index].players = [];
    level.var_fe458fef[index].attacker = self;
    level.var_fe458fef[index].damageorigin = damageorigin;
    level.var_fe458fef[index].damage = damage;
    level.var_fe458fef[index].meansofdeath = meansofdeath;
    level.var_fe458fef[index].weapon = weapon;
    return index;
}

// Namespace prop_controls/_prop_controls
// Params 6, eflags: 0x0
// Checksum 0xe782f11a, Offset: 0x4d88
// Size: 0xee
function function_d04b961(attacker, var_28a0d57c, meansofdeath, damage, damageorigin, weapon) {
    if (!isdefined(level.var_fe458fef)) {
        level.var_fe458fef = [];
    }
    index = function_5d3e918a(damageorigin);
    if (!isdefined(index)) {
        index = function_7278d508(attacker, damageorigin, weapon, damage, meansofdeath);
    }
    if (isdefined(var_28a0d57c)) {
        playerindex = level.var_fe458fef[index].players.size;
        level.var_fe458fef[index].players[playerindex] = var_28a0d57c;
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x590b3ca4, Offset: 0x4e80
// Size: 0x9a
function function_5d3e918a(damageorigin) {
    if (!isdefined(level.var_fe458fef)) {
        return;
    }
    foreach (index, event in level.var_fe458fef) {
        if (event.damageorigin == damageorigin) {
            return index;
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xe8c63617, Offset: 0x4f28
// Size: 0x2f4
function function_58699cee(index) {
    if (!isdefined(level.var_fe458fef) || !isdefined(level.var_fe458fef[index].attacker)) {
        return;
    }
    weapon = level.var_fe458fef[index].weapon;
    damageorigin = level.var_fe458fef[index].damageorigin;
    expradius = weapon.explosionradius;
    var_1c404e8 = expradius * expradius;
    foreach (player in level.players) {
        if (!player util::isprop() || !isalive(player) || player function_791579c9(index)) {
            continue;
        }
        distsq = distancesquared(damageorigin, player.origin);
        if (distsq <= var_1c404e8) {
            function_e896a36a(0);
            function_45534e6c(0);
            function_d08dcbaf(1);
            function_44a27dd6(0);
            damage = level.var_fe458fef[index].damage;
            attacker = level.var_fe458fef[index].attacker;
            meansofdeath = level.var_fe458fef[index].meansofdeath;
            attacker radiusdamage(damageorigin, expradius, damage, damage, attacker, meansofdeath, weapon);
            function_e896a36a(1);
            function_45534e6c(1);
            function_d08dcbaf(0);
            function_44a27dd6(1);
            break;
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x5559b76d, Offset: 0x5228
// Size: 0x170
function function_e896a36a(issolid) {
    foreach (player in level.players) {
        if (isdefined(player.prop)) {
            if (issolid) {
                if (isdefined(player.prop.var_7ccb9924)) {
                    player.prop setcontents(player.prop.var_7ccb9924);
                }
                player.prop solid();
                continue;
            }
            if (!isdefined(player.prop.var_7ccb9924)) {
                player.prop.var_7ccb9924 = player.prop setcontents(0);
            } else {
                player.prop setcontents(0);
            }
            player.prop notsolid();
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x536bba3f, Offset: 0x53a0
// Size: 0x1ac
function function_45534e6c(issolid) {
    foreach (player in level.players) {
        if (isdefined(player.propclones)) {
            foreach (clone in player.propclones) {
                if (isdefined(clone)) {
                    if (issolid) {
                        if (isdefined(clone.var_fc18a70a)) {
                            clone setcontents(clone.var_fc18a70a);
                        }
                        clone solid();
                        continue;
                    }
                    if (!isdefined(clone.var_fc18a70a)) {
                        clone.var_fc18a70a = clone setcontents(0);
                    } else {
                        clone setcontents(0);
                    }
                    clone notsolid();
                }
            }
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xb15af817, Offset: 0x5558
// Size: 0x128
function function_d08dcbaf(issolid) {
    foreach (player in level.players) {
        if (!player util::isprop() || !isalive(player)) {
            continue;
        }
        if (issolid) {
            player setcontents(level.phsettings.playercontents);
            player solid();
            continue;
        }
        player setcontents(0);
        player notsolid();
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x4e1b14b3, Offset: 0x5688
// Size: 0x128
function function_44a27dd6(issolid) {
    foreach (player in level.players) {
        if (!player prop::function_84793f03() || !isalive(player)) {
            continue;
        }
        if (issolid) {
            player setcontents(level.phsettings.playercontents);
            player solid();
            continue;
        }
        player setcontents(0);
        player notsolid();
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x4e88248f, Offset: 0x57b8
// Size: 0x4e
function function_d3b8a20e(damageorigin) {
    index = function_5d3e918a(damageorigin);
    if (isdefined(index)) {
        return self function_791579c9(index);
    }
    return 0;
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x763c849, Offset: 0x5810
// Size: 0x9a
function function_791579c9(index) {
    foreach (var_f21c4191 in level.var_fe458fef[index].players) {
        if (isdefined(var_f21c4191) && var_f21c4191 == self) {
            return true;
        }
    }
    return false;
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0x78c68793, Offset: 0x58b8
// Size: 0x2a
function safesetalpha(hudelem, var_9c73f6bb) {
    if (isdefined(hudelem)) {
        hudelem.alpha = var_9c73f6bb;
    }
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0xed078046, Offset: 0x58f0
// Size: 0x164
function propabilitykeysvisible(visible, override) {
    if (isdefined(visible) && visible) {
        alphavalue = 1;
    } else {
        alphavalue = 0;
    }
    if (prop::useprophudserver() || isdefined(override) && override) {
        safesetalpha(self.changepropkey, alphavalue);
        safesetalpha(self.spinpropkey, alphavalue);
        safesetalpha(self.lockpropkey, alphavalue);
        safesetalpha(self.matchslopekey, alphavalue);
        safesetalpha(self.abilitykey, alphavalue);
        safesetalpha(self.clonekey, alphavalue);
        safesetalpha(self.zoomkey, alphavalue);
        safesetalpha(self.var_8e3b5c8c, alphavalue);
        if (!(isdefined(level.nopropsspectate) && level.nopropsspectate)) {
            safesetalpha(self.spectatekey, alphavalue);
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x9ec2312, Offset: 0x5a60
// Size: 0xe2
function function_2b14e8b1() {
    if (!isdefined(self.var_b251eb4f)) {
        self.var_b251eb4f = 1;
    } else {
        self.var_b251eb4f = !self.var_b251eb4f;
    }
    if (self.var_b251eb4f) {
        self clientfield::set_to_player("PROP.hide_prop", 1);
        if (prop::useprophudserver()) {
            self.var_8e3b5c8c.label = #"hash_54ba1311175de71e";
        }
        return;
    }
    self clientfield::set_to_player("PROP.hide_prop", 0);
    if (prop::useprophudserver()) {
        self.var_8e3b5c8c.label = #"hash_fb73fdc2aff963f";
    }
}


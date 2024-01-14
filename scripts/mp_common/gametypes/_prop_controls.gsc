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
    /#
        assert(isplayer(self));
    #/
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
function function_9024fce3(var_59b87232, command) {
    while (1) {
        while (!self [[ var_59b87232 ]]()) {
            waitframe(1);
        }
        self notify(command);
        while (self [[ var_59b87232 ]]()) {
            waitframe(1);
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0x4b99ad1a, Offset: 0x940
// Size: 0x5c
function function_21e5a72f(var_59b87232, command) {
    while (1) {
        while (!self [[ var_59b87232 ]]()) {
            waitframe(1);
        }
        while (self [[ var_59b87232 ]]()) {
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
function addupperrighthudelem(label, value, text, var_c1988642) {
    hudelem = spawnstruct();
    hudelem.x = -15;
    hudelem.y = self.var_8b393c32;
    hudelem.alignx = "right";
    hudelem.aligny = "bottom";
    hudelem.horzalign = "right";
    hudelem.vertalign = "bottom";
    hudelem.archived = 1;
    hudelem.alpha = 1;
    hudelem.glowalpha = 0;
    hudelem.hidewheninmenu = 1;
    hudelem.hidewheninkillcam = 1;
    hudelem.var_8efb654e = hudelem.fontscale;
    if (isdefined(label) && isdefined(var_c1988642)) {
        if (self is_player_gamepad_enabled()) {
            hudelem.label = label;
        } else {
            hudelem.label = var_c1988642;
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
    self.var_8b393c32 = self.var_8b393c32 - 20;
    return hudelem;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x55d18b1, Offset: 0xe60
// Size: 0x1e4
function propcontrolshud() {
    /#
        assert(!isdefined(self.var_8060636f));
    #/
    if (self issplitscreen()) {
        self.var_8b393c32 = -10;
    } else {
        self.var_8b393c32 = -80;
    }
    self.var_5478a045 = addupperrighthudelem();
    self.var_e8c312d7 = addupperrighthudelem(#"hash_2f560292a2fb7eab");
    self.var_8060636f = addupperrighthudelem(#"mp_ph_change", 0);
    self.var_8b393c32 = self.var_8b393c32 - 20;
    self.var_8e3b5c8c = addupperrighthudelem(#"hash_fb73fdc2aff963f");
    self.var_a4da95c7 = addupperrighthudelem(#"hash_7f59350f5f223501", undefined, undefined, #"hash_4c7fbb5c1ccd5107");
    self.var_4901798a = addupperrighthudelem(#"mp_ph_lock");
    self.var_aa57a992 = addupperrighthudelem(#"mp_ph_spin", undefined, undefined, #"hash_39e61050ab8d325e");
    self function_138e42e4();
    self.var_65efe125 = addupperrighthudelem(#"mp_ph_zoom");
    self thread function_ec04079a();
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
function function_b13f931a(hudelem) {
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
    self.var_8060636f = undefined;
    self.var_aa57a992 = undefined;
    self.var_4901798a = undefined;
    self.var_a4da95c7 = undefined;
    self.var_5478a045 = undefined;
    self.var_65efe125 = undefined;
    self.var_a93978b9 = undefined;
    self.var_e8c312d7 = undefined;
    self.var_8e3b5c8c = undefined;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x131b0f2b, Offset: 0x1158
// Size: 0x1ac
function function_ec04079a() {
    level endon(#"game_ended");
    self endon(#"disconnect", #"death");
    if (level.console) {
        return;
    }
    waittillframeend();
    var_8671d17 = self is_player_gamepad_enabled();
    while (1) {
        var_4084aa7 = self is_player_gamepad_enabled();
        if (var_4084aa7 != var_8671d17) {
            var_8671d17 = var_4084aa7;
            if (var_4084aa7) {
                if (!(isdefined(self.var_98d22839) && self.var_98d22839)) {
                    self.var_a4da95c7.label = #"hash_7f59350f5f223501";
                } else {
                    self.var_a4da95c7.label = #"hash_6ca8e1ea720ba9f";
                }
                self.var_aa57a992.label = #"mp_ph_spin";
            } else {
                if (!(isdefined(self.var_98d22839) && self.var_98d22839)) {
                    self.var_a4da95c7.label = #"hash_4c7fbb5c1ccd5107";
                } else {
                    self.var_a4da95c7.label = #"hash_3cd8ecbf9f39b3e9";
                }
                self.var_aa57a992.label = #"hash_39e61050ab8d325e";
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
    self.var_98d22839 = 0;
    prop::function_241f7953();
    self thread function_68d1fd31();
    self thread function_be19060b();
    self.var_960f723f = 1;
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"lock", #"spin", #"changeprop", #"settoslope", #"propability", #"cloneprop", #"hide");
        msg = waitresult._notify;
        if (!isdefined(msg)) {
            continue;
        }
        waittillframeend();
        if (msg == "lock") {
            self function_22f362d7();
        } else if (msg == "spin") {
            self function_9bc7ac53();
        } else if (msg == "changeProp") {
            self propchange();
        } else if (msg == "setToSlope") {
            self function_e8d4d2b();
        } else if (msg == "propAbility") {
            self propability();
        } else if (msg == "cloneProp") {
            self function_88cea693();
        } else if (msg == "hide") {
            self function_2b14e8b1();
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x6d42ecd, Offset: 0x1598
// Size: 0x54
function function_22f362d7() {
    if (self ismantling()) {
        return;
    }
    if (self.lock) {
        self unlockprop();
    } else {
        self function_fb28c6d5();
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x8658091d, Offset: 0x15f8
// Size: 0xd4
function function_9bc7ac53() {
    self.propent unlink();
    self.propent.angles = self.propent.angles + vectorscale((0, 1, 0), 45);
    self.propent.origin = self.propanchor.origin;
    if (self.var_98d22839 && isdefined(self.lock) && self.lock) {
        self.propent function_3875c0fc(self.prop);
    }
    self.propent linkto(self.propanchor);
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xde69bb17, Offset: 0x16d8
// Size: 0x9a
function function_50f021a8(inplayer) {
    var_d8171b71 = 3;
    if (!isdefined(inplayer.var_a8b38d70)) {
        inplayer.var_a8b38d70 = 0;
    }
    inplayer.usedprops[inplayer.var_a8b38d70] = inplayer.prop.info;
    inplayer.var_a8b38d70++;
    if (inplayer.var_a8b38d70 >= var_d8171b71) {
        inplayer.var_a8b38d70 = 0;
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x9ad276d0, Offset: 0x1780
// Size: 0x2cc
function propchange() {
    if (!self function_a70825e1()) {
        return;
    }
    if (!level.console) {
        var_17d6ea37 = 300;
        if (isdefined(self.var_5764318b) && gettime() - self.var_5764318b < var_17d6ea37) {
            return;
        }
        self.var_5764318b = gettime();
    }
    self notify(#"changed_prop");
    function_50f021a8(self);
    self.prop.info = prop::getnextprop(self);
    /#
        if (getdvarint(#"hash_1463efb6c1a55cd3", 0) != 0) {
            self.prop.info = level.proplist[self.var_960f723f];
            self.var_960f723f++;
            if (self.var_960f723f >= level.proplist.size) {
                self.var_960f723f = 0;
            }
        }
    #/
    self function_c2e4a720(self.prop.info);
    if (level.phsettings.var_bca517c5) {
        playfxontag("player/fx_plyr_clone_reaper_appear", self.prop, "tag_origin");
    }
    self prop::function_239d2233(int(prop::getprophealth(self.prop.info)));
    self setnormalhealth(1);
    self setnewabilitycount(self.currentability);
    self setnewabilitycount("CLONE");
    if (prop::useprophudserver()) {
        self.var_5478a045.alpha = 1;
        self.var_e8c312d7.alpha = 1;
    }
    /#
        if (getdvarint(#"hash_1463efb6c1a55cd3", 0) != 0) {
            return;
        }
    #/
    self function_e1db1de3();
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x22e5723a, Offset: 0x1a58
// Size: 0x32
function function_a70825e1() {
    /#
        if (isdefined(self.var_f18a4260) && self.var_f18a4260) {
            return 1;
        }
    #/
    return self.changesleft > 0;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x5594c398, Offset: 0x1a98
// Size: 0x44
function function_e1db1de3() {
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
        self.var_8060636f setvalue(self.changesleft);
        if (self.changesleft <= 0) {
            self.var_8060636f.alpha = 0.5;
        }
        self clientfield::set_player_uimodel("hudItems.numPropChanges", self.changesleft);
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x226d8755, Offset: 0x1b88
// Size: 0x3ec
function function_c2e4a720(info) {
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
    if (self.var_98d22839 && isdefined(self.lock) && self.lock) {
        self.propent function_3875c0fc(self.prop);
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
function function_e8d4d2b() {
    if (!(isdefined(self.var_98d22839) && self.var_98d22839)) {
        self.var_98d22839 = 1;
        if (isdefined(self.lock) && self.lock) {
            self.propent unlink();
            self.propent function_3875c0fc(self.prop);
            self.propent linkto(self.propanchor);
        }
        if (prop::useprophudserver()) {
            if (self is_player_gamepad_enabled()) {
                self.var_a4da95c7.label = #"hash_6ca8e1ea720ba9f";
            } else {
                self.var_a4da95c7.label = #"hash_3cd8ecbf9f39b3e9";
            }
        }
    } else {
        self.var_98d22839 = 0;
        if (isdefined(self.lock) && self.lock) {
            self.propent unlink();
            self.propent.angles = (self.angles[0], self.propent.angles[1], self.angles[2]);
            self.propent.origin = self.propanchor.origin;
            self.propent linkto(self.propanchor);
        }
        if (prop::useprophudserver()) {
            if (self is_player_gamepad_enabled()) {
                self.var_a4da95c7.label = #"hash_7f59350f5f223501";
            } else {
                self.var_a4da95c7.label = #"hash_4c7fbb5c1ccd5107";
            }
        }
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
    if (self function_5e6d610b()) {
        self thread function_bc073c8d();
        self function_e13c27d7();
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x99c7ee8, Offset: 0x2230
// Size: 0x44
function function_88cea693() {
    if (function_39049635()) {
        self thread cloneprop();
        self thread function_41da91d7();
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x10676e4f, Offset: 0x2280
// Size: 0x32
function function_39049635() {
    /#
        if (isdefined(self.var_7ddbf78d) && self.var_7ddbf78d) {
            return 1;
        }
    #/
    return self.clonesleft > 0;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x5d670e89, Offset: 0x22c0
// Size: 0x44
function function_41da91d7() {
    /#
        if (isdefined(self.var_7ddbf78d) && self.var_7ddbf78d) {
            return;
        }
    #/
    function_85a28bcc(self.clonesleft - 1);
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x37211b16, Offset: 0x2310
// Size: 0xdc
function function_85a28bcc(newvalue) {
    self.clonesleft = newvalue;
    if (prop::useprophudserver() && isdefined(self) && isalive(self) && isdefined(self.var_e8c312d7)) {
        self.var_e8c312d7 setvalue(self.clonesleft);
        if (self.clonesleft <= 0) {
            self.var_e8c312d7.alpha = 0.5;
        } else {
            self.var_e8c312d7.alpha = 1;
        }
        self clientfield::set_player_uimodel("hudItems.numPropDecoys", self.clonesleft);
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x2129fe4e, Offset: 0x23f8
// Size: 0x32
function function_5e6d610b() {
    /#
        if (isdefined(self.var_d0e95c44) && self.var_d0e95c44) {
            return 1;
        }
    #/
    return self.abilityleft > 0;
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xe39a22e4, Offset: 0x2438
// Size: 0x44
function function_e13c27d7() {
    /#
        if (isdefined(self.var_d0e95c44) && self.var_d0e95c44) {
            return;
        }
    #/
    function_59c73c21(self.abilityleft - 1);
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x2bbd444f, Offset: 0x2488
// Size: 0x94
function function_59c73c21(newvalue) {
    self.abilityleft = newvalue;
    if (prop::useprophudserver()) {
        self.var_5478a045 setvalue(self.abilityleft);
        if (self.abilityleft <= 0) {
            self.var_5478a045.alpha = 0.5;
        }
        self clientfield::set_player_uimodel("hudItems.numPropConcusses", self.abilityleft);
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x7c3e1cf0, Offset: 0x2528
// Size: 0x1ba
function function_3875c0fc(var_67b8306d) {
    groundnormal = get_ground_normal(var_67b8306d, 0);
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
    var_535a15b1 = dot * pitch;
    var_d1ee48d6 = (1 - abs(dot)) * pitch * mod;
    self.angles = (var_535a15b1, self.angles[1], var_d1ee48d6);
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xa5608ec1, Offset: 0x26f0
// Size: 0xc0
function function_c0665212(var_ec9c756e) {
    foreach (player in level.players) {
        if (isdefined(player.prop)) {
            if (var_ec9c756e) {
                player.prop notsolid();
            } else {
                player.prop solid();
            }
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xf185ba9f, Offset: 0x27b8
// Size: 0x124
function function_5b73beef(var_ec9c756e) {
    foreach (player in level.players) {
        if (isdefined(player.propclones)) {
            foreach (clone in player.propclones) {
                if (isdefined(clone)) {
                    if (var_ec9c756e) {
                        clone notsolid();
                    } else {
                        clone solid();
                    }
                }
            }
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0x8490755f, Offset: 0x28e8
// Size: 0x3c0
function get_ground_normal(var_67b8306d, debug) {
    if (!isdefined(var_67b8306d)) {
        ignore = self;
    } else {
        ignore = var_67b8306d;
    }
    var_3503303 = array(self.origin);
    if (getdvarint(#"hash_32aee631b4444f90", 1)) {
        i = -1;
        while (i <= 1) {
            j = -1;
            while (j <= 1) {
                corner = ignore getpointinbounds(i, j, 0);
                corner = (corner[0], corner[1], self.origin[2]);
                var_3503303[var_3503303.size] = corner;
                j = j + 2;
            }
            i = i + 2;
        }
    }
    function_c0665212(1);
    var_683999d6 = (0, 0, 0);
    var_10ccb3f8 = 0;
    foreach (point in var_3503303) {
        trace = bullettrace(point + vectorscale((0, 0, 1), 4), point + vectorscale((0, 0, -1), 16), 0, ignore);
        tracehit = trace[#"fraction"] > 0 && trace[#"fraction"] < 1;
        if (tracehit) {
            var_683999d6 = var_683999d6 + trace[#"normal"];
            var_10ccb3f8++;
        }
        /#
            if (debug) {
                if (tracehit) {
                    line(point, point + trace[#"normal"] * 30, (0, 1, 0));
                } else {
                    sphere(point, 3, (1, 0, 0));
                }
            }
        #/
    }
    function_c0665212(0);
    if (var_10ccb3f8 > 0) {
        var_683999d6 = var_683999d6 / var_10ccb3f8;
        /#
            if (debug) {
                line(self.origin, self.origin + var_683999d6 * 20, (1, 1, 1));
            }
        #/
        return var_683999d6;
    } else {
        /#
            if (debug) {
                sphere(self.origin, 5, (1, 0, 0));
            }
        #/
        return undefined;
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x6732728b, Offset: 0x2cb0
// Size: 0x192
function function_68d1fd31() {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    var_554b8919 = 0;
    var_cd6d7e01 = 0;
    var_de410ab8 = 0;
    while (1) {
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
    var_8e178266 = self.propanchor.angles - self.angles;
    if (self.var_98d22839) {
        self.propent unlink();
        self.propent.angles = (self.angles[0], self.propent.angles[1], self.angles[2]);
        self.propent.origin = self.propanchor.origin;
        self.propent linkto(self.propanchor);
    }
    waitframe(1);
    if (isdefined(self)) {
        if (isdefined(self.propanchor)) {
            self.propanchor.angles = self.angles + var_8e178266;
            self.propanchor.origin = self.origin + offset;
            self.propanchor linkto(self);
        }
        self.lock = 0;
        if (prop::useprophudserver()) {
            self.var_4901798a.label = #"mp_ph_lock";
            self thread function_74566016();
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x54cd4e, Offset: 0x3070
// Size: 0x144
function function_fb28c6d5() {
    if (!canlock()) {
        return;
    }
    self.propanchor unlink();
    self.propanchor.origin = self.origin;
    self playerlinkto(self.propanchor);
    if (self.var_98d22839) {
        self.propent unlink();
        self.propent function_3875c0fc(self.prop);
        self.propent.origin = self.origin;
        self.propent linkto(self.propanchor);
    }
    self.lock = 1;
    self notify(#"locked");
    if (prop::useprophudserver()) {
        self.var_4901798a.label = #"mp_ph_locked";
        self thread function_74566016();
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xd7e8357d, Offset: 0x31c0
// Size: 0xf6
function function_74566016() {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    self notify(#"hash_2450f4c64d40469e");
    self endon(#"hash_2450f4c64d40469e");
    if (!isdefined(self.var_4901798a.var_8efb654e)) {
        self.var_4901798a.var_8efb654e = 1;
    }
    var_df67e195 = self.var_4901798a.var_8efb654e + 0.75;
    self.var_4901798a.fontscale = var_df67e195;
    wait(0.1);
    if (isdefined(self.var_4901798a)) {
        self.var_4901798a.fontscale = self.var_4901798a.var_8efb654e;
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0x7c115f50, Offset: 0x32c0
// Size: 0x72
function function_56cae8fa() {
    /#
        assert(isplayer(self));
    #/
    start = self.origin;
    end = start + vectorscale((0, 0, -1), 2000);
    return playerphysicstrace(start, end);
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xb2a4e3da, Offset: 0x3340
// Size: 0x92
function function_97f02d5c() {
    /#
        assert(isplayer(self));
    #/
    start = self.origin;
    end = start + vectorscale((0, 0, -1), 2000);
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
    var_aa7db07e = getentarray("trigger_hurt", "classname");
    oobtriggers = getentarray("trigger_out_of_bounds", "classname");
    triggers = arraycombine(var_aa7db07e, oobtriggers, 0, 0);
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
    } else if (!self isonground() || self iswallrunning()) {
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
    } else {
        /#
            function_6de7bc19(1, "<unknown string>", self);
        #/
        return 1;
    }
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xbf4d826f, Offset: 0x3c08
// Size: 0x1c0
function function_be19060b() {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    var_fc464c9b = 10;
    self.thirdpersonrange = self.prop.info.proprange;
    while (1) {
        waitresult = undefined;
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
        } else if (zoom == "zoomout") {
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
function function_138e42e4() {
    switch (self.currentability) {
    case #"flash":
        self.var_5478a045.label = #"mp_ph_flash";
        break;
    default:
        /#
            assertmsg("<unknown string>");
        #/
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
        function_59c73c21(count);
        break;
    case #"clone":
        if (!isdefined(count)) {
            count = level.phsettings.propnumclones;
        }
        function_85a28bcc(count);
        break;
    default:
        /#
            assertmsg("<unknown string>" + var_8c8fd413);
        #/
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
function function_399c6db1(var_c8c9bf0f) {
    level endon(#"game_ended");
    var_c8c9bf0f endon(#"disconnect");
    self thread endondeath();
    self endon(#"end_explode");
    res = undefined;
    res = self waittill(#"explode");
    position = res.position;
    if (!isdefined(var_c8c9bf0f)) {
        return;
    }
    function_bc073c8d(var_c8c9bf0f, position);
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0xb88bf913, Offset: 0x4058
// Size: 0x10e
function function_bc073c8d(var_c8c9bf0f = self, position = self.origin) {
    fwd = anglestoforward(var_c8c9bf0f getplayerangles());
    fwd = vectornormalize((fwd[0], fwd[1], 0));
    var_ec24ae95 = fwd * 60;
    spawn_pos = position + vectorscale((0, 0, 1), 10) + fwd * 30;
    concuss = var_c8c9bf0f magicmissile(getweapon(#"hash_25d3ed64dda487d"), spawn_pos, var_ec24ae95);
}

// Namespace prop_controls/_prop_controls
// Params 0, eflags: 0x0
// Checksum 0xeb6e1ea2, Offset: 0x4170
// Size: 0x1ba
function function_fdb58854() {
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
        } else {
            clones[clones.size] = clone;
        }
    }
    /#
        assert(isdefined(var_ccb1dd7));
    #/
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
        function_fdb58854();
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
    var_6e55957c.var_76fd297e = self;
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
        if (isdefined(self.var_76fd297e)) {
            scoreevents::processscoreevent("clone_was_destroyed", self.var_76fd297e);
        }
    }
    if (!isdefined(self.isdying)) {
        self.isdying = 1;
    }
    playsoundatposition("wpn_flash_grenade_explode", self.origin + vectorscale((0, 0, 1), 4));
    playfx(fx::get("propDeathFX"), self.origin + vectorscale((0, 0, 1), 4));
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace prop_controls/_prop_controls
// Params 3, eflags: 0x0
// Checksum 0x68f2db73, Offset: 0x4820
// Size: 0x212
function function_d8b858d4(var_2953b091, var_522acf74, var_abbedf2e) {
    level endon(#"game_ended");
    self endon(#"disconnect");
    if (!isdefined(var_2953b091)) {
        var_2953b091 = 5;
    }
    if (!isdefined(var_522acf74)) {
        var_522acf74 = 1;
    }
    if (!isdefined(var_abbedf2e)) {
        var_abbedf2e = 1;
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
    if (var_522acf74 > 0) {
    }
    overlay.alpha = 1;
    self prop::function_1ee6f124(var_522acf74);
    self useservervisionset(1);
    self setvisionsetforplayer("blackout_ph", var_522acf74);
    self prop::function_1ee6f124(var_2953b091 - var_abbedf2e - var_522acf74);
    if (var_abbedf2e > 0) {
    }
    overlay.alpha = 0;
    self useservervisionset(0);
    self setvisionsetforplayer("blackout_ph", var_abbedf2e);
    self prop::function_1ee6f124(var_abbedf2e);
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
    while (1) {
        res = undefined;
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
    res = undefined;
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
    var_921c264 = weapon.explosionradius;
    var_1c404e8 = var_921c264 * var_921c264;
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
            attacker radiusdamage(damageorigin, var_921c264, damage, damage, attacker, meansofdeath, weapon);
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
function function_e896a36a(var_319af7f5) {
    foreach (player in level.players) {
        if (isdefined(player.prop)) {
            if (var_319af7f5) {
                if (isdefined(player.prop.var_7ccb9924)) {
                    player.prop setcontents(player.prop.var_7ccb9924);
                }
                player.prop solid();
            } else {
                if (!isdefined(player.prop.var_7ccb9924)) {
                    player.prop.var_7ccb9924 = player.prop setcontents(0);
                } else {
                    player.prop setcontents(0);
                }
                player.prop notsolid();
            }
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x536bba3f, Offset: 0x53a0
// Size: 0x1ac
function function_45534e6c(var_319af7f5) {
    foreach (player in level.players) {
        if (isdefined(player.propclones)) {
            foreach (clone in player.propclones) {
                if (isdefined(clone)) {
                    if (var_319af7f5) {
                        if (isdefined(clone.var_fc18a70a)) {
                            clone setcontents(clone.var_fc18a70a);
                        }
                        clone solid();
                    } else {
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
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0xb15af817, Offset: 0x5558
// Size: 0x128
function function_d08dcbaf(var_319af7f5) {
    foreach (player in level.players) {
        if (!player util::isprop() || !isalive(player)) {
            continue;
        }
        if (var_319af7f5) {
            player setcontents(level.phsettings.var_b5f21379);
            player solid();
        } else {
            player setcontents(0);
            player notsolid();
        }
    }
}

// Namespace prop_controls/_prop_controls
// Params 1, eflags: 0x0
// Checksum 0x4e1b14b3, Offset: 0x5688
// Size: 0x128
function function_44a27dd6(var_319af7f5) {
    foreach (player in level.players) {
        if (!player prop::function_84793f03() || !isalive(player)) {
            continue;
        }
        if (var_319af7f5) {
            player setcontents(level.phsettings.var_b5f21379);
            player solid();
        } else {
            player setcontents(0);
            player notsolid();
        }
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
            return 1;
        }
    }
    return 0;
}

// Namespace prop_controls/_prop_controls
// Params 2, eflags: 0x0
// Checksum 0x78c68793, Offset: 0x58b8
// Size: 0x2a
function function_b9c3c08a(hudelem, var_9c73f6bb) {
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
        var_2aaefb47 = 1;
    } else {
        var_2aaefb47 = 0;
    }
    if (prop::useprophudserver() || isdefined(override) && override) {
        function_b9c3c08a(self.var_8060636f, var_2aaefb47);
        function_b9c3c08a(self.var_aa57a992, var_2aaefb47);
        function_b9c3c08a(self.var_4901798a, var_2aaefb47);
        function_b9c3c08a(self.var_a4da95c7, var_2aaefb47);
        function_b9c3c08a(self.var_5478a045, var_2aaefb47);
        function_b9c3c08a(self.var_e8c312d7, var_2aaefb47);
        function_b9c3c08a(self.var_65efe125, var_2aaefb47);
        function_b9c3c08a(self.var_8e3b5c8c, var_2aaefb47);
        if (!(isdefined(level.nopropsspectate) && level.nopropsspectate)) {
            function_b9c3c08a(self.var_a93978b9, var_2aaefb47);
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
    } else {
        self clientfield::set_to_player("PROP.hide_prop", 0);
        if (prop::useprophudserver()) {
            self.var_8e3b5c8c.label = #"hash_fb73fdc2aff963f";
        }
    }
}


#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace blood;

// Namespace blood/blood
// Params 0, eflags: 0x2
// Checksum 0x33aea648, Offset: 0x388
// Size: 0x34
function autoexec __init__system__() {
    system::register(#"blood", undefined, &__postload_init__, undefined);
}

// Namespace blood/blood
// Params 0, eflags: 0x1 linked
// Checksum 0xb1e5e87, Offset: 0x3c8
// Size: 0x6e
function __postload_init__() {
    function_dd830dee();
    callback::on_localplayer_spawned(&function_e79ccfd8);
    callback::on_localclient_connect(&localclient_connect);
    level.var_f771ff42 = util::is_mature();
}

// Namespace blood/blood
// Params 1, eflags: 0x1 linked
// Checksum 0x1afc697a, Offset: 0x440
// Size: 0x2c
function getsplatter(localclientnum) {
    return level.blood.var_de10c136.var_51036e02[localclientnum];
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0xc9a9dfc, Offset: 0x478
// Size: 0x24
function private localclient_connect(localclientnum) {
    level thread player_splatter(localclientnum);
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x5b124e9, Offset: 0x4a8
// Size: 0x224
function private function_e79ccfd8(localclientnum) {
    if (!self function_21c0fa55()) {
        return;
    }
    if (function_148ccc79(localclientnum, #"hash_73c750f53749d44d")) {
        codestoppostfxbundlelocal(localclientnum, #"hash_73c750f53749d44d");
    }
    self.pstfx_blood = #"hash_44dcb6ac5e8787e0";
    self.wound_rob = "rob_wound_blood_splatter";
    function_162fe6ec(localclientnum);
    self.var_9861062 = 0;
    if (level.blood.rob.stage == 0) {
        self.var_28fdff3c = 1;
        self.var_dff3bb2c = 1;
    } else {
        self.var_28fdff3c = 0;
        self.var_dff3bb2c = 0;
    }
    self.stage2amount = 0;
    self.stage3amount = 0;
    self.lastbloodupdate = 0;
    self stop_breath(localclientnum);
    level thread wait_game_ended(localclientnum);
    self stoprenderoverridebundle("rob_wound_blood_splatter");
    self stoprenderoverridebundle("rob_wound_blood_splatter_reaper");
    self thread function_87544c4a(localclientnum);
    self thread function_493a8fbc(localclientnum);
    new_health_model_ui_model = createuimodel(getuimodelforcontroller(localclientnum), "usingNewHealthModel");
    if (isdefined(new_health_model_ui_model)) {
        setuimodelvalue(new_health_model_ui_model, level.new_health_model);
    }
}

// Namespace blood/blood
// Params 3, eflags: 0x5 linked
// Checksum 0x3f1f7aa1, Offset: 0x6d8
// Size: 0xb4
function private setcontrollerlightbarcolorpulsing(localclientnum, color, pulserate) {
    curcolor = color * 0.2;
    scale = gettime() % pulserate / pulserate * 0.5;
    if (scale > 1) {
        scale = (scale - 2) * -1;
    }
    curcolor += color * 0.8 * scale;
    setcontrollerlightbarcolor(localclientnum, curcolor);
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0xd33ae92f, Offset: 0x798
// Size: 0x174
function private update_lightbar(localclientnum) {
    if (!(isdefined(self.nobloodlightbarchange) && self.nobloodlightbarchange)) {
        if (self.stage3amount > 0) {
            setcontrollerlightbarcolorpulsing(localclientnum, (1, 0, 0), 600);
            return;
        }
        if (self.stage2amount == 1) {
            setcontrollerlightbarcolorpulsing(localclientnum, (0.8, 0, 0), 1200);
            return;
        }
        if ((!sessionmodeiscampaigngame() || codegetuimodelclientfield(self, "playerAbilities.inRange")) && getgadgetpower(localclientnum) == 1) {
            setcontrollerlightbarcolorpulsing(localclientnum, (1, 1, 0), 2000);
            return;
        }
        if (isdefined(level.controllercolor) && isdefined(level.controllercolor[localclientnum])) {
            setcontrollerlightbarcolor(localclientnum, level.controllercolor[localclientnum]);
            return;
        }
        setcontrollerlightbarcolor(localclientnum);
    }
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x2b9571d8, Offset: 0x918
// Size: 0x3c
function private enter_critical_health(localclientnum) {
    self thread play_critical_health_rumble(localclientnum);
    self play_breath(localclientnum);
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0xc3552a42, Offset: 0x960
// Size: 0x158
function private play_critical_health_rumble(localclientnum) {
    self endon(#"death", #"disconnect", #"critical_health_end", #"spawned");
    var_cf155b98 = "new_health_stage_critical";
    while (true) {
        self waittill(#"pulse_blood");
        self playrumbleonentity(localclientnum, var_cf155b98);
        name = self getmpdialogname();
        if (!isdefined(name)) {
            name = #"human";
        }
        if (name == #"reaper") {
            sound = #"mpl_reaper_heartbeat";
        } else {
            sound = #"mpl_player_heartbeat";
        }
        if (!(isdefined(self.var_e9dd2ca0) && self.var_e9dd2ca0)) {
            self playsound(localclientnum, sound);
        }
    }
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0xf3d5eefb, Offset: 0xac0
// Size: 0x84
function private play_breath(localclientnum) {
    self stop_breath(localclientnum);
    snd_handle = function_604c9983(localclientnum, "chr_health_low_breath_loop", 0.1);
    level.hurt_breath_snd_handle[localclientnum] = snd_handle;
    self thread watch_end_breath(localclientnum);
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x38c7200, Offset: 0xb50
// Size: 0x64
function private watch_end_breath(localclientnum) {
    self waittill(#"death", #"disconnect", #"critical_health_end", #"spawned");
    stop_breath(localclientnum);
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x84050d10, Offset: 0xbc0
// Size: 0x7c
function private stop_breath(localclientnum) {
    if (!isdefined(level.hurt_breath_snd_handle)) {
        level.hurt_breath_snd_handle = [];
    }
    if (isdefined(level.hurt_breath_snd_handle[localclientnum])) {
        function_d48752e(localclientnum, level.hurt_breath_snd_handle[localclientnum], 1);
        level.hurt_breath_snd_handle[localclientnum] = undefined;
    }
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0xa4900770, Offset: 0xc48
// Size: 0xde
function private wait_game_ended(localclientnum) {
    if (!isdefined(level.watching_blood_game_ended)) {
        level.watching_blood_game_ended = [];
    }
    if (level.watching_blood_game_ended[localclientnum] === 1) {
        return;
    }
    level.watching_blood_game_ended[localclientnum] = 1;
    level waittill(#"game_ended");
    stop_breath(localclientnum);
    localplayer = function_5c10bd79(localclientnum);
    if (isdefined(localplayer)) {
        localplayer notify(#"critical_health_end");
    }
    level.watching_blood_game_ended[localclientnum] = 0;
}

// Namespace blood/blood
// Params 2, eflags: 0x5 linked
// Checksum 0xef60fb98, Offset: 0xd30
// Size: 0x74
function private function_8e228a1d(localclientnum, damage) {
    if (damage > level.blood.rob.damage_threshold) {
        self playrenderoverridebundle(self.wound_rob);
        self thread function_f192f00b(localclientnum, self.wound_rob);
    }
}

// Namespace blood/blood
// Params 2, eflags: 0x5 linked
// Checksum 0x8d1d4309, Offset: 0xdb0
// Size: 0x1bc
function private function_f192f00b(localclientnum, rob) {
    self notify("5572d7357c805da5");
    self endon("5572d7357c805da5");
    self endon(#"death");
    self endon(#"killbloodoverlay");
    self function_78233d29(rob, "", "U Offset", randomfloatrange(0, 1));
    self function_78233d29(rob, "", "V Offset", randomfloatrange(0, 1));
    self function_78233d29(rob, "", "Threshold", 1);
    wait(float(level.blood.rob.hold_time) / 1000);
    self thread ramprobsetting(localclientnum, 1, 0, level.blood.rob.fade_time, "Threshold");
    wait(float(level.blood.rob.fade_time) / 1000);
    self stoprenderoverridebundle(rob);
}

// Namespace blood/blood
// Params 5, eflags: 0x1 linked
// Checksum 0x59cf729d, Offset: 0xf78
// Size: 0xb4
function ramprobsetting(localclientnum, from, to, ramptime, key) {
    self endon(#"death");
    self endon(#"killbloodoverlay");
    self notify("rampROBsetting" + key);
    self endon("rampROBsetting" + key);
    util::lerp_generic(localclientnum, ramptime, &function_1126eb8c, from, to, key, self.wound_rob);
}

// Namespace blood/blood
// Params 8, eflags: 0x1 linked
// Checksum 0xea4e65d7, Offset: 0x1038
// Size: 0xac
function function_1126eb8c(currenttime, elapsedtime, localclientnum, duration, stagefrom, stageto, key, rob) {
    percent = elapsedtime / duration;
    amount = stageto * percent + stagefrom * (1 - percent);
    self function_78233d29(rob, "", key, amount);
}

// Namespace blood/blood
// Params 2, eflags: 0x1 linked
// Checksum 0x97b6bb98, Offset: 0x10f0
// Size: 0x274
function function_672c739(localclientnum, shockrifle) {
    if (isdefined(shockrifle) && shockrifle) {
        function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Enable Tint", 0.9);
        function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Tint Color R", 4);
        function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Tint Color G", 4);
        function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Tint Color B", 4);
        return;
    }
    if (util::function_2c435484()) {
        function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Enable Tint", 1);
        function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Tint Color R", 0.15);
        function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Tint Color G", 0.13);
        function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Tint Color B", 0.24);
        return;
    }
    function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Enable Tint", 1);
    function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Tint Color R", 0.3);
    function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Tint Color G", 0.025);
    function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Tint Color B", 0);
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x3cfebd8d, Offset: 0x1370
// Size: 0x68
function private function_27d3ba05(localclientnum) {
    if (function_92beaa28(localclientnum) && !function_d17ae3cc(localclientnum)) {
        return false;
    }
    if (level.var_4ecf5754 === #"silent_film") {
        return false;
    }
    return true;
}

// Namespace blood/blood
// Params 5, eflags: 0x5 linked
// Checksum 0x57ba12db, Offset: 0x13e0
// Size: 0xcc
function private function_47d0632f(localclientnum, damage, death, dot, shockrifle) {
    splatter = getsplatter(localclientnum);
    splatter.shockrifle = shockrifle;
    splatter.var_120a7b2c++;
    var_cd141ca2 = splatter.var_120a7b2c % 4;
    if (function_27d3ba05(localclientnum)) {
        level thread splatter_postfx(localclientnum, self, damage, var_cd141ca2, death, dot);
    }
}

// Namespace blood/blood
// Params 3, eflags: 0x5 linked
// Checksum 0x5ce886aa, Offset: 0x14b8
// Size: 0xf4
function private update_damage_effects(localclientnum, damage, death) {
    if (isdefined(self.dot_no_splatter) && self.dot_no_splatter && damage < 10 && damage > 0) {
        self.dot_no_splatter = 0;
    } else if (self.dot_damaged === 1 && damage > 0) {
        function_47d0632f(localclientnum, damage, death, 1, 0);
        self.dot_damaged = 0;
    } else if (damage > 0) {
        function_47d0632f(localclientnum, damage, death, 0, 0);
    }
    self function_8e228a1d(localclientnum, damage);
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x7ad42c89, Offset: 0x15b8
// Size: 0x30a
function private player_splatter(localclientnum) {
    level notify("player_splatter" + localclientnum);
    level endon("player_splatter" + localclientnum);
    while (true) {
        level waittill(#"splatters_active");
        while (true) {
            splatter = getsplatter(localclientnum);
            blur = 0;
            opacity = 0;
            for (i = 0; i < 4; i++) {
                if (isdefined(splatter.splatters[i][#"blur amount"]) && splatter.splatters[i][#"blur amount"] > blur) {
                    blur = splatter.splatters[i][#"blur amount"];
                }
                if (isdefined(splatter.splatters[i][#"opacity"]) && splatter.splatters[i][#"opacity"] > opacity) {
                    opacity = splatter.splatters[i][#"opacity"];
                }
            }
            if (blur > 0 || opacity > 0) {
                splatter.var_9e4cc220 = 1;
                function_a837926b(localclientnum, #"hash_73c750f53749d44d");
                function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Blur Amount", blur);
                if (isdefined(splatter.shockrifle) && splatter.shockrifle) {
                    opacity *= 0.05;
                }
                function_4238734d(localclientnum, #"hash_73c750f53749d44d", "Opacity", opacity);
                function_672c739(localclientnum, splatter.shockrifle);
            } else if (isdefined(splatter.var_9e4cc220) && splatter.var_9e4cc220) {
                splatter.var_9e4cc220 = 0;
                codestoppostfxbundlelocal(localclientnum, #"hash_73c750f53749d44d");
            } else {
                break;
            }
            waitframe(1);
        }
    }
}

// Namespace blood/blood
// Params 3, eflags: 0x5 linked
// Checksum 0x873f049a, Offset: 0x18d0
// Size: 0xae
function private function_b51756a0(localclientnum, splatter, damage) {
    if (damage > level.blood.var_de10c136.dot.var_6264f8dd) {
        return true;
    }
    if (!isdefined(splatter.var_90495387)) {
        return true;
    }
    if (getservertime(localclientnum) - splatter.var_90495387 < level.blood.var_de10c136.dot.var_372dff4b) {
        return false;
    }
    return true;
}

// Namespace blood/blood
// Params 6, eflags: 0x5 linked
// Checksum 0x4ae7d80b, Offset: 0x1988
// Size: 0x45c
function private splatter_postfx(localclientnum, player, damage, var_cd141ca2, death, dot) {
    level notify(localclientnum + "splatter_postfx" + var_cd141ca2);
    level endon(localclientnum + "splatter_postfx" + var_cd141ca2);
    blur = 0;
    opacity = 0;
    var_587ce5b0 = 0;
    var_49774f1 = 0;
    hold_time = 0;
    splatter = getsplatter(localclientnum);
    if (dot && !death) {
        splatter.var_90495387 = getservertime(localclientnum);
        blur = level.blood.var_de10c136.dot.blur;
        opacity = level.blood.var_de10c136.dot.opacity;
        var_587ce5b0 = level.blood.var_de10c136.dot.var_587ce5b0;
        hold_time = level.blood.var_de10c136.dot.hold_time;
    } else if (function_b51756a0(localclientnum, splatter, damage)) {
        for (i = level.blood.var_de10c136.damage_ranges - 1; i >= 0; i--) {
            if (damage > level.blood.var_de10c136.range[i].start || level.blood.scriptbundle.var_3e1e9389 - 1 == i && death) {
                blur = level.blood.var_de10c136.range[i].blur;
                opacity = level.blood.var_de10c136.range[i].opacity;
                var_587ce5b0 = level.blood.var_de10c136.var_587ce5b0[i];
                var_49774f1 = level.blood.var_de10c136.var_49774f1[i];
                hold_time = level.blood.var_de10c136.hold_time[i];
                break;
            }
        }
    }
    if (isdefined(level.var_7db2b064) && [[ level.var_7db2b064 ]](localclientnum, player, damage)) {
        blur = 0;
        opacity = 0;
        var_587ce5b0 = 0;
        var_49774f1 = 0;
        hold_time = 0;
    }
    level thread rampvalue(localclientnum, 0, opacity, var_587ce5b0, var_cd141ca2, "Opacity");
    level thread rampvalue(localclientnum, 0, blur, var_587ce5b0, var_cd141ca2, "Blur Amount");
    wait(float(var_587ce5b0) / 1000);
    wait(float(hold_time) / 1000);
    level thread rampvalue(localclientnum, opacity, 0, var_49774f1, var_cd141ca2, "Opacity");
    level thread rampvalue(localclientnum, blur, 0, var_49774f1, var_cd141ca2, "Blur Amount");
}

// Namespace blood/blood
// Params 6, eflags: 0x1 linked
// Checksum 0xbb9d0368, Offset: 0x1df0
// Size: 0xac
function rampvalue(localclientnum, stagefrom, stageto, ramptime, var_cd141ca2, key) {
    level notify(localclientnum + "rampValue" + var_cd141ca2 + key);
    level endon(localclientnum + "rampValue" + var_cd141ca2 + key);
    util::lerp_generic(localclientnum, ramptime, &function_441ef0ca, stagefrom, stageto, var_cd141ca2, key);
}

// Namespace blood/blood
// Params 8, eflags: 0x1 linked
// Checksum 0x6d9481c2, Offset: 0x1ea8
// Size: 0x134
function function_441ef0ca(currenttime, elapsedtime, localclientnum, duration, stagefrom, stageto, var_cd141ca2, key) {
    percent = 1;
    if (duration > 0) {
        percent = elapsedtime / duration;
    }
    amount = stageto * percent + stagefrom * (1 - percent);
    splatter = getsplatter(localclientnum);
    if (amount > 0 && isdefined(splatter.splatters[var_cd141ca2][key]) && splatter.splatters[var_cd141ca2][key] == 0) {
        level notify(#"splatters_active");
    }
    splatter.splatters[var_cd141ca2][key] = amount;
}

// Namespace blood/blood
// Params 0, eflags: 0x5 linked
// Checksum 0x7dc19567, Offset: 0x1fe8
// Size: 0x8a
function private player_base_health() {
    if (!self function_700ca4f5()) {
        return 150;
    }
    basehealth = self getplayerspawnhealth();
    basehealth += isdefined(level.var_90bb9821) ? level.var_90bb9821 : 0;
    if (isdefined(self.var_ee9b8af0)) {
        basehealth = self.var_ee9b8af0;
    }
    return basehealth;
}

// Namespace blood/blood
// Params 0, eflags: 0x5 linked
// Checksum 0x5da76a88, Offset: 0x2080
// Size: 0x13a
function private function_55d01d42() {
    assert(self function_700ca4f5());
    character_index = self getcharacterbodytype();
    fields = getcharacterfields(character_index, currentsessionmode());
    if (isdefined(fields) && (isdefined(fields.digitalblood) ? fields.digitalblood : 0)) {
        self.pstfx_blood = #"hash_21152915158b09dd";
        self.wound_rob = "rob_wound_blood_splatter_reaper";
        return;
    }
    if (util::is_mature()) {
        self.pstfx_blood = #"hash_263a0659c7ff81ad";
        self.wound_rob = "rob_wound_blood_splatter";
        return;
    }
    self.pstfx_blood = #"hash_44dcb6ac5e8787e0";
    self.wound_rob = "rob_wound_blood_splatter";
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x9366cb2a, Offset: 0x21c8
// Size: 0x39e
function private function_87544c4a(localclientnum) {
    self endon(#"disconnect");
    self endon(#"death");
    self endon(#"killbloodoverlay");
    self util::function_6d0694af();
    basehealth = player_base_health();
    priorplayerhealth = renderhealthoverlayhealth(localclientnum, isdefined(self.prop) ? 0 : basehealth);
    var_a234f6c2 = basehealth * priorplayerhealth;
    var_4cdccc55 = util::is_mature();
    self function_55d01d42();
    self thread function_8d8880(localclientnum);
    while (true) {
        forceupdate = 0;
        if (util::is_mature() != var_4cdccc55) {
            forceupdate = 1;
            self function_436ee4c2(localclientnum, #"hash_263a0659c7ff81ad");
            self function_436ee4c2(localclientnum, #"hash_44dcb6ac5e8787e0");
            var_4cdccc55 = util::is_mature();
            self function_55d01d42();
        }
        if (renderhealthoverlay(localclientnum)) {
            basehealth = player_base_health();
            playerhealth = renderhealthoverlayhealth(localclientnum, isdefined(self.prop) ? 0 : basehealth);
            var_406028bf = basehealth * playerhealth;
            damageamount = var_a234f6c2 - var_406028bf;
            update_damage_effects(localclientnum, damageamount, playerhealth == 0);
            shouldenabledoverlay = 0;
            if (playerhealth < 1) {
                shouldenabledoverlay = 1;
            } else if (isdefined(self.blood_enabled) && self.blood_enabled) {
                self function_436ee4c2(localclientnum, self.pstfx_blood);
            }
            priorplayerhealth = playerhealth;
            var_a234f6c2 = var_406028bf;
            if (!(isdefined(self.blood_enabled) && self.blood_enabled) && shouldenabledoverlay) {
                self function_70299400(localclientnum);
            }
            self function_9a8dc0ec(localclientnum, var_406028bf, forceupdate);
            self update_lightbar(localclientnum);
        } else if (isdefined(self.blood_enabled) && self.blood_enabled) {
            self function_436ee4c2(localclientnum, self.pstfx_blood);
        }
        waitframe(1);
    }
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x951ad627, Offset: 0x2570
// Size: 0x23c
function private function_8d8880(localclientnum) {
    self endon(#"disconnect");
    self endon(#"death");
    self endon(#"killbloodoverlay");
    if (!level.blood.var_f5479429) {
        return;
    }
    while (true) {
        waitframe(1);
        if (isdefined(self.blood_enabled) && self.blood_enabled) {
            for (pulse = 0; pulse < 2; pulse++) {
                self notify(#"pulse_blood");
                self thread function_c0cdd1f2(localclientnum, 0, 1, level.blood.var_f2de135e.var_562c41de[pulse], #"damage pulse", self.pstfx_blood);
                wait(float(level.blood.var_f2de135e.var_562c41de[pulse]) / 1000);
                wait(float(level.blood.var_f2de135e.var_18f673f1[pulse]) / 1000);
                self thread function_c0cdd1f2(localclientnum, 1, 0, level.blood.var_f2de135e.var_92fc0d45[pulse], #"damage pulse", self.pstfx_blood);
                wait(float(level.blood.var_f2de135e.var_92fc0d45[pulse]) / 1000);
                wait(float(level.blood.var_f2de135e.var_5b5500f7[pulse]) / 1000);
            }
        }
    }
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x3b572832, Offset: 0x27b8
// Size: 0x44
function private function_493a8fbc(localclientnum) {
    self waittill(#"death");
    self function_436ee4c2(localclientnum, self.pstfx_blood);
}

// Namespace blood/blood
// Params 3, eflags: 0x5 linked
// Checksum 0x7b5fb020, Offset: 0x2808
// Size: 0x6e
function private function_1cf17bbc(localclientnum, new_blood_stage, prior_blood_stage) {
    if (new_blood_stage >= level.blood.rob.stage) {
        self.var_28fdff3c = 1;
    } else {
        self.var_28fdff3c = 0;
    }
    self.var_dff3bb2c = self.var_28fdff3c;
}

// Namespace blood/blood
// Params 3, eflags: 0x5 linked
// Checksum 0x566227a2, Offset: 0x2880
// Size: 0x1be
function private function_e91b92e2(localclientnum, new_blood_stage, prior_blood_stage) {
    if (new_blood_stage == 4) {
        self.var_9861062 = 1;
        self enter_critical_health(localclientnum);
        if (isdefined(self.blood_enabled) && self.blood_enabled) {
            self function_116b95e5(self.pstfx_blood, #"damage pulse", 1);
        }
        if (isdefined(level.blood.scriptbundle.pulse_loop)) {
            level.blood.soundhandle = function_604c9983(localclientnum, level.blood.scriptbundle.pulse_loop);
        }
    } else if (self.var_9861062) {
        if (isdefined(level.blood.soundhandle)) {
            function_d48752e(localclientnum, level.blood.soundhandle);
            level.blood.soundhandle = undefined;
        }
        self.var_9861062 = 0;
        if (isdefined(self.blood_enabled) && self.blood_enabled) {
            self function_116b95e5(self.pstfx_blood, #"damage pulse", 0);
        }
    }
    if (new_blood_stage < 4) {
        self notify(#"critical_health_end");
    }
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x7dee7657, Offset: 0x2a48
// Size: 0x140
function private function_56419db8(stage) {
    for (pulse = 0; pulse < 2; pulse++) {
        level.blood.var_f2de135e.var_562c41de[pulse] = level.blood.var_f2de135e.time_in[pulse][stage];
        level.blood.var_f2de135e.var_18f673f1[pulse] = level.blood.var_f2de135e.var_a79aba98[pulse][stage];
        level.blood.var_f2de135e.var_92fc0d45[pulse] = level.blood.var_f2de135e.time_out[pulse][stage];
        level.blood.var_f2de135e.var_5b5500f7[pulse] = level.blood.var_f2de135e.var_97aa6fd2[pulse][stage];
    }
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x702332f1, Offset: 0x2b90
// Size: 0x7e
function private play_new_stage_rumble(localclientnum) {
    self endon(#"death", #"disconnect");
    for (i = 0; i < 2; i++) {
        self playrumbleonentity(localclientnum, "new_health_stage");
        wait(0.4);
    }
}

// Namespace blood/blood
// Params 3, eflags: 0x5 linked
// Checksum 0xeae075f2, Offset: 0x2c18
// Size: 0x4c
function private function_5a719e5(localclientnum, new_blood_stage, prior_blood_stage) {
    if (new_blood_stage > 0) {
        if (new_blood_stage > prior_blood_stage) {
            self thread play_new_stage_rumble(localclientnum);
        }
    }
}

// Namespace blood/blood
// Params 3, eflags: 0x5 linked
// Checksum 0xf3ed631, Offset: 0x2c70
// Size: 0x4ea
function private function_9a8dc0ec(localclientnum, playerhealth, forceupdate) {
    if (!isdefined(self.last_blood_stage)) {
        self.last_blood_stage = 0;
    }
    var_89524e53 = level.blood.threshold[1];
    stage2_threshold = level.blood.threshold[2];
    stage3_threshold = level.blood.threshold[3];
    stage4_threshold = level.blood.threshold[4];
    prior_blood_stage = self.last_blood_stage;
    new_blood_stage = 0;
    if (!(isdefined(self.nobloodoverlay) && self.nobloodoverlay)) {
        if (playerhealth <= var_89524e53 && playerhealth > 0) {
            if (playerhealth <= stage3_threshold) {
                new_blood_stage = playerhealth <= stage4_threshold ? 4 : 3;
            } else {
                new_blood_stage = playerhealth <= stage2_threshold ? 2 : 1;
            }
        }
    }
    if (new_blood_stage != prior_blood_stage || forceupdate) {
        ramptime = prior_blood_stage < new_blood_stage ? level.blood.var_587ce5b0 : level.blood.var_49774f1;
        self thread function_c0cdd1f2(localclientnum, level.blood.fade[prior_blood_stage], level.blood.fade[new_blood_stage], ramptime, #"fade", self.pstfx_blood);
        self thread function_c0cdd1f2(localclientnum, level.blood.opacity[prior_blood_stage], level.blood.opacity[new_blood_stage], ramptime, #"opacity", self.pstfx_blood);
        self thread function_c0cdd1f2(localclientnum, level.blood.var_4c8629ad[prior_blood_stage], level.blood.var_4c8629ad[new_blood_stage], ramptime, #"vignette darkening amount", self.pstfx_blood);
        self thread function_c0cdd1f2(localclientnum, level.blood.var_ea220db3[prior_blood_stage], level.blood.var_ea220db3[new_blood_stage], ramptime, #"vignette darkening factor", self.pstfx_blood);
        self thread function_c0cdd1f2(localclientnum, level.blood.blur[prior_blood_stage], level.blood.blur[new_blood_stage], ramptime, #"blur", self.pstfx_blood);
        if (level.blood.var_e9d8aaf5) {
            self thread function_c0cdd1f2(localclientnum, level.blood.refraction[prior_blood_stage], level.blood.refraction[new_blood_stage], ramptime, #"refraction", self.pstfx_blood);
        }
        if (isdefined(self.blood_enabled) && self.blood_enabled) {
            self function_116b95e5(self.pstfx_blood, #"hash_3886e6a5c0c3df4c", level.blood.blood_boost[new_blood_stage]);
        }
        self function_56419db8(new_blood_stage);
        self function_5a719e5(localclientnum, new_blood_stage, prior_blood_stage);
        self function_1cf17bbc(localclientnum, new_blood_stage, prior_blood_stage);
        self function_e91b92e2(localclientnum, new_blood_stage, prior_blood_stage);
    }
    self.last_blood_stage = new_blood_stage;
}

// Namespace blood/blood
// Params 6, eflags: 0x1 linked
// Checksum 0x9fea6990, Offset: 0x3168
// Size: 0xc4
function function_c0cdd1f2(localclientnum, stagefrom, stageto, ramptime, key, postfx) {
    self endon(#"death");
    self endon(#"hash_6d50f64fe99aed76");
    self notify("rampPostFx" + key + postfx);
    self endon("rampPostFx" + key + postfx);
    util::lerp_generic(localclientnum, ramptime, &function_b0298a0, stagefrom, stageto, key, postfx);
}

// Namespace blood/blood
// Params 8, eflags: 0x1 linked
// Checksum 0x3b52704e, Offset: 0x3238
// Size: 0xbc
function function_b0298a0(currenttime, elapsedtime, localclientnum, duration, stagefrom, stageto, key, postfx) {
    percent = elapsedtime / duration;
    amount = stageto * percent + stagefrom * (1 - percent);
    if (isdefined(self.blood_enabled) && self.blood_enabled) {
        self function_116b95e5(postfx, key, amount);
    }
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0xba6e6118, Offset: 0x3300
// Size: 0x6c
function private function_70299400(localclientnum) {
    if (level.var_4ecf5754 === #"silent_film") {
        return;
    }
    self.blood_enabled = 1;
    if (isdefined(self.blood_enabled) && self.blood_enabled) {
        self codeplaypostfxbundle(self.pstfx_blood);
    }
}

// Namespace blood/blood
// Params 2, eflags: 0x5 linked
// Checksum 0x68d5ec15, Offset: 0x3378
// Size: 0x1ac
function private function_436ee4c2(localclientnum, pstfx_blood) {
    self notify(#"hash_6d50f64fe99aed76");
    if (isdefined(self)) {
        if (self function_d2cb869e(pstfx_blood)) {
            self codestoppostfxbundle(pstfx_blood);
        }
        if (self function_d2cb869e(#"hash_73c750f53749d44d")) {
            self codestoppostfxbundle(#"hash_73c750f53749d44d");
        }
        self.blood_enabled = 0;
    } else {
        if (function_148ccc79(localclientnum, pstfx_blood)) {
            codestoppostfxbundlelocal(localclientnum, pstfx_blood);
        }
        if (function_148ccc79(localclientnum, #"hash_73c750f53749d44d")) {
            codestoppostfxbundlelocal(localclientnum, #"hash_73c750f53749d44d");
        }
    }
    if (!isdefined(self) || !(isdefined(self.nobloodlightbarchange) && self.nobloodlightbarchange)) {
        if (isdefined(level.controllercolor) && isdefined(level.controllercolor[localclientnum])) {
            setcontrollerlightbarcolor(localclientnum, level.controllercolor[localclientnum]);
            return;
        }
        setcontrollerlightbarcolor(localclientnum);
    }
}

// Namespace blood/blood
// Params 0, eflags: 0x5 linked
// Checksum 0x203fda68, Offset: 0x3530
// Size: 0x172a
function private function_dd830dee() {
    level.blood = spawnstruct();
    level.blood.scriptbundle = getgametypesetting(#"hardcoremode") ? getscriptbundle("hardcore_blood_settings") : getscriptbundle("blood_settings");
    if (sessionmodeiswarzonegame()) {
        level.blood.scriptbundle = getscriptbundle("wz_blood_settings");
    }
    assert(isdefined(level.blood.scriptbundle));
    if (!isdefined(level.blood.var_e9d8aaf5)) {
        level.blood.var_e9d8aaf5 = isdefined(level.blood.scriptbundle.var_e9d8aaf5) ? level.blood.scriptbundle.var_e9d8aaf5 : 0;
    }
    level.blood.refraction = [];
    if (!isdefined(level.blood.refraction[0])) {
        level.blood.refraction[0] = isdefined(level.blood.scriptbundle.var_9e65e691) ? level.blood.scriptbundle.var_9e65e691 : 0;
    }
    if (!isdefined(level.blood.refraction[1])) {
        level.blood.refraction[1] = isdefined(level.blood.scriptbundle.var_49ddbdf6) ? level.blood.scriptbundle.var_49ddbdf6 : 0;
    }
    if (!isdefined(level.blood.refraction[2])) {
        level.blood.refraction[2] = isdefined(level.blood.scriptbundle.var_83022fca) ? level.blood.scriptbundle.var_83022fca : 0;
    }
    if (!isdefined(level.blood.refraction[3])) {
        level.blood.refraction[3] = isdefined(level.blood.scriptbundle.var_90b9cb39) ? level.blood.scriptbundle.var_90b9cb39 : 0;
    }
    if (!isdefined(level.blood.refraction[4])) {
        level.blood.refraction[4] = isdefined(level.blood.scriptbundle.var_e790f8e6) ? level.blood.scriptbundle.var_e790f8e6 : 0;
    }
    level.blood.blood_boost = [];
    if (!isdefined(level.blood.blood_boost[0])) {
        level.blood.blood_boost[0] = isdefined(level.blood.scriptbundle.var_fd86eebc) ? level.blood.scriptbundle.var_fd86eebc : 0;
    }
    if (!isdefined(level.blood.blood_boost[1])) {
        level.blood.blood_boost[1] = isdefined(level.blood.scriptbundle.var_e741c232) ? level.blood.scriptbundle.var_e741c232 : 0;
    }
    if (!isdefined(level.blood.blood_boost[2])) {
        level.blood.blood_boost[2] = isdefined(level.blood.scriptbundle.var_e11b35e5) ? level.blood.scriptbundle.var_e11b35e5 : 0;
    }
    if (!isdefined(level.blood.blood_boost[3])) {
        level.blood.blood_boost[3] = isdefined(level.blood.scriptbundle.var_cadf096d) ? level.blood.scriptbundle.var_cadf096d : 0;
    }
    if (!isdefined(level.blood.blood_boost[4])) {
        level.blood.blood_boost[4] = isdefined(level.blood.scriptbundle.var_c3ad7b0a) ? level.blood.scriptbundle.var_c3ad7b0a : 0;
    }
    level.blood.blur = [];
    if (!isdefined(level.blood.blur[0])) {
        level.blood.blur[0] = isdefined(level.blood.scriptbundle.var_d4e546df) ? level.blood.scriptbundle.var_d4e546df : 0;
    }
    if (!isdefined(level.blood.blur[1])) {
        level.blood.blur[1] = isdefined(level.blood.scriptbundle.var_e6a76a63) ? level.blood.scriptbundle.var_e6a76a63 : 0;
    }
    if (!isdefined(level.blood.blur[2])) {
        level.blood.blur[2] = isdefined(level.blood.scriptbundle.var_b9320f69) ? level.blood.scriptbundle.var_b9320f69 : 0;
    }
    if (!isdefined(level.blood.blur[3])) {
        level.blood.blur[3] = isdefined(level.blood.scriptbundle.var_9af9d2f9) ? level.blood.scriptbundle.var_9af9d2f9 : 0;
    }
    if (!isdefined(level.blood.blur[4])) {
        level.blood.blur[4] = isdefined(level.blood.scriptbundle.var_acaf7664) ? level.blood.scriptbundle.var_acaf7664 : 0;
    }
    level.blood.opacity = [];
    if (!isdefined(level.blood.opacity[0])) {
        level.blood.opacity[0] = isdefined(level.blood.scriptbundle.var_a05e6a18) ? level.blood.scriptbundle.var_a05e6a18 : 0;
    }
    if (!isdefined(level.blood.opacity[1])) {
        level.blood.opacity[1] = isdefined(level.blood.scriptbundle.var_920ccd75) ? level.blood.scriptbundle.var_920ccd75 : 0;
    }
    if (!isdefined(level.blood.opacity[2])) {
        level.blood.opacity[2] = isdefined(level.blood.scriptbundle.var_54f2533d) ? level.blood.scriptbundle.var_54f2533d : 0;
    }
    if (!isdefined(level.blood.opacity[3])) {
        level.blood.opacity[3] = isdefined(level.blood.scriptbundle.var_467fb658) ? level.blood.scriptbundle.var_467fb658 : 0;
    }
    if (!isdefined(level.blood.opacity[4])) {
        level.blood.opacity[4] = isdefined(level.blood.scriptbundle.var_ed5b8411) ? level.blood.scriptbundle.var_ed5b8411 : 0;
    }
    level.blood.threshold = [];
    if (!isdefined(level.blood.threshold[0])) {
        level.blood.threshold[0] = isdefined(level.blood.scriptbundle.var_4e06fd93) ? level.blood.scriptbundle.var_4e06fd93 : 0;
    }
    if (!isdefined(level.blood.threshold[1])) {
        level.blood.threshold[1] = isdefined(level.blood.scriptbundle.var_3bc4590e) ? level.blood.scriptbundle.var_3bc4590e : 0;
    }
    if (!isdefined(level.blood.threshold[2])) {
        level.blood.threshold[2] = isdefined(level.blood.scriptbundle.var_bc1cd9c5) ? level.blood.scriptbundle.var_bc1cd9c5 : 0;
    }
    if (!isdefined(level.blood.threshold[3])) {
        level.blood.threshold[3] = isdefined(level.blood.scriptbundle.var_91558437) ? level.blood.scriptbundle.var_91558437 : 0;
    }
    if (!isdefined(level.blood.threshold[4])) {
        level.blood.threshold[4] = isdefined(level.blood.scriptbundle.var_7f6fe064) ? level.blood.scriptbundle.var_7f6fe064 : 0;
    }
    level.blood.fade = [];
    if (!isdefined(level.blood.fade[0])) {
        level.blood.fade[0] = isdefined(level.blood.scriptbundle.var_5eab69fa) ? level.blood.scriptbundle.var_5eab69fa : 0;
    }
    if (!isdefined(level.blood.fade[1])) {
        level.blood.fade[1] = isdefined(level.blood.scriptbundle.var_83dbb45a) ? level.blood.scriptbundle.var_83dbb45a : 0;
    }
    if (!isdefined(level.blood.fade[2])) {
        level.blood.fade[2] = isdefined(level.blood.scriptbundle.var_720a10b7) ? level.blood.scriptbundle.var_720a10b7 : 0;
    }
    if (!isdefined(level.blood.fade[3])) {
        level.blood.fade[3] = isdefined(level.blood.scriptbundle.var_f1f39088) ? level.blood.scriptbundle.var_f1f39088 : 0;
    }
    if (!isdefined(level.blood.fade[4])) {
        level.blood.fade[4] = isdefined(level.blood.scriptbundle.var_2945ff2c) ? level.blood.scriptbundle.var_2945ff2c : 0;
    }
    level.blood.var_4c8629ad = [];
    if (!isdefined(level.blood.var_4c8629ad[0])) {
        level.blood.var_4c8629ad[0] = isdefined(level.blood.scriptbundle.var_43305756) ? level.blood.scriptbundle.var_43305756 : 0;
    }
    if (!isdefined(level.blood.var_4c8629ad[1])) {
        level.blood.var_4c8629ad[1] = isdefined(level.blood.scriptbundle.var_517af3eb) ? level.blood.scriptbundle.var_517af3eb : 0;
    }
    if (!isdefined(level.blood.var_4c8629ad[2])) {
        level.blood.var_4c8629ad[2] = isdefined(level.blood.scriptbundle.var_6ec52e7f) ? level.blood.scriptbundle.var_6ec52e7f : 0;
    }
    if (!isdefined(level.blood.var_4c8629ad[3])) {
        level.blood.var_4c8629ad[3] = isdefined(level.blood.scriptbundle.var_7cfacaea) ? level.blood.scriptbundle.var_7cfacaea : 0;
    }
    if (!isdefined(level.blood.var_4c8629ad[4])) {
        level.blood.var_4c8629ad[4] = isdefined(level.blood.scriptbundle.var_fd0b4b01) ? level.blood.scriptbundle.var_fd0b4b01 : 0;
    }
    level.blood.var_ea220db3 = [];
    if (!isdefined(level.blood.var_ea220db3[0])) {
        level.blood.var_ea220db3[0] = isdefined(level.blood.scriptbundle.var_79c59717) ? level.blood.scriptbundle.var_79c59717 : 0;
    }
    if (!isdefined(level.blood.var_ea220db3[1])) {
        level.blood.var_ea220db3[1] = isdefined(level.blood.scriptbundle.var_a403eb93) ? level.blood.scriptbundle.var_a403eb93 : 0;
    }
    if (!isdefined(level.blood.var_ea220db3[2])) {
        level.blood.var_ea220db3[2] = isdefined(level.blood.scriptbundle.var_95514e2e) ? level.blood.scriptbundle.var_95514e2e : 0;
    }
    if (!isdefined(level.blood.var_ea220db3[3])) {
        level.blood.var_ea220db3[3] = isdefined(level.blood.scriptbundle.var_bf94a2b4) ? level.blood.scriptbundle.var_bf94a2b4 : 0;
    }
    if (!isdefined(level.blood.var_ea220db3[4])) {
        level.blood.var_ea220db3[4] = isdefined(level.blood.scriptbundle.var_3fe4235d) ? level.blood.scriptbundle.var_3fe4235d : 0;
    }
    function_f50652a9();
    function_b0e51f43();
    level.blood.rob = spawnstruct();
    if (!isdefined(level.blood.rob.stage)) {
        level.blood.rob.stage = isdefined(level.blood.scriptbundle.rob_stage) ? level.blood.scriptbundle.rob_stage : 0;
    }
    if (!isdefined(level.blood.rob.hold_time)) {
        level.blood.rob.hold_time = isdefined(level.blood.scriptbundle.var_ae06158b) ? level.blood.scriptbundle.var_ae06158b : 0;
    }
    if (!isdefined(level.blood.rob.fade_time)) {
        level.blood.rob.fade_time = isdefined(level.blood.scriptbundle.var_356550c9) ? level.blood.scriptbundle.var_356550c9 : 0;
    }
    if (!isdefined(level.blood.rob.damage_threshold)) {
        level.blood.rob.damage_threshold = isdefined(level.blood.scriptbundle.var_8635c7a1) ? level.blood.scriptbundle.var_8635c7a1 : 0;
    }
    if (!isdefined(level.blood.var_f5479429)) {
        level.blood.var_f5479429 = isdefined(level.blood.scriptbundle.var_f5479429) ? level.blood.scriptbundle.var_f5479429 : 0;
    }
    level.blood.var_587ce5b0 = level.blood.scriptbundle.var_587ce5b0;
    level.blood.var_49774f1 = level.blood.scriptbundle.var_49774f1;
    if (!isdefined(level.blood.var_f5479429)) {
        level.blood.var_f5479429 = isdefined(level.blood.scriptbundle.var_f5479429) ? level.blood.scriptbundle.var_f5479429 : 0;
    }
}

// Namespace blood/blood
// Params 1, eflags: 0x5 linked
// Checksum 0x171e7a0, Offset: 0x4c68
// Size: 0x9e
function private function_162fe6ec(localclientnum) {
    splatter = spawnstruct();
    splatter.splatters = [];
    for (j = 0; j < 4; j++) {
        splatter.splatters[j] = [];
    }
    splatter.var_120a7b2c = 0;
    level.blood.var_de10c136.var_51036e02[localclientnum] = splatter;
}

// Namespace blood/blood
// Params 0, eflags: 0x5 linked
// Checksum 0x41fcb9ae, Offset: 0x4d10
// Size: 0xb62
function private function_b0e51f43() {
    level.blood.var_de10c136 = spawnstruct();
    level.blood.var_de10c136.localclients = [];
    for (i = 0; i < getmaxlocalclients(); i++) {
        function_162fe6ec(i);
    }
    if (!isdefined(level.blood.var_de10c136.enabled)) {
        level.blood.var_de10c136.enabled = isdefined(level.blood.scriptbundle.var_f70c3e8d) ? level.blood.scriptbundle.var_f70c3e8d : 0;
    }
    if (!isdefined(level.blood.var_de10c136.damage_ranges)) {
        level.blood.var_de10c136.damage_ranges = isdefined(level.blood.scriptbundle.damage_ranges) ? level.blood.scriptbundle.damage_ranges : 1;
    }
    if (!isdefined(level.blood.var_de10c136.var_3e1e9389)) {
        level.blood.var_de10c136.var_3e1e9389 = isdefined(level.blood.scriptbundle.var_3e1e9389) ? level.blood.scriptbundle.var_3e1e9389 : 1;
    }
    level.blood.var_de10c136.range = [];
    level.blood.var_de10c136.var_587ce5b0 = [];
    level.blood.var_de10c136.var_49774f1 = [];
    level.blood.var_de10c136.hold_time = [];
    for (i = 0; i < level.blood.var_de10c136.damage_ranges; i++) {
        level.blood.var_de10c136.range[i] = spawnstruct();
        if (i > 0) {
            if (!isdefined(level.blood.var_de10c136.range[i].start)) {
                level.blood.var_de10c136.range[i].start = isdefined(level.blood.scriptbundle.("damage_range_start_" + i)) ? level.blood.scriptbundle.("damage_range_start_" + i) : level.blood.var_de10c136.range[i - 1].start;
            }
        } else if (!isdefined(level.blood.var_de10c136.range[i].start)) {
            level.blood.var_de10c136.range[i].start = isdefined(level.blood.scriptbundle.("damage_range_start_" + i)) ? level.blood.scriptbundle.("damage_range_start_" + i) : 0;
        }
        if (!isdefined(level.blood.var_de10c136.range[i].blur)) {
            level.blood.var_de10c136.range[i].blur = isdefined(level.blood.scriptbundle.("damage_range_blur_" + i)) ? level.blood.scriptbundle.("damage_range_blur_" + i) : 0;
        }
        if (!isdefined(level.blood.var_de10c136.range[i].opacity)) {
            level.blood.var_de10c136.range[i].opacity = isdefined(level.blood.scriptbundle.("damage_range_opacity_" + i)) ? level.blood.scriptbundle.("damage_range_opacity_" + i) : 0;
        }
        if (!isdefined(level.blood.var_de10c136.var_587ce5b0[i])) {
            level.blood.var_de10c136.var_587ce5b0[i] = isdefined(level.blood.scriptbundle.("hit_flash_ramp_in_time_" + i)) ? level.blood.scriptbundle.("hit_flash_ramp_in_time_" + i) : 0;
        }
        if (!isdefined(level.blood.var_de10c136.var_49774f1[i])) {
            level.blood.var_de10c136.var_49774f1[i] = isdefined(level.blood.scriptbundle.("hit_flash_ramp_out_time_" + i)) ? level.blood.scriptbundle.("hit_flash_ramp_out_time_" + i) : 0;
        }
        if (!isdefined(level.blood.var_de10c136.hold_time[i])) {
            level.blood.var_de10c136.hold_time[i] = isdefined(level.blood.scriptbundle.("hit_flash_hold_time_" + i)) ? level.blood.scriptbundle.("hit_flash_hold_time_" + i) : 0;
        }
    }
    level.blood.var_de10c136.dot = spawnstruct();
    if (!isdefined(level.blood.var_de10c136.dot.blur)) {
        level.blood.var_de10c136.dot.blur = isdefined(level.blood.scriptbundle.("dot_blur")) ? level.blood.scriptbundle.("dot_blur") : 0;
    }
    if (!isdefined(level.blood.var_de10c136.dot.opacity)) {
        level.blood.var_de10c136.dot.opacity = isdefined(level.blood.scriptbundle.("dot_opacity")) ? level.blood.scriptbundle.("dot_opacity") : 0;
    }
    if (!isdefined(level.blood.var_de10c136.dot.var_587ce5b0)) {
        level.blood.var_de10c136.dot.var_587ce5b0 = isdefined(level.blood.scriptbundle.("dot_hit_flash_ramp_in_time")) ? level.blood.scriptbundle.("dot_hit_flash_ramp_in_time") : 0;
    }
    if (!isdefined(level.blood.var_de10c136.dot.var_49774f1)) {
        level.blood.var_de10c136.dot.var_49774f1 = isdefined(level.blood.scriptbundle.("dot_hit_flash_ramp_out_time")) ? level.blood.scriptbundle.("dot_hit_flash_ramp_out_time") : 0;
    }
    if (!isdefined(level.blood.var_de10c136.dot.hold_time)) {
        level.blood.var_de10c136.dot.hold_time = isdefined(level.blood.scriptbundle.("dot_hit_flash_hold_time")) ? level.blood.scriptbundle.("dot_hit_flash_hold_time") : 0;
    }
    if (!isdefined(level.blood.var_de10c136.dot.var_6264f8dd)) {
        level.blood.var_de10c136.dot.var_6264f8dd = isdefined(level.blood.scriptbundle.("dot_ignore_damage_threshold")) ? level.blood.scriptbundle.("dot_ignore_damage_threshold") : 0;
    }
    if (!isdefined(level.blood.var_de10c136.dot.var_372dff4b)) {
        level.blood.var_de10c136.dot.var_372dff4b = isdefined(level.blood.scriptbundle.("dot_ignore_damage_time")) ? level.blood.scriptbundle.("dot_ignore_damage_time") : 0;
    }
}

// Namespace blood/blood
// Params 0, eflags: 0x5 linked
// Checksum 0x17d898ca, Offset: 0x5880
// Size: 0x1ba2
function private function_f50652a9() {
    level.blood.var_f2de135e = spawnstruct();
    level.blood.var_f2de135e.time_in = [];
    level.blood.var_f2de135e.var_a79aba98 = [];
    level.blood.var_f2de135e.time_out = [];
    level.blood.var_f2de135e.var_97aa6fd2 = [];
    level.blood.var_f2de135e.var_562c41de = [];
    level.blood.var_f2de135e.var_18f673f1 = [];
    level.blood.var_f2de135e.var_92fc0d45 = [];
    level.blood.var_f2de135e.var_5b5500f7 = [];
    level.blood.var_f2de135e.time_in[0] = [];
    if (!isdefined(level.blood.var_f2de135e.time_in[0][0])) {
        level.blood.var_f2de135e.time_in[0][0] = isdefined(level.blood.scriptbundle.var_b3272558) ? level.blood.scriptbundle.var_b3272558 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_in[0][1])) {
        level.blood.var_f2de135e.time_in[0][1] = isdefined(level.blood.scriptbundle.var_d014df1f) ? level.blood.scriptbundle.var_d014df1f : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_in[0][2])) {
        level.blood.var_f2de135e.time_in[0][2] = isdefined(level.blood.scriptbundle.var_bdca3a8a) ? level.blood.scriptbundle.var_bdca3a8a : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_in[0][3])) {
        level.blood.var_f2de135e.time_in[0][3] = isdefined(level.blood.scriptbundle.var_ab891608) ? level.blood.scriptbundle.var_ab891608 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_in[0][4])) {
        level.blood.var_f2de135e.time_in[0][4] = isdefined(level.blood.scriptbundle.var_996371bd) ? level.blood.scriptbundle.var_996371bd : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_562c41de[0])) {
        level.blood.var_f2de135e.var_562c41de[0] = level.blood.var_f2de135e.time_in[0][0];
    }
    level.blood.var_f2de135e.time_in[1] = [];
    if (!isdefined(level.blood.var_f2de135e.time_in[1][0])) {
        level.blood.var_f2de135e.time_in[1][0] = isdefined(level.blood.scriptbundle.var_8623b2d2) ? level.blood.scriptbundle.var_8623b2d2 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_in[1][1])) {
        level.blood.var_f2de135e.time_in[1][1] = isdefined(level.blood.scriptbundle.var_7862174f) ? level.blood.scriptbundle.var_7862174f : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_in[1][2])) {
        level.blood.var_f2de135e.time_in[1][2] = isdefined(level.blood.scriptbundle.var_d2b4cbf3) ? level.blood.scriptbundle.var_d2b4cbf3 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_in[1][3])) {
        level.blood.var_f2de135e.time_in[1][3] = isdefined(level.blood.scriptbundle.var_bcf6a077) ? level.blood.scriptbundle.var_bcf6a077 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_in[1][4])) {
        level.blood.var_f2de135e.time_in[1][4] = isdefined(level.blood.scriptbundle.var_af1f04c8) ? level.blood.scriptbundle.var_af1f04c8 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_562c41de[1])) {
        level.blood.var_f2de135e.var_562c41de[1] = level.blood.var_f2de135e.time_in[1][0];
    }
    level.blood.var_f2de135e.var_a79aba98[0] = [];
    if (!isdefined(level.blood.var_f2de135e.var_a79aba98[0][0])) {
        level.blood.var_f2de135e.var_a79aba98[0][0] = isdefined(level.blood.scriptbundle.var_a647a17d) ? level.blood.scriptbundle.var_a647a17d : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_a79aba98[0][1])) {
        level.blood.var_f2de135e.var_a79aba98[0][1] = isdefined(level.blood.scriptbundle.var_2fc5ae5) ? level.blood.scriptbundle.var_2fc5ae5 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_a79aba98[0][2])) {
        level.blood.var_f2de135e.var_a79aba98[0][2] = isdefined(level.blood.scriptbundle.var_10be7669) ? level.blood.scriptbundle.var_10be7669 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_a79aba98[0][3])) {
        level.blood.var_f2de135e.var_a79aba98[0][3] = isdefined(level.blood.scriptbundle.var_9147f772) ? level.blood.scriptbundle.var_9147f772 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_a79aba98[0][4])) {
        level.blood.var_f2de135e.var_a79aba98[0][4] = isdefined(level.blood.scriptbundle.var_5f8a13f7) ? level.blood.scriptbundle.var_5f8a13f7 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_18f673f1[0])) {
        level.blood.var_f2de135e.var_18f673f1[0] = level.blood.var_f2de135e.var_a79aba98[0][0];
    }
    level.blood.var_f2de135e.var_a79aba98[1] = [];
    if (!isdefined(level.blood.var_f2de135e.var_a79aba98[1][0])) {
        level.blood.var_f2de135e.var_a79aba98[1][0] = isdefined(level.blood.scriptbundle.var_96868f33) ? level.blood.scriptbundle.var_96868f33 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_a79aba98[1][1])) {
        level.blood.var_f2de135e.var_a79aba98[1][1] = isdefined(level.blood.scriptbundle.var_16780f18) ? level.blood.scriptbundle.var_16780f18 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_a79aba98[1][2])) {
        level.blood.var_f2de135e.var_a79aba98[1][2] = isdefined(level.blood.scriptbundle.var_48c373ae) ? level.blood.scriptbundle.var_48c373ae : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_a79aba98[1][3])) {
        level.blood.var_f2de135e.var_a79aba98[1][3] = isdefined(level.blood.scriptbundle.var_38fed425) ? level.blood.scriptbundle.var_38fed425 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_a79aba98[1][4])) {
        level.blood.var_f2de135e.var_a79aba98[1][4] = isdefined(level.blood.scriptbundle.var_6b3d38a1) ? level.blood.scriptbundle.var_6b3d38a1 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_18f673f1[1])) {
        level.blood.var_f2de135e.var_18f673f1[1] = level.blood.var_f2de135e.var_a79aba98[1][0];
    }
    level.blood.var_f2de135e.time_out[0] = [];
    if (!isdefined(level.blood.var_f2de135e.time_out[0][0])) {
        level.blood.var_f2de135e.time_out[0][0] = isdefined(level.blood.scriptbundle.var_54f5763f) ? level.blood.scriptbundle.var_54f5763f : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_out[0][1])) {
        level.blood.var_f2de135e.time_out[0][1] = isdefined(level.blood.scriptbundle.var_7cedbf3) ? level.blood.scriptbundle.var_7cedbf3 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_out[0][2])) {
        level.blood.var_f2de135e.time_out[0][2] = isdefined(level.blood.scriptbundle.var_3959bf08) ? level.blood.scriptbundle.var_3959bf08 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_out[0][3])) {
        level.blood.var_f2de135e.time_out[0][3] = isdefined(level.blood.scriptbundle.var_3e6f492f) ? level.blood.scriptbundle.var_3e6f492f : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_out[0][4])) {
        level.blood.var_f2de135e.time_out[0][4] = isdefined(level.blood.scriptbundle.var_704a2ce8) ? level.blood.scriptbundle.var_704a2ce8 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_92fc0d45[0])) {
        level.blood.var_f2de135e.var_92fc0d45[0] = level.blood.var_f2de135e.time_out[0][0];
    }
    level.blood.var_f2de135e.time_out[1] = [];
    if (!isdefined(level.blood.var_f2de135e.time_out[1][0])) {
        level.blood.var_f2de135e.time_out[1][0] = isdefined(level.blood.scriptbundle.var_50fd2cd8) ? level.blood.scriptbundle.var_50fd2cd8 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_out[1][1])) {
        level.blood.var_f2de135e.time_out[1][1] = isdefined(level.blood.scriptbundle.var_b2c3f064) ? level.blood.scriptbundle.var_b2c3f064 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_out[1][2])) {
        level.blood.var_f2de135e.time_out[1][2] = isdefined(level.blood.scriptbundle.var_855a1591) ? level.blood.scriptbundle.var_855a1591 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_out[1][3])) {
        level.blood.var_f2de135e.time_out[1][3] = isdefined(level.blood.scriptbundle.var_9731393f) ? level.blood.scriptbundle.var_9731393f : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.time_out[1][4])) {
        level.blood.var_f2de135e.time_out[1][4] = isdefined(level.blood.scriptbundle.var_e9dd5e9a) ? level.blood.scriptbundle.var_e9dd5e9a : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_92fc0d45[1])) {
        level.blood.var_f2de135e.var_92fc0d45[1] = level.blood.var_f2de135e.time_out[1][0];
    }
    level.blood.var_f2de135e.var_97aa6fd2[0] = [];
    if (!isdefined(level.blood.var_f2de135e.var_97aa6fd2[0][0])) {
        level.blood.var_f2de135e.var_97aa6fd2[0][0] = isdefined(level.blood.scriptbundle.var_9e799d8c) ? level.blood.scriptbundle.var_9e799d8c : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_97aa6fd2[0][1])) {
        level.blood.var_f2de135e.var_97aa6fd2[0][1] = isdefined(level.blood.scriptbundle.var_8bb8f80b) ? level.blood.scriptbundle.var_8bb8f80b : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_97aa6fd2[0][2])) {
        level.blood.var_f2de135e.var_97aa6fd2[0][2] = isdefined(level.blood.scriptbundle.var_7205c4a5) ? level.blood.scriptbundle.var_7205c4a5 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_97aa6fd2[0][3])) {
        level.blood.var_f2de135e.var_97aa6fd2[0][3] = isdefined(level.blood.scriptbundle.var_619e23d6) ? level.blood.scriptbundle.var_619e23d6 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_97aa6fd2[0][4])) {
        level.blood.var_f2de135e.var_97aa6fd2[0][4] = isdefined(level.blood.scriptbundle.var_56f00e7a) ? level.blood.scriptbundle.var_56f00e7a : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_5b5500f7[0])) {
        level.blood.var_f2de135e.var_5b5500f7[0] = level.blood.var_f2de135e.var_97aa6fd2[0][0];
    }
    level.blood.var_f2de135e.var_97aa6fd2[1] = [];
    if (!isdefined(level.blood.var_f2de135e.var_97aa6fd2[1][0])) {
        level.blood.var_f2de135e.var_97aa6fd2[1][0] = isdefined(level.blood.scriptbundle.var_ff41f2f5) ? level.blood.scriptbundle.var_ff41f2f5 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_97aa6fd2[1][1])) {
        level.blood.var_f2de135e.var_97aa6fd2[1][1] = isdefined(level.blood.scriptbundle.var_f0f35658) ? level.blood.scriptbundle.var_f0f35658 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_97aa6fd2[1][2])) {
        level.blood.var_f2de135e.var_97aa6fd2[1][2] = isdefined(level.blood.scriptbundle.var_9cf6ae3c) ? level.blood.scriptbundle.var_9cf6ae3c : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_97aa6fd2[1][3])) {
        level.blood.var_f2de135e.var_97aa6fd2[1][3] = isdefined(level.blood.scriptbundle.var_1ca22db5) ? level.blood.scriptbundle.var_1ca22db5 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_97aa6fd2[1][4])) {
        level.blood.var_f2de135e.var_97aa6fd2[1][4] = isdefined(level.blood.scriptbundle.var_6530117) ? level.blood.scriptbundle.var_6530117 : 0;
    }
    if (!isdefined(level.blood.var_f2de135e.var_5b5500f7[1])) {
        level.blood.var_f2de135e.var_5b5500f7[1] = level.blood.var_f2de135e.var_97aa6fd2[1][0];
    }
}


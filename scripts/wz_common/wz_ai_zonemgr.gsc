#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\match_record;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\mp_common\item_world;
#using scripts\wz_common\wz_ai_utils;
#using scripts\wz_common\wz_ai_zombie;

#namespace wz_ai_zonemgr;

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x2
// Checksum 0x11129367, Offset: 0x228
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"wz_ai_zonemgr", &__init__, undefined, undefined);
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0xc8f71ba, Offset: 0x270
// Size: 0xf94
function __init__() {
    level.var_8110be92 = 0;
    level.var_cd9b94f3 = 1;
    level.var_86c18344 = 1;
    level.var_45e13026 = 0;
    level.var_76fc612e = 50;
    level.var_e147d7b8 = isdefined(getgametypesetting(#"wzaizones")) ? getgametypesetting(#"wzaizones") : 1;
    level.var_cca518d = isdefined(getgametypesetting(#"wzzombies")) ? getgametypesetting(#"wzzombies") : 1;
    level.warzoneblightfatherenabled = isdefined(getgametypesetting(#"wzblightfather")) ? getgametypesetting(#"wzblightfather") : 0;
    level.warzonehellhoundenabled = isdefined(getgametypesetting(#"wzhellhounds")) ? getgametypesetting(#"wzhellhounds") : 0;
    level.warzonebrutusenabled = isdefined(getgametypesetting(#"wzbrutus")) ? getgametypesetting(#"wzbrutus") : 0;
    level.var_4f7f5c18 = isdefined(getgametypesetting(#"wzbrutuslarge")) ? getgametypesetting(#"wzbrutuslarge") : 0;
    level.warzoneavogadroenabled = isdefined(getgametypesetting(#"wzavogadro")) ? getgametypesetting(#"wzavogadro") : 0;
    level.warzonespawnspecial = isdefined(getgametypesetting(#"wzspawnspecial")) ? getgametypesetting(#"wzspawnspecial") : 0;
    level.warzoneblightfatherseverywhere = isdefined(getgametypesetting(#"wzblightfatherseverywhere")) ? getgametypesetting(#"wzblightfatherseverywhere") : 0;
    level.warzonehellhoundseverywhere = isdefined(getgametypesetting(#"wzhellhoundseverywhere")) ? getgametypesetting(#"wzhellhoundseverywhere") : 0;
    level.warzonebrutuseverywhere = isdefined(getgametypesetting(#"wzbrutuseverywhere")) ? getgametypesetting(#"wzbrutuseverywhere") : 0;
    level.warzonebrutuslargeeverywhere = isdefined(getgametypesetting(#"wzbrutuslargeeverywhere")) ? getgametypesetting(#"wzbrutuslargeeverywhere") : 0;
    level.warzoneavogadroeverywhere = isdefined(getgametypesetting(#"wzavogadroeverywhere")) ? getgametypesetting(#"wzavogadroeverywhere") : 0;
    level.var_66edaf37 = 1;
    level.var_fd6c6b69 = 1;
    level.var_3fecd9c2 = 1;
    level.var_c4c0fb68 = isdefined(getgametypesetting(#"hash_3668350e780332a3")) ? getgametypesetting(#"hash_3668350e780332a3") : 0;
    level.warzonespawnanywhere = isdefined(getgametypesetting(#"wzspawnanywhere")) ? getgametypesetting(#"wzspawnanywhere") : 0;
    level.warzonezombiesmaxtest = isdefined(getgametypesetting(#"wzzombiesmaxtest")) ? getgametypesetting(#"wzzombiesmaxtest") : 0;
    level.warzonezombiesmaxcount = isdefined(getgametypesetting(#"wzzombiesmaxcount")) ? getgametypesetting(#"wzzombiesmaxcount") : 8;
    level.var_7b5ba689 = isdefined(getgametypesetting(#"wzgreeneyes")) ? getgametypesetting(#"wzgreeneyes") : 0;
    level.var_754d756 = (isdefined(getgametypesetting(#"hash_3e2d2cf6b1cc6c68")) ? getgametypesetting(#"hash_3e2d2cf6b1cc6c68") : 0) || (isdefined(getgametypesetting(#"hash_1b4a66a008f60927")) ? getgametypesetting(#"hash_1b4a66a008f60927") : 0);
    level.warzoneminibosses = isdefined(getgametypesetting(#"wzminibosses")) ? getgametypesetting(#"wzminibosses") : 0;
    level.warzoneadddogs = isdefined(getgametypesetting(#"wzadddogs")) ? getgametypesetting(#"wzadddogs") : 0;
    if (isdedicated()) {
        numzm = getdvarint(#"hash_57d63269cdf0c97f", 0);
        if (0 < numzm) {
            iprintlnbold("Initing " + numzm + " zombies " + "\n");
            level.warzonezombiesmaxtest = 1;
            level.warzonezombiesmaxcount = numzm;
        }
    }
    level.var_d06e67bc = isdefined(getgametypesetting(#"wzzonerandom")) ? getgametypesetting(#"wzzonerandom") : 0;
    level.warzonezoneindex = isdefined(getgametypesetting(#"wzzoneindex")) ? getgametypesetting(#"wzzoneindex") : 0;
    level.var_b4143320 = isdefined(getgametypesetting(#"hash_234ae2f2ff58263f")) ? getgametypesetting(#"hash_234ae2f2ff58263f") : 0;
    level.var_acfc1745 = isdefined(getgametypesetting(#"hash_622b18585020f430")) ? getgametypesetting(#"hash_622b18585020f430") : 3;
    level.var_1b2f5c9d = isdefined(getgametypesetting(#"hash_3d9a364d54750dca")) ? getgametypesetting(#"hash_3d9a364d54750dca") : 3;
    level.var_ad2edeba = isdefined(getgametypesetting(#"hash_450463e38ea8bf1")) ? getgametypesetting(#"hash_450463e38ea8bf1") : 3;
    level.var_a71296ac = isdefined(getgametypesetting(#"hash_69ad073972c1c4ea")) ? getgametypesetting(#"hash_69ad073972c1c4ea") : 3;
    level.var_1a35832e = isdefined(getgametypesetting(#"hash_24a3def3bbc35dfa")) ? getgametypesetting(#"hash_24a3def3bbc35dfa") : 4;
    level.var_5fe6aef = isdefined(getgametypesetting(#"hash_4d3b84d98e3a83d4")) ? getgametypesetting(#"hash_4d3b84d98e3a83d4") : 0;
    level.var_f3aeca10 = isdefined(getgametypesetting(#"hash_446a66a4499c4e5d")) ? getgametypesetting(#"hash_446a66a4499c4e5d") : 2;
    level.var_58d5713c = isdefined(getgametypesetting(#"hash_11a3265d74f0d51")) ? getgametypesetting(#"hash_11a3265d74f0d51") : 4;
    level.var_b4e7b849 = isdefined(getgametypesetting(#"hash_22431a9369b5d7c0")) ? getgametypesetting(#"hash_22431a9369b5d7c0") : 100;
    /#
        if (getdvarint(#"wz_ai_on", 0) > 0) {
            level.var_e066667d = 1;
        } else {
            level.var_e066667d = 0;
        }
        if (!isdefined(level.var_85a39c96)) {
            level.var_85a39c96 = 0;
        }
        level.var_e12ea40c = 0;
    #/
    level thread function_7b0c014e();
    callback::on_spawned(&on_player_spawned);
    callback::on_player_killed_with_params(&on_player_killed);
    callback::on_downed(&on_player_downed);
    level.var_dabf85eb = 0;
    level.var_392ea96a = 0;
    level.var_3140c814 = 1;
    level.var_5e8121a = 1;
    level.startinghealth = 300;
    if (isdefined(level.var_66edaf37) && level.var_66edaf37) {
        level.startinghealth = 150;
    }
    level.var_bd19c3a8 = &function_bd19c3a8;
    level.var_a7f72ea1 = #"hash_1dcbe8021fb16344";
    level.var_f2bbd457 = #"hash_2719f9bf8294979f";
    level.var_b6e3500b = #"p8_wz_teddybear";
    level.var_96bd78dd = #"hash_1cd5ad7d3323d02c";
    level.var_591aff35 = #"hash_5afb37e5e38fa248";
    level.var_3b378d26 = #"hash_5e132c061625eb87";
    level.var_d8ddf407 = #"p8_wz_win_teddybear";
    level.zmb_laugh_alias = "zmb_player_outofbounds";
    level.var_5f531c0f = int(100 * 1000);
    level.var_d2954f43 = 90;
    level.var_5b357434 = [];
    level.var_339a0198 = [];
    level thread function_f3e8cf82();
    level thread function_b5a875df();
    /#
        level thread function_d0055419();
    #/
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x4
// Checksum 0xc78d2cf9, Offset: 0x1210
// Size: 0x7a
function private on_player_downed() {
    if (isdefined(self.laststandparams)) {
        attacker = self.laststandparams.attacker;
        if (isdefined(attacker)) {
            if (isdefined(attacker.ai_zone)) {
                self.laststandparams.var_400f40fa = attacker.ai_zone;
                self.laststandparams.attacker_archetype = attacker.archetype;
            }
        }
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 1, eflags: 0x4
// Checksum 0x3fe45f65, Offset: 0x1298
// Size: 0x10c
function private on_player_killed(params) {
    ai_zone = undefined;
    attacker_archetype = undefined;
    if (isdefined(params) && isdefined(params.eattacker) && params.eattacker != self) {
        ai_zone = params.eattacker.ai_zone;
        attacker_archetype = params.eattacker.archetype;
    }
    if (isdefined(self.laststandparams)) {
        if (isdefined(self.laststandparams)) {
            ai_zone = self.laststandparams.var_400f40fa;
            attacker_archetype = self.laststandparams.attacker_archetype;
        }
    }
    if (isdefined(ai_zone) && isdefined(attacker_archetype)) {
        if (attacker_archetype === #"zombie") {
            ai_zone.var_14403c0a++;
            return;
        }
        ai_zone.var_719d00b8++;
    }
}

/#

    // Namespace wz_ai_zonemgr/wz_ai_zonemgr
    // Params 1, eflags: 0x4
    // Checksum 0xf8a43714, Offset: 0x13b0
    // Size: 0x1b2
    function private function_5a46c509(var_d53fd9d8) {
        infovolumedebuginit();
        old_value = 0;
        while (true) {
            if (old_value != level.var_e12ea40c) {
                old_value = level.var_e12ea40c;
                setdvar(#"g_drawdebuginfovolumes", old_value);
                if (old_value) {
                    foreach (ent in var_d53fd9d8) {
                        showinfovolume(ent getentitynumber(), (1, 0.5, 0.5), 0.5);
                    }
                } else {
                    foreach (ent in var_d53fd9d8) {
                        hideinfovolume(ent getentitynumber());
                    }
                }
            }
            waitframe(1);
        }
    }

    // Namespace wz_ai_zonemgr/wz_ai_zonemgr
    // Params 0, eflags: 0x0
    // Checksum 0x52ae06b, Offset: 0x1570
    // Size: 0x12e
    function spawn_a_zombie() {
        players = getplayers();
        spawn_position = players[0].origin + vectorscale(anglestoforward(level.players[0].angles), 100);
        spawned = spawnactor(#"spawner_boct_zombie_wz", spawn_position, (0, 0, 0), "<dev string:x38>");
        if (isdefined(spawned)) {
            spawned thread wz_ai_utils::function_7adc1e46(undefined, 0);
            spawned.var_ef59b90 = 3;
            spawned.favoriteenemy = players[0];
            spawned wz_ai_zombie::function_d1e55248(#"hash_6e6d6ff06622efa4", 1);
            spawned.var_721a3dbd = 0;
            spawned.var_35eedf58 = 0;
        }
    }

    // Namespace wz_ai_zonemgr/wz_ai_zonemgr
    // Params 0, eflags: 0x0
    // Checksum 0xe7292c57, Offset: 0x16a8
    // Size: 0x930
    function function_d0055419() {
        sessionmode = currentsessionmode();
        setdvar(#"hash_70cb00491d863294", "<dev string:x44>");
        if (sessionmode != 4) {
            adddebugcommand("<dev string:x47>");
            adddebugcommand("<dev string:x8c>");
            adddebugcommand("<dev string:xcb>");
            adddebugcommand("<dev string:x10c>");
            adddebugcommand("<dev string:x156>");
            adddebugcommand("<dev string:x1a2>");
            adddebugcommand("<dev string:x1eb>");
            adddebugcommand("<dev string:x236>");
            adddebugcommand("<dev string:x286>");
            adddebugcommand("<dev string:x2d8>");
            adddebugcommand("<dev string:x322>");
            adddebugcommand("<dev string:x36e>");
            adddebugcommand("<dev string:x3b2>");
            adddebugcommand("<dev string:x3f8>");
            adddebugcommand("<dev string:x43c>");
            adddebugcommand("<dev string:x482>");
            adddebugcommand("<dev string:x4d8>");
            adddebugcommand("<dev string:x530>");
            adddebugcommand("<dev string:x586>");
        }
        while (true) {
            wait 0.25;
            cmd = getdvarstring(#"hash_70cb00491d863294", "<dev string:x44>");
            if (cmd == "<dev string:x44>") {
                continue;
            }
            if (strstartswith(cmd, "<dev string:x5de>")) {
                arr = strtok(cmd, "<dev string:x5ef>");
                zone_name = arr[1];
                ai_type = hash(arr[2]);
                zone_ins = function_aacb2027(zone_name, ai_type);
                zone_ins.is_disabled = 0;
                level.var_8110be92 = 1;
                if (!(isdefined(zone_ins.is_active) && zone_ins.is_active)) {
                    zone_ins.var_cafac64a = ai_type;
                    level thread function_41101f23(zone_ins, 1);
                    level notify(#"hash_4168bee802274065");
                }
            } else if (strstartswith(cmd, "<dev string:x5f3>")) {
                arr = strtok(cmd, "<dev string:x5ef>");
                zone_name = arr[1];
                ai_type = hash(arr[2]);
                zone_ins = function_aacb2027(zone_name, ai_type);
                zone_ins.is_active = 0;
                zone_ins.lock_zone = 0;
                zone_ins.is_disabled = 1;
                zone_ins.minimap clientfield::set("<dev string:x606>", 0);
                zone_ins thread function_a82cad64(zone_ins);
                zone_ins.var_8f95a80f = gettime() + level.var_5f531c0f;
                zone_ins function_4fa5953();
                level notify(#"hash_4168bee802274065");
            } else if (strstartswith(cmd, "<dev string:x618>")) {
                weapon_name = strreplace(cmd, "<dev string:x618>", "<dev string:x44>");
                weapon = getweapon(weapon_name);
                players = getplayers();
                players[0] giveweapon(weapon);
                players[0] switchtoweapon(weapon);
                players[0] setweaponammostock(weapon, weapon.maxammo);
                players[0] setweaponammoclip(weapon, weapon.clipsize);
                players[0] givestartammo(weapon);
            } else {
                switch (cmd) {
                case #"hash_c0b89e8d4a71cff":
                    spawn_a_zombie();
                    break;
                case #"debug_on":
                    level.var_e066667d = 1;
                    break;
                case #"debug_off":
                    level.var_e066667d = 0;
                    break;
                case #"debug_zone_on":
                    level.var_e12ea40c = 1;
                    break;
                case #"debug_zone_off":
                    level.var_e12ea40c = 0;
                    break;
                case #"instakill_on":
                    level.var_85a39c96 = 1;
                    break;
                case #"instakill_off":
                    level.var_85a39c96 = 0;
                    break;
                case #"hash_4ed816315358d362":
                    level.var_e649db79 = 1;
                    break;
                case #"hash_521be9d0a005a914":
                    level.var_e649db79 = 0;
                    break;
                case #"hash_c015abbb44bc09d":
                    level.var_76325c03 = 1;
                    break;
                case #"hash_31f2f7f35ca1d139":
                    level.var_76325c03 = 0;
                    break;
                case #"hash_7c3e7cf0cb94bbda":
                    level.var_5a8c9c14 = 1;
                    break;
                case #"hash_32ced929eda3e72c":
                    level.var_5a8c9c14 = 0;
                    break;
                case #"hash_788a81597d5838b8":
                    level.var_c2c5f852 = 1;
                    break;
                case #"hash_2b77790ffcd187f2":
                    level.var_c2c5f852 = 0;
                    break;
                case #"event1_on":
                    level.var_add70a3e = 1;
                    break;
                case #"event1_off":
                    level.var_add70a3e = 0;
                    break;
                case #"hash_7d71521eb78e5a1e":
                    level.var_3140c814 = 1;
                    break;
                case #"hash_35cdd231e6cca0a0":
                    level.var_3140c814 = 0;
                    break;
                case #"hash_11b3aaf9fb27ee13":
                    level.var_5e8121a = 1;
                    break;
                case #"hash_3c54ebc5c4f0dd57":
                    level.var_5e8121a = 0;
                    break;
                }
            }
            setdvar(#"hash_70cb00491d863294", "<dev string:x44>");
        }
    }

#/

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0x480bb7e1, Offset: 0x1fe0
// Size: 0x5dc
function function_dc16557c() {
    if (isdefined(level.var_dc16557c) && level.var_dc16557c) {
        for (i = 0; i < level.var_5b357434.size; i++) {
            assert(i < 10, "<dev string:x627>");
            ai_zone = level.var_5b357434[i];
            if (ai_zone.zone_activated == 0) {
                continue;
            }
            var_c2b80e0c = hash(ai_zone.zone_name);
            match_record::function_7a93acec(#"ai_zones", i, #"origin", ai_zone.origin);
            match_record::set_stat(#"ai_zones", i, #"name", var_c2b80e0c);
            match_record::set_stat(#"ai_zones", i, #"death_circle", ai_zone.death_circle);
            match_record::set_stat(#"ai_zones", i, #"zone_activated", ai_zone.zone_activated);
            match_record::set_stat(#"ai_zones", i, #"zone_blightfather", ai_zone.zone_blightfather);
            match_record::set_stat(#"ai_zones", i, #"zone_brutus", ai_zone.zone_brutus);
            match_record::set_stat(#"ai_zones", i, #"zone_hellhounds", ai_zone.zone_hellhounds);
            match_record::set_stat(#"ai_zones", i, #"hash_46c66659061c4df6", ai_zone.var_7bf9c18e);
            match_record::set_stat(#"ai_zones", i, #"hash_2778c481a1f0f691", ai_zone.var_7c620997);
            match_record::set_stat(#"ai_zones", i, #"hash_3bd0e72c0da688b8", ai_zone.var_58ba2ab7);
            match_record::set_stat(#"ai_zones", i, #"hash_2f54ea56d60207e4", ai_zone.var_14403c0a);
            match_record::set_stat(#"ai_zones", i, #"hash_7c33a0c7c454cdeb", ai_zone.var_af37e04a);
            match_record::set_stat(#"ai_zones", i, #"hash_78530caab146b8b2", ai_zone.var_41e86d33);
            match_record::set_stat(#"ai_zones", i, #"hash_468f7191e8118876", ai_zone.var_719d00b8);
            if (isdefined(level.var_c64b3b46) && level.var_c64b3b46) {
                if (isdefined(ai_zone.item_drops)) {
                    foreach (archetype, archetypeitems in ai_zone.item_drops) {
                        var_7a69806 = #"hash_5ca6052f03257d05";
                        if (archetype == #"blight_father") {
                            var_7a69806 = #"hash_7357a4f64d8993b7";
                        }
                        index = 0;
                        foreach (key, item in ai_zone.item_drops[archetype]) {
                            assert(index < 20, "<dev string:x656>");
                            match_record::set_stat(var_7a69806, index, #"item_name", key);
                            match_record::set_stat(var_7a69806, index, #"item_count", item.count);
                            match_record::set_stat(var_7a69806, index, #"zone_name", var_c2b80e0c);
                            index++;
                        }
                    }
                }
            }
        }
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 1, eflags: 0x0
// Checksum 0x16b726e7, Offset: 0x25c8
// Size: 0x170
function function_83dc6d93(ai_zone) {
    var_a82cd130 = 0;
    var_63cce199 = 0;
    if (isdefined(level.var_5fe6aef) && level.var_5fe6aef) {
        shouldspawn = randomint(100) <= level.var_b4e7b849;
        if (shouldspawn && level.var_392ea96a < level.var_f3aeca10) {
            if (isdefined(level.deathcircle) && isdefined(level.deathcircleindex)) {
                if (level.deathcircleindex < level.var_58d5713c) {
                    var_a82cd130 = 1;
                }
            } else {
                var_a82cd130 = 1;
            }
        }
    }
    /#
        if (isdefined(level.var_5a8c9c14) && level.var_5a8c9c14) {
            var_a82cd130 = 1;
        }
    #/
    ai_zone.var_86f045d5 = 0;
    if (isdefined(var_a82cd130) && var_a82cd130 && isdefined(ai_zone.var_8b02849e)) {
        level.var_392ea96a++;
        ai_zone.var_86f045d5 = 1;
        return ai_zone.var_8b02849e;
    }
    return ai_zone.magicbox_stash;
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 3, eflags: 0x0
// Checksum 0xa5f6400c, Offset: 0x2740
// Size: 0x304
function function_f48ade1d(ai_zone, stash, var_2805c08c) {
    ai_zone.var_18bccc89 = spawn("script_model", stash.origin);
    ai_zone.var_18bccc89.targetname = "zm_stash_locked";
    if (isdefined(level.var_65f7ae17) && level.var_65f7ae17) {
        ai_zone.var_18bccc89 setmodel(level.var_3b378d26);
    } else {
        ai_zone.var_18bccc89 setmodel(level.var_a7f72ea1);
    }
    ai_zone.var_18bccc89.angles = stash.angles;
    ai_zone.var_18bccc89 useanimtree("generic");
    if (isdefined(var_2805c08c) && var_2805c08c) {
        ai_zone.var_18c11294 = spawn("script_model", stash.origin + (0, 0, 10));
        ai_zone.var_18c11294.targetname = "zm_stash_chain";
        ai_zone.var_18c11294 setmodel(level.var_f2bbd457);
        ai_zone.var_18c11294.angles = stash.angles + (0, 90, 0);
        ai_zone.var_18c11294 useanimtree("generic");
        ai_zone.var_374e59f9 = spawn("script_model", stash.origin + (0, 0, 19));
        ai_zone.var_374e59f9.targetname = "zm_stash_bear";
        if (isdefined(level.var_65f7ae17) && level.var_65f7ae17) {
            ai_zone.var_374e59f9 setmodel(level.var_d8ddf407);
        } else {
            ai_zone.var_374e59f9 setmodel(level.var_b6e3500b);
        }
        ai_zone.var_374e59f9.angles = stash.angles + (0, 90, 0);
        ai_zone.var_374e59f9 useanimtree("generic");
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 1, eflags: 0x0
// Checksum 0xca14dbb7, Offset: 0x2a50
// Size: 0xce
function function_630eb346(ai_zone) {
    stash = ai_zone.magicbox_stash;
    /#
        if (isdefined(level.var_c2c5f852) && level.var_c2c5f852) {
            ai_zone.var_78823914 = 1;
        }
    #/
    if (isdefined(ai_zone.var_3d72175) && isdefined(ai_zone.var_78823914) && ai_zone.var_78823914) {
        stash = ai_zone.var_3d72175;
    } else if (isdefined(ai_zone.var_86f045d5) && ai_zone.var_86f045d5) {
        stash = ai_zone.var_8b02849e;
    }
    return stash;
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 1, eflags: 0x0
// Checksum 0x2ad10752, Offset: 0x2b28
// Size: 0x1de
function function_a82cad64(ai_zone) {
    if (!(isdefined(level.var_65d14681) && level.var_65d14681)) {
        return;
    }
    stash = function_630eb346(ai_zone);
    if (isdefined(stash)) {
        ai_zone notify(#"hash_4e2ad3bac36a4e1d");
        ai_zone.var_46a58d6e = 1;
        if (isdefined(ai_zone.var_7f923f43) && ai_zone.var_7f923f43) {
            stash notify(#"hash_4c78fc894646853d");
            return;
        }
        if (isdefined(ai_zone.var_18bccc89)) {
            wait 1;
            if (isdefined(ai_zone.var_18bccc89)) {
                ai_zone.var_18bccc89 clientfield::set("magicboxflag", 1);
            }
        }
        if (isdefined(ai_zone.var_18c11294)) {
            ai_zone.var_18c11294 delete();
            wait 1;
        }
        if (isdefined(ai_zone.var_374e59f9)) {
            ai_zone.var_374e59f9 delete();
        }
        if (isdefined(ai_zone.var_484efd06)) {
            ai_zone.var_484efd06 delete();
        }
        wait 1;
        if (isdefined(ai_zone.var_18bccc89)) {
            ai_zone.var_18bccc89 thread move_box(3.2, 200);
        }
        wait 5;
        ai_zone.var_7f923f43 = 0;
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 1, eflags: 0x0
// Checksum 0x78cdbd6c, Offset: 0x2d10
// Size: 0x1bc
function add_magicbox(ai_zone) {
    if (!(isdefined(level.var_65d14681) && level.var_65d14681)) {
        return;
    }
    stash = function_83dc6d93(ai_zone);
    if (isdefined(stash) && isdefined(ai_zone.var_7f923f43) && ai_zone.var_7f923f43) {
        item_world::function_160294c7(stash);
        ai_zone.var_7f923f43 = 0;
        if (isdefined(ai_zone.var_18bccc89)) {
            ai_zone.var_18bccc89 delete();
        }
        if (isdefined(ai_zone.var_18c11294)) {
            ai_zone.var_18c11294 delete();
        }
        if (isdefined(ai_zone.var_374e59f9)) {
            ai_zone.var_374e59f9 delete();
        }
        if (isdefined(ai_zone.var_484efd06)) {
            ai_zone.var_484efd06 delete();
        }
        waitframe(1);
    }
    if (isdefined(stash) && !(isdefined(ai_zone.var_7f923f43) && ai_zone.var_7f923f43)) {
        ai_zone.var_46a58d6e = 0;
        ai_zone.minimap.origin = stash.origin;
        function_f48ade1d(ai_zone, stash, 1);
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 2, eflags: 0x0
// Checksum 0x8db285ef, Offset: 0x2ed8
// Size: 0x1a4
function move_box(n_duration, n_dist) {
    self endon(#"delete");
    end_point = self.origin + (0, 0, n_dist);
    trace = bullettrace(self.origin, end_point, 0, self);
    if (isdefined(trace[#"position"]) && trace[#"surfacetype"] != #"none") {
        end_point = trace[#"position"] - (0, 0, 50);
        n_duration *= trace[#"fraction"];
    }
    self clientfield::set("magicboxflag", 2);
    if (n_duration < 0.25) {
        n_duration = 0.25;
    }
    self moveto(end_point, n_duration, 0.1, 0.1);
    wait n_duration;
    if (isdefined(self)) {
        self clientfield::set("magicboxflag", 3);
    }
    waitframe(1);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 2, eflags: 0x0
// Checksum 0xea38da86, Offset: 0x3088
// Size: 0x174
function function_9e142fa2(n_duration, n_dist) {
    self endon(#"delete");
    end_point = self.origin + (0, 0, n_dist);
    trace = bullettrace(self.origin, end_point, 0, self);
    if (isdefined(trace[#"position"]) && trace[#"surfacetype"] != #"none") {
        end_point = trace[#"position"] - (0, 0, 50);
        n_duration *= trace[#"fraction"];
    }
    self clientfield::set("magicboxflag", 4);
    if (n_duration < 0.25) {
        n_duration = 0.25;
    }
    self moveto(end_point, n_duration, 0.1, 0.1);
    wait n_duration;
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 2, eflags: 0x0
// Checksum 0x9e98881a, Offset: 0x3208
// Size: 0x196
function function_bbad9099(ai_zone, var_c0d8ceca) {
    stash = function_630eb346(ai_zone);
    stash waittilltimeout(var_c0d8ceca - 7.5, #"hash_4c78fc894646853d");
    ai_zone.minimap clientfield::set("aizoneflag_tu14", 0);
    function_f48ade1d(ai_zone, stash, 0);
    if (isdefined(ai_zone.var_18bccc89)) {
        ai_zone.var_18bccc89 hide();
        ai_zone.var_18bccc89 playsound(#"hash_1530a7e6184b9b2e");
    }
    wait 7.5;
    if (isdefined(stash)) {
        item_world::function_160294c7(stash);
        ai_zone.var_7f923f43 = 0;
    }
    if (isdefined(ai_zone.var_18bccc89)) {
        ai_zone.var_18bccc89 show();
        ai_zone.var_18bccc89 thread move_box(3.2, 200);
    }
    wait 5;
    ai_zone.var_7f923f43 = 0;
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 1, eflags: 0x0
// Checksum 0x93ef8c6a, Offset: 0x33a8
// Size: 0x334
function function_4e0be090(ai_zone) {
    ai_zone endon(#"hash_4e2ad3bac36a4e1d");
    if (!(isdefined(level.var_65d14681) && level.var_65d14681)) {
        return;
    }
    stash = function_630eb346(ai_zone);
    if (isdefined(stash) && !(isdefined(ai_zone.var_7f923f43) && ai_zone.var_7f923f43) && !(isdefined(ai_zone.var_46a58d6e) && ai_zone.var_46a58d6e)) {
        ai_zone.var_46a58d6e = 1;
        ai_zone.var_d2954f43 = level.var_d2954f43;
        if (isdefined(ai_zone.var_18bccc89)) {
            wait 1;
            if (isdefined(ai_zone.var_18bccc89)) {
                ai_zone.var_18bccc89 clientfield::set("magicboxflag", 1);
            }
        }
        if (isdefined(ai_zone.var_18c11294)) {
            ai_zone.var_18c11294 delete();
            wait 1;
        }
        if (isdefined(ai_zone.var_374e59f9)) {
            ai_zone.var_374e59f9 thread function_9e142fa2(3.2, 200);
        }
        if (isdefined(ai_zone.var_484efd06)) {
            ai_zone.var_484efd06 delete();
        }
        item_world::function_8eee98dd(stash);
        setdynentstate(stash, 1);
        if (isdefined(ai_zone.var_3d72175) && ai_zone.var_3d72175 == stash) {
            ai_zone.minimap playsound(#"hash_549138b690b81b8c");
        }
        if (isdefined(ai_zone.var_18bccc89)) {
            ai_zone.var_18bccc89 delete();
        }
        if (isplayer(ai_zone.var_f2fb3bb7)) {
            if (isdefined(level.var_bd3ddb14)) {
                [[ level.var_bd3ddb14 ]](ai_zone.var_f2fb3bb7);
            }
        }
        ai_zone.var_7f923f43 = 1;
        ai_zone.var_7bf9c18e++;
        if (isdefined(ai_zone.var_78823914) && ai_zone.var_78823914) {
            level.var_7b5ba689 = 0;
            ai_zone.minimap clientfield::set("aizoneflag_tu14", 3);
        }
        level thread function_bbad9099(ai_zone, ai_zone.var_d2954f43);
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0xebaa94f1, Offset: 0x36e8
// Size: 0x118
function function_4fa5953() {
    all_ai = getaiteamarray(#"world");
    if (isdefined(all_ai) && all_ai.size > 0) {
        foreach (ai in all_ai) {
            if (isalive(ai) && ai.ai_zone === self) {
                if (isdefined(ai.allowdeath) && ai.allowdeath) {
                    ai kill(undefined, undefined, undefined, undefined, 0, 1);
                }
            }
        }
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0x8b78af32, Offset: 0x3808
// Size: 0x378
function function_bd19c3a8() {
    if (!(isdefined(level.var_e147d7b8) && level.var_e147d7b8)) {
        return;
    }
    var_78f75d63 = level.deathcircles.size - 2;
    var_14ee6c7f = 1;
    if (isdefined(level.var_86c18344) && level.var_86c18344 && isdefined(level.deathcircle) && isdefined(level.deathcircleindex)) {
        if (level.deathcircleindex > var_78f75d63) {
            foreach (ai_zone in level.var_5b357434) {
                if (!ai_zone.is_disabled) {
                    var_7679c33e = ai_zone.minimap.origin;
                    ai_zone.is_active = 0;
                    ai_zone.minimap clientfield::set("aizoneflag_tu14", 0);
                    ai_zone thread function_a82cad64(ai_zone);
                    ai_zone function_4fa5953();
                    ai_zone.is_disabled = 1;
                    ai_zone.lock_zone = 0;
                    ai_zone.death_circle = level.deathcircleindex;
                    wz_ai_utils::function_f656f22e(ai_zone);
                }
            }
            level.var_e147d7b8 = 0;
            level notify(#"hash_329c3f546e49cb9f");
            return;
        }
    }
    if (isdefined(level.var_45e13026) && level.var_45e13026 && isdefined(level.deathcircle) && isdefined(level.deathcircleindex)) {
        if (level.deathcircleindex > var_14ee6c7f) {
            function_1944a471();
        }
    }
    if (!getdvarint(#"survival_prototype", 0)) {
        level.startinghealth += level.deathcircleindex * 100;
        all_ai = getaiteamarray(#"world");
        if (isdefined(all_ai) && all_ai.size > 0) {
            foreach (ai in all_ai) {
                if (isalive(ai)) {
                    ai thread function_7c16d5e3(level.startinghealth);
                }
            }
        }
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 1, eflags: 0x0
// Checksum 0x7204ba5, Offset: 0x3b88
// Size: 0x4e
function function_7c16d5e3(newhealth) {
    if (isdefined(self.var_15fe3985) && self.var_15fe3985) {
        self.maxhealth = newhealth;
        self.health = self.maxhealth;
        self.var_4c4ad20a = 1;
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0xb0e33b7e, Offset: 0x3be0
// Size: 0x24
function function_1944a471() {
    if (isdefined(level.var_8854d951)) {
        [[ level.var_8854d951 ]]();
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0x7763d24c, Offset: 0x3c10
// Size: 0x460
function function_b5a875df() {
    level endon(#"game_ended", #"hash_12a8f2c59a67e4fc", #"hash_329c3f546e49cb9f");
    while (!isdefined(level.deathcircle)) {
        wait 1;
    }
    while (isdefined(level.deathcircle)) {
        radiussq = level.deathcircle.radius * level.deathcircle.radius;
        origin = level.deathcircle.origin;
        foreach (ai_zone in level.var_5b357434) {
            if (!ai_zone.is_disabled && !(isdefined(ai_zone.is_global) && ai_zone.is_global)) {
                var_7679c33e = ai_zone.minimap.origin;
                distsq = distance2dsquared(var_7679c33e, origin);
                if (distsq > radiussq) {
                    ai_zone.is_active = 0;
                    ai_zone.minimap clientfield::set("aizoneflag_tu14", 0);
                    ai_zone thread function_a82cad64(ai_zone);
                    ai_zone function_4fa5953();
                    ai_zone.is_disabled = 1;
                    ai_zone.lock_zone = 0;
                    ai_zone.death_circle = level.deathcircleindex;
                    wz_ai_utils::function_f656f22e(ai_zone);
                    break;
                }
            }
            if (isdefined(ai_zone.is_global) && ai_zone.is_global && isdefined(level.var_cd9b94f3) && level.var_cd9b94f3) {
                foreach (spawn_point in ai_zone.spawn_points) {
                    distsq = distance2dsquared(spawn_point.origin, origin);
                    if (distsq > radiussq) {
                        spawn_point.is_disabled = 1;
                        waitframe(1);
                    }
                }
                all_ai = getaiteamarray(#"world");
                if (isdefined(all_ai) && all_ai.size > 0) {
                    foreach (ai in all_ai) {
                        if (isalive(ai) && isdefined(ai.allowdeath) && ai.allowdeath) {
                            distsq = distance2dsquared(ai.origin, origin);
                            if (distsq > radiussq) {
                                ai kill(undefined, undefined, undefined, undefined, 0, 1);
                                waitframe(1);
                            }
                        }
                    }
                }
            }
        }
        wait 1;
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0x44f50d9d, Offset: 0x4078
// Size: 0x1c
function on_player_spawned() {
    self thread function_2345f7a7();
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0xe7dc57ea, Offset: 0x40a0
// Size: 0x180
function function_2345f7a7() {
    level endon(#"game_ended", #"hash_329c3f546e49cb9f");
    self endon(#"death");
    while (true) {
        self.ai_zone = undefined;
        if (isdefined(level.var_e147d7b8) && level.var_e147d7b8) {
            foreach (ai_zone in level.var_5b357434) {
                if (!ai_zone.is_disabled && isdefined(ai_zone.is_active) && ai_zone.is_active && !(isdefined(ai_zone.is_global) && ai_zone.is_global)) {
                    if (self istouching(ai_zone.def)) {
                        self.ai_zone = ai_zone;
                        break;
                    }
                }
            }
        }
        wait randomfloatrange(1, 2);
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0xf0a21608, Offset: 0x4228
// Size: 0x4c
function function_99198895() {
    zones = function_48b0976c();
    if (zones.size > 0) {
        return zones[randomint(zones.size)];
    }
    return undefined;
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0x9b1f2e9b, Offset: 0x4280
// Size: 0xf8
function function_48b0976c() {
    zones = [];
    if (isdefined(level.var_e147d7b8) && level.var_e147d7b8) {
        foreach (ai_zone in level.var_5b357434) {
            if (!ai_zone.is_disabled) {
                if (!isdefined(zones)) {
                    zones = [];
                } else if (!isarray(zones)) {
                    zones = array(zones);
                }
                zones[zones.size] = ai_zone;
            }
        }
    }
    return zones;
}

/#

    // Namespace wz_ai_zonemgr/wz_ai_zonemgr
    // Params 0, eflags: 0x0
    // Checksum 0x195fdb12, Offset: 0x4380
    // Size: 0x548
    function function_71d1b294() {
        level endon(#"game_ended", #"hash_329c3f546e49cb9f");
        while (true) {
            if (isdefined(level.var_e147d7b8) && level.var_e147d7b8 && isdefined(level.var_e066667d) && level.var_e066667d && isdefined(level.var_5b357434)) {
                foreach (ai_zone in level.var_5b357434) {
                    drawpos = ai_zone.minimap.origin;
                    zonecolor = (1, 0, 0);
                    if (!ai_zone.is_disabled && isdefined(level.var_e147d7b8) && level.var_e147d7b8) {
                        zonecolor = (1, 1, 0);
                        if (ai_zone.is_occupied) {
                            zonecolor = (0, 1, 0);
                        }
                        foreach (spawn_point in ai_zone.spawn_points) {
                            circle(spawn_point.origin + (0, 0, 1), 15, (1, 0, 0), 0, 1);
                            nodeforward = anglestoforward(spawn_point.angles);
                            nodeforward = vectornormalize(nodeforward);
                            endpt = spawn_point.origin + nodeforward * 20;
                            line(spawn_point.origin, endpt, (1, 0, 0), 0);
                        }
                        if (isdefined(ai_zone.hide_points)) {
                            foreach (hide_point in ai_zone.hide_points) {
                                circle(hide_point.origin + (0, 0, 1), 10, (0, 0, 1), 0, 1);
                            }
                        }
                        if (ai_zone.is_active) {
                            print3d(drawpos + (0, 0, 25), "<dev string:x68a>" + ai_zone.var_7aa3cde7 + "<dev string:x693>" + ai_zone.var_aeae9f59, zonecolor);
                            print3d(drawpos + (0, 0, 10), "<dev string:x697>" + ai_zone.var_84b8298c + "<dev string:x693>" + ai_zone.var_10f73408, zonecolor);
                        }
                    }
                    print3d(drawpos + (0, 0, 40), "<dev string:x6a0>" + ai_zone.zone_name, zonecolor);
                    for (i = 0; i < ai_zone.zone_category.size; i++) {
                        print3d(drawpos + (0, 0, 55 + 15 * i), "<dev string:x6a6>" + ai_zone.zone_category[i], zonecolor);
                    }
                    circle(drawpos, 40, zonecolor, 0, 1);
                }
                var_f71adb48 = struct::get_array("<dev string:x6b2>", "<dev string:x6bf>");
                for (i = 0; i < var_f71adb48.size; i++) {
                    circle(var_f71adb48[i].origin + (0, 0, 1), 5, (1, 0.5, 0), 0, 1);
                }
            }
            waitframe(1);
        }
    }

#/

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 1, eflags: 0x0
// Checksum 0x47ff9a7c, Offset: 0x48d0
// Size: 0x9c
function function_bbff22d(zone_name) {
    if (isdefined(level.ai_zones)) {
        foreach (var_a6ca601f in level.ai_zones) {
            if (var_a6ca601f.zone_name === zone_name) {
                return var_a6ca601f;
            }
        }
    }
    return undefined;
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 2, eflags: 0x0
// Checksum 0x4026b93d, Offset: 0x4978
// Size: 0xaa
function function_aacb2027(zone_name, spawner_type) {
    foreach (var_a59ba023 in level.var_5b357434) {
        if (var_a59ba023.zone_name === zone_name && var_a59ba023.var_cafac64a === spawner_type) {
            return var_a59ba023;
        }
    }
    return undefined;
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 3, eflags: 0x0
// Checksum 0xea2b5ab1, Offset: 0x4a30
// Size: 0x56
function function_d6258153(zone_name, spawner_type, num) {
    var_a59ba023 = function_aacb2027(zone_name, spawner_type);
    if (isdefined(var_a59ba023)) {
        var_a59ba023.var_2b466bb0 = num;
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 3, eflags: 0x0
// Checksum 0x26650b4d, Offset: 0x4a90
// Size: 0x6e
function function_6c75dee3(zone_name, spawner_type, time_in_sec) {
    var_a59ba023 = function_aacb2027(zone_name, spawner_type);
    if (isdefined(var_a59ba023)) {
        var_a59ba023.var_2209cb79 = int(time_in_sec * 1000);
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 3, eflags: 0x0
// Checksum 0x8037d173, Offset: 0x4b08
// Size: 0x56
function function_8e672218(zone_name, spawner_type, is_global) {
    var_a59ba023 = function_aacb2027(zone_name, spawner_type);
    if (isdefined(var_a59ba023)) {
        var_a59ba023.is_global = is_global;
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 3, eflags: 0x0
// Checksum 0x756bacff, Offset: 0x4b68
// Size: 0xfe
function function_a2ac506b(zone_name, spawner_type, var_800d413a) {
    if (!isdefined(var_800d413a)) {
        return;
    }
    if (!level.var_cca518d && var_800d413a == #"spawner_boct_zombie_wz") {
        return;
    }
    if (!level.var_cca518d && var_800d413a == #"hash_618248fca82d83a6") {
        return;
    }
    if (!level.warzoneblightfatherenabled && var_800d413a == #"spawner_wz_blight_father") {
        return;
    }
    if (!level.warzonehellhoundenabled && var_800d413a == #"spawner_boct_zombie_dog_wz") {
        return;
    }
    var_a59ba023 = function_aacb2027(zone_name, spawner_type);
    if (isdefined(var_a59ba023)) {
        var_a59ba023.var_fbb29fb7 = var_800d413a;
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 3, eflags: 0x0
// Checksum 0x864d105, Offset: 0x4c70
// Size: 0xa6
function function_321414a(zone_name, spawner_type, var_b6580457) {
    var_a59ba023 = function_aacb2027(zone_name, spawner_type);
    var_a6ca601f = function_bbff22d(var_b6580457);
    if (isdefined(var_a59ba023) && isdefined(var_a6ca601f)) {
        var_a59ba023.spawn_points = arraycombine(var_a59ba023.spawn_points, var_a6ca601f.spawn_points, 0, 0);
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 3, eflags: 0x0
// Checksum 0x6a34499a, Offset: 0x4d20
// Size: 0x56
function function_2826217a(zone_name, spawner_type, var_80bea5a6) {
    var_a59ba023 = function_aacb2027(zone_name, spawner_type);
    if (isdefined(var_a59ba023)) {
        var_a59ba023.var_80bea5a6 = var_80bea5a6;
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 3, eflags: 0x0
// Checksum 0x1f13141e, Offset: 0x4d80
// Size: 0x56
function function_3a69e98c(zone_name, spawner_type, var_5451ef2f) {
    var_a59ba023 = function_aacb2027(zone_name, spawner_type);
    if (isdefined(var_a59ba023)) {
        var_a59ba023.var_10f73408 = var_5451ef2f;
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 3, eflags: 0x0
// Checksum 0xfb90a3b1, Offset: 0x4de0
// Size: 0x56
function function_c3bb62c1(zone_name, spawner_type, var_53644a82) {
    var_a59ba023 = function_aacb2027(zone_name, spawner_type);
    if (isdefined(var_a59ba023)) {
        var_a59ba023.var_53644a82 = var_53644a82;
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 5, eflags: 0x0
// Checksum 0x8d68df47, Offset: 0x4e40
// Size: 0x152
function function_462b41e2(zone_name, spawner_type, var_fdb90fbe, var_b0c2952a, var_cb6cdf08) {
    var_a59ba023 = function_aacb2027(zone_name, spawner_type);
    if (isdefined(var_a59ba023)) {
        var_a59ba023.magicbox_stash = getdynent(var_fdb90fbe);
        if (isdefined(var_b0c2952a)) {
            var_a59ba023.var_8b02849e = getdynent(var_b0c2952a);
        }
        if (isdefined(var_cb6cdf08)) {
            var_a59ba023.var_3d72175 = getdynent(var_cb6cdf08);
        }
        return;
    }
    level.var_339a0198[level.var_339a0198.size] = getdynent(var_fdb90fbe);
    if (isdefined(var_b0c2952a)) {
        level.var_339a0198[level.var_339a0198.size] = getdynent(var_b0c2952a);
    }
    if (isdefined(var_cb6cdf08)) {
        level.var_339a0198[level.var_339a0198.size] = getdynent(var_cb6cdf08);
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 6, eflags: 0x0
// Checksum 0x339b600, Offset: 0x4fa0
// Size: 0x608
function function_5f0d105a(zone_category, zone_name, spawner_type, var_aeae9f59, var_f1fbce84, var_c3bb4e09) {
    if (!isdefined(spawner_type)) {
        return;
    }
    if (!level.var_cca518d && spawner_type == #"spawner_boct_zombie_wz") {
        return;
    }
    if (!level.var_cca518d && spawner_type == #"hash_618248fca82d83a6") {
        return;
    }
    if (!level.warzoneblightfatherenabled && spawner_type == #"spawner_wz_blight_father") {
        return;
    }
    if (!level.warzonehellhoundenabled && spawner_type == #"spawner_boct_zombie_dog_wz") {
        return;
    }
    if (isdefined(level.var_6df0d3b6) && ![[ level.var_6df0d3b6 ]](zone_name)) {
        return;
    }
    var_a59ba023 = function_aacb2027(zone_name, spawner_type);
    if (isdefined(var_a59ba023)) {
        var_a59ba023.zone_category[var_a59ba023.zone_category.size] = zone_category;
        return var_a59ba023;
    }
    var_a6ca601f = function_bbff22d(zone_name);
    if (!isdefined(var_a6ca601f)) {
        return undefined;
    }
    var_a59ba023 = spawnstruct();
    var_a59ba023.def = var_a6ca601f;
    var_a59ba023.zone_name = var_a6ca601f.zone_name;
    var_a59ba023.minimap = var_a6ca601f.minimap;
    var_a59ba023.spawn_points = var_a6ca601f.spawn_points;
    var_a59ba023.origin = var_a6ca601f.root_node.origin;
    var_a59ba023.var_84b8298c = 0;
    var_a59ba023.is_occupied = 0;
    var_a59ba023.is_disabled = 0;
    var_a59ba023.is_active = 0;
    var_a59ba023.zone_category = [];
    var_a59ba023.zone_category[0] = zone_category;
    var_a59ba023.var_aeae9f59 = var_aeae9f59;
    var_a59ba023.var_10f73408 = var_f1fbce84;
    var_a59ba023.var_c3bb4e09 = var_c3bb4e09;
    var_a59ba023.var_cafac64a = spawner_type;
    var_a59ba023.var_1cbdb7bb = 0;
    var_a59ba023.var_811ec76d = &function_4b95d880;
    var_a59ba023.var_13305ec9 = &function_c7cab34e;
    var_a59ba023.var_96d81013 = 0;
    var_a59ba023.last_spawn_time = 0;
    var_a59ba023.spawn_delay = int(6 * 1000);
    var_a59ba023.var_7aa3cde7 = 0;
    var_a59ba023.var_2b466bb0 = undefined;
    var_a59ba023.var_2209cb79 = undefined;
    var_a59ba023.is_global = 0;
    var_a59ba023.var_80bea5a6 = 1;
    var_a59ba023.var_53644a82 = 1;
    var_a59ba023.death_circle = 0;
    var_a59ba023.var_7bf9c18e = 0;
    var_a59ba023.zone_activated = 0;
    var_a59ba023.zone_blightfather = 0;
    var_a59ba023.zone_brutus = 0;
    var_a59ba023.zone_hellhounds = 0;
    var_a59ba023.var_7c620997 = 0;
    var_a59ba023.var_58ba2ab7 = 0;
    var_a59ba023.var_14403c0a = 0;
    var_a59ba023.var_af37e04a = 0;
    var_a59ba023.var_41e86d33 = 0;
    var_a59ba023.var_719d00b8 = 0;
    var_a59ba023.var_336d2f53 = [];
    var_a59ba023.var_80e3def5 = 0;
    var_a59ba023.var_6192eb0 = 0;
    if (isdefined(level.var_c64b3b46) && level.var_c64b3b46) {
        if (!isdefined(var_a59ba023.item_drops)) {
            var_a59ba023.item_drops = [];
        }
    }
    level.var_5b357434[level.var_5b357434.size] = var_a59ba023;
    /#
        path = "<dev string:x6d3>" + var_a59ba023.zone_name + "<dev string:x6f3>" + function_9e72a96(var_a59ba023.var_cafac64a) + "<dev string:x6f7>" + "<dev string:x703>";
        command = "<dev string:x707>" + var_a59ba023.zone_name + "<dev string:x5ef>" + function_9e72a96(var_a59ba023.var_cafac64a) + "<dev string:x703>";
        adddebugcommand(path + "<dev string:x72a>" + command + "<dev string:x72e>");
        path = "<dev string:x6d3>" + var_a59ba023.zone_name + "<dev string:x6f3>" + function_9e72a96(var_a59ba023.var_cafac64a) + "<dev string:x733>" + "<dev string:x703>";
        command = "<dev string:x741>" + var_a59ba023.zone_name + "<dev string:x5ef>" + function_9e72a96(var_a59ba023.var_cafac64a) + "<dev string:x703>";
        adddebugcommand(path + "<dev string:x72a>" + command + "<dev string:x72e>");
    #/
    return var_a59ba023;
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 6, eflags: 0x0
// Checksum 0xb7551f50, Offset: 0x55b0
// Size: 0x7e
function function_adf8c26d(zone_category, zone_name, spawner_type, var_aeae9f59, var_f1fbce84, var_c3bb4e09) {
    var_a59ba023 = function_5f0d105a(zone_category, zone_name, spawner_type, var_aeae9f59, var_f1fbce84, var_c3bb4e09);
    if (isdefined(var_a59ba023)) {
        var_a59ba023.var_1cbdb7bb = 1;
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 2, eflags: 0x0
// Checksum 0xcc3c0c46, Offset: 0x5638
// Size: 0xd4
function function_769a0b3f(ai_zone, zombie) {
    if (!(isdefined(getgametypesetting(#"wzzombiesbreakdoors")) ? getgametypesetting(#"wzzombiesbreakdoors") : 0)) {
        return;
    }
    if (!(isdefined(zombie.var_66c33b3) && zombie.var_66c33b3)) {
        ai_zone.var_80e3def5++;
        zombie.var_66c33b3 = 1;
        if (ai_zone.var_80e3def5 == 1) {
            level thread function_432787e(ai_zone, 1);
        }
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 2, eflags: 0x0
// Checksum 0x6f90002f, Offset: 0x5718
// Size: 0xcc
function function_37411c68(ai_zone, zombie) {
    if (!(isdefined(getgametypesetting(#"wzzombiesbreakdoors")) ? getgametypesetting(#"wzzombiesbreakdoors") : 0)) {
        return;
    }
    if (isdefined(zombie.var_66c33b3) && zombie.var_66c33b3) {
        ai_zone.var_80e3def5--;
        zombie.var_66c33b3 = undefined;
        if (ai_zone.var_80e3def5 == 0) {
            level thread function_432787e(ai_zone, 0);
        }
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 2, eflags: 0x0
// Checksum 0x77082ebc, Offset: 0x57f0
// Size: 0x220
function function_432787e(ai_zone, enable = 1) {
    if (!isdefined(ai_zone) || !isdefined(ai_zone.var_336d2f53)) {
        return;
    }
    self notify("325c941ad3f2d52d");
    self endon("325c941ad3f2d52d");
    ai_zone.var_6411ebfb = enable;
    var_c2c6240a = 0;
    foreach (var_dfd3d5d9 in ai_zone.var_336d2f53) {
        if (isdefined(var_dfd3d5d9.owner) && isalive(var_dfd3d5d9.owner)) {
            continue;
        }
        var_fae4f67c = 0;
        dynentarray = function_c79d31c4(var_dfd3d5d9.targetname);
        if (isdefined(dynentarray)) {
            foreach (dynent in dynentarray) {
                var_fae4f67c |= dynent.health > 0;
            }
        }
        if (var_fae4f67c) {
            if (enable) {
                linktraversal(var_dfd3d5d9);
            } else {
                unlinktraversal(var_dfd3d5d9);
            }
        }
        var_c2c6240a++;
        if (var_c2c6240a >= 5) {
            waitframe(1);
            var_c2c6240a = 0;
        }
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0xd01d0fab, Offset: 0x5a18
// Size: 0x5c0
function function_7b0c014e() {
    level endon(#"game_ended", #"hash_329c3f546e49cb9f");
    level.ai_zones = getentarray("wz_ai_zone", "targetname");
    foreach (ai_zone in level.ai_zones) {
        ai_zone.spawn_points = struct::get_array(ai_zone.target, "targetname");
        ai_zone.root_node = getnode(ai_zone.target, "targetname");
        if (isdefined(ai_zone.root_node) && isdefined(ai_zone.root_node.script_noteworthy)) {
            ai_zone.zone_name = ai_zone.root_node.script_noteworthy;
        } else {
            ai_zone.zone_name = "unnamed";
        }
        var_e2ee98e6 = struct::get(ai_zone.root_node.target, "targetname");
        if (isdefined(var_e2ee98e6)) {
            ai_zone.minimap = spawn("script_model", var_e2ee98e6.origin);
            ai_zone.minimap.targetname = "zm_minimap";
        } else {
            ai_zone.minimap = spawn("script_model", ai_zone.root_node.origin);
            ai_zone.minimap.targetname = "zm_minimap";
        }
        ai_zone.minimap setmodel("tag_origin");
    }
    /#
        level thread function_71d1b294();
        level thread wz_ai_utils::debug_ai();
        level thread function_5a46c509(level.ai_zones);
    #/
    while (true) {
        if (isdefined(level.var_8110be92) && level.var_8110be92 && isdefined(level.var_e147d7b8) && level.var_e147d7b8 && isdefined(level.var_5b357434)) {
            foreach (ai_zone in level.var_5b357434) {
                if (!ai_zone.is_disabled) {
                    ai_zone.is_occupied = 0;
                    if (isdefined(ai_zone.is_global) && ai_zone.is_global) {
                        ai_zone.is_occupied = 1;
                    } else if (isdefined(ai_zone.is_active) && ai_zone.is_active) {
                        players = getplayers();
                        for (i = 0; i < players.size; i++) {
                            if (isdefined(players[i].ai_zone) && players[i].ai_zone == ai_zone) {
                                ai_zone.is_occupied = 1;
                                break;
                            }
                        }
                    }
                    if (!(isdefined(ai_zone.is_occupied) && ai_zone.is_occupied)) {
                        ai_zone [[ ai_zone.var_13305ec9 ]]();
                        continue;
                    }
                    ai_zone [[ ai_zone.var_811ec76d ]]();
                }
            }
        } else {
            all_ai = getaiteamarray(#"world");
            if (isdefined(all_ai) && all_ai.size > 0) {
                foreach (ai in all_ai) {
                    ai kill(undefined, undefined, undefined, undefined, 0, 1);
                    waitframe(1);
                }
            }
        }
        wait randomfloatrange(2, 3);
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0x75dce888, Offset: 0x5fe0
// Size: 0x10c
function function_89116a1e() {
    spawnpt = self.spawn_points[self.var_96d81013];
    self.var_96d81013++;
    if (self.var_96d81013 >= self.spawn_points.size) {
        self.var_96d81013 = 0;
    }
    if (isdefined(self.is_global) && self.is_global) {
        maxcount = self.spawn_points.size;
        for (checkcount = 0; isdefined(spawnpt.is_disabled) && spawnpt.is_disabled && checkcount < maxcount; checkcount++) {
            spawnpt = self.spawn_points[self.var_96d81013];
            self.var_96d81013++;
            if (self.var_96d81013 >= self.spawn_points.size) {
                self.var_96d81013 = 0;
            }
        }
    }
    return spawnpt;
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0x7d98c7af, Offset: 0x60f8
// Size: 0x47a
function function_4b95d880() {
    if (self.var_7aa3cde7 < self.var_aeae9f59 && self.var_84b8298c < self.var_10f73408) {
        if (gettime() > self.last_spawn_time + self.spawn_delay) {
            s_loc = self function_89116a1e();
            if (!isdefined(s_loc.angles)) {
                s_loc.angles = (0, 0, 0);
            }
            if (isdefined(self.var_1cbdb7bb) && self.var_1cbdb7bb) {
                spawned = spawnvehicle(self.var_cafac64a, s_loc.origin, s_loc.angles, "wz_vehicle_ai");
            } else if (isdefined(self.var_fbb29fb7)) {
                var_39480d4 = randomint(100) <= level.var_76fc612e;
                if (var_39480d4) {
                    spawned = spawnactor(self.var_fbb29fb7, s_loc.origin, s_loc.angles, "wz_ai_extra");
                } else {
                    spawned = spawnactor(self.var_cafac64a, s_loc.origin, s_loc.angles, "wz_ai");
                }
            } else {
                spawned = spawnactor(self.var_cafac64a, s_loc.origin, s_loc.angles, "wz_ai");
            }
            if (isdefined(spawned)) {
                is_special = 0;
                if (isdefined(self.var_78823914) && self.var_78823914) {
                    if (self.var_ab00ccc2 == self.var_b66547bd) {
                        is_special = 1;
                    }
                    self.var_ab00ccc2++;
                }
                spawned thread wz_ai_utils::function_7adc1e46(self, is_special);
                spawned thread wz_ai_utils::function_f311bd4c(self);
                self.var_84b8298c++;
                self.var_7aa3cde7++;
                if (self.var_cafac64a == #"spawner_boct_zombie_wz" || self.var_cafac64a == #"hash_618248fca82d83a6") {
                    self.var_7c620997++;
                    if (!isdefined(self.var_6192eb0)) {
                        self.var_6192eb0 = 0;
                    }
                    if (isdefined(level.var_754d756) && level.var_754d756 && randomfloat(1) <= 0.3 && self.var_6192eb0 < 6) {
                        self.var_6192eb0++;
                        spawned.quacknarok = 1;
                        spawned attach(#"p8_zm_red_floatie_duck", "j_spinelower", 1);
                    }
                } else {
                    self.var_af37e04a++;
                }
                if (isdefined(level.var_c4c0fb68) && level.var_c4c0fb68) {
                    if (isdefined(spawned.hatmodel)) {
                        spawned detach(spawned.hatmodel, "");
                    }
                    if (isdefined(spawned.is_special) && spawned.is_special) {
                        spawned.hatmodel = level.var_591aff35;
                        spawned attach(spawned.hatmodel);
                    } else {
                        spawned.hatmodel = level.var_96bd78dd;
                        spawned attach(spawned.hatmodel);
                    }
                }
            }
        }
        return;
    }
    self.last_spawn_time = gettime();
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0xed7482de, Offset: 0x6580
// Size: 0x11c
function function_c7cab34e() {
    if (false) {
        if (self.var_84b8298c > 0) {
            all_ai = getaiteamarray(#"world");
            if (isdefined(all_ai) && all_ai.size > 0) {
                foreach (ai in all_ai) {
                    if (isalive(ai) && ai.ai_zone === self) {
                        if (!self.is_occupied) {
                            ai kill(undefined, undefined, undefined, undefined, 0, 1);
                            break;
                        }
                    }
                }
            }
        }
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 2, eflags: 0x0
// Checksum 0x65eaeea2, Offset: 0x66a8
// Size: 0x132
function function_d9a69cf2(origin, forward) {
    nearby_zombies = getentitiesinradius(origin, 50, 15);
    foreach (ent in nearby_zombies) {
        if (!isdefined(forward) || vectordot(origin - ent.origin, forward) < 0) {
            var_43b3242 = 0;
            if (isdefined(ent.var_834b0770)) {
                var_43b3242 = 1;
            }
            ent zombie_utility::setup_zombie_knockdown(origin, var_43b3242);
            ent.knockdown_type = "knockdown_shoved";
        }
    }
}

// Namespace wz_ai_zonemgr/event_9673dc9a
// Params 1, eflags: 0x40
// Checksum 0x27df4731, Offset: 0x67e8
// Size: 0x364
function event_handler[event_9673dc9a] function_3981d015(eventstruct) {
    if (isdefined(eventstruct.ent.target) && eventstruct.ent.target != "") {
        traversal_start_node = getnode(eventstruct.ent.target, "targetname");
        if (isdefined(traversal_start_node)) {
            other_node = getothernodeinnegotiationpair(traversal_start_node);
            if (eventstruct.state == 0) {
                if (isdefined(getgametypesetting(#"wzzombiesbreakdoors")) ? getgametypesetting(#"wzzombiesbreakdoors") : 0) {
                    function_dc0a8e61(traversal_start_node, 0);
                    if (isdefined(other_node)) {
                        function_dc0a8e61(other_node, 0);
                    }
                    if (isdefined(traversal_start_node.ai_zone)) {
                        if (isdefined(traversal_start_node.ai_zone.var_6411ebfb) && traversal_start_node.ai_zone.var_6411ebfb) {
                            linktraversal(traversal_start_node);
                        } else {
                            unlinktraversal(traversal_start_node);
                        }
                    } else if (isdefined(eventstruct.ent.var_a6131e58) && eventstruct.ent.var_a6131e58) {
                        unlinktraversal(traversal_start_node);
                    }
                } else {
                    unlinktraversal(traversal_start_node);
                }
                return;
            }
            if (isdefined(getgametypesetting(#"wzzombiesbreakdoors")) ? getgametypesetting(#"wzzombiesbreakdoors") : 0) {
                if (eventstruct.ent.health > 0) {
                    forward = anglestoforward(eventstruct.ent.angles);
                    if (eventstruct.state == 2) {
                        forward *= -1;
                    }
                    function_d9a69cf2(eventstruct.ent.origin, forward);
                }
                function_dc0a8e61(traversal_start_node, 1);
                if (isdefined(other_node)) {
                    function_dc0a8e61(other_node, 1);
                }
                linktraversal(traversal_start_node);
                return;
            }
            linktraversal(traversal_start_node);
        }
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 2, eflags: 0x0
// Checksum 0x7d85867a, Offset: 0x6b58
// Size: 0x64
function function_250e9641(ai_zone, category) {
    for (i = 0; i < ai_zone.zone_category.size; i++) {
        if (ai_zone.zone_category[i] == category) {
            return true;
        }
    }
    return false;
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 2, eflags: 0x0
// Checksum 0x58146c67, Offset: 0x6bc8
// Size: 0x214
function function_678fdc65(category, last_zone) {
    level endon(#"game_ended", #"hash_12a8f2c59a67e4fc", #"hash_329c3f546e49cb9f");
    possible_zones = [];
    foreach (ai_zone in level.var_5b357434) {
        if (!ai_zone.is_disabled && !ai_zone.is_active) {
            islocked = 0;
            foreach (var_2adb7b8c in level.var_5b357434) {
                if (var_2adb7b8c.zone_name == ai_zone.zone_name && isdefined(var_2adb7b8c.lock_zone) && var_2adb7b8c.lock_zone) {
                    islocked = 1;
                }
            }
            if (!islocked && function_250e9641(ai_zone, category)) {
                if (!isdefined(last_zone) || ai_zone != last_zone) {
                    possible_zones[possible_zones.size] = ai_zone;
                }
            }
        }
    }
    if (possible_zones.size > 0) {
        return possible_zones[randomint(possible_zones.size)];
    }
    return undefined;
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0xa2b29c11, Offset: 0x6de8
// Size: 0x2fc
function function_1992880a() {
    if (isdefined(level.var_7b5ba689) && level.var_7b5ba689) {
        if (isdefined(self.var_80bea5a6)) {
            all_ai = getaiteamarray(#"world");
            if (isdefined(all_ai) && all_ai.size > 0) {
                foreach (ai in all_ai) {
                    if (isalive(ai) && ai.ai_zone === self) {
                        if (isdefined(ai.is_special) && ai.is_special) {
                            ai thread wz_ai_zombie::zombie_eye_glow(self.var_80bea5a6);
                        }
                    }
                }
            }
        }
    }
    if (isdefined(level.var_c4c0fb68) && level.var_c4c0fb68) {
        all_ai = getaiteamarray(#"world");
        if (isdefined(all_ai) && all_ai.size > 0) {
            foreach (ai in all_ai) {
                if (isalive(ai) && ai.ai_zone === self) {
                    if (isdefined(ai.is_special) && ai.is_special) {
                        if (isdefined(ai.hatmodel)) {
                            ai detach(ai.hatmodel, "");
                        }
                        ai.hatmodel = level.var_96bd78dd;
                        ai attach(ai.hatmodel);
                    }
                }
            }
        }
    }
    if (isdefined(self.var_484efd06)) {
        self.var_484efd06 delete();
    }
    self.minimap clientfield::set("aizoneflag_tu14", self.var_53644a82);
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 1, eflags: 0x0
// Checksum 0x8f1f1187, Offset: 0x70f0
// Size: 0x354
function function_3effc794(var_9e12dd2e) {
    if (isdefined(level.var_7b5ba689) && level.var_7b5ba689) {
        if (self.is_active && self.var_7aa3cde7 < self.var_aeae9f59) {
            self.var_b66547bd = self.var_7aa3cde7;
        } else {
            all_ai = getaiteamarray(#"world");
            if (isdefined(all_ai) && all_ai.size > 0) {
                foreach (ai in all_ai) {
                    if (isalive(ai) && ai != var_9e12dd2e && ai.ai_zone === self) {
                        ai thread wz_ai_zombie::delayed_zombie_eye_glow(3);
                        ai.is_special = 1;
                        self.special_ai = ai;
                        ai thread wz_ai_utils::function_92c7e9a9(self);
                        break;
                    }
                }
            }
        }
    }
    if (isdefined(level.var_c4c0fb68) && level.var_c4c0fb68) {
        if (self.is_active && self.var_7aa3cde7 < self.var_aeae9f59) {
            self.var_b66547bd = self.var_7aa3cde7;
            return;
        }
        all_ai = getaiteamarray(#"world");
        if (isdefined(all_ai) && all_ai.size > 0) {
            foreach (ai in all_ai) {
                if (isalive(ai) && ai != var_9e12dd2e && ai.ai_zone === self) {
                    if (isdefined(ai.hatmodel)) {
                        ai detach(ai.hatmodel, "");
                    }
                    ai.hatmodel = level.var_591aff35;
                    ai attach(ai.hatmodel);
                    ai.is_special = 1;
                    self.special_ai = ai;
                    ai thread wz_ai_utils::function_92c7e9a9(self);
                    break;
                }
            }
        }
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 2, eflags: 0x0
// Checksum 0x145dc5fc, Offset: 0x7450
// Size: 0x6f2
function function_41101f23(zone, var_d42412dc) {
    if (!isdefined(zone)) {
        return;
    }
    /#
        if (getdvarint(#"zone_override", 0) > 0) {
            zone.var_c3bb4e09 = getdvarint(#"zone_prespawn", 2);
            zone.var_aeae9f59 = getdvarint(#"zone_maxcount", 10);
            zone.var_10f73408 = getdvarint(#"zone_alivecount", 5);
            zone.spawn_delay = getdvarint(#"zone_spawndelay", 5);
        }
    #/
    if (!(isdefined(var_d42412dc) && var_d42412dc) && isdefined(zone.var_8f95a80f) && isdefined(level.var_65d14681) && level.var_65d14681) {
        while (gettime() < zone.var_8f95a80f + level.var_5f531c0f) {
            waitframe(1);
        }
    }
    while (isdefined(zone.var_7f923f43) && zone.var_7f923f43) {
        waitframe(1);
    }
    if (isdefined(zone.death_circle) && zone.death_circle > 0) {
        return;
    }
    zone.is_active = 1;
    add_magicbox(zone);
    waitframe(1);
    var_1c9891ec = level.var_7b5ba689;
    if (zone.var_cafac64a != #"spawner_boct_zombie_wz" && zone.var_cafac64a != #"hash_618248fca82d83a6") {
        var_1c9891ec = 0;
    }
    if (!isdefined(zone.var_3d72175)) {
        var_1c9891ec = 0;
    }
    if (isdefined(var_1c9891ec) && var_1c9891ec) {
        foreach (ai_zone in level.var_5b357434) {
            if (isdefined(ai_zone.var_78823914) && ai_zone.var_78823914) {
                var_1c9891ec = 0;
                break;
            }
        }
    }
    zone.var_78823914 = var_1c9891ec;
    if (var_1c9891ec) {
        zone.minimap clientfield::set("aizoneflag_tu14", 3);
        if (isdefined(level.var_7b5ba689) && level.var_7b5ba689) {
            zone.var_484efd06 = spawn("script_model", zone.minimap.origin + (0, 0, 50));
            zone.var_484efd06.targetname = "zm_stash_wisp";
            zone.var_484efd06 setmodel("tag_origin");
            zone.var_484efd06 useanimtree("generic");
            zone.var_484efd06 clientfield::set("soultransfer", 1);
        }
    } else {
        zone.minimap clientfield::set("aizoneflag_tu14", zone.var_53644a82);
    }
    if (zone.var_cafac64a == #"spawner_wz_blight_father") {
        zone.zone_blightfather++;
    }
    if (zone.var_cafac64a == #"spawner_boct_brutus_wz") {
        zone.zone_brutus++;
    }
    if (zone.var_cafac64a == #"spawner_boct_zombie_dog_wz") {
        zone.zone_hellhounds++;
    }
    zone.var_7aa3cde7 = 0;
    zone.var_aeae9f59 = int(zone.var_aeae9f59);
    zone.var_10f73408 = int(zone.var_10f73408);
    zone.var_ce8df1c9 = randomintrange(0, zone.var_aeae9f59);
    zone.var_c573acdd = 0;
    zone.var_6192eb0 = 0;
    zone.var_b66547bd = randomintrange(0, zone.var_10f73408);
    zone.var_ab00ccc2 = 0;
    zone.zone_activated++;
    while (zone.var_7aa3cde7 < zone.var_c3bb4e09) {
        zone [[ zone.var_811ec76d ]]();
        waitframe(1);
    }
    while (zone.is_active && zone.var_7aa3cde7 < zone.var_aeae9f59) {
        waitframe(1);
    }
    while (zone.var_84b8298c > 0) {
        waitframe(1);
    }
    zone.is_active = 0;
    zone.minimap clientfield::set("aizoneflag_tu14", 0);
    if (!zone.is_disabled) {
        function_4e0be090(zone);
    }
    if (isdefined(zone.var_2b466bb0)) {
        zone.var_2b466bb0--;
        if (zone.var_2b466bb0 <= 0) {
            zone.is_disabled = 1;
        }
    }
    zone.lock_zone = 0;
    zone.var_8f95a80f = gettime();
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 1, eflags: 0x0
// Checksum 0x9a748f8d, Offset: 0x7b50
// Size: 0xf6
function function_1c8ea11(category) {
    level endon(#"game_ended", #"hash_12a8f2c59a67e4fc", #"hash_329c3f546e49cb9f", #"hash_4168bee802274065");
    last_zone = undefined;
    while (isdefined(level.var_e147d7b8) && level.var_e147d7b8) {
        zone = function_678fdc65(category, last_zone);
        if (!isdefined(zone)) {
            break;
        }
        zone.lock_zone = 1;
        last_zone = zone;
        wait 2;
        function_41101f23(zone, 0);
        waitframe(1);
    }
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0xb755a9bf, Offset: 0x7c50
// Size: 0x1b4
function function_51961049() {
    if (!(isdefined(level.var_65d14681) && level.var_65d14681)) {
        return;
    }
    foreach (ai_zone in level.var_5b357434) {
        if (isdefined(ai_zone.magicbox_stash)) {
            item_world::function_160294c7(ai_zone.magicbox_stash);
        }
        if (isdefined(ai_zone.var_8b02849e)) {
            item_world::function_160294c7(ai_zone.var_8b02849e);
        }
        if (isdefined(ai_zone.var_3d72175)) {
            item_world::function_160294c7(ai_zone.var_3d72175);
        }
        ai_zone.var_7f923f43 = 0;
    }
    foreach (var_7196c82b in level.var_339a0198) {
        if (isdefined(var_7196c82b)) {
            item_world::function_160294c7(var_7196c82b);
        }
    }
    level flagsys::set(#"hash_2299e4b3b840b63f");
}

// Namespace wz_ai_zonemgr/wz_ai_zonemgr
// Params 0, eflags: 0x0
// Checksum 0x16040584, Offset: 0x7e10
// Size: 0x234
function function_f3e8cf82() {
    level waittill(#"hash_7f7eec328c07606d");
    level.var_65d14681 = 1;
    level flagsys::clear(#"hash_2299e4b3b840b63f");
    level wz_ai_utils::function_b7dc3ab4();
    /#
        level thread function_49d2e080();
        if (getdvarint(#"wz_ai_on", 0) > 1) {
            level.var_65d14681 = 0;
        }
    #/
    if (isdedicated()) {
        level.var_65d14681 = !getdvar(#"hash_1a301f2f6d1873d5", 0);
    }
    if (isdefined(level.var_65d14681) && level.var_65d14681) {
        level flagsys::wait_till(#"insertion_teleport_completed");
    }
    level.var_5b357434 = array::randomize(level.var_5b357434);
    level thread function_51961049();
    if (isdefined(level.var_65d14681) && level.var_65d14681) {
        level flagsys::wait_till_all(array(#"hash_60fcdd11812a0134", #"hash_2299e4b3b840b63f"));
    }
    level notify(#"hash_54391c26dfd50b8a");
    level.var_8110be92 = 1;
    level thread function_1c8ea11(0);
    level thread function_1c8ea11(1);
    level thread function_1c8ea11(2);
}

/#

    // Namespace wz_ai_zonemgr/wz_ai_zonemgr
    // Params 0, eflags: 0x0
    // Checksum 0x33356ff4, Offset: 0x8050
    // Size: 0x1a8
    function function_49d2e080() {
        level endon(#"game_ended", #"hash_329c3f546e49cb9f");
        while (true) {
            if (getdvarint(#"scr_print_ai", 0) && isdefined(level.var_e066667d) && level.var_e066667d) {
                if (isdefined(level.var_e147d7b8) && level.var_e147d7b8) {
                    var_ffabb450 = 0;
                    foreach (ai_zone in level.var_5b357434) {
                        if (!ai_zone.is_disabled && isdefined(ai_zone.is_active) && ai_zone.is_active) {
                            iprintlnbold(ai_zone.zone_name + "<dev string:x766>" + ai_zone.var_84b8298c + "<dev string:x76b>");
                            var_ffabb450 = 1;
                        }
                    }
                    if (var_ffabb450) {
                    }
                } else {
                    iprintlnbold("<dev string:x775>");
                }
            }
            wait 1;
        }
    }

#/

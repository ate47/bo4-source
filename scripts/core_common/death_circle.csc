// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace death_circle;

// Namespace death_circle/death_circle
// Params 0, eflags: 0x2
// Checksum 0xa0ed348f, Offset: 0x198
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"death_circle", &__init__, undefined, undefined);
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x1 linked
// Checksum 0x5ef48694, Offset: 0x1e0
// Size: 0x322
function __init__() {
    level.var_d8958e58 = isdefined(getgametypesetting(#"deathcircle")) && getgametypesetting(#"deathcircle");
    if (!level.var_d8958e58) {
        return;
    }
    level.var_ef215639 = [3:"evt_death_circle_strong", 2:#"hash_5b96bc3a1c23c571", 1:#"hash_1483048e184df991"];
    level.var_cb450873 = #"hash_313f1d0b4ff27caa";
    level.var_f6795a59 = [3:#"hash_3fc5123369b4c59f", 2:#"hash_5c64e89ab323857a", 1:#"hash_7c7ea03189fe65d8"];
    level.var_601fc3c5 = [3:#"hash_474c4e8748206593", 2:#"hash_474c4d87482063e0", 1:#"wz/fx8_player_outside_circle"];
    level.var_7e948a2d = [3:#"hash_559017f41745034e", 2:#"hash_2ccb19ff6223b693", 1:#"wz/fx8_plyr_pstfx_barrier_lvl_01_wz"];
    level.var_c465fd31 = [3:#"hash_316ec537e4167d47", 2:#"hash_775e24c0ca5d7b58", 1:#"hash_775e24c0ca5d7b58"];
    level.var_7d949aad = [3:0, 2:0, 1:0.5];
    level.var_213a0963 = [3:#"hash_631d14143bf8b26", 2:#"hash_301fd347a3614b8b", 1:#"hash_57b39f99758cac07"];
    clientfield::register("scriptmover", "deathcircleflag", 1, 1, "int", &function_a380fe5, 0, 0);
    clientfield::register("toplayer", "deathcircleeffects", 1, 2, "int", undefined, 0, 1);
    clientfield::register("allplayers", "outsidedeathcircle", 1, 1, "int", undefined, 0, 0);
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_localplayer_spawned(&on_localplayer_spawned);
    level.var_32e10fc2 = [];
}

// Namespace death_circle/death_circle
// Params 7, eflags: 0x1 linked
// Checksum 0xfbc8ff37, Offset: 0x510
// Size: 0x424
function function_a380fe5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify(#"hash_49f273cd81c6c0f");
    if (newval) {
        var_899562cf = self.team == #"neutral";
        var_929604bb = self.team != #"neutral";
        self setcompassicon("minimap_collapse_ring");
        self function_811196d1(0);
        self function_95bc465d(1);
        self function_5e00861(0, 1);
        self function_bc95cd57(var_899562cf);
        self function_60212003(var_929604bb);
        self thread function_a453467f(localclientnum);
        if (var_929604bb) {
            player = function_27673a7(localclientnum);
            if (isdefined(player) && isdefined(player.var_2cbc8a68)) {
                player.var_2cbc8a68 stoprenderoverridebundle(#"hash_75168376918f5ab7");
                player.var_2cbc8a68 delete();
            }
            if (isdefined(self.var_2c8e49d2)) {
                self.var_2c8e49d2 stoprenderoverridebundle(#"hash_75168376918f5ab7");
                self.var_2c8e49d2 delete();
            }
            self function_a5edb367(#"death_ring");
            self.var_2c8e49d2 = spawn(localclientnum, self.origin, "script_model");
            self.var_2c8e49d2 setmodel("p8_big_cylinder");
            self.var_2c8e49d2 playrenderoverridebundle(#"hash_75168376918f5ab7");
            self.var_2c8e49d2 linkto(self);
            self.var_29b256b0 = spawn(0, self.origin, "script_origin");
            self.var_29b256b0.handle = self.var_29b256b0 playloopsound(level.var_cb450873);
        } else {
            self function_a5edb367(#"none");
        }
        return;
    }
    self function_811196d1(1);
    self function_bc95cd57(0);
    if (isdefined(self.var_2c8e49d2)) {
        self.var_2c8e49d2 stoprenderoverridebundle(#"hash_75168376918f5ab7");
        self.var_2c8e49d2 delete();
    }
    if (isdefined(self.var_29b256b0)) {
        self.var_29b256b0 stoploopsound(self.var_29b256b0.handle);
        self.var_29b256b0 delete();
    }
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x1 linked
// Checksum 0x4c4858fe, Offset: 0x940
// Size: 0xac
function on_localclient_connect(localclientnum) {
    player = function_27673a7(localclientnum);
    if (isdefined(player)) {
        player.var_2cbc8a68 = spawn(localclientnum, vectorscale((0, 0, -1), 10000), "script_model");
        player.var_2cbc8a68 playrenderoverridebundle(#"hash_75168376918f5ab7");
    }
    level thread function_382da026(localclientnum);
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x1 linked
// Checksum 0xf2b3ed19, Offset: 0x9f8
// Size: 0x3c
function on_localplayer_spawned(localclientnum) {
    if (self function_da43934d()) {
        self thread function_7eb327bd(localclientnum);
    }
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x5 linked
// Checksum 0xac922942, Offset: 0xa40
// Size: 0x214
function private function_382da026(localclientnum) {
    self notify("1368c9cad92ba095");
    self endon("1368c9cad92ba095");
    var_ef2f4cec = spawnstruct();
    level.var_32e10fc2[localclientnum] = var_ef2f4cec;
    while (1) {
        currentplayer = function_5c10bd79(localclientnum);
        if (!isdefined(currentplayer)) {
            waitframe(1);
            continue;
        }
        intensity = currentplayer clientfield::get_to_player("deathcircleeffects");
        if (var_ef2f4cec.var_e51324b5 !== intensity) {
            var_ef2f4cec notify(#"hash_b6468b7475f6790");
            var_ef2f4cec function_43d7470c(localclientnum, intensity);
            var_ef2f4cec function_d69170b(localclientnum, intensity);
            var_ef2f4cec function_b8c979ec(localclientnum, intensity);
            var_ef2f4cec thread function_7ede78e9(localclientnum, currentplayer, intensity);
            level function_e1273acb(localclientnum, intensity);
            var_ef2f4cec.var_e51324b5 = intensity;
        } else if (intensity > 0) {
            var_ef2f4cec thread function_7ede78e9(localclientnum, currentplayer, intensity);
            level function_e1273acb(localclientnum, intensity);
        }
        if (ispc()) {
            level.var_d081e853 = intensity > 0;
        }
        waitframe(1);
    }
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x5 linked
// Checksum 0x5a5294e9, Offset: 0xc60
// Size: 0xd4
function private function_7eb327bd(localclientnum) {
    self waittill(#"death");
    var_ef2f4cec = level.var_32e10fc2[localclientnum];
    if (isdefined(var_ef2f4cec)) {
        var_ef2f4cec notify(#"hash_b6468b7475f6790");
        var_ef2f4cec function_43d7470c(localclientnum);
        var_ef2f4cec function_d69170b(localclientnum);
        var_ef2f4cec function_b8c979ec(localclientnum);
        var_ef2f4cec thread function_7ede78e9(localclientnum);
    }
    level function_e1273acb(localclientnum);
}

// Namespace death_circle/death_circle
// Params 2, eflags: 0x5 linked
// Checksum 0xffbc46d8, Offset: 0xd40
// Size: 0x9a
function private function_43d7470c(localclientnum, intensity = 0) {
    if (isdefined(self.var_ef215639)) {
        function_d48752e(localclientnum, self.var_ef215639);
        self.var_ef215639 = undefined;
    }
    alias = level.var_ef215639[intensity];
    if (isdefined(alias)) {
        self.var_ef215639 = function_604c9983(localclientnum, alias);
    }
}

// Namespace death_circle/death_circle
// Params 2, eflags: 0x5 linked
// Checksum 0x89d3f980, Offset: 0xde8
// Size: 0xd2
function private function_d69170b(localclientnum, intensity = 0) {
    if (isdefined(self.var_f6795a59)) {
        function_24cd4cfb(localclientnum, self.var_f6795a59);
        self.var_f6795a59 = undefined;
    }
    postfx = level.var_f6795a59[intensity];
    if (isdefined(postfx)) {
        if (function_148ccc79(localclientnum, postfx)) {
            codestoppostfxbundlelocal(localclientnum, postfx);
        }
        function_a837926b(localclientnum, postfx);
        self.var_f6795a59 = postfx;
    }
}

// Namespace death_circle/death_circle
// Params 2, eflags: 0x5 linked
// Checksum 0x25637b4f, Offset: 0xec8
// Size: 0xaa
function private function_b8c979ec(localclientnum, intensity = 0) {
    if (isdefined(self.var_7e948a2d)) {
        deletefx(localclientnum, self.var_7e948a2d, 1);
        self.var_7e948a2d = undefined;
    }
    camerafx = level.var_7e948a2d[intensity];
    if (isdefined(camerafx)) {
        self.var_7e948a2d = playfxoncamera(localclientnum, camerafx, (0, 0, 0), (1, 0, 0), (0, 0, 1));
    }
}

// Namespace death_circle/death_circle
// Params 3, eflags: 0x5 linked
// Checksum 0x41a49c29, Offset: 0xf80
// Size: 0x16a
function private function_7ede78e9(localclientnum, currentplayer = undefined, intensity = 0) {
    self notify("7d26c6ac6cb4777b");
    self endon("7d26c6ac6cb4777b");
    self endon(#"hash_b6468b7475f6790");
    tagfx = level.var_601fc3c5[intensity];
    if (self.currentplayer === currentplayer && self.var_cfa7d2bf === tagfx) {
        return;
    }
    if (isdefined(self.var_601fc3c5)) {
        killfx(localclientnum, self.var_601fc3c5);
        self.var_601fc3c5 = undefined;
        self.currentplayer = undefined;
        self.var_cfa7d2bf = undefined;
    }
    if (isdefined(tagfx) && isdefined(currentplayer)) {
        currentplayer util::waittill_dobj(localclientnum);
        if (isdefined(currentplayer)) {
            self.var_601fc3c5 = function_239993de(localclientnum, tagfx, currentplayer, "tag_origin");
            self.currentplayer = currentplayer;
            self.var_cfa7d2bf = tagfx;
        }
    }
}

// Namespace death_circle/death_circle
// Params 2, eflags: 0x5 linked
// Checksum 0xadc21798, Offset: 0x10f8
// Size: 0x30e
function private function_e1273acb(localclientnum, intensity = 0) {
    maxdistsq = 100000000;
    var_4a4e047 = 0;
    origin = getlocalclientpos(localclientnum);
    angles = getlocalclientangles(localclientnum);
    fwd = anglestoforward(angles);
    players = getplayers(localclientnum);
    players = arraysortclosest(players, origin);
    rob = level.var_c465fd31[intensity];
    robfade = level.var_7d949aad[intensity];
    tagfx = level.var_213a0963[intensity];
    foreach (player in players) {
        if (!isdefined(player) || !player isplayer()) {
            continue;
        }
        if (!player hasdobj(localclientnum)) {
            continue;
        }
        if (var_4a4e047 >= 10 || player function_21c0fa55() || player clientfield::get("outsidedeathcircle") || !isalive(player) || distance2dsquared(origin, player.origin) > maxdistsq || vectordot(fwd, player.origin - origin) <= 0) {
            player function_de4523(localclientnum);
            player function_9e8e1f4f(localclientnum);
            continue;
        }
        player function_de4523(localclientnum, rob, robfade);
        player function_9e8e1f4f(localclientnum, tagfx);
        var_4a4e047++;
    }
}

// Namespace death_circle/death_circle
// Params 3, eflags: 0x5 linked
// Checksum 0x8471f85e, Offset: 0x1410
// Size: 0x126
function private function_de4523(localclientnum, rob = undefined, robfade = undefined) {
    if (self.var_eeee3972 === rob && self.var_99d5860e === robfade) {
        return;
    }
    if (isdefined(self.var_eeee3972) && self.var_eeee3972 !== rob) {
        self stoprenderoverridebundle(self.var_eeee3972);
        self.var_eeee3972 = undefined;
        self.var_99d5860e = undefined;
    }
    if (isdefined(rob)) {
        if (!self function_d2503806(rob)) {
            self playrenderoverridebundle(rob);
        }
        if (isdefined(robfade)) {
            self function_78233d29(rob, "", "Fade", robfade);
        }
        self.var_eeee3972 = rob;
        self.var_99d5860e = robfade;
    }
}

// Namespace death_circle/death_circle
// Params 2, eflags: 0x5 linked
// Checksum 0x4bacdf34, Offset: 0x1540
// Size: 0x106
function private function_9e8e1f4f(localclientnum, tagfx = undefined) {
    if (self.var_213a0963 === tagfx) {
        return;
    }
    if (isdefined(self.var_99096337)) {
        foreach (fxhandle in self.var_99096337) {
            killfx(localclientnum, fxhandle);
        }
        self.var_213a0963 = undefined;
        self.var_99096337 = undefined;
    }
    if (isdefined(tagfx)) {
        self.var_99096337 = playtagfxset(localclientnum, tagfx, self);
        self.var_213a0963 = tagfx;
    }
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x4
// Checksum 0x44d3f0d0, Offset: 0x1650
// Size: 0x24
function private function_63d6411e() {
    self setcompassicon("");
}

// Namespace death_circle/death_circle
// Params 3, eflags: 0x5 linked
// Checksum 0xc123715c, Offset: 0x1680
// Size: 0x152
function private function_32f7227c(deathcircle, currentradius, localclientnum) {
    localplayer = function_5c10bd79(localclientnum);
    startpos = (deathcircle.origin[0], deathcircle.origin[1], 0);
    toplayervec = (0, 0, 0);
    eyepos = startpos + vectorscale((0, 0, 1), 60);
    if (isdefined(localplayer)) {
        endpos = (localplayer.origin[0], localplayer.origin[1], 0);
        toplayervec = vectornormalize(endpos - startpos) * currentradius;
        eyepos = localplayer geteyeapprox();
    }
    var_ba5c9ce6 = deathcircle.origin + toplayervec;
    return (var_ba5c9ce6[0], var_ba5c9ce6[1], eyepos[2]);
}

// Namespace death_circle/death_circle
// Params 1, eflags: 0x5 linked
// Checksum 0xd04ed0ea, Offset: 0x17e0
// Size: 0x18e
function private function_a453467f(localclientnum) {
    self endon(#"death", #"hash_49f273cd81c6c0f");
    self thread function_71f8d788();
    while (isdefined(self.scale)) {
        radius = 15000 * self.scale;
        if (isdefined(self.var_2c8e49d2)) {
            if (!self.var_2c8e49d2 function_d2503806(#"hash_75168376918f5ab7")) {
                self.var_2c8e49d2 playrenderoverridebundle(#"hash_75168376918f5ab7");
            }
            modelscale = radius / 150000;
            self.var_2c8e49d2 function_78233d29(#"hash_75168376918f5ab7", "", "Scale", modelscale);
            if (isdefined(self.var_29b256b0)) {
                self.var_29b256b0.origin = function_32f7227c(self, radius, localclientnum);
            }
        }
        compassscale = radius * 2;
        self function_5e00861(compassscale, 1);
        waitframe(1);
    }
}

// Namespace death_circle/death_circle
// Params 0, eflags: 0x1 linked
// Checksum 0xc70ac44, Offset: 0x1978
// Size: 0x7c
function function_71f8d788() {
    self endon(#"hash_49f273cd81c6c0f");
    self waittill(#"death");
    if (isdefined(self.var_2c8e49d2)) {
        self.var_2c8e49d2 stoprenderoverridebundle(#"hash_75168376918f5ab7");
        self.var_2c8e49d2 delete();
    }
}


// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\duplicaterender_mgr.csc;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\multi_extracam.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\activecamo_shared.csc;

#namespace character_customization;

// Namespace character_customization
// Method(s) 84 Total 84
class class_7da27482 {

    // Namespace class_7da27482/character_customization
    // Params 0, eflags: 0x9 linked
    // Checksum 0xbf6979b3, Offset: 0x598
    // Size: 0x246
    __constructor() {
        self.var_f141235b = 0;
        self.var_81bd1932 = 0;
        self._xuid = undefined;
        self._target_name = undefined;
        self._i_mode = 4;
        self.var_1d73bad9 = 0;
        self.var_db113baf = 0;
        self.var_cf55444c = 0;
        self.var_cfe86a3e = 0;
        self.var_f5c0467b = [7:0, 6:0, 5:0, 4:0, 3:0, 2:0, 1:0, 0:0];
        /#
            /#
                assert(-1);
            #/
        #/
        self.var_228f64da = undefined;
        self.var_43b94d19 = 1;
        self.var_c31e86ed = 0;
        self.var_b3113387 = 0;
        self.var_444a0d45 = 0;
        self._origin = (0, 0, 0);
        self._angles = (0, 0, 0);
        self.var_9a4a8ea = undefined;
        self.var_cbcee022 = undefined;
        self.var_54430cb6 = undefined;
        self.var_9bea772f = undefined;
        self.var_a287debe = undefined;
        self.var_8d2161e9 = 0;
        self.var_45210dc7 = [];
        self.var_bf273e28 = [];
        self.var_5633914d = [];
        self.var_eb95665 = undefined;
        self.var_b627749c = 1;
        self.var_27af8d38 = [];
        self.var_bf4feef5 = 1;
        self.var_609efd3e = 1;
        self.var_9896541c = 0;
        self.var_851003fe = 1;
        self.var_ef017bf9 = 0;
        self.var_506d3c33 = [];
        self.var_ff2bed36 = undefined;
        self.var_640fbaae = undefined;
        self.var_266b2ff0 = undefined;
        self.var_d781e2e4 = undefined;
        self.var_180f1c7d = [];
        self.var_1d18f5c7 = 0;
    }

    // Namespace class_7da27482/character_customization
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x4998
    // Size: 0x4
    __destructor() {
        
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa6380985, Offset: 0x4950
    // Size: 0x3c
    function function_7792df22(locked) {
        if (self.var_444a0d45 != locked) {
            self.var_444a0d45 = locked;
            function_2a5421e3();
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 2, eflags: 0x1 linked
    // Checksum 0x265fe91d, Offset: 0x48e8
    // Size: 0x5c
    function function_27945cb8(on_off, force = 0) {
        if (self.var_b3113387 != on_off || force) {
            self.var_b3113387 = on_off;
            function_2a5421e3();
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x5 linked
    // Checksum 0x729806d, Offset: 0x48a0
    // Size: 0x3c
    function private function_2a5421e3() {
        self.var_228f64da duplicate_render::set_entity_draft_unselected(self.var_f141235b, self.var_b3113387 || self.var_444a0d45);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x93dcce76, Offset: 0x47b0
    // Size: 0xe2
    function is_streamed() {
        if (isdefined(self.var_228f64da)) {
            if (!self.var_228f64da isstreamed()) {
                return false;
            }
        }
        if (self.var_9896541c && function_d9aed86()) {
            return false;
        }
        foreach (ent in self.var_5633914d) {
            if (isdefined(ent)) {
                if (!ent isstreamed()) {
                    return false;
                }
            }
        }
        return true;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xda156a78, Offset: 0x4750
    // Size: 0x58
    function function_da76c6d1() {
        var_65496229 = [[ self ]]->function_690c9509();
        head_index = getequippedheadindexforhero(var_65496229, self._i_mode);
        [[ self ]]->set_character_head(head_index);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xe2101686, Offset: 0x46f0
    // Size: 0x58
    function function_225b6e07() {
        var_65496229 = [[ self ]]->function_690c9509();
        character_index = getequippedheroindex(var_65496229, self._i_mode);
        [[ self ]]->set_character_index(character_index);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 2, eflags: 0x1 linked
    // Checksum 0xe4d8375a, Offset: 0x4650
    // Size: 0x94
    function function_9146bf81(itemindex, itemtype) {
        outfit_index = itemtype == 7 ? self.var_cfe86a3e : self.var_cf55444c;
        if (!isdefined(itemindex)) {
            itemindex = function_bd9a67ae(self.var_f141235b, self._i_mode, self.var_1d73bad9, outfit_index, itemtype);
        }
        [[ self ]]->set_character_outfit_item(itemindex, itemtype);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0xe9c299ca, Offset: 0x45d0
    // Size: 0x78
    function function_ac9cc79d(itemtype) {
        outfit_index = itemtype == 7 ? self.var_cfe86a3e : self.var_cf55444c;
        [[ self ]]->set_character_outfit_item(function_bd9a67ae(self.var_f141235b, self._i_mode, self.var_1d73bad9, outfit_index, itemtype), itemtype);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xc7f9a1a0, Offset: 0x4588
    // Size: 0x3a
    function function_59d1302f() {
        for (itemtype = 0; itemtype < 8; itemtype++) {
            [[ self ]]->function_ac9cc79d(itemtype);
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xf710d6f8, Offset: 0x4548
    // Size: 0x38
    function function_10b0cbea() {
        [[ self ]]->function_158505aa(function_76fbb09e(self.var_f141235b, self._i_mode, self.var_1d73bad9));
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x5a1c106, Offset: 0x4508
    // Size: 0x38
    function function_72be01b9() {
        [[ self ]]->set_character_outfit(function_9ec573f1(self.var_f141235b, self._i_mode, self.var_1d73bad9));
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xe4995906, Offset: 0x44b8
    // Size: 0x44
    function function_77e3be08() {
        [[ self ]]->function_da76c6d1();
        [[ self ]]->function_72be01b9();
        [[ self ]]->function_10b0cbea();
        [[ self ]]->function_59d1302f();
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x152893eb, Offset: 0x4400
    // Size: 0xac
    function function_e599283f() {
        return {#outfititems:self.var_f5c0467b, #warpaintoutfit:self.var_cfe86a3e, #outfit:self.var_cf55444c, #characterhead:self.var_db113baf, #charactertype:self.var_1d73bad9, #charactermode:self._i_mode, #xuid:self._xuid};
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x250332c6, Offset: 0x42a8
    // Size: 0x14c
    function function_15a8906a(var_23904c1d) {
        if (isdefined(var_23904c1d.xuid)) {
            [[ self ]]->set_xuid(var_23904c1d.xuid);
        }
        [[ self ]]->set_character_mode(var_23904c1d.charactermode);
        [[ self ]]->set_character_index(var_23904c1d.charactertype);
        [[ self ]]->set_character_head(var_23904c1d.characterhead);
        [[ self ]]->set_character_outfit(var_23904c1d.outfit);
        [[ self ]]->function_158505aa(var_23904c1d.warpaintoutfit);
        /#
            /#
                assert(var_23904c1d.outfititems.size == 8);
            #/
        #/
        foreach (itemtype, itemindex in var_23904c1d.outfititems) {
            [[ self ]]->set_character_outfit_item(itemindex, itemtype);
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x8020593e, Offset: 0x4260
    // Size: 0x3a
    function function_95779b72() {
        for (itemtype = 0; itemtype < 8; itemtype++) {
            [[ self ]]->set_character_outfit_item(0, itemtype);
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x6e5d2d77, Offset: 0x4210
    // Size: 0x44
    function function_22039feb() {
        set_character_outfit(0);
        function_158505aa(0);
        function_95779b72();
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xe06de8f4, Offset: 0x4140
    // Size: 0xc4
    function function_81d84c71() {
        self notify("78af646c5bda58c9");
        self endon("78af646c5bda58c9");
        if (self.var_9896541c) {
            while (function_d9aed86()) {
                waitframe(1);
            }
            if (isdefined(self.var_eb95665)) {
                self.var_228f64da function_5790ec6e(self.var_eb95665);
            } else {
                self.var_228f64da function_a72ef0c5(self.var_f141235b, self._i_mode);
            }
            return;
        }
        self.var_228f64da function_a7842493();
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0xbae906da, Offset: 0x40a0
    // Size: 0x94
    function function_7412658d(params) {
        if (self.var_640fbaae !== params.exploder_id) {
            if (isdefined(self.var_640fbaae)) {
                killradiantexploder(self.var_f141235b, self.var_640fbaae);
            }
            self.var_640fbaae = params.exploder_id;
            if (isdefined(self.var_640fbaae)) {
                playradiantexploder(self.var_f141235b, self.var_640fbaae);
            }
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 2, eflags: 0x1 linked
    // Checksum 0x15b5738f, Offset: 0x3f28
    // Size: 0x16c
    function function_dd872e2b(params, force_updates) {
        if (isdefined(params.weapon_right) || isdefined(params.weapon_left)) {
            [[ self ]]->update_model_attachment(params.weapon_right, "tag_weapon_right", params.weapon_right_anim, params.weapon_right_anim_intro, force_updates);
            [[ self ]]->update_model_attachment(params.weapon_left, "tag_weapon_left", params.weapon_left_anim, params.weapon_left_anim_intro, force_updates);
            return;
        }
        if (isdefined(params.activeweapon)) {
            self.var_228f64da attachweapon(params.activeweapon, isdefined(params.var_b8f20727) ? params.var_b8f20727 : 0);
            function_2e77aae4(self.var_f141235b, self.var_228f64da, isdefined(params.var_b8f20727) ? params.var_b8f20727 : 0, self.var_27af8d38);
            self.var_228f64da useweaponhidetags(params.activeweapon);
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 4, eflags: 0x5 linked
    // Checksum 0xce41bb6a, Offset: 0x3df0
    // Size: 0x12a
    function private function_2e77aae4(localclientnum, weaponmodel, camooptions, var_49daa2f6) {
        stage = getactivecamostage(camooptions);
        camoindex = getcamoindex(camooptions);
        activecamoinfo = activecamo::function_ae141bf2(camoindex);
        if (!isdefined(activecamoinfo)) {
            return 0;
        }
        var_ddcdb079 = array(166, 167, 168, 170, 171, 172, 173);
        if (isinarray(var_ddcdb079, camoindex)) {
            stage = 1;
        }
        var_3594168e = activecamoinfo.stages[stage];
        return activecamo::function_374e37a0(localclientnum, weaponmodel, var_3594168e, var_49daa2f6);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 2, eflags: 0x1 linked
    // Checksum 0x3c350de0, Offset: 0x3d30
    // Size: 0xb2
    function function_39a68bf2(stop_update = 1, var_93eea46f = 0) {
        self.var_1d18f5c7 = 0;
        if (stop_update) {
            self notify(#"hash_578cb70e92c24a5a");
            self.var_1d18f5c7 = 1;
        }
        if (isdefined(self.var_54430cb6)) {
            self.var_a287debe scene::cancel(self.var_54430cb6, 0);
            if (!var_93eea46f) {
                self.var_54430cb6 = undefined;
                self.var_a287debe = undefined;
            }
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x3641ab94, Offset: 0x3cf8
    // Size: 0x2e
    function function_69ac4009(gesture_index) {
        gesture = get_gesture(gesture_index);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x2b5f58c, Offset: 0x3c88
    // Size: 0x64
    function function_8144231c() {
        if (!self.var_c31e86ed && #"female" === getherogender(self.var_1d73bad9, self._i_mode)) {
            return #"pb_fem_frontend_default";
        }
        return #"pb_male_frontend_default";
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb099001e, Offset: 0x3c38
    // Size: 0x44
    function function_47ad026() {
        if (self.var_1d18f5c7 && isdefined(self.var_cbcee022)) {
            self.var_228f64da thread animation::play(self.var_cbcee022, self.var_228f64da);
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 4, eflags: 0x1 linked
    // Checksum 0x6092ceb, Offset: 0x3928
    // Size: 0x304
    function play_gesture(gesture_index, wait_until_model_steam_ends, replay_if_already_playing = 1, ignore_if_already_playing = 0) {
        self endon(#"deleted");
        self endon(#"cancel_gesture");
        if (wait_until_model_steam_ends && isdefined(self.var_1d18f5c7)) {
            while (![[ self ]]->function_ea4ac9f8()) {
                wait(0.25);
            }
        }
        var_2ec36514 = self.var_cbcee022;
        [[ self ]]->function_39a68bf2(1, 1);
        gesture = get_gesture(gesture_index);
        if (isdefined(gesture) && isdefined(gesture.animation)) {
            self endon(#"hash_578cb70e92c24a5a", #"cancel_gesture");
            while (!isdefined(self.var_cbcee022) && !isdefined(self.var_54430cb6)) {
                wait(0.1);
            }
            var_a7e34ee1 = self.var_228f64da getcurrentanimscriptedname();
            var_99789677 = var_a7e34ee1 === gesture.animation || var_a7e34ee1 === gesture.intro || var_a7e34ee1 === gesture.outro;
            if (!ignore_if_already_playing || !var_99789677) {
                if (replay_if_already_playing || !var_99789677) {
                    self thread function_60b3658e(var_2ec36514, 1);
                    character_customization::function_bee62aa1(self);
                    if (isdefined(gesture.intro)) {
                        self.var_228f64da animation::play(gesture.intro, self.var_228f64da);
                    }
                    self.var_228f64da animation::play(gesture.animation, self.var_228f64da);
                    if (isdefined(gesture.outro)) {
                        self.var_228f64da animation::play(gesture.outro, self.var_228f64da);
                    }
                    self notify(#"gesture_ended");
                    return;
                }
                self thread function_60b3658e(var_2ec36514, 0);
            }
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 2, eflags: 0x5 linked
    // Checksum 0xdb091b8, Offset: 0x3850
    // Size: 0xcc
    function private function_60b3658e(var_2ec36514, need_wait) {
        if (need_wait) {
            self endon(#"deleted", #"hash_578cb70e92c24a5a");
            self waittill(#"cancel_gesture", #"gesture_ended");
        }
        if (isdefined(var_2ec36514)) {
            self.var_228f64da thread animation::play(var_2ec36514, self.var_228f64da);
            return;
        }
        if (isdefined(self.var_54430cb6)) {
            if (self.var_8d2161e9) {
                self.var_a287debe thread scene::play(self.var_54430cb6, self.var_228f64da);
            }
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xcc8c4efa, Offset: 0x36e0
    // Size: 0x168
    function function_b94f710e() {
        if (isdefined(self.var_cbcee022)) {
            [[ self ]]->function_39a68bf2();
            self.var_228f64da thread character_customization::play_intro_and_animation(self._origin, self._angles, undefined, self.var_cbcee022, 0);
        } else if (isdefined(self.var_54430cb6)) {
            [[ self ]]->function_39a68bf2();
            if (self.var_8d2161e9) {
                self.var_a287debe thread scene::play(self.var_54430cb6, self.var_228f64da);
            } else {
                self.var_a287debe thread scene::play(self.var_54430cb6);
            }
        }
        foreach (slot, ent in self.var_5633914d) {
            ent thread character_customization::play_intro_and_animation(self._origin, self._angles, undefined, self.var_bf273e28[slot], 1);
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 2, eflags: 0x1 linked
    // Checksum 0xde8efb2c, Offset: 0x3298
    // Size: 0x440
    function function_ef064067(params, force_update) {
        changed = 0;
        if (!isdefined(params)) {
            params = {};
        }
        if (!isdefined(params.exploder_id)) {
            params.exploder_id = self.var_266b2ff0;
        }
        align_changed = 0;
        if (isdefined(self.var_9a4a8ea)) {
            if (!isdefined(params.align_struct)) {
                params.align_struct = struct::get(self.var_9a4a8ea);
            }
        }
        if (isdefined(params.align_struct) && (params.align_struct.origin !== self._origin || params.align_struct.angles !== self._angles)) {
            self._origin = params.align_struct.origin;
            self._angles = params.align_struct.angles;
            if (!isdefined(params.anim_name)) {
                params.anim_name = self.var_cbcee022;
            }
            align_changed = 1;
        }
        if (isdefined(params.anim_name) && (params.anim_name !== self.var_cbcee022 || align_changed || force_update)) {
            changed = 1;
            [[ self ]]->function_39a68bf2(0);
            self.var_cbcee022 = params.anim_name;
            self.var_54430cb6 = undefined;
            self.var_a287debe = undefined;
            self.var_228f64da thread character_customization::play_intro_and_animation(self._origin, self._angles, params.anim_intro_name, self.var_cbcee022, 0);
        } else if (isdefined(params.scene) && (params.scene !== self.var_54430cb6 || params.scene_target !== self.var_a287debe || (isdefined(params.var_a34c858c) && params.var_a34c858c) != self.var_8d2161e9 || force_update)) {
            changed = 1;
            [[ self ]]->function_39a68bf2(0);
            self.var_54430cb6 = params.scene;
            self.var_a287debe = isdefined(params.scene_target) ? params.scene_target : level;
            self.var_8d2161e9 = isdefined(params.var_a34c858c) && params.var_a34c858c;
            self.var_cbcee022 = undefined;
            if (self.var_8d2161e9) {
                self.var_a287debe thread scene::play(self.var_54430cb6, self.var_228f64da);
            } else if (isdefined(params.scene_shot)) {
                self.var_a287debe thread scene::play(self.var_54430cb6, params.scene_shot);
            } else if (isdefined(params.var_f5332569) && params.var_f5332569 > 0 && params.var_f5332569 < 1) {
                self.var_a287debe thread scene::play(self.var_54430cb6, undefined, undefined, 0, "play_from_time_normalized", params.var_f5332569);
            } else {
                self.var_a287debe thread scene::play(self.var_54430cb6);
            }
        }
        return changed;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 5, eflags: 0x1 linked
    // Checksum 0x8ad5f2bc, Offset: 0x2ef0
    // Size: 0x3a0
    function update_model_attachment(attached_model, slot, model_anim, model_intro_anim, force_update) {
        /#
            /#
                assert(isdefined(level.model_type_bones));
            #/
        #/
        if (force_update || attached_model !== self.var_45210dc7[slot] || model_anim !== self.var_bf273e28[slot]) {
            bone = isdefined(level.model_type_bones[slot]) ? level.model_type_bones[slot] : slot;
            /#
                assert(isdefined(bone));
            #/
            if (isdefined(self.var_45210dc7[slot])) {
                if (isdefined(self.var_5633914d[slot])) {
                    self.var_5633914d[slot] unlink();
                    self.var_5633914d[slot] delete();
                    self.var_5633914d[slot] = undefined;
                } else if (self.var_228f64da isattached(self.var_45210dc7[slot], bone)) {
                    self.var_228f64da detach(self.var_45210dc7[slot], bone);
                }
                self.var_45210dc7[slot] = undefined;
            }
            self.var_45210dc7[slot] = attached_model;
            if (isdefined(self.var_45210dc7[slot])) {
                if (isdefined(model_anim)) {
                    ent = spawn(self.var_f141235b, self.var_228f64da.origin, "script_model");
                    ent sethighdetail(self.var_851003fe, self.var_bf4feef5);
                    self.var_5633914d[slot] = ent;
                    ent setmodel(self.var_45210dc7[slot]);
                    if (!ent hasanimtree()) {
                        ent useanimtree("generic");
                    }
                    ent.origin = self._origin;
                    ent.angles = self._angles;
                    ent thread character_customization::play_intro_and_animation(self._origin, self._angles, model_intro_anim, model_anim, 1);
                } else if (!self.var_228f64da isattached(self.var_45210dc7[slot], bone)) {
                    self.var_228f64da attach(self.var_45210dc7[slot], bone);
                }
                self.var_bf273e28[slot] = model_anim;
            }
        }
        if (isdefined(self.var_5633914d[slot])) {
            [[ self ]]->function_62dd99d6(self.var_5633914d[slot]);
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0xae9f8d6e, Offset: 0x1cd8
    // Size: 0x1210
    function update_internal(params) {
        self notify("6ce05c58b7635c54");
        self endon("6ce05c58b7635c54");
        self endon(#"deleted");
        self endon(#"hash_578cb70e92c24a5a");
        if (isdefined(self.var_9bea772f)) {
            function_66b6e720(self.var_9bea772f);
            self.var_9bea772f = undefined;
            if (self.var_43b94d19) {
                self.var_228f64da show();
            }
        }
        function_66de4847();
        if (!isdefined(params)) {
            params = {};
        }
        self.var_1d18f5c7 = 0;
        if ([[ self ]]->function_bf7bce05()) {
            base_model = [[ self ]]->function_d5e754c6();
            attached_models = [#"outfit_torso":#"tag_origin", #"outfit_legs":#"tag_origin", #"outfit_headgear":#"tag_origin", #"outfit_head":[[ self ]]->function_8c6b7af7(params), #"head":[[ self ]]->function_ccc149f(params)];
        } else {
            base_model = [[ self ]]->function_b06080fb();
            attached_models = [#"outfit_torso":[[ self ]]->function_d5e754c6(), #"outfit_legs":[[ self ]]->function_cdc02b18(), #"outfit_headgear":[[ self ]]->function_1978bfeb(), #"outfit_head":[[ self ]]->function_8c6b7af7(params), #"head":[[ self ]]->function_ccc149f(params)];
        }
        var_9e7c4fde = array(base_model);
        self.var_ff2bed36 = util::spawn_model(self.var_f141235b, base_model, (0, 0, 0));
        self.var_ff2bed36 hide();
        _models = [];
        foreach (slot, model in attached_models) {
            if (isdefined(model) && !isdefined(array::find(var_9e7c4fde, model))) {
                array::add(var_9e7c4fde, model);
                bone = isdefined(level.model_type_bones[slot]) ? level.model_type_bones[slot] : slot;
                self.var_ff2bed36 attach(model, bone);
            }
        }
        foreach (model in var_9e7c4fde) {
            force_stream_model(model);
        }
        if (isdefined(params.var_d8cb38a9) && params.var_d8cb38a9 && isdefined(params.scene)) {
            self.var_9bea772f = params.scene;
            var_a942d0c7 = 1;
            while (!forcestreambundle(params.scene)) {
                if (var_a942d0c7) {
                    self.var_228f64da hide();
                    var_a942d0c7 = 0;
                }
                waitframe(1);
            }
            if (self.var_43b94d19) {
                self.var_228f64da show();
            }
        }
        var_56293673 = 1;
        foreach (model in var_9e7c4fde) {
            var_56293673 = var_56293673 & function_c358189(model);
        }
        [[ self ]]->function_62dd99d6(self.var_ff2bed36);
        if (isdefined(params.var_c76f3e47) && params.var_c76f3e47 && !self.var_c31e86ed && !self.var_ff2bed36 isstreamed(params.var_5bd51249, params.var_13fb1841)) {
            if (isdefined(params.var_401d9a1) && params.var_401d9a1) {
                self.var_228f64da hide();
                [[ self ]]->function_27945cb8(1, 1);
                outfit_index = function_9ec573f1(self.var_f141235b, self._i_mode, self.var_1d73bad9);
                var_d92aad5c = function_bd9a67ae(self.var_f141235b, self._i_mode, self.var_1d73bad9, outfit_index, 0);
                var_2f1dcdbb = function_bd9a67ae(self.var_f141235b, self._i_mode, self.var_1d73bad9, outfit_index, 2);
                var_cb9bcfe7 = function_bd9a67ae(self.var_f141235b, self._i_mode, self.var_1d73bad9, outfit_index, 3);
                var_173f7170 = function_bd9a67ae(self.var_f141235b, self._i_mode, self.var_1d73bad9, outfit_index, 4);
                var_1f170bc0 = function_bd9a67ae(self.var_f141235b, self._i_mode, self.var_1d73bad9, outfit_index, 6);
                if ([[ self ]]->function_bf7bce05()) {
                    var_867954ad = character_customization::function_6bca50af(&function_92ea4100, self.var_1d73bad9, outfit_index, 0, self._i_mode);
                    var_89610e9c = [#"outfit_torso":#"tag_origin", #"outfit_legs":#"tag_origin", #"outfit_headgear":#"tag_origin", #"outfit_head":character_customization::function_6bca50af(&startquantity, self.var_1d73bad9, outfit_index, 0, self._i_mode), #"head":character_customization::function_6bca50af(&getcharacterheadmodel, 0, self._i_mode)];
                } else {
                    var_867954ad = character_customization::function_6bca50af(&function_5d23af5b, self.var_1d73bad9, outfit_index, var_d92aad5c, self._i_mode);
                    var_89610e9c = [#"outfit_torso":character_customization::function_6bca50af(&function_92ea4100, self.var_1d73bad9, outfit_index, var_1f170bc0, self._i_mode), #"outfit_legs":character_customization::function_6bca50af(&function_cde23658, self.var_1d73bad9, outfit_index, var_173f7170, self._i_mode), #"outfit_headgear":character_customization::function_6bca50af(&function_6b7000e, self.var_1d73bad9, outfit_index, var_cb9bcfe7, self._i_mode), #"outfit_head":character_customization::function_6bca50af(&startquantity, self.var_1d73bad9, outfit_index, var_2f1dcdbb, self._i_mode), #"head":isdefined(getcharacterheadmodel(0, self._i_mode)) ? getcharacterheadmodel(0, self._i_mode) : #"tag_origin"];
                }
                var_cf2f5fb7 = array(var_867954ad);
                foreach (model in var_89610e9c) {
                    if (!isdefined(var_cf2f5fb7)) {
                        var_cf2f5fb7 = [];
                    } else if (!isarray(var_cf2f5fb7)) {
                        var_cf2f5fb7 = array(var_cf2f5fb7);
                    }
                    if (!isinarray(var_cf2f5fb7, model)) {
                        var_cf2f5fb7[var_cf2f5fb7.size] = model;
                    }
                }
                var_a9916921 = getdvarint(#"hash_40f551189b68d5c2", 1);
                foreach (model in var_cf2f5fb7) {
                    force_stream_model(model, var_a9916921, 0);
                }
                do {
                    waitframe(1);
                    var_e2e2ee90 = 1;
                    foreach (model in var_cf2f5fb7) {
                        var_e2e2ee90 = var_e2e2ee90 & function_c358189(model, var_a9916921, 0);
                    }
                } while (!var_e2e2ee90);
                function_91cd5499(util::spawn_model(self.var_f141235b, var_867954ad, self._origin, self._angles), 0, 0);
                self.var_b627749c = 1;
                [[ self ]]->function_27945cb8(1, 1);
                if (!self.var_43b94d19) {
                    self.var_228f64da hide();
                }
                var_cc204afb = [];
                foreach (slot, model in var_89610e9c) {
                    if (isdefined(model) && !isdefined(array::find(var_cc204afb, model))) {
                        array::add(var_cc204afb, model);
                        bone = isdefined(level.model_type_bones[slot]) ? level.model_type_bones[slot] : slot;
                        self.var_228f64da attach(model, bone);
                    }
                }
                [[ self ]]->function_ef064067(params, 1);
                foreach (model in var_cf2f5fb7) {
                    function_b020b858(model, var_a9916921, 0);
                }
            }
            do {
                waitframe(1);
            } while (!self.var_ff2bed36 isstreamed(params.var_5bd51249, params.var_13fb1841));
        }
        var_ff704b7c = isdefined(params.var_99a89f83) && params.var_99a89f83;
        if (self.var_b627749c) {
            self.var_b627749c = 0;
            var_ff704b7c = 1;
            [[ self ]]->function_39a68bf2(0);
            if (isdefined(base_model)) {
                function_91cd5499(util::spawn_model(self.var_f141235b, base_model, self._origin, self._angles));
                self.var_45210dc7 = [];
                self.var_bf273e28 = [];
                self.var_5633914d = [];
            }
            if (!self.var_43b94d19) {
                self.var_228f64da hide();
            }
        }
        foreach (slot, model in attached_models) {
            [[ self ]]->update_model_attachment(model, slot, undefined, undefined, 1);
        }
        [[ self ]]->function_62dd99d6(self.var_228f64da);
        function_66de4847();
        changed = [[ self ]]->function_ef064067(params, var_ff704b7c);
        [[ self ]]->function_dd872e2b(params, changed);
        [[ self ]]->function_7412658d(params);
        self.var_9bea772f = undefined;
        if (isdefined(params.var_c76f3e47) && params.var_c76f3e47) {
            function_27945cb8(0);
        }
        if (isdefined(params.var_8d3b5f69) && params.var_8d3b5f69) {
            fbc = getuimodel(getglobaluimodel(), "lobbyRoot.fullscreenBlackCount");
            setuimodelvalue(fbc, 0);
        }
        thread [[ self ]]->function_81d84c71();
        self.var_1d18f5c7 = 1;
        var_2d0192e5 = [[ self ]]->function_82e05d64();
        if (isdefined(var_2d0192e5)) {
            if (isdefined(var_2d0192e5.visible_model)) {
                setuimodelvalue(var_2d0192e5.visible_model, [[ self ]]->function_ea4ac9f8() && [[ self ]]->is_visible());
            }
        }
        gestureindex = character_customization::function_6aee5a4e(self);
        if (isdefined(gestureindex) && gestureindex > 0) {
            thread [[ self ]]->play_gesture(gestureindex, 0, 1, 0);
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4bcd0259, Offset: 0x1ca8
    // Size: 0x24
    function update(params) {
        self thread update_internal(params);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x699c46a4, Offset: 0x1be8
    // Size: 0xb4
    function function_62dd99d6(model) {
        render_options = function_aa478513({#outfitoptions:self.var_f5c0467b, #warpaintoutfitindex:self.var_cfe86a3e, #outfitindex:self.var_cf55444c, #characterindex:self.var_1d73bad9, #mode:self._i_mode});
        model setbodyrenderoptionspacked(render_options);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xdc040cac, Offset: 0x1b78
    // Size: 0x62
    function function_d5e754c6() {
        if (self.var_c31e86ed) {
            return #"c_t8_mp_swatbuddy_body2";
        }
        return character_customization::function_6bca50af(&function_92ea4100, self.var_1d73bad9, self.var_cf55444c, self.var_f5c0467b[6], self._i_mode);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x87175e3b, Offset: 0x1b08
    // Size: 0x62
    function function_cdc02b18() {
        if (self.var_c31e86ed) {
            return #"tag_origin";
        }
        return character_customization::function_6bca50af(&function_cde23658, self.var_1d73bad9, self.var_cf55444c, self.var_f5c0467b[4], self._i_mode);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xcccdc0b6, Offset: 0x1a98
    // Size: 0x62
    function function_1978bfeb() {
        if (self.var_c31e86ed) {
            return #"tag_origin";
        }
        return character_customization::function_6bca50af(&function_6b7000e, self.var_1d73bad9, self.var_cf55444c, self.var_f5c0467b[3], self._i_mode);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x7528ea14, Offset: 0x1a00
    // Size: 0x8a
    function function_8c6b7af7(params) {
        if (self.var_c31e86ed) {
            return #"c_t8_mp_swatbuddy_head2";
        }
        if (![[ self ]]->function_ef6f931f(params)) {
            return #"tag_origin";
        }
        return character_customization::function_6bca50af(&startquantity, self.var_1d73bad9, self.var_cf55444c, self.var_f5c0467b[2], self._i_mode);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x9f1da52b, Offset: 0x1998
    // Size: 0x5a
    function function_b06080fb() {
        if (self.var_c31e86ed) {
            return #"tag_origin";
        }
        return character_customization::function_6bca50af(&function_5d23af5b, self.var_1d73bad9, self.var_cf55444c, self.var_f5c0467b[0], self._i_mode);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x436c2756, Offset: 0x1928
    // Size: 0x62
    function function_ccc149f(params) {
        if (self.var_c31e86ed) {
            return #"tag_origin";
        }
        if (![[ self ]]->function_f941c5de(params)) {
            return #"tag_origin";
        }
        return getcharacterheadmodel(self.var_db113baf, self._i_mode);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x6c9f8702, Offset: 0x1910
    // Size: 0x10
    function function_ef6f931f(params) {
        return true;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa88ad8f2, Offset: 0x18f8
    // Size: 0x10
    function function_f941c5de(params) {
        return true;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xc4676a5f, Offset: 0x18b8
    // Size: 0x32
    function function_bf7bce05() {
        if (self.var_c31e86ed) {
            return 1;
        }
        return function_4611d0e6(self._i_mode, self.var_1d73bad9);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4b2c70ec, Offset: 0x1868
    // Size: 0x42
    function function_158505aa(outfit_index) {
        /#
            /#
                assert(self._i_mode != 4);
            #/
        #/
        self.var_cfe86a3e = outfit_index;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6d516b69, Offset: 0x1798
    // Size: 0xc2
    function set_character_outfit_item(item_index, item_type) {
        /#
            /#
                assert(self._i_mode != 4);
            #/
        #/
        if (self.var_f5c0467b[item_type] != item_index) {
            self.var_b627749c = self.var_b627749c | (item_type == 0 || item_type == 2 || item_type == 3 || item_type == 4 || item_type == 6);
            self.var_f5c0467b[item_type] = item_index;
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x5f3355c7, Offset: 0x1730
    // Size: 0x5e
    function set_character_outfit(outfit_index) {
        /#
            /#
                assert(self._i_mode != 4);
            #/
        #/
        if (self.var_cf55444c != outfit_index) {
            self.var_b627749c = 1;
            self.var_cf55444c = outfit_index;
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x568a6f0c, Offset: 0x16c8
    // Size: 0x5e
    function set_character_head(head_index) {
        /#
            /#
                assert(self._i_mode != 4);
            #/
        #/
        if (self.var_db113baf != head_index) {
            self.var_b627749c = 1;
            self.var_db113baf = head_index;
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x5fc4f37f, Offset: 0x16b0
    // Size: 0xa
    function get_character_mode() {
        return self._i_mode;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb0a85254, Offset: 0x1698
    // Size: 0xa
    function function_9004475c() {
        return self.var_1d73bad9;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x655455b8, Offset: 0x1638
    // Size: 0x56
    function set_character_index(character_index) {
        /#
            /#
                assert(isdefined(character_index));
            #/
        #/
        if (self.var_1d73bad9 != character_index) {
            self.var_b627749c = 1;
            self.var_1d73bad9 = character_index;
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa2afa48d, Offset: 0x15d8
    // Size: 0x56
    function set_character_mode(character_mode) {
        /#
            /#
                assert(isdefined(character_mode));
            #/
        #/
        if (self._i_mode != character_mode) {
            self.var_b627749c = 1;
            self._i_mode = character_mode;
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x3d54cea8, Offset: 0x15a0
    // Size: 0x2c
    function function_617a9ce4(character_mode) {
        /#
            assert(character_mode === self._i_mode);
        #/
    }

    // Namespace namespace_7da27482/character_customization
    // Params 3, eflags: 0x5 linked
    // Checksum 0x3dabd529, Offset: 0x14b0
    // Size: 0xe4
    function private function_b020b858(model_name, lod = -1, mip = -1) {
        index = array::find(self.var_506d3c33, {#mip:mip, #lod:lod, #model:model_name}, &function_1a57b132);
        if (isdefined(index)) {
            array::pop(self.var_506d3c33, index, 0);
            character_customization::function_247f6628(model_name, lod, mip);
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 2, eflags: 0x5 linked
    // Checksum 0xd5659b25, Offset: 0x1438
    // Size: 0x6a
    function private function_1a57b132(data_1, data_2) {
        return data_1.model == data_2.model && data_1.lod == data_2.lod && data_1.mip == data_2.mip;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 3, eflags: 0x5 linked
    // Checksum 0x51565b02, Offset: 0x1348
    // Size: 0xe2
    function private function_c358189(model_name, lod = -1, mip = -1) {
        index = array::find(self.var_506d3c33, {#mip:mip, #lod:lod, #model:model_name}, &function_1a57b132);
        /#
            /#
                assert(isdefined(index));
            #/
        #/
        if (!isdefined(index)) {
            return 1;
        }
        return character_customization::function_c358189(model_name, lod, mip);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 3, eflags: 0x5 linked
    // Checksum 0x9bbcf833, Offset: 0x1290
    // Size: 0xac
    function private force_stream_model(model_name, lod = -1, mip = -1) {
        array::add(self.var_506d3c33, {#mip:mip, #lod:lod, #model:model_name});
        character_customization::function_221a94ac(model_name, lod, mip);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x5 linked
    // Checksum 0x6d2d920e, Offset: 0x11b0
    // Size: 0xd2
    function private function_66de4847() {
        if (isdefined(self.var_ff2bed36)) {
            self.var_ff2bed36 delete();
            self.var_ff2bed36 = undefined;
        }
        foreach (model_data in self.var_506d3c33) {
            character_customization::function_247f6628(model_data.model, model_data.lod, model_data.mip);
        }
        self.var_506d3c33 = [];
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xc28c21d6, Offset: 0x1198
    // Size: 0xa
    function function_ea4ac9f8() {
        return self.var_1d18f5c7;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0xae9ac4f6, Offset: 0x10c8
    // Size: 0xc2
    function get_gesture(gesture_index) {
        if (gesture_index == -1) {
            if (#"female" === getherogender(self.var_1d73bad9, self._i_mode)) {
                return {#animation:#"pb_rifle_fem_stand_spray_fb"};
            } else {
                return {#animation:#"pb_rifle_male_stand_spray_fb"};
            }
        }
        return function_2a6a2af(self.var_1d73bad9, self._i_mode, gesture_index);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xf6d15428, Offset: 0x1098
    // Size: 0x22
    function function_e8b0acef() {
        return getcharacterfields(self.var_1d73bad9, self._i_mode);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x956136a1, Offset: 0x1068
    // Size: 0x22
    function function_82e05d64() {
        if (!isdefined(self.var_d781e2e4)) {
            self.var_d781e2e4 = {};
        }
        return self.var_d781e2e4;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xbb4f3b76, Offset: 0xf48
    // Size: 0x114
    function delete_models() {
        self notify(#"deleted");
        foreach (ent in self.var_5633914d) {
            ent unlink();
            ent delete();
        }
        level.custom_characters[self.var_f141235b][self.var_228f64da.targetname] = undefined;
        self.var_5633914d = [];
        self.var_228f64da delete();
        self.var_228f64da = undefined;
        function_66de4847();
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x836cdacf, Offset: 0xf30
    // Size: 0xa
    function get_angles() {
        return self._angles;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x9865dd1f, Offset: 0xf18
    // Size: 0xa
    function get_origin() {
        return self._origin;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xfec14451, Offset: 0xf00
    // Size: 0xa
    function function_4a271da1() {
        return self.var_ef017bf9;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 2, eflags: 0x1 linked
    // Checksum 0x799fdf2c, Offset: 0xe98
    // Size: 0x5a
    function function_4240a39a(var_1f64805f, angles) {
        self.var_ef017bf9 = var_1f64805f;
        if (isdefined(angles)) {
            self.var_228f64da.angles = angles;
            return;
        }
        self.var_228f64da.angles = self._angles;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x19377a11, Offset: 0xe40
    // Size: 0x4c
    function hide_model() {
        self.var_228f64da hide();
        self notify(#"cancel_gesture");
        self.var_43b94d19 = 0;
        function_c39fbf91();
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x9bb5dc3f, Offset: 0xdf8
    // Size: 0x3c
    function show_model() {
        self.var_228f64da show();
        self.var_43b94d19 = 1;
        function_c39fbf91();
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x652dbdb0, Offset: 0xde0
    // Size: 0xa
    function is_visible() {
        return self.var_43b94d19;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb2fcd59b, Offset: 0xdb8
    // Size: 0x1a
    function function_47cb6b19() {
        return self.var_228f64da getentitynumber();
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0xf467960a, Offset: 0xd50
    // Size: 0x5c
    function function_98d70bef() {
        animation = self.var_228f64da getcurrentanimscriptedname();
        if (isdefined(self.var_228f64da) && isdefined(animation)) {
            return self.var_228f64da getanimtime(animation);
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa5ddf705, Offset: 0xd28
    // Size: 0x1a
    function set_xuid(xuid) {
        self._xuid = xuid;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x1 linked
    // Checksum 0x4be5e7e8, Offset: 0xcf8
    // Size: 0x22
    function function_690c9509() {
        return isdefined(self.var_81bd1932) ? self.var_81bd1932 : self.var_f141235b;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4bf9d923, Offset: 0xcb8
    // Size: 0x38
    function set_show_helmets(show_helmets) {
        if (self.var_609efd3e != show_helmets) {
            self.var_609efd3e = show_helmets;
            [[ self ]]->function_c1aab607();
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x15671c24, Offset: 0xc90
    // Size: 0x1a
    function function_e08bf4f2(var_db61785f) {
        self.var_81bd1932 = var_db61785f;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0xc79d9efb, Offset: 0xc68
    // Size: 0x1a
    function function_79f89fb6(var_925f39ce) {
        self.var_9896541c = var_925f39ce;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x21eb1d5e, Offset: 0xc40
    // Size: 0x1a
    function set_alt_render_mode(alt_render_mode) {
        self.var_bf4feef5 = alt_render_mode;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa977ac9d, Offset: 0xc18
    // Size: 0x1a
    function function_c0ccd9ea(default_exploder) {
        self.var_266b2ff0 = default_exploder;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x202c39f0, Offset: 0xbd8
    // Size: 0x36
    function function_1ec9448d(var_6ef2ca20) {
        if (var_6ef2ca20 != self.var_c31e86ed) {
            self.var_c31e86ed = var_6ef2ca20;
            self.var_b627749c = 1;
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x5 linked
    // Checksum 0x3d753d1, Offset: 0xbc0
    // Size: 0xa
    function private function_217b10ed() {
        return self.var_228f64da;
    }

    // Namespace namespace_7da27482/character_customization
    // Params 1, eflags: 0x1 linked
    // Checksum 0x8a5724a6, Offset: 0xb20
    // Size: 0x92
    function function_184a4d2e(callback_fn) {
        if (!isdefined(self.var_180f1c7d)) {
            self.var_180f1c7d = [];
        } else if (!isarray(self.var_180f1c7d)) {
            self.var_180f1c7d = array(self.var_180f1c7d);
        }
        if (!isinarray(self.var_180f1c7d, callback_fn)) {
            self.var_180f1c7d[self.var_180f1c7d.size] = callback_fn;
        }
    }

    // Namespace namespace_7da27482/character_customization
    // Params 3, eflags: 0x1 linked
    // Checksum 0x79a44652, Offset: 0xa40
    // Size: 0xd4
    function function_7ed995de(local_client_num, character_model, alt_render_mode = 1) {
        /#
            /#
                assert(!isdefined(self.var_228f64da), "<unknown string>");
            #/
        #/
        self.var_f141235b = local_client_num;
        self.var_81bd1932 = local_client_num;
        self.var_bf4feef5 = alt_render_mode;
        self._target_name = character_model.targetname;
        self._origin = character_model.origin;
        self._angles = character_model.angles;
        function_91cd5499(character_model);
    }

    // Namespace namespace_7da27482/character_customization
    // Params 3, eflags: 0x5 linked
    // Checksum 0x332a98fd, Offset: 0x868
    // Size: 0x1cc
    function private function_91cd5499(character_model, var_87606b20, var_584905de) {
        if (isdefined(self.var_228f64da)) {
            self._origin = self.var_228f64da.origin;
            self._angles = self.var_228f64da.angles;
            [[ self ]]->function_39a68bf2(0);
            self.var_228f64da delete();
        }
        self.var_228f64da = character_model;
        self.var_228f64da.targetname = self._target_name;
        self.var_228f64da.origin = self._origin;
        self.var_228f64da.angles = self._angles;
        self.var_228f64da sethighdetail(isdefined(var_87606b20) ? var_87606b20 : self.var_851003fe, isdefined(var_584905de) ? var_584905de : self.var_bf4feef5);
        if (self.var_228f64da hasdobj(self.var_f141235b) && !self.var_228f64da hasanimtree()) {
            self.var_228f64da useanimtree("all_player");
        }
        self.var_228f64da.var_90ff9782 = self;
        self.var_228f64da.var_463f8196 = 1;
        function_2a5421e3();
        function_c39fbf91();
    }

    // Namespace namespace_7da27482/character_customization
    // Params 0, eflags: 0x5 linked
    // Checksum 0x3b3d465d, Offset: 0x7e8
    // Size: 0x78
    function private function_c39fbf91() {
        foreach (callback in self.var_180f1c7d) {
            [[ callback ]](self.var_f141235b, self);
        }
    }

}

// Namespace character_customization/character_customization
// Params 0, eflags: 0x2
// Checksum 0x2e74f733, Offset: 0x310
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"character_customization", &__init__, undefined, undefined);
}

// Namespace character_customization/character_customization
// Params 5, eflags: 0x1 linked
// Checksum 0xe2aad6ec, Offset: 0x358
// Size: 0xb2
function function_6bca50af(fn, character_index, outfit_index, var_e1daa8d9, mode) {
    model = [[ fn ]](character_index, outfit_index, var_e1daa8d9, mode);
    if (!isdefined(model)) {
        model = [[ fn ]](character_index, outfit_index, 0, mode);
        if (!isdefined(model)) {
            model = [[ fn ]](character_index, 0, 0, mode);
        }
    }
    return isdefined(model) ? model : #"tag_origin";
}

// Namespace character_customization/character_customization
// Params 1, eflags: 0x1 linked
// Checksum 0x8e4a206f, Offset: 0x418
// Size: 0xb0
function function_6aee5a4e(character) {
    if (isdefined(level.var_6963abdb)) {
        var_2d0192e5 = [[ character ]]->function_82e05d64();
        if (isdefined(var_2d0192e5) && isdefined(var_2d0192e5.xuid)) {
            xuid = xuidtostring(var_2d0192e5.xuid);
            return level.var_6963abdb[xuid];
        }
        if (isdefined(character._xuid)) {
            return level.var_6963abdb[character._xuid];
        }
    }
    return 0;
}

// Namespace character_customization/character_customization
// Params 1, eflags: 0x1 linked
// Checksum 0x4b48330, Offset: 0x4d0
// Size: 0xba
function function_bee62aa1(character) {
    if (isdefined(level.var_6963abdb)) {
        var_2d0192e5 = [[ character ]]->function_82e05d64();
        if (isdefined(var_2d0192e5) && isdefined(var_2d0192e5.xuid)) {
            xuid = xuidtostring(var_2d0192e5.xuid);
            level.var_6963abdb[xuid] = 0;
        }
        if (isdefined(character._xuid)) {
            level.var_6963abdb[character._xuid] = 0;
        }
    }
}

// Namespace character_customization/character_customization
// Params 0, eflags: 0x1 linked
// Checksum 0x1210246a, Offset: 0x5998
// Size: 0x1ca
function __init__() {
    level.extra_cam_render_current_hero_headshot_func_callback = &process_current_hero_headshot_extracam_request;
    level.extra_cam_render_head_preview_func_callback = &process_head_preview_extracam_request;
    level.var_dda8e1d8 = &function_1c0ddf49;
    level.extra_cam_render_character_head_item_func_callback = &process_character_head_item_extracam_request;
    level.extra_cam_render_gender_func_callback = &process_gender_extracam_request;
    level.model_type_bones = [#"outfit_torso":"", #"outfit_legs":"", #"outfit_headgear":"", #"outfit_head":"", #"head":""];
    if (!isdefined(level.liveccdata)) {
        level.liveccdata = [];
    }
    if (!isdefined(level.custom_characters)) {
        level.custom_characters = [];
    }
    if (!isdefined(level.extra_cam_hero_data)) {
        level.extra_cam_hero_data = [];
    }
    if (!isdefined(level.extra_cam_headshot_hero_data)) {
        level.extra_cam_headshot_hero_data = [];
    }
    if (!isdefined(level.extra_cam_head_preview_data)) {
        level.extra_cam_head_preview_data = [];
    }
    if (!isdefined(level.extra_cam_gender_preview_data)) {
        level.extra_cam_gender_preview_data = [];
    }
    level.charactercustomizationsetup = &localclientconnect;
    level.var_6e23b0fc = [];
}

// Namespace character_customization/character_customization
// Params 1, eflags: 0x1 linked
// Checksum 0x7f257ed4, Offset: 0x5b70
// Size: 0x5e
function localclientconnect(localclientnum) {
    level.liveccdata[localclientnum] = setup_live_character_customization_target(localclientnum, "updateHero");
    level.staticccdata = setup_static_character_customization_target(localclientnum);
}

// Namespace character_customization/character_customization
// Params 3, eflags: 0x5 linked
// Checksum 0x8fbc87b7, Offset: 0x5bd8
// Size: 0xde
function private function_cb64c6d0(model_name, lod, mip) {
    if (!isdefined(level.var_6e23b0fc[model_name])) {
        level.var_6e23b0fc[model_name] = array();
    }
    if (!isdefined(level.var_6e23b0fc[model_name][lod])) {
        level.var_6e23b0fc[model_name][lod] = array();
    }
    if (!isdefined(level.var_6e23b0fc[model_name][lod][mip])) {
        level.var_6e23b0fc[model_name][lod][mip] = 0;
    }
}

// Namespace character_customization/character_customization
// Params 3, eflags: 0x1 linked
// Checksum 0x7ab960bf, Offset: 0x5cc0
// Size: 0xa4
function function_221a94ac(model_name, lod, mip) {
    if (!isdefined(model_name)) {
        return;
    }
    function_cb64c6d0(model_name, lod, mip);
    level.var_6e23b0fc[model_name][lod][mip]++;
    if (level.var_6e23b0fc[model_name][lod][mip] == 1) {
        forcestreamxmodel(model_name, lod, mip);
    }
}

// Namespace character_customization/character_customization
// Params 3, eflags: 0x5 linked
// Checksum 0x2248b81, Offset: 0x5d70
// Size: 0x9a
function private function_c358189(model_name, lod, mip) {
    if (!isdefined(model_name)) {
        return 1;
    }
    function_cb64c6d0(model_name, lod, mip);
    if (level.var_6e23b0fc[model_name][lod][mip] == 0) {
        function_221a94ac(model_name);
    }
    return forcestreamxmodel(model_name, lod, mip);
}

// Namespace character_customization/character_customization
// Params 3, eflags: 0x1 linked
// Checksum 0xa596b7d9, Offset: 0x5e18
// Size: 0x144
function function_247f6628(model_name, lod, mip) {
    if (!isdefined(model_name)) {
        return;
    }
    function_cb64c6d0(model_name, lod, mip);
    level.var_6e23b0fc[model_name][lod][mip]--;
    if (level.var_6e23b0fc[model_name][lod][mip] == 0) {
        stopforcestreamingxmodel(model_name);
        array::pop(level.var_6e23b0fc[model_name][lod], mip);
        if (level.var_6e23b0fc[model_name][lod].size == 0) {
            array::pop(level.var_6e23b0fc[model_name], lod);
            if (level.var_6e23b0fc[model_name].size == 0) {
                array::pop(level.var_6e23b0fc, model_name);
            }
        }
    }
}

// Namespace character_customization/character_customization
// Params 3, eflags: 0x1 linked
// Checksum 0xcc6ad13f, Offset: 0x5f68
// Size: 0x100
function function_dd295310(charactermodel, localclientnum, alt_render_mode = 1) {
    if (!isdefined(charactermodel)) {
        return undefined;
    }
    if (!isdefined(level.custom_characters[localclientnum])) {
        level.custom_characters[localclientnum] = [];
    }
    if (isdefined(level.custom_characters[localclientnum][charactermodel.targetname])) {
        return level.custom_characters[localclientnum][charactermodel.targetname];
    }
    var_c372a4ea = new class_7da27482();
    [[ var_c372a4ea ]]->function_7ed995de(localclientnum, charactermodel, alt_render_mode);
    level.custom_characters[localclientnum][charactermodel.targetname] = var_c372a4ea;
    return var_c372a4ea;
}

// Namespace character_customization/character_customization
// Params 3, eflags: 0x1 linked
// Checksum 0x8264c61f, Offset: 0x6070
// Size: 0x188
function function_aa5382ed(customization1, customization2, check_xuid = 1) {
    if (isdefined(customization1) != isdefined(customization2)) {
        return true;
    } else if (!isdefined(customization1)) {
        return false;
    }
    if (check_xuid && customization1.xuid !== customization2.xuid) {
        return true;
    }
    if (customization1.charactermode != customization2.charactermode) {
        return true;
    }
    if (customization1.charactertype != customization2.charactertype) {
        return true;
    }
    if (customization1.characterhead != customization2.characterhead) {
        return true;
    }
    if (customization1.outfit != customization2.outfit) {
        return true;
    }
    if (customization1.var_cfe86a3e != customization2.var_cfe86a3e) {
        return true;
    }
    for (i = 0; i < customization1.outfititems.size; i++) {
        if (customization1.outfititems[i] != customization2.outfititems[i]) {
            return true;
        }
    }
    return false;
}

// Namespace character_customization/character_customization
// Params 3, eflags: 0x1 linked
// Checksum 0x563ffd9b, Offset: 0x6200
// Size: 0x174
function function_7474681d(local_client_num, session_mode, character_index) {
    outfit_index = function_9ec573f1(local_client_num, session_mode, character_index);
    var_17b172ca = function_76fbb09e(local_client_num, session_mode, character_index);
    outfit_items = [];
    for (itemtype = 0; itemtype < 8; itemtype++) {
        var_9b90e15d = itemtype == 7 ? var_17b172ca : outfit_index;
        outfit_items[itemtype] = function_bd9a67ae(local_client_num, session_mode, character_index, var_9b90e15d, itemtype);
    }
    return {#outfititems:outfit_items, #warpaintoutfit:var_17b172ca, #outfit:outfit_index, #characterhead:getequippedheadindexforhero(local_client_num, session_mode), #charactertype:character_index, #charactermode:session_mode};
}

// Namespace character_customization/character_customization
// Params 2, eflags: 0x1 linked
// Checksum 0x21b737ea, Offset: 0x6380
// Size: 0xcc
function function_3f5625f1(mode, character_index = 1) {
    outfit_items = [];
    for (itemtype = 0; itemtype < 8; itemtype++) {
        outfit_items[itemtype] = 0;
    }
    return {#outfititems:outfit_items, #warpaintoutfit:0, #outfit:0, #characterhead:0, #charactertype:character_index, #charactermode:mode};
}

// Namespace character_customization/character_customization
// Params 5, eflags: 0x1 linked
// Checksum 0x47da341d, Offset: 0x6458
// Size: 0xb4
function play_intro_and_animation(origin, angles, intro_anim_name, anim_name, b_keep_link) {
    self notify("354f0097cb99821b");
    self endon("354f0097cb99821b");
    if (isdefined(intro_anim_name)) {
        self animation::play(intro_anim_name, origin, angles, 1, 0, 0, 0, b_keep_link);
    }
    if (isdefined(self)) {
        self animation::play(anim_name, origin, angles, 1, 0, 0, 0, b_keep_link);
    }
}

// Namespace character_customization/character_customization
// Params 2, eflags: 0x1 linked
// Checksum 0x59b86410, Offset: 0x6518
// Size: 0xb4
function setup_live_character_customization_target(localclientnum, notifyname) {
    characterent = getent(localclientnum, "character_customization", "targetname");
    if (isdefined(characterent)) {
        var_d0b01271 = function_dd295310(characterent, localclientnum, 1);
        [[ var_d0b01271 ]]->function_c0ccd9ea("char_customization");
        level thread updateeventthread(localclientnum, var_d0b01271, notifyname);
        return var_d0b01271;
    }
    return undefined;
}

// Namespace character_customization/character_customization
// Params 2, eflags: 0x0
// Checksum 0xd237a568, Offset: 0x65d8
// Size: 0x74
function update_locked_shader(localclientnum, params) {
    if (isdefined(params.isitemunlocked) && params.isitemunlocked != 1) {
        enablefrontendlockedweaponoverlay(localclientnum, 1);
        return;
    }
    enablefrontendlockedweaponoverlay(localclientnum, 0);
}

// Namespace character_customization/character_customization
// Params 4, eflags: 0x1 linked
// Checksum 0x1c0e1c7c, Offset: 0x6658
// Size: 0x3e
function function_bcc8bdf4(localclientnum, var_d0b01271, waitresult, params) {
    params.anim_name = [[ var_d0b01271 ]]->function_8144231c();
}

// Namespace character_customization/character_customization
// Params 4, eflags: 0x1 linked
// Checksum 0x315d426d, Offset: 0x66a0
// Size: 0xc16
function updateeventthread(localclientnum, var_d0b01271, notifyname, var_1d7f1597 = &function_bcc8bdf4) {
    while (true) {
        waitresult = undefined;
        waitresult = level waittill(notifyname + localclientnum);
        switch (waitresult.event_name) {
        case #"update_lcn":
            [[ var_d0b01271 ]]->function_e08bf4f2(waitresult.local_client_num);
            break;
        case #"update_locked":
            [[ var_d0b01271 ]]->function_7792df22(waitresult.locked);
            break;
        case #"refresh":
            [[ var_d0b01271 ]]->function_e08bf4f2(waitresult.local_client_num);
            [[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
            [[ var_d0b01271 ]]->function_225b6e07();
            [[ var_d0b01271 ]]->function_77e3be08();
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            if (isdefined(params.var_c76f3e47) && params.var_c76f3e47) {
                [[ var_d0b01271 ]]->function_27945cb8(1);
            }
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"refresh_anim":
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            params.var_99a89f83 = 1;
            if (isdefined(params.var_c76f3e47) && params.var_c76f3e47) {
                [[ var_d0b01271 ]]->function_27945cb8(1);
            }
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"changehero":
            [[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
            [[ var_d0b01271 ]]->set_character_index(waitresult.character_index);
            [[ var_d0b01271 ]]->function_77e3be08();
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            if (isdefined(params.var_c76f3e47) && params.var_c76f3e47) {
                [[ var_d0b01271 ]]->function_27945cb8(1);
            }
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"changegender":
            bodyindex = getfirstheroofgender(waitresult.gender, waitresult.mode);
            headindex = getfirstheadofgender(waitresult.gender, waitresult.mode);
            [[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
            [[ var_d0b01271 ]]->set_character_index(bodyindex);
            [[ var_d0b01271 ]]->function_77e3be08();
            [[ var_d0b01271 ]]->set_character_head(headindex);
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"changehead":
            [[ var_d0b01271 ]]->function_617a9ce4(waitresult.mode);
            [[ var_d0b01271 ]]->set_character_head(waitresult.head);
            params = {};
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"resetcharacter":
            [[ var_d0b01271 ]]->function_77e3be08();
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"changeoutfit":
            [[ var_d0b01271 ]]->set_character_outfit(waitresult.outfit_index);
            [[ var_d0b01271 ]]->function_10b0cbea();
            [[ var_d0b01271 ]]->function_59d1302f();
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            if (isdefined(params.var_c76f3e47) && params.var_c76f3e47) {
                [[ var_d0b01271 ]]->function_27945cb8(1);
            }
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"changewarpaintoutfit":
            [[ var_d0b01271 ]]->function_72be01b9();
            [[ var_d0b01271 ]]->function_158505aa(waitresult.outfit_index);
            [[ var_d0b01271 ]]->function_59d1302f();
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            if (isdefined(params.var_c76f3e47) && params.var_c76f3e47) {
                [[ var_d0b01271 ]]->function_27945cb8(1);
            }
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"changeoutfititem":
            [[ var_d0b01271 ]]->set_character_outfit_item(waitresult.item_index, waitresult.item_type);
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            if (isdefined(params.var_c76f3e47) && params.var_c76f3e47) {
                [[ var_d0b01271 ]]->function_27945cb8(1);
            }
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"hash_220546ce38834f4c":
            [[ var_d0b01271 ]]->function_ac9cc79d(waitresult.item_type);
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            if (isdefined(params.var_c76f3e47) && params.var_c76f3e47) {
                [[ var_d0b01271 ]]->function_27945cb8(1);
            }
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"updateface":
            [[ var_d0b01271 ]]->function_617a9ce4(waitresult.mode);
            thread [[ var_d0b01271 ]]->function_81d84c71();
            break;
        case #"previewshop":
        case #"previewshopface":
            [[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
            [[ var_d0b01271 ]]->set_character_index(waitresult.character_index);
            [[ var_d0b01271 ]]->set_character_outfit(waitresult.outfit_index);
            [[ var_d0b01271 ]]->function_158505aa(waitresult.outfit_index);
            outfititems = strtok(waitresult.outfititems, ";");
            foreach (type, item in outfititems) {
                [[ var_d0b01271 ]]->function_9146bf81(int(item), type);
            }
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            if (waitresult.event_name == "previewShopFace") {
                params.align_struct = struct::get(#"tag_align_quartermaster_character_head");
            }
            if (isdefined(params.var_c76f3e47) && params.var_c76f3e47) {
                [[ var_d0b01271 ]]->function_27945cb8(1);
            }
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"loadpreset":
            outfititems = strtok(waitresult.presets, ";");
            foreach (type, item in outfititems) {
                if (type != 7 && type != 1) {
                    [[ var_d0b01271 ]]->function_9146bf81(int(item), type);
                }
            }
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            if (isdefined(params.var_c76f3e47) && params.var_c76f3e47) {
                [[ var_d0b01271 ]]->function_27945cb8(1);
            }
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"previewshopgesture":
            [[ var_d0b01271 ]]->set_character_mode(waitresult.mode);
            [[ var_d0b01271 ]]->set_character_index(waitresult.character_index);
            [[ var_d0b01271 ]]->function_22039feb();
            params = {};
            [[ var_1d7f1597 ]](localclientnum, var_d0b01271, waitresult, params);
            if (isdefined(params.var_c76f3e47) && params.var_c76f3e47) {
                [[ var_d0b01271 ]]->function_27945cb8(1);
            }
            [[ var_d0b01271 ]]->update(params);
            break;
        case #"previewgesture":
            thread [[ var_d0b01271 ]]->play_gesture(waitresult.gesture_index, waitresult.wait_until_model_steam_ends, waitresult.replay_if_already_playing, waitresult.ignore_if_already_playing);
            break;
        case #"stopgesture":
            var_d0b01271 notify(#"cancel_gesture");
            break;
        case #"hide":
            [[ var_d0b01271 ]]->hide_model();
            break;
        case #"show":
            [[ var_d0b01271 ]]->show_model();
            break;
        }
    }
}

// Namespace character_customization/character_customization
// Params 3, eflags: 0x1 linked
// Checksum 0x947788e3, Offset: 0x72c0
// Size: 0x9a
function rotation_thread_spawner(localclientnum, var_d0b01271, endonevent) {
    if (!isdefined(endonevent)) {
        return;
    }
    baseangles = [[ var_d0b01271 ]]->function_217b10ed().angles;
    level update_model_rotation_for_right_stick(localclientnum, var_d0b01271, endonevent);
    level waittill(endonevent);
    if (![[ var_d0b01271 ]]->function_4a271da1()) {
        [[ var_d0b01271 ]]->function_217b10ed().angles = baseangles;
    }
}

// Namespace character_customization/character_customization
// Params 3, eflags: 0x5 linked
// Checksum 0xf72bd59, Offset: 0x7368
// Size: 0x1f0
function private update_model_rotation_for_right_stick(localclientnum, var_d0b01271, endonevent) {
    level endon(endonevent);
    while (true) {
        data_lcn = [[ var_d0b01271 ]]->function_690c9509();
        if (localclientnum == data_lcn && localclientactive(data_lcn) && ![[ var_d0b01271 ]]->function_4a271da1()) {
            model = [[ var_d0b01271 ]]->function_217b10ed();
            if (isdefined(model)) {
                pos = getcontrollerposition(data_lcn);
                change = isdefined(pos[#"rightstick"]) ? pos[#"rightstick"][0] : pos[#"look"][0];
                if (ispc()) {
                    pos = getxcammousecontrol(data_lcn);
                    change = change - pos[#"yaw"];
                }
                if (abs(change) > 0.0001) {
                    model.angles = (model.angles[0], absangleclamp360(model.angles[1] + change * 3), model.angles[2]);
                }
            }
        }
        waitframe(1);
    }
}

// Namespace character_customization/character_customization
// Params 1, eflags: 0x1 linked
// Checksum 0x3780c680, Offset: 0x7560
// Size: 0x18c
function setup_static_character_customization_target(localclientnum) {
    characterent = getent(localclientnum, "character_customization_staging", "targetname");
    level.extra_cam_hero_data[localclientnum] = setup_character_extracam_struct("ui_cam_character_customization", "cam_menu_unfocus", #"pb_cac_main_lobby_idle");
    level.extra_cam_headshot_hero_data[localclientnum] = setup_character_extracam_struct("ui_cam_char_identity", "cam_bust", #"pb_cac_vs_screen_idle_1");
    level.extra_cam_head_preview_data[localclientnum] = setup_character_extracam_struct("ui_cam_char_identity", "cam_bust", #"pb_cac_main_lobby_idle");
    level.extra_cam_gender_preview_data[localclientnum] = setup_character_extracam_struct("ui_cam_char_identity", "cam_bust", #"pb_cac_main_lobby_idle");
    if (isdefined(characterent)) {
        var_d0b01271 = function_dd295310(characterent, localclientnum);
        level thread update_character_extracam(localclientnum, var_d0b01271);
        return var_d0b01271;
    }
    return undefined;
}

// Namespace character_customization/character_customization
// Params 3, eflags: 0x1 linked
// Checksum 0xf290be5a, Offset: 0x76f8
// Size: 0x64
function setup_character_extracam_struct(xcam, subxcam, model_animation) {
    newstruct = {#anim_name:model_animation, #subxcam:subxcam, #xcam:xcam};
    return newstruct;
}

// Namespace character_customization/character_customization
// Params 3, eflags: 0x1 linked
// Checksum 0xee714c07, Offset: 0x7768
// Size: 0x3f8
function setup_character_extracam_settings(localclientnum, var_d0b01271, extracam_data_struct) {
    /#
        assert(isdefined(extracam_data_struct.jobindex));
    #/
    if (!isdefined(level.camera_ents)) {
        level.camera_ents = [];
    }
    initializedextracam = 0;
    camera_ent = isdefined(level.camera_ents[localclientnum]) ? level.camera_ents[localclientnum][extracam_data_struct.extracamindex] : undefined;
    if (!isdefined(camera_ent)) {
        initializedextracam = 1;
        multi_extracam::extracam_init_index(localclientnum, "character_staging_extracam" + extracam_data_struct.extracamindex + 1, extracam_data_struct.extracamindex);
        camera_ent = level.camera_ents[localclientnum][extracam_data_struct.extracamindex];
    }
    /#
        assert(isdefined(camera_ent));
    #/
    camera_ent playextracamxcam(extracam_data_struct.xcam, 0, extracam_data_struct.subxcam);
    params = {#hide_helmet:isdefined(extracam_data_struct.hidehelmet) && extracam_data_struct.hidehelmet, #sessionmode:extracam_data_struct.sessionmode, #extracam_data:extracam_data_struct, #anim_name:extracam_data_struct.anim_name};
    [[ var_d0b01271 ]]->function_79f89fb6(extracam_data_struct.sessionmode === 2);
    [[ var_d0b01271 ]]->set_alt_render_mode(0);
    [[ var_d0b01271 ]]->set_character_mode(extracam_data_struct.sessionmode);
    [[ var_d0b01271 ]]->set_character_index(extracam_data_struct.characterindex);
    if (isdefined(extracam_data_struct.isdefaulthero) && extracam_data_struct.isdefaulthero || isdefined(extracam_data_struct.defaultimagerender) && extracam_data_struct.defaultimagerender) {
        [[ var_d0b01271 ]]->function_22039feb();
    } else {
        [[ var_d0b01271 ]]->function_77e3be08();
        if (isdefined(extracam_data_struct.var_d3927004) && isdefined(extracam_data_struct.var_eb3dfef8)) {
            [[ var_d0b01271 ]]->set_character_outfit_item(extracam_data_struct.var_eb3dfef8, extracam_data_struct.var_d3927004);
        }
        if (isdefined(extracam_data_struct.useheadindex)) {
            [[ var_d0b01271 ]]->set_character_head(extracam_data_struct.useheadindex);
        }
    }
    [[ var_d0b01271 ]]->update(params);
    while (![[ var_d0b01271 ]]->is_streamed()) {
        waitframe(1);
    }
    if (isdefined(extracam_data_struct.defaultimagerender) && extracam_data_struct.defaultimagerender) {
        wait(0.5);
    } else {
        wait(0.1);
    }
    setextracamrenderready(extracam_data_struct.jobindex);
    extracam_data_struct.jobindex = undefined;
    level waittill("render_complete_" + localclientnum + "_" + extracam_data_struct.extracamindex);
    if (initializedextracam) {
        multi_extracam::extracam_reset_index(localclientnum, extracam_data_struct.extracamindex);
    }
    [[ var_d0b01271 ]]->function_79f89fb6(0);
}

// Namespace character_customization/character_customization
// Params 2, eflags: 0x1 linked
// Checksum 0x190334e, Offset: 0x7b68
// Size: 0x80
function update_character_extracam(localclientnum, var_d0b01271) {
    level endon(#"disconnect");
    while (true) {
        waitresult = undefined;
        waitresult = level waittill("process_character_extracam" + localclientnum);
        setup_character_extracam_settings(localclientnum, var_d0b01271, waitresult.extracam_data_struct);
    }
}

// Namespace character_customization/character_customization
// Params 6, eflags: 0x1 linked
// Checksum 0xa9664b3e, Offset: 0x7bf0
// Size: 0xf6
function process_current_hero_headshot_extracam_request(localclientnum, jobindex, extracamindex, sessionmode, characterindex, isdefaulthero) {
    level.extra_cam_headshot_hero_data[localclientnum].jobindex = jobindex;
    level.extra_cam_headshot_hero_data[localclientnum].extracamindex = extracamindex;
    level.extra_cam_headshot_hero_data[localclientnum].characterindex = characterindex;
    level.extra_cam_headshot_hero_data[localclientnum].isdefaulthero = isdefaulthero;
    level.extra_cam_headshot_hero_data[localclientnum].sessionmode = sessionmode;
    level notify("process_character_extracam" + localclientnum, {#extracam_data_struct:level.extra_cam_headshot_hero_data[localclientnum]});
}

// Namespace character_customization/character_customization
// Params 5, eflags: 0x1 linked
// Checksum 0xe446738e, Offset: 0x7cf0
// Size: 0x10e
function process_head_preview_extracam_request(localclientnum, jobindex, extracamindex, sessionmode, headindex) {
    level.extra_cam_head_preview_data[localclientnum].jobindex = jobindex;
    level.extra_cam_head_preview_data[localclientnum].extracamindex = extracamindex;
    level.extra_cam_head_preview_data[localclientnum].useheadindex = headindex;
    level.extra_cam_head_preview_data[localclientnum].characterindex = getfirstheroofgender(getheadgender(headindex, sessionmode), sessionmode);
    level.extra_cam_head_preview_data[localclientnum].sessionmode = sessionmode;
    level notify("process_character_extracam" + localclientnum, {#extracam_data_struct:level.extra_cam_outfit_preview_data[localclientnum]});
}

// Namespace character_customization/character_customization
// Params 9, eflags: 0x1 linked
// Checksum 0xd0abda5b, Offset: 0x7e08
// Size: 0x1ae
function function_1c0ddf49(localclientnum, jobindex, extracamindex, sessionmode, characterindex, outfitindex, itemtype, itemindex, defaultimagerender) {
    extracam_data = undefined;
    if (defaultimagerender) {
        extracam_data = setup_character_extracam_struct("ui_cam_char_customization_icons_render", "loot_body", #"pb_cac_vs_screen_idle_1");
        extracam_data.useheadindex = getfirstheadofgender(getherogender(characterindex, sessionmode), sessionmode);
    } else {
        extracam_data = setup_character_extracam_struct("ui_cam_char_customization_icons", "cam_body", #"pb_cac_vs_screen_idle_1");
    }
    extracam_data.jobindex = jobindex;
    extracam_data.extracamindex = extracamindex;
    extracam_data.sessionmode = sessionmode;
    extracam_data.characterindex = characterindex;
    extracam_data.outfitindex = outfitindex;
    extracam_data.var_d3927004 = itemtype;
    extracam_data.var_eb3dfef8 = itemindex;
    extracam_data.defaultimagerender = defaultimagerender;
    level notify("process_character_extracam" + localclientnum, {#extracam_data_struct:extracam_data});
}

// Namespace character_customization/character_customization
// Params 6, eflags: 0x1 linked
// Checksum 0xfaa7fcc, Offset: 0x7fc0
// Size: 0x176
function process_character_head_item_extracam_request(localclientnum, jobindex, extracamindex, sessionmode, headindex, defaultimagerender) {
    extracam_data = undefined;
    if (defaultimagerender) {
        extracam_data = setup_character_extracam_struct("ui_cam_char_customization_icons_render", "cam_head", #"pb_cac_vs_screen_idle_1");
    } else {
        extracam_data = setup_character_extracam_struct("ui_cam_char_customization_icons", "cam_head", #"pb_cac_vs_screen_idle_1");
    }
    extracam_data.jobindex = jobindex;
    extracam_data.extracamindex = extracamindex;
    extracam_data.sessionmode = sessionmode;
    extracam_data.useheadindex = headindex;
    extracam_data.hidehelmet = 1;
    extracam_data.defaultimagerender = defaultimagerender;
    extracam_data.characterindex = getfirstheroofgender(getheadgender(headindex, sessionmode), sessionmode);
    level notify("process_character_extracam" + localclientnum, {#extracam_data_struct:extracam_data});
}

// Namespace character_customization/character_customization
// Params 5, eflags: 0x1 linked
// Checksum 0x1d68a053, Offset: 0x8140
// Size: 0x10e
function process_gender_extracam_request(localclientnum, jobindex, extracamindex, sessionmode, gender) {
    level.extra_cam_gender_preview_data[localclientnum].jobindex = jobindex;
    level.extra_cam_gender_preview_data[localclientnum].extracamindex = extracamindex;
    level.extra_cam_gender_preview_data[localclientnum].useheadindex = getfirstheadofgender(gender, sessionmode);
    level.extra_cam_gender_preview_data[localclientnum].characterindex = getfirstheroofgender(gender, sessionmode);
    level.extra_cam_gender_preview_data[localclientnum].sessionmode = sessionmode;
    level notify("process_character_extracam" + localclientnum, {#extracam_data_struct:level.extra_cam_gender_preview_data[localclientnum]});
}


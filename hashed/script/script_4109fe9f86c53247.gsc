#using scripts\core_common\clientfield_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm\zm_orange_water;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_zonemgr;

#namespace namespace_73718f25;

// Namespace namespace_73718f25/namespace_73718f25
// Params 0, eflags: 0x2
// Checksum 0xf0929de1, Offset: 0x100
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_6aaf245219c6f125", &__init__, undefined, undefined);
}

// Namespace namespace_73718f25/namespace_73718f25
// Params 0, eflags: 0x1 linked
// Checksum 0xa38b122d, Offset: 0x148
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_4dad05c408e466f5", &on_begin, &on_end);
}

// Namespace namespace_73718f25/namespace_73718f25
// Params 1, eflags: 0x5 linked
// Checksum 0xf15b130d, Offset: 0x1b0
// Size: 0x1d8
function private on_begin(var_e84d35d1) {
    var_e9433d0 = struct::get_array(var_e84d35d1);
    assert(var_e9433d0.size, "<dev string:x38>");
    var_64e17761 = [];
    foreach (var_93154b10 in var_e9433d0) {
        assert(isdefined(var_93154b10.target), "<dev string:x67>");
        var_94d5ccbc = getentarray(var_93154b10.target, "targetname");
        var_64e17761 = arraycombine(var_64e17761, var_94d5ccbc, 0, 0);
    }
    level.var_64e17761 = var_64e17761;
    foreach (player in getplayers()) {
        player thread function_68b149a2(level.var_64e17761);
    }
}

// Namespace namespace_73718f25/namespace_73718f25
// Params 1, eflags: 0x5 linked
// Checksum 0x8d3de43d, Offset: 0x390
// Size: 0x8c
function private on_end(round_reset) {
    foreach (player in getplayers()) {
        player notify(#"hash_576884b397154a7d");
    }
}

// Namespace namespace_73718f25/namespace_73718f25
// Params 1, eflags: 0x1 linked
// Checksum 0xd5c669b7, Offset: 0x428
// Size: 0x2ac
function function_68b149a2(var_64e17761) {
    self notify("59cd2610cddc7a0b");
    self endon("59cd2610cddc7a0b");
    level endon(#"hash_7646638df88a3656");
    self endon(#"disconnect");
    wait 12;
    while (true) {
        var_4cda8676 = 0;
        foreach (var_c1f5749f in var_64e17761) {
            if (self istouching(var_c1f5749f)) {
                var_4cda8676 = 1;
                break;
            }
        }
        if (!var_4cda8676 && isalive(self) && !self laststand::player_is_in_laststand()) {
            if (!isdefined(self.var_86278a02) || self.var_86278a02 === 1) {
                self.var_86278a02 = 0;
                self clientfield::set_to_player("" + #"hash_13f1aaee7ebf9986", 1);
                self allowsprint(0);
                if (self issliding()) {
                    self setstance("crouch");
                }
                self allowslide(0);
                self thread function_7d81b8c1();
            }
            wait 1;
        } else {
            if (self.var_86278a02 === 0) {
                self.var_86278a02 = 1;
                self allowsprint(1);
                self allowslide(1);
                self thread function_d2dd1f2b();
                self clientfield::set_to_player("" + #"hash_13f1aaee7ebf9986", 0);
            }
            wait 1;
        }
        waitframe(1);
    }
}

// Namespace namespace_73718f25/namespace_73718f25
// Params 0, eflags: 0x1 linked
// Checksum 0x38a898b7, Offset: 0x6e0
// Size: 0x17c
function function_7d81b8c1() {
    level endon(#"end_game");
    self endon(#"death", #"hash_2580a60476ec7393");
    self notify(#"hash_56f565b20fbc0db");
    if (!isdefined(self.var_8b5609a4)) {
        self.var_8b5609a4 = 0;
    }
    while (true) {
        wait 1;
        self.var_8b5609a4++;
        if (self.var_2e6aa97d === 1) {
            var_24e0e73d = 15;
        } else {
            var_24e0e73d = 15;
        }
        if (self.var_8b5609a4 >= int(var_24e0e73d * 0.5)) {
            self thread zm_audio::create_and_play_dialog(#"freeze", #"start");
        }
        if (self.var_8b5609a4 >= var_24e0e73d) {
            waitframe(1);
            self thread function_202ee8fa();
            self thread zm_audio::create_and_play_dialog(#"freeze", #"frozen");
            self.var_8b5609a4 = 0;
            return;
        }
    }
}

// Namespace namespace_73718f25/namespace_73718f25
// Params 0, eflags: 0x1 linked
// Checksum 0x7cdc777e, Offset: 0x868
// Size: 0x3e4
function function_202ee8fa() {
    self endoncallback(&zm_orange_water::function_c64292f, #"death");
    self.var_7dc2d507 = 1;
    self notify(#"player_frozen");
    self zm_orange_water::function_bad6907c();
    self clientfield::set("" + #"hash_55543319943057f1", 1);
    self clientfield::set_to_player("" + #"hash_5160727729fd57a2", 1);
    t_ice = spawn("trigger_damage", self.origin, 0, 15, 72);
    t_ice enablelinkto();
    t_ice linkto(self);
    self.t_ice = t_ice;
    self thread zm_orange_water::function_872ec0b2(t_ice);
    if (isbot(self)) {
        self thread zm_orange_water::function_8eb7b0f7();
    } else {
        self thread zm_orange_water::function_6cadbaff();
    }
    if (self.var_d844486 !== 1) {
        self thread zm_equipment::show_hint_text(#"hash_4b6950ec49c7e04c", 3);
        self.var_d844486 = 1;
    }
    self waittill(#"hash_53bfad7081c69dee");
    self playsound(#"hash_2f8c9575cb36a298");
    self.var_7dc2d507 = 0;
    self zm_orange_water::function_46c3bbf7();
    self clientfield::set("" + #"hash_55543319943057f1", 0);
    self clientfield::set_to_player("" + #"hash_5160727729fd57a2", 0);
    self clientfield::set_to_player("" + #"hash_603fc9d210bdbc4d", 1);
    waitframe(2);
    self clientfield::set_to_player("" + #"hash_603fc9d210bdbc4d", 0);
    if (isdefined(t_ice)) {
        t_ice delete();
        self.t_ice = undefined;
    }
    self clientfield::set_to_player("" + #"hash_13f1aaee7ebf9986", 0);
    waitframe(2);
    self clientfield::set_to_player("" + #"hash_13f1aaee7ebf9986", 1);
    self allowsprint(0);
    if (self issliding()) {
        self setstance("crouch");
    }
    self allowslide(0);
    self thread function_7d81b8c1();
}

// Namespace namespace_73718f25/namespace_73718f25
// Params 0, eflags: 0x1 linked
// Checksum 0xb17970d9, Offset: 0xc58
// Size: 0xb4
function function_d2dd1f2b() {
    level endon(#"end_game");
    self endon(#"death", #"hash_56f565b20fbc0db");
    self notify(#"hash_2580a60476ec7393");
    if (!isdefined(self.var_36a93d1) || self.var_36a93d1 == 0) {
        return;
    }
    while (true) {
        wait 1;
        self.var_36a93d1--;
        if (self.var_36a93d1 <= 0) {
            self.var_36a93d1 = 0;
            return;
        }
    }
}


// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace zm_perk_ethereal_razor;

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0, eflags: 0x2
// Checksum 0x1175abb, Offset: 0x1c0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_ethereal_razor", &__init__, undefined, undefined);
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0, eflags: 0x1 linked
// Checksum 0xd137a0a0, Offset: 0x208
// Size: 0x31c
function __init__() {
    zm_perks::register_perk_clientfields(#"specialty_etherealrazor", &function_e4d3a447, &function_82460430);
    zm_perks::register_perk_effects(#"specialty_etherealrazor", "ethereal_razor_light");
    zm_perks::register_perk_init_thread(#"specialty_etherealrazor", &function_32981481);
    zm_perks::function_b60f4a9f(#"specialty_etherealrazor", #"p8_zm_vapor_altar_icon_01_etherealrazor", "zombie/fx8_perk_altar_symbol_ambient_ethereal_razor", #"zmperksetherealrazor");
    zm_perks::function_f3c80d73("zombie_perk_bottle_ethereal_razor", "zombie_perk_totem_ethereal_razor");
    clientfield::register("actor", "" + #"hash_29c26fb019da89f3", 13000, 1, "counter", &function_f041176c, 0, 0);
    clientfield::register("allplayers", "" + #"hash_450d9f824068dcc2", 13000, 1, "counter", &function_8f9318d5, 0, 0);
    clientfield::register("allplayers", "" + #"hash_4de2dbcd551f1fb7", 13000, 1, "counter", &function_680538e2, 0, 0);
    level._effect[#"hash_450693824062a9b0"] = #"hash_2e1db0f023ce973f";
    level._effect[#"hash_450d9f824068dcc2"] = #"hash_2e16c4f023c89a8d";
    level._effect[#"hash_5200740c0a0b2719"] = #"hash_2a3552f078e23d4e";
    level._effect[#"hash_4de2dbcd551f1fb7"] = #"hash_4741ce659d06a390";
    level._effect[#"hash_29c26fb019da89f3"] = #"hash_6e2b2bcea07134d1";
    callback::on_localplayer_spawned(&on_localplayer_spawned);
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 1, eflags: 0x1 linked
// Checksum 0x95efb974, Offset: 0x530
// Size: 0x24
function on_localplayer_spawned(localclientnum) {
    self thread function_58c4bf12(localclientnum);
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0, eflags: 0x1 linked
// Checksum 0xad225dfe, Offset: 0x560
// Size: 0x52
function function_32981481() {
    if (isdefined(level.enable_magic) && level.enable_magic) {
        level._effect[#"ethereal_razor_light"] = #"hash_1442db17b83460ad";
    }
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x5c0
// Size: 0x4
function function_e4d3a447() {
    
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x5d0
// Size: 0x4
function function_82460430() {
    
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 7, eflags: 0x1 linked
// Checksum 0x6a0a4192, Offset: 0x5e0
// Size: 0x74
function function_f041176c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, level._effect[#"hash_29c26fb019da89f3"], self, "tag_weapon_chest");
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 7, eflags: 0x1 linked
// Checksum 0xba2617da, Offset: 0x660
// Size: 0x11c
function function_8f9318d5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endoncallback(&function_e6bf47a3, #"death");
    level endoncallback(&function_e6bf47a3, #"demo_jump");
    self function_e6bf47a3();
    if (!self zm_utility::function_f8796df3(localclientnum)) {
        self.var_e59cd78 = util::playfxontag(localclientnum, level._effect[#"hash_4de2dbcd551f1fb7"], self, self function_a5b9c520(localclientnum));
        wait(0.3);
        self function_e6bf47a3();
    }
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 7, eflags: 0x1 linked
// Checksum 0x8cafb9ad, Offset: 0x788
// Size: 0x11c
function function_680538e2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endoncallback(&function_e6bf47a3, #"death");
    level endoncallback(&function_e6bf47a3, #"demo_jump");
    self function_e6bf47a3();
    if (!self zm_utility::function_f8796df3(localclientnum)) {
        self.var_e59cd78 = util::playfxontag(localclientnum, level._effect[#"hash_4de2dbcd551f1fb7"], self, self function_a5b9c520(localclientnum));
        wait(0.3);
        self function_e6bf47a3();
    }
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 1, eflags: 0x1 linked
// Checksum 0xeb492ad4, Offset: 0x8b0
// Size: 0x260
function function_58c4bf12(localclientnum) {
    self notify("74273462170704a3");
    self endon("74273462170704a3");
    self endoncallback(&function_c8066972, #"death");
    self function_c8066972();
    while (true) {
        waitresult = self waittill(#"notetrack");
        str_notetrack = waitresult.notetrack;
        if (str_notetrack === "razor_fx_on" && self hasperk(localclientnum, #"specialty_etherealrazor")) {
            w_current = getcurrentweaponincludingmelee(localclientnum);
            if (w_current === level.w_bowie_knife) {
                self.var_9f0aad27 = playviewmodelfx(localclientnum, level._effect[#"hash_5200740c0a0b2719"], "tag_weapon_left");
            } else if (w_current === level.var_b77d3496) {
                self.var_9f0aad27 = playviewmodelfx(localclientnum, level._effect[#"hash_450693824062a9b0"], "tag_weapon_right");
            } else {
                self.var_9f0aad27 = playviewmodelfx(localclientnum, level._effect[#"hash_450693824062a9b0"], "tag_weapon_left");
            }
            self playsound(localclientnum, #"hash_5e4e6d81b10399dc");
            self util::function_e532f5da(0.8, self, "notetrack", level, "demo_jump");
            self function_c8066972();
        }
    }
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 1, eflags: 0x1 linked
// Checksum 0xbdbc3a06, Offset: 0xb18
// Size: 0x46
function function_c8066972(str_notify) {
    if (isdefined(self.var_9f0aad27)) {
        deletefx(self.localclientnum, self.var_9f0aad27);
        self.var_9f0aad27 = undefined;
    }
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 1, eflags: 0x1 linked
// Checksum 0x744705f2, Offset: 0xb68
// Size: 0x46
function function_e6bf47a3(str_notify) {
    if (isdefined(self.var_e59cd78)) {
        deletefx(self.localclientnum, self.var_e59cd78);
        self.var_e59cd78 = undefined;
    }
}

// Namespace zm_perk_ethereal_razor/zm_perk_ethereal_razor
// Params 1, eflags: 0x1 linked
// Checksum 0x5043182f, Offset: 0xbb8
// Size: 0x62
function function_a5b9c520(localclientnum) {
    w_current = getcurrentweaponincludingmelee(localclientnum);
    str_tag = "tag_weapon_left";
    if (w_current === level.var_b77d3496) {
        str_tag = "tag_weapon_right";
    }
    return str_tag;
}


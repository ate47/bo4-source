#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\load;
#using scripts\zm_common\zm_bgb_pack;

#namespace bgb;

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x2
// Checksum 0x52beaef6, Offset: 0x1d8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"bgb", &__init__, &__main__, undefined);
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x0
// Checksum 0xce950ec3, Offset: 0x228
// Size: 0x252
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    level.weaponbgbgrab = getweapon(#"zombie_bgb_grab");
    callback::on_localclient_connect(&on_player_connect);
    level.bgb = [];
    level.bgb_pack = [];
    clientfield::register("clientuimodel", "zmhud.bgb_current", 1, 8, "int", &function_d9afd5ee, 0, 0);
    clientfield::register("clientuimodel", "zmhud.bgb_display", 1, 1, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "zmhud.bgb_timer", 1, 8, "float", undefined, 0, 0);
    clientfield::register("clientuimodel", "zmhud.bgb_activations_remaining", 1, 3, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "zmhud.bgb_invalid_use", 1, 1, "counter", undefined, 0, 0);
    clientfield::register("clientuimodel", "zmhud.bgb_one_shot_use", 1, 1, "counter", undefined, 0, 0);
    clientfield::register("toplayer", "bgb_blow_bubble", 1, 1, "counter", &bgb_blow_bubble, 0, 0);
    level._effect[#"bgb_blow_bubble"] = "zombie/fx_bgb_bubble_blow_zmb";
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x4
// Checksum 0xd5135ece, Offset: 0x488
// Size: 0x4c
function private __main__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    force_stream();
    bgb_finalize();
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x0
// Checksum 0xdd39031f, Offset: 0x4e0
// Size: 0x190
function force_stream() {
    var_45c85698 = array(getweapon(#"hash_d0f29de78e218ad"), getweapon(#"hash_5e07292c519531e6"), getweapon(#"hash_305e5faa9ecb625a"), getweapon(#"hash_23cc1f9c16b375c3"), getweapon(#"hash_155cc0a9ba3c3260"), getweapon(#"hash_2394c41f048f7d2"), getweapon(#"hash_4565adf3abc61ea3"));
    foreach (weapon in var_45c85698) {
        forcestreamxmodel(weapon.viewmodel);
        forcestreamxmodel(weapon.worldmodel);
    }
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x4
// Checksum 0xff043b53, Offset: 0x678
// Size: 0x44
function private on_player_connect(localclientnum) {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    self thread bgb_player_init(localclientnum);
}

// Namespace bgb/zm_bgb
// Params 1, eflags: 0x4
// Checksum 0xcfb7bb83, Offset: 0x6c8
// Size: 0x4e
function private bgb_player_init(localclientnum) {
    if (isdefined(level.bgb_pack[localclientnum])) {
        return;
    }
    level.bgb_pack[localclientnum] = getbubblegumpack(localclientnum);
}

// Namespace bgb/zm_bgb
// Params 0, eflags: 0x4
// Checksum 0x25f2d12, Offset: 0x720
// Size: 0x322
function private bgb_finalize() {
    level.var_afb8293c = [];
    level.var_afb8293c[0] = "base";
    level.var_afb8293c[1] = "pinwheel";
    level.var_afb8293c[2] = "speckled";
    level.var_afb8293c[3] = "shiny";
    level.var_afb8293c[5] = "swirl";
    level.var_afb8293c[4] = "swirl";
    level.var_afb8293c[6] = "swirl";
    level.bgb_item_index_to_name = [];
    foreach (v in level.bgb) {
        v.item_index = getitemindexfromref(v.name);
        var_ddcb67f4 = getunlockableiteminfofromindex(v.item_index, 2);
        var_5415dfb9 = function_b143666d(v.item_index, 2);
        if (!isdefined(var_ddcb67f4) || !isdefined(var_5415dfb9)) {
            println("<dev string:x38>" + v.name + "<dev string:x49>");
            continue;
        }
        if (!isdefined(var_5415dfb9.bgbrarity)) {
            var_5415dfb9.bgbrarity = 0;
        }
        v.rarity = var_5415dfb9.bgbrarity;
        if (0 == v.rarity || 1 == v.rarity) {
            v.consumable = 0;
        } else {
            v.consumable = 1;
        }
        v.camo_index = var_5415dfb9.var_daefc551;
        v.flying_gumball_tag = "tag_gumball_" + v.limit_type;
        v.var_c0362ae9 = "tag_gumball_" + v.limit_type + "_" + level.var_afb8293c[v.rarity];
        level.bgb_item_index_to_name[v.item_index] = v.name;
    }
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x0
// Checksum 0x93d9e479, Offset: 0xa50
// Size: 0x14e
function register(name, limit_type) {
    assert(isdefined(name), "<dev string:x79>");
    assert(#"none" != name, "<dev string:xa1>" + #"none" + "<dev string:xc5>");
    assert(!isdefined(level.bgb[name]), "<dev string:xfe>" + name + "<dev string:x117>");
    assert(isdefined(limit_type), "<dev string:xfe>" + name + "<dev string:x137>");
    level.bgb[name] = spawnstruct();
    level.bgb[name].name = name;
    level.bgb[name].limit_type = limit_type;
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x4
// Checksum 0x2a0b17, Offset: 0xba8
// Size: 0x19c
function private function_5e7b3f16(localclientnum, time) {
    self endon(#"death");
    if (isdemoplaying()) {
        return;
    }
    if (!isdefined(self.bgb) || !isdefined(level.bgb[self.bgb])) {
        return;
    }
    switch (level.bgb[self.bgb].limit_type) {
    case #"activated":
        color = (25, 0, 50) / 255;
        break;
    case #"event":
        color = (100, 50, 0) / 255;
        break;
    case #"rounds":
        color = (1, 149, 244) / 255;
        break;
    case #"time":
        color = (19, 244, 20) / 255;
        break;
    default:
        return;
    }
    self setcontrollerlightbarcolor(localclientnum, color);
    wait time;
    if (isdefined(self)) {
        self setcontrollerlightbarcolor(localclientnum);
    }
}

// Namespace bgb/zm_bgb
// Params 7, eflags: 0x4
// Checksum 0x1a792a31, Offset: 0xd50
// Size: 0x74
function private function_d9afd5ee(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self.bgb = level.bgb_item_index_to_name[newval];
    self thread function_5e7b3f16(localclientnum, 3);
}

// Namespace bgb/zm_bgb
// Params 2, eflags: 0x4
// Checksum 0x2c07fbf2, Offset: 0xdd0
// Size: 0x6a
function private function_f4763ffe(localclientnum, fx) {
    if (isdefined(self.var_629940ea)) {
        deletefx(localclientnum, self.var_629940ea, 1);
    }
    if (isdefined(fx)) {
        self.var_629940ea = playfxoncamera(localclientnum, fx);
    }
}

// Namespace bgb/zm_bgb
// Params 7, eflags: 0x4
// Checksum 0xd3f149e5, Offset: 0xe48
// Size: 0x8c
function private bgb_blow_bubble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_f4763ffe(localclientnum, level._effect[#"bgb_blow_bubble"]);
    self thread function_5e7b3f16(localclientnum, 0.5);
}


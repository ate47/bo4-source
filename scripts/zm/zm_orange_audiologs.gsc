#using scripts\zm\zm_hms_util.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_item_pickup.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_orange_audiologs;

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0x3fe52fcf, Offset: 0x1a0
// Size: 0x44
function preload() {
    clientfield::register("scriptmover", "" + #"hash_4a18e1ea1950215d", 24000, 1, "int");
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0xbd1e043c, Offset: 0x1f0
// Size: 0x8c
function init() {
    level.s_audiologs = spawnstruct();
    if (zm_utility::is_ee_enabled()) {
        init_records();
        function_d6fec498();
        function_ecba80df();
        function_922ff46a();
        init_orbs();
    }
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0xd22b8eac, Offset: 0x288
// Size: 0x244
function init_records() {
    level.s_audiologs.s_records = spawnstruct();
    level.s_audiologs.s_records.n_collected = 0;
    level.s_audiologs.s_records.n_played = 0;
    level.s_audiologs.s_records.a_str_vox = array(#"hash_30b1f52eee1181a1", #"hash_30b1f22eee117c88", #"hash_30b1f32eee117e3b", #"hash_30b1f82eee1186ba", #"hash_15353a598abe2499");
    var_f9d547ec = getentarray("audiolog_record", "targetname");
    array::run_all(var_f9d547ec, &zm_item_pickup::create_item_pickup, &pickup_record, "", undefined, 96);
    level.s_audiologs.s_records.s_playback = struct::get("audiolog_record_player");
    level.s_audiologs.s_records.var_d9a8e3e4 = getent(level.s_audiologs.s_records.s_playback.target, "targetname");
    level.s_audiologs.s_records.var_d9a8e3e4 hide();
    level.s_audiologs.s_records.s_playback zm_unitrigger::create(&function_4164ac1d);
    level.s_audiologs.s_records.s_playback thread function_aef698f1();
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 2, eflags: 0x1 linked
// Checksum 0x4ef37f4c, Offset: 0x4d8
// Size: 0x88
function pickup_record(e_item, e_player) {
    /#
        iprintln("<dev string:x38>" + level.s_audiologs.s_records.n_collected);
    #/
    e_item playsound(#"hash_760800881cd94dd1");
    level.s_audiologs.s_records.n_collected++;
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0xbe327bb, Offset: 0x568
// Size: 0x18c
function function_6ad87fb1() {
    self endon(#"death");
    n_id = level.s_audiologs.s_records.n_played;
    level.s_audiologs.s_records.n_played++;
    /#
        iprintln("<dev string:x53>" + n_id);
    #/
    level.s_audiologs.s_records.var_d9a8e3e4 show();
    wait(1);
    level.s_audiologs.s_records.var_d9a8e3e4 rotatevelocity((0, 200, 0), 600);
    zm_hms_util::function_e308175e(level.s_audiologs.s_records.a_str_vox[n_id], self.origin);
    level.s_audiologs.s_records.var_d9a8e3e4 rotatevelocity((0, 200, 0), 1);
    wait(2);
    level.s_audiologs.s_records.var_d9a8e3e4 hide();
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 1, eflags: 0x1 linked
// Checksum 0xe7631adc, Offset: 0x700
// Size: 0x40
function function_4164ac1d(e_player) {
    return level.s_audiologs.s_records.n_collected > level.s_audiologs.s_records.n_played;
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0x862f04bf, Offset: 0x748
// Size: 0x48
function function_aef698f1() {
    self endon(#"death");
    while (true) {
        self waittill(#"trigger_activated");
        self function_6ad87fb1();
    }
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0x8e371ca5, Offset: 0x798
// Size: 0x1dc
function function_d6fec498() {
    level.s_audiologs.s_reels = spawnstruct();
    level.s_audiologs.s_reels.n_collected = 0;
    level.s_audiologs.s_reels.n_played = 0;
    level.s_audiologs.s_reels.a_str_vox = array(#"hash_6fce75e5c4fe6210", #"hash_172aa60779a37741", #"hash_2388426b6c075d62", #"hash_1a1854072d6b2453", #"hash_23883c6b6c075330", #"hash_23883f6b6c075849");
    var_d1c55c66 = getentarray("audiolog_reel", "targetname");
    array::run_all(var_d1c55c66, &zm_item_pickup::create_item_pickup, &pickup_reel, "", undefined, 96);
    level.s_audiologs.s_reels.s_playback = struct::get("audiolog_reel_player");
    level.s_audiologs.s_reels.s_playback zm_unitrigger::create(&function_90b10d7);
    level.s_audiologs.s_reels.s_playback thread function_62fea2fe();
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 2, eflags: 0x1 linked
// Checksum 0xb4fe3ea6, Offset: 0x980
// Size: 0x88
function pickup_reel(e_item, e_player) {
    /#
        iprintln("<dev string:x6c>" + level.s_audiologs.s_reels.n_collected);
    #/
    e_item playsound(#"hash_760800881cd94dd1");
    level.s_audiologs.s_reels.n_collected++;
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0x85841818, Offset: 0xa10
// Size: 0x114
function doa_streak_udem() {
    self endon(#"death");
    n_id = level.s_audiologs.s_reels.n_played;
    level.s_audiologs.s_reels.n_played++;
    /#
        iprintln("<dev string:x85>" + n_id);
    #/
    exploder::exploder("fxexp_script_projector_off");
    exploder::exploder("fxexp_script_projector_on");
    zm_hms_util::function_e308175e(level.s_audiologs.s_reels.a_str_vox[n_id], self.origin);
    exploder::stop_exploder("fxexp_script_projector_off");
    exploder::stop_exploder("fxexp_script_projector_on");
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 1, eflags: 0x1 linked
// Checksum 0x12e12f5d, Offset: 0xb30
// Size: 0x40
function function_90b10d7(e_player) {
    return level.s_audiologs.s_reels.n_collected > level.s_audiologs.s_reels.n_played;
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0x5447cb96, Offset: 0xb78
// Size: 0x48
function function_62fea2fe() {
    self endon(#"death");
    while (true) {
        self waittill(#"trigger_activated");
        self doa_streak_udem();
    }
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0x207e232d, Offset: 0xbc8
// Size: 0xec
function function_ecba80df() {
    level.s_audiologs.var_29f70993 = array(#"hash_4e502bf48420789b", #"hash_36a4134f1eed7a5e", #"hash_36a4144f1eed7c11", #"hash_3b6e2bba7d44fa78", #"hash_45a63a79ad46af7");
    var_311159c3 = getentarray("audiolog_russian", "targetname");
    array::run_all(var_311159c3, &zm_unitrigger::create, "", 96);
    array::thread_all(var_311159c3, &function_4a547e41);
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0x9aaa5468, Offset: 0xcc0
// Size: 0xec
function function_4a547e41() {
    self endon(#"death");
    self hidepart("tag_light");
    self waittill(#"trigger_activated");
    /#
        iprintln("<dev string:x9c>" + self.script_int);
    #/
    self showpart("tag_light");
    self zm_hms_util::function_e308175e(level.s_audiologs.var_29f70993[self.script_int], self.origin);
    self hidepart("tag_light");
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0x4e997c16, Offset: 0xdb8
// Size: 0xe4
function function_922ff46a() {
    level.s_audiologs.var_bc136840 = array(#"hash_5f4b3985abc17212", #"hash_5f4b3885abc1705f", #"hash_5f4b3785abc16eac", #"hash_5f4b3685abc16cf9", #"hash_5f4b3585abc16b46");
    var_b41e84c = struct::get_array("audiolog_pablo");
    array::run_all(var_b41e84c, &zm_unitrigger::create, "", 96);
    array::thread_all(var_b41e84c, &function_a8be9b98);
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0x18528f9, Offset: 0xea8
// Size: 0xdc
function function_a8be9b98() {
    self endon(#"death");
    self waittill(#"trigger_activated");
    /#
        iprintln("<dev string:xb9>" + self.script_int);
    #/
    s_scene = struct::get(self.target);
    s_scene thread scene::play();
    self zm_hms_util::function_e308175e(level.s_audiologs.var_bc136840[self.script_int], self.origin);
    s_scene thread scene::stop();
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0xae4ecc96, Offset: 0xf90
// Size: 0xac
function init_orbs() {
    level.s_audiologs.var_7ab3422d = array(#"hash_60d74e6165b011e6", #"hash_60d74d6165b01033", #"hash_60d74c6165b00e80", #"hash_60d7536165b01a65");
    a_e_orbs = getentarray("audiolog_orb", "targetname");
    array::run_all(a_e_orbs, &setup_orb);
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0x3ba99c8a, Offset: 0x1048
// Size: 0x6c
function setup_orb() {
    self setcandamage(1);
    self.allowdeath = 0;
    self thread function_530a6195();
    self clientfield::set("" + #"hash_4a18e1ea1950215d", 1);
}

// Namespace zm_orange_audiologs/zm_orange_audiologs
// Params 0, eflags: 0x1 linked
// Checksum 0xbfba48f3, Offset: 0x10c0
// Size: 0xcc
function function_530a6195() {
    self endon(#"death");
    self waittill(#"damage");
    self setcandamage(0);
    self.allowdeath = 1;
    /#
        iprintln("<dev string:xd4>" + self.script_int);
    #/
    self zm_hms_util::function_e308175e(level.s_audiologs.var_7ab3422d[self.script_int], self.origin);
    self delete();
}


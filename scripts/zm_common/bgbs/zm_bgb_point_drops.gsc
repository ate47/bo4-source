#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_bgb_point_drops;

// Namespace zm_bgb_point_drops/zm_bgb_point_drops
// Params 0, eflags: 0x2
// Checksum 0x8244f3be, Offset: 0xb8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_point_drops", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_point_drops/zm_bgb_point_drops
// Params 0, eflags: 0x1 linked
// Checksum 0x11e3193a, Offset: 0x108
// Size: 0xfc
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_point_drops", "activated", 1, undefined, undefined, &validation, &activation);
    bgb_pack::function_9d4db403(#"zm_bgb_point_drops", 5);
    bgb_pack::function_430d063b(#"zm_bgb_point_drops");
    bgb_pack::function_a1194b9a(#"zm_bgb_point_drops");
    bgb_pack::function_4de6c08a(#"zm_bgb_point_drops");
}

// Namespace zm_bgb_point_drops/zm_bgb_point_drops
// Params 0, eflags: 0x1 linked
// Checksum 0x527da651, Offset: 0x210
// Size: 0x3c
function activation() {
    self zm_score::minus_to_player_score(500);
    self thread bgb::function_c6cd71d5("bonus_points_player_shared");
}

// Namespace zm_bgb_point_drops/zm_bgb_point_drops
// Params 0, eflags: 0x1 linked
// Checksum 0x12cd187a, Offset: 0x258
// Size: 0x40
function validation() {
    if (self zm_score::can_player_purchase(500) && self bgb::function_9d8118f5()) {
        return true;
    }
    return false;
}


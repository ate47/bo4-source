#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_crawl_space;

// Namespace zm_bgb_crawl_space/zm_bgb_crawl_space
// Params 0, eflags: 0x2
// Checksum 0x86b89f07, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_crawl_space", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_crawl_space/zm_bgb_crawl_space
// Params 0, eflags: 0x0
// Checksum 0xd7d0fa96, Offset: 0xe0
// Size: 0x64
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_crawl_space", "activated", 1, undefined, undefined, undefined, &activation);
}

// Namespace zm_bgb_crawl_space/zm_bgb_crawl_space
// Params 0, eflags: 0x0
// Checksum 0xbb617b33, Offset: 0x150
// Size: 0x116
function activation() {
    a_ai = getaiarray();
    for (i = 0; i < a_ai.size; i++) {
        if (isdefined(a_ai[i]) && isalive(a_ai[i]) && a_ai[i].archetype === #"zombie" && isdefined(a_ai[i].gibdef)) {
            var_aa4b65bc = distancesquared(self.origin, a_ai[i].origin);
            if (var_aa4b65bc < 360000) {
                a_ai[i] zombie_utility::makezombiecrawler();
            }
        }
    }
}


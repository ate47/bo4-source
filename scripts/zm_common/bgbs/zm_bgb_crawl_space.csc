// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_bgb.csc;
#include scripts/core_common/system_shared.csc;

#namespace zm_bgb_crawl_space;

// Namespace zm_bgb_crawl_space/zm_bgb_crawl_space
// Params 0, eflags: 0x2
// Checksum 0x14cd8bc8, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_crawl_space", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_crawl_space/zm_bgb_crawl_space
// Params 0, eflags: 0x1 linked
// Checksum 0xc98f3f23, Offset: 0xd8
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_crawl_space", "activated");
}


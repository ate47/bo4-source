#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;
#using scripts\zm_common\zm_utility;

#namespace zm_ffotd;

// Namespace zm_ffotd/zm_ffotd
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x88
// Size: 0x4
function main_start() {
    
}

// Namespace zm_ffotd/zm_ffotd
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x98
// Size: 0x4
function main_end() {
    
}

// Namespace zm_ffotd/zm_ffotd
// Params 0, eflags: 0x0
// Checksum 0xff686be8, Offset: 0xa8
// Size: 0x68
function optimize_for_splitscreen() {
    if (!isdefined(level.var_58def399)) {
        level.var_58def399 = 3;
    }
    if (level.var_58def399) {
        if (getdvarint(#"splitscreen_playercount", 0) >= level.var_58def399) {
            return true;
        }
    }
    return false;
}


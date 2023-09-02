// Atian COD Tools GSC decompiler test
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\struct.csc;

#namespace mp_nuketown_4_fx;

// Namespace mp_nuketown_4_fx/mp_nuketown_4_fx
// Params 0, eflags: 0x1 linked
// Checksum 0x5055d953, Offset: 0x88
// Size: 0xc4
function main() {
    setsaveddvar(#"enable_global_wind", 1);
    setsaveddvar(#"wind_global_vector", "88 0 0");
    setsaveddvar(#"wind_global_low_altitude", 0);
    setsaveddvar(#"wind_global_hi_altitude", 10000);
    setsaveddvar(#"wind_global_low_strength_percent", 100);
}


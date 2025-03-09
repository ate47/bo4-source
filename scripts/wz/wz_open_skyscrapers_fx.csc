#namespace wz_open_skyscrapers_fx;

// Namespace wz_open_skyscrapers_fx/wz_open_skyscrapers_fx
// Params 0, eflags: 0x0
// Checksum 0xdbc59291, Offset: 0x78
// Size: 0xc4
function main() {
    setsaveddvar(#"enable_global_wind", 1);
    setsaveddvar(#"wind_global_vector", "88 0 0");
    setsaveddvar(#"wind_global_low_altitude", 0);
    setsaveddvar(#"wind_global_hi_altitude", 10000);
    setsaveddvar(#"wind_global_low_strength_percent", 100);
}


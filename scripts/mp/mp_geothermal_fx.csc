#namespace mp_geothermal_fx;

// Namespace mp_geothermal_fx/mp_geothermal_fx
// Params 0
// Checksum 0x5055d953, Offset: 0x78
// Size: 0xc4
function main()
{
    setsaveddvar( #"enable_global_wind", 1 );
    setsaveddvar( #"wind_global_vector", "88 0 0" );
    setsaveddvar( #"wind_global_low_altitude", 0 );
    setsaveddvar( #"wind_global_hi_altitude", 10000 );
    setsaveddvar( #"wind_global_low_strength_percent", 100 );
}


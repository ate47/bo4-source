#using scripts\core_common\util_shared;
#using scripts\mp_common\gametypes\ct_tutorial_skirmish;

#namespace conf;

// Namespace conf/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x9e2d1e35, Offset: 0x78
// Size: 0x354
function event_handler[gametype_init] main( eventstruct )
{
    if ( util::function_8570168d() )
    {
        ct_tutorial_skirmish::init();
    }
    
    forcestreamxmodel( #"hash_7a65efdf091dd1ab", 8, -1 );
    forcestreamxmodel( #"hash_38504bb508f6c76", 8, -1 );
    forcestreamxmodel( #"hash_3226f184b0cdfbc0", 8, -1 );
    forcestreamxmodel( #"hash_7e9b68cddcd40c54", 8, -1 );
    forcestreamxmodel( #"hash_1bc831f9eeaaf730", 8, -1 );
    forcestreamxmodel( #"hash_56d109b8fddb8ed9", 8, -1 );
    forcestreamxmodel( #"hash_4049f47bae095ccc", 8, -1 );
    forcestreamxmodel( #"hash_c1f117afe7bc3e7", 8, -1 );
    forcestreamxmodel( #"hash_2c0bb1840a08c3c", 8, -1 );
    forcestreamxmodel( #"hash_60cc003da266e29b", 8, -1 );
    forcestreamxmodel( #"hash_846064366f9c96", 8, -1 );
    forcestreamxmodel( #"hash_2b2d8e231fe176a1", 8, -1 );
    forcestreamxmodel( #"hash_69f0f18339ea342f", 8, -1 );
    forcestreamxmodel( #"hash_4b77b871246789e7", 8, -1 );
    forcestreamxmodel( #"hash_44d5ea01b7d04daf", 8, -1 );
    forcestreamxmodel( #"hash_7601ce85023e827e", 8, -1 );
    forcestreamxmodel( #"hash_470554957716404b", 8, -1 );
    forcestreamxmodel( #"hash_2a3f1ff28606f64e", 8, -1 );
    forcestreamxmodel( #"hash_16374a7b269f0f65", 8, -1 );
    forcestreamxmodel( #"hash_32c5be3d2259c7e2", 8, -1 );
}


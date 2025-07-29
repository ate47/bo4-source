#using scripts\core_common\animation_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace namespace_273ad667;

// Namespace namespace_273ad667/namespace_273ad667
// Params 0, eflags: 0x2
// Checksum 0xb1a8e7fa, Offset: 0x1b0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"hash_1f7228023b83d053", &__init__, undefined, undefined );
}

// Namespace namespace_273ad667/namespace_273ad667
// Params 0
// Checksum 0xe6c6a80e, Offset: 0x1f8
// Size: 0x21a
function __init__()
{
    clientfield::register( "toplayer", "" + #"place_spoon", 1, 1, "int", &function_9e8baed0, 0, 0 );
    clientfield::register( "toplayer", "" + #"fill_blood", 1, 4, "int", &function_f72f97af, 0, 0 );
    clientfield::register( "toplayer", "" + #"hash_2058d8d474a6b3e1", 1, 1, "int", &function_b42c46e3, 0, 0 );
    clientfield::register( "toplayer", "" + #"hash_cc5b97a575d4d6d", 1, 1, "int", &function_f4b5e072, 0, 0 );
    clientfield::register( "world", "" + #"hash_ef497244490a0fc", 1, 3, "int", &function_1d683667, 0, 0 );
    level._effect[ #"spk_glint" ] = #"zombie/fx_bmode_glint_hook_zod_zmb";
    level._effect[ #"hash_7bd7f11175082774" ] = #"hash_aca33e8f743523b";
}

// Namespace namespace_273ad667/namespace_273ad667
// Params 7
// Checksum 0xe7b3ce5e, Offset: 0x420
// Size: 0x11c
function function_9e8baed0( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( !isdefined( self.var_a57cfdf7 ) )
    {
        var_5980d6d5 = struct::get( "s_firm_place_trig" );
        self.var_a57cfdf7 = util::spawn_model( localclientnum, var_5980d6d5.model, var_5980d6d5.origin, var_5980d6d5.angles );
    }
    
    if ( newval )
    {
        self.var_a57cfdf7 show();
        playsound( localclientnum, "zmb_spoon_into_tub", self.var_a57cfdf7.origin );
        return;
    }
    
    self.var_a57cfdf7 hide();
}

// Namespace namespace_273ad667/namespace_273ad667
// Params 7
// Checksum 0xec43922e, Offset: 0x548
// Size: 0x4ca
function function_f72f97af( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self endoncallback( &function_f8f90b83, #"disconnect" );
    
    if ( !isdefined( level.var_a8f38afe ) )
    {
        level.var_a8f38afe = [];
    }
    
    var_e52613c7 = struct::get( "scn_filler_up" );
    
    if ( !isdefined( level.var_a8f38afe[ localclientnum ] ) )
    {
        level.var_a8f38afe[ localclientnum ] = util::spawn_anim_model( localclientnum, "p8_fxanim_zm_esc_bathtub_filling_mod", var_e52613c7.origin, var_e52613c7.angles );
        
        if ( !isdefined( level.var_a8f38afe[ localclientnum ] ) )
        {
            return;
        }
    }
    
    level.var_a8f38afe[ localclientnum ] endon( #"death" );
    
    switch ( newval )
    {
        case 1:
            level.var_a8f38afe[ localclientnum ] thread animation::play( #"hash_5f152090f657bfe" );
            break;
        case 2:
            level.var_a8f38afe[ localclientnum ] animation::play( #"hash_6f7a3a7c471df0f2" );
            level.var_a8f38afe[ localclientnum ] thread animation::play( #"hash_2e86999bc8c4290d" );
            break;
        case 3:
            level.var_a8f38afe[ localclientnum ] animation::play( #"hash_6f7a397c471def3f" );
            level.var_a8f38afe[ localclientnum ] thread animation::play( #"hash_2e86969bc8c423f4" );
            break;
        case 4:
            level.var_a8f38afe[ localclientnum ] animation::play( #"hash_6f7a387c471ded8c" );
            level.var_a8f38afe[ localclientnum ] thread animation::play( #"hash_2e86979bc8c425a7" );
            break;
        case 5:
            level.var_a8f38afe[ localclientnum ] animation::play( #"hash_6f7a377c471debd9" );
            level.var_a8f38afe[ localclientnum ] thread animation::play( #"hash_2e86949bc8c4208e" );
            break;
        case 6:
            level.var_a8f38afe[ localclientnum ] animation::play( #"hash_6f7a367c471dea26" );
            level.var_a8f38afe[ localclientnum ] thread animation::play( #"hash_2e86959bc8c42241" );
            break;
        case 7:
            level.var_a8f38afe[ localclientnum ] animation::play( #"hash_6f7a357c471de873" );
            level.var_a8f38afe[ localclientnum ] thread animation::play( #"hash_4a67388210398d52" );
            break;
        case 8:
            level.var_a8f38afe[ localclientnum ] animation::play( #"hash_4e65f766225b67df" );
            level.var_a8f38afe[ localclientnum ] thread animation::play( #"hash_5f152090f657bfe" );
            break;
    }
}

// Namespace namespace_273ad667/namespace_273ad667
// Params 1, eflags: 0x4
// Checksum 0xa52a9d3e, Offset: 0xa20
// Size: 0x74
function private function_f8f90b83( var_c34665fc )
{
    localclientnum = self getlocalclientnumber();
    
    if ( isdefined( level.var_a8f38afe[ localclientnum ] ) )
    {
        level.var_a8f38afe[ localclientnum ] delete();
        level.var_a8f38afe[ localclientnum ] = undefined;
    }
}

// Namespace namespace_273ad667/namespace_273ad667
// Params 7
// Checksum 0xa7067f27, Offset: 0xaa0
// Size: 0x1fc
function function_b42c46e3( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        var_dd9f87c6 = struct::get( "s_s_t_loc" );
        self.var_17825742 = util::spawn_model( localclientnum, var_dd9f87c6.model, var_dd9f87c6.origin, var_dd9f87c6.angles );
        self.var_17825742.var_e88acf63 = self.var_17825742 gettagorigin( "tag_spork" );
        self.var_17825742.var_a9a3211a = self.var_17825742 gettagangles( "tag_spork" );
        self.mdl_spork = util::spawn_model( localclientnum, "wpn_t8_zm_spork_world", self.var_17825742.var_e88acf63, self.var_17825742.var_a9a3211a );
        var_fcec724a = struct::get( "s_sp_fx_glint_loc" );
        self.var_4e35f286 = playfx( localclientnum, level._effect[ #"spk_glint" ], var_fcec724a.origin );
        return;
    }
    
    if ( isdefined( self.mdl_spork ) )
    {
        self.mdl_spork delete();
    }
    
    if ( isdefined( self.var_4e35f286 ) )
    {
        stopfx( localclientnum, self.var_4e35f286 );
    }
}

// Namespace namespace_273ad667/namespace_273ad667
// Params 7
// Checksum 0xd378b571, Offset: 0xca8
// Size: 0x462
function function_1d683667( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    hitoffset = ( randomfloatrange( -5, 5 ), randomfloatrange( -5, 5 ), randomfloatrange( -5, 5 ) );
    
    switch ( newval )
    {
        case 1:
            var_90c27c24 = struct::get( "s_metal_01", "targetname" );
            var_10cdf6db = struct::get( var_90c27c24.target, "targetname" );
            force_vector = var_10cdf6db.origin - var_90c27c24.origin;
            var_76803b4f = vectornormalize( force_vector );
            var_c0d1f7aa = createdynentandlaunch( localclientnum, var_90c27c24.model, var_90c27c24.origin, var_90c27c24.angles, hitoffset, 4 * var_76803b4f );
            break;
        case 2:
            var_90c27c24 = struct::get( "s_metal_02", "targetname" );
            var_10cdf6db = struct::get( var_90c27c24.target, "targetname" );
            force_vector = var_10cdf6db.origin - var_90c27c24.origin;
            var_76803b4f = vectornormalize( force_vector );
            var_b210da28 = createdynentandlaunch( localclientnum, var_90c27c24.model, var_90c27c24.origin, var_90c27c24.angles, hitoffset, 4 * var_76803b4f );
            break;
        case 3:
            var_90c27c24 = struct::get( "s_metal_03", "targetname" );
            var_10cdf6db = struct::get( var_90c27c24.target, "targetname" );
            force_vector = var_10cdf6db.origin - var_90c27c24.origin;
            var_76803b4f = vectornormalize( force_vector );
            var_5b63accf = createdynentandlaunch( localclientnum, var_90c27c24.model, var_90c27c24.origin, var_90c27c24.angles, hitoffset, 4 * var_76803b4f );
            break;
        case 4:
            var_90c27c24 = struct::get( "s_metal_04", "targetname" );
            var_10cdf6db = struct::get( var_90c27c24.target, "targetname" );
            force_vector = var_10cdf6db.origin - var_90c27c24.origin;
            var_76803b4f = vectornormalize( force_vector );
            var_4e9d9343 = createdynentandlaunch( localclientnum, var_90c27c24.model, var_90c27c24.origin, var_90c27c24.angles, hitoffset, 4 * var_76803b4f );
            break;
    }
}

// Namespace namespace_273ad667/namespace_273ad667
// Params 7
// Checksum 0xaedf8254, Offset: 0x1118
// Size: 0xda
function function_f4b5e072( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( isdefined( self.var_d27c5165 ) )
    {
        stopfx( localclientnum, self.var_d27c5165 );
        self.var_d27c5165 = undefined;
    }
    
    if ( newval )
    {
        s_origin = struct::get( "s_break_large_metal" );
        self.var_d27c5165 = playfx( localclientnum, level._effect[ #"hash_7bd7f11175082774" ], s_origin.origin );
    }
}


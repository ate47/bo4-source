#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\values_shared;
#using scripts\mp_common\gametypes\ct_gadgets;
#using scripts\mp_common\gametypes\ct_utils;
#using scripts\mp_common\gametypes\ct_vo;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\gametypes\round;

#namespace ct_ui;

// Namespace ct_ui/ct_ui
// Params 1
// Checksum 0x5414ee99, Offset: 0x168
// Size: 0x3ec
function function_6889bb61( var_74d544ba )
{
    self endon( #"death" );
    self thread ct_utils::function_f03da80a();
    
    if ( !level flag::exists( "desc_fillup_gadgets" ) )
    {
        level flag::init( "desc_fillup_gadgets" );
    }
    
    if ( !level flag::exists( "desc_countdown_start" ) )
    {
        level flag::init( "desc_countdown_start" );
    }
    
    if ( !level flag::exists( "desc_countdown_done" ) )
    {
        level flag::init( "desc_countdown_done" );
    }
    
    level flag::clear( "desc_fillup_gadgets" );
    level flag::clear( "desc_countdown_start" );
    level flag::clear( "desc_countdown_done" );
    
    if ( isdefined( var_74d544ba ) && var_74d544ba )
    {
        level waittill( #"hash_4c62fe02843b1a98" );
    }
    
    self clientfield::set_to_player( "screen_blur", 1 );
    
    if ( isdefined( level.var_e92a00d3 ) )
    {
        self [[ level.var_e92a00d3 ]]();
    }
    
    self ct_gadgets::function_d77271ae();
    
    if ( isdefined( level._objective_zapper_tall ) )
    {
        self [[ level._objective_zapper_tall ]]( #"hash_2ac3b79c708dcfd5" );
    }
    
    self disableweapons();
    self val::set( #"hash_784a49b49cc8c292", "freezecontrols", 1 );
    wait 0.5;
    self function_c7106205();
    self clientfield::set_to_player( "screen_blur", 0 );
    wait 1;
    level flag::set( "desc_countdown_start" );
    wait 3;
    ct_utils::function_9aca2fa0( "ct_spawn" );
    level notify( #"hash_44623efd9f4d41a4" );
    
    if ( self.sessionstate == "playing" )
    {
        self enableweapons();
        self val::reset( #"hash_784a49b49cc8c292", "freezecontrols" );
        self val::reset( #"spawn_player", "disablegadgets" );
    }
    
    level notify( #"hash_3779df13251ba6f7" );
    level flag::set( "desc_countdown_done" );
    wait 0.95;
    
    if ( isdefined( level.var_c3af52cc ) )
    {
        self [[ level.var_c3af52cc ]]();
        self thread ct_utils::function_d3fd7ef7();
    }
    
    level flag::set( "desc_fillup_gadgets" );
}

// Namespace ct_ui/ct_ui
// Params 0
// Checksum 0x4c4bca56, Offset: 0x560
// Size: 0xe4
function function_c7106205()
{
    self endon( #"death" );
    level endon( #"hash_3779df13251ba6f7" );
    level.var_d0c7d280 = 0;
    
    if ( isdefined( level.var_c01b7f8b ) )
    {
        self [[ level.var_c01b7f8b ]]( level.var_d0c7d280 );
    }
    
    if ( isdefined( level.var_ae120f18 ) )
    {
        level thread ct_vo::function_831e0584( level.var_ae120f18, 1 );
        level.var_ae120f18 = undefined;
    }
    
    if ( isdefined( level._objective_zapper_tall ) )
    {
        level thread function_4b4ca178();
        self [[ level._objective_zapper_tall ]]( #"hash_3319eaa2c590a2ac" );
    }
}

// Namespace ct_ui/ct_ui
// Params 0
// Checksum 0x753009e4, Offset: 0x650
// Size: 0x8c
function function_4b4ca178()
{
    e_player = ct_utils::get_player();
    wait 0.5;
    e_player playsound( "uin_timer_1" );
    wait 1.5;
    e_player playsound( "uin_timer_1" );
    wait 1;
    e_player playsound( "uin_timer_1" );
}

// Namespace ct_ui/ct_ui
// Params 2
// Checksum 0x1bab4170, Offset: 0x6e8
// Size: 0x14
function function_fa910e34( b_success, var_cd803a6b )
{
    
}

// Namespace ct_ui/ct_ui
// Params 1
// Checksum 0x8bb09887, Offset: 0x708
// Size: 0xc
function function_c86db7f5( var_cd803a6b )
{
    
}

// Namespace ct_ui/ct_ui
// Params 1
// Checksum 0xb74c51fb, Offset: 0x720
// Size: 0xc
function function_963c30ff( var_cd803a6b )
{
    
}

// Namespace ct_ui/ct_ui
// Params 1
// Checksum 0xc058ccb2, Offset: 0x738
// Size: 0x6c
function function_1ae56656( b_success )
{
    self endon( #"death" );
    level endon( #"aar_done" );
    
    while ( !self actionbuttonpressed() )
    {
        waitframe( 1 );
    }
    
    level flag::set( "btn_play_again" );
}

// Namespace ct_ui/ct_ui
// Params 0
// Checksum 0xd3dbed01, Offset: 0x7b0
// Size: 0xd2
function function_f667701c()
{
    self endon( #"death" );
    level endon( #"aar_done" );
    
    while ( true )
    {
        while ( !self stancebuttonpressed() )
        {
            waitframe( 1 );
        }
        
        n_count = 0;
        
        while ( self stancebuttonpressed() && n_count < 30 )
        {
            n_count++;
            waitframe( 1 );
        }
        
        if ( n_count >= 30 )
        {
            level flag::set( "btn_return_to_menu" );
            return;
        }
    }
}

// Namespace ct_ui/ct_ui
// Params 1
// Checksum 0x8fec105a, Offset: 0x890
// Size: 0x84
function function_d10b39de( b_success )
{
    if ( b_success )
    {
        if ( isdefined( level.var_ac397acd ) )
        {
            self [[ level.var_ac397acd ]]( #"success_fadeout" );
        }
    }
    else if ( isdefined( level.var_ac397acd ) )
    {
        self [[ level.var_ac397acd ]]( #"fail_fadeout" );
    }
    
    wait 4;
}


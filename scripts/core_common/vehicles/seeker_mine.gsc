#using scripts\core_common\ai_shared;
#using scripts\core_common\animation_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\oob;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\statemachine_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\targetting_delay;
#using scripts\core_common\throttle_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\vehicle_ai_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\core_common\vehicles\smart_bomb;
#using scripts\weapons\arc;

#namespace seeker_mine;

// Namespace seeker_mine/seeker_mine
// Params 0, eflags: 0x2
// Checksum 0xbb58545b, Offset: 0x230
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"seeker_mine", &__init__, undefined, undefined );
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0xfd03a9a8, Offset: 0x278
// Size: 0xec
function __init__()
{
    vehicle::add_main_callback( "seeker_mine", &function_b23e4b45 );
    clientfield::register( "vehicle", "seeker_mine_fx", 1, 1, "int" );
    clientfield::register( "vehicle", "seeker_mine_light_fx", 1, 1, "int" );
    
    if ( !isdefined( level.var_477515d3 ) )
    {
        level.var_477515d3 = new throttle();
        [[ level.var_477515d3 ]]->initialize( 1, 0.1 );
    }
    
    /#
        level thread update_dvars();
    #/
}

/#

    // Namespace seeker_mine/seeker_mine
    // Params 0
    // Checksum 0x4ea9fbd3, Offset: 0x370
    // Size: 0x4a, Type: dev
    function update_dvars()
    {
        while ( true )
        {
            wait 1;
            level.var_d3c21969 = getdvarint( #"hash_6b0c29fe436582f0", 0 );
        }
    }

#/

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0x93c618d8, Offset: 0x3c8
// Size: 0x74, Type: bool
function is_in_water( location )
{
    var_8a7edebd = 15;
    depth = getwaterheight( location ) - self.origin[ 2 ];
    inwater = depth > var_8a7edebd;
    
    if ( inwater )
    {
        return true;
    }
    
    return false;
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0x5920bcd7, Offset: 0x448
// Size: 0x804
function function_b23e4b45()
{
    self.settings = struct::get_script_bundle( "vehiclecustomsettings", self.scriptbundlesettings );
    self.allowfriendlyfiredamageoverride = &smart_bomb::function_bf16c9ed;
    self.var_1dab821a = 0;
    self.var_e962dfaf = 0;
    self.delete_on_death = 1;
    self setplayercollision( 0 );
    self setavoidancemask( "avoid none" );
    self useanimtree( "generic" );
    self.ignore_death_jolt = 1;
    self thread function_313aa1b8();
    self.var_6e9e073d = 1;
    self.var_101a013c = 1;
    self.overridevehicledamage = &function_9e38a14a;
    
    if ( isdefined( self.owner ) )
    {
        self setteam( self.owner.team );
    }
    
    self setneargoalnotifydist( 31 );
    defaultrole();
    
    if ( self oob::istouchinganyoobtrigger() || !function_d55a99f2( 300, 1, 1 ) )
    {
        function_afd97197();
        return;
    }
    
    ispointonnavmesh = ispointonnavmesh( self.origin, self getpathfindingradius() );
    
    if ( !ispointonnavmesh )
    {
        /#
            recordsphere( self.origin, 3, ( 1, 0, 0 ), "<dev string:x38>" );
        #/
    }
    else
    {
        /#
            recordsphere( self.origin, 3, ( 0, 1, 0 ), "<dev string:x38>" );
        #/
    }
    
    if ( !ispointonnavmesh )
    {
        newpos = undefined;
        var_921106a1 = getclosestpointonnavmesh( self.origin, 250, 30 );
        
        if ( isdefined( var_921106a1 ) )
        {
            results = groundtrace( var_921106a1 + ( 0, 0, 70 ), var_921106a1 + ( 0, 0, -70 ), 0, self );
            
            if ( isdefined( results ) && isdefined( results[ #"position" ] ) )
            {
                var_921106a1 = results[ #"position" ];
                
                if ( bullettracepassed( self.origin + ( 0, 0, 10 ), var_921106a1, 0, self, self, 0, 0 ) )
                {
                    /#
                        recordline( self.origin + ( 0, 0, 10 ), var_921106a1, ( 0, 0, 1 ), "<dev string:x38>" );
                    #/
                    
                    /#
                        recordsphere( self.origin + ( 0, 0, 10 ), 3, ( 0, 0, 1 ), "<dev string:x38>" );
                    #/
                    
                    /#
                        recordsphere( var_921106a1, 3, ( 0, 0, 1 ), "<dev string:x38>" );
                    #/
                    
                    newpos = var_921106a1;
                }
                else
                {
                    /#
                        recordline( self.origin + ( 0, 0, 10 ), var_921106a1, ( 1, 0.5, 0 ), "<dev string:x38>" );
                    #/
                    
                    /#
                        recordsphere( self.origin + ( 0, 0, 10 ), 3, ( 1, 0.5, 0 ), "<dev string:x38>" );
                    #/
                    
                    /#
                        recordsphere( var_921106a1, 3, ( 1, 0.5, 0 ), "<dev string:x38>" );
                    #/
                }
            }
        }
        
        if ( !isdefined( newpos ) )
        {
            var_68860686 = ai::t_cylinder( self.origin, 10, 60 );
            cylinder = ai::t_cylinder( self.origin, 300, 60 );
            tacpoints = tacticalquery( "mp_seeker_seek_no_enemy_fallback", self.origin, self, var_68860686, cylinder );
            
            if ( isdefined( tacpoints ) && tacpoints.size > 0 )
            {
                foreach ( tacpoint in tacpoints )
                {
                    if ( function_96c81b85( tacpoint, self.origin + ( 0, 0, 30 ) ) )
                    {
                        var_cc66f3f5 = getclosestpointonnavmesh( tacpoint.origin, 250, 30 );
                        
                        if ( isdefined( var_cc66f3f5 ) && function_d15dd929( self getpathfindingradius(), var_cc66f3f5 ) && sighttracepassed( self.origin, var_cc66f3f5, 0, self ) )
                        {
                            newpos = var_cc66f3f5;
                            break;
                        }
                    }
                }
            }
        }
        
        if ( isdefined( newpos ) )
        {
            self.origin = newpos;
        }
        else
        {
            function_afd97197();
            return;
        }
    }
    
    if ( !( isdefined( level.var_8fce01d ) && level.var_8fce01d ) )
    {
        if ( is_in_water( self.origin ) )
        {
            function_afd97197();
            return;
        }
        
        if ( !function_d15dd929( self getpathfindingradius(), self.origin ) )
        {
            function_afd97197();
            return;
        }
        
        if ( function_d39f1cf2() )
        {
            tacpoint = getclosesttacpoint( self.origin );
            
            if ( isdefined( tacpoint ) )
            {
                self.origin = tacpoint.origin;
            }
        }
    }
    
    vehicle_ai::startinitialstate( "seek" );
    self thread function_d00f14e3();
    self thread function_2651fb42();
    self thread targetting_delay::function_7e1a12ce();
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0x7cbea234, Offset: 0xc58
// Size: 0x144
function defaultrole()
{
    statemachine = self vehicle_ai::init_state_machine_for_role( "default" );
    statemachine statemachine::add_state( "seek", &function_9ddc7275, &function_3e16dec3, &function_64f7393f );
    statemachine statemachine::add_state( "chase", &state_chase_start, &function_391d5d90, &function_24465583 );
    statemachine statemachine::add_state( "discharge", &function_c23ecb2, &function_fb89ba8a, &function_32e99568 );
    self vehicle_ai::get_state_callbacks( "death" ).update_func = &state_death_update;
    self vehicle_ai::call_custom_add_state_callbacks();
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0xc2c86152, Offset: 0xda8
// Size: 0x1a
function function_d3a9800e()
{
    return self.origin + ( 0, 0, 30 );
}

// Namespace seeker_mine/seeker_mine
// Params 0, eflags: 0x4
// Checksum 0x66c3d219, Offset: 0xdd0
// Size: 0xae, Type: bool
function private function_d39f1cf2()
{
    trace = groundtrace( self.origin + ( 0, 0, 70 ), self.origin + ( 0, 0, -100 ), 0, self );
    
    if ( isdefined( trace[ #"entity" ] ) )
    {
        entity = trace[ #"entity" ];
        
        if ( entity ismovingplatform() )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace seeker_mine/seeker_mine
// Params 0, eflags: 0x4
// Checksum 0x53377ea3, Offset: 0xe88
// Size: 0x4e, Type: bool
function private function_23d1cec2()
{
    result = function_9cc082d2( self.origin + ( 0, 0, 100 ), 400 );
    
    if ( isdefined( result ) )
    {
        return true;
    }
    
    return false;
}

// Namespace seeker_mine/seeker_mine
// Params 15
// Checksum 0x5f9c0e2a, Offset: 0xee0
// Size: 0xca
function function_9e38a14a( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal )
{
    if ( weapon == level.shockrifleweapon )
    {
        idamage = self.health;
    }
    
    if ( weapon === getweapon( #"ability_smart_cover" ) )
    {
        idamage = 0;
    }
    
    return idamage;
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0xbff061b1, Offset: 0xfb8
// Size: 0xf4
function state_chase_start( params )
{
    self clientfield::set( "seeker_mine_light_fx", 1 );
    self.var_3a0564e = gettime();
    
    if ( isdefined( self.settings.var_fb42187e ) )
    {
        self playloopsound( self.settings.var_fb42187e );
    }
    
    self thread function_55be8453();
    self thread function_d03a7fe8();
    self thread watch_for_timeout( &function_d017dfc, int( self.settings.var_efc15586 * 1000 ) );
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0x4f12f374, Offset: 0x10b8
// Size: 0x34
function function_24465583( params )
{
    self.var_e962dfaf = function_d017dfc();
    self stoploopsound();
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0xc2a67b06, Offset: 0x10f8
// Size: 0x26
function function_d017dfc()
{
    time = self.var_e962dfaf + gettime() - self.var_3a0564e;
    return time;
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0x606de5af, Offset: 0x1128
// Size: 0x196
function function_391d5d90( params )
{
    self endon( #"death", #"change_state" );
    
    for ( ;; )
    {
        if ( function_112a6b52() )
        {
            waitframe( 2 );
            continue;
        }
        
        if ( isdefined( self.favoriteenemy ) && isalive( self.favoriteenemy ) )
        {
            self setbrake( 0 );
            self setspeed( self.settings.var_2c69a255 );
            
            if ( function_23d1cec2() && !ispointonnavmesh( self.origin, self ) )
            {
                function_d55a99f2( 500, 0 );
            }
            
            if ( !chase_enemy() )
            {
                self.var_c5c8c31 = randomintrange( 1, 3 );
                self vehicle_ai::set_state( "seek" );
            }
        }
        else
        {
            self vehicle_ai::set_state( "seek" );
        }
        
        self waittill_pathing_done( 2 );
        waitframe( 1 );
    }
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0xbb4710fe, Offset: 0x12c8
// Size: 0x88
function waittill_pathing_done( maxtime = 15 )
{
    self endon( #"death", #"change_state" );
    result = self waittilltimeout( maxtime, #"near_goal", #"hash_f6b2d6a37e22523", #"switch_enemy" );
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0x491fb0bb, Offset: 0x1358
// Size: 0xe2, Type: bool
function function_33d3892a()
{
    iterationlimit = getdvarint( #"hkai_pathfinditerationlimit", 1800 );
    
    if ( isdefined( self.favoriteenemy ) && !function_9ba314a1( self.favoriteenemy ) )
    {
        targetpos = function_3acf1c61();
        
        if ( isdefined( targetpos ) )
        {
            path = generatenavmeshpath( self.origin, targetpos, self, undefined, undefined, iterationlimit );
            
            if ( isdefined( path ) && path.status === "succeeded" )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0x2aa169d3, Offset: 0x1448
// Size: 0x8a, Type: bool
function chase_enemy()
{
    if ( isdefined( self.favoriteenemy ) && function_9ba314a1( self.favoriteenemy ) )
    {
        return false;
    }
    
    targetpos = function_3acf1c61();
    
    if ( isdefined( targetpos ) )
    {
        if ( self function_a57c34b7( targetpos, 0, 1 ) )
        {
            self.current_pathto_pos = targetpos;
            return true;
        }
    }
    
    return false;
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0x51edf722, Offset: 0x14e0
// Size: 0xb4
function function_3acf1c61()
{
    if ( isdefined( self.favoriteenemy ) )
    {
        target_pos = self.favoriteenemy.origin;
    }
    
    if ( isdefined( target_pos ) )
    {
        target_pos_onnavmesh = getclosestpointonnavmesh( target_pos, self.settings.var_c694bbbf * 1.5, self getpathfindingradius() * 1.2, 4194287 );
    }
    
    if ( isdefined( target_pos_onnavmesh ) )
    {
        return target_pos_onnavmesh;
    }
    
    if ( isdefined( self.current_pathto_pos ) )
    {
        return self.current_pathto_pos;
    }
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0x4372c4bc, Offset: 0x15a0
// Size: 0x12e
function function_d03a7fe8()
{
    self endon( #"death", #"change_state" );
    
    for ( ;; )
    {
        if ( isdefined( self.favoriteenemy ) && isalive( self.favoriteenemy ) )
        {
            if ( function_9ba314a1( self.favoriteenemy ) )
            {
                self vehicle_ai::set_state( "seek" );
            }
            
            var_d0ca034f = arc::function_33d5b9a6( level.var_8a74f7fc[ self.arcweapon ], self.owner, self, self function_d3a9800e(), 0, self.favoriteenemy );
            
            if ( var_d0ca034f )
            {
                self vehicle_ai::set_state( "discharge" );
            }
        }
        else
        {
            self vehicle_ai::set_state( "seek" );
        }
        
        waitframe( 1 );
    }
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0xa264b242, Offset: 0x16d8
// Size: 0xe4
function function_c23ecb2( params )
{
    if ( isplayer( self.owner ) )
    {
        self notify( #"seeker_discharge" );
        self.owner notify( #"seeker_discharge" );
    }
    
    self setbrake( 1 );
    self function_d4c687c9();
    self function_a57c34b7( self.origin );
    self thread animation::play( "p8_fxanim_mp_drone_seeker_fire_anim", self.origin, self.angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0 );
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0x606eba0, Offset: 0x17c8
// Size: 0xa4
function function_32e99568( params )
{
    if ( isplayer( self.owner ) )
    {
        self notify( #"seeker_discharge_stopped" );
        self.owner notify( #"seeker_discharge_stopped" );
    }
    
    if ( isdefined( self.var_f8f0b8f8 ) )
    {
        self.var_f8f0b8f8 delete();
    }
    
    self stoploopsound();
    self animation::stop();
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0xd4f43aaf, Offset: 0x1878
// Size: 0x86
function function_13ade03e()
{
    self endon( #"death", #"change_state" );
    
    while ( true )
    {
        self animation::play( "p8_fxanim_mp_drone_seeker_shock_anim", self.origin, self.angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0 );
        waitframe( 1 );
    }
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0xd0c6ec70, Offset: 0x1908
// Size: 0x244
function function_fb89ba8a( params )
{
    self endon( #"death" );
    self endon( #"change_state" );
    self thread function_13ade03e();
    starttime = gettime();
    var_b2c9484f = int( self.settings.var_e0c78652 * 1000 );
    
    while ( starttime + var_b2c9484f > gettime() && !isdefined( self.var_290ed3ab ) || isdefined( self.var_290ed3ab ) && self.var_290ed3ab > gettime() || isdefined( self.var_e19bcce0 ) && self.var_e19bcce0 )
    {
        if ( isdefined( self.arcweapon ) )
        {
            if ( isdefined( level.var_8a74f7fc[ self.arcweapon ] ) )
            {
                self.var_8a74f7fc = level.var_8a74f7fc[ self.arcweapon ];
                
                if ( !isdefined( self.var_d8d780c1 ) || self.var_d8d780c1.size < level.var_8a74f7fc[ self.arcweapon ].var_755593b1 )
                {
                    arc::find_arc_targets( level.var_8a74f7fc[ self.arcweapon ], self.owner, self, self function_d3a9800e(), 0, 0 );
                }
            }
            
            if ( !( isdefined( self.var_52ed036d ) && self.var_52ed036d ) )
            {
                self clientfield::set( "seeker_mine_fx", 1 );
                
                if ( isdefined( self.settings.var_93a31357 ) )
                {
                    self playsound( self.settings.var_93a31357 );
                }
                
                self.var_52ed036d = 1;
            }
        }
        
        waitframe( 1 );
    }
    
    self vehicle_ai::set_state( "death" );
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0x848e4228, Offset: 0x1b58
// Size: 0xdc
function function_9ddc7275( params )
{
    self.favoriteenemy = undefined;
    self.var_fc1d25b1 = gettime();
    self clientfield::set( "seeker_mine_light_fx", 0 );
    self thread function_55be8453();
    self thread function_3e3b6ce1();
    self thread function_82e5be34();
    self thread watch_for_timeout( &function_c82edc1a, int( self.settings.var_7fa25761 * 1000 ) );
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0x3b8a0309, Offset: 0x1c40
// Size: 0x3a
function function_64f7393f( params )
{
    self stoploopsound();
    self.var_1dab821a = function_c82edc1a();
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0x711a722d, Offset: 0x1c88
// Size: 0x26
function function_c82edc1a()
{
    time = self.var_1dab821a + gettime() - self.var_fc1d25b1;
    return time;
}

// Namespace seeker_mine/seeker_mine
// Params 0, eflags: 0x4
// Checksum 0xaf99b057, Offset: 0x1cb8
// Size: 0x66
function private function_d00f14e3()
{
    self endon( #"death" );
    self.ai.var_b0f9c1a3 = gettime();
    
    while ( true )
    {
        self waittill( #"hash_47fe95a0475dea3d" );
        self.ai.var_b0f9c1a3 = gettime() + 2000;
    }
}

// Namespace seeker_mine/seeker_mine
// Params 0, eflags: 0x4
// Checksum 0xbfdec55c, Offset: 0x1d28
// Size: 0x3c, Type: bool
function private function_112a6b52()
{
    if ( !isdefined( self.ai.var_b0f9c1a3 ) )
    {
        return false;
    }
    
    if ( gettime() <= self.ai.var_b0f9c1a3 )
    {
        return true;
    }
    
    return false;
}

// Namespace seeker_mine/seeker_mine
// Params 0, eflags: 0x4
// Checksum 0x50e48a5e, Offset: 0x1d70
// Size: 0x90
function private function_2651fb42()
{
    self endon( #"death" );
    
    while ( true )
    {
        if ( function_112a6b52() )
        {
            waitframe( 2 );
            continue;
        }
        
        if ( !function_23d1cec2() && function_d55a99f2() )
        {
            self notify( #"hash_f6b2d6a37e22523" );
        }
        
        waitframe( 2 );
    }
}

// Namespace seeker_mine/seeker_mine
// Params 0, eflags: 0x4
// Checksum 0x2d33d814, Offset: 0x1e08
// Size: 0xe0
function private function_82e5be34()
{
    self endon( #"death" );
    self endon( #"change_state" );
    
    while ( true )
    {
        currentdir = anglestoforward( self.angles );
        wait 1;
        newdir = anglestoforward( self.angles );
        
        if ( vectordot( currentdir, newdir ) < -0.5 )
        {
            if ( isdefined( self.settings.var_f282dc0a ) )
            {
                self playsound( self.settings.var_f282dc0a );
            }
        }
    }
}

// Namespace seeker_mine/seeker_mine
// Params 2
// Checksum 0x6c500fa4, Offset: 0x1ef0
// Size: 0xae, Type: bool
function function_d15dd929( radius, origin )
{
    result = function_9cc082d2( origin + ( 0, 0, 100 ), 200 );
    
    if ( isdefined( result ) && isdefined( result[ #"materialflags" ] ) && result[ #"materialflags" ] & 2 )
    {
        return false;
    }
    
    if ( !ispointonnavmesh( origin, radius, 1 ) )
    {
        return false;
    }
    
    return true;
}

// Namespace seeker_mine/seeker_mine
// Params 2
// Checksum 0xe7c30ea1, Offset: 0x1fa8
// Size: 0x17c
function damage_armor_activati_( entity, tacpoints )
{
    validpoints = [];
    radius = entity getpathfindingradius();
    
    if ( isdefined( tacpoints ) && tacpoints.size > 0 )
    {
        foreach ( tacpoint in tacpoints )
        {
            if ( function_d15dd929( radius, tacpoint.origin ) )
            {
                array::add( validpoints, tacpoint );
                continue;
            }
            
            /#
                record3dtext( "<dev string:x41>", tacpoint.origin + ( 0, 0, 40 ), ( 1, 1, 1 ), "<dev string:x38>" );
            #/
            
            /#
                recordline( tacpoint.origin + ( 0, 0, 40 ), tacpoint.origin, ( 1, 1, 1 ), "<dev string:x38>" );
            #/
        }
    }
    
    return validpoints;
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0x7938d308, Offset: 0x2130
// Size: 0x566
function function_3e16dec3( params )
{
    self endon( #"death" );
    self endon( #"change_state" );
    
    for ( ;; )
    {
        if ( function_112a6b52() )
        {
            waitframe( 2 );
            continue;
        }
        
        if ( isdefined( self.favoriteenemy ) )
        {
            self.current_pathto_pos = self function_3acf1c61();
            
            if ( isdefined( self.current_pathto_pos ) )
            {
                if ( self function_a57c34b7( self.current_pathto_pos, 0, 1 ) )
                {
                    self setspeed( self.settings.var_68c74e4f );
                    self setbrake( 0 );
                    self waittill_pathing_done( 2 );
                    continue;
                }
            }
        }
        
        self setspeed( self.settings.var_9eff22ee );
        
        if ( function_23d1cec2() )
        {
            if ( !ispointonnavmesh( self.origin, self ) )
            {
                function_d55a99f2( 500, 0 );
            }
            
            if ( isdefined( level.var_477515d3 ) )
            {
                [[ level.var_477515d3 ]]->waitinqueue( self );
            }
            
            forward = anglestoforward( self.angles );
            forwardpos = self.origin + forward * 500;
            var_68860686 = ai::t_cylinder( self.origin, 200, 60 );
            tacpoints = tacticalquery( "mp_seeker_seek_no_enemy", self.origin, self, var_68860686, forwardpos );
            tacpoints = damage_armor_activati_( self, tacpoints );
            
            if ( isdefined( tacpoints ) && tacpoints.size != 0 )
            {
                /#
                    record3dtext( "<dev string:x49>", self.origin - ( 0, 0, 20 ), ( 1, 0, 0 ) );
                #/
                
                newpos = tacpoints[ 0 ].origin;
                newpos = getclosestpointonnavmesh( newpos, 500, self getpathfindingradius() * 1.2, self.var_6e9e073d );
                
                if ( isdefined( newpos ) )
                {
                    if ( self function_a57c34b7( newpos, 0, 1 ) )
                    {
                        self waittill_pathing_done( 2 );
                    }
                    else
                    {
                        self function_a57c34b7( newpos, 0, 0 );
                        self waittill_pathing_done( 2 );
                    }
                }
            }
            else
            {
                if ( isdefined( level.var_6cfbe5a ) )
                {
                    [[ level.var_6cfbe5a ]]->waitinqueue( self );
                }
                
                newpos = getclosestpointonnavmesh( self.origin, 1000, 10 );
                
                if ( isdefined( newpos ) )
                {
                    var_68860686 = ai::t_cylinder( self.origin, 400, 60 );
                    cylinder = ai::t_cylinder( self.origin, 1500, 150 );
                    tacpoints = tacticalquery( "mp_seeker_seek_no_enemy_fallback", newpos, self, var_68860686, cylinder );
                    tacpoints = damage_armor_activati_( self, tacpoints );
                    
                    if ( isdefined( tacpoints ) && tacpoints.size != 0 )
                    {
                        /#
                            record3dtext( "<dev string:x49>", self.origin - ( 0, 0, 20 ), ( 1, 0, 0 ) );
                        #/
                        
                        newpos = tacpoints[ 0 ].origin;
                        newpos = getclosestpointonnavmesh( newpos, 500, self getpathfindingradius() * 1.2 );
                        
                        if ( isdefined( newpos ) )
                        {
                            if ( self function_a57c34b7( newpos, 0, 1 ) )
                            {
                                self waittill_pathing_done( 2 );
                            }
                            else
                            {
                                self function_a57c34b7( newpos, 0, 0 );
                                self waittill_pathing_done( 2 );
                            }
                        }
                    }
                }
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0x985b7abd, Offset: 0x26a0
// Size: 0xc0, Type: bool
function function_ab9a9770( target )
{
    results = groundtrace( target.origin + ( 0, 0, 70 ), target.origin + ( 0, 0, -100 ), 0, target );
    
    if ( isdefined( results ) && isdefined( results[ #"entity" ] ) && results[ #"entity" ] ismovingplatform() )
    {
        return true;
    }
    
    return false;
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0x94396f84, Offset: 0x2768
// Size: 0x466, Type: bool
function function_9ba314a1( target )
{
    if ( isplayer( target ) )
    {
        if ( !isalive( target ) )
        {
            return true;
        }
        
        if ( isdefined( target.var_4233f7e5 ) && target.var_4233f7e5 )
        {
            return true;
        }
        
        if ( isdefined( target.var_bb257569 ) && gettime() < target.var_bb257569 )
        {
            return true;
        }
        
        if ( isdefined( target.currentweapon ) )
        {
            shield = getweapon( #"sig_buckler_dw" );
            
            if ( isdefined( shield ) && target.currentweapon == shield )
            {
                return true;
            }
            
            shield = getweapon( #"sig_buckler_lh" );
            
            if ( isdefined( shield ) && target.currentweapon == shield )
            {
                return true;
            }
            
            shield = getweapon( #"sig_shield_turret" );
            
            if ( isdefined( shield ) && target.currentweapon == shield )
            {
                return true;
            }
        }
        
        if ( function_ab9a9770( target ) )
        {
            return true;
        }
        
        if ( isdefined( target.isplanting ) && target.isplanting || isdefined( target.isdefusing ) && target.isdefusing || target oob::isoutofbounds() )
        {
            return true;
        }
        
        if ( target laststand::player_is_in_laststand() )
        {
            return true;
        }
        
        if ( target isremotecontrolling() || isdefined( target.holding_placeable ) )
        {
            return true;
        }
        
        if ( target isinvehicle() )
        {
            return true;
        }
        
        if ( target player::is_spawn_protected() )
        {
            return true;
        }
        
        if ( isdefined( target.var_beee9523 ) && target.var_beee9523 )
        {
            return true;
        }
        
        if ( target isgrappling() )
        {
            return true;
        }
        
        if ( target depthinwater() >= 30 || target isplayerswimming() )
        {
            return true;
        }
        
        if ( isdefined( target.var_dda9b735 ) && isdefined( target.var_dda9b735.isshocked ) && target.var_dda9b735.isshocked )
        {
            return true;
        }
        
        if ( target hasperk( #"specialty_nottargetedbyraps" ) && !isdefined( level.var_91a1cd89 ) )
        {
            distsqtotarget = distancesquared( target.origin, self.origin );
            
            if ( distsqtotarget <= 15625 )
            {
                return false;
            }
            
            return true;
        }
    }
    
    target_pos_onnavmesh = undefined;
    
    if ( isdefined( target ) )
    {
        target_pos_onnavmesh = getclosestpointonnavmesh( target.origin, self.settings.var_c694bbbf * 1.5, self getpathfindingradius() * 1.2, 4194287 );
        
        if ( !isdefined( target_pos_onnavmesh ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0x167e4769, Offset: 0x2bd8
// Size: 0x212
function function_3e3b6ce1()
{
    self endon( #"death" );
    self endon( #"change_state" );
    
    if ( isdefined( self.var_c5c8c31 ) )
    {
        delay = self.var_c5c8c31;
        self.var_c5c8c31 = undefined;
        wait delay;
    }
    
    while ( true )
    {
        if ( isdefined( self.favoriteenemy ) )
        {
            target = self.favoriteenemy;
            distsqtotarget = distancesquared( target.origin, self.origin );
            
            if ( distsqtotarget <= 122500 )
            {
                var_cbf5ba86 = 1;
            }
            
            var_b9733045 = self targetting_delay::function_1c169b3a( target, 0 );
            canseetarget = var_b9733045 && target sightconetrace( self function_d3a9800e(), self, anglestoforward( self.angles ), self.settings.var_e7260470 );
            
            if ( isdefined( level.var_6cfbe5a ) )
            {
                [[ level.var_6cfbe5a ]]->waitinqueue( self );
            }
            
            if ( function_33d3892a() )
            {
                if ( canseetarget || isdefined( var_cbf5ba86 ) && var_cbf5ba86 )
                {
                    if ( isdefined( self.settings.var_af34ede3 ) )
                    {
                        self playsound( self.settings.var_af34ede3 );
                    }
                    
                    self vehicle_ai::set_state( "chase" );
                    break;
                }
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0xa0da6845, Offset: 0x2df8
// Size: 0x62
function function_45eb6b84( target )
{
    if ( isdefined( self.favoriteenemy ) && self.favoriteenemy != target )
    {
        self targetting_delay::function_a4d6d6d8( target );
        self notify( #"switch_enemy" );
    }
    
    self.favoriteenemy = target;
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0x14afca6a, Offset: 0x2e68
// Size: 0x3f6
function function_55be8453()
{
    self endon( #"death", #"change_state" );
    waitframe( 2 );
    firsttime = 1;
    
    while ( true )
    {
        if ( isdefined( self.favoriteenemy ) && function_9ba314a1( self.favoriteenemy ) )
        {
            self.favoriteenemy = undefined;
        }
        
        if ( isdefined( self.favoriteenemy ) )
        {
            if ( util::within_fov( self.origin, self.angles, self.favoriteenemy.origin, 0.939 ) )
            {
                distsqtotarget = distancesquared( self.favoriteenemy.origin, self.origin );
                
                if ( distsqtotarget <= 122500 )
                {
                    waitframe( 1 );
                    continue;
                }
            }
        }
        
        enemies = util::function_81ccf6d3( self.team );
        alltargets = arraycombine( enemies, getactorarray(), 1, 0 );
        alltargets = arraysort( enemies, self function_d3a9800e(), 1 );
        foundenemy = 0;
        
        foreach ( target in alltargets )
        {
            if ( function_9ba314a1( target ) )
            {
                continue;
            }
            
            angles = self.angles;
            
            if ( isdefined( firsttime ) && firsttime && isdefined( self.owner ) )
            {
                angles = self.owner.angles;
                firsttime = 0;
            }
            
            if ( util::within_fov( self.origin, angles, target.origin, 0 ) )
            {
                function_45eb6b84( target );
                foundenemy = 1;
                break;
            }
        }
        
        if ( !foundenemy )
        {
            foreach ( target in alltargets )
            {
                distsqtotarget = distancesquared( target.origin, self.origin );
                
                if ( distsqtotarget <= 122500 && !function_9ba314a1( target ) )
                {
                    function_45eb6b84( target );
                    foundenemy = 1;
                    break;
                }
            }
        }
        
        if ( !foundenemy && alltargets.size && isdefined( alltargets[ 0 ] ) && !function_9ba314a1( alltargets[ 0 ] ) )
        {
            function_45eb6b84( target );
        }
        
        waitframe( 1 );
    }
}

// Namespace seeker_mine/seeker_mine
// Params 3
// Checksum 0xa8382c09, Offset: 0x3268
// Size: 0x212, Type: bool
function function_d55a99f2( var_4700521d = 500, var_53050fec = 1, var_30336a7c = 0 )
{
    if ( var_53050fec && function_23d1cec2() )
    {
        return true;
    }
    
    /#
        record3dtext( "<dev string:x58>", self.origin - ( 0, 0, 20 ), ( 1, 0, 0 ) );
    #/
    
    newpos = getclosestpointonnavmesh( self.origin, var_4700521d, self getpathfindingradius() * 1.2 );
    
    if ( isdefined( newpos ) )
    {
        trace = groundtrace( newpos + ( 0, 0, 70 ), newpos + ( 0, 0, -70 ), 0, undefined );
        
        if ( isdefined( trace[ #"position" ] ) )
        {
            newpos = trace[ #"position" ];
            
            if ( var_30336a7c && !sighttracepassed( self.origin, newpos, 0, self ) )
            {
                return false;
            }
            
            /#
                record3dtext( "<dev string:x6b>", self.origin - ( 0, 0, 20 ), ( 0, 0, 1 ) );
            #/
            
            /#
                recordline( newpos, self.origin, ( 0, 0, 1 ), "<dev string:x38>" );
            #/
        }
        
        self.origin = newpos;
        return true;
    }
    
    return false;
}

// Namespace seeker_mine/seeker_mine
// Params 2
// Checksum 0x84b24725, Offset: 0x3488
// Size: 0xae
function watch_for_timeout( var_9d52f0b7, max_duration )
{
    self endon( #"death" );
    self endon( #"change_state" );
    
    for ( ;; )
    {
        if ( isdefined( self.var_672e0d51 ) )
        {
            if ( self.var_672e0d51 < gettime() )
            {
                self vehicle_ai::set_state( "death" );
            }
        }
        else if ( self [[ var_9d52f0b7 ]]() > max_duration )
        {
            self vehicle_ai::set_state( "death" );
        }
        
        waitframe( 1 );
    }
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0xd84bf9d4, Offset: 0x3540
// Size: 0x68
function function_313aa1b8()
{
    self endon( #"death" );
    
    while ( true )
    {
        waitresult = self waittill( #"veh_collision" );
        self playsound( #"veh_wasp_wall_imp" );
    }
}

// Namespace seeker_mine/seeker_mine
// Params 0
// Checksum 0x666e45b7, Offset: 0x35b0
// Size: 0x24
function function_afd97197()
{
    self vehicle_ai::set_state( "death" );
}

// Namespace seeker_mine/seeker_mine
// Params 1
// Checksum 0xcc916316, Offset: 0x35e0
// Size: 0x9c
function state_death_update( params )
{
    self clientfield::set( "seeker_mine_fx", 0 );
    self arc::function_936e96aa( self.var_8a74f7fc );
    vehicle_ai::defaultstate_death_update( params );
    
    if ( isdefined( self.owner ) )
    {
        self.owner globallogic_score::function_d3ca3608( #"hash_2cbb2354f066e90" );
    }
}


#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\fx_shared;

#namespace zombie_death;

// Namespace zombie_death/zombie_death
// Params 0
// Checksum 0xae522adc, Offset: 0x160
// Size: 0x76
function on_fire_timeout()
{
    self endon( #"death" );
    
    if ( isdefined( self.flame_fx_timeout ) )
    {
        wait self.flame_fx_timeout;
    }
    else
    {
        wait 8;
    }
    
    if ( isdefined( self ) && isalive( self ) )
    {
        self.is_on_fire = 0;
        self notify( #"stop_flame_damage" );
    }
}

// Namespace zombie_death/zombie_death
// Params 0
// Checksum 0x81a13f5e, Offset: 0x1e0
// Size: 0x434
function flame_death_fx()
{
    self endon( #"death" );
    
    if ( isdefined( self.is_on_fire ) && self.is_on_fire )
    {
        return;
    }
    
    if ( isdefined( self.disable_flame_fx ) && self.disable_flame_fx )
    {
        return;
    }
    
    self.is_on_fire = 1;
    self thread on_fire_timeout();
    
    if ( isdefined( level._effect ) && isdefined( level._effect[ #"character_fire_death_torso" ] ) )
    {
        fire_tag = "j_spinelower";
        fire_death_torso_fx = level._effect[ #"character_fire_death_torso" ];
        
        if ( isdefined( self.weapon_specific_fire_death_torso_fx ) )
        {
            fire_death_torso_fx = self.weapon_specific_fire_death_torso_fx;
        }
        
        if ( !isdefined( self gettagorigin( fire_tag ) ) )
        {
            fire_tag = "tag_origin";
        }
        
        if ( !isdefined( self.isdog ) || !self.isdog )
        {
            self fx::play( fire_death_torso_fx, ( 0, 0, 0 ), ( 0, 0, 0 ), "stop_flame_damage", 1, fire_tag );
        }
        
        self.weapon_specific_fire_death_torso_fx = undefined;
    }
    else
    {
        println( "<dev string:x38>" );
    }
    
    if ( isdefined( level._effect ) && isdefined( level._effect[ #"character_fire_death_sm" ] ) )
    {
        if ( !isvehicle( self ) && self.archetype !== "raps" && self.archetype !== "spider" )
        {
            fire_death_sm_fx = level._effect[ #"character_fire_death_sm" ];
            
            if ( isdefined( self.weapon_specific_fire_death_sm_fx ) )
            {
                fire_death_sm_fx = self.weapon_specific_fire_death_sm_fx;
            }
            
            if ( isdefined( self.weapon_specific_fire_death_torso_fx ) )
            {
                fire_death_torso_fx = self.weapon_specific_fire_death_torso_fx;
            }
            
            wait 1;
            tagarray = [];
            tagarray[ 0 ] = "j_elbow_le";
            tagarray[ 1 ] = "j_elbow_ri";
            tagarray[ 2 ] = "j_knee_ri";
            tagarray[ 3 ] = "j_knee_le";
            tagarray = randomize_array( tagarray );
            self fx::play( fire_death_sm_fx, ( 0, 0, 0 ), ( 0, 0, 0 ), "stop_flame_damage", 1, tagarray[ 0 ] );
            wait 1;
            tagarray[ 0 ] = "j_wrist_ri";
            tagarray[ 1 ] = "j_wrist_le";
            
            if ( !isdefined( self.a.gib_ref ) || self.a.gib_ref != "no_legs" )
            {
                tagarray[ 2 ] = "j_ankle_ri";
                tagarray[ 3 ] = "j_ankle_le";
            }
            
            tagarray = randomize_array( tagarray );
            self fx::play( fire_death_sm_fx, ( 0, 0, 0 ), ( 0, 0, 0 ), "stop_flame_damage", 1, tagarray[ 0 ] );
            self fx::play( fire_death_sm_fx, ( 0, 0, 0 ), ( 0, 0, 0 ), "stop_flame_damage", 1, tagarray[ 1 ] );
            self.weapon_specific_fire_death_sm_fx = undefined;
        }
        
        return;
    }
    
    println( "<dev string:xd9>" );
}

// Namespace zombie_death/zombie_death
// Params 1
// Checksum 0x6aaece95, Offset: 0x620
// Size: 0x90
function randomize_array( array )
{
    for ( i = 0; i < array.size ; i++ )
    {
        j = randomint( array.size );
        temp = array[ i ];
        array[ i ] = array[ j ];
        array[ j ] = temp;
    }
    
    return array;
}

// Namespace zombie_death/zombie_death
// Params 0
// Checksum 0x95341e1b, Offset: 0x6b8
// Size: 0x6e
function set_last_gib_time()
{
    anim notify( #"stop_last_gib_time" );
    anim endon( #"stop_last_gib_time" );
    waitframe( 1 );
    anim.lastgibtime = gettime();
    anim.totalgibs = randomintrange( anim.mingibs, anim.maxgibs );
}

// Namespace zombie_death/zombie_death
// Params 1
// Checksum 0xc5aabff6, Offset: 0x730
// Size: 0x362
function get_gib_ref( direction )
{
    if ( isdefined( self.a.gib_ref ) )
    {
        return;
    }
    
    if ( self.damagetaken < 165 )
    {
        return;
    }
    
    if ( gettime() > anim.lastgibtime + anim.gibdelay && anim.totalgibs > 0 )
    {
        anim.totalgibs--;
        anim thread set_last_gib_time();
        refs = [];
        
        switch ( direction )
        {
            case #"right":
                refs[ refs.size ] = "left_arm";
                refs[ refs.size ] = "left_leg";
                gib_ref = get_random( refs );
                break;
            case #"left":
                refs[ refs.size ] = "right_arm";
                refs[ refs.size ] = "right_leg";
                gib_ref = get_random( refs );
                break;
            case #"forward":
                refs[ refs.size ] = "right_arm";
                refs[ refs.size ] = "left_arm";
                refs[ refs.size ] = "right_leg";
                refs[ refs.size ] = "left_leg";
                refs[ refs.size ] = "guts";
                refs[ refs.size ] = "no_legs";
                gib_ref = get_random( refs );
                break;
            case #"back":
                refs[ refs.size ] = "right_arm";
                refs[ refs.size ] = "left_arm";
                refs[ refs.size ] = "right_leg";
                refs[ refs.size ] = "left_leg";
                refs[ refs.size ] = "no_legs";
                gib_ref = get_random( refs );
                break;
            default:
                refs[ refs.size ] = "right_arm";
                refs[ refs.size ] = "left_arm";
                refs[ refs.size ] = "right_leg";
                refs[ refs.size ] = "left_leg";
                refs[ refs.size ] = "no_legs";
                refs[ refs.size ] = "guts";
                gib_ref = get_random( refs );
                break;
        }
        
        self.a.gib_ref = gib_ref;
        return;
    }
    
    self.a.gib_ref = undefined;
}

// Namespace zombie_death/zombie_death
// Params 1
// Checksum 0x958c6419, Offset: 0xaa0
// Size: 0x28
function get_random( array )
{
    return array[ randomint( array.size ) ];
}

// Namespace zombie_death/zombie_death
// Params 0
// Checksum 0xd380318e, Offset: 0xad0
// Size: 0x1aa
function do_gib()
{
    if ( !isdefined( self.a.gib_ref ) )
    {
        return;
    }
    
    if ( isdefined( self.is_on_fire ) && self.is_on_fire )
    {
        return;
    }
    
    switch ( self.a.gib_ref )
    {
        case #"right_arm":
            gibserverutils::gibrightarm( self );
            break;
        case #"left_arm":
            gibserverutils::gibleftarm( self );
            break;
        case #"right_leg":
            gibserverutils::gibrightleg( self );
            break;
        case #"left_leg":
            gibserverutils::gibleftleg( self );
            break;
        case #"no_legs":
            gibserverutils::giblegs( self );
            break;
        case #"head":
            gibserverutils::gibhead( self );
            break;
        case #"guts":
            break;
        default:
            assertmsg( "<dev string:x174>" + self.a.gib_ref + "<dev string:x188>" );
            break;
    }
}


#using scripts\core_common\math_shared;

#namespace face;

// Namespace face/face
// Params 1
// Checksum 0x29d674dd, Offset: 0x108
// Size: 0x144
function saygenericdialogue( typestring )
{
    if ( level.disablegenericdialog )
    {
        return;
    }
    
    switch ( typestring )
    {
        case #"attack":
            importance = 0.5;
            break;
        case #"swing":
            importance = 0.5;
            typestring = "attack";
            break;
        case #"flashbang":
            importance = 0.7;
            break;
        case #"pain_small":
            importance = 0.4;
            break;
        case #"pain_bullet":
            wait 0.01;
            importance = 0.4;
            break;
        default:
            println( "<dev string:x38>" + typestring );
            importance = 0.3;
            break;
    }
    
    saygenericdialoguewithimportance( typestring, importance );
}

// Namespace face/face
// Params 2
// Checksum 0xcaef3e10, Offset: 0x258
// Size: 0xb4
function saygenericdialoguewithimportance( typestring, importance )
{
    soundalias = "dds_";
    
    if ( isdefined( self.dds_characterid ) )
    {
        soundalias += self.dds_characterid;
    }
    else
    {
        println( "<dev string:x5d>" );
        return;
    }
    
    soundalias += "_" + typestring;
    
    if ( soundexists( soundalias ) )
    {
        self thread playfacethread( undefined, soundalias, importance );
    }
}

// Namespace face/face
// Params 1
// Checksum 0xab2e56fd, Offset: 0x318
// Size: 0x1e
function setidlefacedelayed( facialanimationarray )
{
    self.a.idleface = facialanimationarray;
}

// Namespace face/face
// Params 1
// Checksum 0xb91afa6d, Offset: 0x340
// Size: 0x44
function setidleface( facialanimationarray )
{
    if ( !anim.usefacialanims )
    {
        return;
    }
    
    self.a.idleface = facialanimationarray;
    self playidleface();
}

// Namespace face/face
// Params 7
// Checksum 0xb9a0d28f, Offset: 0x390
// Size: 0x6c
function sayspecificdialogue( facialanim, soundalias, importance, notifystring, waitornot, timetowait, player_or_team )
{
    self thread playfacethread( facialanim, soundalias, importance, notifystring, waitornot, timetowait, player_or_team );
}

// Namespace face/face
// Params 0
// Checksum 0xb620a197, Offset: 0x408
// Size: 0x4
function playidleface()
{
    
}

// Namespace face/face
// Params 7
// Checksum 0x9f881ce9, Offset: 0x418
// Size: 0x6fe
function playfacethread( facialanim, str_script_alias, importance, notifystring, waitornot, timetowait, player_or_team )
{
    self endon( #"death" );
    
    if ( !isdefined( str_script_alias ) )
    {
        wait 1;
        self notify( notifystring );
        return;
    }
    
    str_notify_alias = str_script_alias;
    
    if ( !isdefined( level.numberofimportantpeopletalking ) )
    {
        level.numberofimportantpeopletalking = 0;
    }
    
    if ( !isdefined( level.talknotifyseed ) )
    {
        level.talknotifyseed = 0;
    }
    
    if ( !isdefined( notifystring ) )
    {
        notifystring = "PlayFaceThread " + str_script_alias;
    }
    
    if ( !isdefined( self.a ) )
    {
        self.a = spawnstruct();
    }
    
    if ( !isdefined( self.a.facialsounddone ) )
    {
        self.a.facialsounddone = 1;
    }
    
    if ( !isdefined( self.istalking ) )
    {
        self.istalking = 0;
    }
    
    if ( self.istalking )
    {
        if ( isdefined( self.a.currentdialogimportance ) )
        {
            if ( importance < self.a.currentdialogimportance )
            {
                wait 1;
                self notify( notifystring );
                return;
            }
            else if ( importance == self.a.currentdialogimportance )
            {
                if ( self.a.facialsoundalias == str_script_alias )
                {
                    return;
                }
                
                println( "<dev string:x87>" + self.a.facialsoundalias + "<dev string:xa2>" + str_script_alias );
                
                while ( self.istalking )
                {
                    self waittill( #"done speaking" );
                }
            }
        }
        else
        {
            println( "<dev string:xae>" + self.a.facialsoundalias + "<dev string:xa2>" + str_script_alias );
            self stopsound( self.a.facialsoundalias );
            self notify( #"cancel speaking" );
            
            while ( self.istalking )
            {
                self waittill( #"done speaking" );
            }
        }
    }
    
    assert( self.a.facialsounddone );
    assert( self.a.facialsoundalias == undefined );
    assert( self.a.facialsoundnotify == undefined );
    assert( self.a.currentdialogimportance == undefined );
    assert( !self.istalking );
    self notify( #"bc_interrupt" );
    self.istalking = 1;
    self.a.facialsounddone = 0;
    self.a.facialsoundnotify = notifystring;
    self.a.facialsoundalias = str_script_alias;
    self.a.currentdialogimportance = importance;
    
    if ( importance == 1 )
    {
        level.numberofimportantpeopletalking += 1;
    }
    
    /#
        if ( level.numberofimportantpeopletalking > 1 )
        {
            println( "<dev string:xcd>" + str_script_alias );
        }
    #/
    
    uniquenotify = notifystring + " " + level.talknotifyseed;
    level.talknotifyseed += 1;
    
    if ( isdefined( level.scr_sound ) && isdefined( level.scr_sound[ #"generic" ] ) )
    {
        str_vox_file = level.scr_sound[ #"generic" ][ str_script_alias ];
    }
    
    if ( !isdefined( str_vox_file ) && soundexists( str_script_alias ) )
    {
        str_vox_file = str_script_alias;
    }
    
    if ( isdefined( str_vox_file ) )
    {
        if ( soundexists( str_vox_file ) )
        {
            if ( isdefined( player_or_team ) )
            {
                self thread _play_sound_to_player_with_notify( str_vox_file, player_or_team, uniquenotify );
            }
            else if ( isdefined( self gettagorigin( "J_Head" ) ) )
            {
                self playsoundwithnotify( str_vox_file, uniquenotify, "J_Head" );
            }
            else
            {
                self playsoundwithnotify( str_vox_file, uniquenotify );
            }
        }
        else
        {
            /#
                println( "<dev string:x10e>" + str_script_alias + "<dev string:x12c>" );
                self thread _missing_dialog( str_script_alias, str_vox_file, uniquenotify );
            #/
        }
    }
    else
    {
        self thread _temp_dialog( str_script_alias, uniquenotify );
    }
    
    self waittill( #"death", #"cancel speaking", uniquenotify );
    
    if ( importance == 1 )
    {
        level.numberofimportantpeopletalking -= 1;
        level.importantpeopletalkingtime = gettime();
    }
    
    if ( isdefined( self ) )
    {
        self.istalking = 0;
        self.a.facialsounddone = 1;
        self.a.facialsoundnotify = undefined;
        self.a.facialsoundalias = undefined;
        self.a.currentdialogimportance = undefined;
        self.lastsaytime = gettime();
    }
    
    self notify( #"done speaking", { #vo_line:str_notify_alias } );
    self notify( notifystring );
}

// Namespace face/face
// Params 3
// Checksum 0x8d79f8ba, Offset: 0xb20
// Size: 0xfc
function _play_sound_to_player_with_notify( soundalias, player_or_team, uniquenotify )
{
    self endon( #"death" );
    
    if ( isplayer( player_or_team ) )
    {
        player_or_team endon( #"death" );
        self playsoundtoplayer( soundalias, player_or_team );
    }
    else if ( isstring( player_or_team ) )
    {
        self playsoundtoteam( soundalias, player_or_team );
    }
    
    n_playbacktime = soundgetplaybacktime( soundalias );
    
    if ( n_playbacktime > 0 )
    {
        wait n_playbacktime * 0.001;
    }
    else
    {
        wait 1;
    }
    
    self notify( uniquenotify );
}

// Namespace face/face
// Params 3, eflags: 0x4
// Checksum 0xc3e7d4ed, Offset: 0xc28
// Size: 0x33c
function private _temp_dialog( str_line, uniquenotify, b_missing_vo = 0 )
{
    setdvar( #"bgcache_disablewarninghints", 1 );
    
    if ( !b_missing_vo && isdefined( self.propername ) )
    {
        str_line = self.propername + ": " + str_line;
    }
    
    foreach ( player in level.players )
    {
        if ( !isdefined( player getluimenu( "TempDialog" ) ) )
        {
            player openluimenu( "TempDialog" );
        }
        
        player setluimenudata( player getluimenu( "TempDialog" ), #"dialogtext", str_line );
        
        if ( b_missing_vo )
        {
            player setluimenudata( player getluimenu( "TempDialog" ), #"title", "MISSING VO SOUND" );
            continue;
        }
        
        player setluimenudata( player getluimenu( "TempDialog" ), #"title", "TEMP VO" );
    }
    
    n_wait_time = ( strtok( str_line, " " ).size - 1 ) / 2;
    n_wait_time = math::clamp( n_wait_time, 2, 5 );
    self waittilltimeout( n_wait_time, #"death", #"cancel speaking" );
    
    foreach ( player in level.players )
    {
        if ( isdefined( player getluimenu( "TempDialog" ) ) )
        {
            player closeluimenu( player getluimenu( "TempDialog" ) );
        }
    }
    
    setdvar( #"bgcache_disablewarninghints", 0 );
    self notify( uniquenotify );
}

// Namespace face/face
// Params 3, eflags: 0x4
// Checksum 0xb8554e4c, Offset: 0xf70
// Size: 0x54
function private _missing_dialog( str_script_alias, str_vox_file, uniquenotify )
{
    _temp_dialog( "script id: " + str_script_alias + " sound alias: " + str_vox_file, uniquenotify, 1 );
}

// Namespace face/face
// Params 3
// Checksum 0x62164a60, Offset: 0xfd0
// Size: 0x5a
function playface_waitfornotify( waitforstring, notifystring, killmestring )
{
    self endon( #"death", killmestring );
    self waittill( waitforstring );
    self.a.facewaitforresult = "notify";
    self notify( notifystring );
}

// Namespace face/face
// Params 3
// Checksum 0x8d0ce4c9, Offset: 0x1038
// Size: 0x56
function playface_waitfortime( time, notifystring, killmestring )
{
    self endon( #"death", killmestring );
    wait time;
    self.a.facewaitforresult = "time";
    self notify( notifystring );
}


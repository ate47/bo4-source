#using scripts\core_common\player\player_stats;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\callings\zm_callings_devgui;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zm_callings;

// Namespace zm_callings/zm_callings
// Params 0, eflags: 0x2
// Checksum 0x2705bf5d, Offset: 0xc0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_callings", &__init__, &__main__, undefined );
}

// Namespace zm_callings/zm_callings
// Params 0
// Checksum 0xdaafe3d2, Offset: 0x110
// Size: 0x196
function __init__()
{
    level.callingsbundle = getscriptbundle( #"t8_callings_settings" );
    
    if ( isdefined( level.callingsbundle.var_2e61f0ce ) )
    {
        for ( i = 0; i < level.callingsbundle.var_2e61f0ce.size ; i++ )
        {
            for ( j = 0; j < level.callingsbundle.var_2e61f0ce[ i ].factionlist.size ; j++ )
            {
                level.callingsbundle.var_2e61f0ce[ i ].var_ecb4fc1[ hash( level.callingsbundle.var_2e61f0ce[ i ].factionlist[ j ].var_b3bfb429 ) ] = level.callingsbundle.var_2e61f0ce[ i ].factionlist[ j ];
                level.callingsbundle.var_2e61f0ce[ i ].var_ecb4fc1[ hash( level.callingsbundle.var_2e61f0ce[ i ].factionlist[ j ].var_b3bfb429 ) ].index = j;
            }
        }
    }
}

// Namespace zm_callings/zm_callings
// Params 0
// Checksum 0x669621bb, Offset: 0x2b0
// Size: 0x1c
function __main__()
{
    /#
        level thread zm_callings_devgui::function_9f47471();
    #/
}

// Namespace zm_callings/zm_callings
// Params 6, eflags: 0x4
// Checksum 0x3bb97da9, Offset: 0x2d8
// Size: 0x236
function private function_c3be3572( var_9c939fff, var_27426b47, target, xp, var_b68d50cb = 1, var_7b2027fe = 1 )
{
    var_1eb89301 = getscriptbundle( var_9c939fff );
    
    if ( isdefined( var_1eb89301.callingtask ) )
    {
        var_341c004b = undefined;
        
        for ( i = 0; i < level.callingsbundle.tasklist.size ; i++ )
        {
            if ( level.callingsbundle.tasklist[ i ].task == var_9c939fff )
            {
                var_341c004b = i;
                break;
            }
        }
        
        if ( isdefined( var_341c004b ) )
        {
            if ( !isdefined( self.var_96d6f6d1 ) )
            {
                self.var_96d6f6d1 = array();
            }
            
            var_d1017f27 = { #var_e226ec4f:target, #var_ad971622:var_1eb89301.callingtask, #n_xp:xp, #var_de86e878:var_341c004b, #var_30c47a21:var_27426b47, #var_4a01cb77:self.var_96d6f6d1.size, #var_52ac6e9c:var_b68d50cb, #var_949f9254:var_7b2027fe };
            
            if ( !isdefined( self.var_96d6f6d1 ) )
            {
                self.var_96d6f6d1 = [];
            }
            else if ( !isarray( self.var_96d6f6d1 ) )
            {
                self.var_96d6f6d1 = array( self.var_96d6f6d1 );
            }
            
            self.var_96d6f6d1[ self.var_96d6f6d1.size ] = var_d1017f27;
        }
    }
}

// Namespace zm_callings/zm_callings
// Params 0
// Checksum 0x97cbe5c4, Offset: 0x518
// Size: 0x544
function function_f3393d6a()
{
    var_ef74f2da = self stats::get_stat( #"playercalling", #"hash_5bf1ebbfa7b16c64" );
    
    if ( !var_ef74f2da )
    {
        return;
    }
    
    self.var_e06cb519 = self stats::get_stat( #"playercalling", #"currentseason" );
    self.var_bf6f8ec3 = self stats::get_stat( #"playercalling", #"hash_3a5ab6fb11258ebf" );
    
    if ( zm_utility::is_classic() || zm_utility::is_standard() )
    {
        self.var_d0b65bbe = hash( self stats::get_stat( #"playercalling", #"currentfaction" ) );
        var_3afde5e2 = hash( self stats::get_stat( #"playercalling", #"seasons", self.var_e06cb519, #"hash_7e597fbe41270a4d" ) );
        var_51fe014e = level.callingsbundle.var_2e61f0ce[ self.var_e06cb519 ].var_ecb4fc1[ var_3afde5e2 ].var_642e4919 - 1;
        var_51fe014e += self.var_bf6f8ec3;
        var_51fe014e %= level.callingsbundle.factioncallings.size;
        
        if ( zm_utility::is_classic() )
        {
            var_98a2d658 = level.callingsbundle.factioncallings[ var_51fe014e ].classicpact;
            
            foreach ( task in var_98a2d658 )
            {
                self function_c3be3572( task.task, #"hash_20deab97abbf7b12", task.target, task.xp );
            }
        }
        else if ( zm_utility::is_standard() )
        {
            var_c53e054e = level.callingsbundle.factioncallings[ var_51fe014e ].rushpact;
            
            foreach ( task in var_c53e054e )
            {
                self function_c3be3572( task.task, #"hash_764a5fc3ba8820d2", task.target, task.xp );
            }
        }
        
        return;
    }
    
    self.var_eb15d3ac = level.callingsbundle.var_2e61f0ce[ self.var_e06cb519 ].var_203c6468[ self.var_bf6f8ec3 ].tcmgametype;
    str_gametype = util::get_game_type();
    
    if ( self.var_eb15d3ac == str_gametype )
    {
        s_tcm = level.callingsbundle.var_2e61f0ce[ self.var_e06cb519 ].var_203c6468[ self.var_bf6f8ec3 ];
        
        foreach ( task in s_tcm.tcmpact )
        {
            self function_c3be3572( task.task, #"hash_647ebc7d24425fee", task.target, task.xp );
        }
        
        self function_c3be3572( s_tcm.tcmgoal, #"tcmgoal", s_tcm.tcmgoaltarget, s_tcm.tcmgoalxp, 0, 0 );
    }
}

// Namespace zm_callings/zm_callings
// Params 3, eflags: 0x4
// Checksum 0x47bc3db6, Offset: 0xa68
// Size: 0x15c
function private function_10a1ac3c( var_d1017f27, var_e06cb519, var_bf6f8ec3 )
{
    if ( isdefined( var_d1017f27.var_949f9254 ) && var_d1017f27.var_949f9254 )
    {
        if ( isdefined( var_d1017f27.var_52ac6e9c ) && var_d1017f27.var_52ac6e9c )
        {
            return self stats::get_stat( #"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, var_d1017f27.var_4a01cb77, #"progress" );
        }
        else
        {
            return self stats::get_stat( #"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, #"progress" );
        }
        
        return;
    }
    
    if ( !isdefined( var_d1017f27.var_1020847d ) )
    {
        var_d1017f27.var_1020847d = 0;
    }
    
    return var_d1017f27.var_1020847d;
}

// Namespace zm_callings/zm_callings
// Params 4, eflags: 0x4
// Checksum 0x9af2baff, Offset: 0xbd0
// Size: 0x172
function private function_66714869( var_d1017f27, var_e06cb519, var_bf6f8ec3, n_inc )
{
    if ( isdefined( var_d1017f27.var_949f9254 ) && var_d1017f27.var_949f9254 )
    {
        if ( isdefined( var_d1017f27.var_52ac6e9c ) && var_d1017f27.var_52ac6e9c )
        {
            self stats::inc_stat( #"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, var_d1017f27.var_4a01cb77, #"progress", n_inc );
        }
        else
        {
            self stats::inc_stat( #"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, #"progress", n_inc );
        }
        
        return;
    }
    
    if ( !isdefined( var_d1017f27.var_1020847d ) )
    {
        var_d1017f27.var_1020847d = 0;
    }
    
    var_d1017f27.var_1020847d += n_inc;
}

// Namespace zm_callings/zm_callings
// Params 5, eflags: 0x4
// Checksum 0x58524fcc, Offset: 0xd50
// Size: 0x18c
function private function_a6a40735( var_d1017f27, var_e06cb519, var_bf6f8ec3, n_value, var_32a60884 = 0 )
{
    if ( !( isdefined( var_d1017f27.var_949f9254 ) && var_d1017f27.var_949f9254 ) )
    {
        var_d1017f27.var_1020847d = n_value;
    }
    
    if ( isdefined( var_d1017f27.var_949f9254 ) && var_d1017f27.var_949f9254 || var_32a60884 )
    {
        if ( isdefined( var_d1017f27.var_52ac6e9c ) && var_d1017f27.var_52ac6e9c )
        {
            self stats::set_stat( #"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, var_d1017f27.var_4a01cb77, #"progress", n_value );
            return;
        }
        
        self stats::set_stat( #"playercalling", #"seasons", var_e06cb519, #"callings", var_bf6f8ec3, var_d1017f27.var_30c47a21, #"progress", n_value );
    }
}

// Namespace zm_callings/zm_callings
// Params 2, eflags: 0x4
// Checksum 0xb1419030, Offset: 0xee8
// Size: 0x3e
function private function_7b01d125( var_a0639b8c, var_f65a9845 )
{
    return level.callingsbundle.var_2e61f0ce[ var_a0639b8c ].var_ecb4fc1[ var_f65a9845 ].index;
}

// Namespace zm_callings/zm_callings
// Params 0, eflags: 0x4
// Checksum 0xa8bd1b77, Offset: 0xf30
// Size: 0x340
function private function_104c5d35()
{
    var_94237d8 = array( #"hash_20deab97abbf7b12", #"hash_764a5fc3ba8820d2", #"hash_647ebc7d24425fee", #"tcmgoal" );
    
    foreach ( var_acbd7392 in var_94237d8 )
    {
        var_1e9f2834 = 1;
        var_ed9fe2be = 0;
        
        foreach ( var_d1017f27 in self.var_96d6f6d1 )
        {
            if ( var_d1017f27.var_30c47a21 == var_acbd7392 )
            {
                var_e4edaaf0 = self function_10a1ac3c( var_d1017f27, self.var_e06cb519, self.var_bf6f8ec3 );
                n_target = var_d1017f27.var_e226ec4f;
                
                if ( var_e4edaaf0 < n_target )
                {
                    var_1e9f2834 = 0;
                    break;
                }
                
                if ( !var_ed9fe2be && isdefined( var_d1017f27.var_89ed7b39 ) && var_d1017f27.var_89ed7b39 )
                {
                    var_d1017f27.var_89ed7b39 = 0;
                    var_ed9fe2be = 1;
                }
            }
        }
        
        if ( isdefined( var_1e9f2834 ) && var_1e9f2834 && isdefined( var_ed9fe2be ) && var_ed9fe2be )
        {
            self luinotifyevent( #"zombie_callings_notification", 4, 3, function_7b01d125( self.var_e06cb519, self.var_d0b65bbe ) + 1, self.var_e06cb519 + 1, self getentitynumber() );
            self stats::inc_stat( #"playercalling", #"seasons", self.var_e06cb519, #"factions", self.var_d0b65bbe, #"hash_7a54171ce10db54f", 1 );
            
            /#
                iprintln( "<dev string:x38>" + function_9e72a96( var_acbd7392 ) + "<dev string:x53>" + function_9e72a96( self.var_d0b65bbe ) );
            #/
        }
    }
}

// Namespace zm_callings/zm_callings
// Params 2
// Checksum 0xd08f827, Offset: 0x1278
// Size: 0x2c4
function function_4368582a( var_d1017f27, n_value = 1 )
{
    var_e4edaaf0 = self function_10a1ac3c( var_d1017f27, self.var_e06cb519, self.var_bf6f8ec3 );
    n_target = var_d1017f27.var_e226ec4f;
    
    if ( var_e4edaaf0 < n_target )
    {
        if ( var_e4edaaf0 + n_value >= n_target )
        {
            var_d1017f27.var_89ed7b39 = 1;
            self function_a6a40735( var_d1017f27, self.var_e06cb519, self.var_bf6f8ec3, n_target, 1 );
            self addrankxpvalue( "faction_calling_task", var_d1017f27.n_xp );
            self luinotifyevent( #"zombie_callings_notification", 3, 2, var_d1017f27.var_de86e878, self getentitynumber() );
            
            /#
                iprintln( self.name + "<dev string:x7c>" + function_9e72a96( var_d1017f27.var_ad971622 ) + "<dev string:x8f>" + var_d1017f27.n_xp + "<dev string:xa7>" );
            #/
            
            self function_104c5d35();
            uploadstats( self );
            self function_4835d26a();
        }
        else
        {
            /#
                progress = var_e4edaaf0 + n_value;
                target = n_target;
                iprintln( self.name + "<dev string:x7c>" + function_9e72a96( var_d1017f27.var_ad971622 ) + "<dev string:xad>" + progress + "<dev string:xbf>" + target );
            #/
            
            self function_66714869( var_d1017f27, self.var_e06cb519, self.var_bf6f8ec3, n_value );
        }
        
        return;
    }
    
    /#
        return self function_10a1ac3c( var_d1017f27, self.var_e06cb519, self.var_bf6f8ec3 );
    #/
}


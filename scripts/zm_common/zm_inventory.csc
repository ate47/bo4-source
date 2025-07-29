#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_maptable;

#namespace zm_inventory;

// Namespace zm_inventory/zm_inventory
// Params 4, eflags: 0x4
// Checksum 0x4fbce31e, Offset: 0x1e8
// Size: 0xea
function private function_cb96f01d( mappingname, internalname, numbits, ispersonal )
{
    if ( !isdefined( level.var_a16c38d9[ mappingname ] ) )
    {
        level.var_a16c38d9[ mappingname ] = spawnstruct();
    }
    
    if ( isdefined( ispersonal ) && ispersonal )
    {
        internalname = "ZMInventoryPersonal." + internalname;
    }
    else
    {
        internalname = "ZMInventory." + internalname;
    }
    
    level.var_a16c38d9[ mappingname ].var_cd35dfb2 = internalname;
    level.var_a16c38d9[ mappingname ].numbits = numbits;
    level.var_a16c38d9[ mappingname ].ispersonal = ispersonal;
}

// Namespace zm_inventory/zm_inventory
// Params 0
// Checksum 0x4ff06924, Offset: 0x2e0
// Size: 0x810
function function_c7c05a13()
{
    level.var_a16c38d9 = [];
    fields = zm_maptable::function_10672567();
    
    if ( !isdefined( fields ) || !isdefined( fields.zm_inventory ) )
    {
        return;
    }
    
    var_21249230 = getscriptbundle( fields.zm_inventory );
    level.var_a16c38d9 = [];
    
    if ( isdefined( var_21249230.challenges ) && isdefined( var_21249230.var_5a90928f ) )
    {
        function_cb96f01d( var_21249230.var_5a90928f, "ChallengesInfo.stage", 5, 1 );
        
        if ( isdefined( var_21249230.var_f7d932ea ) )
        {
            function_cb96f01d( var_21249230.var_f7d932ea, "ChallengesInfo.currentProgress", 7, 1 );
        }
        
        if ( isdefined( var_21249230.var_c53f31a1 ) )
        {
            function_cb96f01d( var_21249230.var_c53f31a1, "ChallengesInfo.numNeeded", 7, 1 );
        }
    }
    
    if ( isdefined( var_21249230.sentinelstages ) && isdefined( var_21249230.var_88c17f11 ) )
    {
        function_cb96f01d( var_21249230.var_88c17f11, "ObjProgInfo.Eye.stage", 2, var_21249230.var_f3d39d90 );
    }
    
    if ( isdefined( var_21249230.var_38b9613 ) && var_21249230.var_38b9613 )
    {
        if ( isdefined( var_21249230.objnonlinearprogitems ) )
        {
            for ( i = 0; i < var_21249230.objnonlinearprogitems.size ; i++ )
            {
                item = var_21249230.objnonlinearprogitems[ i ];
                
                if ( isdefined( item.var_846fa8e ) )
                {
                    clientfield = "ObjProgInfo.NonlinearObjProgRingItemInfos." + i + 1 + ".earned";
                    function_cb96f01d( item.var_846fa8e, clientfield, 1, var_21249230.var_f3d39d90 );
                }
            }
        }
    }
    else if ( isdefined( var_21249230.objprogitems ) && isdefined( var_21249230.var_846fa8e ) )
    {
        function_cb96f01d( var_21249230.var_846fa8e, "ObjProgInfo.Ring.stage", 4, var_21249230.var_f3d39d90 );
    }
    
    if ( isdefined( var_21249230.packapunchitems ) )
    {
        for ( i = 0; i < var_21249230.packapunchitems.size ; i++ )
        {
            item = var_21249230.packapunchitems[ i ];
            
            if ( isdefined( item.clientfield ) )
            {
                clientfield = "PaPItems." + i + 1 + ".stage";
                function_cb96f01d( item.clientfield, clientfield, 2, item.var_7db3435c );
            }
        }
    }
    
    if ( isdefined( var_21249230.wonderweaponphases ) )
    {
        if ( isdefined( var_21249230.var_b10f2611 ) )
        {
            function_cb96f01d( var_21249230.var_b10f2611, "WonderWeaponPhaseInfo.phase", 2, var_21249230.var_3e38620e );
        }
        
        var_867e2c15 = -1;
        var_b3aac704 = -1;
        index = 1;
        
        for ( p = 0; p < var_21249230.wonderweaponphases.size ; p++ )
        {
            phase = var_21249230.wonderweaponphases[ p ];
            
            for ( c = 0; c < phase.components.size ; c++ )
            {
                component = phase.components[ c ];
                
                if ( isdefined( component.clientfield ) )
                {
                    var_2641997d = "WonderWeaponItems." + index + ".stage";
                    function_cb96f01d( component.clientfield, var_2641997d, 3, component.var_7db3435c );
                }
                
                if ( isdefined( component.var_9f618001 ) )
                {
                    var_9f618001 = "WonderWeaponItems." + index + ".numAcquired";
                    function_cb96f01d( component.var_9f618001, var_9f618001, 2, component.var_7db3435c );
                }
                
                index++;
            }
        }
    }
    
    if ( isdefined( var_21249230.shieldpieces ) )
    {
        for ( p = 0; p < var_21249230.shieldpieces.size ; p++ )
        {
            if ( isdefined( var_21249230.shieldpieces[ p ].clientfield ) )
            {
                clientfield = "ShieldPieces." + p + 1 + ".stage";
                function_cb96f01d( var_21249230.shieldpieces[ p ].clientfield, clientfield, 1, var_21249230.shieldpieces[ p ].var_7db3435c );
            }
        }
    }
    
    if ( isdefined( var_21249230.quests ) )
    {
        for ( q = 0; q < var_21249230.quests.size ; q++ )
        {
            quest = var_21249230.quests[ q ];
            
            if ( isdefined( quest.var_a0ebe517 ) )
            {
                var_e7e5896d = "QuestPhaseInfos." + q + 1 + ".phase";
                function_cb96f01d( var_21249230.quests[ q ].var_a0ebe517, var_e7e5896d, 2, var_21249230.quests[ q ].var_7db3435c );
            }
            
            var_d4cb13fd = "Quest" + q + 1;
            index = 1;
            
            for ( p = 0; p < quest.phases.size ; p++ )
            {
                phase = quest.phases[ p ];
                
                for ( i = 0; i < phase.items.size ; i++ )
                {
                    if ( isdefined( phase.items[ i ].clientfield ) )
                    {
                        var_2641997d = var_d4cb13fd + "." + index + ".stage";
                        function_cb96f01d( phase.items[ i ].clientfield, var_2641997d, 2, phase.items[ i ].var_7db3435c );
                    }
                    
                    index++;
                }
            }
        }
    }
}


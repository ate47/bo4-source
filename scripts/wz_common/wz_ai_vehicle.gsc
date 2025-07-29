#using scripts\core_common\ai\blackboard_vehicle;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\vehicle_ai_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\killstreaks\ai_tank_shared;
#using scripts\weapons\heatseekingmissile;

#namespace wz_ai_vehicle;

// Namespace wz_ai_vehicle/wz_ai_vehicle
// Params 0
// Checksum 0xf81c4171, Offset: 0x118
// Size: 0x44
function function_e1a09b01()
{
    level endon( #"game_ended" );
    wait 4;
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace wz_ai_vehicle/wz_ai_vehicle
// Params 1
// Checksum 0x9b3c7cb1, Offset: 0x168
// Size: 0x24
function state_combat_enter( params )
{
    self thread ai_tank::turretfireupdate();
}

// Namespace wz_ai_vehicle/wz_ai_vehicle
// Params 0
// Checksum 0xc010113d, Offset: 0x198
// Size: 0x126
function path_update_interrupt_by_attacker()
{
    self notify( #"path_update_interrupt_by_attacker" );
    self endon( #"death", #"change_state", #"near_goal", #"reached_end_node", #"amws_end_interrupt_watch", #"path_update_interrupt_by_attacker" );
    self waittill( #"locking on", #"missile_lock", #"damage" );
    
    if ( self.locked_on || self.locking_on )
    {
        /#
            self.debug_ai_move_to_points_considered = [];
        #/
        
        /#
            self.debug_ai_movement_type = "<dev string:x38>";
        #/
        
        /#
            self.debug_ai_move_to_point = undefined;
        #/
        
        self function_d4c687c9();
        self.lock_evade_now = 1;
    }
    
    self notify( #"near_goal" );
}

// Namespace wz_ai_vehicle/wz_ai_vehicle
// Params 0
// Checksum 0x9dfe9006, Offset: 0x2c8
// Size: 0x224
function path_update_interrupt()
{
    self notify( #"path_update_interrupt_by_attacker" );
    self endon( #"death", #"change_state", #"near_goal", #"reached_end_node", #"amws_end_interrupt_watch", #"path_update_interrupt_by_attacker" );
    wait 1;
    
    while ( true )
    {
        if ( isdefined( self.current_pathto_pos ) )
        {
            if ( distance2dsquared( self.current_pathto_pos, self.goalpos ) > self.goalradius * self.goalradius )
            {
                wait 0.2;
                self notify( #"near_goal" );
            }
        }
        
        if ( isdefined( self.enemy ) )
        {
            if ( self cansee( self.enemy ) && distance2dsquared( self.origin, self.enemy.origin ) < 0.4 * ( self.settings.engagementdistmin + self.settings.engagementdistmax ) * 0.4 * ( self.settings.engagementdistmin + self.settings.engagementdistmax ) )
            {
                self notify( #"near_goal" );
            }
            
            if ( util::iscooldownready( "rocket" ) && util::iscooldownready( "rocket_launcher_check" ) )
            {
                util::cooldown( "rocket_launcher_check", 2.5 );
                self notify( #"near_goal" );
            }
        }
        
        wait 0.2;
    }
}

// Namespace wz_ai_vehicle/wz_ai_vehicle
// Params 1
// Checksum 0xea45b74a, Offset: 0x4f8
// Size: 0x368
function state_combat_update( params )
{
    self endon( #"change_state", #"death" );
    self setspeed( self.settings.defaultmovespeed );
    self setacceleration( isdefined( self.settings.default_move_acceleration ) ? self.settings.default_move_acceleration : 10 );
    heatseekingmissile::initlockfield( self );
    
    for ( ;; )
    {
        assert( isdefined( self.ai ) );
        
        if ( !isdefined( self.ai.var_88b0fd29 ) )
        {
            self.ai.var_88b0fd29 = gettime();
        }
        
        var_12cb92c6 = 0;
        goalinfo = self function_4794d6a3();
        forcedgoal = isdefined( goalinfo.goalforced ) && goalinfo.goalforced;
        isatgoal = isdefined( goalinfo.isatgoal ) && goalinfo.isatgoal || self isapproachinggoal() && isdefined( self.overridegoalpos );
        
        if ( isdefined( isatgoal ) && isatgoal )
        {
            self asmrequestsubstate( #"hash_236f963ae1728eb3" );
            self cancelaimove();
            self function_d4c687c9();
        }
        else
        {
            self.current_pathto_pos = getclosestpointonnavmesh( goalinfo.goalpos, self.radius * 2, self.radius );
            should_slow_down_at_goal = 1;
            
            if ( isdefined( self.current_pathto_pos ) && self function_a57c34b7( self.current_pathto_pos, should_slow_down_at_goal, 1 ) )
            {
                self asmrequestsubstate( #"locomotion@movement" );
                self thread path_update_interrupt_by_attacker();
                self thread path_update_interrupt();
                self vehicle_ai::waittill_pathing_done();
                self notify( #"amws_end_interrupt_watch" );
            }
            else
            {
                self asmrequestsubstate( #"hash_236f963ae1728eb3" );
                self cancelaimove();
                self function_d4c687c9();
            }
        }
        
        wait 0.5;
    }
}

// Namespace wz_ai_vehicle/wz_ai_vehicle
// Params 1
// Checksum 0xae3adfee, Offset: 0x868
// Size: 0x32c
function function_de11ece( drone )
{
    drone useanimtree( "generic" );
    vehicle::make_targetable( drone );
    blackboard::createblackboardforentity( drone );
    drone blackboard::registervehicleblackboardattributes();
    drone.health = drone.healthdefault;
    drone vehicle::friendly_fire_shield();
    drone enableaimassist();
    drone setneargoalnotifydist( 40 );
    drone.fovcosine = 0;
    drone.fovcosinebusy = 0.574;
    assert( isdefined( drone.scriptbundlesettings ) );
    drone.settings = struct::get_script_bundle( "vehiclecustomsettings", drone.scriptbundlesettings );
    drone.goalheight = 512;
    drone setgoal( drone.origin, 0, drone.goalradius, drone.goalheight );
    drone.delete_on_death = 0;
    drone.no_free_on_death = 1;
    drone.overridevehicledamage = &ai_tank::drone_callback_damage;
    drone thread vehicle_ai::nudge_collision();
    drone.cobra = 0;
    drone asmrequestsubstate( #"locomotion@movement" );
    drone.variant = "light_weight";
    drone.var_a8c60b0e = 1;
    drone.var_b4c9d62 = 1;
    drone.var_527f38dc = 0;
    drone util::cooldown( "cobra_up", 10 );
    
    if ( isdefined( level.vehicle_initializer_cb ) )
    {
        [[ level.vehicle_initializer_cb ]]( drone );
    }
    
    drone.var_232915af = 1;
    drone vehicle_ai::init_state_machine_for_role( "default" );
    drone vehicle_ai::get_state_callbacks( "combat" ).enter_func = &state_combat_enter;
    drone vehicle_ai::get_state_callbacks( "combat" ).update_func = &state_combat_update;
    drone vehicle_ai::startinitialstate( "combat" );
}


#using scripts\core_common\ai_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace archetype_avogadro;

// Namespace archetype_avogadro/archetype_avogadro
// Params 0, eflags: 0x2
// Checksum 0x340907de, Offset: 0x160
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"archetype_avogadro", &__init__, &__main__, undefined );
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 0
// Checksum 0x9badc01, Offset: 0x1b0
// Size: 0x13c
function __init__()
{
    clientfield::register( "scriptmover", "" + #"avogadro_bolt_fx", 16000, 1, "int", &function_9452b8f1, 0, 0 );
    clientfield::register( "actor", "" + #"avogadro_phase_fx", 16000, 1, "int", &function_1d2d070c, 0, 0 );
    clientfield::register( "actor", "" + #"avogadro_health_fx", 16000, 2, "int", &function_ae4cd3d4, 0, 0 );
    ai::add_archetype_spawn_function( #"avogadro", &initavogadro );
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 0
// Checksum 0x80f724d1, Offset: 0x2f8
// Size: 0x4
function __main__()
{
    
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0x52e111c6, Offset: 0x308
// Size: 0x44
function initavogadro( localclientnum )
{
    util::waittill_dobj( localclientnum );
    self callback::on_shutdown( &on_entity_shutdown );
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0x8b4afaeb, Offset: 0x358
// Size: 0x3c
function on_entity_shutdown( localclientnum )
{
    if ( isdefined( self ) && isdefined( self.jammer_interface ) )
    {
        self.jammer_interface delete();
    }
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 7
// Checksum 0x9472e539, Offset: 0x3a0
// Size: 0xce
function function_9452b8f1( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    util::waittill_dobj( localclientnum );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( newval )
    {
        self.boltfx = function_239993de( localclientnum, "zm_ai/fx8_avo_elec_projectile", self, "tag_origin" );
        return;
    }
    
    if ( isdefined( self.boltfx ) )
    {
        stopfx( localclientnum, self.boltfx );
        self.boltfx = undefined;
    }
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 7
// Checksum 0x4f108a1d, Offset: 0x478
// Size: 0xce
function function_1d2d070c( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    util::waittill_dobj( localclientnum );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( newval )
    {
        self.phase_fx = function_239993de( localclientnum, "zm_ai/fx8_cata_elec_aura", self, "j_spine4" );
        return;
    }
    
    if ( isdefined( self.phase_fx ) )
    {
        stopfx( localclientnum, self.phase_fx );
        self.phase_fx = undefined;
    }
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 7, eflags: 0x4
// Checksum 0x38d9fa96, Offset: 0x550
// Size: 0x1da
function private function_ae4cd3d4( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    util::waittill_dobj( localclientnum );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !isdefined( self.jammer_interface ) )
    {
        self.jammer_interface = util::spawn_model( localclientnum, "tag_origin" );
        self.jammer_interface linkto( self, "j_spine4" );
    }
    
    if ( isdefined( self.health_fx ) )
    {
        stopfx( localclientnum, self.health_fx );
    }
    
    switch ( newval )
    {
        case 3:
            self.health_fx = function_239993de( localclientnum, "zm_ai/fx8_avo_elec_aura_main", self.jammer_interface, "j_spine4" );
            break;
        case 2:
            self.health_fx = function_239993de( localclientnum, "zm_ai/fx8_cata_water_aura", self.jammer_interface, "j_spine4" );
            break;
        case 1:
            self.health_fx = function_239993de( localclientnum, "zm_ai/fx8_avo_elec_aura_weakened", self.jammer_interface, "j_spine4" );
            break;
        default:
            break;
    }
}


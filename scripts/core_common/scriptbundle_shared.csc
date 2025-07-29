#namespace scriptbundle;

// Namespace scriptbundle
// Method(s) 6 Total 6
class cscriptbundleobjectbase
{

    var _e_array;
    var _n_clientnum;
    var _o_scene;
    var _s;

    // Namespace cscriptbundleobjectbase/scriptbundle_shared
    // Params 1
    // Checksum 0x32a5cf5d, Offset: 0x380
    // Size: 0x18
    function get_ent( localclientnum )
    {
        return _e_array[ localclientnum ];
    }

    // Namespace cscriptbundleobjectbase/scriptbundle_shared
    // Params 2
    // Checksum 0x6afaab6a, Offset: 0x250
    // Size: 0x128, Type: bool
    function error( condition, str_msg )
    {
        if ( condition )
        {
            if ( [[ _o_scene ]]->is_testing() )
            {
                scriptbundle::error_on_screen( str_msg );
            }
            else
            {
                assertmsg( [[ _o_scene ]]->get_type() + "<dev string:x58>" + function_9e72a96( _o_scene._str_name ) + "<dev string:x5c>" + ( isdefined( "<dev string:x65>" ) ? "<dev string:x62>" + "<dev string:x65>" : isdefined( _s.name ) ? "<dev string:x62>" + _s.name : "<dev string:x62>" ) + "<dev string:x6f>" + str_msg );
            }
            
            thread [[ _o_scene ]]->on_error();
            return true;
        }
        
        return false;
    }

    // Namespace cscriptbundleobjectbase/scriptbundle_shared
    // Params 1
    // Checksum 0x39078910, Offset: 0x178
    // Size: 0xcc, Type: dev
    function log( str_msg )
    {
        println( [[ _o_scene ]]->get_type() + "<dev string:x58>" + function_9e72a96( _o_scene._str_name ) + "<dev string:x5c>" + ( isdefined( "<dev string:x65>" ) ? "<dev string:x62>" + "<dev string:x65>" : isdefined( _s.name ) ? "<dev string:x62>" + _s.name : "<dev string:x62>" ) + "<dev string:x6f>" + str_msg );
    }

    // Namespace cscriptbundleobjectbase/scriptbundle_shared
    // Params 4
    // Checksum 0x983671e9, Offset: 0xa0
    // Size: 0xca
    function init( s_objdef, o_bundle, e_ent, localclientnum )
    {
        _s = s_objdef;
        _o_scene = o_bundle;
        
        if ( isdefined( e_ent ) )
        {
            assert( !isdefined( localclientnum ) || e_ent.localclientnum == localclientnum, "<dev string:x38>" );
            _n_clientnum = e_ent.localclientnum;
            _e_array[ _n_clientnum ] = e_ent;
            return;
        }
        
        _e_array = [];
        
        if ( isdefined( localclientnum ) )
        {
            _n_clientnum = localclientnum;
        }
    }

}

// Namespace scriptbundle
// Method(s) 12 Total 12
class cscriptbundlebase
{

    var _a_objects;
    var _s;
    var _str_name;
    var _testing;

    // Namespace cscriptbundlebase/scriptbundle_shared
    // Params 0, eflags: 0x8
    // Checksum 0xd109e373, Offset: 0x508
    // Size: 0x1a
    constructor()
    {
        _a_objects = [];
        _testing = 0;
    }

    // Namespace cscriptbundlebase/scriptbundle_shared
    // Params 2
    // Checksum 0xc345e24e, Offset: 0x718
    // Size: 0x9c, Type: bool
    function error( condition, str_msg )
    {
        if ( condition )
        {
            if ( _testing )
            {
            }
            else
            {
                assertmsg( _s.type + "<dev string:x58>" + function_9e72a96( _str_name ) + "<dev string:x74>" + str_msg );
            }
            
            thread on_error();
            return true;
        }
        
        return false;
    }

    // Namespace cscriptbundlebase/scriptbundle_shared
    // Params 1
    // Checksum 0x2574f772, Offset: 0x6b8
    // Size: 0x54, Type: dev
    function log( str_msg )
    {
        println( _s.type + "<dev string:x58>" + _str_name + "<dev string:x74>" + str_msg );
    }

    // Namespace cscriptbundlebase/scriptbundle_shared
    // Params 1
    // Checksum 0x68410bc2, Offset: 0x688
    // Size: 0x24
    function remove_object( o_object )
    {
        arrayremovevalue( _a_objects, o_object );
    }

    // Namespace cscriptbundlebase/scriptbundle_shared
    // Params 1
    // Checksum 0xfdf7769a, Offset: 0x608
    // Size: 0x76
    function add_object( o_object )
    {
        if ( !isdefined( _a_objects ) )
        {
            _a_objects = [];
        }
        else if ( !isarray( _a_objects ) )
        {
            _a_objects = array( _a_objects );
        }
        
        _a_objects[ _a_objects.size ] = o_object;
    }

    // Namespace cscriptbundlebase/scriptbundle_shared
    // Params 0
    // Checksum 0x51cf9d44, Offset: 0x5f0
    // Size: 0xa
    function is_testing()
    {
        return _testing;
    }

    // Namespace cscriptbundlebase/scriptbundle_shared
    // Params 0
    // Checksum 0xc9a2ddf2, Offset: 0x5d0
    // Size: 0x12
    function get_objects()
    {
        return _s.objects;
    }

    // Namespace cscriptbundlebase/scriptbundle_shared
    // Params 0
    // Checksum 0x10c5f25e, Offset: 0x5b0
    // Size: 0x12
    function get_vm()
    {
        return _s.vmtype;
    }

    // Namespace cscriptbundlebase/scriptbundle_shared
    // Params 0
    // Checksum 0xe95c94e9, Offset: 0x590
    // Size: 0x12
    function get_type()
    {
        return _s.type;
    }

    // Namespace cscriptbundlebase/scriptbundle_shared
    // Params 3
    // Checksum 0x85e15d4f, Offset: 0x540
    // Size: 0x42
    function init( str_name, s, b_testing )
    {
        _s = s;
        _str_name = str_name;
        _testing = b_testing;
    }

    // Namespace cscriptbundlebase/scriptbundle_shared
    // Params 1
    // Checksum 0x9410c193, Offset: 0x4f0
    // Size: 0xc
    function on_error( e )
    {
        
    }

}

// Namespace scriptbundle/scriptbundle_shared
// Params 1
// Checksum 0x1f5c66d0, Offset: 0xa30
// Size: 0x16c
function error_on_screen( str_msg )
{
    if ( str_msg != "" )
    {
        if ( !isdefined( level.scene_error_hud ) )
        {
            level.scene_error_hud = createluimenu( 0, "HudElementText" );
            setluimenudata( 0, level.scene_error_hud, #"alignment", 1 );
            setluimenudata( 0, level.scene_error_hud, #"x", 0 );
            setluimenudata( 0, level.scene_error_hud, #"y", 10 );
            setluimenudata( 0, level.scene_error_hud, #"width", 1920 );
            openluimenu( 0, level.scene_error_hud );
        }
        
        setluimenudata( 0, level.scene_error_hud, #"text", str_msg );
        self thread _destroy_error_on_screen();
    }
}

// Namespace scriptbundle/scriptbundle_shared
// Params 0
// Checksum 0xcea829e8, Offset: 0xba8
// Size: 0x6e
function _destroy_error_on_screen()
{
    level notify( #"_destroy_error_on_screen" );
    level endon( #"_destroy_error_on_screen" );
    self waittilltimeout( 5, #"stopped" );
    closeluimenu( 0, level.scene_error_hud );
    level.scene_error_hud = undefined;
}


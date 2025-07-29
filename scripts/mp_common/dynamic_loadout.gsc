#using script_702b73ee97d18efe;
#using scripts\abilities\ability_player;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\loadout_shared;
#using scripts\core_common\player\player_loadout;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\mp_common\armor;
#using scripts\mp_common\gametypes\menus;
#using scripts\mp_common\perks;
#using scripts\mp_common\pickup_health;
#using scripts\mp_common\player\player_loadout;

#namespace dynamic_loadout;

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x2
// Checksum 0xee5af6e0, Offset: 0x4b0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"dynamic_loadout", &__init__, undefined, #"weapons" );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0xa6c35431, Offset: 0x500
// Size: 0x12c
function private __init__()
{
    callback::on_connect( &onconnect );
    level.givecustomloadout = &function_738575c4;
    level.var_67f4fd41 = &function_485e3421;
    level.bountypackagelist = getscriptbundlelist( "bounty_hunter_package_list" );
    registerclientfields();
    level.var_968635ea = bountyhunterbuy::register( "BountyHunterLoadout" );
    
    for ( i = 1; i < 38 ; i++ )
    {
        if ( i == 23 )
        {
            continue;
        }
        
        ability_player::register_gadget_activation_callbacks( i, undefined, &function_597cbfb8 );
    }
    
    callback::on_player_killed_with_params( &onplayerkilled );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 3, eflags: 0x4
// Checksum 0x1abd1ef5, Offset: 0x638
// Size: 0x15c
function private function_597cbfb8( slot, weapon, force = 0 )
{
    if ( !force )
    {
        if ( !isalive( self ) || game.state != "playing" )
        {
            return;
        }
        
        wait 1;
        
        if ( self gadgetisready( slot ) )
        {
            return;
        }
    }
    
    equipdata = self.pers[ #"dynamic_loadout" ].weapons[ 2 ];
    take = 1;
    
    if ( isdefined( equipdata ) )
    {
        if ( equipdata.ammo > 1 )
        {
            equipdata.ammo--;
            take = 0;
        }
    }
    
    if ( take )
    {
        self.pers[ #"dynamic_loadout" ].weapons[ 2 ] = undefined;
        function_ff8ef46b( 2, "luielement.BountyHunterLoadout.equipment", 0 );
        self function_9ede386f( slot );
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 1, eflags: 0x4
// Checksum 0x5ebf07c9, Offset: 0x7a0
// Size: 0xb4
function private onplayerkilled( params )
{
    function_cea5cbc5();
    
    if ( !isdefined( params.eattacker ) || params.eattacker != self )
    {
        return;
    }
    
    if ( params.weapon.name == #"frag_grenade" )
    {
        function_597cbfb8( self gadgetgetslot( params.weapon ), params.weapon, 1 );
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 1, eflags: 0x4
// Checksum 0x915d2f04, Offset: 0x860
// Size: 0x4c
function private function_9ede386f( slot )
{
    wait 0.1;
    self gadgetpowerset( slot, 0 );
    self function_19ed70ca( slot, 1 );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0xe6168f97, Offset: 0x8b8
// Size: 0x40c
function private registerclientfields()
{
    if ( isdefined( level.bountypackagelist ) )
    {
        var_2b5b08bd = int( ceil( log2( level.bountypackagelist.size + 1 ) ) );
        var_ff35ecd8 = getgametypesetting( #"bountybagomoneymoney" );
        var_19302641 = getgametypesetting( #"hash_63f8d60d122e755b" );
        
        if ( var_19302641 > 0 )
        {
            var_bfbe32b4 = int( ceil( log2( var_ff35ecd8 / var_19302641 ) ) );
            clientfield::register( "toplayer", "bountyBagMoney", 1, var_bfbe32b4, "int" );
        }
        else
        {
            clientfield::register( "toplayer", "bountyBagMoney", 1, 1, "int" );
        }
        
        clientfield::register( "toplayer", "bountyMoney", 1, 14, "int" );
        clientfield::register( "clientuimodel", "luielement.BountyHunterLoadout.primary", 1, var_2b5b08bd, "int" );
        clientfield::register( "clientuimodel", "luielement.BountyHunterLoadout.secondary", 1, var_2b5b08bd, "int" );
        clientfield::register( "clientuimodel", "luielement.BountyHunterLoadout.primaryAttachmentTrack.tierPurchased", 1, 2, "int" );
        clientfield::register( "clientuimodel", "luielement.BountyHunterLoadout.secondaryAttachmentTrack.tierPurchased", 1, 2, "int" );
        clientfield::register( "clientuimodel", "luielement.BountyHunterLoadout.armor", 1, var_2b5b08bd, "int" );
        clientfield::register( "clientuimodel", "luielement.BountyHunterLoadout.mobilityTrack.tierPurchased", 1, 2, "int" );
        clientfield::register( "clientuimodel", "luielement.BountyHunterLoadout.reconTrack.tierPurchased", 1, 2, "int" );
        clientfield::register( "clientuimodel", "luielement.BountyHunterLoadout.assaultTrack.tierPurchased", 1, 2, "int" );
        clientfield::register( "clientuimodel", "luielement.BountyHunterLoadout.supportTrack.tierPurchased", 1, 2, "int" );
        clientfield::register( "clientuimodel", "luielement.BountyHunterLoadout.scorestreak", 1, var_2b5b08bd, "int" );
        clientfield::register( "clientuimodel", "luielement.BountyHunterLoadout.equipment", 1, var_2b5b08bd, "int" );
        clientfield::register( "worlduimodel", "BountyHunterLoadout.timeRemaining", 1, 5, "int" );
        clientfield::register( "clientuimodel", "hudItems.BountyCarryingBag", 1, 1, "int" );
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0x33a2d796, Offset: 0xcd0
// Size: 0x1a8
function private onconnect()
{
    if ( !isdefined( self.pers[ #"dynamic_loadout" ] ) )
    {
        self.pers[ #"dynamic_loadout" ] = spawnstruct();
        self.pers[ #"dynamic_loadout" ].weapons = [];
        self.pers[ #"dynamic_loadout" ].talents = [];
        self.pers[ #"dynamic_loadout" ].armor = undefined;
        self.pers[ #"dynamic_loadout" ].scorestreak = undefined;
        self.pers[ #"dynamic_loadout" ].clientfields = [];
    }
    
    self function_c6de6bdd();
    
    foreach ( var_387a4eaf in self.pers[ #"dynamic_loadout" ].clientfields )
    {
        self clientfield::set_player_uimodel( var_387a4eaf.clientfield, var_387a4eaf.val );
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0xc017a4a1, Offset: 0xe80
// Size: 0xa4
function private function_485e3421()
{
    if ( isdefined( self.pers[ #"dynamic_loadout" ].armor ) )
    {
        self function_51a2c3b3( self.pers[ #"dynamic_loadout" ].armor );
        self function_2b71fd3( self.pers[ #"dynamic_loadout" ].armor );
    }
    
    self removearmor();
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0
// Checksum 0xe71bd587, Offset: 0xf30
// Size: 0x4c
function removearmor()
{
    self.pers[ #"dynamic_loadout" ].armor = undefined;
    self function_ff8ef46b( 5, "luielement.BountyHunterLoadout.armor", 0 );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0x1a13e7fe, Offset: 0xf88
// Size: 0x54
function private function_c6de6bdd()
{
    self menus::register_menu_response_callback( "BountyHunterBuy", &function_40eb02fc );
    self menus::register_menu_response_callback( "BountyHunterPackageSelect", &function_40eb02fc );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 2, eflags: 0x4
// Checksum 0xc57d2bc1, Offset: 0xfe8
// Size: 0x58c
function private function_40eb02fc( response, intpayload )
{
    if ( !isdefined( intpayload ) )
    {
        return;
    }
    
    clientfield = undefined;
    slot = undefined;
    isammo = 0;
    var_e120a933 = undefined;
    isscorestreak = 0;
    
    if ( response == "undo_last_purchase" )
    {
        return;
    }
    
    package = struct::get_script_bundle( "bountyhunterpackage", level.bountypackagelist[ intpayload - 1 ] );
    
    switch ( response )
    {
        case #"hash_28554ae159269915":
            clientfield = "luielement.BountyHunterLoadout.primary";
            slot = 0;
            break;
        case #"hash_c785a629253dcd5":
            clientfield = "luielement.BountyHunterLoadout.secondary";
            slot = 1;
            break;
        case #"hash_390a1acd2edcd5b7":
            var_e120a933 = 1;
            clientfield = "luielement.BountyHunterLoadout.primaryAttachmentTrack.tierPurchased";
            slot = 11;
            break;
        case #"hash_390a1bcd2edcd76a":
            var_e120a933 = 2;
            clientfield = "luielement.BountyHunterLoadout.primaryAttachmentTrack.tierPurchased";
            slot = 11;
            break;
        case #"hash_390a1ccd2edcd91d":
            var_e120a933 = 3;
            clientfield = "luielement.BountyHunterLoadout.primaryAttachmentTrack.tierPurchased";
            slot = 11;
            break;
        case #"hash_2acbda1102e614f7":
            var_e120a933 = 1;
            clientfield = "luielement.BountyHunterLoadout.secondaryAttachmentTrack.tierPurchased";
            slot = 12;
            break;
        case #"hash_2acbdb1102e616aa":
            var_e120a933 = 2;
            clientfield = "luielement.BountyHunterLoadout.secondaryAttachmentTrack.tierPurchased";
            slot = 12;
            break;
        case #"hash_2acbdc1102e6185d":
            var_e120a933 = 3;
            clientfield = "luielement.BountyHunterLoadout.secondaryAttachmentTrack.tierPurchased";
            slot = 12;
            break;
        case #"hash_7760a837c6f81098":
            clientfield = "luielement.BountyHunterLoadout.armor";
            slot = 5;
            break;
        case #"hash_46637ad5c1dd8390":
            clientfield = "luielement.BountyHunterLoadout.mobilityTrack.tierPurchased";
            slot = 6;
            break;
        case #"hash_603babb2a7c35420":
            clientfield = "luielement.BountyHunterLoadout.reconTrack.tierPurchased";
            slot = 7;
            break;
        case #"hash_5792934483949728":
            clientfield = "luielement.BountyHunterLoadout.assaultTrack.tierPurchased";
            slot = 8;
            break;
        case #"hash_265c0500ba88a4a4":
            clientfield = "luielement.BountyHunterLoadout.supportTrack.tierPurchased";
            slot = 9;
            break;
        case #"hash_7b3685fb5a146b83":
            isammo = 1;
            
            if ( function_2b402d5d( package ) )
            {
                slot = 100;
            }
            else
            {
                slot = 101;
            }
            
            break;
        case #"hash_6e8d37dc2b55eb07":
            isscorestreak = 1;
            clientfield = "luielement.BountyHunterLoadout.scorestreak";
            slot = 10;
            break;
        case #"hash_45dc798feb538f7b":
            clientfield = "luielement.BountyHunterLoadout.equipment";
            slot = 2;
            break;
    }
    
    if ( !self function_5b8256ca( package, isammo, var_e120a933, isscorestreak ) )
    {
        return;
    }
    
    if ( slot < 4 )
    {
        self function_a3d739c6( slot, package );
    }
    else if ( slot == 5 )
    {
        self function_e6fa90be( package );
    }
    else if ( slot <= 9 )
    {
        self function_14e4d700( slot, package );
        intpayload = package.tracktier;
    }
    else if ( slot == 10 )
    {
        self function_1875e2a9( package );
    }
    else if ( slot <= 12 )
    {
        self function_7a836986( slot - 11, package, var_e120a933 );
        intpayload = var_e120a933;
    }
    else if ( slot <= 101 )
    {
        self addammo( slot - 100, package );
    }
    
    if ( isdefined( clientfield ) )
    {
        self function_ff8ef46b( slot, clientfield, intpayload );
        
        if ( clientfield == "luielement.BountyHunterLoadout.primary" )
        {
            self function_ff8ef46b( 11, "luielement.BountyHunterLoadout.primaryAttachmentTrack.tierPurchased", 0 );
        }
        else if ( clientfield == "luielement.BountyHunterLoadout.secondary" )
        {
            self function_ff8ef46b( 12, "luielement.BountyHunterLoadout.secondaryAttachmentTrack.tierPurchased", 0 );
        }
    }
    
    self function_738575c4( 1, 0 );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 4, eflags: 0x4
// Checksum 0x448e9e4c, Offset: 0x1580
// Size: 0x222, Type: bool
function private function_5b8256ca( package, isammo = 0, var_e120a933 = undefined, isscorestreak = 0 )
{
    money = self.pers[ #"money" ];
    registerend_prestige_imp = isdefined( getgametypesetting( #"hash_1b34b26470f4368" ) ) ? getgametypesetting( #"hash_1b34b26470f4368" ) : isscorestreak ? 1 : 1;
    cost = package.purchasecost * registerend_prestige_imp;
    
    if ( isdefined( isammo ) && isammo )
    {
        cost = package.refillcost * ( isdefined( getgametypesetting( #"hash_71b2b43696e16252" ) ) ? getgametypesetting( #"hash_71b2b43696e16252" ) : 1 );
    }
    else if ( isdefined( var_e120a933 ) )
    {
        cost = package.attachmentupgrades[ var_e120a933 - 1 ].purchasecost * registerend_prestige_imp;
    }
    
    cost = int( cost );
    
    if ( !isdefined( cost ) )
    {
        return false;
    }
    
    if ( money < cost )
    {
        return false;
    }
    
    money -= cost;
    self clientfield::set_to_player( "bountyMoney", money );
    self.pers[ #"money" ] = money;
    return true;
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 2, eflags: 0x4
// Checksum 0xf61b4f76, Offset: 0x17b0
// Size: 0x126
function private function_a3d739c6( slot, package )
{
    self.pers[ #"dynamic_loadout" ].weapons[ slot ] = spawnstruct();
    self.pers[ #"dynamic_loadout" ].weapons[ slot ].name = package.packageitems[ 0 ].item;
    self.pers[ #"dynamic_loadout" ].weapons[ slot ].attachments = [];
    self.pers[ #"dynamic_loadout" ].weapons[ slot ].ammo = -1;
    self.pers[ #"dynamic_loadout" ].weapons[ slot ].startammo = package.startammo;
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 1, eflags: 0x4
// Checksum 0x4314bf0, Offset: 0x18e0
// Size: 0x1da
function private function_e6fa90be( package )
{
    self.pers[ #"dynamic_loadout" ].armor = {};
    self.pers[ #"dynamic_loadout" ].armor.name = package.packageitems[ 0 ].item;
    self.pers[ #"dynamic_loadout" ].armor.armor = package.armor;
    self.pers[ #"dynamic_loadout" ].armor.var_782dbf79 = isdefined( package.var_782dbf79 ) ? package.var_782dbf79 : 0;
    self.pers[ #"dynamic_loadout" ].armor.var_767b7337 = isdefined( package.var_767b7337 ) ? package.var_767b7337 : 0;
    self.pers[ #"dynamic_loadout" ].armor.var_741010b5 = isdefined( package.var_741010b5 ) ? package.var_741010b5 : 0;
    self.pers[ #"dynamic_loadout" ].armor.var_673a16ad = isdefined( package.var_673a16ad ) ? package.var_673a16ad : 0;
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 2, eflags: 0x4
// Checksum 0x69190035, Offset: 0x1ac8
// Size: 0x19e
function private function_14e4d700( slot, package )
{
    foreach ( talent in package.packageitems )
    {
        if ( !isdefined( self.pers[ #"dynamic_loadout" ].talents ) )
        {
            self.pers[ #"dynamic_loadout" ].talents = [];
        }
        else if ( !isarray( self.pers[ #"dynamic_loadout" ].talents ) )
        {
            self.pers[ #"dynamic_loadout" ].talents = array( self.pers[ #"dynamic_loadout" ].talents );
        }
        
        self.pers[ #"dynamic_loadout" ].talents[ self.pers[ #"dynamic_loadout" ].talents.size ] = talent.item;
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 3
// Checksum 0x5993a01e, Offset: 0x1c70
// Size: 0xf6
function function_ff8ef46b( slot, clientfield, newval )
{
    self clientfield::set_player_uimodel( clientfield, newval );
    
    if ( !isdefined( self.pers[ #"dynamic_loadout" ].clientfields[ slot ] ) )
    {
        self.pers[ #"dynamic_loadout" ].clientfields[ slot ] = spawnstruct();
        self.pers[ #"dynamic_loadout" ].clientfields[ slot ].clientfield = clientfield;
    }
    
    self.pers[ #"dynamic_loadout" ].clientfields[ slot ].val = newval;
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 1, eflags: 0x4
// Checksum 0x21820a82, Offset: 0x1d70
// Size: 0x84, Type: bool
function private function_2b402d5d( package )
{
    primary = self.pers[ #"dynamic_loadout" ].weapons[ 0 ];
    
    if ( !isdefined( primary ) )
    {
        return false;
    }
    
    if ( !isdefined( primary.name ) )
    {
        return false;
    }
    
    if ( primary.name == package.packageitems[ 0 ].item )
    {
        return true;
    }
    
    return false;
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 2, eflags: 0x4
// Checksum 0x4f0f7838, Offset: 0x1e00
// Size: 0x136
function private addammo( slot, package )
{
    if ( isdefined( package.refillammo ) && package.refillammo > 0 )
    {
        self.pers[ #"dynamic_loadout" ].weapons[ slot ].ammo = package.refillammo;
        return;
    }
    
    weapdata = self.pers[ #"dynamic_loadout" ].weapons[ slot ];
    weapon = getweapon( weapdata.name, weapdata.attachments );
    
    if ( !isdefined( weapon.clipsize ) || weapon.clipsize <= 0 )
    {
        weapdata.ammo = 1;
        return;
    }
    
    weapdata.ammo = weapon.maxammo / weapon.clipsize + 1;
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 1, eflags: 0x4
// Checksum 0x89b5b11, Offset: 0x1f40
// Size: 0x46
function private function_1875e2a9( package )
{
    self.pers[ #"dynamic_loadout" ].scorestreak = package.packageitems[ 0 ].item;
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 3, eflags: 0x4
// Checksum 0xd13ef69f, Offset: 0x1f90
// Size: 0x26e
function private function_7a836986( slot, package, var_e120a933 )
{
    var_51cc2fc9 = package.attachmentupgrades[ var_e120a933 - 1 ].attachmentlist;
    attacharray = strtok( var_51cc2fc9, "+" );
    
    foreach ( attach in attacharray )
    {
        if ( !isdefined( self.pers[ #"dynamic_loadout" ].weapons[ slot ].attachments ) )
        {
            self.pers[ #"dynamic_loadout" ].weapons[ slot ].attachments = [];
        }
        else if ( !isarray( self.pers[ #"dynamic_loadout" ].weapons[ slot ].attachments ) )
        {
            self.pers[ #"dynamic_loadout" ].weapons[ slot ].attachments = array( self.pers[ #"dynamic_loadout" ].weapons[ slot ].attachments );
        }
        
        if ( !isinarray( self.pers[ #"dynamic_loadout" ].weapons[ slot ].attachments, attach ) )
        {
            self.pers[ #"dynamic_loadout" ].weapons[ slot ].attachments[ self.pers[ #"dynamic_loadout" ].weapons[ slot ].attachments.size ] = attach;
        }
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 2, eflags: 0x4
// Checksum 0x597c3dd3, Offset: 0x2208
// Size: 0x1d4
function private function_738575c4( takeoldweapon, givestreak = 1 )
{
    self loadout::init_player( 1 );
    weapons = self getweaponslist();
    
    foreach ( weapon in weapons )
    {
        self takeweapon( weapon );
    }
    
    killstreaks::function_2ea0382e();
    self function_f14e5ee3();
    self function_422164cd();
    self function_6a829089();
    
    if ( givestreak )
    {
        self function_8d5ede64();
    }
    
    self function_d2f0197a();
    current_weapon = self getcurrentweapon();
    self thread loadout::initweaponattachments( current_weapon );
    self thread pickup_health::function_3fbb0e22();
    self setactionslot( 3, "flourish_callouts" );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0xd3333aeb, Offset: 0x23e8
// Size: 0x104
function private function_d2f0197a()
{
    if ( isdefined( self.pers[ #"dynamic_loadout" ].armor ) )
    {
        self addtalent( #"hash_6be738527a4213aa" );
        armor = self.pers[ #"dynamic_loadout" ].armor;
        self function_52630bb( armor );
        self armor::set_armor( armor.armor, armor.armor, 0, armor.var_767b7337, armor.var_782dbf79, armor.var_673a16ad, armor.var_741010b5, 1, 1, 1 );
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 1, eflags: 0x4
// Checksum 0x5192167f, Offset: 0x24f8
// Size: 0x4a
function private function_659633d8( var_31e314e8 )
{
    switch ( var_31e314e8.name )
    {
        case #"hash_16cfc7f70dbd8712":
            return #"specialty_armor_tier_two";
        case #"hash_39045b0020cc3e00":
            return #"specialty_armor_tier_three";
        default:
            return #"specialty_armor";
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 1, eflags: 0x4
// Checksum 0x83d1a519, Offset: 0x2588
// Size: 0xda
function private function_51a2c3b3( var_31e314e8 )
{
    if ( !isdefined( var_31e314e8 ) )
    {
        return;
    }
    
    switch ( var_31e314e8.name )
    {
        case #"hash_16cfc7f70dbd8712":
            playfxontag( #"hash_56c8182de62c1c6", self, "j_spineupper" );
        case #"hash_39045b0020cc3e00":
            playfxontag( #"hash_3c6a01bd4394d4f3", self, "j_spineupper" );
        default:
            playfxontag( #"hash_4a955131370a3720", self, "j_spineupper" );
            break;
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 1, eflags: 0x4
// Checksum 0x2e21dac, Offset: 0x2670
// Size: 0x44
function private function_52630bb( var_31e314e8 )
{
    armor_perk = function_659633d8( var_31e314e8 );
    self setperk( armor_perk );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 1, eflags: 0x4
// Checksum 0xbd644381, Offset: 0x26c0
// Size: 0x44
function private function_2b71fd3( var_31e314e8 )
{
    armor_perk = function_659633d8( var_31e314e8 );
    self unsetperk( armor_perk );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0xa5bd70db, Offset: 0x2710
// Size: 0x424
function private function_f14e5ee3()
{
    var_7d27f2d6 = self.pers[ #"dynamic_loadout" ].weapons[ 0 ];
    
    if ( isdefined( var_7d27f2d6 ) )
    {
        primary = getweapon( var_7d27f2d6.name, var_7d27f2d6.attachments );
        self giveweapon( primary );
        self function_c1932ad3( primary, var_7d27f2d6 );
        self switchtoweapon( primary, 1 );
        self loadout::function_442539( "primary", primary );
        self setspawnweapon( primary );
    }
    else
    {
        nullprimary = function_898839b4();
        self giveweapon( nullprimary );
        self setweaponammoclip( nullprimary, 0 );
        self loadout::function_442539( "primary", nullprimary );
    }
    
    var_23218f5e = self.pers[ #"dynamic_loadout" ].weapons[ 1 ];
    
    if ( isdefined( var_23218f5e ) )
    {
        secondary = getweapon( var_23218f5e.name, var_23218f5e.attachments );
        self giveweapon( secondary );
        self function_c1932ad3( secondary, var_23218f5e );
        self loadout::function_442539( "secondary", secondary );
        
        if ( !isdefined( var_7d27f2d6 ) )
        {
            self switchtoweapon( secondary, 1 );
            self setspawnweapon( secondary );
        }
    }
    else
    {
        nullsecondary = getweapon( #"none" );
        self giveweapon( nullsecondary );
        self setweaponammoclip( nullsecondary, 0 );
        self loadout::function_442539( "secondary", nullsecondary );
    }
    
    equipmentdata = self.pers[ #"dynamic_loadout" ].weapons[ 2 ];
    
    if ( isdefined( equipmentdata ) )
    {
        equipment = getweapon( equipmentdata.name );
        self giveweapon( equipment );
        self setweaponammoclip( equipment, equipmentdata.ammo );
        slot = self gadgetgetslot( equipment );
        self gadgetpowerset( slot, equipment.gadget_powermax );
    }
    else
    {
        var_30b5b5af = getweapon( #"null_offhand_primary" );
        self giveweapon( var_30b5b5af );
        self loadout::function_442539( "primarygrenade", var_30b5b5af );
    }
    
    self seteverhadweaponall( 1 );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0xe77df24b, Offset: 0x2b40
// Size: 0xea
function private function_898839b4()
{
    var_81b9af1a = self.pers[ #"dynamic_loadout" ].talents;
    
    foreach ( item in var_81b9af1a )
    {
        if ( item == #"hash_7932008294f0d876" )
        {
            return getweapon( #"hash_7932008294f0d876" );
        }
    }
    
    return getweapon( #"hash_1773b576c62a506" );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 2, eflags: 0x4
// Checksum 0xe9d4cad2, Offset: 0x2c38
// Size: 0x104
function private function_c1932ad3( weap, data )
{
    if ( data.ammo > 0 )
    {
        self setweaponammostock( weap, int( data.ammo * weap.clipsize ) - weap.clipsize );
    }
    else
    {
        self setweaponammostock( weap, int( data.startammo * weap.clipsize ) - weap.clipsize );
    }
    
    if ( self getweaponammoclip( weap ) <= 0 )
    {
        self setweaponammostock( weap, weap.clipsize );
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0x6be68cec, Offset: 0x2d48
// Size: 0xa4
function private function_6a829089()
{
    healthgadget = getweapon( #"pickup_health_regen" );
    
    if ( isdefined( self.var_c7e6d7c7 ) && self.var_c7e6d7c7 )
    {
        healthgadget = getweapon( #"gadget_medicalinjectiongun" );
    }
    
    self giveweapon( healthgadget );
    self loadout::function_442539( "specialgrenade", healthgadget );
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0xe47923cf, Offset: 0x2df8
// Size: 0x1b4
function private function_422164cd()
{
    self cleartalents();
    self clearperks();
    
    foreach ( talent in self.pers[ #"dynamic_loadout" ].talents )
    {
        if ( talent == #"hash_7932008294f0d876" )
        {
            continue;
        }
        
        self addtalent( talent + level.game_mode_suffix );
        
        if ( talent == #"gear_medicalinjectiongun" )
        {
            self.var_c7e6d7c7 = 1;
        }
    }
    
    perks = self getloadoutperks( 0 );
    
    foreach ( perk in perks )
    {
        self setperk( perk );
    }
    
    self thread perks::monitorgpsjammer();
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0, eflags: 0x4
// Checksum 0x6177c290, Offset: 0x2fb8
// Size: 0x5c
function private function_8d5ede64()
{
    if ( isdefined( self.pers[ #"dynamic_loadout" ].scorestreak ) )
    {
        self killstreaks::give( self.pers[ #"dynamic_loadout" ].scorestreak );
    }
}

// Namespace dynamic_loadout/dynamic_loadout
// Params 0
// Checksum 0x28dc6928, Offset: 0x3020
// Size: 0xb4
function function_cea5cbc5()
{
    scorestreak = self.pers[ #"dynamic_loadout" ].scorestreak;
    
    if ( isdefined( scorestreak ) && ( !self killstreaks::has_killstreak( scorestreak ) || isdefined( self.var_a8c5fe4e ) && self.var_a8c5fe4e ) )
    {
        self.pers[ #"dynamic_loadout" ].scorestreak = undefined;
        self function_ff8ef46b( 10, "luielement.BountyHunterLoadout.scorestreak", 0 );
    }
}


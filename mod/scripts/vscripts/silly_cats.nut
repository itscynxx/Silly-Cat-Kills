untyped

global function Silly_Cat_MP_Init

void function Silly_Cat_MP_Init()
{   
    if ( CATS_HAS_CALLBACK )
        AddCallback_OnPlayerKilled( PlayCatVideo )
}

void function PlayCatVideo( ObituaryCallbackParams inputParams )
{
    entity player = GetLocalClientPlayer()
    if ( inputParams.attacker == player )
        PlayVideo( player )
    if ( inputParams.victim == player )
        StopVideo( player )
}

void function PlayVideo( entity player )
{
    // just so we don't have two videos playing at once (lazy way to fix the issue)
    StopVideo( player )
    int vidsize = GetConVarInt( "silly_cat_size" )
    player.ClientCommand( "playvideo " + GetRandomVideoName() + " " + vidsize + " " + vidsize )
}

void function StopVideo( entity player )
{
    player.ClientCommand( "stopvideos" )
}

string function GetRandomVideoName()
{
    if ( GetConVarString( "cat_specify_video" ) != "All" )
        return GetConVarString( "cat_specify_video" )

    switch ( RandomInt(8) )
    {
        case 0:
            return "angy_cat"
        case 1:
            return "bingus"
        case 2:
            return "cat_berg"
        case 3:
            return "cat_drinking"
        case 4:
            return "cat_vibe"
        case 5:
            return "concerned_cat"
        case 6:
            return "guh"
        case 7:
            return "jinx_cat"
        case 8:
            return "plink"
        case 9:
            return "voices_cat"
    }

    unreachable
}
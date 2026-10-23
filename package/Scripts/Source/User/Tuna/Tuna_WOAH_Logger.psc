scriptname Tuna:Tuna_WOAH_Logger

Function Trace(GlobalVariable akDebugFlag, string skPlugin, string skMsg, int aiSeverity = 0) Global
    
    if ( akDebugFlag )
        Debug.trace("[" + skPlugin + "] " + skMsg, aiSeverity)
    EndIf

EndFunction
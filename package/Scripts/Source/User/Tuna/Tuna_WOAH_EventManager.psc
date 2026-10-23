scriptname Tuna:Tuna_WOAH_EventManager extends Quest

GlobalVariable Property Tuna_WOAH_DebugFlag Auto const
Message Property Tuna_WOAH_SaveWarn Auto const
string Property Tuna_WOAH_ScriptName Auto const

Int Property ikSaveWarnTimeID = 0 Autoreadonly hidden
Int Property iSaveWarnTime Auto ;hidden
Int Property ikSaveWarnInitID = 1 Autoreadonly hidden
Int Property iSaveWarnInit = 0 Auto hidden
string Property sMsg Auto hidden

WorkshopParentScript Property wsParent auto Const
ObjectReference wsRef = None


Function StartEventManager()

    RegisterForMenuOpenCloseEvent("WorkshopMenu")
    RegisterForCustomEvent(wsParent, "WorkshopEnterMenu")

    sMsg = "Event Manager Initialized."
    Tuna:Tuna_WOAH_Logger.Trace(Tuna_WOAH_DebugFlag, Tuna_WOAH_ScriptName, sMsg, 0)

EndFunction

Function RegisterWorkshopEvents()

    RegisterForRemoteEvent(wsRef, "OnWorkShopObjectDestroyed")
    RegisterForRemoteEvent(wsRef, "OnWorkShopObjectPlaced")
    RegisterForRemoteEvent(wsRef, "OnWorkShopObjectMoved")

EndFunction

Function UnregisterWorkshopEvents()

    If ( wsRef )
        
        UnregisterForRemoteEvent(wsRef, "OnWorkshopObjectPlaced")
        UnregisterForRemoteEvent(wsRef, "OnWorkshopObjectMoved")
        UnregisterForRemoteEvent(wsRef, "OnWorkshopObjectDestroyed")

    EndIf

EndFunction

Event WorkshopParentScript.WorkshopEnterMenu(WorkshopParentScript akSender, Var[] akArgs)

    ObjectReference wsNew = akArgs[1] as ObjectReference

    If ( wsNew == None )

        sMsg = "No workshop found, events not registered."
        Tuna:Tuna_WOAH_Logger.Trace(Tuna_WOAH_DebugFlag, Tuna_WOAH_ScriptName, sMsg, 1)

    ElseIf ( wsNew != wsRef )

        UnregisterWorkshopEvents()
        wsRef = wsNew
        RegisterWorkshopEvents()

    EndIf


EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)

    If ( asMenuName == "WorkshopMenu" )
        If ( abOpening )

            If ( iSaveWarnTime > 0 )
                StartTimer(iSaveWarnInit, ikSaveWarnInitID)
            EndIf

        Else

            sMsg = "Workshop closed."
            Tuna:Tuna_WOAH_Logger.Trace(Tuna_WOAH_DebugFlag, Tuna_WOAH_ScriptName, sMsg, 0)
            CancelTimer(ikSaveWarnTimeID)

        EndIf
    EndIf

EndEvent

Event OnTimer(int aiTimerID)

    String SWarnSaveMsg
    if ( aiTimerID == ikSaveWarnTimeID )

        Tuna_WOAH_SaveWarn.show()

        sWarnSaveMsg = "Warn Save Sent."
        Tuna:Tuna_WOAH_Logger.Trace(Tuna_WOAH_DebugFlag, Tuna_WOAH_ScriptName, sWarnSaveMsg, 0)

    ElseIf ( aiTimerID == ikSaveWarnInitID )
    
        sWarnSaveMsg = "Warn Save Timer Initialized."
        Tuna:Tuna_WOAH_Logger.Trace(Tuna_WOAH_DebugFlag, Tuna_WOAH_ScriptName, sWarnSaveMsg, 0)

    EndIf
    
    Starttimer(iSaveWarnTime, ikSaveWarnTimeID)

EndEvent

Event ObjectReference.OnWorkshopObjectPlaced(ObjectReference akSender, ObjectReference akReference)
    sMsg = "Placed: " + akReference
    Tuna:Tuna_WOAH_Logger.Trace(Tuna_WOAH_DebugFlag, Tuna_WOAH_ScriptName, sMsg, 0)
EndEvent

Event ObjectReference.OnWorkshopObjectMoved(ObjectReference akSender, ObjectReference akReference)
    sMsg = "Moved: " + akReference
    Tuna:Tuna_WOAH_Logger.Trace(Tuna_WOAH_DebugFlag, Tuna_WOAH_ScriptName, sMsg, 0)
EndEvent

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSender, ObjectReference akActionRef)
    sMsg = "Destroyed: " + akActionRef
    Tuna:Tuna_WOAH_Logger.Trace(Tuna_WOAH_DebugFlag, Tuna_WOAH_ScriptName, sMsg, 0)
EndEvent
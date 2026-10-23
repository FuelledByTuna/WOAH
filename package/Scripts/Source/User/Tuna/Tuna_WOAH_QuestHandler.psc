scriptname Tuna:Tuna_WOAH_QuestHandler extends Quest

GlobalVariable Property Tuna_WOAH_DebugFlag Auto const
Message Property Tuna_WOAH_Init Auto const
string Property Tuna_WOAH_ScriptName auto const

Int Property ikTimerInitID = 0 Autoreadonly hidden
Int Property ikTimerLoadID = 1 Autoreadonly hidden
String Property sMsg Auto hidden

Tuna:Tuna_WOAH_EventManager EventManager

Event OnQuestInit()

    Starttimer(1, ikTimerInitID)
    RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")

EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)

    Starttimer(1, ikTimerLoadID)

EndEvent

Event OnTimer(int ikTimerID)

    if ( ikTimerID == ikTimerInitID )

        Tuna_WOAH_Init.show()

    elseif ( ikTimerID == ikTimerLoadID )

        sMsg = "Game loaded."
        Tuna:Tuna_WOAH_Logger.Trace(Tuna_WOAH_DebugFlag, Tuna_WOAH_ScriptName, sMsg, 0)

    EndIf
    
    EventManager = (Self as Quest) as Tuna:Tuna_WOAH_EventManager
    EventManager.StartEventManager()

EndEvent
Scriptname Tuna:Tuna_WOAH_ObjectManager extends ObjectReference

Struct ObjectData
    int iAction
    Form BaseFormID

    float xPos
    float yPos
    float zPos
    float xAngle
    float yAngle
    float zAngle
    float oSize
EndStruct

Struct ScrapMaterial
    MiscObject material
    Int Count
EndStruct

bool Function RestoreObject(ObjectData aObject, WorkshopScript wsRef)

    bool bReturn = true
    ObjectReference RestoredObj = wsRef.PlaceAtMe(aObject.BaseFormID, 1, abForcePersist = true, abInitiallyDisabled = false)

    If ( RestoredObj == None )
        
        RestoredObj.SetPosition(aObject.xPos, aObject.yPos, aObject.zPos)
        RestoredObj.SetAngle(aObject.xAngle, aObject.yAngle, aObject.zAngle)

        RestoredObj.Enable()

    Else
        
        bReturn = false

    EndIf

    return bReturn

EndFunction
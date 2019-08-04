; *************************************************************************
; AUTHOR         : MicrodevWeb
; DESIGNED WITH  : Pb 5.71
; PROJECT        : PB HTML EMAIL
; PACKAGE        : EMAIL
; CLASS          : Message
; FILE           : Message.pbi
; VERSION        : 1.0 
; *************************************************************************
;-* PRIVATE METHODS

;}
;-* PROTECTED METHODS
Procedure _MESSAGE_free(*this._MESSAGE)
  With *this
    FreeStructure(*this)
  EndWith
EndProcedure
;}
;-* GETTERS METHODS

;}
;-* SETTERS METHODS

;}
;-* PUBLIC METHODS
Procedure MES_addTargetAddress(*this._MESSAGE,address.s)
  With *this
    AddElement(\myTo())
    \myTo()\addresse = address
  EndWith
EndProcedure

Procedure MES_addAttachement(*this._MESSAGE,attachement.s)
  With *this
    AddElement(\myAttachement())
    \myAttachement() = attachement
  EndWith
EndProcedure

Procedure MES_resetTargetAddress(*this._MESSAGE)
  With *this
    ResetList(\myTo())
  EndWith
EndProcedure

Procedure MES_nextTargetAddress(*this._MESSAGE)
  With *this
    ProcedureReturn NextElement(\myTo())
  EndWith
EndProcedure

Procedure MES_getTargetAddress(*this._MESSAGE)
  With *this
    ProcedureReturn \myTo()
  EndWith
EndProcedure

Procedure.s MES_getEmailAddress(*this._MESSAGE)
  With *this
    ProcedureReturn \myTo()\addresse
  EndWith
EndProcedure


Procedure MES_isSended(*this._MESSAGE)
  With *this
    ProcedureReturn \myTo()\sended
  EndWith
EndProcedure


;}
;-* CONSTRUCTOR
Procedure newMessage(addressfrom.s,targetAddress.s,object.s,body.s)
  Protected *this._MESSAGE = AllocateStructure(_MESSAGE)
  With *this
    \methods = ?S_MESSAGE
    \from = addressfrom
    \object = object
    \body = body
    AddElement(\myTo())
    \myTo()\addresse = targetAddress
    \_free = @_MESSAGE_free()
    ProcedureReturn *this
  EndWith
EndProcedure
;}

DataSection
  S_MESSAGE:
  Data.i @MES_addTargetAddress()
  Data.i @MES_addAttachement()
  Data.i @MES_resetTargetAddress()
  Data.i @MES_nextTargetAddress()
  Data.i @MES_isSended()
  Data.i @MES_getEmailAddress()
  E_MESSAGE:
EndDataSection
; IDE Options = PureBasic 5.71 beta 2 LTS (Windows - x64)
; CursorPosition = 96
; FirstLine = 61
; Folding = ---
; EnableXP
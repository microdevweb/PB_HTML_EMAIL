; *************************************************************************
; AUTHOR         : MicrodevWeb
; DESIGNED WITH  : Pb 5.71
; PROJECT        : PB HTML EMAIL
; PACKAGE        : EMAIL
; FILE           : Structures.pbi
; VERSION        : 1.0 
; *************************************************************************
Prototype _free(*this)
Structure _TO
  type.i
  addresse.s
  sended.b
EndStructure
Structure _MESSAGE
  *methods
  object.s
  from.s
  List myTo._TO()
  List myAttachement.s()
  body.s
  _free._free
EndStructure
Structure _EMAIL
  *methods
  smpt.s
  port.i
  login.s
  password.s
  List *myMessages._MESSAGE()
  ssl.b
EndStructure
; IDE Options = PureBasic 5.71 beta 2 LTS (Windows - x64)
; CursorPosition = 11
; FirstLine = 5
; Folding = -
; EnableXP
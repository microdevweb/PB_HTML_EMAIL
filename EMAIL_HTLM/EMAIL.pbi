; *************************************************************************
; AUTHOR         : MicrodevWeb
; DESIGNED WITH  : Pb 5.71
; PROJECT        : PB HTML EMAIL
; PACKAGE        : EMAIL
; FILE           : EMAIL.pbi
; VERSION        : 1.0 
; *************************************************************************
DeclareModule EMAIL
  Global JARDirectory.s
  Interface Message
    addTargetAddress(address.s)
    addAttachement(fulltPathAttachement.s)
    resetTargetAddress()
    nextTargetAddress()
    isSended()
    getEmailAddress.s()
  EndInterface
  Interface Email
    addMessage(message)
    resetMessage()
    nextMessage()
    getMessage()
    send()
    free()
  EndInterface
  
  Declare newMessage(addressfrom.s,targetAddress.s,object.s,body.s)
  Declare newEmail(smtpServer.s,port,login.s,password.s,ssl.b=#False)
;   Declare.s TO_UTF8(text.s)
EndDeclareModule

Module EMAIL
  EnableExplicit

  
  XIncludeFile "CLASSES/Structures.pbi"
  
  XIncludeFile "CLASSES/Message.pbi"
  XIncludeFile "CLASSES/Email.pbi"
EndModule
; IDE Options = PureBasic 5.71 beta 2 LTS (Windows - x64)
; CursorPosition = 24
; FirstLine = 8
; Folding = -
; EnableXP
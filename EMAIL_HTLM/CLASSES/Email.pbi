; *************************************************************************
; AUTHOR         : MicrodevWeb
; DESIGNED WITH  : Pb 5.71
; PROJECT        : PB HTML EMAIL
; PACKAGE        : EMAIL
; CLASS          : Email
; FILE           : Email.pbi
; VERSION        : 1.0 
; *************************************************************************
;-* PRIVATE METHODS

;}
;-* PROTECTED METHODS

;}
;-* GETTERS METHODS

;}
;-* SETTERS METHODS

;}
;-* PUBLIC METHODS
Procedure EMAIL_addMessage(*this._EMAIL,*message)
  With *this
    AddElement(\myMessages())
    \myMessages() = *message
    ProcedureReturn *message
  EndWith
EndProcedure

Procedure EMAIL_resetMessage(*this._EMAIL)
  With *this
    ResetList(\myMessages())
  EndWith
EndProcedure

Procedure EMAIL_nextMessage(*this._EMAIL)
  With *this
    ProcedureReturn NextElement(\myMessages())
  EndWith
EndProcedure

Procedure EMAIL_getMessage(*this._EMAIL)
  With *this
    ProcedureReturn  \myMessages()
  EndWith
EndProcedure

Procedure EMAIL_send(*this._EMAIL)
  With *this
    Protected *buf
    ; write argument list
    ForEach \myMessages()
      ForEach \myMessages()\myTo()
        If Not CreateFile(0,EMAIL::JARDirectory+"args.txt",#PB_Ascii)
          MessageRequester("ERROR","Cannot create arguments file",#PB_MessageRequester_Error)
          ProcedureReturn #False
        EndIf
        WriteStringN(0,Trim(\myMessages()\from))
        WriteStringN(0,Trim(\smpt))
        WriteStringN(0,Trim(Str(\port)))
        If \ssl
          WriteStringN(0,"SSL")
        Else
          WriteStringN(0,"ASYN")
        EndIf
        WriteStringN(0,Trim(\login))
        WriteStringN(0,Trim(\password))
        WriteStringN(0,\myMessages()\object)
        *buf = UTF8(\myMessages()\body)
        WriteStringN(0,\myMessages()\body,#PB_Ascii)
        WriteStringN(0,\myMessages()\myTo()\addresse)
        Protected attachements.s
        ForEach \myMessages()\myAttachement()
          attachements + \myMessages()\myAttachement()+"@"
        Next
        If Len(attachements)
          WriteStringN(0,attachements)
        EndIf
        CloseFile(0)
        If Not RunProgram(EMAIL::JARDirectory+"JMail.jar","","",#PB_Program_Wait)
          MessageRequester("ERROR","Cannot run JMail.jar",#PB_MessageRequester_Error)
          ProcedureReturn #False
        EndIf
        If ReadFile(0,EMAIL::JARDirectory+"status.log")
          If ReadString(0) = "sended"
            \myMessages()\myTo()\sended = #True
          EndIf
          CloseFile(0)
        EndIf
      Next
    Next
  EndWith
EndProcedure

Procedure EMAIL_free(*this._EMAIL)
  With *this
    ForEach \myMessages()
      If \myMessages()\_free
        \myMessages()\_free(\myMessages())
      EndIf
    Next
    FreeStructure(*this)
  EndWith
EndProcedure
;}
;-* CONSTRUCTOR
Procedure newEmail(smtpServer.s,port,login.s,password.s,ssl.b=#False)
  Protected *this._EMAIL = AllocateStructure(_EMAIL)
  With *this
    \methods = ?S_EMAIL
    \smpt = smtpServer
    \port = port
    \password = password
    \login = login
    \ssl = ssl
    ProcedureReturn *this
  EndWith
EndProcedure
;}

DataSection
  S_EMAIL:
  Data.i @EMAIL_addMessage()
  Data.i @EMAIL_resetMessage()
  Data.i @EMAIL_nextMessage()
  Data.i @EMAIL_getMessage()
  Data.i @EMAIL_send()
  Data.i @EMAIL_free()
  E_EMAIL:
EndDataSection
; IDE Options = PureBasic 5.71 beta 2 LTS (Windows - x64)
; CursorPosition = 44
; FirstLine = 36
; Folding = w4--
; EnableXP
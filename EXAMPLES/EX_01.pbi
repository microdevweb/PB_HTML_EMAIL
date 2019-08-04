XIncludeFile "../EMAIL_HTLM/EMAIL.pbi"
; WARNING GET THE DIRECTORY OF JAR JMail.jar
; FOR EXAMPLE
EMAIL::JARDirectory = "A:\PB_HTML_EMAIL\EMAIL_HTLM\JAR\"
; WARNING FILL THIS CONSTANTES
#SMTP_HOST = "pro.eu.turbo-smtp.com" ; for exmaple with turbo smtp
#SMTP_PORT = 587
#SMTP_USER = "yourAddress@hotmail.com"
#SMTP_PSW = "yourPsw"
#FROM = "addressToFrom@gmail.com"

Global mail.EMAIL::Email = EMAIL::newEmail(#SMTP_HOST,#SMTP_PORT,#SMTP_USER,#SMTP_PSW)
msg.s = "<h1> Ceci est un teste </h1><br>"+
        "<p>Le <b>Lorem Ipsum</b> est simplement du faux texte employé dans la "+
        "composition et la mise en page avant impression. Le Lorem Ipsum est le faux "+
        "texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme"+
        " assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte."+
        " Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique,"+
        " sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente "+
        "de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion "+
        "dans des applications de mise en page de texte, comme Aldus PageMaker.</p>"
; WARNING GET A CORRECT EMAIL ADRESS
Define email_1.s = "targetEmail@gmail.com"
Define email_2.s = "targetEmail@hotmail.com"

Define m.EMAIL::Message = mail\addMessage(EMAIL::newMessage(#FROM,email_1,"msg 1",msg))
m\addTargetAddress(email_2)
Define m.EMAIL::Message = mail\addMessage(EMAIL::newMessage(#FROM,email_1,"msg 2",msg))
m\addTargetAddress(email_2)

mail\send()

; TEST IF MESSAGES ARE BE SENDED
mail\resetMessage()
While mail\nextMessage()
  Define ms.EMAIL::Message = mail\getMessage()
  ms\resetTargetAddress()
  While ms\nextTargetAddress()
    If ms\isSended()
      Debug "message to "+ms\getEmailAddress()+" has was sended"
    Else
      Debug "message to "+ms\getEmailAddress()+" diden't sended"
    EndIf
  Wend
Wend



; IDE Options = PureBasic 5.71 beta 2 LTS (Windows - x64)
; CursorPosition = 23
; Folding = -
; EnableXP
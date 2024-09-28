$PBExportHeader$w_mail_receive.srw
$PBExportComments$Window that looks at MSMail inbox and allows viewing Mail.
forward
global type w_mail_receive from w_center
end type
type cb_help from commandbutton within w_mail_receive
end type
type mle_to from multilineedit within w_mail_receive
end type
type sle_from from singlelineedit within w_mail_receive
end type
type cb_print from commandbutton within w_mail_receive
end type
type mle_message from multilineedit within w_mail_receive
end type
type sle_subject from singlelineedit within w_mail_receive
end type
type cb_inbox from commandbutton within w_mail_receive
end type
type cb_delete from commandbutton within w_mail_receive
end type
type st_status_bar from statictext within w_mail_receive
end type
type cb_close from commandbutton within w_mail_receive
end type
type dw_inbox from datawindow within w_mail_receive
end type
type dw_1 from datawindow within w_mail_receive
end type
type gb_5 from groupbox within w_mail_receive
end type
type gb_3 from groupbox within w_mail_receive
end type
type gb_4 from groupbox within w_mail_receive
end type
type gb_2 from groupbox within w_mail_receive
end type
type gb_1 from groupbox within w_mail_receive
end type
type gb_to from groupbox within w_mail_receive
end type
end forward

global type w_mail_receive from w_center
integer x = 9
integer width = 2921
integer height = 1960
string title = "MAPI Mail - Receive Mail"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
cb_help cb_help
mle_to mle_to
sle_from sle_from
cb_print cb_print
mle_message mle_message
sle_subject sle_subject
cb_inbox cb_inbox
cb_delete cb_delete
st_status_bar st_status_bar
cb_close cb_close
dw_inbox dw_inbox
dw_1 dw_1
gb_5 gb_5
gb_3 gb_3
gb_4 gb_4
gb_2 gb_2
gb_1 gb_1
gb_to gb_to
end type
global w_mail_receive w_mail_receive

type variables
mailSession		ims_mSes
boolean			ib_connected




end variables

forward prototypes
public function integer wf_check_inbox ()
end prototypes

on ue_postopen;// Build_inbox script for w_mail_receive

/*******************************************************************
	Receive and display the definition and contents of a 
	DataWindow using MAPI facilities.

	1. Create a mail session object and log onto the mail system
	2. Obtain list of mail messages in user's Inbox 
	3. Allow user to identify one of these mail items
	4. Receive mail, with attached .dwx file
 *******************************************************************/
mailReturnCode			mRet
string	 				ls_ret
/****************************************************************
	Create an instance of a Mail Session object, and log onto
	the mail system
 ****************************************************************/

st_status_bar.Text = ' Logging onto mail system...'
ims_mses = create mailSession

/****************************************************************
	Note: If the mail-system user ID and password are known,
			they could be hard-coded here, as shown in the
			commented-out statement that follows.  If user ID and
			password are not supplied, it is assumed that they
			are stored in MSMAIL.INI
 ****************************************************************/
//mRet = ims_mses.mailLogon ( "user-name", "user-password", &
//								mailNewSession! )
mRet = ims_mses.mailLogon ( mailNewSession! )
ls_ret = f_mail_error_to_string ( mRet, 'Logon:', FALSE )
st_status_bar.text = ' Logon: ' + ls_ret
if mRet <> mailReturnSuccess! then
	MessageBox ("Mail Logon", 'Return Code <> mailReturnSuccess!' )
	ib_connected = false
	return
end if

SetPointer ( HourGlass! )
ib_connected = true
wf_check_inbox( ) 



end on

public function integer wf_check_inbox ();/*******************************************************************
	The following e-mail variables are declared as Instance variables:
		mailSession				mSes
 *******************************************************************/
mailReturnCode			mRet
mailMessage			mMsg[]
mailFileDescription		mAttach

int						li_dwattached, li_attachnumber
string					ls_filename, ls_ret
int						li_msgs, li_attachments
int						li_index , li_row, li_attachindex

dw_inbox.Reset()
dw_inbox.setredraw(false)

/****************************************************************
	Obtain the list of mail Message IDs in the user's mail Inbox
 ****************************************************************/

mRet = ims_mses.mailGetMessages ( )
ls_Ret = f_mail_error_to_string ( mRet, 'Get Messages:', FALSE )
st_status_bar.text = ' Inbox: ' + ls_ret

/****************************************************************
For each message in the user's Inbox:
	1. Read the message envelope (recipients, subject, list
			of attachments).  Note that this does not read the
			message contents or the attachments themselves.
	2. For each attachment, see if its file extension is .dwx
	3. Add a row to the Inbox DataWindow
 ****************************************************************/

li_msgs = UpperBound(ims_mses.MessageID)

For li_index = 1 to li_msgs
	mRet = ims_mses.mailReadMessage ( ims_mses.MessageID[li_index], mMsg[li_index], &
								  mailEnvelopeOnly!, FALSE )
	ls_ret = f_mail_error_to_string ( mRet, 'Read Message Envelope:' , &
								FALSE )
	st_status_bar.text = ' Inbox: Msg ' + &
								string (li_index, '##0') + ': ' + ls_Ret
	li_attachments = UpperBound ( mMsg[li_index].AttachmentFile )

	li_attachnumber =0
	for li_attachindex = 1 to li_attachments
		ls_filename = mMsg[li_index].AttachmentFile[li_attachindex].FileName
		if Lower ( Right ( ls_filename, 4 )) = ".psr"  then 
			li_dwattached = 1
			li_attachnumber = li_attachindex
		else
			li_dwattached = 0
		end if
next		// Loop on attachments in current message

/****************************************************************
Add mail  to the Inbox DataWindow.  Note that its MessageId and Attachment
Number are not visible; they will be needed later to retrieve the attachment.
The dwattached, unread, receipt fields are hidden and referenced by a
computed column that will show a bitmap if they equal to one.
 ****************************************************************/
		li_row = dw_inbox.InsertRow ( 0 )
		dw_inbox.object.Sender[li_row] = mMsg[li_index].Recipient[1].Name
		dw_inbox.object.Subject[li_row] = mMsg[li_index].Subject 
		dw_inbox.object.Postmark[li_row] = mMsg[li_index].DateReceived 
		dw_inbox.object.MessageId[li_row] = ims_mses.MessageID[li_index] 
		dw_inbox.object.Attachment_number[li_row] = li_attachnumber 
		dw_inbox.object.dwattached[li_row] = li_dwattached

		if mMsg[li_index].unread then
			dw_inbox.object.unread[li_row] = 1
		else
			dw_inbox.object.unread[li_row] = 0
		end if

		if mMsg[li_index].ReceiptRequested then 
			dw_inbox.object.receipt[li_row] = 1
		else
			dw_inbox.object.receipt[li_row] = 0
		end if

Next
// Loop on messages in user's Inbox

SetPointer ( Arrow! )

//Test empty inbox
if dw_inbox.RowCount () < 1  then
	MessageBox ( "Receive a DataWindow", &
			"No items in your inbox have DataWindow attachments", &
			Exclamation! )
	dw_inbox.setredraw(true)
	return 0
end if

dw_inbox.setredraw(true)
st_status_bar.text = "Ready"

return li_msgs
end function

on closequery;// CloseQuery script for w_mail_receive

string	ls_Ret
mailReturnCode mret

if ib_connected  then

	mRet = ims_mSes.mailLogoff ( )
	ls_Ret = f_mail_error_to_string ( mRet, 'Logoff:', FALSE )
	st_status_bar.text = ' Logoff: ' + ls_Ret

	if mRet <> mailReturnSuccess! then
		MessageBox ("Mail Logoff", 'Return Code <> mailReturnSuccess!' )
		return
	end if

end if


destroy ims_mSes

end on

event open;call super::open;// Open script for w_mail_receive

PostEvent ( "ue_postopen" )

end event

event close;call super::close;// Close script

//w_main.Show ( )

end event

on w_mail_receive.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.mle_to=create mle_to
this.sle_from=create sle_from
this.cb_print=create cb_print
this.mle_message=create mle_message
this.sle_subject=create sle_subject
this.cb_inbox=create cb_inbox
this.cb_delete=create cb_delete
this.st_status_bar=create st_status_bar
this.cb_close=create cb_close
this.dw_inbox=create dw_inbox
this.dw_1=create dw_1
this.gb_5=create gb_5
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_to=create gb_to
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.mle_to
this.Control[iCurrent+3]=this.sle_from
this.Control[iCurrent+4]=this.cb_print
this.Control[iCurrent+5]=this.mle_message
this.Control[iCurrent+6]=this.sle_subject
this.Control[iCurrent+7]=this.cb_inbox
this.Control[iCurrent+8]=this.cb_delete
this.Control[iCurrent+9]=this.st_status_bar
this.Control[iCurrent+10]=this.cb_close
this.Control[iCurrent+11]=this.dw_inbox
this.Control[iCurrent+12]=this.dw_1
this.Control[iCurrent+13]=this.gb_5
this.Control[iCurrent+14]=this.gb_3
this.Control[iCurrent+15]=this.gb_4
this.Control[iCurrent+16]=this.gb_2
this.Control[iCurrent+17]=this.gb_1
this.Control[iCurrent+18]=this.gb_to
end on

on w_mail_receive.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.mle_to)
destroy(this.sle_from)
destroy(this.cb_print)
destroy(this.mle_message)
destroy(this.sle_subject)
destroy(this.cb_inbox)
destroy(this.cb_delete)
destroy(this.st_status_bar)
destroy(this.cb_close)
destroy(this.dw_inbox)
destroy(this.dw_1)
destroy(this.gb_5)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_to)
end on

type cb_help from commandbutton within w_mail_receive
integer x = 2551
integer y = 496
integer width = 329
integer height = 100
integer taborder = 120
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

on clicked;f_open_help(parent.ClassName( ))
end on

type mle_to from multilineedit within w_mail_receive
integer x = 1015
integer y = 532
integer width = 1463
integer height = 88
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean vscrollbar = true
boolean displayonly = true
end type

type sle_from from singlelineedit within w_mail_receive
integer x = 105
integer y = 532
integer width = 837
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean autohscroll = false
boolean displayonly = true
end type

type cb_print from commandbutton within w_mail_receive
integer x = 2551
integer y = 1212
integer width = 329
integer height = 100
integer taborder = 130
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Print"
end type

on clicked;//print datawindow

dw_1.print()
end on

type mle_message from multilineedit within w_mail_receive
integer x = 105
integer y = 840
integer width = 2373
integer height = 320
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
end type

type sle_subject from singlelineedit within w_mail_receive
integer x = 105
integer y = 688
integer width = 2373
integer height = 76
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean autohscroll = false
boolean displayonly = true
end type

type cb_inbox from commandbutton within w_mail_receive
integer x = 2551
integer y = 88
integer width = 329
integer height = 100
integer taborder = 160
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Read Inbox"
end type

on clicked;wf_check_inbox()
end on

type cb_delete from commandbutton within w_mail_receive
integer x = 2551
integer y = 208
integer width = 329
integer height = 100
integer taborder = 150
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Delete"
end type

event clicked;// Clicked script for cb_delete

long					ll_row
mailReturnCode 		mret
string					ls_messgeid, ls_ret

/****************************************************************
	Delete the currently-highlighted message from the
	logged-in user's Inbox at the Post Office
 ****************************************************************/

/****************************************************************
	Get the selected message's ID from the Inbox DataWindow
 ****************************************************************/
ll_row = dw_inbox.getselectedrow( 0 )
ls_messgeid = dw_inbox.object.MessageID[ll_row]

/****************************************************************
	Now, delete that message from the Post Office
 ****************************************************************/

mRet = ims_mses.mailDeleteMessage ( ls_messgeid )
ls_ret = f_mail_error_to_string ( mRet, 'Read Message:', FALSE )
st_status_bar.text = ' Delete Message: ' + ls_ret

/****************************************************************
	Finally, remove the entry from the on-screen list of messages,
	and disable this button until user has retrieved another
	message.
 ****************************************************************/

if mRet = mailReturnSuccess! then
	dw_inbox.SelectRow ( ll_row, FALSE )	// un-highlight this selection
	dw_inbox.DeleteRow ( ll_row )
	ll_row = -1
end if

this.enabled = FALSE







end event

type st_status_bar from statictext within w_mail_receive
integer x = 114
integer y = 1760
integer width = 2281
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_mail_receive
integer x = 2551
integer y = 352
integer width = 329
integer height = 100
integer taborder = 110
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;// Clicked script for cb_exit

Close (Parent)

end on

type dw_inbox from datawindow within w_mail_receive
integer x = 55
integer y = 12
integer width = 2473
integer height = 440
string dataobject = "d_mapi_inbox"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;// Clicked script for dw_inbox

mailReturnCode			mRet
mailMessage			mMsg[]
mailFileDescription		mAttach

int		li_attachment, li_file, li_ret, li_recips, li_index
string	ls_messageid
string	ls_ret, ls_syntax, ls_name, ls_open_pathname, ls_filename

If row <= 0 then
	this.SelectRow ( 0, FALSE )		// Clear old highlight
	cb_delete.enabled = false
	return
End If

	cb_delete.enabled = true
	this.SelectRow ( 0, FALSE )		// Clear old highlight, and
	this.SelectRow ( row, TRUE )	//  highlight this selection

/****************************************************************
	Obtain mail Message ID and which attachment is the DataWindow
	to receive and display
 ****************************************************************/

	ls_messageid = this.object.MessageID[row]
	li_attachment = this.object.Attachment_number[row]

/****************************************************************
	Re-read this message to obtain entire contents, including
	the attached file (because the Open script read only the
	"envelope" and not the contents of the message)
 ****************************************************************/

	mRet = ims_mses.mailReadMessage ( ls_messageid, mMsg[1], &
										mailEntireMessage!, TRUE )
	ls_ret = f_mail_error_to_string ( mRet, 'Read Message:', FALSE )
	st_status_bar.text = ' Read Message: ' + ls_ret

	mle_to.text = "" 	
	li_recips = Upperbound(mMsg[1].Recipient)	
	for li_index = 1 to li_recips

		//get the from name
		If mMsg[1].Recipient[li_index].RecipientType = mailOriginator! Then 
			sle_from.text = mMsg[1].Recipient[li_index].name	
		End If
		
		//get the to and cc names .. put ; between each one
		If mMsg[1].Recipient[li_index].RecipientType = mailTo! or  &
			mMsg[1].Recipient[li_index].RecipientType = mailCC! Then 
				If mle_to.text = "" Then 
					mle_to.text = MMsg[1].Recipient[li_index].name	
				Else
					mle_to.text = mle_to.text + "; " + MMsg[1].Recipient[li_index].name	
				End If
		End If
	next

	//set subject
	sle_subject.text = mMsg[1].subject
	
	//set message text
	mle_message.text = mMsg[1].NoteText


/****************************************************************
	Extract the name of the temporary file in which the mail
	system has stored the attachment file, and open that file
 ****************************************************************/

	//test if there was a datawindow 
	If li_attachment = 0 Then 
		dw_1.visible = false
		cb_print.enabled = false
		return
	End If
	

	dw_1.setredraw (false)	
	dw_1.visible = true
	cb_print.enabled = true
	ls_open_pathname = mMsg[1].AttachmentFile[li_attachment].PathName

//assign the psr file to the datawindow object
dw_1.dataobject = ls_open_pathname

dw_1.bringtotop = true
dw_1.setredraw (true)





//This is the another way of accessing a datawindow from an attachment
//this will extract the datawindow syntax and data and create the datawindow
//PSR file are now the prefered method.
//	li_file = FileOpen ( ls_open_pathname, StreamMode!, Read!, &
//						LockReadWrite!, Replace! )
//	if li_file < 0 then
//		MessageBox ( "Send Mail", &
//				"Unable to open file to read DataWindow attachment", &
//				 StopSign! )
//		return
//	end if
//
//	/****************************************************************
//	Read the attachment file containing the DataWindow syntax,
//	then close and delete the temporary attachment file
//	 ****************************************************************/
//
//	li_ret = FileRead ( li_file, ls_syntax )
//	if li_ret < 0 then
//		MessageBox ( "Send Mail", &
//			"Unable to  read DataWindow attachment", &
//			 StopSign! )
//		return
//	end if
//	FileClose ( li_file )
//	FileDelete ( ls_open_pathname )
//	
///****************************************************************
//	Now, create the received DataWindow in the dw_1 control
// ****************************************************************/
//
//	dw_1.Create ( ls_syntax )
end event

type dw_1 from datawindow within w_mail_receive
boolean visible = false
integer x = 87
integer y = 1244
integer width = 2409
integer height = 432
integer taborder = 90
string dataobject = "d_mapi_inbox"
boolean vscrollbar = true
boolean livescroll = true
end type

type gb_5 from groupbox within w_mail_receive
integer x = 55
integer y = 476
integer width = 905
integer height = 156
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "From:"
end type

type gb_3 from groupbox within w_mail_receive
integer x = 64
integer y = 1184
integer width = 2469
integer height = 516
integer taborder = 140
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "DataWindow:"
end type

type gb_4 from groupbox within w_mail_receive
integer x = 55
integer y = 1712
integer width = 2473
integer height = 128
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Status"
end type

type gb_2 from groupbox within w_mail_receive
integer x = 55
integer y = 784
integer width = 2473
integer height = 396
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Message:"
end type

type gb_1 from groupbox within w_mail_receive
integer x = 55
integer y = 632
integer width = 2473
integer height = 148
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Subject:"
end type

type gb_to from groupbox within w_mail_receive
integer x = 969
integer y = 476
integer width = 1559
integer height = 156
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "To:"
end type


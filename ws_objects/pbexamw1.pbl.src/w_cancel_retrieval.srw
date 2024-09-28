$PBExportHeader$w_cancel_retrieval.srw
$PBExportComments$Cancel DataWindow retrieval, printing
forward
global type w_cancel_retrieval from w_center
end type
type cbx_print_cancel from checkbox within w_cancel_retrieval
end type
type cb_print from commandbutton within w_cancel_retrieval
end type
type cb_help from commandbutton within w_cancel_retrieval
end type
type cb_close from commandbutton within w_cancel_retrieval
end type
type st_2 from statictext within w_cancel_retrieval
end type
type cb_retrieve from commandbutton within w_cancel_retrieval
end type
type dw_1 from datawindow within w_cancel_retrieval
end type
end forward

global type w_cancel_retrieval from w_center
integer x = 169
integer y = 108
integer width = 3186
integer height = 1860
string title = "Cancel Retrieval & Printing"
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event cancel_requested pbm_custom01
cbx_print_cancel cbx_print_cancel
cb_print cb_print
cb_help cb_help
cb_close cb_close
st_2 st_2
cb_retrieve cb_retrieve
dw_1 dw_1
end type
global w_cancel_retrieval w_cancel_retrieval

type variables
boolean ib_cancelbut_open
boolean ib_cancel_print_valid
end variables

on cancel_requested;//Cancel_requested(user defined) script for w_cancel_retrieval
//This will set the boolean flag that a request to cancel
//the datawindow retrieve has taken place.
ib_cancelbut_open = false


end on

event open;call super::open;/////////////////////////////////////////////////////////////////
//
// Purpose:
//Open script for w_cancel_retrieval
//
// This window demonstrates the ability to cancel a datawindow 
// retrieve in progress.
//
//
// Log:
//
//   DATE       WHO      WHAT
//   ----       ---      -------------------------------
//  4/15/94     crm      Initial
/////////////////////////////////////////////////////////////////


//Causes datawindowname DW1 to use the programmer-specified 
//transaction object specified in transaction. This gives you
//more control over the transaction (for example, you can COMMIT 
//from a script).

dw_1.SetTransObject(sqlca)


ib_cancel_print_valid = True
end event

event close;call super::close;//Close script for w_cancel_retrieval
//Bring the main menu up
//w_main.Show( )

end event

on w_cancel_retrieval.create
int iCurrent
call super::create
this.cbx_print_cancel=create cbx_print_cancel
this.cb_print=create cb_print
this.cb_help=create cb_help
this.cb_close=create cb_close
this.st_2=create st_2
this.cb_retrieve=create cb_retrieve
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_print_cancel
this.Control[iCurrent+2]=this.cb_print
this.Control[iCurrent+3]=this.cb_help
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.cb_retrieve
this.Control[iCurrent+7]=this.dw_1
end on

on w_cancel_retrieval.destroy
call super::destroy
destroy(this.cbx_print_cancel)
destroy(this.cb_print)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.st_2)
destroy(this.cb_retrieve)
destroy(this.dw_1)
end on

type cbx_print_cancel from checkbox within w_cancel_retrieval
integer x = 2464
integer y = 20
integer width = 667
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Allow Print Cancel"
boolean checked = true
end type

on clicked;// if this check box is checked then it is valid to cancel printing
ib_cancel_print_valid = cbx_print_cancel.checked
end on

type cb_print from commandbutton within w_cancel_retrieval
integer x = 2679
integer y = 296
integer width = 370
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

on clicked;//Depending if the print cancel switch is on or off, you will or will not be able 
//to cancel a print job in process
SetPointer(Hourglass!)
dw_1.Print(ib_cancel_print_valid)
end on

type cb_help from commandbutton within w_cancel_retrieval
integer x = 2679
integer y = 568
integer width = 370
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

on clicked;f_open_help(parent.ClassName( ))

end on

type cb_close from commandbutton within w_cancel_retrieval
integer x = 2679
integer y = 432
integer width = 370
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;//Clicked script for cb_close

Close(parent)
end on

type st_2 from statictext within w_cancel_retrieval
integer x = 55
integer y = 16
integer width = 2341
integer height = 148
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Press Retrieve: Then Press Cancel Button to Cancel Retrieval in Progress Press Print: Notice the difference if the Print Cancel box is checked"
boolean focusrectangle = false
end type

type cb_retrieve from commandbutton within w_cancel_retrieval
integer x = 2679
integer y = 160
integer width = 370
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Retrieve"
end type

on clicked;//Clicked script for cb_retrieve
int	li_returncode

//clear contents of datawindow before retrieval
dw_1.Reset( )

//disable other functions while retrieve is in progress
cb_retrieve.enabled = false
cb_close.enabled = false
cb_help.enabled = false
cb_print.enabled = false

li_returncode = dw_1.Retrieve( )

//reenable other function buttons after retrieve is complete
cb_retrieve.enabled = true
cb_close.enabled = true
cb_help.enabled = true
cb_print.enabled = true
dw_1.setfocus()

end on

type dw_1 from datawindow within w_cancel_retrieval
integer x = 55
integer y = 196
integer width = 2437
integer height = 1496
integer taborder = 10
string dataobject = "d_retrieve_cust"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

on retrieveend;//Retrieveend script for dw_1

if ib_cancelbut_open then
	ib_cancelbut_open = false
end if

Close(w_cancel_button)
end on

on retrievestart;//Retrievestart script for dw_1

// Display the cancel window at start of retrieval. This window 
// contains a Cancel button, which sets the instance 
// ib_cancelbut_open false, when clicked.
ib_cancelbut_open = true

Open(w_cancel_button)


end on

event retrieverow;//Retrieverow script for dw_1

// ScrollNextRow displays rows as they are retrieved
this.ScrollNextRow( )

// Display a running count of rows retrieved
if IsValid(w_cancel_button) then	
	w_cancel_button.st_count.text = String(This.RowCount( ))
end if

// If the Cancel button has been clicked, set the action code to
// terminate the retrieval. Note: It is the SetActionCode function
// that actually terminates the retrieve
if ib_cancelbut_open = false then 
	return 1
end if
end event


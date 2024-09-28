$PBExportHeader$w_dberror_event.srw
$PBExportComments$Example which shows how to supress default dberror message, and display custom message.
forward
global type w_dberror_event from w_center
end type
type cb_add from commandbutton within w_dberror_event
end type
type rb_none from radiobutton within w_dberror_event
end type
type rb_custom from radiobutton within w_dberror_event
end type
type rb_default from radiobutton within w_dberror_event
end type
type cb_retrieve from commandbutton within w_dberror_event
end type
type cb_update from commandbutton within w_dberror_event
end type
type cb_close from commandbutton within w_dberror_event
end type
type cb_help from commandbutton within w_dberror_event
end type
type dw_1 from datawindow within w_dberror_event
end type
type gb_1 from groupbox within w_dberror_event
end type
end forward

global type w_dberror_event from w_center
integer x = 457
integer y = 376
integer width = 2437
integer height = 1664
string title = "DBError Event"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_add cb_add
rb_none rb_none
rb_custom rb_custom
rb_default rb_default
cb_retrieve cb_retrieve
cb_update cb_update
cb_close cb_close
cb_help cb_help
dw_1 dw_1
gb_1 gb_1
end type
global w_dberror_event w_dberror_event

on w_dberror_event.create
int iCurrent
call super::create
this.cb_add=create cb_add
this.rb_none=create rb_none
this.rb_custom=create rb_custom
this.rb_default=create rb_default
this.cb_retrieve=create cb_retrieve
this.cb_update=create cb_update
this.cb_close=create cb_close
this.cb_help=create cb_help
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_add
this.Control[iCurrent+2]=this.rb_none
this.Control[iCurrent+3]=this.rb_custom
this.Control[iCurrent+4]=this.rb_default
this.Control[iCurrent+5]=this.cb_retrieve
this.Control[iCurrent+6]=this.cb_update
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.cb_help
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.gb_1
end on

on w_dberror_event.destroy
call super::destroy
destroy(this.cb_add)
destroy(this.rb_none)
destroy(this.rb_custom)
destroy(this.rb_default)
destroy(this.cb_retrieve)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.cb_help)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event close;call super::close;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// close script for w_dberror_event
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Show front-end to Code Examples
//w_main.Show()
end event

event open;call super::open;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// open script for w_dberror_event
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Set Transaction Object for the DataWindow
dw_1.SetTransObject (sqlca)
end event

type cb_add from commandbutton within w_dberror_event
integer x = 1865
integer y = 232
integer width = 411
integer height = 106
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Add Row"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_add
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Add a new row into the DataWindow
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_row

ll_row = dw_1.InsertRow (0)
dw_1.ScrollToRow(ll_row)
dw_1.SetColumn(1)
dw_1.SetFocus()
end event

type rb_none from radiobutton within w_dberror_event
integer x = 119
integer y = 332
integer width = 1024
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 41943040
long backcolor = 74481808
string text = "No error message"
end type

type rb_custom from radiobutton within w_dberror_event
integer x = 119
integer y = 248
integer width = 1024
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 41943040
long backcolor = 74481808
string text = "Customized error message"
end type

type rb_default from radiobutton within w_dberror_event
integer x = 119
integer y = 164
integer width = 1024
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 41943040
long backcolor = 74481808
string text = "Default PB error message"
boolean checked = true
end type

type cb_retrieve from commandbutton within w_dberror_event
integer x = 1865
integer y = 72
integer width = 411
integer height = 106
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Retrieve"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_retrieve
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the DataWindow.
// If the Retrieve function fails (return code of -1), the dberror event of the DataWindow will be triggered.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_1.Retrieve()
end event

type cb_update from commandbutton within w_dberror_event
integer x = 1865
integer y = 392
integer width = 411
integer height = 106
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Update"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_update
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update the DataWindow.
// If the Update function fails (return code of -1), the dberror event of the DataWindow will be triggered.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if dw_1.Update() = 1 then
	commit;
else
	rollback;
end if
end event

type cb_close from commandbutton within w_dberror_event
integer x = 1865
integer y = 552
integer width = 411
integer height = 106
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Close"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_close 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

close (parent)
end event

type cb_help from commandbutton within w_dberror_event
integer x = 1865
integer y = 712
integer width = 411
integer height = 106
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Help"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_help
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Display help for this example
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

f_open_help (parent.ClassName())
end event

type dw_1 from datawindow within w_dberror_event
integer x = 69
integer y = 512
integer width = 1682
integer height = 984
integer taborder = 30
string dataobject = "d_departments"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// dberror script for dw_1
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Depending on which error message option is checked, display appropriate error message.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// If custom error message is checked, then display an error message with the specific
// database error code and error message that occurred.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if rb_custom.checked then
	MessageBox ("Database Error", "Database Error Code:  " + String (sqldbcode) + &
						"~r~nDatabase Error Message:  " + sqlerrtext, exclamation!)
end if


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Setting the return code to 1 in the dberror event will stop PowerBuilder from displaying
// the default error message
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if not rb_default.checked then
	return 1
end if

end event

type gb_1 from groupbox within w_dberror_event
integer x = 69
integer y = 48
integer width = 1682
integer height = 420
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 41943040
long backcolor = 74481808
string text = "On dberror event, display:"
end type


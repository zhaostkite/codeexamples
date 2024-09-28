$PBExportHeader$w_compute_in_attribute.srw
$PBExportComments$Min and max salaries by department are different text colors using attribute expressions that reference computed fields.
forward
global type w_compute_in_attribute from w_center
end type
type cb_help from commandbutton within w_compute_in_attribute
end type
type dw_1 from datawindow within w_compute_in_attribute
end type
type cb_close from commandbutton within w_compute_in_attribute
end type
type cb_update from commandbutton within w_compute_in_attribute
end type
type cb_retrieve from commandbutton within w_compute_in_attribute
end type
end forward

global type w_compute_in_attribute from w_center
integer x = 169
integer y = 40
integer width = 2587
integer height = 1852
string title = "Referencing Computed Fields in Attribute Expressions"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_help cb_help
dw_1 dw_1
cb_close cb_close
cb_update cb_update
cb_retrieve cb_retrieve
end type
global w_compute_in_attribute w_compute_in_attribute

event open;call super::open;dw_1.SetTransObject (sqlca)

// Post an event that retrieves the DataWindow.
cb_retrieve.PostEvent (clicked!)
end event

event close;call super::close;//w_main.Show()
end event

on w_compute_in_attribute.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.dw_1=create dw_1
this.cb_close=create cb_close
this.cb_update=create cb_update
this.cb_retrieve=create cb_retrieve
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.cb_update
this.Control[iCurrent+5]=this.cb_retrieve
end on

on w_compute_in_attribute.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.dw_1)
destroy(this.cb_close)
destroy(this.cb_update)
destroy(this.cb_retrieve)
end on

type cb_help from commandbutton within w_compute_in_attribute
integer x = 1600
integer y = 1628
integer width = 265
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Help"
end type

on clicked;f_open_help (parent.ClassName())
end on

type dw_1 from datawindow within w_compute_in_attribute
integer x = 37
integer y = 44
integer width = 2482
integer height = 1532
integer taborder = 10
string dataobject = "d_compute_in_attribute"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

on retrieveend;cb_update.enabled = true
end on

on retrievestart;cb_update.enabled = false
end on

type cb_close from commandbutton within w_compute_in_attribute
integer x = 1280
integer y = 1628
integer width = 265
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Close"
end type

on clicked;close (parent)
end on

type cb_update from commandbutton within w_compute_in_attribute
integer x = 983
integer y = 1628
integer width = 265
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Update"
end type

on clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update the DataWindow
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if dw_1.Update() = 1 then
	commit;
else
	rollback;
end if
end on

type cb_retrieve from commandbutton within w_compute_in_attribute
integer x = 681
integer y = 1628
integer width = 265
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Retrieve"
end type

on clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the DataWindow
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

dw_1.Retrieve()
end on


$PBExportHeader$w_dddw_techniques.srw
$PBExportComments$DropDownDataWindow techniques example
forward
global type w_dddw_techniques from w_center
end type
type cb_help from commandbutton within w_dddw_techniques
end type
type cb_close from commandbutton within w_dddw_techniques
end type
type cb_filter from commandbutton within w_dddw_techniques
end type
type cb_sort from commandbutton within w_dddw_techniques
end type
type cb_insert from commandbutton within w_dddw_techniques
end type
type cb_retrieve from commandbutton within w_dddw_techniques
end type
type rb_full from radiobutton within w_dddw_techniques
end type
type rb_partial from radiobutton within w_dddw_techniques
end type
type dw_dept from datawindow within w_dddw_techniques
end type
type gb_1 from groupbox within w_dddw_techniques
end type
end forward

global type w_dddw_techniques from w_center
integer x = 439
integer y = 428
integer width = 2437
integer height = 1664
string title = "DropDownDataWindow Techniques"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_open pbm_custom07
cb_help cb_help
cb_close cb_close
cb_filter cb_filter
cb_sort cb_sort
cb_insert cb_insert
cb_retrieve cb_retrieve
rb_full rb_full
rb_partial rb_partial
dw_dept dw_dept
gb_1 gb_1
end type
global w_dddw_techniques w_dddw_techniques

type variables
// handle to the DropDownDataWindow
datawindowchild   idw_child
end variables

on ue_open;dw_dept.SetTransObject (sqlca)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the handle of the DropDownDataWindow
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_dept.GetChild ("dept_head_id", idw_child)
idw_child.SetTransObject (sqlca)

end on

on w_dddw_techniques.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.cb_close=create cb_close
this.cb_filter=create cb_filter
this.cb_sort=create cb_sort
this.cb_insert=create cb_insert
this.cb_retrieve=create cb_retrieve
this.rb_full=create rb_full
this.rb_partial=create rb_partial
this.dw_dept=create dw_dept
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_filter
this.Control[iCurrent+4]=this.cb_sort
this.Control[iCurrent+5]=this.cb_insert
this.Control[iCurrent+6]=this.cb_retrieve
this.Control[iCurrent+7]=this.rb_full
this.Control[iCurrent+8]=this.rb_partial
this.Control[iCurrent+9]=this.dw_dept
this.Control[iCurrent+10]=this.gb_1
end on

on w_dddw_techniques.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.cb_filter)
destroy(this.cb_sort)
destroy(this.cb_insert)
destroy(this.cb_retrieve)
destroy(this.rb_full)
destroy(this.rb_partial)
destroy(this.dw_dept)
destroy(this.gb_1)
end on

event open;call super::open;this.PostEvent ("ue_open")
end event

event close;call super::close;//w_main.Show()
end event

type cb_help from commandbutton within w_dddw_techniques
integer x = 1829
integer y = 816
integer width = 475
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

on clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Display example help
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

f_open_help (parent.ClassName())
end on

type cb_close from commandbutton within w_dddw_techniques
integer x = 1829
integer y = 672
integer width = 475
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Close the window
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

close (parent)
end on

type cb_filter from commandbutton within w_dddw_techniques
integer x = 1829
integer y = 528
integer width = 475
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Fi&lter DDDW"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Specify filter criteria for the DDDW
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_filter


SetNull (ls_filter)
idw_child.SetFilter (ls_filter)

// Force DDDW to retrieve, (which will apply filter criteria specified)
dw_dept.Trigger Event RowFocusChanged (dw_dept.GetRow())
end event

type cb_sort from commandbutton within w_dddw_techniques
integer x = 1829
integer y = 384
integer width = 475
integer height = 100
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Sort DDDW"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Specify sort criteria for the DDDW
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_sort

SetNull (ls_sort)
idw_child.SetSort (ls_sort)

// Force DDDW to retrieve, (which will apply sort criteria specified)
dw_dept.Trigger Event RowFocusChanged (dw_dept.GetRow())

end event

type cb_insert from commandbutton within w_dddw_techniques
integer x = 1829
integer y = 240
integer width = 475
integer height = 100
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Insert Row"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Insert a row into the DataWindow
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_cur_row, &
		ll_row

ll_cur_row = dw_dept.GetRow()
if ll_cur_row >= 0 then
	ll_row = dw_dept.InsertRow(ll_cur_row)
	dw_dept.ScrollToRow(ll_row)
	dw_dept.SetColumn(1)
	dw_dept.SetFocus()
end if


end event

type cb_retrieve from commandbutton within w_dddw_techniques
integer x = 1829
integer y = 96
integer width = 475
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Retrieve"
boolean default = true
end type

on clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// When retrieving a DataWindow that contains a DropDownDataWindow with retrieval 
// arguments, the default dialogue for specifying retrieval arguments for the DDDW will
// come up.  However, if the DropDownDataWindow already contains data before retrieving
// its parent DataWindow, the dialogue is not used.  The DDDWs used in this example have
// a dummy row stored in their definition, thus suppressing this dialogue.
//
// Other ways to suppress the retrieval arguments dialogue are to insert a row or explicitly
// retrieve the DDDW before the parent DataWindow is retrieved.  T
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if idw_child.RowCount() = 0 then
	idw_child.InsertRow (0)
end if
dw_dept.Retrieve()

end on

type rb_full from radiobutton within w_dddw_techniques
integer x = 923
integer y = 192
integer width = 786
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Employee &Full Detail"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Change the dataobject of the DropDownDataWindow.
// When the dataobject of the DDDW is changed, a retrieve will be performed UNLESS data
// already exists in the DDDW.  The DDDWs used in this example have a dummy row stored
// in them for this purpose.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_dept.Object.dept_head_id.dddw.name = 'd_dddw_empsal_by_dept'

dw_dept.Object.dept_head_id.dddw.PercentWidth = 600
dw_dept.GetChild ("dept_head_id", idw_child)
idw_child.SetTransObject (sqlca)

// Force the DDDW to retrieve employees for the current department of the current row
dw_dept.Trigger Event RowFocusChanged (dw_dept.GetRow())
end event

type rb_partial from radiobutton within w_dddw_techniques
integer x = 73
integer y = 192
integer width = 850
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Employee &Partial Detail"
boolean checked = true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Change the dataobject of the DropDownDataWindow.
// When the dataobject of the DDDW is changed, a retrieve will be performed UNLESS data
// already exists in the DDDW.  The DDDWs used in this example have a dummy row stored
// in them for this purpose.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_dept.Object.dept_head_id.dddw.name = 'd_dddw_emp_by_dept' 

dw_dept.Object.dept_head_id.dddw.PercentWidth = 450
dw_dept.GetChild ("dept_head_id", idw_child)
idw_child.SetTransObject (sqlca)

// Force the DDDW to retrieve employees for the current department of the current row
dw_dept.Trigger Event RowFocusChanged (dw_dept.GetRow())
end event

type dw_dept from datawindow within w_dddw_techniques
integer x = 41
integer y = 420
integer width = 1737
integer height = 1056
integer taborder = 20
string dataobject = "d_example_dddw"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Re-retrieve the DropDownDataWindow of employees so that only employees from the
// current department are displayed.
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int	li_dept_id

if currentrow > 0 then
	li_dept_id = this.Object.dept_id[currentrow]
	If li_dept_id > 0 Then
		idw_child.Retrieve (li_dept_id)	
	End If
end if
end event

type gb_1 from groupbox within w_dddw_techniques
integer x = 41
integer y = 52
integer width = 1737
integer height = 328
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "DDDW DataObject"
end type


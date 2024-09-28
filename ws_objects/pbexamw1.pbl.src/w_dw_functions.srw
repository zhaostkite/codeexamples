$PBExportHeader$w_dw_functions.srw
$PBExportComments$Shows common datawindow functions of Update, InsertRow, and DeleteRow.  Also shows RowCount functions.
forward
global type w_dw_functions from w_center
end type
type cb_help from commandbutton within w_dw_functions
end type
type cb_undo from commandbutton within w_dw_functions
end type
type cb_close from commandbutton within w_dw_functions
end type
type cb_reset_mod from commandbutton within w_dw_functions
end type
type cb_display_mod from commandbutton within w_dw_functions
end type
type cb_delete from commandbutton within w_dw_functions
end type
type cb_retrieve from commandbutton within w_dw_functions
end type
type cb_new from commandbutton within w_dw_functions
end type
type cb_apply from commandbutton within w_dw_functions
end type
type dw_cust from datawindow within w_dw_functions
end type
type st_4 from statictext within w_dw_functions
end type
type st_3 from statictext within w_dw_functions
end type
type st_2 from statictext within w_dw_functions
end type
type st_displayed from statictext within w_dw_functions
end type
type st_modified from statictext within w_dw_functions
end type
type st_deleted from statictext within w_dw_functions
end type
end forward

global type w_dw_functions from w_center
integer y = 24
integer width = 2939
integer height = 1880
string title = "Datawindow Functions"
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_help cb_help
cb_undo cb_undo
cb_close cb_close
cb_reset_mod cb_reset_mod
cb_display_mod cb_display_mod
cb_delete cb_delete
cb_retrieve cb_retrieve
cb_new cb_new
cb_apply cb_apply
dw_cust dw_cust
st_4 st_4
st_3 st_3
st_2 st_2
st_displayed st_displayed
st_modified st_modified
st_deleted st_deleted
end type
global w_dw_functions w_dw_functions

type variables
boolean cancel_retrieval
end variables

forward prototypes
protected subroutine wf_set_counts ()
end prototypes

protected subroutine wf_set_counts ();//////////////////////////////////////////////////////////////////////
//
// Function: wf_set_counts
//
// Purpose: set the displayed row counts (rowcount, modified count,
//				deleted count) of dw_cust
//
//	Scope: protected
//
//	Arguments: none
//		
//	Returns: none
//
//////////////////////////////////////////////////////////////////////

st_displayed.text = String (dw_cust.RowCount())
st_deleted.text   = String (dw_cust.DeletedCount())
st_modified.text  = String (dw_cust.ModifiedCount())
end subroutine

event close;call super::close;// Close script for w_dw_functions

//w_main.Show()
end event

event open;call super::open;// open script for w_dw_functions

dw_cust.SetTransObject (sqlca)

end event

on w_dw_functions.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.cb_undo=create cb_undo
this.cb_close=create cb_close
this.cb_reset_mod=create cb_reset_mod
this.cb_display_mod=create cb_display_mod
this.cb_delete=create cb_delete
this.cb_retrieve=create cb_retrieve
this.cb_new=create cb_new
this.cb_apply=create cb_apply
this.dw_cust=create dw_cust
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_displayed=create st_displayed
this.st_modified=create st_modified
this.st_deleted=create st_deleted
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.cb_undo
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.cb_reset_mod
this.Control[iCurrent+5]=this.cb_display_mod
this.Control[iCurrent+6]=this.cb_delete
this.Control[iCurrent+7]=this.cb_retrieve
this.Control[iCurrent+8]=this.cb_new
this.Control[iCurrent+9]=this.cb_apply
this.Control[iCurrent+10]=this.dw_cust
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.st_displayed
this.Control[iCurrent+15]=this.st_modified
this.Control[iCurrent+16]=this.st_deleted
end on

on w_dw_functions.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.cb_undo)
destroy(this.cb_close)
destroy(this.cb_reset_mod)
destroy(this.cb_display_mod)
destroy(this.cb_delete)
destroy(this.cb_retrieve)
destroy(this.cb_new)
destroy(this.cb_apply)
destroy(this.dw_cust)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_displayed)
destroy(this.st_modified)
destroy(this.st_deleted)
end on

type cb_help from commandbutton within w_dw_functions
integer x = 2469
integer y = 1084
integer width = 434
integer height = 108
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

on clicked;f_open_help ('w_dw_functions')
end on

type cb_undo from commandbutton within w_dw_functions
integer x = 2469
integer y = 532
integer width = 434
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Undo"
end type

on clicked;/////////////////////////////////////////////////////////////////////
// Restore the current row/column value to the value that was
// originally retrieved from the database.
/////////////////////////////////////////////////////////////////////

long		ll_row, &
			ll_col
string		ls_cell, &
			ls_coltype
int			li_cell


// Get the original value of this row/column
ll_row = dw_cust.GetRow()
ll_col = dw_cust.GetColumn()

if ll_row > 0 and ll_col > 0 then
	ls_coltype = dw_cust.Describe ("#" + String (ll_col) + ".coltype")
	if ls_coltype = "number" then
		li_cell = dw_cust.GetItemNumber (ll_row, ll_col, primary!, true)

		// Reset it to the original value
		dw_cust.SetItem (ll_row, ll_col, li_cell)
	else
		ls_cell = dw_cust.GetItemString (ll_row, ll_col, primary!, true) 

		// Reset it to the original value
		dw_cust.SetItem (ll_row, ll_col, ls_cell)
	end if

	// reset the modified flag for this row column and call wf_set_counts
	// to recalculate all displayed row counts.
	dw_cust.SetItemStatus (ll_row, ll_col, primary!, NotModified!)
	wf_set_counts()
end if
end on

type cb_close from commandbutton within w_dw_functions
integer x = 2469
integer y = 960
integer width = 434
integer height = 108
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;// Close the window

// Cancel any retrievals in progress
dw_cust.DBCancel()
Close (parent)
end on

type cb_reset_mod from commandbutton within w_dw_functions
integer x = 2469
integer y = 808
integer width = 434
integer height = 108
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Rese&t Modified"
end type

on clicked;/////////////////////////////////////////////////////////////////////
// Reset the modified count on dw_cust
/////////////////////////////////////////////////////////////////////

// ResetUpdate resets all modified flags; subsequently calling the
// function wf_set_counts refreshes all displayed row counts. At
// this point 'rows modified' should be 0.

dw_cust.ResetUpdate()
wf_set_counts()

// Select the current row of dw_cust
f_select_current_row (dw_cust)
end on

type cb_display_mod from commandbutton within w_dw_functions
integer x = 2469
integer y = 684
integer width = 434
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select &Modified"
end type

on clicked;//////////////////////////////////////////////////////////////////////
// Select (highlight) all rows that have been modified
//////////////////////////////////////////////////////////////////////

long 	ll_row 

if dw_cust.AcceptText() = -1 then
	return
end if

// Deselect everything
dw_cust.SelectRow (0, false)

// Loop thru all modified rows and select them
do
	ll_row = dw_cust.GetNextModified (ll_row, primary!)
	if ll_row > 0 then dw_cust.SelectRow (ll_row, true)
loop until ll_row < 1 
end on

type cb_delete from commandbutton within w_dw_functions
integer x = 2469
integer y = 408
integer width = 434
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete Row"
end type

on clicked;/////////////////////////////////////////////////////////////////////
// Purpose:  Delete the current row from dw_cust
/////////////////////////////////////////////////////////////////////

dw_cust.DeleteRow (0)
wf_set_counts()

// Highlight the new current row
dw_cust.TriggerEvent (rowfocuschanged!)
end on

type cb_retrieve from commandbutton within w_dw_functions
integer x = 2469
integer y = 36
integer width = 434
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Retrieve"
end type

on clicked;//////////////////////////////////////////////////////////////////////
//
// Purpose:  Retrieve the dw_cust datawindow
//				 Select the current row in the datawindow
//
//////////////////////////////////////////////////////////////////////

if dw_cust.Retrieve() = -1 then
	return
end if

f_select_current_row (dw_cust)

end on

type cb_new from commandbutton within w_dw_functions
integer x = 2469
integer y = 284
integer width = 434
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Insert Row"
end type

on clicked;/////////////////////////////////////////////////////////////////////
// Purpose:  insert a new row in dw_cust
/////////////////////////////////////////////////////////////////////

int	li_row, &
		li_cur_row


// Get the current and row
li_cur_row = dw_cust.GetRow()

// Insert new row prior to current row
li_row = dw_cust.InsertRow (li_cur_row)
dw_cust.ScrollToRow (li_row)
dw_cust.SetColumn ('id')

// update the displayed row counts of dw_cust
wf_set_counts()
end on

type cb_apply from commandbutton within w_dw_functions
integer x = 2469
integer y = 160
integer width = 434
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Update"
end type

on clicked;/////////////////////////////////////////////////////////////////////
// Purpose: Update dw_cust datawindow and reset the row counts
/////////////////////////////////////////////////////////////////////

if dw_cust.Update() = -1 then
	rollback;
else
	commit;
end if
wf_set_counts()
end on

type dw_cust from datawindow within w_dw_functions
integer x = 9
integer y = 252
integer width = 2432
integer height = 1452
integer taborder = 10
string dataobject = "d_cust"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

on retrieveend;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable command buttons after retrieval of datawindow
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

cb_apply.enabled = true
cb_delete.enabled = true
cb_display_mod.enabled = true
cb_new.enabled = true
cb_reset_mod.enabled = true
cb_undo.enabled = true
end on

on rowfocuschanged;f_select_current_row (this)
end on

on retrieverow;/////////////////////////////////////////////////////////////////////
// Purpose:  update the displayed count of dw_cust datawindow
/////////////////////////////////////////////////////////////////////

SetPointer (hourglass!)
st_displayed.text = String (dw_cust.RowCount())
end on

on itemfocuschanged;//////////////////////////////////////////////////////////////////////
// Purpose:  Update the row counts of the dw_cust datawindow.
//				 The row counts will change when a row has been modified
//				 or deleted.
//////////////////////////////////////////////////////////////////////

wf_set_counts ()
end on

on retrievestart;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Reset the displayed row counts to zero.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
st_displayed.text = '0'
st_deleted.text   = '0'
st_modified.text  = '0'

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Disable command buttons
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
cb_apply.enabled = false
cb_delete.enabled = false
cb_display_mod.enabled = false
cb_new.enabled = false
cb_reset_mod.enabled = false
cb_undo.enabled = false


end on

type st_4 from statictext within w_dw_functions
integer x = 1609
integer y = 32
integer width = 384
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Rows Deleted:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_dw_functions
integer x = 827
integer y = 32
integer width = 407
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Rows Modified:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_dw_functions
integer x = 18
integer y = 32
integer width = 439
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Rows Displayed:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_displayed from statictext within w_dw_functions
integer x = 480
integer y = 32
integer width = 247
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_modified from statictext within w_dw_functions
integer x = 1253
integer y = 32
integer width = 247
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_deleted from statictext within w_dw_functions
integer x = 2007
integer y = 32
integer width = 247
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type


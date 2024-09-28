$PBExportHeader$w_dw_criteria.srw
$PBExportComments$Provide Query (Criteria) Mode for DataWindow
forward
global type w_dw_criteria from w_center
end type
type st_dw_mode from statictext within w_dw_criteria
end type
type cb_reset from commandbutton within w_dw_criteria
end type
type cb_help from commandbutton within w_dw_criteria
end type
type st_3 from statictext within w_dw_criteria
end type
type cb_action from commandbutton within w_dw_criteria
end type
type st_2 from statictext within w_dw_criteria
end type
type mle_sql from multilineedit within w_dw_criteria
end type
type st_1 from statictext within w_dw_criteria
end type
type sle_rows from singlelineedit within w_dw_criteria
end type
type cb_close from commandbutton within w_dw_criteria
end type
type dw_1 from datawindow within w_dw_criteria
end type
end forward

global type w_dw_criteria from w_center
integer x = 361
integer y = 64
integer width = 2935
integer height = 1920
string title = "DataWindow Query Mode"
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_dw_mode st_dw_mode
cb_reset cb_reset
cb_help cb_help
st_3 st_3
cb_action cb_action
st_2 st_2
mle_sql mle_sql
st_1 st_1
sle_rows sle_rows
cb_close cb_close
dw_1 dw_1
end type
global w_dw_criteria w_dw_criteria

type variables
string is_original_sql_statement
end variables

forward prototypes
public subroutine wf_dw_query_mode ()
public subroutine wf_dw_retrieve_mode ()
end prototypes

public subroutine wf_dw_query_mode ();//  (Query Mode)

//Clear old SQL Select and row count, if any, from display
mle_sql.Text = ""
sle_rows.Text = ""

//Turn on DataWindow Query (Criteria Specification) Mode
dw_1.Object.datawindow.querymode= 'yes'

//Show the resulting SQL Select statement
mle_sql.Text = dw_1.GetSQLSelect ()

//Set focus into the DataWindow
dw_1.SetFocus ()

//Change Text of Button to allow Retrieval
cb_action.Text = "Retrieve"

//change datawindow heading to reflect query mode
st_dw_mode.text  = "Query Mode"
end subroutine

public subroutine wf_dw_retrieve_mode ();// Retrieve from Criteria

// Don't redraw until retrieval is finished
dw_1.SetRedraw (FALSE)

//	Turn off DataWindow Query (Criteria-specification) Mode
dw_1.Object.datawindow.querymode = 'no'

//	Show the resulting SQL Select statement
mle_sql.text = dw_1.GetSQLSelect ()
	
//	Retrieve, then redraw
dw_1.Retrieve ()
dw_1.SetRedraw (TRUE)

//	Display count of retrieved rows
sle_rows.text = String (dw_1.RowCount() )

//Change Text of Button to allow Query Mode Again 
cb_action.Text = "Query"

//change datawindow heading to reflect retrieved data
st_dw_mode.text = "Data Retrieved Based on Query Criteria:"
end subroutine

event open;call super::open;// Open script for w_dw_criteria

//Causes datawindow DW1 to use the programmer-specified transaction object specified in 
//transaction as defiend by the contents of SQLCA).
dw_1.SetTransObject (sqlca)

//Causes the event clicked to be exected for CB_ACTION. This will simulate someone 
//pressing the key on open of the window. That script will cause the datawindow to go
//into query mode.
cb_action.TriggerEvent("clicked")


end event

on w_dw_criteria.create
int iCurrent
call super::create
this.st_dw_mode=create st_dw_mode
this.cb_reset=create cb_reset
this.cb_help=create cb_help
this.st_3=create st_3
this.cb_action=create cb_action
this.st_2=create st_2
this.mle_sql=create mle_sql
this.st_1=create st_1
this.sle_rows=create sle_rows
this.cb_close=create cb_close
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_dw_mode
this.Control[iCurrent+2]=this.cb_reset
this.Control[iCurrent+3]=this.cb_help
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.cb_action
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.mle_sql
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.sle_rows
this.Control[iCurrent+10]=this.cb_close
this.Control[iCurrent+11]=this.dw_1
end on

on w_dw_criteria.destroy
call super::destroy
destroy(this.st_dw_mode)
destroy(this.cb_reset)
destroy(this.cb_help)
destroy(this.st_3)
destroy(this.cb_action)
destroy(this.st_2)
destroy(this.mle_sql)
destroy(this.st_1)
destroy(this.sle_rows)
destroy(this.cb_close)
destroy(this.dw_1)
end on

event close;call super::close;// Close script for w_dw_criteria

//w_main.Show ()
end event

type st_dw_mode from statictext within w_dw_criteria
integer x = 178
integer y = 144
integer width = 951
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Datawindow Mode:"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_reset from commandbutton within w_dw_criteria
integer x = 2551
integer y = 252
integer width = 288
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Reset"
end type

on clicked;// This will reset (reload) the datawindow object , in effect reseting it.
dw_1.dataobject = dw_1.dataobject
dw_1.settransobject (sqlca)

// Reinitalize the datawindow
wf_dw_query_mode ()
end on

type cb_help from commandbutton within w_dw_criteria
integer x = 2551
integer y = 516
integer width = 288
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

on clicked;f_open_help(parent.ClassName( ))
end on

type st_3 from statictext within w_dw_criteria
integer x = 50
integer width = 1687
integer height = 124
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Use the Query Mode to give examples of data you want retrieved. As the criteria is entered, the SQL is built below."
boolean focusrectangle = false
end type

type cb_action from commandbutton within w_dw_criteria
integer x = 2551
integer y = 140
integer width = 288
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Query"
boolean default = true
end type

on clicked;//Call retrieve or query mode functions (local window funcitons) based on the
//current text within the button. The button text is being used a "state" variable.

If cb_action.Text = "Retrieve" then 

	wf_dw_retrieve_mode ()

Else

	wf_dw_query_mode ()

End If
end on

type st_2 from statictext within w_dw_criteria
integer x = 178
integer y = 1260
integer width = 1097
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "SQL Syntax Generated from Query Mode:"
boolean focusrectangle = false
end type

type mle_sql from multilineedit within w_dw_criteria
integer x = 169
integer y = 1340
integer width = 2213
integer height = 420
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_dw_criteria
integer x = 1897
integer width = 306
integer height = 116
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Rows Retrieved:"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_rows from singlelineedit within w_dw_criteria
integer x = 2199
integer y = 36
integer width = 279
integer height = 80
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_close from commandbutton within w_dw_criteria
integer x = 2551
integer y = 384
integer width = 288
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;// Clicked script for cb_done

Close (Parent)
end on

type dw_1 from datawindow within w_dw_criteria
integer x = 178
integer y = 232
integer width = 2249
integer height = 1020
integer taborder = 10
string dataobject = "d_contact_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

on itemchanged;/**************************************************************
Show the resulting SQL Select statement
 **************************************************************/
//mle_sql.text = dw_1.Describe ("datawindow.table.select")
mle_sql.text = dw_1.GetSQLSelect()
end on


$PBExportHeader$w_connect_db.srw
$PBExportComments$Use DataWindow with either SetTrans or SetTransObject
forward
global type w_connect_db from w_center
end type
type cb_help from commandbutton within w_connect_db
end type
type st_2 from statictext within w_connect_db
end type
type st_st_time from statictext within w_connect_db
end type
type st_sto_time from statictext within w_connect_db
end type
type st_1 from statictext within w_connect_db
end type
type rb_settrans from radiobutton within w_connect_db
end type
type rb_settransobject from radiobutton within w_connect_db
end type
type cb_close from commandbutton within w_connect_db
end type
type cb_rollback from commandbutton within w_connect_db
end type
type cb_update from commandbutton within w_connect_db
end type
type cb_reset from commandbutton within w_connect_db
end type
type cb_commit from commandbutton within w_connect_db
end type
type cb_retrieve from commandbutton within w_connect_db
end type
type st_settransobject from statictext within w_connect_db
end type
type dw_1 from datawindow within w_connect_db
end type
end forward

global type w_connect_db from w_center
integer y = 56
integer width = 2935
integer height = 1812
string title = "Database Connection"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_help cb_help
st_2 st_2
st_st_time st_st_time
st_sto_time st_sto_time
st_1 st_1
rb_settrans rb_settrans
rb_settransobject rb_settransobject
cb_close cb_close
cb_rollback cb_rollback
cb_update cb_update
cb_reset cb_reset
cb_commit cb_commit
cb_retrieve cb_retrieve
st_settransobject st_settransobject
dw_1 dw_1
end type
global w_connect_db w_connect_db

type variables



end variables

event close;call super::close;//Close script for w_connect_db


//w_main.Show( )

end event

event open;call super::open;// Open script for w_connect_db



//SetTrans is the default transaction type for this datawindow although is it changeable
//from the user screen
//SetTrans sets the values in the internal transaction object for datawindowname to 
//the values from transaction (for example, the database name). The code for set trans
//will be run by "simulating" a clicked event on the radio button "set trans".

rb_settrans.triggerevent("clicked")



end event

on w_connect_db.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.st_2=create st_2
this.st_st_time=create st_st_time
this.st_sto_time=create st_sto_time
this.st_1=create st_1
this.rb_settrans=create rb_settrans
this.rb_settransobject=create rb_settransobject
this.cb_close=create cb_close
this.cb_rollback=create cb_rollback
this.cb_update=create cb_update
this.cb_reset=create cb_reset
this.cb_commit=create cb_commit
this.cb_retrieve=create cb_retrieve
this.st_settransobject=create st_settransobject
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_st_time
this.Control[iCurrent+4]=this.st_sto_time
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.rb_settrans
this.Control[iCurrent+7]=this.rb_settransobject
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.cb_rollback
this.Control[iCurrent+10]=this.cb_update
this.Control[iCurrent+11]=this.cb_reset
this.Control[iCurrent+12]=this.cb_commit
this.Control[iCurrent+13]=this.cb_retrieve
this.Control[iCurrent+14]=this.st_settransobject
this.Control[iCurrent+15]=this.dw_1
end on

on w_connect_db.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.st_2)
destroy(this.st_st_time)
destroy(this.st_sto_time)
destroy(this.st_1)
destroy(this.rb_settrans)
destroy(this.rb_settransobject)
destroy(this.cb_close)
destroy(this.cb_rollback)
destroy(this.cb_update)
destroy(this.cb_reset)
destroy(this.cb_commit)
destroy(this.cb_retrieve)
destroy(this.st_settransobject)
destroy(this.dw_1)
end on

type cb_help from commandbutton within w_connect_db
integer x = 2505
integer y = 1088
integer width = 329
integer height = 104
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

on clicked;f_open_help(parent.ClassName( ))
end on

type st_2 from statictext within w_connect_db
integer x = 1842
integer y = 16
integer width = 855
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Datawindow Transaction Type:"
boolean focusrectangle = false
end type

type st_st_time from statictext within w_connect_db
integer x = 1989
integer y = 184
integer width = 311
integer height = 88
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

type st_sto_time from statictext within w_connect_db
integer x = 2368
integer y = 184
integer width = 311
integer height = 88
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

type st_1 from statictext within w_connect_db
integer x = 1714
integer y = 144
integer width = 247
integer height = 184
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Time Last Action"
alignment alignment = center!
boolean focusrectangle = false
end type

type rb_settrans from radiobutton within w_connect_db
integer x = 1989
integer y = 100
integer width = 357
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "SetTrans"
boolean checked = true
end type

on clicked;// Clicked script for rb_settrans

// Once a SetTransObject has been issued, it will be used by the DataWindow
// until an explicit ResetTransObject has been issued.

// Clear the Datawindow, SetTrans and hide features irrelevant to
// SetTrans. Features like Fetch, commit and rollback may be issued
// within the scope of their own transaction object, but are separate
// from the internal transaction object used by the datawindow.
dw_1.Reset( )
dw_1.ResetTransObject( )
dw_1.SetTrans(sqlca)

st_settransobject.text = "SetTrans sets the values of the DataWindow's internal " + &
"transaction object. DataWindow functions such as Retrieve and Update connect " + &
"and disconnect each time they are executed. This makes the execution slower."

cb_commit.Enabled = false
cb_rollback.Enabled = false
st_sto_time.Enabled = false
st_st_time.Enabled = true
end on

type rb_settransobject from radiobutton within w_connect_db
integer x = 2368
integer y = 100
integer width = 521
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "SetTransObject"
end type

on clicked;// Clicked script for rb_settrasobject


//SetTransObject causes datawindowname to use the programmer-specified 
//transaction object specified in transaction. This gives you more control over the 
//transaction (for example, you can COMMIT from a script).
//In most cases, use the SetTransObject function to specify the transaction 
//object.
dw_1.SetTransObject(sqlca)

// Clear the DataWindow and make available features that can now be
// used in conjuction with the shared transaction object.
dw_1.Reset( )

st_settransobject.Text =  "SetTransObject tells the DataWindow to "+ &
"use the specified transaction object. DataWindow functions require no connect and " + &
"are therefore quicker. Embedded SQL can be issued using the same transaction, giving " + &
"more manual control."

//Enable the controls valid for SetTransObject
cb_commit.Enabled = true
cb_rollback.Enabled = true
st_sto_time.Enabled = true
st_st_time.Enabled = false
end on

type cb_close from commandbutton within w_connect_db
integer x = 2505
integer y = 952
integer width = 329
integer height = 104
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;//Clicked script 
Close(parent)
end on

type cb_rollback from commandbutton within w_connect_db
integer x = 2505
integer y = 816
integer width = 329
integer height = 104
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Ro&llback"
end type

on clicked;//Rollback cancels all database operations in the specified database since the last 
//COMMIT, ROLLBACK, or CONNECT. ROLLBACK does 
//not cause a disconnect, but it does close all open cursors and procedures.

ROLLBACK;

If SQLCA.SQLCode <> 0 then MessageBox("SQL error",SQLCA.SQLErrText,Exclamation!)
end on

type cb_update from commandbutton within w_connect_db
integer x = 2505
integer y = 468
integer width = 329
integer height = 104
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Update"
end type

on clicked;//Clicked script for cb_2
long 	ll_before_time, ll_after_time
int		li_rtn
//accepttext will take any changes in the datawindow even if the user has not tabbed off
//of the current field. Note: The current field in the datawindow has not changed its value
//until you leave that field or an explicit accepttext() is performed.
if dw_1.accepttext() = -1 then
	return
end if


//The cpu function is used to show milliseconds elapsed since execution of program.
//By capturing this elapsed number before and after the update, an elapsed number
//of milliseconds can be computed. The cpu function is used in place of the time function
//because now()'s accuracy is only down to the second.
ll_before_time = Cpu( )

//Perform the actual update to the database for and changed rows in the datawindow.
//A SetTrans or SetTransObject is assumed to already have taken place.
//Note: The changed are NOT commited when using SetTransObject until an explicit
//Commit is executed or the database connection is closed.
li_rtn = dw_1.Update( )

// Error handling
If li_rtn = -1 Then
	MessageBox ('Error on DataWindow Update', SQLCA.SQLErrText, exclamation!)
end if


ll_after_time = Cpu( )

//Display the elapsed seconds in the appropriate box
If rb_settrans.checked = True then
	st_st_time.text = string((ll_after_time - ll_before_time)/1000) + " sec"
Else
	st_sto_time.text = string((ll_after_time - ll_before_time)/1000) + " sec"
End If

end on

type cb_reset from commandbutton within w_connect_db
integer x = 2505
integer y = 584
integer width = 329
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Rese&t"
end type

on clicked;//Clicked script for cb_reset


//Reset is the fastest way to remove all data from a datawindow
dw_1.Reset( )
end on

type cb_commit from commandbutton within w_connect_db
integer x = 2505
integer y = 700
integer width = 329
integer height = 104
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Co&mmit"
end type

on clicked;//Commit will permanently update all database operations since the previous 
//COMMIT, ROLLBACK, or CONNECT. 
//Since USING is not specified here, the assumption will be that we are commiting
//for SQLCA.
//COMMIT does not cause a DISCONNECT, but it closes all cursors 
//associated with the transaction object.
//Note	In PowerBuilder, the DISCONNECT statement implies a COMMIT.

//It is good practice to test SQLCode after executing a COMMIT statement.


COMMIT ;

If SQLCA.SQLCode <> 0 then MessageBox("SQL error",SQLCA.SQLErrText,Exclamation!)

end on

type cb_retrieve from commandbutton within w_connect_db
integer x = 2505
integer y = 352
integer width = 329
integer height = 104
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Retrieve"
end type

on clicked;//Clicked script for cb_1

long 	ll_before_time, ll_after_time


//The cpu function is used to show milliseconds elapsed since execution of program.
//By capturing this elapsed number before and after the retrieve, an elapsed number
//of milliseconds can be computed. The cpu function is used in place of the time function
//because now()'s accuracy is only down to the second.
ll_before_time = Cpu( )

//execute the retrieve for datawindow. The connection SetTrans or SetTransObject is 
//assumed to already have been connected in the open event or radio buttons.
dw_1.Retrieve( )

ll_after_time = Cpu( )


//Display the elapsed seconds in the appropriate box
If rb_settrans.checked = True then
	st_st_time.Text = String((ll_after_time - ll_before_time)/1000) + " sec"
Else
	st_sto_time.Text = String((ll_after_time - ll_before_time)/1000) + " sec"
End If
end on

type st_settransobject from statictext within w_connect_db
integer x = 37
integer y = 16
integer width = 1664
integer height = 316
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

type dw_1 from datawindow within w_connect_db
integer x = 18
integer y = 344
integer width = 2437
integer height = 1292
integer taborder = 80
string dataobject = "d_cust"
boolean vscrollbar = true
end type


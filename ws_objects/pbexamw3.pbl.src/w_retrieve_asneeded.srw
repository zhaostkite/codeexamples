$PBExportHeader$w_retrieve_asneeded.srw
$PBExportComments$Compares performance times of retrieve vs. retrieve as needed using aggregate functions.
forward
global type w_retrieve_asneeded from w_center
end type
type st_8 from statictext within w_retrieve_asneeded
end type
type st_7 from statictext within w_retrieve_asneeded
end type
type st_elapsed2 from statictext within w_retrieve_asneeded
end type
type st_elapsed1 from statictext within w_retrieve_asneeded
end type
type st_4 from statictext within w_retrieve_asneeded
end type
type st_3 from statictext within w_retrieve_asneeded
end type
type st_2 from statictext within w_retrieve_asneeded
end type
type st_1 from statictext within w_retrieve_asneeded
end type
type cb_help from commandbutton within w_retrieve_asneeded
end type
type cb_close from commandbutton within w_retrieve_asneeded
end type
type cb_retrieve2 from commandbutton within w_retrieve_asneeded
end type
type cb_retrieve1 from commandbutton within w_retrieve_asneeded
end type
type dw_retrieve_asneeded from datawindow within w_retrieve_asneeded
end type
type dw_retrieve from datawindow within w_retrieve_asneeded
end type
end forward

global type w_retrieve_asneeded from w_center
integer x = 576
integer y = 8
integer width = 1783
integer height = 1920
string title = "Retrieve as Needed with Aggregate Functions"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_8 st_8
st_7 st_7
st_elapsed2 st_elapsed2
st_elapsed1 st_elapsed1
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_help cb_help
cb_close cb_close
cb_retrieve2 cb_retrieve2
cb_retrieve1 cb_retrieve1
dw_retrieve_asneeded dw_retrieve_asneeded
dw_retrieve dw_retrieve
end type
global w_retrieve_asneeded w_retrieve_asneeded

type variables
transaction   itr_trans
end variables

event open;call super::open;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// open script for w_retrieve_asneeded
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Create a transaction object for the Retrieve as Needed DataWindow.  Use the same values
// for the transaction object that SQLCA has.
itr_trans = create transaction

itr_trans.DBMS = sqlca.DBMS
itr_trans.database = sqlca.database
itr_trans.dbparm = sqlca.dbparm
itr_trans.userid = sqlca.userid
itr_trans.dbpass = sqlca.dbpass
itr_trans.logid = sqlca.logid
itr_trans.logpass = sqlca.logpass
itr_trans.servername = sqlca.servername

connect using itr_trans;

if itr_trans.SQLCode = -1 then
	MessageBox ("Error", "Connect failed", exclamation!)
	cb_retrieve2.enabled = false
end if

// Set the transaction objects for the DataWindows
dw_retrieve_asneeded.SetTransObject (itr_trans)
dw_retrieve.SetTransObject (sqlca)


end event

event close;call super::close;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// close script for w_retrieve_asneeded
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Disconnect the instance transaction from the database.
disconnect using itr_trans;

// Destroy the instance transaction.
destroy itr_trans

// Show the main window
//w_main.Show()

end event

on w_retrieve_asneeded.create
int iCurrent
call super::create
this.st_8=create st_8
this.st_7=create st_7
this.st_elapsed2=create st_elapsed2
this.st_elapsed1=create st_elapsed1
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_help=create cb_help
this.cb_close=create cb_close
this.cb_retrieve2=create cb_retrieve2
this.cb_retrieve1=create cb_retrieve1
this.dw_retrieve_asneeded=create dw_retrieve_asneeded
this.dw_retrieve=create dw_retrieve
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_8
this.Control[iCurrent+2]=this.st_7
this.Control[iCurrent+3]=this.st_elapsed2
this.Control[iCurrent+4]=this.st_elapsed1
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.cb_help
this.Control[iCurrent+10]=this.cb_close
this.Control[iCurrent+11]=this.cb_retrieve2
this.Control[iCurrent+12]=this.cb_retrieve1
this.Control[iCurrent+13]=this.dw_retrieve_asneeded
this.Control[iCurrent+14]=this.dw_retrieve
end on

on w_retrieve_asneeded.destroy
call super::destroy
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_elapsed2)
destroy(this.st_elapsed1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.cb_retrieve2)
destroy(this.cb_retrieve1)
destroy(this.dw_retrieve_asneeded)
destroy(this.dw_retrieve)
end on

type st_8 from statictext within w_retrieve_asneeded
integer x = 1481
integer y = 1188
integer width = 137
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "sec."
boolean focusrectangle = false
end type

type st_7 from statictext within w_retrieve_asneeded
integer x = 1481
integer y = 364
integer width = 137
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "sec."
boolean focusrectangle = false
end type

type st_elapsed2 from statictext within w_retrieve_asneeded
integer x = 1257
integer y = 1188
integer width = 201
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_elapsed1 from statictext within w_retrieve_asneeded
integer x = 1257
integer y = 364
integer width = 201
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_retrieve_asneeded
integer x = 1257
integer y = 1112
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
string text = "Retrieve Time:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_retrieve_asneeded
integer x = 1257
integer y = 288
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
string text = "Retrieve Time:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_retrieve_asneeded
integer x = 87
integer y = 880
integer width = 1029
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "DataWindow using Retrieve as Needed:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_retrieve_asneeded
integer x = 87
integer y = 56
integer width = 1152
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "DataWindow NOT using Retrieve as Needed:"
boolean focusrectangle = false
end type

type cb_help from commandbutton within w_retrieve_asneeded
integer x = 887
integer y = 1680
integer width = 279
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_help
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


f_open_help (parent.ClassName())
end event

type cb_close from commandbutton within w_retrieve_asneeded
integer x = 549
integer y = 1680
integer width = 279
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_close
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


close (parent)
end event

type cb_retrieve2 from commandbutton within w_retrieve_asneeded
integer x = 1257
integer y = 976
integer width = 279
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "R&etrieve"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_retrieve2
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the DataWindow that USES Retrieve as Needed
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_start, &
		ll_used, &
		ll_count

//Start tracking time
st_elapsed2.text = "0"
ll_start = CPU()

//Perform data retrieve
	// Because Retrieve as Needed will be overriden when aggregate functions are used, we need
	// to use embedded SQL to retrieve any aggregate values that are needed.
select count(*)
into :ll_count
from sales_order;
	// Retrieve the datawindow
dw_retrieve_asneeded.Retrieve()

//Display the total number of rows that can be retrieved.
dw_retrieve_asneeded.Object.count_t.text = String (ll_count)

//Stop tracking time
ll_used = CPU() - ll_start

//Report tracked time
st_elapsed2.text = String (ll_used / 1000, "#,##0.000")
end event

type cb_retrieve1 from commandbutton within w_retrieve_asneeded
integer x = 1257
integer y = 152
integer width = 279
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Retrieve"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_retrieve1
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the DataWindow that does NOT use Retrieve as Needed, calculating elapsed time
// with the CPU function.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_start, &
		ll_used


//Start tracking time
st_elapsed1.text = "0"
ll_start = CPU()

//Perform data retrieve
dw_retrieve.Retrieve()

//Stop tracking time
ll_used = CPU() - ll_start

//Report on tracked time
st_elapsed1.text = String (ll_used / 1000, "#,##0.000")
end event

type dw_retrieve_asneeded from datawindow within w_retrieve_asneeded
integer x = 87
integer y = 960
integer width = 1065
integer height = 636
integer taborder = 60
string dataobject = "d_sales_asneeded"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_retrieve from datawindow within w_retrieve_asneeded
integer x = 87
integer y = 136
integer width = 1065
integer height = 636
integer taborder = 10
string dataobject = "d_sales"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


$PBExportHeader$w_system_error.srw
$PBExportComments$Generic error window used in the application systemerror event
forward
global type w_system_error from w_center
end type
type dw_error from datawindow within w_system_error
end type
type cb_print from commandbutton within w_system_error
end type
type cb_exit from commandbutton within w_system_error
end type
type cb_continue from commandbutton within w_system_error
end type
end forward

global type w_system_error from w_center
integer x = 379
integer y = 428
integer width = 2231
integer height = 1108
string title = "System Error"
windowtype windowtype = response!
long backcolor = 78748035
toolbaralignment toolbaralignment = alignatleft!
dw_error dw_error
cb_print cb_print
cb_exit cb_exit
cb_continue cb_continue
end type
global w_system_error w_system_error

on w_system_error.create
int iCurrent
call super::create
this.dw_error=create dw_error
this.cb_print=create cb_print
this.cb_exit=create cb_exit
this.cb_continue=create cb_continue
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_error
this.Control[iCurrent+2]=this.cb_print
this.Control[iCurrent+3]=this.cb_exit
this.Control[iCurrent+4]=this.cb_continue
end on

on w_system_error.destroy
call super::destroy
destroy(this.dw_error)
destroy(this.cb_print)
destroy(this.cb_exit)
destroy(this.cb_continue)
end on

event open;call super::open;/////////////////////////////////////////////////////////////////////////
//
// Event	 :  w_system_error.open
//
// Purpose:
// 			Displays system errors and allows the user to either continue
//				running the application, exit the application, or print the 
//				error message.  Called from the systemerror event in the
//				application object.
//
// Log:
// 
// DATE		NAME				REVISION
//------		-------------------------------------------------------------
// Powersoft Corporation	INITIAL VERSION
//
///////////////////////////////////////////////////////////////////////////
f_Center ( )
dw_error.insertrow (1)

dw_error.setitem (1,"errornum",string(error.number))
dw_error.setitem (1,"message" ,error.text)
dw_error.setitem (1,"where"   ,error.windowmenu)
dw_error.setitem (1,"object"  ,error.object)
dw_error.setitem (1,"event"   ,error.objectevent)
dw_error.setitem (1,"line"    ,string(error.line))
end event

type dw_error from datawindow within w_system_error
integer x = 55
integer y = 40
integer width = 2085
integer height = 740
integer taborder = 10
boolean enabled = false
string dataobject = "d_system_error"
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_system_error
integer x = 1371
integer y = 856
integer width = 430
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

event clicked;/////////////////////////////////////////////////////////////////////////
//
// Event	 :  w_system_error.cb_print.clicked!
//
// Purpose:
// 			Event cb_print.clicked - Print the current error message
//				and write the error message to the supplied file name.
//
// Log:
// 
//  DATE		NAME				REVISION
// ------	-------------------------------------------------------------
// Powersoft Corporation	INITIAL VERSION
//
///////////////////////////////////////////////////////////////////////////

string ls_line
longptr	ll_prt

ll_prt   = printopen("System Error")

// Print each string variable

print    (ll_prt, "System error message - "+string(today())+" - "+string(now(), "HH:MM:SS"))
print    (ll_prt, " ")

ls_line = "Error Number  : " + getitemstring(dw_error,1,1)
print    (ll_prt, ls_line)

ls_line = "Error Message : " + getitemstring(dw_error,1,2)
print    (ll_prt, ls_line)

ls_line = "Window/Menu   : " + getitemstring(dw_error,1,3)
print    (ll_prt, ls_line)

ls_line = "Object        : " + getitemstring(dw_error,1,4)
print    (ll_prt, ls_line)

ls_line = "Event         : " + getitemstring(dw_error,1,5)
print    (ll_prt, ls_line)

ls_line = "Line Number   : " + getitemstring(dw_error,1,6)
print    (ll_prt, ls_line)

printclose(ll_prt)
return
end event

type cb_exit from commandbutton within w_system_error
integer x = 402
integer y = 856
integer width = 430
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Exit The Program"
boolean default = true
end type

on clicked;/////////////////////////////////////////////////////////////////////////
//
// Event	 :  w_system_error.cb_exit
//
// Purpose:
// 			Ends the application session
//
// Log:
// 
// DATE		NAME				REVISION
//------		-------------------------------------------------------------
// Powersoft Corporation	INITIAL VERSION
//
///////////////////////////////////////////////////////////////////////////

halt close
end on

type cb_continue from commandbutton within w_system_error
integer x = 887
integer y = 856
integer width = 430
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Continue"
end type

on clicked;/////////////////////////////////////////////////////////////////////////
//
// Event	 :  w_system_error.cb_continue
//
// Purpose:
// 			Closes w_system_error
//
// Log:
// 
// DATE		NAME				REVISION
//------		-------------------------------------------------------------
// Powersoft Corporation	INITIAL VERSION
//
///////////////////////////////////////////////////////////////////////////

close(parent)
end on


$PBExportHeader$w_cancel_button.srw
$PBExportComments$Cancel Button for w_cancel_retrieval
forward
global type w_cancel_button from w_center
end type
type cb_1 from commandbutton within w_cancel_button
end type
type st_count from statictext within w_cancel_button
end type
type st_1 from statictext within w_cancel_button
end type
end forward

global type w_cancel_button from w_center
integer x = 585
integer y = 268
integer width = 1294
integer height = 360
string title = "Hit Cancel Button to Stop Retrieval"
windowtype windowtype = popup!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
st_count st_count
st_1 st_1
end type
global w_cancel_button w_cancel_button

on w_cancel_button.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_count=create st_count
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_count
this.Control[iCurrent+3]=this.st_1
end on

on w_cancel_button.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_count)
destroy(this.st_1)
end on

event open;call super::open;f_Center ( )
end event

type cb_1 from commandbutton within w_cancel_button
integer x = 471
integer y = 132
integer width = 297
integer height = 108
integer taborder = 1
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel "
boolean cancel = true
end type

on clicked;//Clicked script for cb_cancel


//This will cause the script in the user defined event 
//"cancel_request" to be executed.
parent.ParentWindow( ).TriggerEvent("cancel_requested")



end on

type st_count from statictext within w_cancel_button
integer x = 809
integer y = 36
integer width = 293
integer height = 76
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "0"
end type

type st_1 from statictext within w_cancel_button
integer x = 183
integer y = 36
integer width = 585
integer height = 76
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Rows Retrieved:"
alignment alignment = right!
end type


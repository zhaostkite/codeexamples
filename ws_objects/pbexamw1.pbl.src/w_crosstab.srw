$PBExportHeader$w_crosstab.srw
$PBExportComments$Enhanced crosstab tab window.
forward
global type w_crosstab from w_center
end type
type st_2 from statictext within w_crosstab
end type
type st_status from statictext within w_crosstab
end type
type cb_change from commandbutton within w_crosstab
end type
type cb_help from commandbutton within w_crosstab
end type
type cb_print from commandbutton within w_crosstab
end type
type cb_close from commandbutton within w_crosstab
end type
type dw_1 from datawindow within w_crosstab
end type
end forward

global type w_crosstab from w_center
integer x = 87
integer y = 40
integer width = 2912
integer height = 1924
string title = "Enhanced Crosstab Reports"
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
st_2 st_2
st_status st_status
cb_change cb_change
cb_help cb_help
cb_print cb_print
cb_close cb_close
dw_1 dw_1
end type
global w_crosstab w_crosstab

forward prototypes
public subroutine wf_change_xtab (ref datawindow adw_datawindow)
end prototypes

event ue_postopen;///////////////////////////////////////////////////////////////////////////////////////////////////
//Ue_postopen for w_crosstab
///////////////////////////////////////////////////////////////////////////////////////////////////

//set the transaction object
dw_1.settransobject(sqlca)

//retrieve the data
dw_1.setredraw(false)
dw_1.retrieve()
st_status.text = " Ready"
dw_1.setredraw(true)
end event

public subroutine wf_change_xtab (ref datawindow adw_datawindow);// This function will dynamically change a crosstab to have a 
// more formatted appearance.

int li_column_count
int li_counter
int li_cur, li_next
string	ls_split
string 	ls_rc, ls_object, ls_return, ls_modstring
string 	ls_temp
string	ls_colname

//returns a list of all of the objects on the datawindow
ls_rc = adw_datawindow.Object.datawindow.objects

li_cur = 1
li_next = pos(ls_rc,'~t')

do until li_next = 0
	ls_object = mid(ls_rc,li_cur, li_next - li_cur)

//center text in the heading	
	If Lower(Left(adw_datawindow.describe(ls_object + ".Band"),6)) = "header"  Then
		ls_modstring = ls_modstring + ls_object + ".Alignment=2 " + &
			ls_object + ".Font.Weight=700 "
	End If

//format detail and total columns differently
	If adw_datawindow.describe(ls_object + ".Type") = "compute"  Then
		ls_temp = adw_datawindow.describe(ls_object + ".Expression")
		If pos(ls_temp,"sum") > 0 Then
			ls_modstring = ls_modstring + ls_object + ".Format='$#,##0' " 
		ElseIf pos(ls_temp,"count") > 0 Then 
			ls_modstring = ls_modstring + ls_object + ".Format='#,##0' " 
		End If
	ElseIf adw_datawindow.describe(ls_object + ".Type") = "column"  Then
		ls_temp = adw_datawindow.describe(ls_object + ".Coltype")
		If pos(ls_temp,"dec") > 0 Then
			ls_modstring = ls_modstring + ls_object + ".Format='$#,##0.00' " 
		ElseIf pos(ls_temp,"num") > 0 Then 
			ls_modstring = ls_modstring + ls_object + ".Format='#,##0.00' " 
		End If
	End If


//loop throgh all the objects on the datawindow
	li_cur = li_next + 1
	li_next = pos(ls_rc,'~t',li_cur)
loop
int li_min, li_x, li_rightside

////find where the crosstab 1st columns stops add a horizontal split bar
//	ls_temp = adw_datawindow.describe("datawindow.crosstab.rows")
//	li_cur = 1
//	li_next = pos(ls_temp,",")
//	li_min = -999
//	//go down through the columns, find the one with the right most ending.
//	do while li_next > 0
//		ls_colname = mid(ls_temp,li_cur,li_next - li_cur)
//		li_x = Integer(adw_datawindow.describe(ls_colname + ".X"))
//		li_rightside = li_x + Integer(adw_datawindow.describe(ls_colname + ".Width"))
//		If li_min < li_rightside Then 
//			ls_split = string (li_rightside)
//			li_min = li_rightside
//
//messagebox(" in loop max is",ls_split)
//		End If
//		li_cur = li_next + 1
//		li_next = pos(ls_temp,",",li_cur)
//	loop
//	
//	
//messagebox("out loop max is ",ls_split)
//
//	ls_modstring = ls_modstring + " Datawindow.HorizontalScrollSplit=" + ls_split
//	ls_modstring = ls_modstring + " Datawindow.HorizontalScrollPosition2=" + ls_split

	ls_return = adw_datawindow.Modify(ls_modstring)
	If ls_return <> "" Then messagebox("Display Change Err" + ls_return, ls_modstring)
	



end subroutine

event resize;call super::resize;/////////////////////////////////////////////////////////////////////////////////////////////////////
////Resize script for w_crosstab
/////////////////////////////////////////////////////////////////////////////////////////////////////
//dw_1.width = workspacewidth() - 14
//

end event

event open;call super::open;///////////////////////////////////////////////////////////////////////////////////////////////////
//Open script for w_crosstab
///////////////////////////////////////////////////////////////////////////////////////////////////
this.postevent("ue_postopen")
end event

event close;call super::close;///////////////////////////////////////////////////////////////////////////////////////////////////
//Close script for w_crosstab
///////////////////////////////////////////////////////////////////////////////////////////////////

//w_main.Show( )

end event

on w_crosstab.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_status=create st_status
this.cb_change=create cb_change
this.cb_help=create cb_help
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_status
this.Control[iCurrent+3]=this.cb_change
this.Control[iCurrent+4]=this.cb_help
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.dw_1
end on

on w_crosstab.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_status)
destroy(this.cb_change)
destroy(this.cb_help)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type st_2 from statictext within w_crosstab
integer x = 14
integer y = 28
integer width = 288
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Status:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_status from statictext within w_crosstab
integer x = 311
integer y = 28
integer width = 1426
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = " Ready"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_change from commandbutton within w_crosstab
integer x = 571
integer y = 1668
integer width = 544
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Change Cross&tab"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_change
///////////////////////////////////////////////////////////////////////////////////////////////////

//bring up the standard dialog to dynamically change crosstab definition
dw_1.setredraw(false)
dw_1.crosstabdialog( )
wf_change_xtab(dw_1)
st_status.text = " Ready"
dw_1.setredraw(true)
end event

type cb_help from commandbutton within w_crosstab
integer x = 1947
integer y = 1668
integer width = 279
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Help"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_help
///////////////////////////////////////////////////////////////////////////////////////////////////

f_open_help(parent.ClassName( ))
end event

type cb_print from commandbutton within w_crosstab
integer x = 1207
integer y = 1668
integer width = 279
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Print"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_print
///////////////////////////////////////////////////////////////////////////////////////////////////

//print datawindow
dw_1.print() 
end event

type cb_close from commandbutton within w_crosstab
integer x = 1577
integer y = 1668
integer width = 279
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "&Close"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_close
///////////////////////////////////////////////////////////////////////////////////////////////////

Close(parent)
end event

type dw_1 from datawindow within w_crosstab
event ue_messagetext pbm_dwnmessagetext
integer x = 9
integer y = 152
integer width = 2830
integer height = 1452
integer taborder = 10
string dataobject = "d_crosstab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_messagetext;///////////////////////////////////////////////////////////////////////////////////////////////////
// ue_MessageText script for dw_1
///////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////
//This event occurs each time the datawindow has a message to 
//display on status
///////////////////////////////////////////////////////////////////////////////////////////////////

setpointer(hourglass!)

st_status.text = " " + text

end event

event retrievestart;///////////////////////////////////////////////////////////////////////////////////////////////////
// RetrieveStart script for dw_1
///////////////////////////////////////////////////////////////////////////////////////////////////

setpointer(hourglass!)

//Disable buttons
cb_help.enabled = false
cb_close.enabled = false
cb_print.enabled = false
cb_change.enabled = false

//Display on-window status
st_status.text = " Retrieving Data..."

end event

event retrieveend;///////////////////////////////////////////////////////////////////////////////////////////////////
// RetrieveEnd script for dw_1
///////////////////////////////////////////////////////////////////////////////////////////////////

//Enable buttons
cb_help.enabled = true
cb_close.enabled = true
cb_print.enabled = true
cb_change.enabled = true
end event


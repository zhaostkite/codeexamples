$PBExportHeader$w_high_low_salaries.srw
$PBExportComments$Shows a bitmap indicator in DataWindow conditional on value of salary
forward
global type w_high_low_salaries from w_center
end type
type dw_employee_compensation from datawindow within w_high_low_salaries
end type
type cb_close from commandbutton within w_high_low_salaries
end type
end forward

global type w_high_low_salaries from w_center
integer x = 361
integer y = 300
integer width = 2437
integer height = 1664
string title = "Conditional Bitmaps"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
dw_employee_compensation dw_employee_compensation
cb_close cb_close
end type
global w_high_low_salaries w_high_low_salaries

event open;call super::open;//Open script for w_high_low_salaries

dw_employee_compensation.SetTransObject(sqlca)
dw_employee_compensation.Retrieve( )
end event

on w_high_low_salaries.create
int iCurrent
call super::create
this.dw_employee_compensation=create dw_employee_compensation
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_employee_compensation
this.Control[iCurrent+2]=this.cb_close
end on

on w_high_low_salaries.destroy
call super::destroy
destroy(this.dw_employee_compensation)
destroy(this.cb_close)
end on

event close;call super::close;////Close script for w_high_low_salaries
//
//this.Hide( )
//w_main.Show( )
end event

type dw_employee_compensation from datawindow within w_high_low_salaries
integer x = 73
integer y = 80
integer width = 2258
integer height = 1232
integer taborder = 10
string dataobject = "d_employee_salary"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_close from commandbutton within w_high_low_salaries
integer x = 1024
integer y = 1392
integer width = 380
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean default = true
end type

on clicked;//Clicked script for cb_close

Close(parent)
end on


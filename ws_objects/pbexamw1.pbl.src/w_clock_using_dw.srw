$PBExportHeader$w_clock_using_dw.srw
$PBExportComments$Digital Clock using datawindow computed field, now & today functions and datawindow timer.
forward
global type w_clock_using_dw from w_center
end type
type dw_1 from datawindow within w_clock_using_dw
end type
end forward

global type w_clock_using_dw from w_center
integer x = 997
integer y = 840
integer width = 960
integer height = 268
string title = "Digital Clock"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
dw_1 dw_1
end type
global w_clock_using_dw w_clock_using_dw

on close;// Close script for w_clock_using_dw

close (this)
w_main.Show( )
end on

on w_clock_using_dw.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_clock_using_dw.destroy
call super::destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_clock_using_dw
integer x = 78
integer y = 24
integer width = 759
integer height = 108
integer taborder = 1
string dataobject = "d_clock"
boolean border = false
end type


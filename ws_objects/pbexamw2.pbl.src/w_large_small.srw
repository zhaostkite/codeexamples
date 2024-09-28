﻿$PBExportHeader$w_large_small.srw
$PBExportComments$Demonstrates the DataWindow functions Large() and Small()
forward
global type w_large_small from w_center
end type
type cb_print from commandbutton within w_large_small
end type
type cb_close from commandbutton within w_large_small
end type
type dw_1 from datawindow within w_large_small
end type
end forward

global type w_large_small from w_center
integer x = 169
integer y = 132
integer width = 2574
integer height = 1660
string title = "Large & Small Functions Example"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_print cb_print
cb_close cb_close
dw_1 dw_1
end type
global w_large_small w_large_small

event open;call super::open;dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

event close;call super::close;//Close script 


//w_main.Show( )

end event

on w_large_small.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.dw_1
end on

on w_large_small.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type cb_print from commandbutton within w_large_small
integer x = 937
integer y = 1392
integer width = 279
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

on clicked;//print datawindow
dw_1.print() 
end on

type cb_close from commandbutton within w_large_small
integer x = 1298
integer y = 1392
integer width = 279
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;Close(parent)
end on

type dw_1 from datawindow within w_large_small
integer x = 5
integer width = 2528
integer height = 1340
integer taborder = 10
string dataobject = "d_large_small"
boolean vscrollbar = true
boolean livescroll = true
end type

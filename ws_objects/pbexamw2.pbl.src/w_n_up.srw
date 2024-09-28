$PBExportHeader$w_n_up.srw
$PBExportComments$Window that shows a DataWindow with 2 rows up per row displayed.
forward
global type w_n_up from w_center
end type
type cb_1 from commandbutton within w_n_up
end type
type cb_close from commandbutton within w_n_up
end type
type dw_my_n-up from datawindow within w_n_up
end type
end forward

global type w_n_up from w_center
integer x = 146
integer y = 320
integer width = 2825
integer height = 1896
string title = "N-Up Datawindow"
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
cb_1 cb_1
cb_close cb_close
dw_my_n-up dw_my_n-up
end type
global w_n_up w_n_up

on ue_postopen;dw_my_n-up.settransobject(sqlca)
dw_my_n-up.retrieve()
end on

event open;call super::open;this.postevent("ue_postopen")
end event

event close;call super::close;//w_main.Show()
end event

on w_n_up.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_close=create cb_close
this.dw_my_n-up=create dw_my_n-up
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.dw_my_n-up
end on

on w_n_up.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.dw_my_n-up)
end on

type cb_1 from commandbutton within w_n_up
integer x = 1001
integer y = 1644
integer width = 361
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

on clicked;// use the standard datawindow print command
	dw_my_n-up.print()
end on

type cb_close from commandbutton within w_n_up
integer x = 1440
integer y = 1644
integer width = 361
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;
	close(parent)
end on

type dw_my_n-up from datawindow within w_n_up
integer x = 41
integer y = 40
integer width = 2679
integer height = 1568
integer taborder = 10
string dataobject = "d_n_up"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


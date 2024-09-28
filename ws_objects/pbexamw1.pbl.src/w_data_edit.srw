$PBExportHeader$w_data_edit.srw
$PBExportComments$Window used with the Data Explorer example to edit an item
forward
global type w_data_edit from w_center
end type
type cb_cancel from commandbutton within w_data_edit
end type
type cb_ok from commandbutton within w_data_edit
end type
type dw_1 from datawindow within w_data_edit
end type
end forward

global type w_data_edit from w_center
integer x = 5
integer y = 4
integer width = 1893
integer height = 904
string title = "Edit Item"
long backcolor = 75530304
toolbaralignment toolbaralignment = alignatleft!
cb_cancel cb_cancel
cb_ok cb_ok
dw_1 dw_1
end type
global w_data_edit w_data_edit

type variables
Window	iw_Frame, iw_Parent
end variables

event open;call super::open;n_cst_parms	lnv_Parm

f_Center ( )

SetPointer(HourGlass!)

lnv_Parm = Message.PowerObjectParm

iw_Frame = lnv_Parm.iw_Frame
iw_Parent = lnv_Parm.iw_Parent

dw_1.DataObject = lnv_Parm.is_DataObject
dw_1.SetTransObject(sqlca)
dw_1.Retrieve(lnv_Parm.ii_Parm1, lnv_Parm.ii_Parm2)

dw_1.SetFilter(lnv_Parm.is_Filter)
dw_1.Filter()

This.Move(This.X + lnv_Parm.ii_OpenPos, This.Y + lnv_Parm.ii_OpenPos)

end event

on w_data_edit.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.dw_1
end on

on w_data_edit.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_1)
end on

event close;If IsValid(iw_Frame) Then
	iw_Frame.WindowState = Normal!
End If

end event

type cb_cancel from commandbutton within w_data_edit
integer x = 951
integer y = 672
integer width = 229
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_ok from commandbutton within w_data_edit
integer x = 677
integer y = 672
integer width = 229
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "OK"
boolean default = true
end type

event clicked;dw_1.Update()

iw_Parent.Trigger Dynamic Event ue_refresh()

Close(Parent)

end event

type dw_1 from datawindow within w_data_edit
integer x = 5
integer y = 4
integer width = 1801
integer height = 608
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


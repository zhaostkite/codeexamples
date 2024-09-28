$PBExportHeader$w_reg_update_value.srw
$PBExportComments$Window to update a registry value
forward
global type w_reg_update_value from w_center
end type
type cb_cancel from commandbutton within w_reg_update_value
end type
type cb_ok from commandbutton within w_reg_update_value
end type
type sle_data from singlelineedit within w_reg_update_value
end type
type sle_name from singlelineedit within w_reg_update_value
end type
type st_2 from statictext within w_reg_update_value
end type
type st_1 from statictext within w_reg_update_value
end type
end forward

global type w_reg_update_value from w_center
integer x = 439
integer y = 456
integer width = 1842
integer height = 624
string title = "Edit String"
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_cancel cb_cancel
cb_ok cb_ok
sle_data sle_data
sle_name sle_name
st_2 st_2
st_1 st_1
end type
global w_reg_update_value w_reg_update_value

event open;call super::open;String	ls_Parm
Integer	li_Pos
f_Center ( )
ls_Parm = Message.StringParm

li_Pos = Pos(ls_Parm, "~t")

sle_name.Text = Left(ls_Parm, (li_Pos - 1))
sle_data.Text = Right(ls_Parm, (Len(ls_Parm) - li_Pos))

sle_data.SelectText(1, Len(sle_data.Text))

end event

on w_reg_update_value.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_data=create sle_data
this.sle_name=create sle_name
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.sle_data
this.Control[iCurrent+4]=this.sle_name
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
end on

on w_reg_update_value.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.sle_data)
destroy(this.sle_name)
destroy(this.st_2)
destroy(this.st_1)
end on

type cb_cancel from commandbutton within w_reg_update_value
integer x = 1417
integer y = 388
integer width = 306
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;String	ls_Null

SetNull(ls_Null)
CloseWithReturn(Parent, ls_Null)

end event

type cb_ok from commandbutton within w_reg_update_value
integer x = 1079
integer y = 388
integer width = 306
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

event clicked;CloseWithReturn(Parent, sle_data.Text)

end event

type sle_data from singlelineedit within w_reg_update_value
integer x = 32
integer y = 276
integer width = 1691
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type sle_name from singlelineedit within w_reg_update_value
integer x = 32
integer y = 92
integer width = 1691
integer height = 72
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_reg_update_value
integer x = 32
integer y = 204
integer width = 256
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "Value Data:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_reg_update_value
integer x = 32
integer y = 24
integer width = 288
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 73955432
boolean enabled = false
string text = "Value Name:"
boolean focusrectangle = false
end type


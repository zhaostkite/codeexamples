$PBExportHeader$w_tab_position.srw
$PBExportComments$Response window to change tab position - used by phone dir example
forward
global type w_tab_position from w_center
end type
type cb_apply from commandbutton within w_tab_position
end type
type cb_cancel from commandbutton within w_tab_position
end type
type cb_ok from commandbutton within w_tab_position
end type
type rb_bottomandtop from radiobutton within w_tab_position
end type
type rb_topandbottom from radiobutton within w_tab_position
end type
type rb_rightandleft from radiobutton within w_tab_position
end type
type rb_leftandright from radiobutton within w_tab_position
end type
type rb_bottom from radiobutton within w_tab_position
end type
type rb_right from radiobutton within w_tab_position
end type
type rb_top from radiobutton within w_tab_position
end type
type rb_left from radiobutton within w_tab_position
end type
type gb_1 from groupbox within w_tab_position
end type
end forward

global type w_tab_position from w_center
integer x = 823
integer y = 264
integer width = 1001
integer height = 1012
string title = "Change Tab Position"
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_apply cb_apply
cb_cancel cb_cancel
cb_ok cb_ok
rb_bottomandtop rb_bottomandtop
rb_topandbottom rb_topandbottom
rb_rightandleft rb_rightandleft
rb_leftandright rb_leftandright
rb_bottom rb_bottom
rb_right rb_right
rb_top rb_top
rb_left rb_left
gb_1 gb_1
end type
global w_tab_position w_tab_position

type variables
w_phone_dir	iw_Parent
end variables

event open;call super::open;f_Center ( )

iw_Parent = Message.PowerObjectParm

Choose Case iw_Parent.tab_book.TabPosition
	Case TabsOnLeft!
		rb_left.Checked = True
	Case TabsOnRight!
		rb_right.Checked = True
	Case TabsOnLeftAndRight!
		rb_leftandright.Checked = True
	Case TabsOnRightAndLeft!
		rb_rightandleft.Checked = True
	Case TabsOnTop!
		rb_top.Checked = True
	Case TabsOnBottom!
		rb_bottom.Checked = True
	Case TabsOnTopAndBottom!
		rb_topandbottom.Checked = True
	Case TabsOnBottomAndTop!
		rb_bottomandtop.Checked = True
End Choose

end event

on w_tab_position.create
int iCurrent
call super::create
this.cb_apply=create cb_apply
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.rb_bottomandtop=create rb_bottomandtop
this.rb_topandbottom=create rb_topandbottom
this.rb_rightandleft=create rb_rightandleft
this.rb_leftandright=create rb_leftandright
this.rb_bottom=create rb_bottom
this.rb_right=create rb_right
this.rb_top=create rb_top
this.rb_left=create rb_left
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_apply
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.rb_bottomandtop
this.Control[iCurrent+5]=this.rb_topandbottom
this.Control[iCurrent+6]=this.rb_rightandleft
this.Control[iCurrent+7]=this.rb_leftandright
this.Control[iCurrent+8]=this.rb_bottom
this.Control[iCurrent+9]=this.rb_right
this.Control[iCurrent+10]=this.rb_top
this.Control[iCurrent+11]=this.rb_left
this.Control[iCurrent+12]=this.gb_1
end on

on w_tab_position.destroy
call super::destroy
destroy(this.cb_apply)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.rb_bottomandtop)
destroy(this.rb_topandbottom)
destroy(this.rb_rightandleft)
destroy(this.rb_leftandright)
destroy(this.rb_bottom)
destroy(this.rb_right)
destroy(this.rb_top)
destroy(this.rb_left)
destroy(this.gb_1)
end on

type cb_apply from commandbutton within w_tab_position
integer x = 617
integer y = 316
integer width = 265
integer height = 88
integer taborder = 31
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Apply"
end type

event clicked;TabPosition	ltb_Position

If rb_left.Checked Then
	ltb_Position = TabsOnLeft!
Elseif rb_right.Checked Then
	ltb_Position = TabsOnRight!
Elseif rb_leftandright.Checked Then
	ltb_Position = TabsOnLeftAndRight!
Elseif rb_rightandleft.Checked Then
	ltb_Position = TabsOnRightAndLeft!
Elseif rb_top.Checked Then
	ltb_Position = TabsOnTop!
Elseif rb_bottom.Checked Then
	ltb_Position = TabsOnBottom!
Elseif rb_topandbottom.Checked Then
	ltb_Position = TabsOnTopAndBottom!
Else
	ltb_Position = TabsOnBottomAndTop!
End if

iw_Parent.of_changetab(ltb_Position)

end event

type cb_cancel from commandbutton within w_tab_position
integer x = 617
integer y = 192
integer width = 265
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_ok from commandbutton within w_tab_position
integer x = 617
integer y = 68
integer width = 265
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

event clicked;cb_apply.Trigger Event clicked()

Close(Parent)

end event

type rb_bottomandtop from radiobutton within w_tab_position
integer x = 55
integer y = 724
integer width = 457
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Bottom and Top"
end type

type rb_topandbottom from radiobutton within w_tab_position
integer x = 55
integer y = 632
integer width = 457
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Top and Bottom"
end type

type rb_rightandleft from radiobutton within w_tab_position
integer x = 55
integer y = 364
integer width = 416
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Right and Left"
end type

type rb_leftandright from radiobutton within w_tab_position
integer x = 55
integer y = 276
integer width = 421
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Left and Right"
end type

type rb_bottom from radiobutton within w_tab_position
integer x = 55
integer y = 544
integer width = 265
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Bottom"
end type

type rb_right from radiobutton within w_tab_position
integer x = 55
integer y = 184
integer width = 233
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Right"
end type

type rb_top from radiobutton within w_tab_position
integer x = 55
integer y = 452
integer width = 233
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Top"
end type

type rb_left from radiobutton within w_tab_position
integer x = 55
integer y = 96
integer width = 233
integer height = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Left"
end type

type gb_1 from groupbox within w_tab_position
integer x = 9
integer y = 32
integer width = 521
integer height = 800
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Tab Postion"
end type


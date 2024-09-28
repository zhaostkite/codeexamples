$PBExportHeader$w_plb_icon.srw
$PBExportComments$Window to display an icon
forward
global type w_plb_icon from w_center
end type
type lv_1 from listview within w_plb_icon
end type
type rb_small from radiobutton within w_plb_icon
end type
type rb_large from radiobutton within w_plb_icon
end type
type cb_close from commandbutton within w_plb_icon
end type
type gb_1 from groupbox within w_plb_icon
end type
end forward

global type w_plb_icon from w_center
integer x = 5
integer y = 4
integer width = 1349
integer height = 1304
string title = "View Icon"
long backcolor = 74481808
lv_1 lv_1
rb_small rb_small
rb_large rb_large
cb_close cb_close
gb_1 gb_1
end type
global w_plb_icon w_plb_icon

type variables

end variables

event open;call super::open;Integer			li_Pict
String			ls_PictName
ListViewItem	llvi_1

f_Center ( )
ls_PictName = Message.StringParm

li_Pict = lv_1.AddLargePicture(ls_PictName)
li_Pict = lv_1.AddSmallPicture(ls_PictName)

llvi_1.PictureIndex = li_Pict
lv_1.AddItem(llvi_1)
//llvi_1.ItemX = -60
lv_1.SetItem(1, llvi_1)

end event

on w_plb_icon.create
int iCurrent
call super::create
this.lv_1=create lv_1
this.rb_small=create rb_small
this.rb_large=create rb_large
this.cb_close=create cb_close
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lv_1
this.Control[iCurrent+2]=this.rb_small
this.Control[iCurrent+3]=this.rb_large
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.gb_1
end on

on w_plb_icon.destroy
call super::destroy
destroy(this.lv_1)
destroy(this.rb_small)
destroy(this.rb_large)
destroy(this.cb_close)
destroy(this.gb_1)
end on

type lv_1 from listview within w_plb_icon
integer x = 14
integer y = 376
integer width = 320
integer height = 320
integer taborder = 11
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
boolean border = false
boolean buttonheader = false
boolean showheader = false
boolean labelwrap = false
boolean scrolling = false
boolean hideselection = false
integer largepicturewidth = 32
integer largepictureheight = 32
long largepicturemaskcolor = 553648127
integer smallpicturewidth = 16
integer smallpictureheight = 16
long smallpicturemaskcolor = 553648127
long statepicturemaskcolor = 553648127
end type

type rb_small from radiobutton within w_plb_icon
integer x = 55
integer y = 200
integer width = 581
integer height = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Small (16 x 16)"
end type

event clicked;ListViewItem	llvi_1

lv_1.View = ListViewSmallIcon!

lv_1.GetItem(1, llvi_1)
llvi_1.ItemX = 1
lv_1.SetItem(1, llvi_1)

end event

type rb_large from radiobutton within w_plb_icon
integer x = 55
integer y = 96
integer width = 576
integer height = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Large (32 x 32)"
boolean checked = true
end type

event clicked;ListViewItem	llvi_1

lv_1.View = ListViewLargeIcon!

lv_1.GetItem(1, llvi_1)
llvi_1.ItemX = 0
lv_1.SetItem(1, llvi_1)

end event

type cb_close from commandbutton within w_plb_icon
integer x = 850
integer y = 32
integer width = 338
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean default = true
end type

event clicked;Close(Parent)

end event

type gb_1 from groupbox within w_plb_icon
integer x = 14
integer width = 686
integer height = 328
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Icon Size"
end type


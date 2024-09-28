$PBExportHeader$w_mle_scroll.srw
$PBExportComments$MultiLineEdits text behavior with various scrollbar and autoscroll attributes
forward
global type w_mle_scroll from w_center
end type
type st_3 from statictext within w_mle_scroll
end type
type st_2 from statictext within w_mle_scroll
end type
type st_1 from statictext within w_mle_scroll
end type
type mle_ahorizontal from multilineedit within w_mle_scroll
end type
type mle_avertical from multilineedit within w_mle_scroll
end type
type cbx_horizontal from checkbox within w_mle_scroll
end type
type cbx_vertical from checkbox within w_mle_scroll
end type
type cb_close from commandbutton within w_mle_scroll
end type
type mle_scroll from multilineedit within w_mle_scroll
end type
type gb_scrollbars from groupbox within w_mle_scroll
end type
end forward

global type w_mle_scroll from w_center
integer x = 402
integer y = 48
integer width = 1943
integer height = 1816
string title = "MultiLineEdit Scrolling Attributes"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_3 st_3
st_2 st_2
st_1 st_1
mle_ahorizontal mle_ahorizontal
mle_avertical mle_avertical
cbx_horizontal cbx_horizontal
cbx_vertical cbx_vertical
cb_close cb_close
mle_scroll mle_scroll
gb_scrollbars gb_scrollbars
end type
global w_mle_scroll w_mle_scroll

type variables
string is_mletext
end variables

event open;call super::open;// Open script for w_mletest

//use this to reset the mle after attributes have been changed
is_mletext = "This is MultiLineEdit Box. You can change the attributes of this " + &
"box by checking and unchecking the boxes at right. Notice the different effects "+ &
"the attributes have on the MLE. Notice the effects of the scroll bars, and the auto "+ &
"scrolling."


mle_scroll.text = is_mletext
mle_avertical.text = is_mletext
mle_ahorizontal.text = is_mletext
end event

on w_mle_scroll.create
int iCurrent
call super::create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_ahorizontal=create mle_ahorizontal
this.mle_avertical=create mle_avertical
this.cbx_horizontal=create cbx_horizontal
this.cbx_vertical=create cbx_vertical
this.cb_close=create cb_close
this.mle_scroll=create mle_scroll
this.gb_scrollbars=create gb_scrollbars
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.mle_ahorizontal
this.Control[iCurrent+5]=this.mle_avertical
this.Control[iCurrent+6]=this.cbx_horizontal
this.Control[iCurrent+7]=this.cbx_vertical
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.mle_scroll
this.Control[iCurrent+10]=this.gb_scrollbars
end on

on w_mle_scroll.destroy
call super::destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_ahorizontal)
destroy(this.mle_avertical)
destroy(this.cbx_horizontal)
destroy(this.cbx_vertical)
destroy(this.cb_close)
destroy(this.mle_scroll)
destroy(this.gb_scrollbars)
end on

event close;call super::close;//w_main.show()
end event

type st_3 from statictext within w_mle_scroll
integer x = 23
integer y = 16
integer width = 1865
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Try typing in each of the MLE~'s and notice the effects each attribute has."
boolean focusrectangle = false
end type

type st_2 from statictext within w_mle_scroll
integer x = 969
integer y = 1120
integer width = 855
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Auto Horizontal Scroll Turned On"
boolean focusrectangle = false
end type

type st_1 from statictext within w_mle_scroll
integer x = 969
integer y = 652
integer width = 791
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Auto Vertical Scroll Turned On"
boolean focusrectangle = false
end type

type mle_ahorizontal from multilineedit within w_mle_scroll
integer x = 87
integer y = 1104
integer width = 777
integer height = 424
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean autohscroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_avertical from multilineedit within w_mle_scroll
integer x = 87
integer y = 632
integer width = 777
integer height = 424
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_horizontal from checkbox within w_mle_scroll
integer x = 1001
integer y = 304
integer width = 384
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Horizontal"
end type

on clicked;//Add or Remove a horizontal scroll bar to the MLE
If this.checked Then 
	mle_scroll.hscrollbar = True
Else
	mle_scroll.hscrollbar = False
End If
end on

type cbx_vertical from checkbox within w_mle_scroll
integer x = 1001
integer y = 216
integer width = 325
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Vertical"
end type

on clicked;//Add or Remove a vertical scroll bar to the MLE
If this.checked Then 
	mle_scroll.vscrollbar = True
Else
	mle_scroll.vscrollbar = False
End If
end on

type cb_close from commandbutton within w_mle_scroll
integer x = 777
integer y = 1576
integer width = 375
integer height = 88
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;// Clicked script for cb_done

Close (Parent)

end on

type mle_scroll from multilineedit within w_mle_scroll
integer x = 87
integer y = 160
integer width = 777
integer height = 424
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
borderstyle borderstyle = stylelowered!
end type

type gb_scrollbars from groupbox within w_mle_scroll
integer x = 969
integer y = 140
integer width = 489
integer height = 276
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Scroll Bars"
end type


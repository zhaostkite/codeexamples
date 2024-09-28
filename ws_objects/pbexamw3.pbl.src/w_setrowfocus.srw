$PBExportHeader$w_setrowfocus.srw
$PBExportComments$Demonstrates the use of the rowfocus indicator in a datawindow
forward
global type w_setrowfocus from w_center
end type
type st_1 from statictext within w_setrowfocus
end type
type dw_bitmap from datawindow within w_setrowfocus
end type
type rb_right from radiobutton within w_setrowfocus
end type
type rb_left from radiobutton within w_setrowfocus
end type
type rb_none from radiobutton within w_setrowfocus
end type
type p_1 from picture within w_setrowfocus
end type
type cb_close from commandbutton within w_setrowfocus
end type
type rb_rect from radiobutton within w_setrowfocus
end type
type rb_hand from radiobutton within w_setrowfocus
end type
type dw_1 from datawindow within w_setrowfocus
end type
type rb_pic from radiobutton within w_setrowfocus
end type
type gb_1 from groupbox within w_setrowfocus
end type
type gb_2 from groupbox within w_setrowfocus
end type
end forward

global type w_setrowfocus from w_center
integer y = 132
integer width = 2999
integer height = 2124
string title = "Row Focus Indicators"
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
st_1 st_1
dw_bitmap dw_bitmap
rb_right rb_right
rb_left rb_left
rb_none rb_none
p_1 p_1
cb_close cb_close
rb_rect rb_rect
rb_hand rb_hand
dw_1 dw_1
rb_pic rb_pic
gb_1 gb_1
gb_2 gb_2
end type
global w_setrowfocus w_setrowfocus

type variables

end variables

forward prototypes
public subroutine wf_set_row_focus_indicator ()
public subroutine wf_disable_picture_dw ()
end prototypes

event ue_postopen;//Open script for w_setrowfocus
dw_1.SetTransObject(sqlca)

//defualt indicator for this window will be the Focus Rectange
rb_rect.triggerevent("clicked")

//populate datawindow
dw_1.Retrieve( )

//initialize the datawindow for selecting bitmaps
dw_bitmap.InsertRow(0)
dw_bitmap.Object.bitmapname[1] = "indicatr.bmp"

end event

public subroutine wf_set_row_focus_indicator ();//Clicked script for rb_left

// If hand or picture is checked, set them to the left
// (x =0, y = 0 is default, relative to row)

//hand is row indicator (two cases left and right positions)
if rb_hand.checked then
	if rb_left.checked then 
		dw_1.SetRowFocusIndicator(Hand!, 50)
	else
		dw_1.SetRowFocusIndicator (hand!,dw_1.x + dw_1.width - p_1.width - 150)
	End If
//picture is row indicator (two cases left and right positions)
//note: p_1 is a hidden picture used to hold the bitmap that will be used as the indicator
//A hidden picture must be used because the SetRowFocusIndicator requires a picture
//to be passed to it.
Elseif rb_pic.checked then
	if rb_left.checked then 
		dw_1.SetRowFocusIndicator(p_1)
	Else
		SetRowFocusIndicator (dw_1,p_1,dw_1.x + dw_1.width - p_1.width - 150)
	End If
End If


dw_1.Setfocus( )
dw_1.ReselectRow(dw_1.GetRow( ))


end subroutine

public subroutine wf_disable_picture_dw ();//disable bitmap

//This will disable the actual datawindow containing the bitmaps
//The text will be grayed so as to visually simulate the dis-enabled datawindow
dw_bitmap.enabled = false
dw_bitmap.Object.bitmapname.color = ' 8421504'  // Gray
end subroutine

event open;call super::open;this.postevent("ue_postopen")

end event

event close;call super::close;//Close script for w_setrowfocus

//w_main.Show( )

end event

on w_setrowfocus.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_bitmap=create dw_bitmap
this.rb_right=create rb_right
this.rb_left=create rb_left
this.rb_none=create rb_none
this.p_1=create p_1
this.cb_close=create cb_close
this.rb_rect=create rb_rect
this.rb_hand=create rb_hand
this.dw_1=create dw_1
this.rb_pic=create rb_pic
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_bitmap
this.Control[iCurrent+3]=this.rb_right
this.Control[iCurrent+4]=this.rb_left
this.Control[iCurrent+5]=this.rb_none
this.Control[iCurrent+6]=this.p_1
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.rb_rect
this.Control[iCurrent+9]=this.rb_hand
this.Control[iCurrent+10]=this.dw_1
this.Control[iCurrent+11]=this.rb_pic
this.Control[iCurrent+12]=this.gb_1
this.Control[iCurrent+13]=this.gb_2
end on

on w_setrowfocus.destroy
call super::destroy
destroy(this.st_1)
destroy(this.dw_bitmap)
destroy(this.rb_right)
destroy(this.rb_left)
destroy(this.rb_none)
destroy(this.p_1)
destroy(this.cb_close)
destroy(this.rb_rect)
destroy(this.rb_hand)
destroy(this.dw_1)
destroy(this.rb_pic)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type st_1 from statictext within w_setrowfocus
integer x = 64
integer y = 28
integer width = 2112
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Try Different Focus Indicators by clicking the radio buttons in the Focus Style Box."
boolean focusrectangle = false
end type

type dw_bitmap from datawindow within w_setrowfocus
integer x = 1609
integer y = 180
integer width = 837
integer height = 180
integer taborder = 40
boolean enabled = false
string dataobject = "d_bitmap_dddw"
boolean border = false
boolean livescroll = true
end type

on itemchanged;string ls_filename


//Get the filename of the bitmap from the dropdown datawindow 
ls_filename = dw_bitmap.GetText( )

//Set a hidden picture to use the bitmap that has been selected
p_1.picturename = ls_filename

//Local window function to change to appropriate indicator
wf_set_row_focus_indicator ()
end on

type rb_right from radiobutton within w_setrowfocus
integer x = 1010
integer y = 364
integer width = 256
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Right"
end type

on clicked;//// If hand or picture is checked, set them to the right

//Local window function to change to appropriate indicator/indicator location
wf_set_row_focus_indicator ()
end on

type rb_left from radiobutton within w_setrowfocus
integer x = 1010
integer y = 276
integer width = 256
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Left"
boolean checked = true
end type

on clicked;////Clicked script for rb_left

//Local window function to change to appropriate indicator/indicator location
wf_set_row_focus_indicator ()
end on

type rb_none from radiobutton within w_setrowfocus
integer x = 128
integer y = 276
integer width = 256
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "None"
end type

on clicked;//Clicked script for rb_none

dw_1.SetRowFocusIndicator(off!)

// Set focus to datawindow & force re-paint of row
dw_1.Setfocus( )
dw_1.ReselectRow(dw_1.GetRow( ))

//disable picture ddlb
wf_disable_picture_dw ( )

//left and right buttons are not applicable to this choice
rb_left.Enabled = False
rb_right.Enabled = False
end on

type p_1 from picture within w_setrowfocus
boolean visible = false
integer x = 2569
integer y = 880
integer width = 151
integer height = 88
string picturename = "indicatr.bmp"
end type

type cb_close from commandbutton within w_setrowfocus
integer x = 2537
integer y = 512
integer width = 311
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;//Clicked script for cb_close

Close(parent)
end on

type rb_rect from radiobutton within w_setrowfocus
integer x = 466
integer y = 276
integer width = 384
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Rectangle"
boolean checked = true
end type

on clicked;//Clicked script for rb_rect

dw_1.SetRowFocusIndicator(FocusRect!)

// Set focus to datawindow & force re-paint of row
dw_1.Setfocus( )
dw_1.ReselectRow(dw_1.GetRow( ))


//disable picture dw
wf_disable_picture_dw ( )

//left and right buttons are not applicable to this choice
rb_left.Enabled = False
rb_right.Enabled = False


end on

type rb_hand from radiobutton within w_setrowfocus
integer x = 128
integer y = 364
integer width = 256
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Hand"
end type

on clicked;////Clicked script for rb_hand
wf_set_row_focus_indicator ()

//disable picture dw
wf_disable_picture_dw ( )

//enable left and right radio buttons for this type of selection
rb_left.Enabled = True
rb_right.Enabled = True
end on

type dw_1 from datawindow within w_setrowfocus
integer x = 37
integer y = 512
integer width = 2418
integer height = 1244
integer taborder = 10
string dataobject = "d_setrowfocus"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type rb_pic from radiobutton within w_setrowfocus
integer x = 466
integer y = 364
integer width = 293
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Picture"
end type

event clicked;////Clicked script for rb_pic

//Local window function to change to appropriate indicator/indicator location
wf_set_row_focus_indicator ( )

//Enable the bitmap selection datawindow 
dw_bitmap.Enabled = True

//The Text must visiually appear enabled because these are elements in a datawindow
dw_bitmap.Object.bitmapname.color = '0'  // Black

//enable left and right radio buttons for this type of selection
rb_left.Enabled = True
rb_right.Enabled = True
end event

type gb_1 from groupbox within w_setrowfocus
integer x = 50
integer y = 180
integer width = 837
integer height = 288
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Focus Indicator Style"
end type

type gb_2 from groupbox within w_setrowfocus
integer x = 960
integer y = 180
integer width = 617
integer height = 288
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Indicator Location"
end type


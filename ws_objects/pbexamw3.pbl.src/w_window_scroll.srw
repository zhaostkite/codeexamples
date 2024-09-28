$PBExportHeader$w_window_scroll.srw
$PBExportComments$Scroll Units Per Line and Scroll Lines Per Page example
forward
global type w_window_scroll from w_center
end type
type cb_apply from commandbutton within w_window_scroll
end type
type st_display from statictext within w_window_scroll
end type
type cb_help from commandbutton within w_window_scroll
end type
type cb_close from commandbutton within w_window_scroll
end type
type em_lines from editmask within w_window_scroll
end type
type em_units from editmask within w_window_scroll
end type
type st_2 from statictext within w_window_scroll
end type
type st_1 from statictext within w_window_scroll
end type
type dw_contacts from datawindow within w_window_scroll
end type
end forward

global type w_window_scroll from w_center
integer x = 233
integer y = 328
integer width = 2574
integer height = 1464
string title = "Window Scrolling"
boolean vscrollbar = true
long backcolor = 74481808
integer unitsperline = 16
integer linesperpage = 10
toolbaralignment toolbaralignment = alignatleft!
cb_apply cb_apply
st_display st_display
cb_help cb_help
cb_close cb_close
em_lines em_lines
em_units em_units
st_2 st_2
st_1 st_1
dw_contacts dw_contacts
end type
global w_window_scroll w_window_scroll

type variables

end variables

event open;call super::open;// initialization

dw_contacts.InsertRow (0)
em_lines.text = '10'
em_units.text = '16'

end event

event close;call super::close;//w_main.Show()
end event

on w_window_scroll.create
int iCurrent
call super::create
this.cb_apply=create cb_apply
this.st_display=create st_display
this.cb_help=create cb_help
this.cb_close=create cb_close
this.em_lines=create em_lines
this.em_units=create em_units
this.st_2=create st_2
this.st_1=create st_1
this.dw_contacts=create dw_contacts
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_apply
this.Control[iCurrent+2]=this.st_display
this.Control[iCurrent+3]=this.cb_help
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.em_lines
this.Control[iCurrent+6]=this.em_units
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.dw_contacts
end on

on w_window_scroll.destroy
call super::destroy
destroy(this.cb_apply)
destroy(this.st_display)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.em_lines)
destroy(this.em_units)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_contacts)
end on

type cb_apply from commandbutton within w_window_scroll
integer x = 2053
integer y = 108
integer width = 265
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Apply"
boolean default = true
end type

type st_display from statictext within w_window_scroll
integer x = 133
integer y = 276
integer width = 247
integer height = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type cb_help from commandbutton within w_window_scroll
integer x = 2053
integer y = 468
integer width = 265
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

on clicked;// show help for this example

f_open_help ('w_window_scroll')
end on

type cb_close from commandbutton within w_window_scroll
integer x = 2053
integer y = 288
integer width = 265
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;close (parent)
end on

type em_lines from editmask within w_window_scroll
integer x = 640
integer y = 108
integer width = 279
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
double increment = 1
string minmax = "0~~"
end type

on modified;// change the window attribute LinesPerPage which specifies the
// number of lines on a page.

parent.LinesPerPage = Integer (this.text)
end on

type em_units from editmask within w_window_scroll
integer x = 1559
integer y = 108
integer width = 279
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
double increment = 1
string minmax = "0~~"
end type

on modified;// change the window attribute UnitsPerLine, which specifies the 
// number of PowerBuilder units to scroll when the arrow of the vertical
// scroll bar is clicked.

parent.UnitsPerLine = Integer (this.text)
end on

type st_2 from statictext within w_window_scroll
integer x = 983
integer y = 116
integer width = 549
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Units per Scroll Line:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_window_scroll
integer x = 32
integer y = 116
integer width = 585
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Scroll Lines Per Page:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_contacts from datawindow within w_window_scroll
integer x = 471
integer y = 332
integer width = 1271
integer height = 2144
integer taborder = 40
string dataobject = "d_contact_long"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


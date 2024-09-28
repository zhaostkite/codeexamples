$PBExportHeader$w_uo_sampler.srw
$PBExportComments$Contains user objects for checking input, date scroller, and a progress indicator.
forward
global type w_uo_sampler from w_center
end type
type cb_help from commandbutton within w_uo_sampler
end type
type st_8 from statictext within w_uo_sampler
end type
type cb_1 from commandbutton within w_uo_sampler
end type
type cb_close from commandbutton within w_uo_sampler
end type
type st_overtype from statictext within w_uo_sampler
end type
type sle_overtype from u_overtype_edit within w_uo_sampler
end type
type uo_progress_bar from u_progress_bar within w_uo_sampler
end type
type uo_date_scroller from u_date_scroller within w_uo_sampler
end type
type st_5 from statictext within w_uo_sampler
end type
type uo_range_checker from u_range_checker within w_uo_sampler
end type
type sle_from from singlelineedit within w_uo_sampler
end type
type sle_to from singlelineedit within w_uo_sampler
end type
type st_3 from statictext within w_uo_sampler
end type
type st_2 from statictext within w_uo_sampler
end type
type st_1 from statictext within w_uo_sampler
end type
type st_6 from statictext within w_uo_sampler
end type
type uo_3 from u_numeric_edit within w_uo_sampler
end type
type uo_2 from u_date_edit within w_uo_sampler
end type
type st_7 from statictext within w_uo_sampler
end type
end forward

global type w_uo_sampler from w_center
integer x = 192
integer y = 376
integer width = 3086
integer height = 1228
string title = "User Object Examples"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_help cb_help
st_8 st_8
cb_1 cb_1
cb_close cb_close
st_overtype st_overtype
sle_overtype sle_overtype
uo_progress_bar uo_progress_bar
uo_date_scroller uo_date_scroller
st_5 st_5
uo_range_checker uo_range_checker
sle_from sle_from
sle_to sle_to
st_3 st_3
st_2 st_2
st_1 st_1
st_6 st_6
uo_3 uo_3
uo_2 uo_2
st_7 st_7
end type
global w_uo_sampler w_uo_sampler

type variables
dec {2}  ic_pct_complete

end variables

on timer;//////////////////////////////////////////////////////////////////////
// Update the progress meter each time the timer event is triggered.
// When the progress meter is at 100%, stop triggering the timer evetn.
//////////////////////////////////////////////////////////////////////

ic_pct_complete = ic_pct_complete + 10
uo_progress_bar.uf_set_position (ic_pct_complete)

if ic_pct_complete >= 100.0  then 
	Timer (0)
	Beep (1)
end if
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////
// Initialize date scroller to today
//////////////////////////////////////////////////////////////////////
uo_date_scroller.uf_set_date (Today())


//////////////////////////////////////////////////////////////////////
// Initialize range checker default values
//////////////////////////////////////////////////////////////////////
uo_range_checker.uf_set_range (Long (sle_from.text), Long (sle_to.text))

//////////////////////////////////////////////////////////////////////
// Overtype mode example only works on Windows
//////////////////////////////////////////////////////////////////////
If (ge_Environment.OSType <> windows!) And (ge_Environment.OSType <> windowsnt!) Then
	st_overtype.Visible = False
	sle_overtype.Visible = False
End If

end event

event close;call super::close;//w_main.Show()
end event

on w_uo_sampler.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.st_8=create st_8
this.cb_1=create cb_1
this.cb_close=create cb_close
this.st_overtype=create st_overtype
this.sle_overtype=create sle_overtype
this.uo_progress_bar=create uo_progress_bar
this.uo_date_scroller=create uo_date_scroller
this.st_5=create st_5
this.uo_range_checker=create uo_range_checker
this.sle_from=create sle_from
this.sle_to=create sle_to
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_6=create st_6
this.uo_3=create uo_3
this.uo_2=create uo_2
this.st_7=create st_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.st_8
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.st_overtype
this.Control[iCurrent+6]=this.sle_overtype
this.Control[iCurrent+7]=this.uo_progress_bar
this.Control[iCurrent+8]=this.uo_date_scroller
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.uo_range_checker
this.Control[iCurrent+11]=this.sle_from
this.Control[iCurrent+12]=this.sle_to
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.st_6
this.Control[iCurrent+17]=this.uo_3
this.Control[iCurrent+18]=this.uo_2
this.Control[iCurrent+19]=this.st_7
end on

on w_uo_sampler.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.st_8)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.st_overtype)
destroy(this.sle_overtype)
destroy(this.uo_progress_bar)
destroy(this.uo_date_scroller)
destroy(this.st_5)
destroy(this.uo_range_checker)
destroy(this.sle_from)
destroy(this.sle_to)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_6)
destroy(this.uo_3)
destroy(this.uo_2)
destroy(this.st_7)
end on

type cb_help from commandbutton within w_uo_sampler
integer x = 2633
integer y = 180
integer width = 357
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

on clicked;f_open_help (parent.ClassName())
end on

type st_8 from statictext within w_uo_sampler
integer x = 613
integer y = 964
integer width = 635
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Percent Complete:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_uo_sampler
integer x = 41
integer y = 944
integer width = 549
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Progress Meter"
end type

on clicked;//////////////////////////////////////////////////////////////////////
// Start the progress meter by setting the timer event on the window
//////////////////////////////////////////////////////////////////////

ic_pct_complete = 0.0
uo_progress_bar.uf_set_position (ic_pct_complete)

Timer (0.7)


end on

type cb_close from commandbutton within w_uo_sampler
integer x = 2633
integer y = 40
integer width = 357
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;close (parent)
end on

type st_overtype from statictext within w_uo_sampler
integer y = 364
integer width = 782
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Overtype Mode SLE:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_overtype from u_overtype_edit within w_uo_sampler
integer x = 809
integer y = 356
integer height = 88
integer taborder = 30
integer textsize = -10
fontcharset fontcharset = ansi!
long textcolor = 41943040
long backcolor = 1086902488
end type

type uo_progress_bar from u_progress_bar within w_uo_sampler
integer x = 1275
integer y = 964
integer width = 1349
integer height = 80
end type

on uo_progress_bar.destroy
call u_progress_bar::destroy
end on

type uo_date_scroller from u_date_scroller within w_uo_sampler
integer x = 795
integer y = 636
integer width = 475
integer height = 140
integer taborder = 70
long backcolor = 74481808
end type

on uo_date_scroller.destroy
call u_date_scroller::destroy
end on

type st_5 from statictext within w_uo_sampler
integer y = 672
integer width = 782
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Date Scroller:"
alignment alignment = right!
boolean focusrectangle = false
end type

type uo_range_checker from u_range_checker within w_uo_sampler
integer x = 809
integer y = 504
integer width = 754
integer height = 88
integer taborder = 40
integer textsize = -10
fontcharset fontcharset = ansi!
long textcolor = 41943040
long backcolor = 1086902488
end type

on uo_range_checker.destroy
call u_range_checker::destroy
end on

type sle_from from singlelineedit within w_uo_sampler
integer x = 1792
integer y = 504
integer width = 311
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
long textcolor = 41943040
string text = "0"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on modified;//////////////////////////////////////////////////////////////////////
// Call user object function to set the lower and upper range limits.
//////////////////////////////////////////////////////////////////////

uo_range_checker.uf_set_range (Long (sle_from.text), Long (sle_to.text))
end on

type sle_to from singlelineedit within w_uo_sampler
integer x = 2277
integer y = 504
integer width = 311
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
long textcolor = 41943040
string text = "100"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on modified;//////////////////////////////////////////////////////////////////////
// Call user object function to set the lower and upper range limits.
//////////////////////////////////////////////////////////////////////

uo_range_checker.uf_set_range (Long (sle_from.text), Long (sle_to.text))
end on

type st_3 from statictext within w_uo_sampler
integer y = 224
integer width = 782
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Enter a valid numeric:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_uo_sampler
integer y = 84
integer width = 782
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Enter a valid Friday:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_uo_sampler
integer y = 520
integer width = 782
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Numeric Range Checker:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_uo_sampler
integer x = 1591
integer y = 508
integer width = 187
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "From:"
alignment alignment = right!
boolean focusrectangle = false
end type

type uo_3 from u_numeric_edit within w_uo_sampler
integer x = 791
integer y = 192
integer width = 754
integer height = 124
integer taborder = 20
long backcolor = 74481808
end type

on uo_3.destroy
call u_numeric_edit::destroy
end on

type uo_2 from u_date_edit within w_uo_sampler
integer x = 791
integer y = 52
integer width = 754
integer height = 124
integer taborder = 10
long backcolor = 74481808
end type

on uo_2.destroy
call u_date_edit::destroy
end on

type st_7 from statictext within w_uo_sampler
integer x = 2107
integer y = 508
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "To:"
alignment alignment = right!
boolean focusrectangle = false
end type


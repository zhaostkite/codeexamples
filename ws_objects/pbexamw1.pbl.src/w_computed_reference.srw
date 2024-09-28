$PBExportHeader$w_computed_reference.srw
$PBExportComments$Contains a DataWindow with computed fields that reference other computed fields.
forward
global type w_computed_reference from w_center
end type
type st_2 from statictext within w_computed_reference
end type
type st_1 from statictext within w_computed_reference
end type
type mle_help from multilineedit within w_computed_reference
end type
type cb_print_setup from commandbutton within w_computed_reference
end type
type cb_close from commandbutton within w_computed_reference
end type
type cb_print from commandbutton within w_computed_reference
end type
type dw_1 from datawindow within w_computed_reference
end type
end forward

global type w_computed_reference from w_center
integer x = 69
integer y = 32
integer width = 2793
integer height = 1868
string title = "Referencing Computed Fields in Other Computed Fields"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
st_2 st_2
st_1 st_1
mle_help mle_help
cb_print_setup cb_print_setup
cb_close cb_close
cb_print cb_print
dw_1 dw_1
end type
global w_computed_reference w_computed_reference

on ue_postopen;dw_1.SetTransObject (sqlca)
dw_1.Retrieve()
end on

event close;call super::close;//w_main.Show()
end event

event open;call super::open;this.postevent("ue_postopen")
end event

on w_computed_reference.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_1=create st_1
this.mle_help=create mle_help
this.cb_print_setup=create cb_print_setup
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.mle_help
this.Control[iCurrent+4]=this.cb_print_setup
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.dw_1
end on

on w_computed_reference.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_help)
destroy(this.cb_print_setup)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_1)
end on

type st_2 from statictext within w_computed_reference
integer x = 2103
integer y = 24
integer width = 150
integer height = 72
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "label."
boolean focusrectangle = false
end type

type st_1 from statictext within w_computed_reference
integer x = 1970
integer y = 24
integer width = 130
integer height = 72
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 74481808
boolean enabled = false
string text = "blue"
boolean focusrectangle = false
end type

type mle_help from multilineedit within w_computed_reference
integer x = 23
integer y = 24
integer width = 1934
integer height = 88
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Computed fields that reference other computed fields are indicated with a"
boolean border = false
boolean displayonly = true
end type

type cb_print_setup from commandbutton within w_computed_reference
integer x = 1111
integer y = 1604
integer width = 407
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Printer &Setup"
end type

on clicked;if PrintSetup() = -1 then
	MessageBox ("Printer Setup Error", "An error has occured for Printer Setup", exclamation!)
end if
end on

type cb_close from commandbutton within w_computed_reference
integer x = 1559
integer y = 1604
integer width = 224
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;Close (parent)
end on

type cb_print from commandbutton within w_computed_reference
integer x = 855
integer y = 1604
integer width = 224
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

on clicked;dw_1.Print()
end on

type dw_1 from datawindow within w_computed_reference
integer x = 23
integer y = 148
integer width = 2711
integer height = 1380
integer taborder = 10
string dataobject = "d_dept_emp_stats"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


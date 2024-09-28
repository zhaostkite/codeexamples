$PBExportHeader$w_print_examples.srw
$PBExportComments$Show use of the print object and print screen functions.
forward
global type w_print_examples from w_center
end type
type cb_window2 from commandbutton within w_print_examples
end type
type cb_help from commandbutton within w_print_examples
end type
type st_y_text from statictext within w_print_examples
end type
type st_x_text from statictext within w_print_examples
end type
type em_y from editmask within w_print_examples
end type
type em_x from editmask within w_print_examples
end type
type cb_window from commandbutton within w_print_examples
end type
type cb_close from commandbutton within w_print_examples
end type
type cb_printobject from commandbutton within w_print_examples
end type
type lb_controls from listbox within w_print_examples
end type
type st_height from statictext within w_print_examples
end type
type em_height from editmask within w_print_examples
end type
type st_width from statictext within w_print_examples
end type
type em_width from editmask within w_print_examples
end type
type cb_setup from commandbutton within w_print_examples
end type
type st_bitmap_text from statictext within w_print_examples
end type
type p_bitmap from picture within w_print_examples
end type
type cb_printscreen from commandbutton within w_print_examples
end type
type gb_object_group from groupbox within w_print_examples
end type
type gb_size from groupbox within w_print_examples
end type
end forward

global type w_print_examples from w_center
integer x = 393
integer y = 92
integer width = 2121
integer height = 1748
string title = "Print Examples"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_window2 cb_window2
cb_help cb_help
st_y_text st_y_text
st_x_text st_x_text
em_y em_y
em_x em_x
cb_window cb_window
cb_close cb_close
cb_printobject cb_printobject
lb_controls lb_controls
st_height st_height
em_height em_height
st_width st_width
em_width em_width
cb_setup cb_setup
st_bitmap_text st_bitmap_text
p_bitmap p_bitmap
cb_printscreen cb_printscreen
gb_object_group gb_object_group
gb_size gb_size
end type
global w_print_examples w_print_examples

type prototypes

end prototypes

event close;call super::close;//show the main menu again
//show(w_main)
end event

event open;call super::open;int	li_index

//Load the list box with names of all the objects on the window
for li_index = 1 to UpperBound(control[])
	lb_controls.insertitem(control[li_index].ClassName(),li_index)
Next
end event

on w_print_examples.create
int iCurrent
call super::create
this.cb_window2=create cb_window2
this.cb_help=create cb_help
this.st_y_text=create st_y_text
this.st_x_text=create st_x_text
this.em_y=create em_y
this.em_x=create em_x
this.cb_window=create cb_window
this.cb_close=create cb_close
this.cb_printobject=create cb_printobject
this.lb_controls=create lb_controls
this.st_height=create st_height
this.em_height=create em_height
this.st_width=create st_width
this.em_width=create em_width
this.cb_setup=create cb_setup
this.st_bitmap_text=create st_bitmap_text
this.p_bitmap=create p_bitmap
this.cb_printscreen=create cb_printscreen
this.gb_object_group=create gb_object_group
this.gb_size=create gb_size
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_window2
this.Control[iCurrent+2]=this.cb_help
this.Control[iCurrent+3]=this.st_y_text
this.Control[iCurrent+4]=this.st_x_text
this.Control[iCurrent+5]=this.em_y
this.Control[iCurrent+6]=this.em_x
this.Control[iCurrent+7]=this.cb_window
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.cb_printobject
this.Control[iCurrent+10]=this.lb_controls
this.Control[iCurrent+11]=this.st_height
this.Control[iCurrent+12]=this.em_height
this.Control[iCurrent+13]=this.st_width
this.Control[iCurrent+14]=this.em_width
this.Control[iCurrent+15]=this.cb_setup
this.Control[iCurrent+16]=this.st_bitmap_text
this.Control[iCurrent+17]=this.p_bitmap
this.Control[iCurrent+18]=this.cb_printscreen
this.Control[iCurrent+19]=this.gb_object_group
this.Control[iCurrent+20]=this.gb_size
end on

on w_print_examples.destroy
call super::destroy
destroy(this.cb_window2)
destroy(this.cb_help)
destroy(this.st_y_text)
destroy(this.st_x_text)
destroy(this.em_y)
destroy(this.em_x)
destroy(this.cb_window)
destroy(this.cb_close)
destroy(this.cb_printobject)
destroy(this.lb_controls)
destroy(this.st_height)
destroy(this.em_height)
destroy(this.st_width)
destroy(this.em_width)
destroy(this.cb_setup)
destroy(this.st_bitmap_text)
destroy(this.p_bitmap)
destroy(this.cb_printscreen)
destroy(this.gb_object_group)
destroy(this.gb_size)
end on

type cb_window2 from commandbutton within w_print_examples
event clicked pbm_bnclicked
integer x = 1618
integer y = 996
integer width = 402
integer height = 96
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print &Window"
end type

event clicked;// Script for printing a window

longptr ll_Job

SetPointer(Hourglass!)

// Open a print job and give it a title
ll_Job = PrintOpen()
If ll_Job = -1 Then
	Messagebox("Print Job Open Error","Could not open a print job. Check printer " + &
	"setting and Print Manager")
	Return
End If

SetPointer(Hourglass!)

// Prints the window image at the location specified by x and y and in the size specified by 
// width and height. If you do not specify the width and height PowerBuilder uses the original 
// size of the object
//parent.Print(ll_Job, 10, 10)
parent.Print(ll_Job, Integer(em_x.Text), Integer(em_y.Text) )
// Close the print job which will send the data to the printer
PrintClose(ll_Job)

end event

type cb_help from commandbutton within w_print_examples
integer x = 1623
integer y = 1504
integer width = 402
integer height = 96
integer taborder = 120
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

event clicked;f_open_help(Parent.ClassName( ))
end event

type st_y_text from statictext within w_print_examples
integer x = 978
integer y = 1008
integer width = 265
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Y Position"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_x_text from statictext within w_print_examples
integer x = 978
integer y = 892
integer width = 265
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "X position"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_y from editmask within w_print_examples
integer x = 1257
integer y = 996
integer width = 311
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
string text = "10"
borderstyle borderstyle = stylelowered!
string mask = "###,###."
boolean spin = true
double increment = 100
string minmax = "1~~8500"
end type

type em_x from editmask within w_print_examples
integer x = 1257
integer y = 880
integer width = 311
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
string text = "10"
borderstyle borderstyle = stylelowered!
string mask = "###,###."
boolean spin = true
double increment = 100
string minmax = "1~~11000"
end type

type cb_window from commandbutton within w_print_examples
integer x = 1623
integer y = 720
integer width = 402
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print &Window"
end type

event clicked;// Script for printing a window

longptr ll_Job

SetPointer(Hourglass!)

// Open a print job and give it a title
ll_Job = PrintOpen("Print Window Example")
If ll_Job = -1 Then
	Messagebox("Print Job Open Error","Could not open a print job. Check printer " + &
	"setting and Print Manager")
	Return
End If

SetPointer(Hourglass!)

// Prints the window image at the location specified by x and y and in the size specified by 
// width and height. If you do not specify the width and height PowerBuilder uses the original 
// size of the object
Parent.Print (ll_Job, Integer(em_x.Text), Integer(em_y.Text), &
		Integer(em_width.Text), Integer(em_height.Text))

// Close the print job which will send the data to the printer
PrintClose(ll_Job)

end event

type cb_close from commandbutton within w_print_examples
integer x = 1623
integer y = 1372
integer width = 402
integer height = 96
integer taborder = 110
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;//Close Script

Close(Parent)
end event

type cb_printobject from commandbutton within w_print_examples
integer x = 1623
integer y = 112
integer width = 402
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print &Objects"
end type

event clicked;Integer	li_Index, li_Index2, li_State, li_NumObjects, li_PrintCount, li_Pos
longptr		ll_Job
String	ls_ControlName[ ], ls_Header
DragObject ldo_Object

SetPointer(Hourglass!)

// Open a print job and give it a title
ll_Job = PrintOpen("Print Object Example")
If ll_Job = -1 Then
	Messagebox("Print Job Open Error","Could not open a print job. Check printer " + &
	"setting and Print Manager")
	Return
End If

li_NumObjects = Upperbound(Control[])

// Find selected object in lisbox
For li_Index = 1 To li_NumObjects
	li_State = lb_controls.State(li_Index)
	If li_State = 1 Then 
		For li_Index2 = 1 To li_NumObjects
			If Control[li_Index2].ClassName() = lb_Controls.Text(li_Index) Then
				ldo_Object = Control[li_index2]
				ls_Header = "Object:  " + ldo_Object.ClassName() + "    Width = " + &
								String(ldo_Object.Width) + "    Height = " + String(ldo_Object.Height)
				
				PrintText(ll_Job, ls_Header, 10, li_Pos)
				ldo_Object.Print (ll_Job, 10, li_Pos + 130)
				
				li_Pos = li_Pos + 2000
				li_PrintCount ++
				If li_PrintCount = 5 Then
					PrintPage(ll_Job)
					li_PrintCount = 1
					li_Pos = 0
				End If
			End If
		Next
	End If
Next


// Close print job
PrintClose (ll_Job)

end event

type lb_controls from listbox within w_print_examples
integer x = 1015
integer y = 108
integer width = 594
integer height = 312
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean vscrollbar = true
boolean multiselect = true
borderstyle borderstyle = stylelowered!
end type

type st_height from statictext within w_print_examples
integer x = 1065
integer y = 716
integer width = 178
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Height"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_height from editmask within w_print_examples
integer x = 1257
integer y = 704
integer width = 311
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
string text = "5000"
borderstyle borderstyle = stylelowered!
string mask = "###,###."
boolean spin = true
double increment = 100
string minmax = "01~~11000"
end type

type st_width from statictext within w_print_examples
integer x = 1079
integer y = 608
integer width = 165
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Width"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_width from editmask within w_print_examples
integer x = 1257
integer y = 588
integer width = 311
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
string text = "8000"
borderstyle borderstyle = stylelowered!
string mask = "###,###."
boolean spin = true
double increment = 100
string minmax = "1~~11000"
end type

type cb_setup from commandbutton within w_print_examples
integer x = 1623
integer y = 1240
integer width = 402
integer height = 96
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Printer Setup"
end type

event clicked;PrintSetup()

end event

type st_bitmap_text from statictext within w_print_examples
integer x = 69
integer y = 88
integer width = 599
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "This is a bitmap below:"
boolean focusrectangle = false
end type

type p_bitmap from picture within w_print_examples
integer x = 64
integer y = 172
integer width = 837
integer height = 736
string picturename = "greycol2.bmp"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_printscreen from commandbutton within w_print_examples
integer x = 1623
integer y = 588
integer width = 402
integer height = 96
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print &Screen"
end type

event clicked;// Script for printing a screen

longptr	ll_Job

SetPointer(Hourglass!)

// Open a print job and give it a title
ll_Job = PrintOpen("Print Screen Example")
If ll_Job = -1 Then
	Messagebox("Print Job Open Error","Could not open a print job. Check printer " + &
	"setting and Print Manager")
	Return
End If

SetPointer(Hourglass!)

// Prints the screen image at the location specified by x and y and in the size specified by 
// width and height. If you do not specify the width and height, PowerBuilder uses the original 
// size of the screen.
PrintScreen(ll_Job, Integer(em_x.Text), Integer(em_y.Text), &
		Integer(em_width.Text), Integer(em_height.Text))

// Close the print job which will send the data to the printer
PrintClose(ll_Job)

end event

type gb_object_group from groupbox within w_print_examples
integer x = 951
integer y = 48
integer width = 1097
integer height = 392
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Select Objects to Print"
end type

type gb_size from groupbox within w_print_examples
integer x = 951
integer y = 488
integer width = 1097
integer height = 716
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Select Sizes in 1/1000~""
end type


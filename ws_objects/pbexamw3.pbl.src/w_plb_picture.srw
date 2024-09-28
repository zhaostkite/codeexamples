$PBExportHeader$w_plb_picture.srw
$PBExportComments$Window to display a picture object
forward
global type w_plb_picture from w_center
end type
type rb_sizetofit from radiobutton within w_plb_picture
end type
type rb_original from radiobutton within w_plb_picture
end type
type p_display from picture within w_plb_picture
end type
type cb_close from commandbutton within w_plb_picture
end type
type gb_1 from groupbox within w_plb_picture
end type
end forward

global type w_plb_picture from w_center
integer x = 5
integer y = 4
integer width = 1317
integer height = 1144
string title = "Picture Zoom"
long backcolor = 74481808
rb_sizetofit rb_sizetofit
rb_original rb_original
p_display p_display
cb_close cb_close
gb_1 gb_1
end type
global w_plb_picture w_plb_picture

type variables
Double	idb_Ratio
end variables

forward prototypes
public subroutine of_resizepicture (integer ai_newwidth, integer ai_newheight)
end prototypes

public subroutine of_resizepicture (integer ai_newwidth, integer ai_newheight);p_display.Height = This.Height - (p_display.Y + 100)
p_display.Width = p_display.Height * idb_Ratio

If This.WindowState <> Maximized! And &
	This.Width < (p_display.Width + 60) Then
	This.Width = p_display.Width + 60
End If

end subroutine

event open;call super::open;f_Center ( )
p_display.PictureName = Message.StringParm
p_display.OriginalSize = True

idb_Ratio = Double(p_display.Width) / Double(p_display.Height)

If This.Width < (p_display.Width + 60) Then
	This.Width = p_display.Width + 60
End If

If This.Height < (p_display.Y + p_display.Height + 100) Then
	This.Height = p_display.Y + p_display.Height + 100
End If

end event

on w_plb_picture.create
int iCurrent
call super::create
this.rb_sizetofit=create rb_sizetofit
this.rb_original=create rb_original
this.p_display=create p_display
this.cb_close=create cb_close
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_sizetofit
this.Control[iCurrent+2]=this.rb_original
this.Control[iCurrent+3]=this.p_display
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.gb_1
end on

on w_plb_picture.destroy
call super::destroy
destroy(this.rb_sizetofit)
destroy(this.rb_original)
destroy(this.p_display)
destroy(this.cb_close)
destroy(this.gb_1)
end on

event resize;If rb_sizetofit.Checked Then
	of_resizepicture(newwidth, newheight)
End If

end event

type rb_sizetofit from radiobutton within w_plb_picture
integer x = 50
integer y = 188
integer width = 590
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Size to Fit"
end type

event clicked;p_display.OriginalSize = False
of_resizepicture(Parent.Width, Parent.Height)

end event

type rb_original from radiobutton within w_plb_picture
integer x = 50
integer y = 92
integer width = 590
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Original"
boolean checked = true
end type

event clicked;p_display.OriginalSize = True

end event

type p_display from picture within w_plb_picture
integer x = 14
integer y = 356
integer width = 133
integer height = 124
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_plb_picture
integer x = 800
integer y = 24
integer width = 366
integer height = 108
integer taborder = 1
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean default = true
end type

event clicked;Close(Parent)

end event

type gb_1 from groupbox within w_plb_picture
integer x = 14
integer width = 699
integer height = 324
integer taborder = 2
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
string text = "Picture Size"
end type


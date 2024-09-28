$PBExportHeader$w_meaning.srw
$PBExportComments$The meaning of life
forward
global type w_meaning from w_center
end type
type cb_move from picturebutton within w_meaning
end type
type cb_quit from commandbutton within w_meaning
end type
end forward

global type w_meaning from w_center
integer x = 5
integer y = 4
integer width = 1477
integer height = 1148
string title = "The Meaning of Life"
windowtype windowtype = response!
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_move cb_move
cb_quit cb_quit
end type
global w_meaning w_meaning

type variables
integer ii_cb_width,ii_cb_height,ii_win_height,ii_win_width
end variables

on w_meaning.create
int iCurrent
call super::create
this.cb_move=create cb_move
this.cb_quit=create cb_quit
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_move
this.Control[iCurrent+2]=this.cb_quit
end on

on w_meaning.destroy
call super::destroy
destroy(this.cb_move)
destroy(this.cb_quit)
end on

event mousemove;Integer	 	li_PX, li_PY, li_NX, li_NY, li_Top, li_Bottom, li_Left, li_Right
Boolean		lb_Vert, lb_Horiz

li_PX = This.PointerX()
li_PY = This.PointerY()

li_NX = cb_move.x
li_NY = cb_move.y
lb_Vert = (li_PY > (li_NY - 30)) And (li_PY < (li_NY + ii_cb_height + 30))
lb_Horiz = (li_PX > (li_NX - 30)) And (li_PX < (li_NX + ii_cb_width + 30))

If lb_Vert And  lb_Horiz Then	// it's inside so move it
	li_Top = li_PY - (li_NY - 30)
	li_Bottom = (li_NY + ii_cb_height + 30) - li_PY
	li_Left = li_PX - (li_NX - 30)
	li_Right =  (li_NX + ii_cb_width + 30) - li_PX
	
	// Determine which is closer
	If min(li_Top,li_Bottom) < min(li_Left,li_Right) Then
		If li_Top > li_Bottom Then
			li_NY = li_PY - (ii_cb_height  + 30)
		Else
			li_NY = li_PY + 30
		End If
	Else
		If li_Right < li_Left Then
			li_NX = li_PX - (ii_cb_width  + 30)
		Else
			li_NX = li_PX + 30
		End If
	End If
	
	// If this would move it off the window, then wrap it to the other side
	If li_NY < 0 Then 	li_NY = ii_win_height - (30+ ii_cb_height)
	If li_NX < 0 Then 	li_NX = ii_win_width - (30+ ii_cb_width)
	If li_NY+ii_cb_height >= ii_win_height Then li_NY = 30
	If li_NX+ii_cb_width >= ii_win_width Then li_NX = 30
	cb_move.Move(li_NX,li_NY)
End If

end event

event close;Show(w_main)

end event

event resize;// Remember the initial sizes of the button and window
ii_cb_height = cb_move.Height 
ii_cb_width = cb_move.Width
ii_win_height = This.WorkSpaceHeight()
ii_win_width = This.WorkSpaceWidth()

// Center the cb_move button in the window
cb_move.Move(((ii_win_width - ii_cb_width) / 2), ((ii_win_height - ii_cb_height) / 2))

// Center the cb_quit button at the bottom of the window
cb_quit.Move(((ii_win_width - cb_quit.Width) / 2), (ii_win_height - (cb_quit.Height + 20)))

end event

type cb_move from picturebutton within w_meaning
event mousemove pbm_mousemove
integer x = 407
integer y = 296
integer width = 453
integer height = 288
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Click Here For The Meaning Of Life"
vtextalign vtextalign = multiline!
end type

event mousemove;parent.postevent('mousemove')
end event

event clicked;Messagebox("The meaning of life", "Don't forget about the tab key!")
Close(Parent)

end event

type cb_quit from commandbutton within w_meaning
integer x = 402
integer y = 820
integer width = 457
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Quit"
boolean cancel = true
boolean default = true
end type

event clicked;Close(Parent)

end event


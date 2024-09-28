$PBExportHeader$w_pipe_status.srw
$PBExportComments$The pipeline status box
forward
global type w_pipe_status from w_center
end type
type st_msg from statictext within w_pipe_status
end type
end forward

global type w_pipe_status from w_center
integer x = 677
integer y = 268
integer width = 1486
integer height = 428
string title = "Data Pipeline Status"
windowtype windowtype = popup!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_msg st_msg
end type
global w_pipe_status w_pipe_status

event open;string ls_msg
f_Center ( )
ls_msg = message.stringparm

If len(ls_msg) > 0 Then 
	st_msg.text = ls_msg
End If


end event

on w_pipe_status.create
int iCurrent
call super::create
this.st_msg=create st_msg
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_msg
end on

on w_pipe_status.destroy
call super::destroy
destroy(this.st_msg)
end on

type st_msg from statictext within w_pipe_status
integer x = 23
integer y = 104
integer width = 1413
integer height = 104
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "none"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type


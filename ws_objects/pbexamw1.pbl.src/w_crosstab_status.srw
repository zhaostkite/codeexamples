$PBExportHeader$w_crosstab_status.srw
$PBExportComments$Status box to show status of the crosstab loading
forward
global type w_crosstab_status from w_center
end type
type lb_status from listbox within w_crosstab_status
end type
end forward

global type w_crosstab_status from w_center
integer x = 677
integer y = 268
integer width = 1358
integer height = 712
string title = "Crosstab Status"
windowtype windowtype = popup!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_additem pbm_custom01
lb_status lb_status
end type
global w_crosstab_status w_crosstab_status

on ue_additem;string ls_item

ls_item = string(message.wordparm)
lb_status.additem(ls_item)
end on

on w_crosstab_status.create
int iCurrent
call super::create
this.lb_status=create lb_status
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_status
end on

on w_crosstab_status.destroy
call super::destroy
destroy(this.lb_status)
end on

type lb_status from listbox within w_crosstab_status
integer x = 69
integer y = 64
integer width = 1161
integer height = 472
integer taborder = 1
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 41943040
boolean sorted = false
string item[] = {"1.  Retrieving Data"}
borderstyle borderstyle = stylelowered!
end type


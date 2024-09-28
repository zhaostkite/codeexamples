$PBExportHeader$w_graph_dynamic_series.srw
$PBExportComments$Example showing dynamically adding a series to a graph
forward
global type w_graph_dynamic_series from w_center
end type
type cb_help from commandbutton within w_graph_dynamic_series
end type
type cb_close from commandbutton within w_graph_dynamic_series
end type
type cb_mod from commandbutton within w_graph_dynamic_series
end type
type dw_1 from datawindow within w_graph_dynamic_series
end type
end forward

global type w_graph_dynamic_series from w_center
integer x = 78
integer y = 188
integer width = 3022
integer height = 1544
string title = "Graph Dynamic Series"
long backcolor = 79741120
toolbaralignment toolbaralignment = alignatleft!
cb_help cb_help
cb_close cb_close
cb_mod cb_mod
dw_1 dw_1
end type
global w_graph_dynamic_series w_graph_dynamic_series

event open;call super::open;dw_1.SetTransObject(sqlca)
dw_1.Retrieve()

end event

on w_graph_dynamic_series.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.cb_close=create cb_close
this.cb_mod=create cb_mod
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_mod
this.Control[iCurrent+4]=this.dw_1
end on

on w_graph_dynamic_series.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.cb_mod)
destroy(this.dw_1)
end on

event close;call super::close;//Show(w_main)

end event

type cb_help from commandbutton within w_graph_dynamic_series
integer x = 2395
integer y = 232
integer width = 507
integer height = 120
integer taborder = 4
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Help"
end type

event clicked;f_open_help ("w_graph_dynamic_series")

end event

type cb_close from commandbutton within w_graph_dynamic_series
integer x = 2395
integer y = 408
integer width = 507
integer height = 120
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_mod from commandbutton within w_graph_dynamic_series
integer x = 2395
integer y = 56
integer width = 507
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Series"
end type

event clicked;If This.Text = "Add Series" Then
	// add the series to the graph
	dw_1.Modify("gr_1.series = 'quarter' ")
	This.Text = "Remove Series"

Else
	// remove series from graph
	dw_1.Modify("gr_1.series = '~"noseries ~" ' ")
	This.Text = "Add Series"
End If

end event

type dw_1 from datawindow within w_graph_dynamic_series
integer x = 9
integer y = 20
integer width = 2286
integer height = 1400
integer taborder = 20
string dataobject = "d_graph_dynamic_series"
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type


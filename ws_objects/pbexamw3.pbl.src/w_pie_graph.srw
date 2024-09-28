$PBExportHeader$w_pie_graph.srw
$PBExportComments$Will retrieve data into a DataWindow that contains an enhanched PieGraph. The graph can be rotated in a presentation style.
forward
global type w_pie_graph from w_center
end type
type st_2 from statictext within w_pie_graph
end type
type st_1 from statictext within w_pie_graph
end type
type cb_present from commandbutton within w_pie_graph
end type
type cb_print from commandbutton within w_pie_graph
end type
type cb_close from commandbutton within w_pie_graph
end type
type dw_1 from datawindow within w_pie_graph
end type
end forward

global type w_pie_graph from w_center
integer x = 169
integer y = 132
integer width = 2583
integer height = 1668
string title = "Enhanced Pie Graph"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_2 st_2
st_1 st_1
cb_present cb_present
cb_print cb_print
cb_close cb_close
dw_1 dw_1
end type
global w_pie_graph w_pie_graph

type variables
int ii_explode_percent
int ii_rotation
int ii_rotate_incr = 10
int ii_direction
boolean ib_rotate 
end variables

on timer;//Timer event for the "presentation mode"
//Presentation mode just give an example of what you can do
//to spice you graphs with a little movement to make them more
//exciting and maybe keep the interest of the audicence.

 //exploding...
//After explostin hits a certain point, chage direction of explosing
	dw_1.SetDataPieExplode("gr_1",1,1,ii_explode_percent)
	ii_explode_percent = ii_explode_percent + 10 * ii_direction
	If ii_explode_percent = 40 Then ii_direction = ii_direction * -1
	If ii_explode_percent = 0 Then  ii_direction = ii_direction * -1






end on

event open;call super::open;dw_1.settransobject(sqlca)
dw_1.retrieve()

end event

event close;call super::close;//Close script 


//w_main.Show( )

end event

on w_pie_graph.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_1=create st_1
this.cb_present=create cb_present
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_present
this.Control[iCurrent+4]=this.cb_print
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.dw_1
end on

on w_pie_graph.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_present)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type st_2 from statictext within w_pie_graph
integer x = 64
integer y = 68
integer width = 1285
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Click Start Presentation to animate the pie graph."
boolean focusrectangle = false
end type

type st_1 from statictext within w_pie_graph
integer x = 64
integer y = 4
integer width = 2277
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Double Click on a pie graph slice to explode it or change the slice~'s explode percentage."
boolean focusrectangle = false
end type

type cb_present from commandbutton within w_pie_graph
integer x = 201
integer y = 1392
integer width = 777
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Start Presentation Example"
end type

event clicked;string ls_rotation

ls_rotation = dw_1.Object.gr_1.rotation

ii_explode_percent = 0
ib_rotate = false
ii_direction = 1
ii_rotation = Integer(ls_rotation)

//ii_rotation = Integer(dw_1.describe("gr_1.rotation"))

If left(this.text,6) = "&Start" Then
	this.text = "&Stop Presentation Example"
	Timer (.035)
Else
	this.text = "&Start Presentation Example"
	Timer (0)
End If
end event

type cb_print from commandbutton within w_pie_graph
integer x = 1079
integer y = 1392
integer width = 279
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

on clicked;//print datawindow
dw_1.print() 
end on

type cb_close from commandbutton within w_pie_graph
integer x = 1431
integer y = 1392
integer width = 279
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;Close(parent)
end on

type dw_1 from datawindow within w_pie_graph
integer x = 5
integer y = 140
integer width = 2528
integer height = 1200
integer taborder = 10
string dataobject = "d_pie_graph"
boolean livescroll = true
end type

event doubleclicked;//double clicked event for datawindow

int 	li_series, li_datapoint
grobjecttype lgro_clickedtype
string ls_graphtype
int   li_graphtype
str_graphobjectatpoint lstr_graph

//test for pie or pie3d graph types
ls_graphtype = dw_1.Object.gr_1.graphtype
li_graphtype  = Integer(ls_graphtype)
If (li_graphtype <> 13) and (li_graphtype <> 17) Then Return

//If a valid series and department then open explode set window
//get the series and datapoint and object that was doublclicked and
//pass this information in the lstr_graph structure.  
lgro_clickedtype = dw_1.ObjectAtPointer("gr_1",li_series,li_datapoint)
If (li_series > 0 and li_datapoint>0) and &
	lgro_clickedtype = TypeData! Then
	lstr_graph.graphicobject = dw_1
	lstr_graph.series = li_series
	lstr_graph.datapoint = li_datapoint	
	OpenWithParm(w_graph_pie_explode,lstr_graph)
End If

end event


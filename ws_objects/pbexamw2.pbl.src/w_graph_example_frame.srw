$PBExportHeader$w_graph_example_frame.srw
$PBExportComments$This is the MDI frame for the set of graph examples
forward
global type w_graph_example_frame from w_center
end type
type mdi_1 from mdiclient within w_graph_example_frame
end type
type mditbb_1 from tabbedbar within w_graph_example_frame
end type
end forward

global type w_graph_example_frame from w_center
integer width = 2935
integer height = 2008
string title = "Graph Examples"
string menuname = "m_graph"
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 268435456
boolean tabbedview = true
event ue_postopen pbm_custom01
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_graph_example_frame w_graph_example_frame

on ue_postopen;
this.SetMicroHelp("Opening Graph Sheets....")

//turn the redraw off so you don't see each sheet get opened
this.SetRedraw(false)

// Open all graph example sheets initially 

//OpenSheet (w_employee_graph_sheet_dw ,this, 4,layered!)
//OpenSheet (w_employee_graph,this, 4,layered!)
//OpenSheet (w_employee_graph_list_sheet,this, 4,layered!)
//OpenSheet (w_customer_graph,this, 4,layered!)
//OpenSheet (w_customer_graph_list_sheet,this, 4,layered!)
//

//must turn redraw back on.
this.SetRedraw(True)

this.SetMicroHelp("Ready")
end on

on open;//Do not display the toolbar for the frame
this.toolbarvisible = false

//open sheets in post open event to allow frame to pop up quicker
this.postevent("ue_postopen")

end on

on close;// Close (parent) in the menu (or toolbar) will close the frame.
Show (w_main)
end on

on w_graph_example_frame.create
int iCurrent
call super::create
if this.MenuName = "m_graph" then this.MenuID = create m_graph
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_graph_example_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

type mdi_1 from mdiclient within w_graph_example_frame
long BackColor=268435456
end type

type mditbb_1 from tabbedbar within w_graph_example_frame
int X=0
int Y=0
int Width=0
int Height=104
end type


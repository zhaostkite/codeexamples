$PBExportHeader$w_mdi_main.srw
$PBExportComments$MDI:  Frame window
forward
global type w_mdi_main from w_center
end type
type mdi_1 from mdiclient within w_mdi_main
end type
type mditbb_1 from tabbedbar within w_mdi_main
end type
end forward

global type w_mdi_main from w_center
integer width = 2930
integer height = 2076
string title = "Department Reports"
string menuname = "m_mdiframe"
windowtype windowtype = mdihelp!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
boolean tabbedview = true
event ue_postopen pbm_custom01
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_mdi_main w_mdi_main

type variables
// Variables used to communicate between instances
// of sheets
//int dept
//string dept_name
end variables

on ue_postopen;OpenSheet(w_drag_a_dept  , this, 2, original!)

end on

on open;// Open script for w_mdi_main

This.PostEvent("ue_postopen")

end on

on w_mdi_main.create
int iCurrent
call super::create
if this.MenuName = "m_mdiframe" then this.MenuID = create m_mdiframe
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_mdi_main.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

on close;// Close script for w_mdi_main

this.Hide( )
w_main.Show( )

end on

type mdi_1 from mdiclient within w_mdi_main
long BackColor=273241183
end type

type mditbb_1 from tabbedbar within w_mdi_main
int X=0
int Y=0
int Width=0
int Height=104
end type


$PBExportHeader$w_ole_example_frame.srw
$PBExportComments$Frame for w_ole_example
forward
global type w_ole_example_frame from w_center
end type
type mdi_1 from mdiclient within w_ole_example_frame
end type
type mditbb_1 from tabbedbar within w_ole_example_frame
end type
end forward

global type w_ole_example_frame from w_center
integer width = 2921
integer height = 1920
string title = "OLE 2.0 Examples"
string menuname = "m_ole_frame"
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 268435456
boolean tabbedview = true
event ue_postopen pbm_custom01
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_ole_example_frame w_ole_example_frame

event ue_postopen;w_ole_example win_temp

SetPointer(HourGlass!)
OpenSheet(win_temp,"w_ole_example",this,0,layered!)

end event

on w_ole_example_frame.create
int iCurrent
call super::create
if this.MenuName = "m_ole_frame" then this.MenuID = create m_ole_frame
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_ole_example_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

on open;This.PostEvent("ue_postopen")

end on

on close;show(w_main)
end on

type mdi_1 from mdiclient within w_ole_example_frame
long BackColor=268435456
end type

type mditbb_1 from tabbedbar within w_ole_example_frame
int X=0
int Y=0
int Width=0
int Height=104
end type


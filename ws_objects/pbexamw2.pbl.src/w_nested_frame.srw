$PBExportHeader$w_nested_frame.srw
$PBExportComments$Frame window for Nested Reports example.
forward
global type w_nested_frame from w_center
end type
type mdi_1 from mdiclient within w_nested_frame
end type
type mditbb_1 from tabbedbar within w_nested_frame
end type
end forward

global type w_nested_frame from w_center
integer x = 9
integer y = 8
integer width = 2898
integer height = 1908
string title = "Nested Reports"
string menuname = "m_nest_frame"
windowtype windowtype = mdihelp!
long backcolor = 273241183
toolbaralignment toolbaralignment = alignatleft!
boolean tabbedview = true
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_nested_frame w_nested_frame

on close;w_main.Show()
end on

on w_nested_frame.create
int iCurrent
call super::create
if this.MenuName = "m_nest_frame" then this.MenuID = create m_nest_frame
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_nested_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

type mdi_1 from mdiclient within w_nested_frame
long BackColor=273241183
end type

type mditbb_1 from tabbedbar within w_nested_frame
int X=0
int Y=0
int Width=0
int Height=104
end type


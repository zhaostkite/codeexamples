$PBExportHeader$w_dynsql_frame.srw
$PBExportComments$MDI Frame Window for Dynamic SQL example
forward
global type w_dynsql_frame from w_center
end type
type mdi_1 from mdiclient within w_dynsql_frame
end type
type mditbb_1 from tabbedbar within w_dynsql_frame
end type
end forward

global type w_dynsql_frame from w_center
integer x = 9
integer y = 16
integer width = 2898
integer height = 1900
string title = "Dynamic SQL: 4 Formats"
string menuname = "m_dynsql_frame"
windowtype windowtype = mdihelp!
long backcolor = 273241183
toolbaralignment toolbaralignment = alignatleft!
boolean tabbedview = true
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_dynsql_frame w_dynsql_frame

on close;w_main.Show()
end on

on w_dynsql_frame.create
int iCurrent
call super::create
if this.MenuName = "m_dynsql_frame" then this.MenuID = create m_dynsql_frame
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_dynsql_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

type mdi_1 from mdiclient within w_dynsql_frame
long BackColor=273241183
end type

type mditbb_1 from tabbedbar within w_dynsql_frame
int X=0
int Y=0
int Width=0
int Height=104
end type


$PBExportHeader$w_mdi_first_next.srw
$PBExportComments$Frame for m_mdi_first_next menu
forward
global type w_mdi_first_next from w_center
end type
type mdi_1 from mdiclient within w_mdi_first_next
end type
type mditbb_1 from tabbedbar within w_mdi_first_next
end type
end forward

global type w_mdi_first_next from w_center
integer width = 2930
integer height = 2076
string title = "GetFirstSheet and GetNextSheet Functions"
string menuname = "m_mdi_first_next"
windowtype windowtype = mdihelp!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
boolean tabbedview = true
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_mdi_first_next w_mdi_first_next

type variables
// Variables used to communicate between instances
// of sheets
//int dept
//string dept_name
end variables

on close;// Close script for w_mdi_main


w_main.Show( )

end on

on w_mdi_first_next.create
int iCurrent
call super::create
if this.MenuName = "m_mdi_first_next" then this.MenuID = create m_mdi_first_next
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_mdi_first_next.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

type mdi_1 from mdiclient within w_mdi_first_next
long BackColor=273241183
end type

type mditbb_1 from tabbedbar within w_mdi_first_next
int X=0
int Y=0
int Width=0
int Height=104
end type


$PBExportHeader$w_mdi_quick_select.srw
$PBExportComments$MDI Frame used for Quick Select Example
forward
global type w_mdi_quick_select from w_center
end type
type mdi_1 from mdiclient within w_mdi_quick_select
end type
type mditbb_1 from tabbedbar within w_mdi_quick_select
end type
end forward

global type w_mdi_quick_select from w_center
integer width = 2930
integer height = 2076
string title = "Runtime DataWindow Painter"
string menuname = "m_quick_select"
windowtype windowtype = mdihelp!
long backcolor = 273241183
toolbaralignment toolbaralignment = alignatleft!
boolean tabbedview = true
event ue_postopen pbm_custom01
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_mdi_quick_select w_mdi_quick_select

type variables
// Variables used to communicate between instances
// of sheets
int dept
string dept_name
end variables

on ue_postopen;//Window w_quick_select is open explicitly to demonstrate that only one
//instance of this window should be opened at any given time
Open(w_quick_select, this)
end on

on open;This.PostEvent("ue_postopen")

end on

on close;
w_main.Show( )

end on

on w_mdi_quick_select.create
int iCurrent
call super::create
if this.MenuName = "m_quick_select" then this.MenuID = create m_quick_select
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_mdi_quick_select.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

type mdi_1 from mdiclient within w_mdi_quick_select
long BackColor=16777215
end type

type mditbb_1 from tabbedbar within w_mdi_quick_select
int X=0
int Y=0
int Width=0
int Height=104
end type


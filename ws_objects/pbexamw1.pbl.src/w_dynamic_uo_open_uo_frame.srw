$PBExportHeader$w_dynamic_uo_open_uo_frame.srw
$PBExportComments$MDI Frame window. Used in the Dynamic User Object Example
forward
global type w_dynamic_uo_open_uo_frame from w_center
end type
type mdi_1 from mdiclient within w_dynamic_uo_open_uo_frame
end type
type mditbb_1 from tabbedbar within w_dynamic_uo_open_uo_frame
end type
end forward

global type w_dynamic_uo_open_uo_frame from w_center
integer x = 32
integer y = 36
integer width = 2857
integer height = 1836
string title = "Dynamic User Objects"
string menuname = "m_dynamic_uo_open_udo"
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 273241183
toolbaralignment toolbaralignment = alignatleft!
boolean tabbedview = true
event ue_postopen pbm_custom01
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_dynamic_uo_open_uo_frame w_dynamic_uo_open_uo_frame

type variables

end variables

event ue_postopen;w_dynamic_uo_work_area w_sheet

OpenSheet(w_sheet,this,0, ORIGINAL!)

end event

event open;call super::open;sqlca.AutoCommit = True

toolbarvisible = false

This.PostEvent("ue_postopen")

end event

on w_dynamic_uo_open_uo_frame.create
int iCurrent
call super::create
if this.MenuName = "m_dynamic_uo_open_udo" then this.MenuID = create m_dynamic_uo_open_udo
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_dynamic_uo_open_uo_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

event close;sqlca.AutoCommit = False

w_main.show()
end event

type mdi_1 from mdiclient within w_dynamic_uo_open_uo_frame
long BackColor=12632256
end type

type mditbb_1 from tabbedbar within w_dynamic_uo_open_uo_frame
int X=0
int Y=0
int Width=0
int Height=104
end type


$PBExportHeader$w_frame_menu_functions.srw
$PBExportComments$Frame window for w_menu_functions (Menu Techniques example)
forward
global type w_frame_menu_functions from w_center
end type
type mdi_1 from mdiclient within w_frame_menu_functions
end type
type mditbb_1 from tabbedbar within w_frame_menu_functions
end type
end forward

global type w_frame_menu_functions from w_center
integer x = 201
integer y = 224
integer width = 2514
integer height = 1436
string title = "MenuItem Attributes Example"
string menuname = "m_frame_menu_functions"
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 273241183
toolbaralignment toolbaralignment = alignatleft!
boolean tabbedview = true
event ue_open pbm_custom01
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_frame_menu_functions w_frame_menu_functions

on ue_open;this.SetRedraw (false)
OpenSheet (w_menu_functions, this, 99, original!)
this.SetRedraw (true)

end on

on close;w_main.Show()
end on

on open;this.PostEvent ('ue_open')
end on

on w_frame_menu_functions.create
int iCurrent
call super::create
if this.MenuName = "m_frame_menu_functions" then this.MenuID = create m_frame_menu_functions
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_frame_menu_functions.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

type mdi_1 from mdiclient within w_frame_menu_functions
long BackColor=273241183
end type

type mditbb_1 from tabbedbar within w_frame_menu_functions
int X=0
int Y=0
int Width=0
int Height=104
end type


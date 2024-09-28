$PBExportHeader$w_toolbar_func.srw
$PBExportComments$Frame window to test new toolbar functionality
forward
global type w_toolbar_func from w_center
end type
type mdi_1 from mdiclient within w_toolbar_func
end type
type mditbb_1 from tabbedbar within w_toolbar_func
end type
end forward

global type w_toolbar_func from w_center
integer y = 4
integer width = 2025
integer height = 1332
string title = "Toolbar Functionality Test"
string menuname = "m_toolbar_func_frame"
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 273241183
boolean tabbedview = true
event ue_opensheet ( )
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_toolbar_func w_toolbar_func

type variables
Integer	ii_SheetNum = 0
end variables

event ue_opensheet;w_toolbar_func_sheet	lw_Sheet

ii_SheetNum ++
OpenSheetWithParm(lw_Sheet, This, This, 1, Cascaded!)


end event

on w_toolbar_func.create
int iCurrent
call super::create
if this.MenuName = "m_toolbar_func_frame" then this.MenuID = create m_toolbar_func_frame
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_toolbar_func.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

event open;call super::open;m_toolbar_func	lm_Menu

// Set toolbar positions from the registry or ini file
f_get_toolbar_profile(This, 1)

// Set the instance varialbe in the menu that points to the application frame
lm_Menu = This.MenuID
lm_Menu.iw_Frame = This

end event

event closequery;//w_toolbar_func_sheet	lw_Sheet

If MessageBox("Toolbar Functionality Test", "Do you want to save the frame toolbar settings before exiting?", &
						Question!, YesNo!, 1) = 2 Then Return

f_save_toolbar_profile(This)

end event

event close;Show(w_main)

end event

type mdi_1 from mdiclient within w_toolbar_func
long BackColor=273241183
end type

type mditbb_1 from tabbedbar within w_toolbar_func
int X=0
int Y=0
int Width=0
int Height=104
end type


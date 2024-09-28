$PBExportHeader$w_tag_help_frame.srw
$PBExportComments$MDI Frame window for Context-Sensitive MicroHelp example.
forward
global type w_tag_help_frame from w_center
end type
type mdi_1 from mdiclient within w_tag_help_frame
end type
type mditbb_1 from tabbedbar within w_tag_help_frame
end type
end forward

global type w_tag_help_frame from w_center
integer x = 46
integer y = 8
integer width = 2830
integer height = 1900
string title = "Context-Sensitive MicroHelp"
string menuname = "m_tag_help_frame"
windowtype windowtype = mdihelp!
long backcolor = 268435456
boolean tabbedview = true
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_tag_help_frame w_tag_help_frame

on close;w_main.Show()
end on

on w_tag_help_frame.create
int iCurrent
call super::create
if this.MenuName = "m_tag_help_frame" then this.MenuID = create m_tag_help_frame
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_tag_help_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

type mdi_1 from mdiclient within w_tag_help_frame
long BackColor=268435456
end type

type mditbb_1 from tabbedbar within w_tag_help_frame
int X=0
int Y=0
int Width=0
int Height=104
end type

